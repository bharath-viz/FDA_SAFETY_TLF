if (!require("formatters")) install.packages("formatters")
if (!require("rtables")) install.packages("rtables")
if (!require("rlistings")) install.packages("rlistings")
if (!require("tern")) install.packages("tern")

if (!require("remotes")) install.packages("remotes")
remotes::install_github("pharmaverse/falcon")
if (!require("scda")) remotes::install_github("insightsengineering/scda@*release")
if (!require("scda.2022")) remotes::install_github("insightsengineering/scda.2022@*release")
