# Sammlung von Taskfiles für verschiedene Build- und Deployment-Aufgaben.
Da sich die Projekte Investment, Bank und BKK an einen einheitliche Struktur halten, 
können die Taskfiles hier zentral verwaltet werden.

Das verwendete Tool ist [Task](https://taskfile.dev/), und kann mit den üblichen 
Package Managern installiert werden:

```bash
brew install go-task/tap/task
```

Die Taskfiles sind so konfiguriert, dass sie in der Regel ohne weitere Anpassungen
funktionieren. Sie können jedoch an die spezifischen Anforderungen Ihres Projekts angepasst werden.

Das Bauen von Images erfordert eine lokale build.env Datei, die die Umgebungsvariablen für den Build-Prozess definiert.
Die Datei sollte im Root-Verzeichnis des Projekts liegen und die folgenden Variablen enthalten:

Zum Beispiel für die Investmentanlage:
```env
BACKEND_IMAGE_NAME=investmentanlage/vp-digital-investment-backend
FRONTEND_IMAGE_NAME=investmentanlage/vp-digital-investment-frontend
```

# Installation und Verwendung
Da Taskfiles auch in Parent Directories erkannt werden, können sie direkt aus dem User Home oder einem übergeordneten Verzeichnis verwendet werden.

Das hier verfügbare setup.sh ist so konfiguriert, dass es die Taskfiles in ein Verzeichnis lädt und dann symbolische Links
in das User Home Verzeichnis anlegt. Dadurch können die Taskfiles von überall im System aufgerufen werden.

```bash
bash setup.sh
```

# Taskfile Übersicht
task: Available tasks for this project:
* az-login:
* build-all-images:
* build-backend:
* build-backend-image:
* build-frontend:
* build-frontend-image:
* clean:
* clean-backend:
* clean-frontend:
* clean-rebuild-restart:
* clean-rebuild-restart-backend:
* clean-rebuild-restart-frontend:
* colima-start:
* colima-stop:
* docker-log *:
* down-all:
* down-backend:
* down-frontend:
* git-commit:                                 (aliases: gitc)
* git-worktree *:
* git-worktree-done:
* git-worktree-new-feature *:
* init-backend:
* init-frontend:
* install-gh-cli:
* install-tilt:
* install-tilt-macos:
* install-tilt-windows:
* pw-init *:
* pw-test * *:
* restart-backend:
* restart-frontend:
* show-open-prs:                              (aliases: soprs)
* show-open-prs-*:
* tilt-up:
* up-all:                                     (aliases: ua)
* up-backend:
* up-frontend:
* view-pr-*:
* view-prs:    

