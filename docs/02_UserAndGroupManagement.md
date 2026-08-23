# User and Group Management

## Objective

My goal was to establish the initial identity and access management structure for the homelab by creating departmental groups, different user accounts, their corresponding directories and validating permmisions through testing.

---

## Tasks Completed

### Department Groups

Created Linux groups representing the departments that currently require access to server resources:

* `developers`
* `hr`
* `shared`

An engineering group was created during testing and later removed after i decided it had the same purpose as the developers group.

### User Provisioning

I created several "employee" accounts to simulate a multiuser environment. corresponding permmisions were assigned according to each employee's role, and i configured passwords to enable testing from non administrative accounts.

Administrative tasks were done using `sudo` rather than granting additional privileged group membership.

### Company Directory Structure

Created a centralized company workspace:

```text
/home/company
├── developers
├── hr
└── shared
```

Each department received its own directory for team resources, while a shared directory was prepared for collaboration across departments.

### Ownership and Permissions

Configured ownership and group assignments for each departmental directory.

Standard Unix permissions were applied so that:

* Members of a department can access and modify their own directory.
* Users outside the department are denied access.
* The shared directory uses a dedicated `shared` group for collaborative access.

The shared directory was configured with the setgid bit so newly created files inherit the shared group automatically.

### Validation

Permissions were verified by switching to different user accounts and testing real access rather than assuming the configuration was correct.

Validation confirmed that:

* Developers could access and modify files within the developers directory.
* HR users could access only HR resources.
* Users were prevented from entering directories belonging to other departments.
* Members of the shared group could access the shared directory after the group ownership was corrected.

---

## Outcome

The server now contains a functional multi-user environment with department-based access controls. Instead of a single administrative account owning all resources, permissions are now managed through Linux groups, providing a more realistic representation of how access is delegated on production systems.

This milestone marks the transition from initial server deployment toward routine Linux systems administration.

---

## Commands used

* `group* commands` 
* `user* commands` 
* `passwd`
* `mkdir`
* `mv`
* `chown`
* `chmod`
* `su`
* Standard Unix file ownership and permission model
* Setgid directories
* Manual permission validation using multiple user accounts

---

## Lessons Learned

* Group based permissions are significantly more scalable than assigning permissions to individual users.
* Administrative privileges should be delegated through `sudo` instead of adding users to privileged groups to keep the enviroment as secure as possible.
* Permission changes should always be verified by logging in as the affected user rather than testing only as an administrator to ensure everything is in order.
* A dedicated shared group provides a cleaner solution for collaborative directories than relying on broad permissions.
