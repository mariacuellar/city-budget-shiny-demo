# City budget explorer

A simple R Shiny app with a budget slider, chart, table, and CSV download. All data are fictional.

## Run locally

Open app.R in RStudio and click Run App, or run `shiny::runApp()` with this folder as the working directory. Install Shiny first if needed: `install.packages("shiny")`.

## Publish on Posit Connect Cloud

GitHub holds the code; Connect Cloud runs the app and provides the link to share.

1. Commit and push app.R, manifest.json, README.md, and .gitignore to your city-budget-shiny-demo GitHub repository.
2. Sign in at https://connect.posit.cloud/ and choose Publish, then Shiny.
3. Select the city-budget-shiny-demo repository and the branch containing these files.
4. Select app.R as the primary file and publish.
5. Open the resulting app URL and share it with your colleague.

For a public demo, use public visibility. Hosting and repository access depend on your Connect Cloud plan.

## Update the app

After changing code or dependencies, regenerate the manifest from this folder:

```r
rsconnect::writeManifest(appDir = ".", appFiles = "app.R", appPrimaryDoc = "app.R")
```

Commit and push the changes, then republish in Connect Cloud. The manifest records the R version and required packages; it is generated from your installed R environment.

Keep account tokens and secrets out of GitHub. Local rsconnect deployment records are ignored.

Official guide: https://docs.posit.co/connect-cloud/how-to/r/shiny-r.html
