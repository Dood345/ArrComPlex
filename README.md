# ArrComPlex Media Server Stack

This repository contains a comprehensive, Windows-based media server stack managed with Docker Compose. It includes automated services for downloading and managing movies, TV shows, and high-quality music.

## Services Included

The following services are bundled in this Docker Compose setup:

| Service | Port | Description |
| --- | --- | --- |
| **[qBittorrent](https://www.qbittorrent.org/)** | 8080 | BitTorrent client for general media downloads. |
| **[FlareSolverr](https://github.com/FlareSolverr/FlareSolverr)** | 8191 | Proxy server to bypass Cloudflare protection for indexers. |
| **[Prowlarr](https://prowlarr.com/)** | 9696 | Indexer manager that syncs trackers to Sonarr, Radarr, and Lidarr. |
| **[Sonarr](https://sonarr.tv/)** | 8989 | TV show management and automation. |
| **[Radarr](https://radarr.video/)** | 7878 | Movie management and automation. |
| **[Lidarr](https://lidarr.audio/)** | 8686 | Music management and automation. |
| **[Slskd](https://github.com/slskd/slskd)** | 5030 | Headless Soulseek client for downloading rare/lossless music. |
| **[Soularr](https://github.com/mrusse/soularr)** | 6969 | Automation script that connects Lidarr to Slskd. |
| **[Audiobookshelf](https://www.audiobookshelf.org/)** | 13378 | Self-hosted server for streaming audiobooks and podcasts. |
| **[Seerr](https://seerr.dev/)** | 5055 | Request management and media discovery portal. |

> **Note on Books:** Book management is currently handled via manual gathering (e.g., using Anna's Archive). Audiobooks are served through Audiobookshelf.

## Prerequisites

Before deploying, ensure your Windows host has the following:

* [Docker Desktop for Windows](https://www.docker.com/products/docker-desktop)
* An active internet connection with appropriate port forwarding configured on your router for Slskd (Port `50300`) and qBittorrent (Port `6881`).

## Getting Started

1. **Clone the repository:**
```bash
git clone https://github.com/Dood345/ArrComPlex.git
cd ArrComPlex

```


2. **Create Host Directories:**
This stack maps container volumes directly to your Windows drives to preserve data and enable hardlinking. Ensure the following paths exist before starting the stack:
*Configuration Data (C: Drive)*
* `C:/Users/dood3/dockerComPlex/[service_name]` (for each service)


*Media & Downloads (S: Drive)*
* `S:/Downloads`
* `S:/My Videos/My Shows`
* `S:/My Videos/My Movies`
* `S:/My Music`
* `S:/My Books`


3. **Configure Soularr (Pre-flight requirement):**
Soularr requires a `config.ini` file to boot. Create it at `C:/Users/dood3/dockerComPlex/soularr/config.ini` and add your respective Lidarr and Slskd API keys.
4. **Start the stack:**
```bash
docker compose up -d

```



## Crucial Configuration: The Soularr / Lidarr Integration

This stack uses a highly specific volume configuration to allow Lidarr to automatically import music downloaded from the Soulseek network via Slskd.

**The "Magic Triangle" of Paths:**
To prevent "File Not Found" permission errors, the internal Docker download paths must be perfectly identical across three containers. In the `docker-compose.yaml`, ensure:

* **Lidarr** mounts: `- S:/Downloads:/downloads`
* **Slskd** mounts: `- S:/Downloads:/downloads`
* **Soularr** mounts: `- S:/Downloads:/downloads`

**Post-Installation Steps:**

1. Open the **Slskd UI** (`http://localhost:5030`), navigate to Options -> Directories, and change the download directory to `/downloads/music`.
2. Open your **Soularr `config.ini**`, and set the `download_dir` for both Lidarr and Slskd to `/downloads/music`.

This guarantees Slskd writes the files to `S:/Downloads/music`, and Soularr instructs Lidarr to retrieve them from that exact same translated path.

## Usage

Once running, access your web interfaces locally:

* **qBittorrent:** `http://localhost:8080`
* **Prowlarr:** `http://localhost:9696`
* **Sonarr:** `http://localhost:8989`
* **Radarr:** `http://localhost:7878`
* **Lidarr:** `http://localhost:8686`
* **Slskd:** `http://localhost:5030`
* **Audiobookshelf:** `http://localhost:13378`
* **Seerr:** `http://localhost:5055`

## License

This project is licensed under the MIT License - see the `LICENSE.md` file for details.