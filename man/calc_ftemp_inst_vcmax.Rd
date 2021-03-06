% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/calc_ftemp_inst_vcmax.R
\name{calc_ftemp_inst_vcmax}
\alias{calc_ftemp_inst_vcmax}
\title{Calculates the instantaneous temperature response of Vcmax}
\usage{
calc_ftemp_inst_vcmax(tcleaf, tcgrowth = tcleaf, tcref = 25)
}
\arguments{
\item{tcleaf}{Leaf temperature, or in general the temperature relevant for photosynthesis
(degrees Celsius)}

\item{tcref}{Reference temperature (degrees Celsius)}

\item{tcgrowh}{(Optional) Growth temperature, in the P-model, taken to be equal to tcleaf
(degrees Celsius). Defaults to \code{tcgrowth = tcleaf}.}
}
\value{
A numeric value for \eqn{fv}
}
\description{
Given Vcmax at a reference temperature (argument \code{tkref})
this function calculates its temperature-scaling factor following modified Arrhenius
kinetics based on Kattge & Knorr (2007).
}
\details{
The function is given by Kattge & Knorr (2007) as
\deqn{
		fv = f(T, \Delta Hv) A/B
}
where \eqn{f(T, \Delta Hv)} is a regular Arrhenius-type temperature response function (see
\link{calc_ftemp_arrh}) with \eqn{Hv=71513} J mol-1,
\deqn{
		A = 1 + exp( (T0 \Delta S -Hd) / (T0 R) )
}
and
\deqn{
	    B = 1 + exp( (T \Delta S - Hd) / (TK R) )
}
Here, \eqn{T} is in Kelvin, \eqn{T0=293.15} K, \eqn{Hd = 200000} J mol-1 is the deactivation
energy and \eqn{R} is the universal gas constant and is 8.3145 J mol-1 K-1, and
\deqn{
		\Delta S = aS - bS T
}
with \eqn{aS = 668.39} J mol-1 K-1, and \eqn{bS = 1.07} J mol-1 K-2, and \eqn{T} given in
degrees Celsius (!)
}
\examples{
print(paste("Relative change in Vcmax going (instantaneously, i.e. not acclimatedly) from 10 to 25 degrees (percent change):", (calc_ftemp_inst_vcmax(25)/calc_ftemp_inst_vcmax(10)-1)*100 ))

}
\references{
Kattge, J. and Knorr, W.:  Temperature acclimation in a biochemical model of
photosynthesis: a reanalysis of data from 36 species, Plant, Cell and Environment, 30,1176–1190, 2007.
}
