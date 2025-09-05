# ArrComPlex Media Server Stack

This repository contains a comprehensive media server stack managed with Docker Compose. It includes various services for managing and streaming movies, TV shows, music, books, and audiobooks.

## Services Included

The following services are included in this Docker Compose setup:

| Service | Port | Description |
| :--- | :--- | :--- |
| [qBittorrent](https://www.qbittorrent.org/) | 8080 | A popular BitTorrent client. |
| [FlareSolverr](https://github.com/FlareSolverr/FlareSolverr) | 8191 | A proxy server to bypass Cloudflare protection. |
| [Prowlarr](https://prowlarr.com/) | 9696 | An indexer manager for various torrent sites. |
| [Sonarr](https://sonarr.tv/) | 8989 | TV show management and automation. |
| [Radarr](https://radarr.video/) | 7878 | Movie management and automation. |
| [Lidarr](https://lidarr.audio/) | 8686 | Music management and automation. |
| [Readarr](https://readarr.com/) | 8787 | Book and audiobook management and automation. |
| [Audiobookshelf](https://www.audiobookshelf.org/) | 13378 | A self-hosted server for audiobooks and podcasts. |
| [Overseerr](https://overseerr.dev/) | 5055 | A request management and media discovery tool. |

## Prerequisites

Before you begin, ensure you have the following installed:

*   [Docker](https://www.docker.com/get-started)
*   [Docker Compose](https://docs.docker.com/compose/install/)

## Getting Started

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/Dood345/ArrComPlex.git
    cd ArrComPlex
    ```

2.  **Create necessary directories:**
    The `docker-compose.yml` file uses volume mounts to persist data. You will need to create the directories on your host machine that are mapped in the `volumes` sections of the `docker-compose.yml`.

    For example, you will need to create the following directories:
    - `S:/Downloads`
    - `S:/My Videos/My Shows`
    - `S:/My Videos/My Movies`
    - `S:/My Music`
    - `S:/My Books`
    - `S:/My Books/Audiobooks`
    - `S:/My Books/Podcasts`

3.  **Start the services:**
    ```bash
    docker-compose up -d
    ```

## Usage

Once the services are running, you can access them in your web browser using the following URLs:

*   **qBittorrent:** `http://localhost:8080`
*   **FlareSolverr:** `http://localhost:8191`
*   **Prowlarr:** `http://localhost:9696`
*   **Sonarr:** `http://localhost:8989`
*   **Radarr:** `http://localhost:7878`
*   **Lidarr:** `http://localhost:8686`
*   **Readarr:** `http://localhost:8787`
*   **Audiobookshelf:** `http://localhost:13378`
*   **Overseerr:** `http://localhost:5055`

## Configuration

The configuration for each service is stored in the respective directory that is mounted as a volume. For example, the configuration for Sonarr is located in the `sonarr` directory.

You can modify the `docker-compose.yml` file to change the ports, volumes, and other settings for each service.

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.
