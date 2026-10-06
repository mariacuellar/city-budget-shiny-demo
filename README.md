# City budget explorer

A minimal R Shiny demonstration for sharing an interactive app with a colleague or city official. **All data are fictional.**

Move a budget slider to update department allocations, see the chart and table, and download the scenario as a CSV. The five department shares stay fixed and sum to 100%.

## Run locally

Open this folder in RStudio. Run in the R console:

```r
install.packages("shiny") # Only needed once
shiny::runApp()
```

Or open `app.R` in RStudio and click **Run App**.

## Put the code on GitHub

Create a repository named `city-budget-shiny-demo` on GitHub. Upload `app.R`, `README.md`, and `.gitignore` from this folder. This folder contains only the demo; do not upload its parent directory.

GitHub stores the source code. GitHub Pages cannot run this R Shiny app because it needs an R server.

## Publish the working app on shinyapps.io

1. Sign in to [shinyapps.io](https://www.shinyapps.io/).
2. In RStudio, install the deployment package with `install.packages("rsconnect")`.
3. Follow the account's setup instructions to run its `rsconnect::setAccountInfo(...)` command in your R console. Keep tokens and secrets out of source files and GitHub.
4. With this folder as the working directory, run:

```r
rsconnect::deployApp(
  appDir = ".",
  appFiles = "app.R",
  appName = "city-budget-shiny-demo",
  appTitle = "City budget explorer"
)
```

5. Open the URL returned by deployment and send that working-app link to your colleague. Viewers do not need R or RStudio.

After changing the app, update the GitHub code and run `deployApp()` again to update the hosted app. A GitHub commit alone does not update this shinyapps.io deployment.

See [Posit's deployment guide](https://docs.posit.co/shinyapps.io/guide/getting_started/) for account setup and publishing details. Hosting usage is subject to the account's plan limits.
