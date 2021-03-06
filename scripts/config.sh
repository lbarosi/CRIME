#!/bin/bash

###Common parameters
#angular pixel resolution
n_side=512
#RNG seed
seed=1234

###Params for GetHI
#
# IO paths
cosmo_dirname="sim_test/cosmo" #output directory
cosmo_prefix="cosmo" #simulation name
pk_filename="../data/Pk_CAMB_test.dat" #Pk file name, must be in CAMB format
#
#cosmological parameters
omega_M=0.3 #Non-relativistic matter parameter
omega_L=0.7 #Dark-energy parameter
omega_B=0.049 #Baryons
hhubble=0.67 #Hubble constant in units of 100 km/s/Mpc
weos=-1.0 #Dark energy equation of state
nscal=0.96 #Scalar primordial spectral index
sigma_8=0.8 #Power spectrum normalization
#
#Smoothing scale [Mpc/h] (set to negative value if you don't want smoothing)
r_smooth=-1.
#Frequency list
frequencies_filename="../data/nuTable.txt"
#
n_grid=2048 #Grid resolution
###

###Params for ForGet
#
#Output paths for the different components.
#For each component, provide path to directory and prefix.
#The output will be in <path-to-directory>/<prefix>_###.fits
synchrotron_dirname="sim_test/synchrotron" #Galactic synchrotron
synchrotron_prefix="gsync"
galactic_freefree_dirname="sim_test/galactic_freefree" #Galactic free-free
galactic_freefree_prefix="gfree"
extragalactic_freefree_dirname="sim_test/extragalactic_freefree" #Extra-galactic free-free
extragalactic_freefree_prefix="egfree"
point_sources_dirname="sim_test/point_sources" #Point sources
point_sources_prefix="psources"
#
#Path to input maps
haslam_filename="../data/lambda_haslam408_dsds.fits" #Path to Haslam map
specin_filename="../data/synchrotron_specind.fits" #Path to synchrotron spectral index map
#
#Angular resolution. Power-law angular spectra are used for the different
#components, up to l=lmax. The power-law is cut off to a constant for l<lmin.
lmin=10 #minimum multipole for foregrounds
lmax=1024 #maximum multipole for foregrounds
#
#Parameters for the polarized synchrotron emission
do_polarization=0 #1 if you want polarized synchrotron, 0 otherwise
xi_polarization=0.5 #Correlation length in Faraday space (in rad/m^2)
beta_polarization=3.3 #Angular spectral tilt (C_l \propto l^beta_polarization
faraday_filename="../data/faraday_sigmas.fits" #Path to Faraday widths map
###

###Params for JoinT
#
#Output directory and prefix
observation_dirname="sim_test/observation"
observation_prefix="obs"
#Mask filename
mask_filename="none"
#Dish size
dish_diameter=15.
#Number of dishes
n_dishes=254
#System temperature in mK
t_system=25000.
#Total integration time in hours
time_integration=10000.
#Polarization leakage fraction (per 1)
polarization_leakage=0.01
#Output angular resolution (need not be the same as n_side)
n_side_joint=512
###

###Paths to executables
GETHI=./GetHI
FORGET=./ForGet
JOINT=./JoinT
