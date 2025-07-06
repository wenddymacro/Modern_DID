{smcl}
{* *! version 1.0.0  06jul2025}{...}
{vieweralsosee "[R] reghdfe" "help reghdfe"}{...}
{vieweralsosee "[R] xtevent" "help xtevent"}{...}
{vieweralsosee "[R] csdid" "help csdid"}{...}
{vieweralsosee "[R] did_imputation" "help did_imputation"}{...}
{vieweralsosee "[R] jwdid" "help jwdid"}{...}
{vieweralsosee "[R] lpdid" "help lpdid"}{...}
{vieweralsosee "[R] sdid" "help sdid"}{...}
{vieweralsosee "[R] did2s" "help did2s"}{...}
{viewerjumpto "Syntax" "alldid##syntax"}{...}
{viewerjumpto "Description" "alldid##description"}{...}
{viewerjumpto "Options" "alldid##options"}{...}
{viewerjumpto "Stored results" "alldid##results"}{...}
{viewerjumpto "References" "alldid##references"}{...}
{viewerjumpto "Author" "alldid##author"}{...}
{title:Title}

{phang}
{bf:alldid} {hline 2} Unified interface for difference-in-differences methods


{marker syntax}{...}
{title:Syntax}

{p 8 17 2}
{cmdab:alldid}
{cmd:(}{it:mode}{cmd:)}
{varlist}
{ifin}
{cmd:,}
{cmdab:treat:ment(}{varname}{cmd:)}
{cmdab:time:(}{varname}{cmd:)}
{cmdab:unit:(}{varname}{cmd:)}
[{it:options}]

{synoptset 20 tabbed}{...}
{synopthdr}
{synoptline}
{syntab:Required}
{synopt:{opt treat:ment(varname)}}specify treatment variable{p_end}
{synopt:{opt time(varname)}}specify time variable{p_end}
{synopt:{opt unit(varname)}}specify unit identifier variable{p_end}

{syntab:Optional}
{synopt:{opt no_updates}}disable automatic update functionality{p_end}
{synopt:{it:method_options}}method-specific options, see individual command help files{p_end}
{synoptline}
{p2colreset}{...}

{marker modes}{...}
{title:Supported modes}

{synoptset 15 tabbed}{...}
{synopthdr:Mode}
{synoptline}
{synopt:{opt twfe}}Traditional two-way fixed effects model (calls {help reghdfe}){p_end}
{synopt:{opt xt}}Sun & Abraham (2021) event study method (calls {help xtevent}){p_end}
{synopt:{opt cs}}Callaway & Sant'Anna (2021) method (calls {help csdid}){p_end}
{synopt:{opt bjs}}Borusyak, Jaravel & Spiess (2024) imputation method (calls {help did_imputation}){p_end}
{synopt:{opt jw}}de Chaisemartin & D'Haultfœuille (2020) method (calls {help jwdid}){p_end}
{synopt:{opt lp}}Liu, Wang & Xu (2024) local projection DID method (calls {help lpdid}){p_end}
{synopt:{opt sdid}}Arkhangelsky et al. (2021) synthetic difference-in-differences method (calls {help sdid}){p_end}
{synopt:{opt did2s}}Gardner (2022) two-stage difference-in-differences method (calls {help did2s}){p_end}
{synopt:{opt sa}}Sun & Abraham (2021) event study interaction method (calls {help eventstudyinteract}) {it:*not yet implemented}{p_end}
{synoptline}
{p2colreset}{...}


{marker description}{...}
{title:Description}

{pstd}
{cmd:alldid} is a unified interface for modern difference-in-differences (DID) methods.
This command provides a standardized syntax to call multiple modern DID estimation methods,
including traditional two-way fixed effects models and various emerging heterogeneous
treatment effect methods.

{pstd}
The main advantages of this command include:

{phang2}• {bf:Unified syntax}: All DID methods use the same basic syntax structure{p_end}
{phang2}• {bf:Automatic installation}: Automatically checks and installs required external command packages{p_end}
{phang2}• {bf:Automatic updates}: Random update mechanism ensures use of the latest version of command packages{p_end}
{phang2}• {bf:Rich methods}: Supports 8 different modern DID estimation methods{p_end}

{pstd}
{cmd:alldid} is compatible with Stata 18.0 and above.


{marker options}{...}
{title:Options}

{dlgtab:Required options}

{phang}
{opt treatment(varname)} specifies the treatment variable. This variable should be binary,
with 1 indicating treatment and 0 indicating no treatment.

{phang}
{opt time(varname)} specifies the time variable. This variable identifies the time
dimension in the panel data.

{phang}
{opt unit(varname)} specifies the unit identifier variable. This variable identifies
individual units in the panel data (such as firms, regions, etc.).

{dlgtab:Optional options}

{phang}
{opt no_updates} disables the automatic update functionality. By default, the program
has a 1% probability of automatically updating all related command packages.
Use this option to disable this functionality.

{phang}
{it:method_options} method-specific options. These options are passed directly to
the corresponding underlying commands. For specific available options, please refer
to the help documentation of each method.

{psee}
{helpb reghdfe} (twfe mode), {helpb xtevent} (xt mode), {helpb csdid} (cs mode), {helpb did_imputation} (bjs mode), {helpb jwdid} (jw mode), {helpb lpdid} (lp mode), {helpb sdid} (sdid mode), {helpb did2s} (did2s mode), {helpb eventstudyinteract} (sa mode)



{marker results}{...}
{title:Stored results}

{pstd}
The results stored by {cmd:alldid} depend on the specific method chosen. Since {cmd:alldid}
is a unified interface for various DID methods, the stored results are the same as those
of the corresponding underlying commands. Please refer to the help documentation of each
method for specific stored results.


{marker references}{...}
{title:References}

{phang}
Arkhangelsky, Dmitry, Susan Athey, David A. Hirshberg, Guido W. Imbens, and Stefan Wager. 2021.
"Synthetic Difference-in-Differences." {it:American Economic Review} 111 (12): 4088–4118.

{phang}
Borusyak, K., Jaravel, X., & Spiess, J. (2024).
Revisiting event-study designs: robust and efficient estimation.
{it:Review of Economic Studies}, 91(6), 3253-3285.

{phang}
Callaway, B., & Sant'Anna, P. H. (2021).
Difference-in-differences with multiple time periods.
{it:Journal of econometrics}, 225(2), 200-230.

{phang}
De Chaisemartin, C., & d'Haultfoeuille, X. (2020).
Two-way fixed effects estimators with heterogeneous treatment effects.
{it:American economic review}, 110(9), 2964-2996.

{phang}
Gardner, J. (2022).
Two-stage differences in differences.
{it:arXiv preprint} arXiv:2207.05943.

{phang}
Liu, L., Wang, Y., & Xu, Y. (2024).
A practical guide to counterfactual estimators for causal inference with time‐series cross‐sectional data.
{it:American Journal of Political Science}, 68(1), 160-176.

{phang}
Sun, L., & Abraham, S. (2021).
Estimating dynamic treatment effects in event studies with heterogeneous treatment effects.
{it:Journal of econometrics}, 225(2), 175-199.


{marker author}{...}
{title:Author}

{pstd}XuWenLi{p_end}
{pstd}City University of Macau{p_end}
{pstd}wlxu@cityu.edu.mo{p_end}


