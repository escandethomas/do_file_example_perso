set more off
use "C:\Users\Chiara\Google Drive\Monitoring survey 2\data\AGMS_clean.dta", clear

svyset psu [pweight=AGMS_weight], strata (secs)

*******************************************************************************
   
***** OUTCOME CATEGORIES ***

# delimit;

local MODULE_1_HOUSEHOLD "scenario alone confirm_age marital_status interview_language_1 interview_language_2 
ability_to_read_write_1 ability_to_read_write_2 ability_to_read_write_3 ability_to_read_write_4 intro_06_1 intro_06_2 q2a m2a1 
m2a2_2 m2a2_3 m2a2_4 m2a2_5 m2a2_6 m2a2_7 m2a2_8 m2a2_9 m2a2_10 m2a3 idp_yn idp_reason_1 idp_reason_2 idp_reason_3 idp_reason_4 
displaced_yn_0 displaced_yn_1 displaced_yn_2 displaced_yn_3 displaced_yn_4 m2d_1 m2d_2 m2d_3 m2d_4 m2d_5 m2d_6 m2d_7 m2d_8 m2d_9 m2d_10 m2d_11" ;
 
local MODULE_1_CHILDMARRIAGE "early_marriage1_1 early_marriage1_2 early_marriage1_3 early_marriage2 early_marriage3_1 early_marriage3_2 early_marriage3_3 
early_marriage4_1 early_marriage4_2 early_marriage4_3 early_marriage4_4 early_marriage4_5 early_marriage4_6 early_marriage4_7 
early_marriage4_8 early_marriage4_9 early_marriage4_10 early_marriage4_11 early_marriage4_12 early_marriage4_13 
edu4_0 edu4_1 edu4_2 edu4_3" ;

local MODULE_1_HEALTH "h1_0 h1_1 h1_2 h1_3 h2a h2b h2c needed_med_attention_ind h2 h3a_0 h3a_1 h3a_2 h3a_3 h3a_5 h3a_8 h3a_10 h3a_11 h3a_13 h3a_14 h3a_15 
h3b_0 h3b_1 h3b_2 h3b_3 h3b_5 h3b_8 h3b_10 h3b_11 h3b_13 h3b_14 h3c_0 h3c_1 h3c_2 h3c_3 h3c_5 h3c_8 h3c_11 h3c_13 h3c_14 
h4 h5_0 h5_1 h5_2 h5_3 h5_4 h5_5 h5_6 h6_0 h6_1 h6_2 h6_3 h6_4 h6_5" ;

local MODULE_2_WORK "employed employed_1565 employed_1565_AWMS m2s1 m2s2 m2s3 m2s4 m2s5 m2s6 
Q2t_1 Q2t_2 Q2t_3 Q2t_4 Q2t_5 Q2t_6 Q2t_7 Q2t_8 Q2t_9 Q2t_10 Q2t_11 Q2t_12 Q2t_13 Q2t_14 Q2t_15 Q2t_16
m4a0_1 m4a0_2 m4a0_3 child_labor_0 child_labor_1 child_labor_2 child_labor_3" ;

local MODULE_3_FOODSECURITY "b1 b2 b3 b4 b5 csi_score precedence_females precedence_males precedence_children precedence_adults precedence_girls precedence_boys 
b6 b7_1 b7_2 b7_3 b7_4 b7_5 b7_6 b7_7 b7_8 b7_9 b7_10 b7_11 b7_12 b7_13 b7_14 
b8_1 b8_2 b8_3 b8_4 b8_5 b8_6 b8_7 b8_8 b8_9 b8_10 b8_11 b8_12 b8_13 b8_14 b8_15 b8_16 b8_17 b8_18 b8_19 b8_20 
b9_1 b9_2 b9_3 b9_4 b9_5 b9_6 b9_7 b9_8 m1 m2 m2a m3 m3a m4 m4a" ;

local MODULE_4_MOBILITY "q10cbsg1b q10cbsg2 q10cbsg3 q10cbsg5_0 q10cbsg5_1 q10cbsg5_2 q10cbsg5_3 q10cbsg5_4 q10cbsg6_0 q10cbsg6_1 q10cbsg6_2 q10cbsg6_3 q10cbsg6_4 
q10cbsg6_5 q10cbsg6_6 q10cbsg6_7 q10cbsg6_8 q10cbsg6_9 q10cbsg6_10
mt11_1 mt11_2 mt11_3 mt11_4 mt12_1 mt12_2 mt12_3 mt12_4 tazkira_0 tazkira_1 tazkira_2 tazkira_3" ;

local MODULE_5_SAFETY "w3_1 w3_2 w3_3 w3_4 w3_5 safety1_0 safety1_1 safety1_2 safety1_3 safety1_4 safety1_5 safety1_6 safety1_7 safety1_8 safety1_9 safety1_10 
safety2_0 safety2_1 safety2_2 safety2_3 safety2_4 safety2_5 safety2_6 safety2_7 safety2_8 safety2_9 safety2_10 
safety3_0 safety3_1 safety3_2 safety3_3 safety3_4 safety3_5 safety3_6 safety3_7 safety3_8 safety3_9 safety3_10 
safety4_0 safety4_1 safety4_2 safety4_3 safety4_4 safety4_5 safety4_6 safety4_7 safety4_8 safety4_9 safety4_10 
q10cbsg88 q10cbsg89 barrier28 wfws12_0 wfws12_1 wfws12_2 wfws12_3 wfws12_4" ;

local MODULE_6_MENTALHEALTH "phq1 phq2 gad1 gad2 anxiety depression mh_level mh_level_0 mh_level_1 mh_level_2 mh_level_3" ;

local MODULE_7_DECISIONMAKING "dhs1_participate restr_dhs1_participate dhs1_1 dhs1_2 dhs1_3 dhs1_666 restr_dhs1_1 restr_dhs1_2 restr_dhs1_3 restr_dhs1_666 
dhs2_participate restr_dhs2_participate dhs2_1 dhs2_2 dhs2_3 dhs2_4 dhs3_participate restr_dhs3_participate dhs3_1 dhs3_2 dhs3_3 dhs3_4 
dhs4a dhs4b dhs4c dhs4d dhs4e dhs4_any restr_dhs4a restr_dhs4b restr_dhs4c restr_dhs4d restr_dhs4e restr_dhs4_any" ;

local MODULE_8_RIGHTS "wr3_1 wr3_2 wr3_3 wr3_4 wr3_5 wr4_1 wr4_2 wr4_3 wr4_4 wr4_5 wr4_6 wr4_7 wr4_8 wr4_9 wr4_10 wr4_11 wr4_12 wr4_666 wr4_0 
wr5 wr7 wr7b_1 wr7b_2 wr7b_3 wr7b_666 wr8_1 wr8_2 wr8_3 wr8_4 wr8_5 wr8_6 wr8_7 wr8_98 wr8_99 
wr10_1 wr10_2 wr10_3 wr10_4 wr10_5 wr10_6 wr10_7 wr10_666 wr10_98 wr10_99" ;

*****************************************************************************;


global topics      "
					MODULE_1_HOUSEHOLD 
					MODULE_1_CHILDMARRIAGE 
					MODULE_1_HEALTH
					MODULE_2_WORK
					MODULE_3_FOODSECURITY
					MODULE_4_MOBILITY
					MODULE_5_SAFETY
					MODULE_6_MENTALHEALTH
					MODULE_7_DECISIONMAKING
					MODULE_8_RIGHTS
";


*****************************************************************************;
*****************************************************************************;

global vars "";
global varsestimation "";
foreach el of global topics {;
    global vars "$vars `el' ``el''";
    global varsestimation "$varsestimation ``el''";
};



********* ESTIMATION *********;

foreach var of global varsestimation {;

svy: mean `var';
mat matrix`var' = e(b);
global mean`var' = matrix`var'[1,1];

estat sd;
mat matsd`var'=r(sd);
global sd`var'= matsd`var'[1,1];

	betaformat mean`var';
	betaformat sd`var';

sum `var' , d;
    global min`var'=r(min);
    global max`var'=r(max);
    global n`var'=r(N);
		
svy, subpop (if intro_06==1): mean `var';
mat umatrix`var' = e(b);
global um_`var' = umatrix`var'[1,1];

svy, subpop (if intro_06==2): mean `var';
mat rmatrix`var' = e(b);
global rm_`var' = rmatrix`var'[1,1];

	betaformat um_`var';
	betaformat rm_`var';

cap svy, subpop (if m2a1==1): mean `var';
mat hhh1`var' = e(b);
global hhh_`var' = hhh1`var'[1,1];

cap svy, subpop (if m2a1==0): mean `var';
mat hhm1`var' = e(b);
global hhm_`var' = hhm1`var'[1,1];


	betaformat hhh_`var';
	betaformat hhm_`var';

};





********* OUTPUT *********;

gen topic="";
gen varlabel="";
gen var="";
gen MEAN="";
gen SD="";
gen MIN="";
gen MAX="";
gen N="";
gen URBAN_MEAN="";
gen RURAL_MEAN="";
gen HH_HEAD="";
gen NOT_HH_HEAD="";

local p=0;
local i=1;
foreach var of global vars {;

    foreach x of global varsestimation {;
        local p=0;
        if "`x'"=="`var'" {;
            local j=`i'+1;
			local zzz : variable label `x';
        
            qui replace var="`x'" in `i';
            qui replace varlabel="`zzz'" in `i';
            
            qui replace MEAN="${mean`x'}" in `i';
            qui replace SD="${sd`x'}" in `i';
            qui replace MIN="${min`x'}" in `i';
			qui replace MAX="${max`x'}" in `i';
            qui replace N="${n`x'}" in `i';
			
			qui replace URBAN_MEAN="${um_`x'}" in `i';
            qui replace RURAL_MEAN="${rm_`x'}" in `i';

			qui replace HH_HEAD="${hhh_`x'}" in `i';
            qui replace NOT_HH_HEAD="${hhm_`x'}" in `i';

            local i=`i'+2;
            local p=1;
            continue, break;
        };
    };
    if `p'==0 {;
        if `i'==1 local i=1;
        else local i=`i'+2;
        qui replace topic="`var'" in `i';
    };
};


foreach var of varlist MEAN SD MIN MAX N URBAN_MEAN RURAL_MEAN HH_HEAD NOT_HH_HEAD {;
    qui replace `var'="" if `var'=="." | `var'=="(.)";
    qui replace `var'="0" if `var'==".00000";
};

br topic varlabel var MEAN SD MIN MAX N URBAN_MEAN RURAL_MEAN HH_HEAD NOT_HH_HEAD ;

