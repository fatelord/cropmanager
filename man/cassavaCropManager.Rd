% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cassavaCropManager.R
\name{cassavaCropManager}
\alias{cassavaCropManager}
\title{SHORT DEF:   Wrapper function to calculate recommendations across all use cases.
RETURNS:     Vector of with recommendation texts to display.
DESCRIPTION: Function with all inputs required by the DST app, and calling use case-specific wrapper functions to calculated recommendations on IC, FR, PP and SP.
            This function also calls on functions to send recommendation reports by SMS and/or email.
INPUT:}
\usage{
cassavaCropManager(country = c("NG", "TZ"), lat, lon, area,
  areaUnits = c("acre", "ha", "m2"), IC = c(TRUE, FALSE),
  intercrop = c(NA, "maize", "sweetpotato"), FR = c(NA, TRUE, FALSE),
  PP = c(NA, TRUE, FALSE), SPP = c(NA, TRUE, FALSE), SPH = c(NA,
  TRUE, FALSE), PD, HD, tractor = c(NA, TRUE, FALSE),
  implement = c("plough", "harrow", "ridger"), herbicide = c(NA, TRUE,
  FALSE), nTill1 = c(NA, 0, 1, 2), nHarrow = c(NA, 0, 1, 2),
  ridges = c(NA, TRUE, FALSE), weedMethod = c("manual", "herbicide"),
  costLMO = expand.grid(operation = c("plough1", "plough2", "harrowing",
  "ridging"), tractor = c(TRUE, FALSE), cost = NA),
  costWCO = expand.grid(operation = c("clearing", "weeding1",
  "weeding2"), herbicide = c(TRUE, FALSE), cost = NA), FCY = NA,
  CMP = NA, fertilizers = expand.grid(type = c("urea", "CAN",
  "NPK17:17:17", "NPK15:15:15", "NPK20:10:10", "DAP", "TSP", "SSP",
  "Minjingu_Nafaka+", "MOP"), available = FALSE, price = NA, weight = 50),
  saleSF = c(NA, TRUE, FALSE), nameSF = c(NA,
  "AlliedAtlanticDistilleries", "MatnaStarch", "PsaltryMarketers",
  "PsaltryOutgrowers", "Greentech", "ThaiFarm", "FJS"),
  cassPD = c("roots", "chips", "flour", "gari"), cassUW = NA,
  cassUP = NA, maizePD = c(NA, "fresh_cob", "dry_cob", "grain"),
  maizePC = c(NA, TRUE, FALSE), maizeUW = NA, maizeUP = NA,
  maxInv = NA, SMS = c(TRUE, FALSE), email = c(TRUE, FALSE),
  userPhoneCC = NA, userPhoneNr = NA, userName = NA,
  userEmail = NA, userField = NA)
}
\arguments{
\item{country}{: 2-letter country code}

\item{lat}{: Latitude in decimal degrees}

\item{lon}{: Longitude in decimal degrees}

\item{area}{: Numerical value for area of the field}

\item{areaUnits}{: Units for area (acre, ha or m2)}

\item{IC}{: Logical, indicating if an intercrop (TRUE) or a monocrop (FALSE) is grown}

\item{intercrop}{: Intercrop species grown, either maize or sweetpotato, or NA if monocrop}

\item{FR}{: Logical, indicating if fertilizer recommendations are requested, NA if IC == TRUE and country == "TZ"}

\item{PP}{: Logical, indicating if planting practice recommendations are requested, NA if IC == TRUE or country == "TZ"}

\item{SPP}{: Logical, indicating if scheduled planting - advice on planting date is requested, NA if IC == TRUE}

\item{SPH}{: Logical, indicating if scheduled planting - advice on harvest date is requested, NA if IC == TRUE}

\item{PD}{: Planting date, in format "yyyy-mm-dd" (%Y-%m-%d)}

\item{HD}{: Harvest data, in format "yyyy-mm-dd" (%Y-%m-%d)}

\item{tractor}{: Logical, indicating if the user has access to a tractor, NA if PP != TRUE}

\item{implement}{: vector containing implements available for tractor (plough, harrow, ridger)}

\item{herbicide}{: Logical, indicating if the user has access to herbicides for weed control}

\item{nTill1}{: Number of primary tillage operations conducted in current practice (NA, 0, 1, 2), NA if PP != TRUE}

\item{nHarrow}{: Number of harrow operations conducted in current practice (NA, 0, 1, 2), NA if PP != TRUE}

\item{ridges}{: Logical indicating if the farmer ridges his/her field in current practice (NA, TRUE, FALSE), NA if PP != TRUE}

\item{weedMethod}{: Vector containing methods used for weed control (NA, manual, herbicide), NA if PP!= TRUE}

\item{costLMO}{: Dataframe containing cost of land management operations; costs are provided in local currency, for the area of the field}

\item{costWCO}{: Dataframe containing cost of weed management operations; costs are provided in local currency, for the area of the field}

\item{FCY}{: Farmer-reported current yield, in tonnes FM per ha (optional, default value = NA)}

\item{CMP}{: Current maize performance, score on a scale of 1 (very yellow and stunted) .. 5 (tall and dark green), NA if IC != TRUE and FR != TRUE, or NA if the user does not know (NA = default)}

\item{saleSF}{: Logical, indicating if the user is selling roots to a registered starch factory at factory-fixed prices}

\item{nameSF}{: Name of starch factory where roots will be sold, NA if saleSF = FALSE}

\item{cassPD}{: Type of cassava produce sold (roots, chips, flour, gari)}

\item{cassUW}{: Unit weight at which cassava produce is sold, in kg; common measures are 1 (per kg), 50 (per 50kg bag), 100 (per 100kg bag) and 1000 (per tonne); can be NA if user does not know.}

\item{cassUP}{: Price of 1 cassava produce unit in local currency; can be NA if user does not know.}

\item{maizePD}{: Type of maize produce sold (fresh cobs, dry cobs, grain), NA if IC != TRUE and country == "NG"}

\item{maizePC}{: Logical indicating if maize is sold per cob (NA, TRUE, FALSE), NA if maizePD != "fresh_cob"}

\item{maizeUW}{: Unit weight at which maize produce is sold, in kg; common measures are 1 (per kg), 50 (per 50kg bag), 100 (per 100kg bag), NA if IC != TRUE and country == "NG" or NA if maizePD == "grain"; can be NA if user does not know.}

\item{maizeUP}{: Price of 1 maize produce unit (or cob, if maizePC == TRUE) in local currency, NA if IC != TRUE and country == "NG"; can be NA if user does not know.}

\item{maxInv}{: Maximal investment in fertilizer, for the area of the field in local currency, NA if FR != TRUE, default = NA (if user does not wish to set an investment ceiling)}

\item{SMS}{: Logical indicating if recommendations must be sent by SMS to the user}

\item{email}{: Logical indicating if recommendations must be sent by email to the user}

\item{userName}{: Name of the user requesting the recommendations (to be included in the email report), default = NA (if user does not wish to receive recommendations by email)}

\item{userEmail}{: Email address of the user requesting the recommendations (to be included in the email report), default = NA (if user does not wish to receive recommendations by email)}

\item{userField}{: Name or desciption of the field (to be included in the email report, and aid the user to recall for which field recommendations were requested), default = NA (if user does not wish to receive recommendations by email)}

\item{fertilizers:}{Dataframe containing available fertilizers and their cost per bag (in local currency) and bag weight (in kg)}

\item{userPhoneCC:}{Country code of the phone number of the user requesting the recommendations (to send recommendations by SMS), default = NA (if user does not wish to receive recommendations by SMS); example 234 for Nigeria}

\item{userPhoneNr:}{Phone number of the user requesting the recommendations, without the initial zero (to send recommendations by SMS), default = NA (if user does not wish to receive recommendations by SMS); excludes the initial zero, stored as numerical (e.g., 789123456)}
}
\description{
SHORT DEF:   Wrapper function to calculate recommendations across all use cases.
RETURNS:     Vector of with recommendation texts to display.
DESCRIPTION: Function with all inputs required by the DST app, and calling use case-specific wrapper functions to calculated recommendations on IC, FR, PP and SP.
            This function also calls on functions to send recommendation reports by SMS and/or email.
INPUT:
}
