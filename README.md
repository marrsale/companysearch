Company Search is an example project done for interview purposes.

# CLIENT SPEC

1. User must be able to search for companies by name using the Companies House API.
2. User must be able to view individual search results for each company.
3. User must be able to see company officers when viewing an individual company.
4. User must be able to save a company to an addressbook for later reference.

# NOTES

The app was developed with a conspicuous lack of real TDD or tests besides smoke tests.  In order to stay nearer the suggested time scope, TDD was mostly foregone.  This is not particularly representative of the author's normal development style.  

The app is currently unstyled in order to focus on feature development.

Cleverer schemes for caching and API interaction can be envisioned but are not strictly within scope.

`spec/feature/company_search_spec.rb` is highly overmocked with the intent to test primarily integration and rendering.  Ideally the relevant custom classes would each be tested thoroughly, and fixtures or factories (incl. unpersisted models) would be used for the feature level spec.

Patterns emerged that could be refactored into a much more streamlined app with more time and effort -- for example, a `CompanyPresenter` class could be used to normalize the display between viewing the searched company before and after saving.  Additionally the API service objects could be heavily refactored and properly abstracted.

# TODO
- ~~User registration (Devise)~~
- ~~Companies in address book~~
- ~~Association of contacts to companies (CompanyContact)~~
- ~~Pagination on company search (Find API query params)~~
- Styling (drop in Bootstrap or UIKit)
- Rate limiting wrt API interaction
