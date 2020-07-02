# House Salad Base

This repo is used as a base for the Consuming API lesson taught in Backend Module 3. To complete the lesson you will need to sign-up for an API key from the [ProPublica Congress API](https://projects.propublica.org/api-docs/congress-api/).

### Versions

Rails 5.1.7
Ruby 2.5.3

### Setup

```bash
git clone https://github.com/turingschool-examples/house-salad-base house-salad

cd house-salad

rails db:{create,migrate}
```

### Exercise

Write a test and complete this user story

*NOTE: Please use the existing form in the application.*

```
As a user
When I visit "/"
And I select "Colorado" from the dropdown
And I click on "Locate Members of the House"
Then my path should be "/search" with "state=CO" in the parameters
And I should see a message "7 Results"
And I should see a list of the 7 members of the house for Colorado
And I should see a name, role, party, and district for each member
```

### Notes on Refactor

For the most part, I followed the lesson pretty closely. However, a couple things to note:

- First, it occurred to me that the `Member` object doesn't inherit from any rails classes, and is basically a poro that is formatted as a rails resouce object, but the `SearchResults` object is separated into it's own poro folder, which makes sense considering it has a very different format. Nothing too complicated here, just something that I found interesting.

- The `PropublicaService` object is formatted in a pretty logical fashion, however, I think that in an application with multiple api calls (like brownfield), and therefore multiple services, the code ends up being not very DRY. As such, I think that it would be helpful to have a `BaseService` class, that handles `conn` and `get_json` in an abstract way. Each service could then utilize these methods to expose the api calls that are useful to the services.
