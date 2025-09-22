#!/bin/bash

# make sure we are within an actual git rpo
if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "👍🏻 Well done. You're inside a Git repository."
else
  echo "Not a Git repository."
  exit 0
fi

# Ensure a branch/commit is provided as an argument
if [ -z "$1" ]; then
  echo "Usage: $0 <base-branch-or-commit>"
  exit 1
fi
lang="$2"
# Deutsch oder Englisch
if [ -z "$2" ]; then
  lang="Deutsch"
fi

# Ensure GEMINI_API_KEY is set
if [ -z "$GEMINI_API_KEY" ]; then
  echo "Error: GEMINI_API_KEY environment variable is not set."
  exit 1
fi

# get git branch you are currently working on
branch_name=$(git rev-parse --abbrev-ref HEAD)
ticket=$(echo ${branch_name} | grep -oE 'WEBVP-[0-9]+')

# Fetch latest changes and get the diff
# Use -s for fetch to suppress progress output, exit on error
echo "Fetching from origin..."
git fetch origin || {
  echo "git fetch failed"
  exit 1
}

echo "Calculating diff between origin/$1 and HEAD..."
# Use git diff --exit-code to handle cases with no diffs gracefully, but capture output
# Store diff output, handle potential errors
if ! diffpatch=$(git diff --patch "origin/${1}...HEAD"); then
  # Check the exit code. 0 means no diffs, 1 means diffs, >1 means error
  if [ $? -gt 1 ]; then
    echo "git diff command failed with error code $?."
    exit 1
  elif [ -z "$diffpatch" ]; then
    # Exit code was 0 or 1, but output is empty (shouldn't happen often with exit code 1)
    # Or explicitly check exit code 0 if needed: `if [ $? -eq 0 ]; then`
    echo "No differences found between origin/${1} and HEAD."
    # Decide what to do - maybe exit? Or create an empty prtext.json?
    # For now, let's create a file indicating no diff
    echo '{"note": "No differences found."}' >prtext.json
    echo "Created prtext.json indicating no diffs."
    exit 0 # Exit successfully
  fi
  # If exit code was 1, diffpatch contains the differences, proceed normally
fi

echo "Generating JSON payload..."
# Use jq to construct the JSON safely.
# -n: Don't read input, create JSON from scratch.
# --arg var value: Pass shell variable 'value' as a JSON string 'var' in jq, handling escaping.
json_payload=$(jq -n --arg diff_text "$diffpatch" --arg lang "$lang" '
{
  "contents": [{
    "parts":[
      {"text": "Du bist ein erfahrener Kotlin und Typescript Entwickler"},
      {"text": "Für das folgende GIT Patch möchtest Du eine verständliche PR Beschreibung für Github in "},
      {"text": $lang },
      {"text": " erstellen." },
      {"text": "Dafür verwendest Du die folgende Struktur: "},
      {"text": "Beschreibung: Hier sollte ein erster Überblick über die Hauptanpassung stehen"},
      {"text": "Motivation: Warum war bzw. ist die Anpassung notwendig."},
      {"text": "Was wurde geändert: Hier, wenn sinnvoll die angepassten Dateien erwähnen und die Anpassung erläutern."},
      {"text": "Tests: Wurden Tests neu geschrieben, bestehende angepasst oder keines davon."},
      {"text": "Ist kein Test erkennbar, sollte im PR Text eine edeutliche Warnung enthalten sein."},
      {"text": "Bitte schicke wirklich nur den Text für den PR, damit das Ergebnis direkt kopiert werden kann"},
      {"text": $diff_text }
    ]
  }]
}')

# Check if jq failed
if [ $? -ne 0 ]; then
  echo "Error creating JSON payload with jq."
  exit 1
fi

echo "Sending request to Gemini API..."
# Use the generated JSON payload with curl
# Add --fail to make curl exit with an error if the HTTP request fails (e.g., 4xx, 5xx)
# Add -sS to silence progress but show errors
curl --fail -sS "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=${GEMINI_API_KEY}" \
  -H 'Content-Type: application/json' \
  -X POST \
  -d "$json_payload" >prtext.json

# Check if curl failed
if [ $? -ne 0 ]; then
  echo "Error during curl request to Gemini API. Check API key, network, and response."
  # Optional: Display the first few lines of prtext.json if it contains an error message from the API
  # head -n 5 prtext.json
  exit 1
fi

echo "Successfully generated prtext.json"
cat prtext.json | yq '.candidates[0].content.parts[0].text' >prtext.txt
vim prtext.txt
gum confirm
exit_code=$?

if [ $exit_code -eq 0 ]; then
  gh pr create -w -B "${1}" -t "${ticket}" --body-file "./prtext.txt"
elif [ $exit_code -eq 1 ]; then
  echo "Ok. Also keinen PR erstellen"
fi
cat prtext.txt | pbcopy
rm prtext*
