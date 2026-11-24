# Flexible Inventory

An inventory system design for different types of organizations that handle diverse types of items with different characteristics without forcing every item into a fixed set of fields.

* **Author:** Randy Agüero Bermúdez. B.S. in Computer Science, University of Costa Rica

## Origin & Motivation

When I was at university, I worked on ThemePark, a prototype of a virtual campus project. The project was divided among multiple teams. I was part of one four-student team responsible for building the "Learning Component" module. Early in development, we ran into a core issue: we had to duplicate the same code for each learning component, such as projector, artificial intelligence, whiteboard and interactive screen.

Because of this bad design, the work became much harder. The module was not scalable or easy to maintain and it barely worked at all, especially when only two of the four students finished the project.

I knew the design had problems from the start. However, because of lack of time and poor communication in the group, my teammate and I never got the chance to refactor it.

Now I am coming back to this problem to solve that same issue in a different context: an inventory system. Thinking about that software engineering problem, I should have made a more flexible way to support different item types without hardcoding them in the backend, while still letting users create custom items when needed.


In an inventory system, using a rigid design brings real problems as more items are added:

  - **Hardcoded item types and rigid schemas:** Adding a new kind of item often means changing backend code, database tables, or forms, which makes changes slow and messy.

- **Extra or missing fields:** If all items share the same fields, some items end up with empty fields they don't need, while other items miss important details.

- **Inconsistent data entry:** When people type details freely or follow loose rules, typos, different formats, and missing data make searching and filtering unreliable.

## The Solution

In Flexible Inventory, I'm testing a data-driven way to handle different item types without repeating code or relying on rigid tables:

- **Category-based attribute modeling:** Group items by category and connect each category only with the attributes it needs—like data types, required fields, and allowed options—instead of hardcoding item types.

- **Structured and consistent records:** Use typed attributes, validation constraints, and selectable options to keep item data consistent, complete, and easier to query reliably.

- **Extensible structure:** Design the model so adding new item types or attributes builds on existing structures instead of forcing repetitive code changes across layers.

## Project Status

Right now it's in early development. I'm starting with the basic setup and main workflows to get a working version step by step.
