Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5CF606A324
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 18:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MUVa16Iq;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=O86apZEl
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFA9910E7F5;
	Thu, 19 Nov 2026 18:46:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E541210F091
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Nov 2026 18:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795114000; x=1826650000;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=H78DD73C9Yqiqt9vo2UB6+u3TkQLOElBTszwEI6mx8A=;
 b=MUVa16IqLjPlG8yNGXhlFL8iWNylm7KPeAdjUUVkO7X+rrjsDU20kbTM
 Ap2qZKHva5Sp2fw/HRKJBDCsbSUPpqGg64LkeNfRnaJQhoHMFYYJvY927
 D2W6rZb1/6JNaCeYFA2GAwy5Ilod7TNM5bI6rokXctdvajRIfATOncybr
 fOKzJMAMO6LSrhe9rwtxN0lTGiaG6qNSod248Dy5UqJfYE0ZNk33DNgab
 ceqOybVR2ox+gmC6Nkt2M/JkCbFy1RQAz020+2R+bbwmTW4jddVAS1fRC
 j/c8fESTTJaz6zHAZStLLmbliAt7EuNjp5IlZSvU8HsPOIopNkOh7T1Zd g==;
X-CSE-ConnectionGUID: NnuW2+MNR++p7HFRoAg/rA==
X-CSE-MsgGUID: QUsI2VgGTua3L7DNA620tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3987001"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3987001"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 10:46:39 -0800
X-CSE-ConnectionGUID: f99nblWQS6G79x0lrLwIoA==
X-CSE-MsgGUID: K3pu861nTRehR2ht+4aWkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; d="scan'208";a="10533207"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 10:46:39 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 10:46:39 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 19 Nov 2026 10:46:39 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.31) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 10:46:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dZb5W8Aa6L6P04ESwMSycmHT/1K833F7NvGcDaMnKiktfjGzknkp4Z6Ohc4zBy2a+yiTllctZSpE+c24g/CXgrpugWUxoIo5UCJRYXsyCAQHVgdOX8naAvZKIZzMeq0zZCcar/oZhqRwTFpXl8D8AKuCpPvH/jxYaD2+TU/BKQ4sZqnGgGM9bs1N65ROhRbn9xGBHhICQHE8Mh831TwdWdndkHBgryL2sbWDVYncZGTKH+ejYhxTNIO7rGRYTnHZhI7w7vIq7fP6NKchzdpdA0/4Q8jigj6uMWlvtToW5t5vIIs0jJde8kWjRsdS74OEnIiOmKQGyHtmC4UX9oeYZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hV7fCrvR4ucRq6PGhBd0W/KAmh508MdbvEW13AId58w=;
 b=n9+yZ/WsJ48GQMqy0bkIcJrxhVWYTjQ4kO8+1+VAn45/AGnjCZZgMBhaxHNqrRolSKct7MOaPAK3yy9Ahg1xpQe0IabtWmglBVXogUzJtuEaHEvA8HAB6lzzdkRF/tyPYyCwbQc+uQoglaRexLQAEr3pIRyMkw9KHwZ9Zk+FyYEdC8/oWx6efGxSoBEHgW77kFuWHjr8Y91gioPvzIYr0FkqieXu/Bid3pE6D6Swc4gLNXurkroWQ3lhMr8UbcHYOZtX+/vwH/rGmcllZzju4PoDJ0O5+Shs3JTtkPWrrL+xEGfVghGpIM8cXsjdZLgomLLx7Mvneq8jxFmKuwaBMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hV7fCrvR4ucRq6PGhBd0W/KAmh508MdbvEW13AId58w=;
 b=O86apZElfgMPivJDrpPQgZmx8EXiGE9kiKWhOEUdGoTs+aGdLq8fgjhVpi1UBFhtD3wuAk/QI0v8ND7Kt51La8JT3iLRumYgQF1qBiTNTo6z4eAeFRlejCEwCkOMUNxbJaxZEkuaBYhtYrhTCDwn7Hivn5Xo36o7TxcNbLX7JSg=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS3PR11MB088214.namprd11.prod.outlook.com (2603:10b6:8:43e::10)
 by DSVPR11MB9960.namprd11.prod.outlook.com (2603:10b6:8:3bc::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 18:46:31 +0000
Received: from DS3PR11MB088214.namprd11.prod.outlook.com
 ([fe80::ca0:ae4:8e4a:85f3]) by DS3PR11MB088214.namprd11.prod.outlook.com
 ([fe80::ca0:ae4:8e4a:85f3%4]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 18:46:31 +0000
Message-ID: <e506170f-5a7e-4804-8fac-d9581f7a0e4d@intel.com>
Date: Fri, 20 Nov 2026 00:16:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/xe_late_bind_fw: Skip OCODE late bind if
 already running
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Nilawar, Badal" <badal.nilawar@intel.com>, "Poosa, Karthik"
 <karthik.poosa@intel.com>, "Tauro, Riana" <riana.tauro@intel.com>, "Jadav,
 Raag" <raag.jadav@intel.com>, "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "Purkait, Soham" <soham.purkait@intel.com>, "Koujalagi, Mallesh"
 <mallesh.koujalagi@intel.com>
References: <20261118195705.3231462-2-sk.anirban@intel.com>
 <0b6959abf3f037aa28da11aa90bd9dc893eb0b49.camel@intel.com>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <0b6959abf3f037aa28da11aa90bd9dc893eb0b49.camel@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0007.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::6) To DS3PR11MB088214.namprd11.prod.outlook.com
 (2603:10b6:8:43e::10)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PR11MB088214:EE_|DSVPR11MB9960:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ed584d5-d5ed-4e0f-fbf5-08df466d6d51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|18002099003|22082099003|4143699003|56012099006|11063799006|261026140227099003|261022105027099003|10067099003|261028144727099003|261102123227099003|261021123027099003|261021121427099003|261009223027099003|261022113327099003;
X-Microsoft-Antispam-Message-Info: j6bt2yumxClW+XC+LJfABY1izEQr/qU65ysA2ttwxQLH7yWdE332P2eIW4xd9DGz/ELGiZ184BeVPol5Jp+1F4QP88ShlXsywHHEYeqsraVVOEbhxfiily9oF2jD8ZQRNtajyMEkEBdlHaTrzcju9TMBmx5hNfs4SuGDkAbDCvERG2/djUYhhjnnO15AUmnCkXDw+vkz+NYRtsWyWIs+51gmX9DfDB95lf1WUn1NmvaohjNHxCxXR0AaNxxCY43RjhGJeFanmuOARyHlGGRTdTqrURPUvlaiK2NgS12EQ51gpS5tOvYUXwTffbG2uHMKKqQL1+oxjWote6p3WZHcBPyVjdI6cK934Uc/SKCtUJ7wySjT9FBgkyelJAA8r5frfAf4fUy10DAL5yyfAyARufFYTsQj0v4lZdMlcruKi1XS1wb/dJgYFInR3NX4zwQbWq5V2OQjencb1SjNmQ8bWsU50n8UztHR1oJhEUe3uWruX0alSUG+1oKAIn2e7vU3IiCcm8bA+Taw/lIJGWHbpdg/kzxm5c4AvDrlWkT/i8fsAI+xHEcejjkiDgy8fmQfX3yY4szLZJrXLPkOv00oNbR3Dt6SIhjMC2O6e6Dfrb8ZJePo5GYkXJThtvX62gu+hr73sNeAcT/FFbJJMXdQxcqFDcRKQ+U5IH5RWQiCX7I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS3PR11MB088214.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006)(261026140227099003)(261022105027099003)(10067099003)(261028144727099003)(261102123227099003)(261021123027099003)(261021121427099003)(261009223027099003)(261022113327099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWZXem4ramoxZlNGNHVkck5ucUNPajl0UmplRW5lWWdLRHlNb3dVK0JEQ2FU?=
 =?utf-8?B?TllxUGRCbHMyVEZLazJXbmxuUU1qeVNaejN5a3lJQ2F1YU5zV0NlWmFwODFs?=
 =?utf-8?B?blRRQVpvY00rN3paa0xpUFdoVDdZaHI1Tll3SStMWWwzeUlPSEFybjdZSkZJ?=
 =?utf-8?B?TmI5MEtZUjdsTTkycWdDMUVndkhTMzhHelloOTR5ZnZkQUIrSFc2c2x4SWVN?=
 =?utf-8?B?bk93ZnVIQWRQY3dBTXBxRllzS21LU1BwN2JnUzE0b3RwQkZ5eUZBeXgxTzVh?=
 =?utf-8?B?N1ZRd0ExR0hWNjN5bGozNkpwOFdPU3ZvL1B3Qk1aNFVxZU1HOXlQVkFzU1FO?=
 =?utf-8?B?ZGJDQnNhUVd6aDJ0aWpQNUZROUsyU3MyUFRjZUhwOXh0Wm0yQkNvNlI5NzNt?=
 =?utf-8?B?ak93WkZLc2NTYmpneG12TnhZYWw4VUMvZ1NmZGpjaDVvTXg5TEZ4cFdmWlUv?=
 =?utf-8?B?TVV3SHRJd1EvcXNTRWJhTzNIcDE3MHNNSjFpUnJlZnFXQ0tFanh5NU4zMlJn?=
 =?utf-8?B?aU15Z1Z0UHh3M1ZWcCthZWdhS2NKbi9xMWY5bkg2VnVqeVZYQ3lFdi8rY3I1?=
 =?utf-8?B?dWJyYldKR0JVWHI1OEUva2Ztb3ErTXF6a1R5czd6YVZtZzhTR0lPVEtOSkVo?=
 =?utf-8?B?RkN0ZlY2Y1hiZzZXWDlpT0FiNzBrL0VWYktZREhUKzE2aldUazBFK0Urbm1w?=
 =?utf-8?B?eHpXNHlnUnhwYjNRODR5dXd4anU1aUg1VzZjM2FUYmJMTUxBU0pDbkFxeGlR?=
 =?utf-8?B?K1dtd0FCOHBuTDY4QVRLTVFxUmF4YUVacUJqaFErUktIcmxKNWRTOXprWVQr?=
 =?utf-8?B?Y3laQ204MXRpeTVwYUhMSkh6L3c2SkFhTlkvQzA0V3JXZjlMWEVsdXQwa0E2?=
 =?utf-8?B?ckNiRDR2KzU1VFdPcE1iNy9tZS9ZQ0pNenZHMWduYXo5ZkJDZzZzcllyalFC?=
 =?utf-8?B?UDdRZmY4b3FTTC9JTTdvWkQ5NkJIdHJiUHRxRy9TbU12dWRGODZ6MFFEYzNM?=
 =?utf-8?B?ZEMvSXZVMnNQU0xWWEkrSVdHTEV1N0N1UnVUdkd4Z0lSMmxRZVNWczFZRU0r?=
 =?utf-8?B?MzVpbjVyeWdSbDBBbFdiNUM4RTZGdmY4eTU0TFJNbGhUUGIzd0NDVzFnSnJC?=
 =?utf-8?B?c2ZUL0pmbkpjQmtsM2p6Ulk4NnBoMjRFNTR0ZjBnRWt4SmV1TmVXbURTeWhm?=
 =?utf-8?B?RzRiYVNNZWZmd3BodzgwZmpTcXdGdXI2aWc4TjlPSWljUm9tTlE1SlpuNm1L?=
 =?utf-8?B?cm1PVW5kVlpYK01XSm9LUFlENEZDZC9pRlYwVjQ3N2c3cjIzTzlPajVFTUFE?=
 =?utf-8?B?OFYvUVlTUTNkcWxKVThvYWFMUURLOFlBSnZDRElzZjRtT0NJUWwyaCtpdTd5?=
 =?utf-8?B?ZkZodnFmcWNUWnB5ZElmNEZLYURiRlJZRWJ4SHh0eGhZS0FrWVBpWjFyc1F0?=
 =?utf-8?B?bjUxNEVoNHVmcE00RS9SODJaZEJFSmRlYlpZMS8rOXMybHhzRW8zR0hqenpa?=
 =?utf-8?B?bFNUR3V6RytlUC9KekpJZ3Zkdkt3UkM2RGxWWWVBcW1xZ3l1dEcwa3BOQk1u?=
 =?utf-8?B?N08xekV0QnpVMnBHNE5DT1d6eTZCR3EwK3VDc2ZpbExzNFJLNTlRdHJuOFlh?=
 =?utf-8?B?UHVpTlI0N0tCUG54NG9ZZm9BazI2R2lOWEo4Z2l2TEFYWHdVcFl4TWM0ZEJB?=
 =?utf-8?B?RWMzdWtzR1dnNzlpUXZTZUpHcktxT3ppem54REZVK1FEZFJRRVdxOUhUQ2li?=
 =?utf-8?B?NFdGeHNka2crRUpLNGxPUDlzY2E3VFRLZ2RPMFVPaUtLc3UxUGxZLzVuZ2Yy?=
 =?utf-8?B?aUh3ZDZLb2p5TDcxWU9NMGs4bWRZN0d3MjZrK1EyOEpnWCsyUXp0aHROekZa?=
 =?utf-8?B?K3FoSVEzV3BoeVZwSzZqQ2d2NkpPTnA1akVsbnRmWEJxNFhLSDBIZGh1dTNj?=
 =?utf-8?B?aDVBRVk4RXFiVHFIL1htOXlUUTJDZFZ0azlDdDhTRktBRUQwUU1NY2JDZE9I?=
 =?utf-8?B?TTd5djJ4KzNRRTY3SWFkVFNSUy9IOFV3VmxFbGdGb3VPMjdpYnFLenBRbVVo?=
 =?utf-8?B?Z0VvdElBMFlFL2JsMGFnQkZEZVlBT2hlODIvK001TTlaZDBJYVZHeUQrM3Ri?=
 =?utf-8?B?NjVwS0htNWNsT1VEb3VZdDhHbFRiRTVxSVpBTnZlWjNsS0VZZUZoejNLa2hr?=
 =?utf-8?B?SkJTQ29lQmlBajJod0dKeWozSHFCVTVpdnJyWEkvdHpCWXlCb09YZnU3WXdp?=
 =?utf-8?B?M1JMOGdrVzBQdjArU3F1anhWZFc5bW1EdjA5d1J5WU5xYzFnMnJVZGlOdXl5?=
 =?utf-8?B?b0kvZWFGbGRqdGNMVTV6dDFxMC9wYXNRRTVjYkN0MzVLZFlGelU2QT09?=
X-Exchange-RoutingPolicyChecked: CUGG01zkBPtkDuRA23OcrAEO6AJHZaS2ASe3wI33o2eVqAgtlbg77pCeHb7idryVFgAydHglAkNe4rOb0hbr7jJVVuNkSvY3rkWJUgxhaSMTsJ8MSH3OomGNXpUijUVK0S0grl0i1H/GXmw00zTVgCxuMsDA2r8f+ZAExC9tx8b3E3g0pPLfaFPahdttsexRNusbjcyLLrfhwf/M+6OiXC7DcEpqwoWSbwOqPYde7X8+EAfGDvWwe9T9HscJnB820O2kqasz3tiQ6aRwfXv1EkoOZdDFTx+UMa98z6J0ghFKsWUhZaIDlRqdS2lcydqwm76/qQwRnspzC34VlA9dmw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ed584d5-d5ed-4e0f-fbf5-08df466d6d51
X-MS-Exchange-CrossTenant-AuthSource: DS3PR11MB088214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 18:46:31.0445 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mr5OQ23mgWi9156StM0mpsQEbuGoEQ5iIspHswSVFNnriZHdAan6pH6W3pN7cdoWYklCKxUojGgDVEIcJM2wRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR11MB9960
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
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Rodrigo,

On 19-11-2026 03:51, Vivi, Rodrigo wrote:
> On Thu, 2026-11-19 at 01:27 +0530, Sk Anirban wrote:
>> On resume, skip the OCODE push if OCODE is already running.
>> A new blob takes effect at the next device reset. Probe still
>> pushes unconditionally, version-based skipping on probe will
>> follow once a running-version mailbox is available.
>>
>> v2: Split patches (Badal)
>>      Modify the subject and commit message (Rodrigo)
>>
>> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_late_bind_fw.c | 21 ++++++++++++++++++---
>>   1 file changed, 18 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c
>> b/drivers/gpu/drm/xe/xe_late_bind_fw.c
>> index 355d7c841871..36e8e72c03a2 100644
>> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
>> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
>> @@ -306,7 +306,17 @@ static void xe_late_bind_work(struct work_struct
>> *work)
>>   	xe_pm_runtime_put(xe);
>>   }
>>   
>> -static void xe_late_bind_fw_load(struct xe_late_bind *late_bind)
>> +static bool xe_late_bind_ocode_is_loaded(struct xe_late_bind_fw
>> *lbfw)
>> +{
>> +	struct xe_device *xe = late_bind_fw_to_xe(lbfw);
>> +
>> +	if (lbfw->type != INTEL_LB_TYPE_OCODE || !xe-
>>> info.has_sysctrl)
>> +		return false;
>> +
>> +	return xe_sysctrl_is_oobmsm_fw_ready(xe);
>> +}
>> +
>> +static void xe_late_bind_fw_load(struct xe_late_bind *late_bind,
>> bool resume)
>>   {
>>   	struct xe_device *xe = late_bind_to_xe(late_bind);
>>   	struct xe_late_bind_fw *lbfw;
>> @@ -314,6 +324,11 @@ static void xe_late_bind_fw_load(struct
>> xe_late_bind *late_bind)
>>   
>>   	for (fw_id = 0; fw_id < XE_LB_FW_MAX_ID; fw_id++) {
>>   		lbfw = &late_bind->late_bind_fw[fw_id];
>> +		if (resume && lbfw->payload &&
>> xe_late_bind_ocode_is_loaded(lbfw))
> This now sends a SysCtrl mailbox command synchronously in the resume
> path, with a 500 ms timeout per wait. If SysCtrl is busy (the very
> blackout we're trying to avoid), resume stalls. v1 did the check in the
> worker.
>
> Also, please check my response to the other thread. Let's avoid even
> in the probe and only add the version check if/after FW gives us a
> reliable way.
>
> And perhaps that configfs to allow force the reload for debug and
> development cases.
Thanks for the review. Agreed on all points, for v3:

- Move the "already running" check back to the late bind worker.
- Apply the skip on both probe and resume (I will be maintaining a 
different patch for probe path).
- Add a separate patch with a configfs knob to force the OCODE reload
   at probe for debug or development.
- Version-based reload on probe will follow once the mailbox is ready to 
use.

A couple of questions before I respin:
1. For the configfs knob, should it be visible only with
    CONFIG_DRM_XE_DEBUG, and apply at probe only?
2. If the GET_APP_STATUS query itself fails/times out, should we
    push (current behaviour) or skip?

Thanks,
Anirban
>> {
>> +			drm_dbg(&xe->drm, "%s firmware already
>> loaded, skipping\n",
>> +				fw_id_to_name[lbfw->id]);
>> +			continue;
>> +		}
>>   		if (lbfw->payload) {
>>   			xe_pm_runtime_get_noresume(xe);
>>   			queue_work(late_bind->wq, &lbfw->work);
>> @@ -511,7 +526,7 @@ void xe_late_bind_pm_resume(struct xe_late_bind
>> *late_bind)
>>   	if (!late_bind->component_added || late_bind->disable)
>>   		return;
>>   
>> -	xe_late_bind_fw_load(late_bind);
>> +	xe_late_bind_fw_load(late_bind, true);
>>   }
>>   
>>   /**
>> @@ -550,7 +565,7 @@ int xe_late_bind_init(struct xe_late_bind
>> *late_bind)
>>   	if (err)
>>   		return err;
>>   
>> -	xe_late_bind_fw_load(late_bind);
>> +	xe_late_bind_fw_load(late_bind, false);
>>   
>>   	return 0;
>>   }
