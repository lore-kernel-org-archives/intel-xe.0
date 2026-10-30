Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3984606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 17:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZXiemOe1
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83E1710E7FA;
	Fri, 30 Oct 2026 17:50:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6A2810E7FA
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Oct 2026 17:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793382653; x=1824918653;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TwKjTWucHVpkM68BgmNGyMkirMHuV7OMXTCjLw6Pgaw=;
 b=ZXiemOe1WqFueolKBBoDjo1c3xJPmDmHVXT/7wY5V/NPfXgeCsoNagII
 g4KXv2hHWCNCiWks0cxPEEVMiugpm8gZSVKVw9M8Rdxp0WoXWb5wFYu1M
 ZK0HmuMtv/yRWIklEPrpNiNpAmeC7SinVGOG8A4T3JLK1QOAfhejX0o5U
 qv1fB5rM22xpO/eCol/yViABYnieWAVhrVg5VGU2xOattFUCA9TZ1wCT0
 g4qjk1UcACp50FNgbOHAg/uQcPPliE600z2aukgxrTJVan1+b9vwnsdO8
 A+fanLOzow2cnsaJdhVt6TocMi24d6vNx+rit3g4ueJcDfLHEcCsm85GY A==;
X-CSE-ConnectionGUID: RE2kN6sbSaeyycKzb2kz+Q==
X-CSE-MsgGUID: H+AUgjMRS8WqGM3aw91Fuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2169789"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2169789"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 10:50:52 -0700
X-CSE-ConnectionGUID: m+GYyv9/Taq54gdu4jzG0g==
X-CSE-MsgGUID: KOV5rw/9S0i0M67Qc8SM5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5901386"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 10:50:34 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 30 Oct 2026 10:50:33 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 30 Oct 2026 10:50:33 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.52) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 30 Oct 2026 10:50:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aYJmeBAGrf3auINqR0Lmy1txpe8O1INkpsfRuMBFUd7rHRGw1rgCnoezvIzb6ZwPYGvgykUYpzMzuiCw5NgmfErQGqXgeswVkF+Fpd5UzhozRUE/G2BIgpxtxZSRlr8gj7D5A4l6Sk1DoBT2h6IEkHuE76r28erdt8wJagWeM+ZHcKG+bKzK6kJKwecKkZCwRjfH0aczB83Mpbw/3m6YoSSFEFYLATkMzhtO6PdSMT2dUyWVu5NV5RcAQkw8lvzA01Fqd4YJ7BXzOfZgfvxxgsldxaAt6sQlLZObl27jhZQ1gWRM3IWQfowx+1xmRjZfHqH6VvGQink0V1Cx/R1XAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=umRteLFbpl+a6KUd2xVAgeQCiw9AXODH2VHSdoSaZIk=;
 b=NJPEqse38WWTHQMTMzhM0tbn0fwCcHu7ovCBI2z6j/uhT7WJhz5cXf3p2LMfEybJrL18YVmSGTwuIMbWMbW2M4GaTOpml9CyWhqbIUFt8hCJ/rhj+3NpUGtobNUXNzdl+hA/1UuMjL8ynYjFwsuBa8U4wnzXZTDw27DTfx0WcSvNTA3VQl4caXql7JCK4DsXGDN7JY7EapjBNw36PRkPOtjMY7tMknPlQAi3jgK0ceIqmHhcPp5Vac9reBsQeIlwy2CcBDV54dUJMn/790CEWcanwPB6LVnfjG2kLMQwBoBwksHkCoy2lvQGVymQM0cfBvB0a1riVYzfwTGBg3gncw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV2PR11MB183078.namprd11.prod.outlook.com
 (2603:10b6:408:417::8) by IA1PR11MB7943.namprd11.prod.outlook.com
 (2603:10b6:208:3fc::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 17:50:31 +0000
Received: from LV2PR11MB183078.namprd11.prod.outlook.com
 ([fe80::74b6:e45c:3f37:ff0f]) by LV2PR11MB183078.namprd11.prod.outlook.com
 ([fe80::74b6:e45c:3f37:ff0f%4]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 17:50:31 +0000
Message-ID: <36a39b7b-2eb0-4abf-85c3-1436d84d2dff@intel.com>
Date: Fri, 30 Oct 2026 10:50:28 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/hwmon: Use overflows_type() for temperature
 range check
To: Jani Nikula <jani.nikula@linux.intel.com>, Mallesh Koujalagi
 <mallesh.koujalagi@intel.com>, <intel-xe@lists.freedesktop.org>,
 <rodrigo.vivi@intel.com>, <matthew.brost@intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <sk.anirban@intel.com>,
 <raag.jadav@intel.com>, <aravind.iddamsetty@linux.intel.com>
References: <20261023143632.461084-2-mallesh.koujalagi@intel.com>
 <06bca621edbbf5fae4b83a4f5a84535204df9db1@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <06bca621edbbf5fae4b83a4f5a84535204df9db1@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH8P220CA0027.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:348::8) To LV2PR11MB183078.namprd11.prod.outlook.com
 (2603:10b6:408:417::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR11MB183078:EE_|IA1PR11MB7943:EE_
X-MS-Office365-Filtering-Correlation-Id: 6eb806a9-fedf-4aa6-a859-08df36ae4a52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|22082099003|18002099003|4143699003|56012099006|11063799006|261026140227099003|261022105027099003|261022115727099003|261028144727099003|261021123027099003|261021121427099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info: i+mcqRcwQb48LaAs+sTiBSb21vsmdv7Mp1w+WuZc8bmY+W/mq/nSZind7RimDtpQgUSWdmw6SudFPa96Ml+StY+gJFAZn35RlIQShPhATl5A4VZ6ECx650xhrXaPZG1I8erTOKCTHbE10jFWZO7QU8BWbK733fYn+RswayelQ2MoxOdnM7mUWYhI8Ov8okYau9fAhawItlhZaywsmVriqulhwqa4jL5R5uVmhb/PzoFX9/Lq94pUWptDehvdmQuypBQy5PQgEEHdIs7YJKgKiBeMkoUCFOQa8KRTvbPcW3JF6I+2ulbEBj3/kOD+Vw6suozs71kEl5nn8VqWjgze4/4bRkTdmF7y5e8OzKPzz1rp4viN8OZz4h8pXU2OPR1w1qFbl8ExuoA94jG+ovkgkJcbXatcKmN+2nFJZOXL32GONaDhOYQSgzw19qt9EBILxi3sa2JRpay3pDiGZVYe235AlnztRv16rrB1Yvzu1DGCUYwVFwq3UtMsbVI7z5TOrR03wRLsaDcBY8T0Ea8H0+PdibXU/tt0+woCijIK+itzAmd+kmNX47cU/AYxyLH8NvgD8qi6nTWJmtr+6z+hnNnbptUhty7F7y4tQhe9xr7Ji0Gw+pFheZw5ZT4QuKolUZdZ8PYJoqitohYpkNhcMrncrEgu1rZ1JvKALWU0Blg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR11MB183078.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(22082099003)(18002099003)(4143699003)(56012099006)(11063799006)(261026140227099003)(261022105027099003)(261022115727099003)(261028144727099003)(261021123027099003)(261021121427099003)(261009223027099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aDRDbW9jaFZoYkRrR2g3LzRMNDI5S09kUi9ad2FvMyt4ZWo0eGZzcDEwaEVa?=
 =?utf-8?B?OGFRc1ZFdDN4T0ZURjlydWRvSVozRFBHREhtS3JIN3lnbWNxeStFeU9tblhi?=
 =?utf-8?B?MklUZ1VldHJCY1VuYU5ia05najQ5akt3QkdVc2YvemhyNUozNzloMDd5YTR6?=
 =?utf-8?B?aEl5cm4rNUFZaEtpRFZBRnFOcTQxdjFjRWhtMEFUVFUvWlRObmVpL0g3Tjlw?=
 =?utf-8?B?SU5jS0NwNEpNZjFWNUtDL1FLZlR5UC9zd2NwSEdLMVFVVkJZUU5vOE9zU25L?=
 =?utf-8?B?TEk2YllCUlVpK1NWNnJaYmRsWVpzeDJHSE51TUFvMGE0dHVWK3BBMnF3YlVC?=
 =?utf-8?B?aktXbTZTbzJVdW9RYXBmMEhOL29rbENlbytxUWpFaW40NjB6L3lyNjBodkty?=
 =?utf-8?B?OXRNblMwRFpYRWFBcnRId09QcG5NYmVtK1lxam5wUlB5ZzF4YjRSSWdqQjFD?=
 =?utf-8?B?S1F3a0JueWRKdkNxY1hsT0s2YiswRHREL2pvS1Z3emhqQVJpV3JyUS9lTmdV?=
 =?utf-8?B?aWRjY3ZtckM1L3JhU2lDRDFWVDF5bWhUdURyeGlwL1FKTWk1a2lWZmVMZG85?=
 =?utf-8?B?dVB6VXlqZW9WTmdEZGRpVzdwNk9PaHN2clNjVGZjWG9id2FkR1R6ck0xSjN2?=
 =?utf-8?B?dVdIaFNiYnB5aEtVQ2lUTDV3S0tkRnpNTXROVzhvWjF3S0JpdkZuWXlJQlN4?=
 =?utf-8?B?K3hyaFRqQWdIYmpyaC92Sm1hRUQxTFdxS1VFWXp5bUpnazYyZFN6Zk42aFo1?=
 =?utf-8?B?MFUzNURUOFltc3NHb1FBbjRvT2xiYWltOTJIUXp1dlRLbDRLUHpIaXhkWHNy?=
 =?utf-8?B?c3g1S3NwRGFYQXhQTDJIM1ZyODlOSnFBbEVGY2wwM3lpZmtNZjFZQ2Q1QmNG?=
 =?utf-8?B?NkJUcXVpVGgrendRUDVHRS91eDFpTnljbElzaWR2U3d0Qm9kcVRzSkZ3alZR?=
 =?utf-8?B?ZEJrS1dVUUFFWEFZVVdCaGg3Z3ZSa3pNb1JPVDA4Z2VDZGxpS1c0cGZ1MWEz?=
 =?utf-8?B?TmtwL3pXVUxRVjlZa3VnV1JPSGZtN0FPT3pONUhmOWdsMlFDSm9JRzZlRVpK?=
 =?utf-8?B?cVY1Tmhoak9oZG5WY1ZEaWpNRWR3NlBlK2UxU1lkNVJCN1pwVkVUa2dIdEQr?=
 =?utf-8?B?Y0tYZTlIMzJnYWgzRmM1U1F1aWRmdzZseHNENHZmNjN2aE5CczljbUpWK3pE?=
 =?utf-8?B?YW5hbmhyVHVkRUFjZFFXSWVWM1NPbTBXcDc1QThTbE55TGhkMm9USUh6dWJw?=
 =?utf-8?B?d1Vidm5FTWp3ZHluUFBFbExNdHN3NVpJRjNZZWFOZGpJeG1Ic3VwTDZLU0RD?=
 =?utf-8?B?cXNLY2xBUUVhOHA1blpjam1TZU16V1Z2SFg5WHl4R29iUWhlZzFRWmdYdWxw?=
 =?utf-8?B?OGQxRUJNc29UMmFEcEFscHk0eEJSb0d4UGlsVEh3TEUvVVhtTEF4L3R2Qmw0?=
 =?utf-8?B?bUxwNXA2MDZBV2xDaCtFekppZHNJZVdCSTRhMnpXTE5rSnY4eGQ3YTFmbnBi?=
 =?utf-8?B?UTVwQzVhQXJYZi8xM0k5dmhsTzRqaUZMbGI4b0dOMUlwSzFIV1hZMWtTQnVk?=
 =?utf-8?B?NTlOcTVJL0Q0RUlxcUQwb1VabytQd3VOcW5DTW5iVnRDWFdwSHNnMGt6c0xt?=
 =?utf-8?B?cEFrbUlnM2oxdjVzRTFVZ3AxV1YzM01ER2ZoTVlYeGlmWE1VaUt3eTJWRXQv?=
 =?utf-8?B?aUJMaVN6ekgySEJZbFc2VXg5dmdMeXN3WE9KV0RVWWNyQmpLN3FDSzNuNHF6?=
 =?utf-8?B?bXpaY090YU42TkdLNXM5LzRXMGZzSlJrWm5hSVlFWnFZS2psa05LKzhoRmRV?=
 =?utf-8?B?NUQwR3F5S2ZabXJpazd4b0NaRitVMXFFYXYxUlNtU2ErRDliS1M4aDdab1RY?=
 =?utf-8?B?enN2UERCdFlkQVQrS2tXZlp4VmswL0dJTVp1aTlXcnZuWkRIQ1BjQWh2bDFU?=
 =?utf-8?B?QkFySFEwU3N2bGZ2TEtLZDhOa21NajRiNE91QWdMR1d2Q3pUWW9yMXQ4M01Z?=
 =?utf-8?B?N1h3K3NjMW1IM3JEYXJGUDAxYWVXdE0wZlJRQmxNU1VveTk2eFJiT3NXSFY4?=
 =?utf-8?B?K3JZWjl3NTAyZmVxNFUwN3BHN2xXaHBiMDRGNmdRYmRXSkpXb1h4S3NJV0gy?=
 =?utf-8?B?d0w5VFk0eThMaExpK2FSa25sUHREaUZkaU1yNHJnbmhWR0p5Q2s0RG1tMVNB?=
 =?utf-8?B?NzYwR0ZsLzJuN29SekQ5TE1QamgrUjI2MnVhbXg3YWlpTFhwMytRTERUc1Nu?=
 =?utf-8?B?cHVLaHVNYUNYZlQvVHNEc2dVdUdhem5UNXRoS1dNcVJlWmlmK0VTVnpYdXlZ?=
 =?utf-8?B?cGU3UDBZUUVyN3o2Z29nRG9BemNIMzhlY2VIQ1Z2OElmSWNuMjYwZmhsZEtq?=
 =?utf-8?Q?+g4G4LHuRBa54SAc=3D?=
X-Exchange-RoutingPolicyChecked: uUCvURw2Q3gJtmKcwx7huekiEgFfh4qsYhoXCm/PXiC5PUsU7xW7fhuLCvK72y56qgCswoqN2c+TKVRCb4eDGl9Lu0utMFX2sRfj0D9s7LMy3oKfTzV0naDDeDX0U0UVTBOkVa5L4GsI57ppT5GjnYKfKYWc6hpjsA+OGY6dcQtNU65WaaH4XBLy06yCIWuPaFen+q9BkqXS9be0Vl19Q66VKTcPHNvFwZhts/u6QUa+DurdprwPbjnlRiprw1wzHHnCOSVhyrhgvswNlardG+HZj3Oa31HRvOAoLv9zzGhngAGenIa5UgtEVtt2TlyRKXGoZ3o+5s36K4vkVvAyEA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eb806a9-fedf-4aa6-a859-08df36ae4a52
X-MS-Exchange-CrossTenant-AuthSource: LV2PR11MB183078.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 17:50:31.0401 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uo5H26T6fkSUj/K0K1c0DCayqcwdB9WVvKTnpPYXrF/lzOuxNTZi425E6R96CXMSUlDKEwkUh9Pa01ckKDwWD+EcEr9p7CaynpNxieaKW+w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7943
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


On 10/27/2026 9:08 AM, Jani Nikula wrote:
> On Fri, 23 Oct 2026, Mallesh Koujalagi <mallesh.koujalagi@intel.com> wrote:
>> The temperature value is calculated as an s64 before being stored
>> in a long. Check whether the value fits in the target type using
>> overflows_type() instead of comparing against LONG_MAX directly.
>>
>> This keeps the overflow check correct on both 32-bit and 64-bit
>> systems and avoids architecture-specific handling.
>>
>> Fixes: 24ec15d64617 ("drm/xe/hwmon: Decode CRI temperature registers as IEEE-754")
>> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>

Pushed. Thanks for the patch.

Vinay.

> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
>
>> ---
>> v2:
>> - Use overflows_type(), instead of #ifdef. (Jani)
>> ---
>>   drivers/gpu/drm/xe/xe_hwmon.c | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>> index 42acfeb8818c..515b288f18e5 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -6,6 +6,7 @@
>>   #include <linux/hwmon-sysfs.h>
>>   #include <linux/hwmon.h>
>>   #include <linux/jiffies.h>
>> +#include <linux/overflow.h>
>>   #include <linux/types.h>
>>   #include <linux/units.h>
>>   
>> @@ -1322,8 +1323,8 @@ static int xe_hwmon_temperature_decode(u32 reg_val, long *temperature)
>>   		value = 0;
>>   	}
>>   
>> -	/* Ensure the magnitude fits in long, which is 32-bit on some arches. */
>> -	if (value > LONG_MAX)
>> +	/* Ensure the decoded value fits in a long. */
>> +	if (overflows_type(value, *temperature))
>>   		return -ERANGE;
>>   
>>   	if (reg_val & IEEE754_SIGN)
