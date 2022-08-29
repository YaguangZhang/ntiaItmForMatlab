#pragma once

#include <complex>
#include <algorithm>
#include <vector>

using namespace std;

/////////////////////////////
// ITM Helper Functions

double ComputeDeltaH(double pfl[], double d_start__meter, double d_end__meter);
double DiffractionLoss(double d__meter, double d_hzn__meter[2], double h_e__meter[2], complex<double> Z_g,
    double a_e__meter, double delta_h__meter, double h__meter[2], int mode, double theta_los, double d_sML__meter, double f__mhz);
double FFunction(double td);
void FindHorizons(double pfl[], double a_e__meter, double h__meter[2], double theta_hzn[2], double d_hzn__meter[2]);
double FreeSpaceLoss(double d__meter, double f__mhz);
double FresnelIntegral(double v2);
double H0Function(double r, double eta_s);
double HeightFunction(double x__meter, double K);
void InitializeArea(int site_criteria[2], double gamma_e, double delta_h__meter,
    double h__meter[2], double h_e__meter[2], double d_hzn__meter[2], double theta_hzn[2]);
void InitializePointToPoint(double f__mhz, double h_sys__meter, double N_0, int polarization, double epsilon,
    double sigma, complex<double> *Z_g, double *gamma_e, double *N_s);
double InverseComplementaryCumulativeDistributionFunction(double q);
double KnifeEdgeDiffraction(double d__meter, double f__mhz, double a_e__meter, double theta_los, double d_hzn__meter[2]);
void LinearLeastSquaresFit(double pfl[], double d_start, double d_end, double *fit_y1, double *fit_y2);
double LineOfSightLoss(double d__meter, double h_e__meter[2], complex<double> Z_g, double delta_h__meter,
    double M_d, double A_d0, double d_sML__meter, double f__mhz);
int LongleyRice(double theta_hzn[2], double f__mhz, complex<double> Z_g, double d_hzn__meter[2], double h_e__meter[2],
    double gamma_e, double N_s, double delta_h__meter, double h__meter[2], double d__meter, int mode, double *A_ref__db,
    long *warnings, int *propmode);
void QuickPfl(double pfl[], double gamma_e, double h__meter[2], double theta_hzn[2], double d_hzn__meter[2],
    double h_e__meter[2], double *delta_h__meter, double *d__meter);
double SigmaHFunction(double delta_h__meter);
double SmoothEarthDiffraction(double d__meter, double f__mhz, double a_e__meter, double theta_los,
    double d_hzn__meter[2], double h_e__meter[2], complex<double> Z_g);
double TerrainRoughness(double d__meter, double delta_h__meter);
double TroposcatterLoss(double d__meter, double theta_hzn[2], double d_hzn__meter[2], double h_e__meter[2],
    double a_e__meter, double N_s, double f__mhz, double theta_los, double *h0);
int ValidateInputs(double h_tx__meter, double h_rx__meter, int climate, double time,
    double location, double situation, double N_0, double f__mhz, int pol,
    double epsilon, double sigma, int mdvar, long *warnings);
double Variability(double time, double location, double situation, double h_e__meter[2], double delta_h__meter,
    double f__mhz, double d__meter, double A_ref__db, int climate, int mdvar, long *warnings);