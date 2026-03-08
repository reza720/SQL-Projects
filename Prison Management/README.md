# Prison Management
- A system designed to store and manage data related to prison operations. It keeps records of prisoners, staff members, buildings, and cells. The system also tracks prisoner visits and release information.

## Tech Stack: 
- MySQL

## Data Model: 
- **Entities & Attributes (Constraints, Indexes):**
  
  - **Buildings:**
    - name (pk, digits + alpha only) 
    - number_of_floors (not null, positive)
    - number_of_cells (not null, positive)
    - prisoners_capacity (not null, derived from number_of_cells * 4)

  - **Cells:**
   - id (pk, auto)
   - building (not null, fk: Buildings.name)

  - **Staff:**
   - id (pk, auto)
   - full_name (not null, letters and spaces only)
   - role enum(guard, management, other), not null
   - status enum(active, inactive, on_break), not null
   - hire_date (not null)

  - **Prisoners:**
    - id (pk, auto)
    - full_name (not null, letters and spaces only, indexed)
    - charge_image_url (not null)
    - entrance_date (not null)
    - release_date (not null)
    - building (not null, fk: Buildings.name)
    - cell (not null, fk: Cells.id)

  - **Visits:**
    - id (pk, auto)
    - visitor (not null, letters and spaces only)
    - prisoner (not null, fk: Prisoners.id)
    - date (not null)

- **Relationships**


## Entity–Relationship Diagram: