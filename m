Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B3F7E7717D
	for <intel-xe@archiver.kernel.org>; Fri, 13 Dec 2024 06:10:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D71E10EF06;
	Fri, 13 Dec 2024 06:10:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KGUAQBVX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C82910EF06
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Dec 2024 06:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734070257; x=1765606257;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FHGQaILPph/6NkYIqwtwVER1MZGKr7BlZrZrki7WPT8=;
 b=KGUAQBVXyL4XuwcP05PVSTUkSum69/6nCSi/qThecEYicFZKpSKPfnRA
 lI3w9c2R9rmU6DNv/EDIpQVkAwDIfJl1uRAh9rzwfWCNgiFcgrPwuSGwb
 7JklEOiQiwpgAp2QbIwJ732Xe9doXnjHFU5r9NYRkSEszL1QaowlxM8Ht
 RzjUX1CIfqKi9SpLoyOP6ngBPgh2wIt0b3UeWn+/5J4o8HFLnPmYwusTt
 iCRqy82quJyxeznlnaFuhABd1QL9TF+g6die8xmfxsQwunWvFMo7JPbg6
 JfleaHK3mUkyGB0kFx1UcM4UMmUEiO2Iho6Phvhz4ViHD1fyKqwyfbhcz w==;
X-CSE-ConnectionGUID: i2CzQKLNSTi2cqmks5U3KQ==
X-CSE-MsgGUID: 6jyAyWJ/Tzu4/Dnq/Xh+3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="34242000"
X-IronPort-AV: E=Sophos;i="6.12,230,1728975600"; d="scan'208";a="34242000"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 22:10:56 -0800
X-CSE-ConnectionGUID: PfstLyH7QQuFPSXweycUGQ==
X-CSE-MsgGUID: g8RvYO7LRHWLEOrkwFeqtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,230,1728975600"; d="scan'208";a="96210133"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Dec 2024 22:10:55 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 12 Dec 2024 22:10:55 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 12 Dec 2024 22:10:55 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 12 Dec 2024 22:10:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KTG+d4nKqFCJRY7Ed5ZyhEQ6UE3jHJKm675ES8ZVbf+FKg0TV6VtNr6QN/9wymOidMg15gNRS4qWDO/pXurEdYq4PbK295/Zhrc9Oug/8ao3nX+fnD3r48l3RLLFdNeP4Ikb1IvW/4FxbC7OYyr4276zwo2GEuOKTDi2XryUWoZWa05+Oc/sa8OH08Px0/UjaRl9UBoXSRMPVTkcHe5Mi8Vg0fBE5z6+46xrc8hdzS+sxgX50+bg/aHsL2o5I99qcjvosV5ZWzjNlxTEkmSfjl25O8xQmW+nWaI+hNqXi8iz61y1LNG4Ow01ycqdevUkBHPdZMHx9IdMM8PQIKKXQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IrrWIcRfnlapAtbO5R8etcXfg8ILXMlmdvjrpZ8AI7I=;
 b=W4IwCd7vUq9hqB53CPetmpvkK5HzQ1bqSYUWfDz8qfA8Jq73JJYGrFBUx9IVL9tY4duXcu+19L5FT1JkWpRj8D4N5txDxJpvQP3veVmTVap0+a41xHHrpQ8+yOB9gLFO4h+8JQ2Gt1on+CiFwVlAM/0HS3kWMpJS8LI7jXd/U+4kAy5G3S8T4SfAFELtDjjfKoUUEqk3M380TYur3YOmxyfdh7Q+uZnM0b2gCZXZhejBVO9JfsOzLnP0FR8lqR6hIjCEUCS+ayjDszhLWw9bL75fprgJgLr8L7v7mfGK8ZIztew6THkxSQvs7/niLBR8XzsNKk3dC0i2PSSJAML4Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7955.namprd11.prod.outlook.com (2603:10b6:208:3dd::6)
 by SN7PR11MB7565.namprd11.prod.outlook.com (2603:10b6:806:344::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Fri, 13 Dec
 2024 06:10:52 +0000
Received: from IA0PR11MB7955.namprd11.prod.outlook.com
 ([fe80::7265:46ae:19a8:b31d]) by IA0PR11MB7955.namprd11.prod.outlook.com
 ([fe80::7265:46ae:19a8:b31d%4]) with mapi id 15.20.8251.015; Fri, 13 Dec 2024
 06:10:52 +0000
Message-ID: <588b5829-e5fc-4450-bf83-4f2cf05cf29b@intel.com>
Date: Fri, 13 Dec 2024 11:40:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/8] drm/xe/guc: Expose engine busyness only for
 supported GuC version
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <umesh.nerlige.ramappa@intel.com>, <rodrigo.vivi@intel.com>,
 <vinay.belgaumkar@intel.com>, <aravind.iddamsetty@intel.com>,
 <john.c.harrison@intel.com>, <ashutosh.dixit@intel.com>,
 <soham.purkait@intel.com>
References: <20241121063904.3033754-1-riana.tauro@intel.com>
 <20241121063904.3033754-8-riana.tauro@intel.com>
 <u3bmt4wjtini2n7bes6gyq2f23kboagca4ee3ekg3oer3qjujj@mh5ct5xwggo6>
 <30a06548-d50f-4c57-9697-39a2bc3a562b@intel.com>
 <htcdqjyj75ymzb6ywe6wczq7vyhop4cocco7pj26sseajtlmo5@hafxw5sqtbj7>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <htcdqjyj75ymzb6ywe6wczq7vyhop4cocco7pj26sseajtlmo5@hafxw5sqtbj7>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PNYP287CA0035.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:23e::8) To IA0PR11MB7955.namprd11.prod.outlook.com
 (2603:10b6:208:3dd::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7955:EE_|SN7PR11MB7565:EE_
X-MS-Office365-Filtering-Correlation-Id: 09b5497d-b4e6-44e1-9abc-08dd1b3ce586
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WEQ1WjdFeXA2TmFzTFZzZ1BSUEc3MjRxTnJsZmx4Z0VEdjBXK3ViUUxMb25C?=
 =?utf-8?B?akFvSHVnN3IwSEhoQ2FncUlYNzdSZ0tlaWJsZzM5ODFmZEJnUWlYQmpaVFdy?=
 =?utf-8?B?YjFMb1BpUDNuZ3o3dGlocUoyamh3NEVGVzJmcWRUaGtmNE5WeWZWM3piVUh6?=
 =?utf-8?B?WWllK2hvdTlSZUZNRFg1NW9BQnhqYkdJc2twT2h4TDFrTXBvd25VMHZ5VzE5?=
 =?utf-8?B?RTVxcldFNy9HVjZCU0tIbVkyUThoM2dkdnVLUkkrT3dnaXFtRENqV1lna2F5?=
 =?utf-8?B?OGhUQXBVcks0YjZKRFpPeE92OWxWZnBjejM3SHFoK0FuWmdhUDZHbTV0T1dF?=
 =?utf-8?B?cWxlYlRjTWtnSVdDSTJkZVZvSWZObHJvOVloVTJMdnc5NUg0b2p4YXlYc3l3?=
 =?utf-8?B?K1NSZlh3OTJUUVhFYWhpZndnZWIrM20xdXRpbHFwd1JuRzJrMDloNWFZckdM?=
 =?utf-8?B?NWNidEhrMHFoNm5vNHRqSXR4SDd2enRxVERXMHcvNGVsMkdNUXFoU01qYnNC?=
 =?utf-8?B?R0lxNldoeWwzekNjVjRxNTE3cEY3MWJLZzZHS0NVWXlTZFRjT0wyL25aT3V6?=
 =?utf-8?B?akxXY0tGMGpSQkRaTHpoQTVZVGJrWVZScHp0UWRZSVk3MGJreFF5Ykw3RG5Q?=
 =?utf-8?B?Y2JuRWpuYVkzTXBnMCs0NFRvWUh0QWZkY3gvL3RDb1ViUVF6MW1hZDNiMkJl?=
 =?utf-8?B?WjdzZHpTVUJ5Mi91Tk40RVQrUzdob21TNi9HU0tVTzJGL3FWTkdPbEdNelNT?=
 =?utf-8?B?MjVpS2J0QTRuUTVtRmphSkNaOXBzTk5xZGRRb3hFVWwwaWFWL1NWOE42dXJx?=
 =?utf-8?B?RDVlbUNpbmQwbmpUa0hYU05VMEJsMzZ0eWVFZXJtZWFjZzhwT250WEc2RXVY?=
 =?utf-8?B?QTRmUmlGL3VsdWdXMEFRMTlENmJlVG5HOEEyR09veXRDQ0FnTUtjcG42OUhD?=
 =?utf-8?B?aTB6ajAxTkRJam1oWWQzQXd6Rmpvd0ZlY2oyVHJvWVV6WlRRT3F5bkZsQUxp?=
 =?utf-8?B?czN2OHUyS0ZLM2NZN0NkYTVZTndDY0gwWm1IRWYrUHBRWG1VV0hYYSs5SzF6?=
 =?utf-8?B?SjhVaXIwdVRJU1A4bHpNRXN1VnN2V3NCK0VrVkdZTDI0YjZsRGphZG4yQW5U?=
 =?utf-8?B?N1BTd1R3WXo5MldwTC9CR2lvRnlIbEdJZzVWR1BMa1pNM2prY2ZZalBBZTJw?=
 =?utf-8?B?RElCY1NWVytUU3lQTTFQaEd0UFUreDlkSElHN1krMGR3OVVSYWhxYTZoOHJD?=
 =?utf-8?B?b0VDb09DLzVldXBSTE11aEpxWVJZZWlLVk5aZXlOeVUzM0hCdWN3dFlpbWNT?=
 =?utf-8?B?a0tobm9ZRTl4YjdJQzErRG0xTGRCVHJ3ZFVJbzdNOGswNzVIN0V5aEFTMGM3?=
 =?utf-8?B?TG1yNTRTL3ZqQzhqK1pMcXFDZE1ZLzVvUi9UN2RtS210YlZLT1poYm5nRGJ4?=
 =?utf-8?B?VzlYZGlrcEJQMFQxQ1p3MUtJV2ZzZXdualBJSnd1Q0JGYW5UNW83eHlmc052?=
 =?utf-8?B?Qmw4OEZnWkxkVE1VS2xUcjBjN09NY3RaKzNrK3JudituYmd1NGdqNVowc2tM?=
 =?utf-8?B?MVUwcGFQVlZSL2xNTlRWZi93Y2FERnJUNmxCT1FWOTc3K28waWxmbHkweElu?=
 =?utf-8?B?azVpSTh0dkNhZHBkWndHY1dUdTczTUdqbjMra0ZRNnlNVmlKd2YvWXB0YVdI?=
 =?utf-8?B?S3MxYXpLZFUzckxsbnd5VHIvbFg1NE9icmlPQmttK1BYaEdqbmY0dG90VC9Y?=
 =?utf-8?B?dWhjQVFCdVU4ZmhkbmZheW1pWk01RDZXMzdXMlorc243dSs4Qm5xUGhBMFRk?=
 =?utf-8?B?NGMvVFBSSndjc2Y1YVNRdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7955.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXE1WWFocmFHSnZqRExlelNBSzB1emR0R3hYcno0WGlzQmh5akFnNWlzcElG?=
 =?utf-8?B?NkRRVlk3WG11RFlzUzY5dVY3TFZTaGNJUGYzNjhPcy9ZNDJtVGhPcTdZcTJB?=
 =?utf-8?B?T1l5OTdHSDlwS1FVeFJHTWZQZXRYM05FalV1cE1kUUlGWXV3Ti96MlRRYjAx?=
 =?utf-8?B?UW5mNHhaNEdSdkhkUjVXL2VPYU5NU08vWC9wcU9HVVRrSWVXaU9CY2kxUW9Q?=
 =?utf-8?B?TVhxZFJZUW9LQkdoSlRYd0E2K2xWQ1JXMWRQMFFKSngzVmRFWlBpU2dWRnkx?=
 =?utf-8?B?TU1DZE9YRHpkY0o4bEc0ZXgxdWZUaUg2enVRODdhcWhuUUJlbzh2UmZRRnhl?=
 =?utf-8?B?ZDM2WnhreTBXSDV5QXBmQ0FzTGtSY0Fsam1aczBJUFI2MGVrOEpTdGZIV242?=
 =?utf-8?B?MGpaU21OKzVNcEIrZFZiTGpuSzNYZGQ0cG9rZ0xjWGp3Vk9DcCtTdi9qeE1k?=
 =?utf-8?B?QVFUeE8zak4yMkJOV0dnVjcxdXBaM20yZy9rR0wvRTh1aE9CRFVPMnZqTGtv?=
 =?utf-8?B?VVNrVklmZmxMZit4bGQ0UEVmSEtUTEpoa3RnL2crYVZydmRVR04xSTBzNmc0?=
 =?utf-8?B?S3JnTS9CN01YcDR5dy9FVjJpL21UZ0hNMkQybFJSd1FxYyszRmxmZUZaOUtq?=
 =?utf-8?B?MlVjMVNTWXdQa1NBOS9Mb0Y2a2F3V0Q5clR4U3h4NUluZDlpTE1RZ2hpM00r?=
 =?utf-8?B?YmdUYi9IbGpiRzEySmZSNStlNDM5NnRiVEpTV1VmckwyNXBod1U1Z2lsRlgz?=
 =?utf-8?B?TjQ4TFZRaW5kOGpjenMxNGJmV3N5S09VRlhqU2h4dHAxNnYwVTZkUFNzYWVT?=
 =?utf-8?B?N3A3SUdnV3Jta3RLYmxwVG4xQWFRcXBueHEwb1l1bURxVm1mT2NOa0lieU5W?=
 =?utf-8?B?b2dkRi80elc3aDcwd3N3Q2FJQkEyVDBQWDRYamQ0QkNUTXFnNmlZK1FTTjJz?=
 =?utf-8?B?T0pEaW1Rd1hIcnRYaFJoSHA4OXFadGZ3YlRsVFNtemxJbXlnN3JEd1lSN0hJ?=
 =?utf-8?B?VG0vTVVJbTB3MzFCSXQ4QVRoTnF3MjZnRjl6VzdRT2FFZ0pOcVFMbUFCQ3Fp?=
 =?utf-8?B?RXNvY21NVDJjZVNMLzdJNHJmVGFpR1BNRTVKWVd3dWFXcDR0c202MUVoVkx0?=
 =?utf-8?B?Tkp0b0NST0ZBVDBBOEZ3ZXdpZlRRK203WHkvc2RlZlRXOWJld05hNzZvYW1r?=
 =?utf-8?B?dHNocGI3cWZOSzArNUs1MTZjcGU2U09nR2c3ZVFMeEVtMGlEaldoSHZLb0JH?=
 =?utf-8?B?T0Vma3pQVjEyY2J1d2V3Z1MzNnh0Tk03WlI3czh6cUVqbXZaclNkV0NLdG9D?=
 =?utf-8?B?cW44Y1lzWnlteWZrSlRWMXlDTFlLeHN3cE9RamxrbmxyTHdzY3hjaDlyOVN5?=
 =?utf-8?B?U1ZhVHFZNlBTakRXNFVzc1lFOStoMm1LblpVek9mNXpvbGU3R3d2eVJ5cE9M?=
 =?utf-8?B?SERYNHYzSURGRnN4ckYycDArSHMzK3kvcTdTYk5HSjNGdStuM3BtTzhDMHBC?=
 =?utf-8?B?dnlWYitPU1Uvb3ZsYWgzMHUwb1B5Y1plTmVLazh6N1daSDNSWnJzS0ZHbktO?=
 =?utf-8?B?WnhUbUo4Skoyd1NWKzN1VjNML0FJQjhXUjhiSnB2ZWpqOEoxK21LaFZFUk95?=
 =?utf-8?B?ZmNKRGk0bGgwSlRZSEY4MGdVR0xxV1NRWDRMMXkvdDVHSllRNXh1b2hnazNh?=
 =?utf-8?B?blB1YmZyR3lHTWVaNm4yRkRqbXBsOWZrVDc5ek1WcXBscjdudFVSTHU3bEtq?=
 =?utf-8?B?WENwZnNWcmRiY2lmT3lwZVhMb3RPNUxMQWRudDRENVZENVNSNUI2OXRzWmVo?=
 =?utf-8?B?Ym5vWU9LU3lVUEJpUWR2clora0dteUszR2RjMGlZS29PRG04RXEray9jTGxm?=
 =?utf-8?B?L1VmMlI0UVRnZksxR292VEZWU1U1bnVpQ1h1RTBzMVc5VGd5RHNTMng4a0wz?=
 =?utf-8?B?YndaLzlycm9PZWRpdTNPUVVvZTJTR1lTMDluejhTZGdQcW9yNXVUSXNBSzFV?=
 =?utf-8?B?eW5IYzJ5ekJ2anRZbG41NUQxb0RFdGpoWStiMXZKbUhlS1pVZE9HdlV2U3Qy?=
 =?utf-8?B?U2dKeFBCeTVScW5WRFVaNzIrSUE2L1ZCTTBIQjllcWU3SEVVZ29NSU5CK0Rl?=
 =?utf-8?Q?+H4/FrAoX6EfwRICH6rT0eNyt?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 09b5497d-b4e6-44e1-9abc-08dd1b3ce586
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7955.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2024 06:10:52.2368 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NuRXrtFvzp+iorQg2fstkzicLPZaaXbJ7lpyUmhQB9Kh2SiDA0eM2bGoL1trKR0AeHd1JelChkBoXBGg7AV6/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7565
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 12/13/2024 11:34 AM, Lucas De Marchi wrote:
> On Fri, Dec 13, 2024 at 11:30:38AM +0530, Riana Tauro wrote:
>> Hi Lucas
>>
>> On 12/13/2024 11:14 AM, Lucas De Marchi wrote:
>>> On Thu, Nov 21, 2024 at 12:09:03PM +0530, Riana Tauro wrote:
>>>> Engine busyness is supported only on GuC versions >= 70.32.0
>>>> Allow enabling/reading engine busyness only on supported
>>>> GuC versions. Warn once if not supported.
>>>
>>> did i915 used a different version of the guc api?
>>>
>>> There's no platform supporting GuC >= 70.32.0. We will need to add one
>>> to be able to test.
>> Requested for this guc version. Will merge this once CI passes with 
>> the required version.
> 
> this means you also need the igt ready for that. Is it done?
Yeah igt is ready and has been tested locally.

Waiting for other tests of pmu to be pushed 
https://patchwork.freedesktop.org/series/140737/, to avoid re-sending 
these patches again. Will send it once these are pushed> Lucas De Marchi
> 
>>
>> Thanks
>> Riana
>>>
>>> Lucas De Marchi
>>

