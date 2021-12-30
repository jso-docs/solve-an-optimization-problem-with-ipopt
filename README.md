# Template for JSO tutorials, guides, or whatever extra external pages

For efficiency reasons, we split the JSO tutorials into different repositories.
Clone this template to use it for a new tutorial.

## Running locally - Development guide

This website uses the structure of the root website under it to avoid duplicating updates to the css and layout.
Here are the steps to run this locally:

- Run `bash getdeps.sh` to clone what is needed.
- Install `npm`
- Run `npm install`
- Run `npm run css-build`
- Open julia, activate and instantiate the environment.
  ```
  julia> # press ]
  pkg> activate .
  (...) pkg> instantiate
  ```
- Use `Franklin` and `serve`
  ```
  pkg> # press backspace
  julia> using Franklin
  julia> serve()
  ```
- Go to https://localhost:8000 to check that everything is running
- Edit `index.md` and `index.jl` as needed.
- - If you `pkg> add` any package, add a `[compat]` upper bound.

## Publishing

- Make sure that dependencies have upper bounds in the `[compat]` section of `Project.toml`.
- Push to GitHub inside the jso-docs organization.
- Enable building github pages on the settings.
- Check that it went well.
- Create a PR to https://github.com/jso-docs/jso-docs.github.io adding your tutorial to `_data/docs.json`.