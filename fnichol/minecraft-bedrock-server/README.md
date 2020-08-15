# Mincraft Bedrock Server

[Bedrock Dedicated Server] allows [Minecraft] players set up their own server or
host their server using a cloud-based service.

## TD;DR

```console
$ helm repo add fnichol https://fnichol.github.io/charts
$ helm install my-release fnichol/minecraft-bedrock-server
```

## Introduction

This chart sets up and launches a persistent [Minecraft][] [Bedrock Dedicated
Server][] on a [Kubernetes] cluster using the [Helm] package manager.

This chart builds on the amazing work of the
[itzg/docker-minecraft-bedrock-server] image.

## Prerequisites

- Kubernetes 1.15+
- Helm 3.0+

## Installing the Chart

To install the chart with the release name `my-release`:

```console
$ helm repo add fnichol https://fnichol.github.io/charts
$ helm install my-release fnichol/minecraft-bedrock-server
```

These commands deploy a bedrock server on the Kubernetes cluster in the default
configuration. The [Parameters][#parameters] section lists the parameters that
can be configured during the installation.

> **Tip**: List all releases using `helm list`

## Uninstall the Chart

To uninstall/delete the `my-release` helm release:

```console
$ helm uninstall my-release
```

The command removes all the Kubernetes components associated with the chart and
deletes the release.

## Parameters

The following tables lists the configurable parameters of the bedrock server
chart and their default values.

| Parameter                                | Description                                                                                                                                                                                      | Default                         |
| ---------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------- |
| `eula`                                   | To accept the EULA, set to `true`, which is required to use the Minecraft server. Alternatively, use the `config.EULA` parameter and set it to the uppercase string `TRUE`.                      | `false`                         |
| `config.EULA`                            | Alternative to setting `eula` to `true`. Set this value to the uppercase string `TRUE`.                                                                                                          | `nil`                           |
| `config.GAMEMODE`                        | Sets the game mode for new players (values: `survival`, `creative`, `adventure`)                                                                                                                 | `survival`                      |
| `config.DIFFICULTY`                      | Set the difficulty of the world (values: `peaceful`, `easy`, `normal`, `hard`)                                                                                                                   | `easy`                          |
| `config.DEFAULT_PLAYER_PERMISSION_LEVEL` | Permission level for new players joining for the first time (values: `visitor`, `member`, `operator`)                                                                                            | `member`                        |
| `config.LEVEL_TYPE`                      | Determines the type of map that is generated (values: `FLAT`, `LEGACY`, `DEFAULT`)                                                                                                               | `DEFAULT`                       |
| `config.ALLOW_CHEATS`                    | If `true`, then cheats like can be used                                                                                                                                                          | `false`                         |
| `config.MAX_PLAYERS`                     | The maximum number of players that can play on the server                                                                                                                                        | `10`                            |
| `config.PLAYER_IDLE_TIMEOUT`             | After a player has idled for this many minutes they get kicked                                                                                                                                   | `30`                            |
| `config.TEXTUREPACK_REQUIRED`            | Force clients to use texture packs in the current world                                                                                                                                          | `false`                         |
| `config.LEVEL_SEED`                      | Used to randomize the world                                                                                                                                                                      | `nil`                           |
| `config.ONLINE_MODE`                     | If `true` then all connected players must be authenticated to Xbox Live                                                                                                                          | `true`                          |
| `config.WHITE_LIST`                      | If `true` then all connected players must be listed in the seperate `whitelist.json` file                                                                                                        | `false`                         |
| `config.VIEW_DISTANCE`                   | The maximum allowed view distance in number of chunks                                                                                                                                            | `10`                            |
| `config.TICK_DISTANCE`                   | The world is ticked this many chunks away from any player (values `4`-`12`)                                                                                                                      | `4`                             |
| `config.MAX_THREADS`                     | Maximum number of threads the server tries to use. If set to `0` or removed then it uses as many as possible.                                                                                    | `8`                             |
| `config.LEVEL_NAME`                      | The "level-name" value is used as the world name and its folder name. The player may also copy their saved game folder here, and change the name to the same as that folder's to load it instead | `level`                         |
| `config.SERVER_NAME`                     | Used as the server name                                                                                                                                                                          | `Dedicated Server`              |
| `config.SERVER_PORT`                     | Which IPv4 port the server should listen to                                                                                                                                                      | `19132`                         |
| `storage`                                | Storage requirement for persistent volume claim                                                                                                                                                  | `"1Gi"`                         |
| `image.repository`                       | Minecraft Bedrock Server image name                                                                                                                                                              | `itzg/minecraft-bedrock-server` |
| `image.pullPolicy`                       | Image pull policy                                                                                                                                                                                | `Always`                        |
| `image.tag`                              | Minecraft Bedrock Server image tag                                                                                                                                                               | `latest`                        |
| `nameOverride`                           | String to partially override `minecraft-bedrock-server.fullname` template with a string (will prepend the release name)                                                                          | `""`                            |
| `fullnameOverride`                       | String to fully override `minecraft-bedrock-server.fullname` template with a string                                                                                                              | `""`                            |
| `podAnnotations`                         | Pod annotations                                                                                                                                                                                  | `{}`                            |
| `podSecurityContext`                     | Pod security context                                                                                                                                                                             | `{}`                            |
| `service.type`                           | Determines how the service is exposed (values: `ClusterIP`, `NodePort`, `LoadBalancer`)                                                                                                          | `NodePort`                      |
| `service.port`                           | The port number that will be exposed by this service                                                                                                                                             | `19132`                         |
| `service.ipFamily`                       | Specifies whether this Service has a preference for a particular IP family (e.g. `IPv4` vs. `IPv6`).                                                                                             | `IPv4`                          |
| `service.annotations`                    | If specified, service annotations                                                                                                                                                                | `{}`                            |
| `resources`                              | If specified, compute resources which are required by this container                                                                                                                             | `{}`                            |
| `nodeSelector`                           | If specified, a selector which must be true for the pod to fit on a node                                                                                                                         | `{}`                            |
| `tolerations`                            | If specified, the pod's tolerations                                                                                                                                                              | `[]`                            |
| `affinity`                               | If specified, the pod's scheduling constraints                                                                                                                                                   | `{}`                            |

Specify each parameter using the `--set key=value[,key=value]` argument to
`helm install`. For example:

```console
$ helm install my-release \
    --set eula=true \
    fnichol/minecraft-bedrock-server
```

The above command sets the `eula` to `true`.

Alternatively, a YAML file that specifies the values for the above parameters
can be provided while installing the chart. For example:

```console
$ helm install my-release -f values.yaml fnichol/minecraft-bedrock-server
```

> **Tip**: You can use the default [values.yaml](values.yaml)

[bedrock dedicated server]:
  https://minecraft.gamepedia.com/Bedrock_Dedicated_Server
[helm]: https://helm.sh/
[itzg/docker-minecraft-bedrock-server]:
  https://github.com/itzg/docker-minecraft-bedrock-server
[kubernetes]: http://kubernetes.io/
[minecraft]: https://www.minecraft.net
