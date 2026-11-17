Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9AA606A31C
	for <intel-xe@archiver.kernel.org>; Tue, 17 Nov 2026 07:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gFAmOi/B;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=W6r05tS0
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23F1D10EB09;
	Tue, 17 Nov 2026 07:30:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 723F810EB09
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Nov 2026 07:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794900636; x=1826436636;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=K7R0qsPs+JuMdDvPbCgKGsGhswDVL8/uRZmlLiERdVY=;
 b=gFAmOi/BlYlx1KRaGhXuSiUWx2jjvrEyLaDWZegg8hr+8FjMAPLVPRGs
 dal1oGZkUM1iTZmn93mWHUMA0YMIBcpBLwvDV/dvIjRyUxsZ6QlioSdw3
 oHiJD1y1wpR696QG7ItAWBThJbnA7Zf4hpTTOH2hcC+SuaZxTedkUVtNU
 JAAXi3oRP8/nWKMbC93XajYEu4fwJflVMTQVnCQVaVkSYRrwDfCmVElkl
 /lGmdfd0+9rBizFfqu8ep8gc0RyY/X7WHIDYrlQEAAsEBZK+TIIkJKrKo
 Y4lEAw2shAXxDHqrteXnHwkGbqOsWEvdnrzwMbcQ89x32SjuOOL6/NbSA w==;
X-CSE-ConnectionGUID: amxRNyIJSaeGXjfSjN/QIQ==
X-CSE-MsgGUID: tSGDez2lRZ+M8SQT6+VzcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3679696"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; d="scan'208,217";a="3679696"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 23:30:36 -0800
X-CSE-ConnectionGUID: j608d/1YSYaYVP1Ex1nXlw==
X-CSE-MsgGUID: RGWuhce5R2m+V5RzfrM5zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; d="scan'208,217";a="9983857"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 23:30:35 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 23:30:34 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 16 Nov 2026 23:30:34 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.67) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 23:30:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fOr1MHWJoqTsD3OvV8jap0Cgcmz1rd5QADzraeOt557yLdvW6VkJ44FOsKxTdzWD8JzyBOiyaYuu1EuByCwjl2ge0wbIoFKny+JeUkPpAPq/CV+SNASNM3jgvbHlrZjcQ17PA7cGP5XutSdQr9XtuXyRU8+mdi7qigRXsYjTdqRtSD/J+Ai06jvdilv6hnu+OKIMXO8+/ZWOWGe58AvPHVoZ2WJleYOlGdMMmzL6uYBlDMISBUfggrJV7p4iXQgxbXTGpvmvv15dmNduGSIWlC0QYuwz4k6lMagQYS6Csui/DlAtC3VZHaVPd8jK4WwCNnVbOLOW0aNl+UZmUdRWSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SO7/nUC2k4b7q5Pg0P64vupt3hME2sUmqWvOMm1itzM=;
 b=Sbx3RaSrT0+ac/kLKX2R4T3LZr+YR1UkoSViYc3CBl0IsG/GRIX3LnRn4mFG1uA89H1ARO/sMZYSY1wU+BVqJQ94n2pV2EsLJLxGm/MBtd7G0Tow274ZUaYI6TCLPy3bP5+JAA+G1jVhX/DXf93wEJXjRHxArRQ/rt+eO8q9VZuSjr/ekOOz2A1OMfvCLJNAePi/6s26HcPQve32jg43qg3e5ZB+dBQAteVA2bgk608oGMUlh39i4DkzKJylcw0uV3XcMysQq1E2HkpRQkrXYI9V72vlLwWtjsrFtJEsUr1slF12o66MvrmsMOiBIwfUQc5wohELpUEnOjjgt1YiXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SO7/nUC2k4b7q5Pg0P64vupt3hME2sUmqWvOMm1itzM=;
 b=W6r05tS0IQIqr1B5gw3UpLKmgoPz0brmgLnbN5+CPnTRXmDdmv17c2gMqcsBO8Y7Z1uDamGc0UBbHxVCxUFoMz/50SWBns7YRcJoAQ5Nm2stWP/Xd1HyZTsU68VXOKVrBZwsnhnYhLPZzP/6a6VGRjvrc/4di/ZbPNs4/EOJkfg=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by PH9PR11MB666862.namprd11.prod.outlook.com (2603:10b6:510:3e3::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 07:30:27 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 07:30:27 +0000
Content-Type: multipart/alternative;
 boundary="------------vOOpYcyvXRjpxUwik4LgJj9Z"
Message-ID: <986988d2-acc0-4dac-a5d5-60d7d0fe5c82@intel.com>
Date: Tue, 17 Nov 2026 13:00:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/6] drm/xe/cper: Add software CPER emission entry point
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>
CC: <anshuman.gupta@intel.com>, <vinay.belgaumkar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <sk.anirban@intel.com>,
 <raag.jadav@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <jani.nikula@linux.intel.com>
References: <20261112134636.1860446-8-mallesh.koujalagi@intel.com>
 <20261112134636.1860446-9-mallesh.koujalagi@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20261112134636.1860446-9-mallesh.koujalagi@intel.com>
X-ClientProxiedBy: MA5PR01CA0109.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d1::15) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|PH9PR11MB666862:EE_
X-MS-Office365-Filtering-Correlation-Id: d8724db0-a1a1-4b45-05a4-08df447ca691
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|10067099003|56012099006|4143699003|11063799006|261026121527099003|261026140227099003|261028144727099003|261021123027099003|261022113327099003|261021121427099003|261022105027099003|261102123227099003|261009223027099003|22082099003|18002099003|6133799003|8096899003;
X-Microsoft-Antispam-Message-Info: W4tNIwCarEaAreA7az+HA/Zr6KhwrT63F/pLTudxW57tmqHoKp713c3/+kXGksO1IMhJf20wedPUHaXcMvQknUX0aT0bV+pvvM1pAZXziFQpgAJzoTMCM/TGMP6kWOtDBeRqfMHWP99N+992q/mEYJx78en3V6jrRJ30BuUL49KH2d6aB3SoiGAH1qOGnZAo1zC5tZlblBNTT/X/Ux2GUghyr1NiRJBAc5NaN62/VLbCuBkoxdvnGz+Sh7S8acQy47o3dd2utTtK7RjLYmLvhVEIS1HTCMSZT7nTAoXo5rFIXGM5xaUNuyRfEuZd2jZX6vHAZ+c8iGk1kkytbvbQyXBS+qpC4RgJnr2mEJK6ABEBjiJfZqxl4iHc7oj5X5GJLV0klZkMfLTJSNJb9fQ63zcf4hEIOOKA1YFXoyo+kG+B7xn+Sr6n2W5PE24IJIg+s65kmTDD6g9zaauJ+Yorwl4kywSYGA6RZt9bwyin0uaWHaNUv/oUXaUa8iXrUmP5Hky+Kphl8FWyOI7ptMkp3eMBvib1eVVl/5gZnrg4AHGJfNewFR384gIIOG/zebwVQvdLpumi7Bm62Ch9qBd0du9WRjeZFJAmZsTwVNrce1+Dy7iqCIx26+IoH6gaNTkjjvWPC1lqPh0KgomIsda1kiS2y6vawg1qAMwiIvf7Lyo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(10067099003)(56012099006)(4143699003)(11063799006)(261026121527099003)(261026140227099003)(261028144727099003)(261021123027099003)(261022113327099003)(261021121427099003)(261022105027099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(6133799003)(8096899003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1Y0bS90MFJMdTB1YmpCWVFzaXAzYU9tRzNBSnU5TjJ2TUt0ci9TMldLMjdr?=
 =?utf-8?B?eno3QXpINkpCcU11U2RHZHRlYkdwYnlpbmY2cVZTcUtqd21saDVmTTFseWUv?=
 =?utf-8?B?OVhZZmcwRFczQm9ISnMrb1BIWGM2QlpiVUJmQkZYTGdTMlpmVzhOY2h2Q1pI?=
 =?utf-8?B?U3FKRkluNFg5VUNxN0VQQ3poK1hqN2FrcFZsNFJjRkx2UXIvZ3p5T0VmM1Yy?=
 =?utf-8?B?VXZJMUozYisybGZIY1IrbkpqVDR1MG51VXdDaFM1RGpGeXVMaU5WQ1cxV1ht?=
 =?utf-8?B?OXVuQWwxVmlUaW9pMWZCUUZPTG9XLy9GS003RHhvUkQ2bFYwVVdubnRkQTJS?=
 =?utf-8?B?a3JQdk12c2lTclI0cE53alYwY2tUd0pmcDdWTGZrUTZ6ZUJvc2MyYWUvOVVq?=
 =?utf-8?B?RmM0YVB3UW1qYjNtTmo2ZzJBWExnakw2Y1dTMkZ6amN2SkR3Wm1LM2RCaUhy?=
 =?utf-8?B?aTUzaDRTOFlkMFFnSnJDR2tTelRtS0xCUjJNV1dqYVc3SjFaNE4zSnZrcEgx?=
 =?utf-8?B?elVqaGpvNk81Q0t5Q3dKKy9hSFh4N29CdEdoaDZwVitVM0l4Z1VmRGxYWHZq?=
 =?utf-8?B?UjcvbHJzNEpmWWN4LzZIOE9rT3oyeVoxQ0VhTHBDNGxtd0Y0bjVUWUpPU0Yw?=
 =?utf-8?B?L3ViaXU0R04wdHJrbFdGbk9nWlBhWnAvNDYvQndhZ2xBOE56Umw3RjBsb1pY?=
 =?utf-8?B?NllSdDlETGtZWWUrdm1kbkkydS9pTFlrTXM1VTkvMjh1VjU2OTRlMWlST1ZV?=
 =?utf-8?B?TmlCV0RDQnlKZDJxTkN6UlZsY1dxbU5SMTVmcFpKOWhOdWtvOXFOWDdHUWc2?=
 =?utf-8?B?VHFXckxrcmRnQ1V5Y21rdE4yVzUwSDFHc0k3endkN01OdldBZHdWOTZKekRl?=
 =?utf-8?B?Sm5CWnJ2N0ttaS9QczErUUlaUXZjNzFMckU5VGdQanR4MVpnNjVmRTJobWs4?=
 =?utf-8?B?NVJEQmJBSUN4UUNJTWNlajJSRHdzVTdmclhjVDlsRklpcEV0dlUrcUo1SkNK?=
 =?utf-8?B?eXUrT3FJS0lySHorTVpuY1B0SFl0MjJETkFObVM1S0p1TkVaYTZMYUNOYWxK?=
 =?utf-8?B?M0I4ZnJ4ekx2VElmUDJNOGlDb2puanFzcU5PN3FzMWdXK1Irck5kNThKOS8w?=
 =?utf-8?B?Vit2c3hVLzFuS0dHNTB5K1NWU2RONUlPUTZwc0lSelpVZGJNNkx6TVB6aUt0?=
 =?utf-8?B?WUlQb21WeFlWRm4xVXdFU2RwWVFvcU0rajNRaHBKMUNzZTVCVUc1OGJYYVkz?=
 =?utf-8?B?THJXY2NwMlJTT1lmTlBwQkJrR2FSVmt6R2IyTVI2SkhPaEZyQ2xSWlZXWmR5?=
 =?utf-8?B?RlFQWXpwU25xUFZVMG9FRTZqV3B0andBQnNHYVhwazdWbEtrOHZVTkVrZVRw?=
 =?utf-8?B?ZU02WndMUnp3NlVPZjloTUZtelNLZ2lnSnpnN3lEc00zTXZ3aE1pSDczaGsr?=
 =?utf-8?B?dzlkSVJHUEFidUVMMGIrT0UvN1VvSUhGMkFKaEgxQksrSjFrUXQ0RFlzcGRx?=
 =?utf-8?B?YlJTN0hndTFsWXZTVjBmWmo3WCtjZmxVNWE4enhTdG5DUEZEaGY0N2NmNGVK?=
 =?utf-8?B?S0xVVVpURE16NnpFb3lCWTZrdzgzOStTV21HazBiRldLZ1VFbjhKVnkyUlIv?=
 =?utf-8?B?VjZHUUpTVnV1SXNNMnkyKzdVNWJaSlJiK3pwaVpGQUZJK2g3YTVOMzlranBP?=
 =?utf-8?B?QmJITjFnQ2dpb0pYSG5DTXVZMWJEUlQ4K3JoZFNTZUdZT1NXVXVpWmxhNDkw?=
 =?utf-8?B?N3NneGFIVks1TDRIeVpYMkVYbXR2WjB5NlBOYm83MTR1QWtkWUFRdU04bGJl?=
 =?utf-8?B?Z3MwM1ZYQ0NtTU5FUkhMcFdwVG9ETTkvb1dKcExEZzFXV3Q3RG1vc0lEbDJD?=
 =?utf-8?B?dW03QlF5MmFXVUp1OGFsZmUza3hONG03TXN4UW05R3dHRFJjQVhEdWhYRWZP?=
 =?utf-8?B?R0txeDlwNTlSam0xVDNMWCtISzNQbGJnekpiaWNQZVBqbmFESWRtZDc1S2tJ?=
 =?utf-8?B?cFcvMDNGL0MzY0g3aTZkMVN2UnZrRnNiYlY0QmZHZVpDSkxDNFlnclN4K0tW?=
 =?utf-8?B?Z0g3eDgrZ05zQ3BFeXAxa3c3MFVYQklES1pTTkxwcWNZQXkyZC95d3pFaEV5?=
 =?utf-8?B?eFFVQjdMNlhhdEE3RE9nVGhCSTV2Tm5qQ2dzY2JtemgySXF4Y1RQalZtZUFH?=
 =?utf-8?B?RHZhckdrdS9lUnpEZE93OTJzaUczcVlZRHNoRUFuNDZSQVhrTk9CaHFtSDEy?=
 =?utf-8?B?Wm5Zb3BoQjc4WERVOHJ6MzZoaUJnMXJhVmZNSUF4QUtkQytTT2ZJeVp5VGZa?=
 =?utf-8?B?dCtLaEM3R09nbU9oekw5TVF6UC9ha3FSRGVJQkJoVzY4UUREeUpCZz09?=
X-Exchange-RoutingPolicyChecked: Xknv5TANthd5xkeg907lwoB4ZCExRJEjSeylY92lI/PbJS7ELucmhLnpRkmTtsJvic0z3dOBN0nnI5YrbkcwS5WCPZmDZrcyiAg7Usi15oDyLFtKJUBBH9lQL2ByLvomo4RfEpKK/HhIh4xOroYm+1BsqngLZBIpSUlsZWjdnuSIOZRYoDle8CW9osC4nWeJEyt42rhDmK9GSHaUf7sXsYg5Ml3wzaaf1Gg7zLT9gjtsIb2qEQUwzQyhG/kZjK9Ay/CzIASPxBsO9b+XPhZRJuvCrtbnGUyA89jLI0aKKdSCNps64XqKMSpWntbDab+A77lvfGXvjkY+62AiINEs5Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: d8724db0-a1a1-4b45-05a4-08df447ca691
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 07:30:27.4352 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dpZa5XZatm+zNG1liRvJK+r02PYCzOgj/6YqdeUyLUqhYYO1dnT1rAdhMGI+HJANFEONWYDUkPzaRC8dUhAJ3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH9PR11MB666862
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--------------vOOpYcyvXRjpxUwik4LgJj9Z
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 12-11-2026 19:16, Mallesh Koujalagi wrote:
> Add a software CPER emission handler for CRI SIGIDs.
>
> Keep hardware CPER handling unchanged and return early
> when the Xe device is unavailable.

I think no need to mention this explicitly.

>
> Cc: Badal Nilawar<badal.nilawar@intel.com>
> Signed-off-by: Mallesh Koujalagi<mallesh.koujalagi@intel.com>
> ---
> v3:
> - Handle early PCI probe where xe device is null. (Sashiko)
>
> v4:
> - Add has_driver_cper flag. (Badal)
> ---
>   drivers/gpu/drm/xe/xe_cper.c         | 22 +++++++++++++++++++++-
>   drivers/gpu/drm/xe/xe_device_types.h |  2 ++
>   drivers/gpu/drm/xe/xe_pci.c          |  2 ++
>   drivers/gpu/drm/xe/xe_pci_types.h    |  1 +
>   4 files changed, 26 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
> index bb90030bcd2d..dd6d4251dd1d 100644
> --- a/drivers/gpu/drm/xe/xe_cper.c
> +++ b/drivers/gpu/drm/xe/xe_cper.c
> @@ -32,6 +32,11 @@ static bool is_hw_sigid(enum xe_sigid sigid)
>   	return in_range(sigid, INTEL_SIGID_GPU_XE_HARDWARE_START, INTEL_SIGID_BATCH);
>   }
>   
> +static bool is_sw_sigid(enum xe_sigid sigid)
> +{
> +	return in_range(sigid, INTEL_SIGID_GPU_XE_SOFTWARE_START, INTEL_SIGID_BATCH);
> +}
> +
>   /* CPER platform_id GUIDs (RFC 9562 UUIDv5) for each PCI device ID. */
>   static const struct xe_device_guid_entry xe_device_guids[] = {
>   	{ 0x674C, GUID_INIT(0x9046afe5, 0x9041, 0x5124,
> @@ -240,6 +245,12 @@ static void cper_emit_hw_err(struct xe_device *xe, int cper_sev, enum xe_sigid s
>   	xe_cper_emit_counter(xe, cper_sev, sigid, counter, &response);
>   }
>   
> +static void cper_emit_sw_err(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
> +			     u32 component, u32 location, const void *data,
> +			     struct va_format *vaf)
> +{
> +}
> +
>   /**
>    * xe_cper_emit() - Emit a CPER record for a SIGID log entry
>    * @xe: The &xe_device
> @@ -268,12 +279,21 @@ void xe_cper_emit(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
>   		  u32 component, u32 location, const void *data, size_t len,
>   		  struct va_format *vaf)
>   {
> +	if (!xe)
> +		return;

Add a TO DO to track a future enhancement to handle this using pdev 
instead of xe.

> +
>   	if (is_hw_sigid(sigid) && !IS_ERR_OR_NULL(data)) {
>   		cper_emit_hw_err(xe, cper_sev, sigid, data);
>   		return;
>   	}
>   
> -	/* TODO software CPER */
> +	if (xe->info.has_driver_cper) {
> +		if (is_sw_sigid(sigid) &&
> +		    (cper_sev == CPER_SEV_RECOVERABLE ||
> +		     cper_sev == CPER_SEV_FATAL))

Nit: Severity check can fit on a single line.


With comments addressed this is

Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>

Thanks,
Badal

> +			cper_emit_sw_err(xe, cper_sev, sigid, component, location, data, vaf);
> +		return;
> +	}
>   }
>   
>   static ssize_t cper_on_query_show(struct device *dev, struct device_attribute *attr, char *buf)
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 933f5d27aa62..d992ff8d2fc9 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -170,6 +170,8 @@ struct xe_device {
>   		u8 has_device_atomics_on_smem:1;
>   		/** @info.has_device_uid: Device supports unique 64-bit GPU SOC ID */
>   		u8 has_device_uid:1;
> +		/** @info.has_driver_cper: Device supports driver-generated CPER records */
> +		u8 has_driver_cper:1;
>   		/** @info.has_drm_ras: Device supports drm_ras (Reliability, Availability, Serviceability) */
>   		u8 has_drm_ras:1;
>   		/** @info.has_fan_control: Device supports fan control */
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index ce231069880a..c615eddb2abc 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -475,6 +475,7 @@ static const struct xe_device_desc cri_desc = {
>   	.dma_mask_size = 52,
>   	.has_display = false,
>   	.has_device_uid = true,
> +	.has_driver_cper = true,
>   	.has_drm_ras = true,
>   	.has_flat_ccs = false,
>   	.has_gsc_nvm = 1,
> @@ -802,6 +803,7 @@ static int xe_info_init_early(struct xe_device *xe,
>   	xe->info.is_dgfx = desc->is_dgfx;
>   	xe->info.has_cached_pt = desc->has_cached_pt;
>   	xe->info.has_device_uid = desc->has_device_uid;
> +	xe->info.has_driver_cper = desc->has_driver_cper;
>   	xe->info.has_drm_ras = desc->has_drm_ras;
>   	xe->info.has_fan_control = desc->has_fan_control;
>   	xe->info.has_fixed_vram_channels = desc->has_fixed_vram_channels;
> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
> index 74a6cd461b21..e7bf46ea729f 100644
> --- a/drivers/gpu/drm/xe/xe_pci_types.h
> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> @@ -42,6 +42,7 @@ struct xe_device_desc {
>   	u8 has_cached_pt:1;
>   	u8 has_display:1;
>   	u8 has_device_uid:1;
> +	u8 has_driver_cper:1;
>   	u8 has_drm_ras:1;
>   	u8 has_fan_control:1;
>   	u8 has_fixed_vram_channels:1;
--------------vOOpYcyvXRjpxUwik4LgJj9Z
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 12-11-2026 19:16, Mallesh Koujalagi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20261112134636.1860446-9-mallesh.koujalagi@intel.com">
      <pre wrap="" class="moz-quote-pre">Add a software CPER emission handler for CRI SIGIDs.

Keep hardware CPER handling unchanged and return early
when the Xe device is unavailable.</pre>
    </blockquote>
    <p>I think no need to mention this explicitly.&nbsp;</p>
    <blockquote type="cite" cite="mid:20261112134636.1860446-9-mallesh.koujalagi@intel.com">
      <pre wrap="" class="moz-quote-pre">

Cc: Badal Nilawar <a class="moz-txt-link-rfc2396E" href="mailto:badal.nilawar@intel.com">&lt;badal.nilawar@intel.com&gt;</a>
Signed-off-by: Mallesh Koujalagi <a class="moz-txt-link-rfc2396E" href="mailto:mallesh.koujalagi@intel.com">&lt;mallesh.koujalagi@intel.com&gt;</a>
---
v3:
- Handle early PCI probe where xe device is null. (Sashiko)

v4:
- Add has_driver_cper flag. (Badal)
---
 drivers/gpu/drm/xe/xe_cper.c         | 22 +++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_device_types.h |  2 ++
 drivers/gpu/drm/xe/xe_pci.c          |  2 ++
 drivers/gpu/drm/xe/xe_pci_types.h    |  1 +
 4 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
index bb90030bcd2d..dd6d4251dd1d 100644
--- a/drivers/gpu/drm/xe/xe_cper.c
+++ b/drivers/gpu/drm/xe/xe_cper.c
@@ -32,6 +32,11 @@ static bool is_hw_sigid(enum xe_sigid sigid)
 	return in_range(sigid, INTEL_SIGID_GPU_XE_HARDWARE_START, INTEL_SIGID_BATCH);
 }
 
+static bool is_sw_sigid(enum xe_sigid sigid)
+{
+	return in_range(sigid, INTEL_SIGID_GPU_XE_SOFTWARE_START, INTEL_SIGID_BATCH);
+}
+
 /* CPER platform_id GUIDs (RFC 9562 UUIDv5) for each PCI device ID. */
 static const struct xe_device_guid_entry xe_device_guids[] = {
 	{ 0x674C, GUID_INIT(0x9046afe5, 0x9041, 0x5124,
@@ -240,6 +245,12 @@ static void cper_emit_hw_err(struct xe_device *xe, int cper_sev, enum xe_sigid s
 	xe_cper_emit_counter(xe, cper_sev, sigid, counter, &amp;response);
 }
 
+static void cper_emit_sw_err(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
+			     u32 component, u32 location, const void *data,
+			     struct va_format *vaf)
+{
+}
+
 /**
  * xe_cper_emit() - Emit a CPER record for a SIGID log entry
  * @xe: The &amp;xe_device
@@ -268,12 +279,21 @@ void xe_cper_emit(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
 		  u32 component, u32 location, const void *data, size_t len,
 		  struct va_format *vaf)
 {
+	if (!xe)
+		return;</pre>
    </blockquote>
    <p>Add a TO DO to track a future enhancement to handle this using
      pdev instead of xe.</p>
    <blockquote type="cite" cite="mid:20261112134636.1860446-9-mallesh.koujalagi@intel.com">
      <pre wrap="" class="moz-quote-pre">
+
 	if (is_hw_sigid(sigid) &amp;&amp; !IS_ERR_OR_NULL(data)) {
 		cper_emit_hw_err(xe, cper_sev, sigid, data);
 		return;
 	}
 
-	/* TODO software CPER */
+	if (xe-&gt;info.has_driver_cper) {
+		if (is_sw_sigid(sigid) &amp;&amp;
+		    (cper_sev == CPER_SEV_RECOVERABLE ||
+		     cper_sev == CPER_SEV_FATAL))</pre>
    </blockquote>
    <style>a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5;
}</style>
    <p style="font-style: normal; font-weight: 400; line-height: 20px;">Nit:
      Severity check can fit on a single line.</p>
    <p style="font-style: normal; font-weight: 400; line-height: 20px;"><br>
    </p>
    <p style="font-style: normal; font-weight: 400; line-height: 20px;">With
      comments addressed this is&nbsp;</p>
    <p style="font-style: normal; font-weight: 400; line-height: 20px;">Reviewed-by:
      Badal Nilawar <a class="moz-txt-link-rfc2396E" href="mailto:badal.nilawar@intel.com">&lt;badal.nilawar@intel.com&gt;</a></p>
    <p style="font-style: normal; font-weight: 400; line-height: 20px;">Thanks,<br>
      Badal&nbsp;</p>
    <blockquote type="cite" cite="mid:20261112134636.1860446-9-mallesh.koujalagi@intel.com">
      <pre wrap="" class="moz-quote-pre">
+			cper_emit_sw_err(xe, cper_sev, sigid, component, location, data, vaf);
+		return;
+	}
 }
 
 static ssize_t cper_on_query_show(struct device *dev, struct device_attribute *attr, char *buf)
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 933f5d27aa62..d992ff8d2fc9 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -170,6 +170,8 @@ struct xe_device {
 		u8 has_device_atomics_on_smem:1;
 		/** @info.has_device_uid: Device supports unique 64-bit GPU SOC ID */
 		u8 has_device_uid:1;
+		/** @info.has_driver_cper: Device supports driver-generated CPER records */
+		u8 has_driver_cper:1;
 		/** @info.has_drm_ras: Device supports drm_ras (Reliability, Availability, Serviceability) */
 		u8 has_drm_ras:1;
 		/** @info.has_fan_control: Device supports fan control */
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index ce231069880a..c615eddb2abc 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -475,6 +475,7 @@ static const struct xe_device_desc cri_desc = {
 	.dma_mask_size = 52,
 	.has_display = false,
 	.has_device_uid = true,
+	.has_driver_cper = true,
 	.has_drm_ras = true,
 	.has_flat_ccs = false,
 	.has_gsc_nvm = 1,
@@ -802,6 +803,7 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe-&gt;info.is_dgfx = desc-&gt;is_dgfx;
 	xe-&gt;info.has_cached_pt = desc-&gt;has_cached_pt;
 	xe-&gt;info.has_device_uid = desc-&gt;has_device_uid;
+	xe-&gt;info.has_driver_cper = desc-&gt;has_driver_cper;
 	xe-&gt;info.has_drm_ras = desc-&gt;has_drm_ras;
 	xe-&gt;info.has_fan_control = desc-&gt;has_fan_control;
 	xe-&gt;info.has_fixed_vram_channels = desc-&gt;has_fixed_vram_channels;
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index 74a6cd461b21..e7bf46ea729f 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -42,6 +42,7 @@ struct xe_device_desc {
 	u8 has_cached_pt:1;
 	u8 has_display:1;
 	u8 has_device_uid:1;
+	u8 has_driver_cper:1;
 	u8 has_drm_ras:1;
 	u8 has_fan_control:1;
 	u8 has_fixed_vram_channels:1;
</pre>
    </blockquote>
  </body>
</html>

--------------vOOpYcyvXRjpxUwik4LgJj9Z--
