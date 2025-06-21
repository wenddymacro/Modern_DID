cap program drop alldid
program define alldid, eclass
version 18.0
syntax anything [if] [in], treatment(varname) time(varname) unit(varname) [*]

    local cmd_list reghdfe xtevent csdid did_imputation jwdid lpdid sdid eventstudyinteract did2s

    qui {
        foreach p in  `cmd_list' {
            cap which `p'
            if _rc != 0 {
                noi di as text "Installing `p' ..."
                ssc install `p', replace
            }
        }

        if uniform() < 0.01 & strpos("`options'", "no_updates") == 0{
            foreach p in `cmd_list' {
                noi ssc install `p', replace
            }
        }

        local cmd_twfe "reghdfe"
        local cmd_xt "xtevent"
        local cmd_cs "csdid"
        local cmd_bjs "did_imputation"
		local cmd_jw "jwdid"
		local cmd_lp "lpdid"
		local cmd_sdid "sdid"
		local cmd_sa "eventstudyinteract"
		local cmd_did2s "did2s"

        local fp = strpos("`anything'", "(")
        local lp = strpos("`anything'", ")")
        local mod = substr("`anything'",`fp'+1,`lp'-`fp'-1)
        local vars = substr("`anything'", `lp'+1, .)
		local trvars "`treatment'"
		local aboptions "absorb(`unit' `time')"
        local options = subinstr("`options'", "no_updates", "", .)
    }   

    if missing("`mod'") | !inlist("`mod'", "twfe", "xt", "cs", "bjs", "jw", "lp", "sdid", "sa", "did2s") {
        di as err "Invalid syntax: Xu is too lazy. Hurry up and push him to get to work—bombard him with emails: wlxu@cityu.edu.mo."
        di as input _continue "" _newline

        di as text "To be lazy when running DID, W.L. Xu develop a stata command —— alldid, which is a library for many modern new DIDs and follows a new syntax:"
        di as text "       {cmd:alldid (mode) varlist [if] [in], treatment(varname) unit(varname) time(varname) options]}"
        di as text ""
        di as text "Depending on the mode argument, alldid can be used to call"
        di as text "     - {stata help reghdfe:reghdfe} with the {it:twfe} mode;"
        di as text "     - {stata help xtevent:xtevent} with the {it:xt} mode;"
        di as text "     - {stata help csdid:csdid} with the {it:cs} mode;"
        di as text "     - {stata help did_imputation:did_imputation} with the {it:bjs} mode;"
		di as text "     - {stata help jwdid:jwdid} with the {it:jw} mode;"
        di as text "     - {stata help lpdid:lpdid} with the {it:lp} mode;"
        di as text "     - {stata help sdid:sdid} with the {it:sdid} mode;"
        di as text "     - {stata help eventstudyinteract:eventstudyinteract} with the {it:sa} mode;"
		di as text "     - {stata help did2s:did2s} with the {it:did2s} mode;"
        exit
    }
    else if "`mod'" == "twfe" {
        `cmd_`mod'' `vars' `trvars' `if' `in', `absorb(`unit' `time')' `options'
    }
	else if "`mod'" == "xt" {
		`cmd_`mod'' `vars' `if' `in', policyvar(`trvars') panelvar(`unit') timevar(`time') static `options'
	}
	else if "`mod'" == "cs" {
		`cmd_`mod'' `vars' `if' `in', gvar(gvar) ivar(`unit') time(`time') `options'
	}
	else if "`mod'" == "bjs" {
		`cmd_`mod'' `vars' `unit' `time' first_treat `if' `in', `options'
	}
	else if "`mod'" == "jw" {
		`cmd_`mod'' `vars' `if' `in', ivar(`unit') time(`time') gvar(gvar) `options'
	}
	else if "`mod'" == "lp" {
		`cmd_`mod'' `vars' `if' `in', treat(`trvars') unit(`unit') time(`time') pre(10) post(10) `options'
	}
	else if "`mod'" == "sdid" {
		`cmd_`mod'' `vars' `unit' `time' `trvars' `if' `in', vce(bootstrap) `options'
	}
	else if "`mod'" == "did2s" {
		`cmd_`mod'' `vars' `if' `in', first_stage(`unit' `time') second_stage(F_* L_*) treatment(`trvars') cluster(`unit') `options'
	}
	else if "`mod'" == "sa" {
		di as err "Invalid syntax: Xu is too lazy. Hurry up and push him to get to work—bombard him with emails: wlxu@cityu.edu.mo."
	}
end
