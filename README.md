## Project Overview: Azure Docker Lab
Containarized full stack microservices application deployed via bicep & ansible on Azure.

### Architecture
- **Infrastructure:** Azure VNet (with Subnet Delegation), Azure Load Balancer, and Managed PostgreSQL (Flexible Server).
- **Compute:** Multi-node RHEL 3 instances.
- **Configuration:** Ansible-automated Docker installation and container orchestration.
- **Application:** Docker Example Voting App (Python, Node.js, .NET, Redis, Postgres).

### Key Skills Demonstrated
- **IaC:** Modular Azure Bicep for reproducible infrastructure.
- **Config Management:** Idempotent Ansible playbooks with Dynamic Inventory.
- **Networking:** Private VNet integration for database security and Public Load Balancing for scale.
- **Security:** Secret management via Azure Key Vault and Ansible Vault.