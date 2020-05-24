# OGP-Installer
OGP is a game server control panel. It uses a web interface (PHP/MySQL) that controls an agent (Perl) running on the servers hosting your games. It is used to start/stop/monitor game server instances. More features like a config file editor are coming soon.

Panel & Agent Script Support:

| OS     | Version |   |
|--------|---------|---|
| Ubuntu | 16.04   | ✅ |
|        | 18.04   | ✅ |
|        | 20.04   | ✅ |
| Debian | 8       | ✅ |
|        | 9       | ✅ |
|        | 10      | ✅ |

### Panel Installation

    bash <(curl -s https://raw.githubusercontent.com/SanjaySRocks/OGP-Installer/master/ogp-panel-install.sh)

### Agent Installation 
	
    bash <(curl -s https://raw.githubusercontent.com/SanjaySRocks/OGP-Installer/master/ogp-agent-install.sh)
