# Raspberry Pi Hugo Hosting

This project provides a complete setup for hosting a Hugo static site on a Raspberry Pi. It includes all necessary configurations, scripts, and services to get your site up and running efficiently.

## Project Structure

```
raspberry-pi-hugo
├── hugo-site
│   ├── config.toml          # Configuration settings for the Hugo site
│   ├── content              # Directory for content files (Markdown)
│   ├── data                 # Directory for data files (JSON/YAML)
│   ├── layouts              # Layout templates for rendering content
│   ├── public               # Generated static files for deployment
│   ├── static               # Static assets (images, CSS, JS)
│   └── themes               # Themes for customizing site appearance
├── scripts
│   ├── deploy.sh            # Script to automate deployment
│   ├── setup.sh             # Script to set up environment and dependencies
│   └── backup.sh            # Script to create backups of site files
├── systemd
│   ├── hugo.service         # Systemd service for running the Hugo server
│   └── nginx.service        # Systemd service for running the Nginx server
├── config
│   └── nginx.conf           # Configuration for the Nginx web server
├── backup
│   └── backup.sh            # Duplicate backup script
├── optional
│   ├── ssl
│   │   └── dhparam.pem      # Diffie-Hellman parameters for SSL
│   └── renew-ssl.sh         # Script to renew SSL certificates
└── README.md                # Project documentation
```

## Setup Instructions

1. **Clone the Repository**: Clone this repository to your Raspberry Pi.
   
2. **Run Setup Script**: Navigate to the project directory and run the setup script to install necessary dependencies:
   ```bash
   cd raspberry-pi-hugo
   ./scripts/setup.sh
   ```

3. **Configure Nginx**: Edit the `config/nginx.conf` file to set up your server blocks and routing rules.

4. **Deploy the Site**: Use the deploy script to build and deploy your Hugo site:
   ```bash
   ./scripts/deploy.sh
   ```

5. **Enable Services**: Start and enable the Hugo and Nginx services to run on boot:
   ```bash
   sudo systemctl enable hugo.service
   sudo systemctl enable nginx.service
   ```

6. **Backup**: Regularly run the backup script to ensure your site files and configurations are safe:
   ```bash
   ./scripts/backup.sh
   ```

## Usage

After completing the setup, your Hugo site should be accessible via the Raspberry Pi's IP address. You can manage your content by adding Markdown files to the `hugo-site/content` directory and rebuilding the site using the deploy script.

## Additional Information

For SSL configuration, you can generate your own certificates or use the provided scripts in the `optional` directory to manage SSL certificates.

Feel free to contribute to this project by submitting issues or pull requests!