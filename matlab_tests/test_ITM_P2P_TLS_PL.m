%TEST_ITM_P2P_TLS_PL Test the function ITM_P2P_TLS_PL provided in the NTIA
%ITM model for Matlab.
%
%   double ITM_P2P_TLS_PL(double h_tx__meter, double h_rx__meter,
%       double pfl[], int8_t climate, double N_0, double f__mhz,
%        int8_t pol, double epsilon, double sigma, int8_t mdvar,
%       double time, double location, double situation);
%
% Yaguang Zhang, Purdue, 08/21/2022

clear; clc; close all; dbstop if error;

% Locate the library.
cd(fileparts(mfilename('fullpath')));
addpath(fullfile('..', 'LibReleasesForMatlab'));

%% Load ITM Library

% Unload the library just in case.
if libisloaded('itm')
    unloadlibrary('itm');
end

loadlibrary('itm')

%% Tests

testCnt = 0;

% Inputs
%   h_tx__meter              15           (meters)
%    h_rx__meter             3            (meters)
%   climate                  5            [Continental Temperate]
%    N_0                     301.00       (N-Units)
%   f__mhz                   3500.00      (MHz)
%    pol                     1            [Vertical]
%   epsilon                  15
%    sigma                   0.005
%   mdvar                    1            [Accidental Mode]
%    time                    50
%   location                 50
%    situation               50
%   Mode                     Point-to-Point
%    Terrain File            pfl.txt
%
% Results
%   ITM Warning Flags        0x0000       [No Warnings]
%    ITM Return Code         0            [Success - No Errors]
%   Basic Transmission Loss  114.5        (dB)
pfl = [142,25.6,1692,1692,1693,1693,1693,1693,1693,1693,1694,1694,1694, ...
    1694,1694,1694,1694,1694,1694,1695,1695,1695,1695,1695,1695,1695, ...
    1695,1696,1696,1696,1696,1696,1696,1697,1697,1697,1697,1697,1697, ...
    1697,1697,1697,1697,1698,1698,1698,1698,1698,1698,1698,1698,1698, ...
    1698,1699,1699,1699,1699,1699,1699,1700,1700,1700,1700,1700,1700, ...
    1700,1701,1701,1701,1701,1701,1701,1702,1702,1702,1702,1702,1702, ...
    1702,1702,1703,1703,1703,1703,1703,1703,1703,1703,1703,1704,1704, ...
    1704,1704,1704,1704,1704,1704,1705,1705,1705,1705,1705,1705,1705, ...
    1705,1705,1705,1706,1706,1706,1706,1706,1706,1706,1706,1706,1707, ...
    1707,1707,1707,1707,1707,1707,1708,1708,1708,1708,1708,1708,1708, ...
    1708,1709,1709,1709,1709,1709,1710,1710,1710,1710,1710,1710,1710, ...
    1710,1709];
expected_A__dB = 114.5;
tic;
A__dB = calllib('itm', 'ITM_P2P_TLS_PL', 15, 3, ...
    pfl, int8(5), 301, 3500, ...
    int8(1), 15, 0.005, int8(1), ...
    50, 50, 50);
assert(round(A__dB*10) == round(expected_A__dB*10), ...
    ['Unexpected output path loss: ', num2str(A__dB), ' dB! ', ...
    'It should be about ', num2str(expected_A__dB), ' dB!'])
toc;
testCnt = testCnt+1;
disp(['Test #', num2str(testCnt), ': passed!'])

% Same case with a short link (141 m).
pfl = [142,1,1692,1692,1693,1693,1693,1693,1693,1693,1694,1694,1694, ...
    1694,1694,1694,1694,1694,1694,1695,1695,1695,1695,1695,1695,1695, ...
    1695,1696,1696,1696,1696,1696,1696,1697,1697,1697,1697,1697,1697, ...
    1697,1697,1697,1697,1698,1698,1698,1698,1698,1698,1698,1698,1698, ...
    1698,1699,1699,1699,1699,1699,1699,1700,1700,1700,1700,1700,1700, ...
    1700,1701,1701,1701,1701,1701,1701,1702,1702,1702,1702,1702,1702, ...
    1702,1702,1703,1703,1703,1703,1703,1703,1703,1703,1703,1704,1704, ...
    1704,1704,1704,1704,1704,1704,1705,1705,1705,1705,1705,1705,1705, ...
    1705,1705,1705,1706,1706,1706,1706,1706,1706,1706,1706,1706,1707, ...
    1707,1707,1707,1707,1707,1707,1708,1708,1708,1708,1708,1708,1708, ...
    1708,1709,1709,1709,1709,1709,1710,1710,1710,1710,1710,1710,1710, ...
    1710,1709];
expected_A__dB = 114.5;
tic;
A__dB = calllib('itm', 'ITM_P2P_TLS_PL', 15, 3, ...
    pfl, int8(5), 301, 3500, ...
    int8(1), 15, 0.005, int8(1), ...
    50, 50, 50);
toc;
assert(A__dB>0, ['Unexpected output path loss: ', num2str(A__dB), ' dB! '])

%% Clean Things Up
% Unload the library.
if libisloaded('itm')
    unloadlibrary('itm');
end