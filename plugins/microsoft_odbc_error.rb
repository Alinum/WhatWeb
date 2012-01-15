##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-03-05 # Brendan Coles <bcoles@gmail.com>
# Updated error code string detection to reduce false positives
##
Plugin.define "Microsoft-ODBC-Error" do
author "Caleb Anderson"
version "0.2"
description "This plugin identifies Microsoft ODBC error codes."

# Error code list :
# http://www.easysoft.com/developer/interfaces/odbc/sqlstate_status_return_codes.html

# Google results as at 2011-03-05 #
# 100 for "ODBC Error Code = 37000 (Syntax error or access violation)" ext:cfm

# Examples #
examples %w|
www.nutragold.co.nz/main.cfm?id=5843&sid=916&id2=964
careers.terrywhitechemists.com.au/pharmacist.cfm?jobID=
www.fishbase.us/country/CountrySpeciesSummary.cfm?id=
www.generationproducts.com/index.cfm?fuseaction=displaysitecategory&category=
www.athealth.com/ClintonClay.cfm?list=741
www.nepalisite.com/fashion/ramp/ramp.cfm
www.organicitta.org/materici/Materici.cfm?Cod=7
|

trigger "ODBC Error Code"

# Passive #
def passive
	m=[]

	# ODBC Error Code
	if @body =~ /\[ODBC/
		m << { :certainty=>25, :string=>@body.scan(/ODBC Error Code = ([a-zA-Z0-9]{3,5}) \(/) }
	end

	# Return passive matches
	m
end

end


