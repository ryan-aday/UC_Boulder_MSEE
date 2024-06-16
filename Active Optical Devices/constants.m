pkg load symbolic

%% Conversions
%1 eV = 1.60*10^-19 J

clear all; clc;

%% Constants

% Physical Constants
e_0 = 8.85*10^-14; % F/cm, permittivity of vacuum
mu_0 = 4*pi*10^-7; %H/m, permeability of free space
h = 6.63*10^-34; %Js, Planck's constant
h_bar = h/(2*pi); %reduced Planck's constant
q = 1.60*10^-19; %C, electronic charge
k_b = 1.38*10^-23; %J/K, Boltzmann constnat
c = 3*10^10; %m/s, speed of light
m_o = 9.11*10^-31; %kg, electron rest mass
kbT = 0.0259; %eV, thermal energy at 300K

% GaAs
Eo_GeAs = 1.42; %eV, band gap energy @ 300K
x_curl_GeAs = 4.07; % eV, electron affinity
epsilon_ratio_GeAs = 12.9; % relative permitivvity, epsilon_s/epsilon_o
m_e_GeAs = 0.067*m_o; %electron effective mass
m_o_GeAs = 0.5*m_o; % hole effective mass
mu_n_GeAs = 8500; %cm^2/(Vs), electron mobility
mu_p_GeAs = 400; %cm^2/(Vs), hole mobility
D_n_GeAs = 200; %cm^2/s, electron diffusion coefficient
D_p_GeAs = 10; %cm^2/s, hole diffusion coefficient

% %GaP
Eo_GaP = 2.3; %eV, band gap energy @ 300K
m_e_GaP = 0.12*m_o; % electron effective mass
m_o_GaP = 0.5*m_o; % hole effective mass

% Si
Eo_Si = 1.12; %eV, band gap energy @ 300K
m_e_Si = m_o; % electron effective mass
m_o_Si = 0.7*m_o; % hole effective mass

% Question 4
N = 10^17; % cm^-3

syms T
a = (k_b * T/(2*pi*h_bar^2))^1.5;
m_e = m_o;
m_h = 0.7*m_o;
b = (m_e*m_h)^0.75;
E_g = Eo_Si;
y = 2*a*b*exp(-E_g/(2*k_b*T))
%y_new = subs(y, [k_b, h_bar, E_g, m_o], [k_b, h_bar, E_g, m_o]);
Ni = solve(y/10^6 == N, 300.)

