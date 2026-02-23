# WebApi.Configuration.Docker

Configuration d'une WebApi .NET dans Docker : scheduling de taches avec FluentScheduler, support multi-environnements (QA, prod) et scripts de build.

## Structure

| Fichier / Dossier | Role |
|-|-|
| `WebScheduler/Startup.cs` | Configuration de l'application |
| `WebScheduler/ScheduledTasks.cs` | Definition des taches planifiees |
| `WebScheduler/Program.cs` | Point d'entree |
| `Environnements/` | Fichiers de configuration par environnement (env.prod, env.qa) |
| `Scripts/` | Scripts de configuration et de demarrage (configure.sh, welcome.sh) |
| `Dockerfile` | Conteneurisation |
| `Tools/` | Utilitaires |

## Stack

[![Stack](https://skillicons.dev/icons?i=dotnet,docker,cs&theme=dark)](https://skillicons.dev)