%    Copyright (c) 2012-2016 Russell V. Lenth                                %

\name{nutrition}
\alias{nutrition}
\docType{data}
\title{
Nutrition data
}
\description{
This observational dataset involves three factors, but where several factor combinations are missing.
It is used as a case study in Milliken and Johnson, Chapter 17, p.202. (You may also find it in the second edition, p.278.)
}
\usage{nutrition}
\format{
  A data frame with 107 observations on the following 4 variables.
  \describe{
    \item{\code{age}}{a factor with levels \code{1}, \code{2}, \code{3}, \code{4}. Mother's age group.}
    \item{\code{group}}{a factor with levels \code{FoodStamps}, \code{NoAid}. Whether or not the family receives food stamp assistance.}
    \item{\code{race}}{a factor with levels \code{Black}, \code{Hispanic}, \code{White}. Mother's race.}
    \item{\code{gain}}{a numeric vector (the response variable). Gain score (posttest minus pretest) on knowledge of nutrition.}
  }
}
\details{
A survey was conducted by home economists ``to study how much lower-socioeconomic-level mothers knew about nutrition and to judge the effect of a training program designed to increase therir knowledge of nutrition.'' This is a messy dataset with several empty cells.
}
\source{
Milliken, G. A. and Johnson, D. E. (1984)
\emph{Analysis of Messy Data -- Volume I: Designed Experiments}. Van Nostrand, ISBN 0-534-02713-7.
}

\examples{
require(lsmeans)
nutr.aov <- aov(gain ~ (group + age + race)^2, data = nutrition)

# Summarize predictions for age group 3
nutr.lsm <- lsmeans(nutr.aov, ~ race * group, 
                at = list(age="3"))
                   
lsmip(nutr.lsm, race ~ group)

# Hispanics seem exceptional; but, this doesn't test out due to very sparse data
cld(nutr.lsm, by = "group")
cld(nutr.lsm, by = "race")
}
\keyword{datasets}
