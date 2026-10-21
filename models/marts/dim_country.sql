{{ config(materialized='table') }}

with country_mapping as (
    select 'ABW' as country_code, 'AW' as country_iso2, 'Aruba' as country_name union all
    select 'AFG' as country_code, 'AF' as country_iso2, 'Afghanistan' as country_name union all
    select 'AGO' as country_code, 'AO' as country_iso2, 'Angola' as country_name union all
    select 'AIA' as country_code, 'AI' as country_iso2, 'Anguilla' as country_name union all
    select 'ALA' as country_code, 'AX' as country_iso2, 'Åland' as country_name union all
    select 'ALB' as country_code, 'AL' as country_iso2, 'Albanien' as country_name union all
    select 'AND' as country_code, 'AD' as country_iso2, 'Andorra' as country_name union all
    select 'ARE' as country_code, 'AE' as country_iso2, 'Vereinigte Arabische Emirate' as country_name union all
    select 'ARG' as country_code, 'AR' as country_iso2, 'Argentinien' as country_name union all
    select 'ARM' as country_code, 'AM' as country_iso2, 'Armenien' as country_name union all
    select 'ASM' as country_code, 'AS' as country_iso2, 'Amerikanisch-Samoa' as country_name union all
    select 'ATA' as country_code, 'AQ' as country_iso2, 'Antarktis' as country_name union all
    select 'ATF' as country_code, 'TF' as country_iso2, 'Französische Süd- und Antarktisgebiete' as country_name union all
    select 'ATG' as country_code, 'AG' as country_iso2, 'Antigua und Barbuda' as country_name union all
    select 'AUS' as country_code, 'AU' as country_iso2, 'Australien' as country_name union all
    select 'AUT' as country_code, 'AT' as country_iso2, 'Österreich' as country_name union all
    select 'AZE' as country_code, 'AZ' as country_iso2, 'Aserbaidschan' as country_name union all
    select 'BDI' as country_code, 'BI' as country_iso2, 'Burundi' as country_name union all
    select 'BEL' as country_code, 'BE' as country_iso2, 'Belgien' as country_name union all
    select 'BEN' as country_code, 'BJ' as country_iso2, 'Benin' as country_name union all
    select 'BES' as country_code, 'BQ' as country_iso2, 'Bonaire, Sint Eustatius und Saba' as country_name union all
    select 'BFA' as country_code, 'BF' as country_iso2, 'Burkina Faso' as country_name union all
    select 'BGD' as country_code, 'BD' as country_iso2, 'Bangladesch' as country_name union all
    select 'BGR' as country_code, 'BG' as country_iso2, 'Bulgarien' as country_name union all
    select 'BHR' as country_code, 'BH' as country_iso2, 'Bahrain' as country_name union all
    select 'BHS' as country_code, 'BS' as country_iso2, 'Bahamas' as country_name union all
    select 'BIH' as country_code, 'BA' as country_iso2, 'Bosnien und Herzegowina' as country_name union all
    select 'BLM' as country_code, 'BL' as country_iso2, 'Saint-Barthélemy' as country_name union all
    select 'BLR' as country_code, 'BY' as country_iso2, 'Weißrussland' as country_name union all
    select 'BLZ' as country_code, 'BZ' as country_iso2, 'Belize' as country_name union all
    select 'BMU' as country_code, 'BM' as country_iso2, 'Bermuda' as country_name union all
    select 'BOL' as country_code, 'BO' as country_iso2, 'Bolivien' as country_name union all
    select 'BRA' as country_code, 'BR' as country_iso2, 'Brasilien' as country_name union all
    select 'BRB' as country_code, 'BB' as country_iso2, 'Barbados' as country_name union all
    select 'BRN' as country_code, 'BN' as country_iso2, 'Brunei' as country_name union all
    select 'BTN' as country_code, 'BT' as country_iso2, 'Bhutan' as country_name union all
    select 'BVT' as country_code, 'BV' as country_iso2, 'Bouvetinsel' as country_name union all
    select 'BWA' as country_code, 'BW' as country_iso2, 'Botsuana' as country_name union all
    select 'CAF' as country_code, 'CF' as country_iso2, 'Zentralafrikanische Republik' as country_name union all
    select 'CAN' as country_code, 'CA' as country_iso2, 'Kanada' as country_name union all
    select 'CCK' as country_code, 'CC' as country_iso2, 'Kokosinseln' as country_name union all
    select 'CHE' as country_code, 'CH' as country_iso2, 'Schweiz' as country_name union all
    select 'CHL' as country_code, 'CL' as country_iso2, 'Chile' as country_name union all
    select 'CHN' as country_code, 'CN' as country_iso2, 'China' as country_name union all
    select 'CIV' as country_code, 'CI' as country_iso2, 'Elfenbeinküste' as country_name union all
    select 'CMR' as country_code, 'CM' as country_iso2, 'Kamerun' as country_name union all
    select 'COD' as country_code, 'CD' as country_iso2, 'Kongo (Dem. Rep.)' as country_name union all
    select 'COG' as country_code, 'CG' as country_iso2, 'Kongo (Rep.)' as country_name union all
    select 'COK' as country_code, 'CK' as country_iso2, 'Cookinseln' as country_name union all
    select 'COL' as country_code, 'CO' as country_iso2, 'Kolumbien' as country_name union all
    select 'COM' as country_code, 'KM' as country_iso2, 'Komoren' as country_name union all
    select 'CPV' as country_code, 'CV' as country_iso2, 'Kap Verde' as country_name union all
    select 'CRI' as country_code, 'CR' as country_iso2, 'Costa Rica' as country_name union all
    select 'CUB' as country_code, 'CU' as country_iso2, 'Kuba' as country_name union all
    select 'CUW' as country_code, 'CW' as country_iso2, 'Curaçao' as country_name union all
    select 'CXR' as country_code, 'CX' as country_iso2, 'Weihnachtsinsel' as country_name union all
    select 'CYM' as country_code, 'KY' as country_iso2, 'Kaimaninseln' as country_name union all
    select 'CYP' as country_code, 'CY' as country_iso2, 'Zypern' as country_name union all
    select 'CZE' as country_code, 'CZ' as country_iso2, 'Tschechien' as country_name union all
    select 'DEU' as country_code, 'DE' as country_iso2, 'Deutschland' as country_name union all
    select 'DJI' as country_code, 'DJ' as country_iso2, 'Dschibuti' as country_name union all
    select 'DMA' as country_code, 'DM' as country_iso2, 'Dominica' as country_name union all
    select 'DNK' as country_code, 'DK' as country_iso2, 'Dänemark' as country_name union all
    select 'DOM' as country_code, 'DO' as country_iso2, 'Dominikanische Republik' as country_name union all
    select 'DZA' as country_code, 'DZ' as country_iso2, 'Algerien' as country_name union all
    select 'ECU' as country_code, 'EC' as country_iso2, 'Ecuador' as country_name union all
    select 'EGY' as country_code, 'EG' as country_iso2, 'Ägypten' as country_name union all
    select 'ERI' as country_code, 'ER' as country_iso2, 'Eritrea' as country_name union all
    select 'ESH' as country_code, 'EH' as country_iso2, 'Westsahara' as country_name union all
    select 'ESP' as country_code, 'ES' as country_iso2, 'Spanien' as country_name union all
    select 'EST' as country_code, 'EE' as country_iso2, 'Estland' as country_name union all
    select 'ETH' as country_code, 'ET' as country_iso2, 'Äthiopien' as country_name union all
    select 'FIN' as country_code, 'FI' as country_iso2, 'Finnland' as country_name union all
    select 'FJI' as country_code, 'FJ' as country_iso2, 'Fidschi' as country_name union all
    select 'FLK' as country_code, 'FK' as country_iso2, 'Falklandinseln' as country_name union all
    select 'FRA' as country_code, 'FR' as country_iso2, 'Frankreich' as country_name union all
    select 'FRO' as country_code, 'FO' as country_iso2, 'Färöer' as country_name union all
    select 'FSM' as country_code, 'FM' as country_iso2, 'Mikronesien' as country_name union all
    select 'GAB' as country_code, 'GA' as country_iso2, 'Gabun' as country_name union all
    select 'GBR' as country_code, 'GB' as country_iso2, 'Vereinigtes Königreich' as country_name union all
    select 'GEO' as country_code, 'GE' as country_iso2, 'Georgien' as country_name union all
    select 'GGY' as country_code, 'GG' as country_iso2, 'Guernsey' as country_name union all
    select 'GHA' as country_code, 'GH' as country_iso2, 'Ghana' as country_name union all
    select 'GIB' as country_code, 'GI' as country_iso2, 'Gibraltar' as country_name union all
    select 'GIN' as country_code, 'GN' as country_iso2, 'Guinea' as country_name union all
    select 'GLP' as country_code, 'GP' as country_iso2, 'Guadeloupe' as country_name union all
    select 'GMB' as country_code, 'GM' as country_iso2, 'Gambia' as country_name union all
    select 'GNB' as country_code, 'GW' as country_iso2, 'Guinea-Bissau' as country_name union all
    select 'GNQ' as country_code, 'GQ' as country_iso2, 'Äquatorialguinea' as country_name union all
    select 'GRC' as country_code, 'GR' as country_iso2, 'Griechenland' as country_name union all
    select 'GRD' as country_code, 'GD' as country_iso2, 'Grenada' as country_name union all
    select 'GRL' as country_code, 'GL' as country_iso2, 'Grönland' as country_name union all
    select 'GTM' as country_code, 'GT' as country_iso2, 'Guatemala' as country_name union all
    select 'GUF' as country_code, 'GF' as country_iso2, 'Französisch-Guayana' as country_name union all
    select 'GUM' as country_code, 'GU' as country_iso2, 'Guam' as country_name union all
    select 'GUY' as country_code, 'GY' as country_iso2, 'Guyana' as country_name union all
    select 'HKG' as country_code, 'HK' as country_iso2, 'Hongkong' as country_name union all
    select 'HMD' as country_code, 'HM' as country_iso2, 'Heard und McDonaldinseln' as country_name union all
    select 'HND' as country_code, 'HN' as country_iso2, 'Honduras' as country_name union all
    select 'HRV' as country_code, 'HR' as country_iso2, 'Kroatien' as country_name union all
    select 'HTI' as country_code, 'HT' as country_iso2, 'Haiti' as country_name union all
    select 'HUN' as country_code, 'HU' as country_iso2, 'Ungarn' as country_name union all
    select 'IDN' as country_code, 'ID' as country_iso2, 'Indonesien' as country_name union all
    select 'IMN' as country_code, 'IM' as country_iso2, 'Isle of Man' as country_name union all
    select 'IND' as country_code, 'IN' as country_iso2, 'Indien' as country_name union all
    select 'IOT' as country_code, 'IO' as country_iso2, 'Britisches Territorium im Indischen Ozean' as country_name union all
    select 'IRL' as country_code, 'IE' as country_iso2, 'Irland' as country_name union all
    select 'IRN' as country_code, 'IR' as country_iso2, 'Iran' as country_name union all
    select 'IRQ' as country_code, 'IQ' as country_iso2, 'Irak' as country_name union all
    select 'ISL' as country_code, 'IS' as country_iso2, 'Island' as country_name union all
    select 'ISR' as country_code, 'IL' as country_iso2, 'Israel' as country_name union all
    select 'ITA' as country_code, 'IT' as country_iso2, 'Italien' as country_name union all
    select 'JAM' as country_code, 'JM' as country_iso2, 'Jamaika' as country_name union all
    select 'JEY' as country_code, 'JE' as country_iso2, 'Jersey' as country_name union all
    select 'JOR' as country_code, 'JO' as country_iso2, 'Jordanien' as country_name union all
    select 'JPN' as country_code, 'JP' as country_iso2, 'Japan' as country_name union all
    select 'KAZ' as country_code, 'KZ' as country_iso2, 'Kasachstan' as country_name union all
    select 'KEN' as country_code, 'KE' as country_iso2, 'Kenia' as country_name union all
    select 'KGZ' as country_code, 'KG' as country_iso2, 'Kirgisistan' as country_name union all
    select 'KHM' as country_code, 'KH' as country_iso2, 'Kambodscha' as country_name union all
    select 'KIR' as country_code, 'KI' as country_iso2, 'Kiribati' as country_name union all
    select 'KNA' as country_code, 'KN' as country_iso2, 'St. Kitts und Nevis' as country_name union all
    select 'KOR' as country_code, 'KR' as country_iso2, 'Südkorea' as country_name union all
    select 'KWT' as country_code, 'KW' as country_iso2, 'Kuwait' as country_name union all
    select 'LAO' as country_code, 'LA' as country_iso2, 'Laos' as country_name union all
    select 'LBN' as country_code, 'LB' as country_iso2, 'Libanon' as country_name union all
    select 'LBR' as country_code, 'LR' as country_iso2, 'Liberia' as country_name union all
    select 'LBY' as country_code, 'LY' as country_iso2, 'Libyen' as country_name union all
    select 'LCA' as country_code, 'LC' as country_iso2, 'St. Lucia' as country_name union all
    select 'LIE' as country_code, 'LI' as country_iso2, 'Liechtenstein' as country_name union all
    select 'LKA' as country_code, 'LK' as country_iso2, 'Sri Lanka' as country_name union all
    select 'LSO' as country_code, 'LS' as country_iso2, 'Lesotho' as country_name union all
    select 'LTU' as country_code, 'LT' as country_iso2, 'Litauen' as country_name union all
    select 'LUX' as country_code, 'LU' as country_iso2, 'Luxemburg' as country_name union all
    select 'LVA' as country_code, 'LV' as country_iso2, 'Lettland' as country_name union all
    select 'MAC' as country_code, 'MO' as country_iso2, 'Macau' as country_name union all
    select 'MAF' as country_code, 'MF' as country_iso2, 'Saint-Martin' as country_name union all
    select 'MAR' as country_code, 'MA' as country_iso2, 'Marokko' as country_name union all
    select 'MCO' as country_code, 'MC' as country_iso2, 'Monaco' as country_name union all
    select 'MDA' as country_code, 'MD' as country_iso2, 'Republik Moldau' as country_name union all
    select 'MDG' as country_code, 'MG' as country_iso2, 'Madagaskar' as country_name union all
    select 'MDV' as country_code, 'MV' as country_iso2, 'Malediven' as country_name union all
    select 'MEX' as country_code, 'MX' as country_iso2, 'Mexiko' as country_name union all
    select 'MHL' as country_code, 'MH' as country_iso2, 'Marshallinseln' as country_name union all
    select 'MKD' as country_code, 'MK' as country_iso2, 'Nordmazedonien' as country_name union all
    select 'MLI' as country_code, 'ML' as country_iso2, 'Mali' as country_name union all
    select 'MLT' as country_code, 'MT' as country_iso2, 'Malta' as country_name union all
    select 'MMR' as country_code, 'MM' as country_iso2, 'Myanmar' as country_name union all
    select 'MNE' as country_code, 'ME' as country_iso2, 'Montenegro' as country_name union all
    select 'MNG' as country_code, 'MN' as country_iso2, 'Mongolei' as country_name union all
    select 'MNP' as country_code, 'MP' as country_iso2, 'Nördliche Marianen' as country_name union all
    select 'MOZ' as country_code, 'MZ' as country_iso2, 'Mosambik' as country_name union all
    select 'MRT' as country_code, 'MR' as country_iso2, 'Mauretanien' as country_name union all
    select 'MSR' as country_code, 'MS' as country_iso2, 'Montserrat' as country_name union all
    select 'MTQ' as country_code, 'MQ' as country_iso2, 'Martinique' as country_name union all
    select 'MUS' as country_code, 'MU' as country_iso2, 'Mauritius' as country_name union all
    select 'MWI' as country_code, 'MW' as country_iso2, 'Malawi' as country_name union all
    select 'MYS' as country_code, 'MY' as country_iso2, 'Malaysia' as country_name union all
    select 'MYT' as country_code, 'YT' as country_iso2, 'Mayotte' as country_name union all
    select 'NAM' as country_code, 'NA' as country_iso2, 'Namibia' as country_name union all
    select 'NCL' as country_code, 'NC' as country_iso2, 'Neukaledonien' as country_name union all
    select 'NER' as country_code, 'NE' as country_iso2, 'Niger' as country_name union all
    select 'NFK' as country_code, 'NF' as country_iso2, 'Norfolkinsel' as country_name union all
    select 'NGA' as country_code, 'NG' as country_iso2, 'Nigeria' as country_name union all
    select 'NIC' as country_code, 'NI' as country_iso2, 'Nicaragua' as country_name union all
    select 'NIU' as country_code, 'NU' as country_iso2, 'Niue' as country_name union all
    select 'NLD' as country_code, 'NL' as country_iso2, 'Niederlande' as country_name union all
    select 'NOR' as country_code, 'NO' as country_iso2, 'Norwegen' as country_name union all
    select 'NPL' as country_code, 'NP' as country_iso2, 'Nepal' as country_name union all
    select 'NRU' as country_code, 'NR' as country_iso2, 'Nauru' as country_name union all
    select 'NZL' as country_code, 'NZ' as country_iso2, 'Neuseeland' as country_name union all
    select 'OMN' as country_code, 'OM' as country_iso2, 'Oman' as country_name union all
    select 'PAK' as country_code, 'PK' as country_iso2, 'Pakistan' as country_name union all
    select 'PAN' as country_code, 'PA' as country_iso2, 'Panama' as country_name union all
    select 'PCN' as country_code, 'PN' as country_iso2, 'Pitcairninseln' as country_name union all
    select 'PER' as country_code, 'PE' as country_iso2, 'Peru' as country_name union all
    select 'PHL' as country_code, 'PH' as country_iso2, 'Philippinen' as country_name union all
    select 'PLW' as country_code, 'PW' as country_iso2, 'Palau' as country_name union all
    select 'PNG' as country_code, 'PG' as country_iso2, 'Papua-Neuguinea' as country_name union all
    select 'POL' as country_code, 'PL' as country_iso2, 'Polen' as country_name union all
    select 'PRI' as country_code, 'PR' as country_iso2, 'Puerto Rico' as country_name union all
    select 'PRK' as country_code, 'KP' as country_iso2, 'Nordkorea' as country_name union all
    select 'PRT' as country_code, 'PT' as country_iso2, 'Portugal' as country_name union all
    select 'PRY' as country_code, 'PY' as country_iso2, 'Paraguay' as country_name union all
    select 'PSE' as country_code, 'PS' as country_iso2, 'Palästina' as country_name union all
    select 'PYF' as country_code, 'PF' as country_iso2, 'Französisch-Polynesien' as country_name union all
    select 'QAT' as country_code, 'QA' as country_iso2, 'Katar' as country_name union all
    select 'REU' as country_code, 'RE' as country_iso2, 'Réunion' as country_name union all
    select 'ROU' as country_code, 'RO' as country_iso2, 'Rumänien' as country_name union all
    select 'RUS' as country_code, 'RU' as country_iso2, 'Russland' as country_name union all
    select 'RWA' as country_code, 'RW' as country_iso2, 'Ruanda' as country_name union all
    select 'SAU' as country_code, 'SA' as country_iso2, 'Saudi-Arabien' as country_name union all
    select 'SDN' as country_code, 'SD' as country_iso2, 'Sudan' as country_name union all
    select 'SEN' as country_code, 'SN' as country_iso2, 'Senegal' as country_name union all
    select 'SGP' as country_code, 'SG' as country_iso2, 'Singapur' as country_name union all
    select 'SGS' as country_code, 'GS' as country_iso2, 'Südgeorgien und Südliche Sandwichinseln' as country_name union all
    select 'SHN' as country_code, 'SH' as country_iso2, 'St. Helena' as country_name union all
    select 'SJM' as country_code, 'SJ' as country_iso2, 'Svalbard und Jan Mayen' as country_name union all
    select 'SLB' as country_code, 'SB' as country_iso2, 'Salomonen' as country_name union all
    select 'SLE' as country_code, 'SL' as country_iso2, 'Sierra Leone' as country_name union all
    select 'SLV' as country_code, 'SV' as country_iso2, 'El Salvador' as country_name union all
    select 'SMR' as country_code, 'SM' as country_iso2, 'San Marino' as country_name union all
    select 'SOM' as country_code, 'SO' as country_iso2, 'Somalia' as country_name union all
    select 'SPM' as country_code, 'PM' as country_iso2, 'Saint-Pierre und Miquelon' as country_name union all
    select 'SRB' as country_code, 'RS' as country_iso2, 'Serbien' as country_name union all
    select 'SSD' as country_code, 'SS' as country_iso2, 'Südsudan' as country_name union all
    select 'STP' as country_code, 'ST' as country_iso2, 'São Tomé und Príncipe' as country_name union all
    select 'SUR' as country_code, 'SR' as country_iso2, 'Suriname' as country_name union all
    select 'SVK' as country_code, 'SK' as country_iso2, 'Slowakei' as country_name union all
    select 'SVN' as country_code, 'SI' as country_iso2, 'Slowenien' as country_name union all
    select 'SWE' as country_code, 'SE' as country_iso2, 'Schweden' as country_name union all
    select 'SWZ' as country_code, 'SZ' as country_iso2, 'Eswatini' as country_name union all
    select 'SXM' as country_code, 'SX' as country_iso2, 'Sint Maarten' as country_name union all
    select 'SYC' as country_code, 'SC' as country_iso2, 'Seychellen' as country_name union all
    select 'SYR' as country_code, 'SY' as country_iso2, 'Syrien' as country_name union all
    select 'TCA' as country_code, 'TC' as country_iso2, 'Turks- und Caicosinseln' as country_name union all
    select 'TCD' as country_code, 'TD' as country_iso2, 'Tschad' as country_name union all
    select 'TGO' as country_code, 'TG' as country_iso2, 'Togo' as country_name union all
    select 'THA' as country_code, 'TH' as country_iso2, 'Thailand' as country_name union all
    select 'TJK' as country_code, 'TJ' as country_iso2, 'Tadschikistan' as country_name union all
    select 'TKL' as country_code, 'TK' as country_iso2, 'Tokelau' as country_name union all
    select 'TKM' as country_code, 'TM' as country_iso2, 'Turkmenistan' as country_name union all
    select 'TLS' as country_code, 'TL' as country_iso2, 'Osttimor' as country_name union all
    select 'TON' as country_code, 'TO' as country_iso2, 'Tonga' as country_name union all
    select 'TTO' as country_code, 'TT' as country_iso2, 'Trinidad und Tobago' as country_name union all
    select 'TUN' as country_code, 'TN' as country_iso2, 'Tunesien' as country_name union all
    select 'TUR' as country_code, 'TR' as country_iso2, 'Türkei' as country_name union all
    select 'TUV' as country_code, 'TV' as country_iso2, 'Tuvalu' as country_name union all
    select 'TWN' as country_code, 'TW' as country_iso2, 'Taiwan' as country_name union all
    select 'TZA' as country_code, 'TZ' as country_iso2, 'Tansania' as country_name union all
    select 'UGA' as country_code, 'UG' as country_iso2, 'Uganda' as country_name union all
    select 'UKR' as country_code, 'UA' as country_iso2, 'Ukraine' as country_name union all
    select 'UMI' as country_code, 'UM' as country_iso2, 'United States Minor Outlying Islands' as country_name union all
    select 'URY' as country_code, 'UY' as country_iso2, 'Uruguay' as country_name union all
    select 'USA' as country_code, 'US' as country_iso2, 'Vereinigte Staaten' as country_name union all
    select 'UZB' as country_code, 'UZ' as country_iso2, 'Usbekistan' as country_name union all
    select 'VAT' as country_code, 'VA' as country_iso2, 'Vatikanstadt' as country_name union all
    select 'VCT' as country_code, 'VC' as country_iso2, 'St. Vincent und die Grenadinen' as country_name union all
    select 'VEN' as country_code, 'VE' as country_iso2, 'Venezuela' as country_name union all
    select 'VGB' as country_code, 'VG' as country_iso2, 'Britische Jungferninseln' as country_name union all
    select 'VIR' as country_code, 'VI' as country_iso2, 'Amerikanische Jungferninseln' as country_name union all
    select 'VNM' as country_code, 'VN' as country_iso2, 'Vietnam' as country_name union all
    select 'VUT' as country_code, 'VU' as country_iso2, 'Vanuatu' as country_name union all
    select 'WLF' as country_code, 'WF' as country_iso2, 'Wallis und Futuna' as country_name union all
    select 'WSM' as country_code, 'WS' as country_iso2, 'Samoa' as country_name union all
    select 'YEM' as country_code, 'YE' as country_iso2, 'Jemen' as country_name union all
    select 'ZAF' as country_code, 'ZA' as country_iso2, 'Südafrika' as country_name union all
    select 'ZMB' as country_code, 'ZM' as country_iso2, 'Sambia' as country_name union all
    select 'ZWE' as country_code, 'ZW' as country_iso2, 'Simbabwe' as country_name
)

select
    country_code,
    country_name,
    country_iso2
from country_mapping