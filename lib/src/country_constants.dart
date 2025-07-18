const Map<String, String> subRegionToCountryCode = {
  "AC": "SH", // Ascension Island → Saint Helena
  "AN": "NL", // Caribbean Netherlands  → Netherlands
  "BU": "MM", // Burma → Myanmar
  "CP": "FR", // Clipperton Island → France
  "CS": "RS", // Serbia and Montenegro → Serbia
  "DG": "IO", // Diego Garcia → British Indian Ocean Territory
  "EA": "ES", // Ceuta and Melilla → Spain
  "HV": "BF", // Upper Volta → Burkina Faso
  "IC": "ES", // Canary Islands → Spain
  "RH": "ZW", // Southern Rhodesia → Zimbabwe
  "TA": "SH", // Tristan da Cunha → Saint Helena
  "TP": "TL", // East Timor → Timor-Leste
  "YD": "YE", // Democratic Yemen → Yemen
  "YU": "RS", // Yugoslavia → Serbia
  "ZR": "CD", // Zaire → Democratic Republic of the Congo
};

const kAlpha2ToCountryMap = <String, Map<String, String>>{
  'AF': {
    'name': 'Afghanistan',
    'alpha2_code': 'AF',
    'alpha3_code': 'AFG',
    'dial_code': '+93',
    'country_code': 'fa_AF',
  },
  'AL': {
    'name': 'Albania',
    'alpha2_code': 'AL',
    'dial_code': '+355',
    'country_code': 'sq_AL',
    'alpha3_code': 'ALB',
  },
  'DZ': {
    'name': 'Algeria',
    'alpha2_code': 'DZ',
    'dial_code': '+213',
    'country_code': 'ar_DZ',
    'alpha3_code': 'DZA',
  },
  'AS': {
    'name': 'American Samoa',
    'alpha2_code': 'AS',
    'alpha3_code': 'ASM',
    'dial_code': '+1684',
    'country_code': 'en_AS',
  },
  'AD': {
    'name': 'Andorra',
    'alpha2_code': 'AD',
    'alpha3_code': 'AND',
    'dial_code': '+376',
    'country_code': 'ca_AD',
  },
  'AO': {
    'name': 'Angola',
    'alpha2_code': 'AO',
    'alpha3_code': 'AGO',
    'dial_code': '+244',
    'country_code': 'pt_AO',
  },
  'AI': {
    'name': 'Anguilla',
    'alpha2_code': 'AI',
    'alpha3_code': 'AIA',
    'dial_code': '+1264',
    'country_code': 'en_AI',
  },
  'AQ': {
    'name': 'Antarctica',
    'alpha2_code': 'AQ',
    'alpha3_code': 'ATA',
    'dial_code': '+672',
    'country_code': 'en_AQ',
  },
  'AG': {
    'name': 'Antigua and Barbuda',
    'alpha2_code': 'AG',
    'alpha3_code': 'ATG',
    'dial_code': '+1268',
    'country_code': 'en_AG',
  },
  'AR': {
    'name': 'Argentina',
    'alpha2_code': 'AR',
    'dial_code': '+54',
    'country_code': 'es_AR',
    'alpha3_code': 'ARG',
  },
  'AM': {
    'name': 'Armenia',
    'alpha2_code': 'AM',
    'dial_code': '+374',
    'country_code': 'hy_AM',
    'alpha3_code': 'ARM',
  },
  'AW': {
    'name': 'Aruba',
    'alpha2_code': 'AW',
    'dial_code': '+297',
    'country_code': 'nl_AW',
    'alpha3_code': 'ABW',
  },
  'AU': {
    'name': 'Australia',
    'alpha2_code': 'AU',
    'alpha3_code': 'AUS',
    'dial_code': '+61',
    'country_code': 'en_AU',
  },
  'AT': {
    'name': 'Austria',
    'alpha2_code': 'AT',
    'alpha3_code': 'AUT',
    'dial_code': '+43',
    'country_code': 'de_AT',
  },
  'AZ': {
    'name': 'Azerbaijan',
    'alpha2_code': 'AZ',
    'dial_code': '+994',
    'country_code': 'az_AZ',
    'alpha3_code': 'AZE',
  },
  'BS': {
    'name': 'Bahamas',
    'alpha2_code': 'BS',
    'alpha3_code': 'BHS',
    'dial_code': '+1242',
    'country_code': 'en_BS',
  },
  'BH': {
    'name': 'Bahrain',
    'alpha2_code': 'BH',
    'alpha3_code': 'BHR',
    'dial_code': '+973',
    'country_code': 'ar_BH',
  },
  'BD': {
    'name': 'Bangladesh',
    'alpha2_code': 'BD',
    'alpha3_code': 'BGD',
    'dial_code': '+880',
    'country_code': 'bn_BD',
  },
  'BB': {
    'name': 'Barbados',
    'alpha2_code': 'BB',
    'alpha3_code': 'BRB',
    'dial_code': '+1246',
    'country_code': 'en_BB',
  },
  'BY': {
    'name': 'Belarus',
    'alpha2_code': 'BY',
    'alpha3_code': 'BLR',
    'dial_code': '+375',
    'country_code': 'be_BY',
  },
  'BE': {
    'name': 'Belgium',
    'alpha2_code': 'BE',
    'dial_code': '+32',
    'country_code': 'nl_BE',
    'alpha3_code': 'BEL',
  },
  'BZ': {
    'name': 'Belize',
    'alpha2_code': 'BZ',
    'alpha3_code': 'BLZ',
    'dial_code': '+501',
    'country_code': 'en_BZ',
  },
  'BJ': {
    'name': 'Benin',
    'alpha2_code': 'BJ',
    'alpha3_code': 'BEN',
    'dial_code': '+229',
    'country_code': 'fr_BJ',
  },
  'BM': {
    'name': 'Bermuda',
    'alpha2_code': 'BM',
    'alpha3_code': 'BMU',
    'dial_code': '+1441',
    'country_code': 'en_BM',
  },
  'BT': {
    'name': 'Bhutan',
    'alpha2_code': 'BT',
    'alpha3_code': 'BTN',
    'dial_code': '+975',
    'country_code': 'dz_BT',
  },
  'BO': {
    'name': 'Bolivia (Plurinational State of)',
    'alpha2_code': 'BO',
    'alpha3_code': 'BOL',
    'dial_code': '+591',
    'country_code': 'es_BO',
  },
  'BQ': {
    'name': 'Bonaire, Sint Eustatius and Saba',
    'alpha2_code': 'BQ',
    'alpha3_code': 'BES',
    'dial_code': '+5997',
    'country_code': 'nl_BQ',
  },
  'BA': {
    'name': 'Bosnia and Herzegovina',
    'alpha2_code': 'BA',
    'alpha3_code': 'BIH',
    'dial_code': '+387',
    'country_code': 'bs_BA',
  },
  'BW': {
    'name': 'Botswana',
    'alpha2_code': 'BW',
    'alpha3_code': 'BWA',
    'dial_code': '+267',
    'country_code': 'en_BW',
  },
  'BV': {
    'name': 'Bouvet Island',
    'alpha2_code': 'BV',
    'dial_code': '+47',
    'country_code': 'no_NB',
    'alpha3_code': 'BVT',
  },
  'BR': {
    'name': 'Brazil',
    'alpha2_code': 'BR',
    'alpha3_code': 'BRA',
    'dial_code': '+55',
    'country_code': 'pt_BR',
  },
  'IO': {
    'name': 'British Indian Ocean Territory',
    'alpha2_code': 'IO',
    'alpha3_code': 'IOT',
    'dial_code': '+246',
    'country_code': 'en_IO',
  },
  'BN': {
    'name': 'Brunei Darussalam',
    'alpha2_code': 'BN',
    'alpha3_code': 'BRN',
    'dial_code': '+673',
    'country_code': 'ms_BN',
  },
  'BG': {
    'name': 'Bulgaria',
    'alpha2_code': 'BG',
    'alpha3_code': 'BGR',
    'dial_code': '+359',
    'country_code': 'bg_BG',
  },
  'BF': {
    'name': 'Burkina Faso',
    'alpha2_code': 'BF',
    'alpha3_code': 'BFA',
    'dial_code': '+226',
    'country_code': 'fr_BF',
  },
  'BI': {
    'name': 'Burundi',
    'alpha2_code': 'BI',
    'alpha3_code': 'BDI',
    'dial_code': '+257',
    'country_code': 'fr_BI',
  },
  'CV': {
    'name': 'Cabo Verde',
    'alpha2_code': 'CV',
    'alpha3_code': 'CPV',
    'dial_code': '+238',
    'country_code': 'pt_CV',
  },
  'KH': {
    'name': 'Cambodia',
    'alpha2_code': 'KH',
    'dial_code': '+855',
    'country_code': 'km_KH',
    'alpha3_code': 'KHM',
  },
  'CM': {
    'name': 'Cameroon',
    'alpha2_code': 'CM',
    'dial_code': '+237',
    'country_code': 'en_CM',
    'alpha3_code': 'CMR',
  },
  'CA': {
    'name': 'Canada',
    'alpha2_code': 'CA',
    'alpha3_code': 'CAN',
    'dial_code': '+1',
    'country_code': 'en_CA',
  },
  'KY': {
    'name': 'Cayman Islands',
    'alpha2_code': 'KY',
    'alpha3_code': 'CYM',
    'dial_code': '+1345',
    'country_code': 'en_KY',
  },
  'CF': {
    'name': 'Central African Republic',
    'alpha2_code': 'CF',
    'alpha3_code': 'CAF',
    'dial_code': '+236',
    'country_code': 'fr_CF',
  },
  'TD': {
    'name': 'Chad',
    'alpha2_code': 'TD',
    'dial_code': '+235',
    'country_code': 'fr_TD',
    'alpha3_code': 'TCD',
  },
  'CL': {
    'name': 'Chile',
    'alpha2_code': 'CL',
    'alpha3_code': 'CHL',
    'dial_code': '+56',
    'country_code': 'es_CL',
  },
  'CN': {
    'name': 'China',
    'alpha2_code': 'CN',
    'alpha3_code': 'CHN',
    'dial_code': '+86',
    'country_code': 'zh_CN',
  },
  'CX': {
    'name': 'Christmas Island',
    'alpha2_code': 'CX',
    'alpha3_code': 'CXR',
    'dial_code': '+61',
    'country_code': 'en_CX',
  },
  'CC': {
    'name': 'Cocos (Keeling) Islands',
    'alpha2_code': 'CC',
    'alpha3_code': 'CCK',
    'dial_code': '+61',
    'country_code': 'en_CC',
  },
  'CO': {
    'name': 'Colombia',
    'alpha2_code': 'CO',
    'alpha3_code': 'COL',
    'dial_code': '+57',
    'country_code': 'es_CO',
  },
  'KM': {
    'name': 'Comoros',
    'alpha2_code': 'KM',
    'alpha3_code': 'COM',
    'dial_code': '+269',
    'country_code': 'ar_KM',
  },
  'CG': {
    'name': 'Congo',
    'alpha2_code': 'CG',
    'alpha3_code': 'COG',
    'dial_code': '+242',
    'country_code': 'fr_CG',
  },
  'CD': {
    'name': 'Congo (Democratic Republic of the)',
    'alpha2_code': 'CD',
    'dial_code': '+243',
    'country_code': 'fr_CD',
    'alpha3_code': 'COD',
  },
  'CK': {
    'name': 'Cook Islands',
    'alpha2_code': 'CK',
    'alpha3_code': 'COK',
    'dial_code': '+682',
    'country_code': 'en_CK',
  },
  'CR': {
    'name': 'Costa Rica',
    'alpha2_code': 'CR',
    'alpha3_code': 'CRI',
    'dial_code': '+506',
    'country_code': 'es_CR',
  },
  'HR': {
    'name': 'Croatia',
    'alpha2_code': 'HR',
    'alpha3_code': 'HRV',
    'dial_code': '+385',
    'country_code': 'hr_HR',
  },
  'CU': {
    'name': 'Cuba',
    'alpha2_code': 'CU',
    'alpha3_code': 'CUB',
    'dial_code': '+53',
    'country_code': 'es_CU',
  },
  'CW': {
    'name': 'Curaçao',
    'alpha2_code': 'CW',
    'alpha3_code': 'CUW',
    'dial_code': '+599',
    'country_code': 'nl_CW',
  },
  'CY': {
    'name': 'Cyprus',
    'alpha2_code': 'CY',
    'dial_code': '+357',
    'country_code': 'el_CY',
    'alpha3_code': 'CYP',
  },
  'CZ': {
    'name': 'Czech Republic',
    'alpha2_code': 'CZ',
    'dial_code': '+420',
    'country_code': 'cs_CZ',
    'alpha3_code': 'CZE',
  },
  'DK': {
    'name': 'Denmark',
    'alpha2_code': 'DK',
    'alpha3_code': 'DNK',
    'dial_code': '+45',
    'country_code': 'da_DK',
  },
  'DJ': {
    'name': 'Djibouti',
    'alpha2_code': 'DJ',
    'alpha3_code': 'DJI',
    'dial_code': '+253',
    'country_code': 'fr_DJ',
  },
  'DM': {
    'name': 'Dominica',
    'alpha2_code': 'DM',
    'alpha3_code': 'DMA',
    'dial_code': '+1767',
    'country_code': 'en_DM',
  },
  'DO': {
    'name': 'Dominican Republic',
    'alpha2_code': 'DO',
    'alpha3_code': 'DOM',
    'dial_code': '+1809',
    'country_code': 'es_DO',
  },
  'EC': {
    'name': 'Ecuador',
    'alpha2_code': 'EC',
    'dial_code': '+593',
    'country_code': 'es_EC',
    'alpha3_code': 'ECU',
  },
  'EG': {
    'name': 'Egypt',
    'alpha2_code': 'EG',
    'alpha3_code': 'EGY',
    'dial_code': '+20',
    'country_code': 'ar_EG',
  },
  'SV': {
    'name': 'El Salvador',
    'alpha2_code': 'SV',
    'alpha3_code': 'SLV',
    'dial_code': '+503',
    'country_code': 'es_SV',
  },
  'GQ': {
    'name': 'Equatorial Guinea',
    'alpha2_code': 'GQ',
    'dial_code': '+240',
    'country_code': 'es_GQ',
    'alpha3_code': 'GNQ',
  },
  'ER': {
    'name': 'Eritrea',
    'alpha2_code': 'ER',
    'alpha3_code': 'ERI',
    'dial_code': '+291',
    'country_code': 'ti_ER',
  },
  'EE': {
    'name': 'Estonia',
    'alpha2_code': 'EE',
    'dial_code': '+372',
    'country_code': 'et_EE',
    'alpha3_code': 'EST',
  },
  'ET': {
    'name': 'Ethiopia',
    'alpha2_code': 'ET',
    'dial_code': '+251',
    'country_code': 'am_ET',
    'alpha3_code': 'ETH',
  },
  'FK': {
    'name': 'Falkland Islands (Malvinas)',
    'alpha2_code': 'FK',
    'alpha3_code': 'FLK',
    'dial_code': '+500',
    'country_code': 'en_FK',
  },
  'FO': {
    'name': 'Faroe Islands',
    'alpha2_code': 'FO',
    'alpha3_code': 'FRO',
    'dial_code': '+298',
    'country_code': 'fo_FO',
  },
  'FJ': {
    'name': 'Fiji',
    'alpha2_code': 'FJ',
    'alpha3_code': 'FJI',
    'dial_code': '+679',
    'country_code': 'en_FJ',
  },
  'FI': {
    'name': 'Finland',
    'alpha2_code': 'FI',
    'alpha3_code': 'FIN',
    'dial_code': '+358',
    'country_code': 'fi_FI',
  },
  'FR': {
    'name': 'France',
    'alpha2_code': 'FR',
    'alpha3_code': 'FRA',
    'dial_code': '+33',
    'country_code': 'fr_FR',
  },
  'GF': {
    'name': 'French Guiana',
    'alpha2_code': 'GF',
    'dial_code': '+594',
    'country_code': 'fr_GF',
    'alpha3_code': 'GUF',
  },
  'PF': {
    'name': 'French Polynesia',
    'alpha2_code': 'PF',
    'dial_code': '+689',
    'country_code': 'fr_PF',
    'alpha3_code': 'PYF',
  },
  'TF': {
    'name': 'French Southern Territories',
    'alpha2_code': 'TF',
    'dial_code': '+262',
    'country_code': 'fr_TF',
    'alpha3_code': 'ATF',
  },
  'GA': {
    'name': 'Gabon',
    'alpha2_code': 'GA',
    'dial_code': '+241',
    'country_code': 'fr_GA',
    'alpha3_code': 'GAB',
  },
  'GM': {
    'name': 'Gambia',
    'alpha2_code': 'GM',
    'alpha3_code': 'GMB',
    'dial_code': '+220',
    'country_code': 'en_GM',
  },
  'GE': {
    'name': 'Georgia',
    'alpha2_code': 'GE',
    'alpha3_code': 'GEO',
    'dial_code': '+995',
    'country_code': 'ka_GE',
  },
  'DE': {
    'name': 'Germany',
    'alpha2_code': 'DE',
    'alpha3_code': 'DEU',
    'dial_code': '+49',
    'country_code': 'de_DE',
  },
  'GH': {
    'name': 'Ghana',
    'alpha2_code': 'GH',
    'alpha3_code': 'GHA',
    'dial_code': '+233',
    'country_code': 'en_GH',
  },
  'GI': {
    'name': 'Gibraltar',
    'alpha2_code': 'GI',
    'dial_code': '+350',
    'country_code': 'en_GI',
    'alpha3_code': 'GIB',
  },
  'GR': {
    'name': 'Greece',
    'alpha2_code': 'GR',
    'alpha3_code': 'GRC',
    'dial_code': '+30',
    'country_code': 'el_GR',
  },
  'GL': {
    'name': 'Greenland',
    'alpha2_code': 'GL',
    'alpha3_code': 'GRL',
    'dial_code': '+299',
    'country_code': 'kl_GL',
  },
  'GD': {
    'name': 'Grenada',
    'alpha2_code': 'GD',
    'alpha3_code': 'GRD',
    'dial_code': '+1473',
    'country_code': 'en_GD',
  },
  'GP': {
    'name': 'Guadeloupe',
    'alpha2_code': 'GP',
    'alpha3_code': 'GLP',
    'dial_code': '+590',
    'country_code': 'fr_GP',
  },
  'GU': {
    'name': 'Guam',
    'alpha2_code': 'GU',
    'alpha3_code': 'GUM',
    'dial_code': '+1671',
    'country_code': 'en_GU',
  },
  'GT': {
    'name': 'Guatemala',
    'alpha2_code': 'GT',
    'alpha3_code': 'GTM',
    'dial_code': '+502',
    'country_code': 'es_GT',
  },
  'GG': {
    'name': 'Guernsey',
    'alpha2_code': 'GG',
    'dial_code': '+44',
    'country_code': 'en_GG',
    'alpha3_code': 'GGY',
  },
  'GN': {
    'name': 'Guinea',
    'alpha2_code': 'GN',
    'alpha3_code': 'GIN',
    'dial_code': '+224',
    'country_code': 'fr_GN',
  },
  'GW': {
    'name': 'Guinea-Bissau',
    'alpha2_code': 'GW',
    'alpha3_code': 'GNB',
    'dial_code': '+245',
    'country_code': 'pt_GW',
  },
  'GY': {
    'name': 'Guyana',
    'alpha2_code': 'GY',
    'dial_code': '+592',
    'country_code': 'en_GY',
    'alpha3_code': 'GUY',
  },
  'HT': {
    'name': 'Haiti',
    'alpha2_code': 'HT',
    'alpha3_code': 'HTI',
    'dial_code': '+509',
    'country_code': 'fr_HT',
  },
  'HM': {
    'name': 'Heard Island and McDonald Islands',
    'alpha2_code': 'HM',
    'alpha3_code': 'HMD',
    'dial_code': '+672',
    'country_code': 'en_HM',
  },
  'VA': {
    'name': 'Holy See',
    'alpha2_code': 'VA',
    'alpha3_code': 'VAT',
    'dial_code': '+379',
    'country_code': 'la_VA',
  },
  'HN': {
    'name': 'Honduras',
    'alpha2_code': 'HN',
    'dial_code': '+504',
    'country_code': 'es_HN',
    'alpha3_code': 'HND',
  },
  'HK': {
    'name': 'Hong Kong',
    'alpha2_code': 'HK',
    'alpha3_code': 'HKG',
    'dial_code': '+852',
    'country_code': 'zh_HK',
  },
  'HU': {
    'name': 'Hungary',
    'alpha2_code': 'HU',
    'alpha3_code': 'HUN',
    'dial_code': '+36',
    'country_code': 'hu_HU',
  },
  'IS': {
    'name': 'Iceland',
    'alpha2_code': 'IS',
    'alpha3_code': 'ISL',
    'dial_code': '+354',
    'country_code': 'is_IS',
  },
  'IN': {
    'name': 'India',
    'alpha2_code': 'IN',
    'alpha3_code': 'IND',
    'dial_code': '+91',
    'country_code': 'hi_IN',
  },
  'ID': {
    'name': 'Indonesia',
    'alpha2_code': 'ID',
    'alpha3_code': 'IDN',
    'dial_code': '+62',
    'country_code': 'id_ID',
  },
  'CI': {
    'name': "Côte d'Ivoire",
    'alpha2_code': 'CI',
    'alpha3_code': 'CIV',
    'dial_code': '+225',
    'country_code': 'fr_CI',
  },
  'IR': {
    'name': 'Iran (Islamic Republic of)',
    'alpha2_code': 'IR',
    'dial_code': '+98',
    'country_code': 'fa_IR',
    'alpha3_code': 'IRN',
  },
  'IQ': {
    'name': 'Iraq',
    'alpha2_code': 'IQ',
    'alpha3_code': 'IRQ',
    'dial_code': '+964',
    'country_code': 'ar_IQ',
  },
  'IE': {
    'name': 'Ireland',
    'alpha2_code': 'IE',
    'dial_code': '+353',
    'country_code': 'en_IE',
    'alpha3_code': 'IRL',
  },
  'IM': {
    'name': 'Isle of Man',
    'alpha2_code': 'IM',
    'dial_code': '+44',
    'country_code': 'en_IM',
    'alpha3_code': 'IMN',
  },
  'IL': {
    'name': 'Israel',
    'alpha2_code': 'IL',
    'alpha3_code': 'ISR',
    'dial_code': '+972',
    'country_code': 'he_IL',
  },
  'IT': {
    'name': 'Italy',
    'alpha2_code': 'IT',
    'alpha3_code': 'ITA',
    'dial_code': '+39',
    'country_code': 'it_IT',
  },
  'JM': {
    'name': 'Jamaica',
    'alpha2_code': 'JM',
    'dial_code': '+1876',
    'country_code': 'en_JM',
    'alpha3_code': 'JAM',
  },
  'JP': {
    'name': 'Japan',
    'alpha2_code': 'JP',
    'dial_code': '+81',
    'country_code': 'ja_JP',
    'alpha3_code': 'JPN',
  },
  'JE': {
    'name': 'Jersey',
    'alpha2_code': 'JE',
    'dial_code': '+44',
    'country_code': 'en_JE',
    'alpha3_code': 'JEY',
  },
  'JO': {
    'name': 'Jordan',
    'alpha2_code': 'JO',
    'dial_code': '+962',
    'country_code': 'ar_JO',
    'alpha3_code': 'JOR',
  },
  'KZ': {
    'name': 'Kazakhstan',
    'alpha2_code': 'KZ',
    'alpha3_code': 'KAZ',
    'dial_code': '+7',
    'country_code': 'ru_KZ',
  },
  'KE': {
    'name': 'Kenya',
    'alpha2_code': 'KE',
    'dial_code': '+254',
    'country_code': 'sw_KE',
    'alpha3_code': 'KEN',
  },
  'KI': {
    'name': 'Kiribati',
    'alpha2_code': 'KI',
    'alpha3_code': 'KIR',
    'dial_code': '+686',
    'country_code': 'en_KI',
  },
  'KP': {
    'name': "Korea (Democratic People's Republic of)",
    'alpha2_code': 'KP',
    'alpha3_code': 'PRK',
    'dial_code': '+850',
    'country_code': 'ko_KP',
  },
  'KR': {
    'name': 'Korea (Republic of)',
    'alpha2_code': 'KR',
    'dial_code': '+82',
    'country_code': 'ko_KR',
    'alpha3_code': 'KOR',
  },
  'KW': {
    'name': 'Kuwait',
    'alpha2_code': 'KW',
    'alpha3_code': 'KWT',
    'dial_code': '+965',
    'country_code': 'ar_KW',
  },
  'KG': {
    'name': 'Kyrgyzstan',
    'alpha2_code': 'KG',
    'alpha3_code': 'KGZ',
    'dial_code': '+996',
    'country_code': 'ky_KG',
  },
  'LA': {
    'name': "Lao People's Democratic Republic",
    'alpha2_code': 'LA',
    'dial_code': '+856',
    'country_code': 'lo_LA',
    'alpha3_code': 'LAO',
  },
  'LV': {
    'name': 'Latvia',
    'alpha2_code': 'LV',
    'dial_code': '+371',
    'country_code': 'lv_LV',
    'alpha3_code': 'LVA',
  },
  'LB': {
    'name': 'Lebanon',
    'alpha2_code': 'LB',
    'alpha3_code': 'LBN',
    'dial_code': '+961',
    'country_code': 'ar_LB',
  },
  'LS': {
    'name': 'Lesotho',
    'alpha2_code': 'LS',
    'alpha3_code': 'LSO',
    'dial_code': '+266',
    'country_code': 'en_LS',
  },
  'LR': {
    'name': 'Liberia',
    'alpha2_code': 'LR',
    'alpha3_code': 'LBR',
    'dial_code': '+231',
    'country_code': 'en_LR',
  },
  'LY': {
    'name': 'Libya',
    'alpha2_code': 'LY',
    'alpha3_code': 'LBY',
    'dial_code': '+218',
    'country_code': 'ar_LY',
  },
  'LI': {
    'name': 'Liechtenstein',
    'alpha2_code': 'LI',
    'dial_code': '+423',
    'country_code': 'de_LI',
    'alpha3_code': 'LIE',
  },
  'LT': {
    'name': 'Lithuania',
    'alpha2_code': 'LT',
    'alpha3_code': 'LTU',
    'dial_code': '+370',
    'country_code': 'lt_LT',
  },
  'LU': {
    'name': 'Luxembourg',
    'alpha2_code': 'LU',
    'alpha3_code': 'LUX',
    'dial_code': '+352',
    'country_code': 'fr_LU',
  },
  'MO': {
    'name': 'Macao',
    'alpha2_code': 'MO',
    'alpha3_code': 'MAC',
    'dial_code': '+853',
    'country_code': 'zh_MO',
  },
  'MK': {
    'name': 'Macedonia (the former Yugoslav Republic of)',
    'alpha2_code': 'MK',
    'alpha3_code': 'MKD',
    'dial_code': '+389',
    'country_code': 'mk_MK',
  },
  'MG': {
    'name': 'Madagascar',
    'alpha2_code': 'MG',
    'alpha3_code': 'MDG',
    'dial_code': '+261',
    'country_code': 'fr_MG',
  },
  'MW': {
    'name': 'Malawi',
    'alpha2_code': 'MW',
    'alpha3_code': 'MWI',
    'dial_code': '+265',
    'country_code': 'en_MW',
  },
  'MY': {
    'name': 'Malaysia',
    'alpha2_code': 'MY',
    'alpha3_code': 'MYS',
    'dial_code': '+60',
    'country_code': 'ms_MY',
  },
  'MV': {
    'name': 'Maldives',
    'alpha2_code': 'MV',
    'alpha3_code': 'MDV',
    'dial_code': '+960',
    'country_code': 'dv_MV',
  },
  'ML': {
    'name': 'Mali',
    'alpha2_code': 'ML',
    'alpha3_code': 'MLI',
    'dial_code': '+223',
    'country_code': 'fr_ML',
  },
  'MT': {
    'name': 'Malta',
    'alpha2_code': 'MT',
    'alpha3_code': 'MLT',
    'dial_code': '+356',
    'country_code': 'mt_MT',
  },
  'MH': {
    'name': 'Marshall Islands',
    'alpha2_code': 'MH',
    'alpha3_code': 'MHL',
    'dial_code': '+692',
    'country_code': 'en_MH',
  },
  'MQ': {
    'name': 'Martinique',
    'alpha2_code': 'MQ',
    'alpha3_code': 'MTQ',
    'dial_code': '+596',
    'country_code': 'fr_MQ',
  },
  'MR': {
    'name': 'Mauritania',
    'alpha2_code': 'MR',
    'alpha3_code': 'MRT',
    'dial_code': '+222',
    'country_code': 'ar_MR',
  },
  'MU': {
    'name': 'Mauritius',
    'alpha2_code': 'MU',
    'alpha3_code': 'MUS',
    'dial_code': '+230',
    'country_code': 'en_MU',
  },
  'YT': {
    'name': 'Mayotte',
    'alpha2_code': 'YT',
    'alpha3_code': 'MYT',
    'dial_code': '+262',
    'country_code': 'fr_YT',
  },
  'MX': {
    'name': 'Mexico',
    'alpha2_code': 'MX',
    'dial_code': '+52',
    'country_code': 'es_MX',
    'alpha3_code': 'MEX',
  },
  'FM': {
    'name': 'Micronesia (Federated States of)',
    'alpha2_code': 'FM',
    'alpha3_code': 'FSM',
    'dial_code': '+691',
    'country_code': 'en_FM',
  },
  'MD': {
    'name': 'Moldova (Republic of)',
    'alpha2_code': 'MD',
    'dial_code': '+373',
    'country_code': 'ro_MD',
    'alpha3_code': 'MDA',
  },
  'MC': {
    'name': 'Monaco',
    'alpha2_code': 'MC',
    'alpha3_code': 'MCO',
    'dial_code': '+377',
    'country_code': 'fr_MC',
  },
  'MN': {
    'name': 'Mongolia',
    'alpha2_code': 'MN',
    'alpha3_code': 'MNG',
    'dial_code': '+976',
    'country_code': 'mn_MN',
  },
  'ME': {
    'name': 'Montenegro',
    'alpha2_code': 'ME',
    'alpha3_code': 'MNE',
    'dial_code': '+382',
    'country_code': 'sr_ME',
  },
  'MS': {
    'name': 'Montserrat',
    'alpha2_code': 'MS',
    'dial_code': '+1664',
    'country_code': 'en_MS',
    'alpha3_code': 'MSR',
  },
  'MA': {
    'name': 'Morocco',
    'alpha2_code': 'MA',
    'dial_code': '+212',
    'country_code': 'ar_MA',
    'alpha3_code': 'MAR',
  },
  'MZ': {
    'name': 'Mozambique',
    'alpha2_code': 'MZ',
    'dial_code': '+258',
    'country_code': 'pt_MZ',
    'alpha3_code': 'MOZ',
  },
  'MM': {
    'name': 'Myanmar',
    'alpha2_code': 'MM',
    'alpha3_code': 'MMR',
    'dial_code': '+95',
    'country_code': 'my_MM',
  },
  'NA': {
    'name': 'Namibia',
    'alpha2_code': 'NA',
    'alpha3_code': 'NAM',
    'dial_code': '+264',
    'country_code': 'en_NA',
  },
  'NR': {
    'name': 'Nauru',
    'alpha2_code': 'NR',
    'alpha3_code': 'NRU',
    'dial_code': '+674',
    'country_code': 'en_NR',
  },
  'NP': {
    'name': 'Nepal',
    'alpha2_code': 'NP',
    'alpha3_code': 'NPL',
    'dial_code': '+977',
    'country_code': 'ne_NP',
  },
  'NL': {
    'name': 'Netherlands',
    'alpha2_code': 'NL',
    'dial_code': '+31',
    'country_code': 'nl_NL',
    'alpha3_code': 'NLD',
  },
  'NC': {
    'name': 'New Caledonia',
    'alpha2_code': 'NC',
    'dial_code': '+687',
    'country_code': 'fr_NC',
    'alpha3_code': 'NCL',
  },
  'NZ': {
    'name': 'New Zealand',
    'alpha2_code': 'NZ',
    'alpha3_code': 'NZL',
    'dial_code': '+64',
    'country_code': 'en_NZ',
  },
  'NI': {
    'name': 'Nicaragua',
    'alpha2_code': 'NI',
    'alpha3_code': 'NIC',
    'dial_code': '+505',
    'country_code': 'es_NI',
  },
  'NE': {
    'name': 'Niger',
    'alpha2_code': 'NE',
    'alpha3_code': 'NER',
    'dial_code': '+227',
    'country_code': 'fr_NE',
  },
  'NG': {
    'name': 'Nigeria',
    'alpha2_code': 'NG',
    'alpha3_code': 'NGA',
    'dial_code': '+234',
    'country_code': 'en_NG',
  },
  'NU': {
    'name': 'Niue',
    'alpha2_code': 'NU',
    'dial_code': '+683',
    'country_code': 'en_NU',
    'alpha3_code': 'NIU',
  },
  'NF': {
    'name': 'Norfolk Island',
    'alpha2_code': 'NF',
    'dial_code': '+672',
    'country_code': 'en_NF',
    'alpha3_code': 'NFK',
  },
  'MP': {
    'name': 'Northern Mariana Islands',
    'alpha2_code': 'MP',
    'dial_code': '+1670',
    'country_code': 'en_MP',
    'alpha3_code': 'MNP',
  },
  'NO': {
    'name': 'Norway',
    'alpha2_code': 'NO',
    'alpha3_code': 'NOR',
    'dial_code': '+47',
    'country_code': 'no_NO',
  },
  'OM': {
    'name': 'Oman',
    'alpha2_code': 'OM',
    'alpha3_code': 'OMN',
    'dial_code': '+968',
    'country_code': 'ar_OM',
  },
  'PK': {
    'name': 'Pakistan',
    'alpha2_code': 'PK',
    'alpha3_code': 'PAK',
    'dial_code': '+92',
    'country_code': 'ur_PK',
  },
  'PW': {
    'name': 'Palau',
    'alpha2_code': 'PW',
    'dial_code': '+680',
    'country_code': 'en_PW',
    'alpha3_code': 'PLW',
  },
  'PS': {
    'name': 'Palestine, State of',
    'alpha2_code': 'PS',
    'alpha3_code': 'PSE',
    'dial_code': '+970',
    'country_code': 'ar_PS',
  },
  'PA': {
    'name': 'Panama',
    'alpha2_code': 'PA',
    'alpha3_code': 'PAN',
    'dial_code': '+507',
    'country_code': 'es_PA',
  },
  'PG': {
    'name': 'Papua New Guinea',
    'alpha2_code': 'PG',
    'alpha3_code': 'PNG',
    'dial_code': '+675',
    'country_code': 'en_PG',
  },
  'PY': {
    'name': 'Paraguay',
    'alpha2_code': 'PY',
    'alpha3_code': 'PRY',
    'dial_code': '+595',
    'country_code': 'es_PY',
  },
  'PE': {
    'name': 'Peru',
    'alpha2_code': 'PE',
    'alpha3_code': 'PER',
    'dial_code': '+51',
    'country_code': 'es_PE',
  },
  'PH': {
    'name': 'Philippines',
    'alpha2_code': 'PH',
    'alpha3_code': 'PHL',
    'dial_code': '+63',
    'country_code': 'en_PH',
  },
  'PN': {
    'name': 'Pitcairn',
    'alpha2_code': 'PN',
    'alpha3_code': 'PCN',
    'dial_code': '+64',
    'country_code': 'en_PN',
  },
  'PL': {
    'name': 'Poland',
    'alpha2_code': 'PL',
    'alpha3_code': 'POL',
    'dial_code': '+48',
    'country_code': 'pl_PL',
  },
  'PT': {
    'name': 'Portugal',
    'alpha2_code': 'PT',
    'alpha3_code': 'PRT',
    'dial_code': '+351',
    'country_code': 'pt_PT',
  },
  'PR': {
    'name': 'Puerto Rico',
    'alpha2_code': 'PR',
    'alpha3_code': 'PRI',
    'dial_code': '+1787',
    'country_code': 'es_PR',
  },
  'QA': {
    'name': 'Qatar',
    'alpha2_code': 'QA',
    'dial_code': '+974',
    'country_code': 'ar_QA',
    'alpha3_code': 'QAT',
  },
  'RE': {
    'name': 'Réunion',
    'alpha2_code': 'RE',
    'alpha3_code': 'REU',
    'dial_code': '+262',
    'country_code': 'fr_RE',
  },
  'RO': {
    'name': 'Romania',
    'alpha2_code': 'RO',
    'alpha3_code': 'ROU',
    'dial_code': '+40',
    'country_code': 'ro_RO',
  },
  'RU': {
    'name': 'Russian Federation',
    'alpha2_code': 'RU',
    'alpha3_code': 'RUS',
    'dial_code': '+7',
    'country_code': 'ru_RU',
  },
  'RW': {
    'name': 'Rwanda',
    'alpha2_code': 'RW',
    'alpha3_code': 'RWA',
    'dial_code': '+250',
    'country_code': 'rw_RW',
  },
  'BL': {
    'name': 'Saint Barthélemy',
    'alpha2_code': 'BL',
    'alpha3_code': 'BLM',
    'dial_code': '+590',
    'country_code': 'fr_BL',
  },
  'SH': {
    'name': 'Saint Helena, Ascension and Tristan da Cunha',
    'alpha2_code': 'SH',
    'alpha3_code': 'SHN',
    'dial_code': '+290',
    'country_code': 'en_SH',
  },
  'KN': {
    'name': 'Saint Kitts and Nevis',
    'alpha2_code': 'KN',
    'alpha3_code': 'KNA',
    'dial_code': '+1869',
    'country_code': 'en_KN',
  },
  'LC': {
    'name': 'Saint Lucia',
    'alpha2_code': 'LC',
    'dial_code': '+1758',
    'country_code': 'en_LC',
    'alpha3_code': 'LCA',
  },
  'MF': {
    'name': 'Saint Martin (French part)',
    'alpha2_code': 'MF',
    'alpha3_code': 'MAF',
    'dial_code': '+590',
    'country_code': 'fr_MF',
  },
  'PM': {
    'name': 'Saint Pierre and Miquelon',
    'alpha2_code': 'PM',
    'dial_code': '+508',
    'country_code': 'fr_PM',
    'alpha3_code': 'SPM',
  },
  'VC': {
    'name': 'Saint Vincent and the Grenadines',
    'alpha2_code': 'VC',
    'alpha3_code': 'VCT',
    'dial_code': '+1784',
    'country_code': 'en_VC',
  },
  'WS': {
    'name': 'Samoa',
    'alpha2_code': 'WS',
    'alpha3_code': 'WSM',
    'dial_code': '+685',
    'country_code': 'sm_WS',
  },
  'SM': {
    'name': 'San Marino',
    'alpha2_code': 'SM',
    'dial_code': '+378',
    'country_code': 'it_SM',
    'alpha3_code': 'SMR',
  },
  'ST': {
    'name': 'Sao Tome and Principe',
    'alpha2_code': 'ST',
    'dial_code': '+239',
    'country_code': 'pt_ST',
    'alpha3_code': 'STP',
  },
  'SA': {
    'name': 'Saudi Arabia',
    'alpha2_code': 'SA',
    'alpha3_code': 'SAU',
    'dial_code': '+966',
    'country_code': 'ar_SA',
  },
  'SN': {
    'name': 'Senegal',
    'alpha2_code': 'SN',
    'alpha3_code': 'SEN',
    'dial_code': '+221',
    'country_code': 'fr_SN',
  },
  'RS': {
    'name': 'Serbia',
    'alpha2_code': 'RS',
    'alpha3_code': 'SRB',
    'dial_code': '+381',
    'country_code': 'sr_RS',
  },
  'SC': {
    'name': 'Seychelles',
    'alpha2_code': 'SC',
    'alpha3_code': 'SYC',
    'dial_code': '+248',
    'country_code': 'en_SC',
  },
  'SL': {
    'name': 'Sierra Leone',
    'alpha2_code': 'SL',
    'alpha3_code': 'SLE',
    'dial_code': '+232',
    'country_code': 'en_SL',
  },
  'SG': {
    'name': 'Singapore',
    'alpha2_code': 'SG',
    'alpha3_code': 'SGP',
    'dial_code': '+65',
    'country_code': 'zh_SG',
  },
  'SX': {
    'name': 'Sint Maarten (Dutch part)',
    'alpha2_code': 'SX',
    'alpha3_code': 'SXM',
    'dial_code': '+1721',
    'country_code': 'nl_SX',
  },
  'SK': {
    'name': 'Slovakia',
    'alpha2_code': 'SK',
    'alpha3_code': 'SVK',
    'dial_code': '+421',
    'country_code': 'sk_SK',
  },
  'SI': {
    'name': 'Slovenia',
    'alpha2_code': 'SI',
    'alpha3_code': 'SVN',
    'dial_code': '+386',
    'country_code': 'sl_SI',
  },
  'SB': {
    'name': 'Solomon Islands',
    'alpha2_code': 'SB',
    'dial_code': '+677',
    'country_code': 'en_SB',
    'alpha3_code': 'SLB',
  },
  'SO': {
    'name': 'Somalia',
    'alpha2_code': 'SO',
    'alpha3_code': 'SOM',
    'dial_code': '+252',
    'country_code': 'so_SO',
  },
  'ZA': {
    'name': 'South Africa',
    'alpha2_code': 'ZA',
    'alpha3_code': 'ZAF',
    'dial_code': '+27',
    'country_code': 'en_ZA',
  },
  'GS': {
    'name': 'South Georgia and the South Sandwich Islands',
    'alpha2_code': 'GS',
    'dial_code': '+500',
    'country_code': 'en_GS',
    'alpha3_code': 'SGS',
  },
  'SS': {
    'name': 'South Sudan',
    'alpha2_code': 'SS',
    'alpha3_code': 'SSD',
    'dial_code': '+211',
    'country_code': 'en_SS',
  },
  'ES': {
    'name': 'Spain',
    'alpha2_code': 'ES',
    'alpha3_code': 'ESP',
    'dial_code': '+34',
    'country_code': 'es_ES',
  },
  'LK': {
    'name': 'Sri Lanka',
    'alpha2_code': 'LK',
    'dial_code': '+94',
    'country_code': 'si_LK',
    'alpha3_code': 'LKA',
  },
  'SD': {
    'name': 'Sudan',
    'alpha2_code': 'SD',
    'alpha3_code': 'SDN',
    'dial_code': '+249',
    'country_code': 'ar_SD',
  },
  'SR': {
    'name': 'Suriname',
    'alpha2_code': 'SR',
    'dial_code': '+597',
    'country_code': 'nl_SR',
    'alpha3_code': 'SUR',
  },
  'SJ': {
    'name': 'Svalbard and Jan Mayen',
    'alpha2_code': 'SJ',
    'alpha3_code': 'SJM',
    'dial_code': '+4779',
    'country_code': 'no_SJ',
  },
  'SE': {
    'name': 'Sweden',
    'alpha2_code': 'SE',
    'alpha3_code': 'SWE',
    'dial_code': '+46',
    'country_code': 'sv_SE',
  },
  'CH': {
    'name': 'Switzerland',
    'alpha2_code': 'CH',
    'alpha3_code': 'CHE',
    'dial_code': '+41',
    'country_code': 'de_CH',
  },
  'SY': {
    'name': 'Syrian Arab Republic',
    'alpha2_code': 'SY',
    'alpha3_code': 'SYR',
    'dial_code': '+963',
    'country_code': 'ar_SY',
  },
  'TW': {
    'name': 'Taiwan',
    'alpha2_code': 'TW',
    'alpha3_code': 'TWN',
    'dial_code': '+886',
    'country_code': 'zh_TW',
  },
  'TJ': {
    'name': 'Tajikistan',
    'alpha2_code': 'TJ',
    'alpha3_code': 'TJK',
    'dial_code': '+992',
    'country_code': 'tg_TJ',
  },
  'TZ': {
    'name': 'Tanzania, United Republic of',
    'alpha2_code': 'TZ',
    'alpha3_code': 'TZA',
    'dial_code': '+255',
    'country_code': 'sw_TZ',
  },
  'TH': {
    'name': 'Thailand',
    'alpha2_code': 'TH',
    'dial_code': '+66',
    'country_code': 'th_TH',
    'alpha3_code': 'THA',
  },
  'TL': {
    'name': 'Timor-Leste',
    'alpha2_code': 'TLS',
    'alpha3_code': 'TLS',
    'dial_code': '+670',
    'country_code': 'pt_TL',
  },
  'TG': {
    'name': 'Togo',
    'alpha2_code': 'TG',
    'dial_code': '+228',
    'country_code': 'fr_TG',
    'alpha3_code': 'TGO',
  },
  'TK': {
    'name': 'Tokelau',
    'alpha2_code': 'TK',
    'alpha3_code': 'TKL',
    'dial_code': '+690',
    'country_code': 'en_TK',
  },
  'TO': {
    'name': 'Tonga',
    'alpha2_code': 'TO',
    'alpha3_code': 'TON',
    'dial_code': '+676',
    'country_code': 'en_TO',
  },
  'TT': {
    'name': 'Trinidad and Tobago',
    'alpha2_code': 'TT',
    'alpha3_code': 'TTO',
    'dial_code': '+1868',
    'country_code': 'en_TT',
  },
  'TN': {
    'name': 'Tunisia',
    'alpha2_code': 'TN',
    'alpha3_code': 'TUN',
    'dial_code': '+216',
    'country_code': 'ar_TN',
  },
  'TR': {
    'name': 'Turkey',
    'alpha2_code': 'TR',
    'alpha3_code': 'TUR',
    'dial_code': '+90',
    'country_code': 'tr_TR',
  },
  'TM': {
    'name': 'Turkmenistan',
    'alpha2_code': 'TM',
    'dial_code': '+993',
    'country_code': 'tk_TM',
    'alpha3_code': 'TKM',
  },
  'TC': {
    'name': 'Turks and Caicos Islands',
    'alpha2_code': 'TC',
    'alpha3_code': 'TCA',
    'dial_code': '+1649',
    'country_code': 'en_TC',
  },
  'TV': {
    'name': 'Tuvalu',
    'alpha2_code': 'TV',
    'dial_code': '+688',
    'country_code': 'en_TV',
    'alpha3_code': 'TUV',
  },
  'UG': {
    'name': 'Uganda',
    'alpha2_code': 'UG',
    'alpha3_code': 'UGA',
    'dial_code': '+256',
    'country_code': 'sw_UG',
  },
  'UA': {
    'name': 'Ukraine',
    'alpha2_code': 'UA',
    'dial_code': '+380',
    'country_code': 'uk_UA',
    'alpha3_code': 'UKR',
  },
  'AE': {
    'name': 'United Arab Emirates',
    'alpha2_code': 'AE',
    'alpha3_code': 'ARE',
    'dial_code': '+971',
    'country_code': 'ar_AE',
  },
  'GB': {
    'name': 'United Kingdom of Great Britain and Northern Ireland',
    'alpha2_code': 'GB',
    'alpha3_code': 'GBR',
    'dial_code': '+44',
    'country_code': 'en_GB',
  },
  'UM': {
    'name': 'United States Minor Outlying Islands',
    'alpha2_code': 'UM',
    'alpha3_code': 'UMI',
    'dial_code': '+1',
    'country_code': 'en_UM',
  },
  'US': {
    'name': 'United States of America',
    'alpha2_code': 'US',
    'dial_code': '+1',
    'country_code': 'en_US',
    'alpha3_code': 'USA',
  },
  'UY': {
    'name': 'Uruguay',
    'alpha2_code': 'UY',
    'alpha3_code': 'URY',
    'dial_code': '+598',
    'country_code': 'es_UY',
  },
  'UZ': {
    'name': 'Uzbekistan',
    'alpha2_code': 'UZ',
    'alpha3_code': 'UZB',
    'dial_code': '+998',
    'country_code': 'uz_UZ',
  },
  'VU': {
    'name': 'Vanuatu',
    'alpha2_code': 'VU',
    'alpha3_code': 'VUT',
    'dial_code': '+678',
    'country_code': 'bi_VU',
  },
  'VE': {
    'name': 'Venezuela (Bolivarian Republic of)',
    'alpha2_code': 'VE',
    'alpha3_code': 'VEN',
    'dial_code': '+58',
    'country_code': 'es_VE',
  },
  'VN': {
    'name': 'Viet Nam',
    'alpha2_code': 'VN',
    'alpha3_code': 'VNM',
    'dial_code': '+84',
    'country_code': 'vi_VN',
  },
  'VG': {
    'name': 'Virgin Islands (British)',
    'alpha2_code': 'VG',
    'alpha3_code': 'VGB',
    'dial_code': '+1284',
    'country_code': 'en_VG',
  },
  'VI': {
    'name': 'Virgin Islands (U.S.)',
    'alpha2_code': 'VI',
    'dial_code': '+1 340',
    'country_code': 'en_VI',
    'alpha3_code': 'VIR',
  },
  'WF': {
    'name': 'Wallis and Futuna',
    'alpha2_code': 'WF',
    'dial_code': '+681',
    'country_code': 'fr_WF',
    'alpha3_code': 'WLF',
  },
  'EH': {
    'name': 'Western Sahara',
    'alpha2_code': 'EH',
    'alpha3_code': 'ESH',
    'dial_code': '+212',
    'country_code': 'es_EH',
  },
  'YE': {
    'name': 'Yemen',
    'alpha2_code': 'YE',
    'alpha3_code': 'YEM',
    'dial_code': '+967',
    'country_code': 'ar_YE',
  },
  'ZM': {
    'name': 'Zambia',
    'alpha2_code': 'ZM',
    'dial_code': '+260',
    'country_code': 'en_ZM',
    'alpha3_code': 'ZMB',
  },
  'ZW': {
    'name': 'Zimbabwe',
    'alpha2_code': 'ZW',
    'alpha3_code': 'ZWE',
    'dial_code': '+263',
    'country_code': 'en_ZW',
  },
};
