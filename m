Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FEB3606A31E
	for <intel-xe@archiver.kernel.org>; Wed, 25 Nov 2026 06:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=O29az0PM;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=Zadpi6ZG
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EA9710F776;
	Wed, 25 Nov 2026 06:58:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D561810F743
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Nov 2026 06:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795589909; x=1827125909;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/0qv4T7HvPKDeUmN1o5QuOKuZhog+A769vqYa3qcMIo=;
 b=O29az0PMH/pGQVLj0mBxHnKSeg88Jz/qrzQHzg7PDEQl/PgQqAGy9ToN
 cLToyv41us8UcRX8JExN63wbvevSmi9enLOvurFDvtlZrPbYxT5e9s0j1
 /AsCHcpiYHlBIiASYJt6ej53YMukjzaZf/s72lKhwJb0IH0r5/advuCVe
 mOTyZk7UMxvtU6oHrIsdGxYIqdfjPj+ZarEof3HiEtzWaVxPRXLp8ajS8
 I32YNFINTt21WMumBeSv7ozpha4hJjGUJFjOfuNrSngtc08ccU2S45kaR
 hKYLK5kuxeVVooc/sqwsm41RqyBYrKJtmpsNmz5aZQo3MxafWuIxPZW6C Q==;
X-CSE-ConnectionGUID: glfnUVGWQF28jV4gsSFCBQ==
X-CSE-MsgGUID: mUXoBKHiR3mKVbgAed1Cfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4357871"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4357871"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 22:58:29 -0800
X-CSE-ConnectionGUID: BAQQ96CHRaygDL5i0uHhIw==
X-CSE-MsgGUID: tgnYpiXfS9WknPPNMA8Wrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; d="scan'208";a="11819503"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 22:58:28 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 22:58:28 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Tue, 24 Nov 2026 22:58:28 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.63)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 22:58:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sxZC1ddVu4i8iJEWr2S/ezgI8TONm6kzte9pK2d4UaulpRze8bwoUuJua60uaACnR3k+RU9nZAhluBac/1Bf/Z672BzE1VY3miE6MlCsFITHiP94DCZvisnTUWuwtrp16cf0ii7Y16zzeK1hy+wCnU1Bn0Yh5RVq8ml8hDFYyF20lm+cf9+w3p0GtfSDAoi5tDJJ8XV3jgTVDZ5H0EwRSnKlU4eW+0YWcl09/8kzuH1yed3GuCTcHgteAg3CXODiJWxAyjEezTV0RoL8PaIJREMxJoVfGgFw7F8SLQOYlqnbfYZRDqeeY/Ey6C7Bv6OujytzWTOM60XNDzfpcsuAnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/0qv4T7HvPKDeUmN1o5QuOKuZhog+A769vqYa3qcMIo=;
 b=JagdRog/HMmcKDk5pY5lLGwG1m0sISI2yil9z3IjhWnRZNWpIeQWdEFXRLu1q+HFTrWluAEQVS7hTqX4szM9yltmMtkQoiUTPtWSZomToltWYS2RZVaWt4HIIyydnfbDx2pGJzFpJ4020cXeK+a0i0+KV+s6lz2Tr6XMwlYSeDYCNLzpIt4Np0t/pl2/A6gU3Hd9vHRu9HUJq/ZzjeeTaVIa4RCslw60csO4DiwRb3Z58S+nAZWKcSMEBK3Mq3hvp9gbTjFG5Aebtq6WZyCINwR+3loMM1QHy2yZcDaOWFDTEV3CVbFDX3MifXJA63LJyC66AiktUT4/zdW4rx0CTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/0qv4T7HvPKDeUmN1o5QuOKuZhog+A769vqYa3qcMIo=;
 b=Zadpi6ZGmOGE8OPAJNC9Tc0L85Q10MNh1lKT3e++3GcVU7ecNfxPKm7x5LQy2prlaCeej+XvNAHhq+09VHm4JIO0nQqFwqGoUoEGO34gZ7kNhgfGTOc9lzJuwR4Kuau/jjsLIf5SDHD6OWkI3LHwo6E8oSlhZMs+dS/TNWOYMWg=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6195.namprd11.prod.outlook.com (2603:10b6:208:3e9::8)
 by SA1PR11MB7697.namprd11.prod.outlook.com (2603:10b6:806:33a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Wed, 25 Nov
 2026 06:58:19 +0000
Received: from IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391]) by IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391%5]) with mapi id 15.21.0639.012; Wed, 25 Nov 2026
 06:58:12 +0000
Message-ID: <a7d31ae3-242d-4c77-ad66-acce8b89e7c9@intel.com>
Date: Wed, 25 Nov 2026 07:58:07 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/xe/vf: Support PCIe FLR
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <piotr.piorkowski@intel.com>,
 <satyanarayana.k.v.p@intel.com>, <tomasz.lis@intel.com>
References: <20261124203604.467922-1-lukasz.laguna@intel.com>
 <20261124203604.467922-3-lukasz.laguna@intel.com>
 <awZdLzhQ_Kr1r8sg@black.igk.intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <awZdLzhQ_Kr1r8sg@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0196.eurprd06.prod.outlook.com
 (2603:10a6:802:2c::17) To IA1PR11MB6195.namprd11.prod.outlook.com
 (2603:10b6:208:3e9::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6195:EE_|SA1PR11MB7697:EE_
X-MS-Office365-Filtering-Correlation-Id: a40bbd23-229b-4f86-43ac-08df4ac1786c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|6133799003|22082099003|18002099003|4143699003|56012099006|11063799006|261102123227099003|261028144727099003|261022075727099003|261022105027099003|261026121527099003|261026140227099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info: O7xhEeJtFGYXHWPhRhXo737RGe/gb42dv/dsvruRrpUshWv/vGLa3wFuLy88S1eOdbChS/GqsuK56BFWUrJVP7cQqaWovRV8snDtxG0SYaNC2rxv1LuARr8aKX1nqTzRZ7fEttroBdfCAn8EylegM+0ntynvCGpYUSsGNgXcOvjLtzMGir3nz3b5OAbVrVg/FxdqUnbm6y/ayzpCdlJ8l6hutHO/o/Kji34oILJ9EwQYbbG+WO+tThDxY968/PfXt9ulnE/pVMokBj3IfImn8SUTEvVL9woyvjoxatKyMJt2UpgI+lYaYBGugo5ZBHb6FKGUJe+2m2ECnNSO5E2K1dRh0v1xWH3DaKfRMuY4SU4yFN4QPmCTP9lRD4bBs5tXY6OSn+KYOleIjPvVfhXbculPORWAfmJm2FNHR5ZozseYs7ke4lT6Z34WROQRk3dRcEeRWSdBLh26gw//CTdjLYWvIJYLbtIgtDNlmhge6vmgu/xjpRN9O3SoVTQJJMJ/k31HpDl/2ptvqogfPK5LEw66dRNMJiK290iaodrsI/sZxWteLXGBZF5CTh03fPbUEyq+yomN5E+Sp4eZOltKL0Smfr9BsGMkxM6sLVNmqigLHujbX+WCeGYzoqU5ihfU8JpDqjdMQNj1O/Dev7xMZLvOEUEPePTGeyQb4TxS1yY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6195.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(6133799003)(22082099003)(18002099003)(4143699003)(56012099006)(11063799006)(261102123227099003)(261028144727099003)(261022075727099003)(261022105027099003)(261026121527099003)(261026140227099003)(261021121427099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEM1MnhDQTZ2ZnhTL3JsTDJ6RnBlRXFZaGU4bFdqSmQ2OW1ZZTNoOGdBUDNq?=
 =?utf-8?B?Q2Y2a3hQdkJPakYyZUJDdThlbXdlSUdKY25hdDdIN1R1OFlxTms4ek5aZ2I5?=
 =?utf-8?B?ZUR5THloQXFZeTlRdVNzQUVsd25sODlsK0FXanhDbkNNci92UXFOc3M1S2V2?=
 =?utf-8?B?NmEvZkwvOC96bVB2R1YzUDBabjNaWnNaL3FvWEN4T0RBMnpCKzNGZ2poL3Nx?=
 =?utf-8?B?NGNmTGNSM3pXMXoxM3NvK0hXODZ4bGhDYUZmeEFoc1d2aHkxYjQ4bEFreWUw?=
 =?utf-8?B?TDcxbjdiUytmcXdSRFpUYzJRRWZUTEFMMGFTR3Z0TmxUbU9EQ3Bsc2c1aWRx?=
 =?utf-8?B?N0dCUmlrRkxpTjRybll5U09xcmdNUHZpYjBpRUU4ZkViVi9FUHgxK2lGcGdT?=
 =?utf-8?B?K3d4RVhVUkt2dEc5U21oMXQ4RXNtREk2WkxqeWExSlF4NmxQdTMzQXFLVG9k?=
 =?utf-8?B?UGwxeFh0dVB0bjg1VnJ5ZHBhVjU5c01yUWdnTm1kb2ErUVlSSS9FSTdOTldZ?=
 =?utf-8?B?M1VkREU3b2xSUmswaHppcXI0OXdpcmdMc3ZhS2pkNmFsVWhEd2JDL0RlNDlL?=
 =?utf-8?B?UzFldHNMR3Jqa2pIenpZRGRzbE50cWQzNXkycGFLYTY4SlRlMysyUlhYQjJD?=
 =?utf-8?B?ZFhDQ0hlS2VhTWF5cmo1SFF3Zm9CV2xKYXpKZHhqR2RMRi9PWjdjc2tSa3h6?=
 =?utf-8?B?Q1dFcm5neG9lWnk2S1ZRMzJnTFVaOG5NN2xMZ2l6Uk1yTUloaDJLWW5xTUNu?=
 =?utf-8?B?d3ZpV3ZMdzZIa3JWblJzKytvdHAvVkJhQUhmYUN3SmU1Nzd4clV0SnF5N3BT?=
 =?utf-8?B?V1NSbHRndGtOazZUYmVhUGxZZjFQR3JoRW5aTkJrMDI3b3RuQ0RxZXo4Q0hR?=
 =?utf-8?B?ek5uR1UxbUxVVEdZRTBDVU91TmVIOVA1M283c1lqajFYYmZYUHNtUWs3V0N4?=
 =?utf-8?B?cU5iWlQzN1BzQ2dmYUY0MjNGdEVCTDAvcHcrSnRZOU92SWJBbHRmSkZ3NHBk?=
 =?utf-8?B?NU9pSWY1UldZcmN5bFc4M1o2NzVWRWp1dTdPamNybUNkUERmTEd5TVBHb09J?=
 =?utf-8?B?eXQ1ZmozUndVR2I4QjAva2xWRllYYlVNdDQwMzYzVkFvWE1HTG1rV0dNVlQ2?=
 =?utf-8?B?bHFVMkxaVml0ZWxNcUhieVMwVDc0QnF3TjdjSTEzb0NIZDE2ZDJnd1p5WXN6?=
 =?utf-8?B?RElTWlZZaWs2UDd4V2JrSDRoZVk1NFZBWWR1cEswYjQxYWIvZTlHZlN6NFhE?=
 =?utf-8?B?enlwYUloTEVzMVRzMURvY21qUlpzSm5DZ0Z5RGNvdndBWEpRV3ZJbUdBUGdu?=
 =?utf-8?B?c3IwSUNsc2ZIV05ZcStrOGprQ0VSSTlucm9GSG9HS3NrRXJLMUNtQ0pGQUVw?=
 =?utf-8?B?MFFSSGNYQW81VEhMYWQxMHpCd1Q3a3hybHArVWNaTXJJWXpvK3VzZnd2bnA3?=
 =?utf-8?B?RGloamZmQ3VMaHRZdXZkMmRSUEJyVlBxZzJHU0JzcnlMYTlrdGxld0hRNnhL?=
 =?utf-8?B?L0h1QXp0amlIYmQwMkI2ZUVwajhKbHAwQW9JUmR6dlZvSzU1dnNwd1F1aEVm?=
 =?utf-8?B?NzFnQ1FhTjJzcVhJdUNIckNwV3pXU0M1UjVVeHpUODFNdCtHMGU2VGsyMWxK?=
 =?utf-8?B?NHo1T1FrMk9EVlNieWJLdTFxanJXRTB5dkVaT0hHNmlPdGNoVzFtcVF0WEhy?=
 =?utf-8?B?T3pLV3VldHlrVjIwTkxGYVBjZXRaYkphbzFiT1VzR3JZVHFmdzZ5YjVNOHF5?=
 =?utf-8?B?MHdUZXR5RlE5NHJtTHNVL1c0YVNqbWtQVjhVM1pBcXREeWQ0eDlES0JURzJC?=
 =?utf-8?B?clpBbVEzYWpJMS80U044TCtNS2N4MnQ3R09XQ055YkQ3RStOMXJEZFNrY3FS?=
 =?utf-8?B?TzJiMW1SVE45RjMrcXZuaEhHdUxqbFVQNmRxVHVuNmRzYU5pSW9WZllyUXBG?=
 =?utf-8?B?QUY3ZXI5QllBK1NqMUtQR3E3eTAySlZnQVhNWVA3NzZCTUNYT1NCa0JGS0VO?=
 =?utf-8?B?WmNzUDJnQ091dHkrWGFvTjA5VHZGQzh2azljeThtVkhteUFRTkxwTG0wd3hI?=
 =?utf-8?B?VUJkc2F2V0R1QnRVVDlyWDJUL2Q3Sndma2dqR2JCYXBIaW05R09uVklkZVgr?=
 =?utf-8?B?UkI2MWx5MG14eVBURENmSWNZODRLNHFkSGhYa1B0c3hyUkswSE9vWGNQTVhO?=
 =?utf-8?B?aG1ERGU4WTlwaDBjM2Z6akpWdkRDd3ZTek5wN0MrTTJJVm5QOFBWMFdoZjls?=
 =?utf-8?B?K2sxSnllVU9KSmlYcFBTSVdXbzVuUExOYk55bDk4bWFSSkwzb2JGeWV0OEls?=
 =?utf-8?B?c1JiVGNaVlpOYnFOSENpTHo5bWtQdGlTb0tsZ3lQU0ZjNUQxaFRadz09?=
X-Exchange-RoutingPolicyChecked: jxvLijJZG9JhLGHNIxDimIgYNQ/P5Op0bIXlYK985eVTkJ08Z4y/B1orKTzQapQnXmX6VZBR3C6S4SptAmwbM/ulsKL9CjvQ89OI0JI/7C6VpM+wPQHPPgTJmwnmutWRHdm+cNTGCUWCUewQntVkoXQgFqJV7NkzP9lHaevB0/Liqs9cNcpq7uivy/ynfPrqj+kdfnCIMSDSuG07BZLL3+YilX8c6PZjSehwvdpH4byGlGbAVAHXpeoJ/5FNRILL/pyCtTlamULWeoV3F5yNIj0PPLQJ8YxfA7RxOwY9q3nXuuoPIMCqrBBjZz0isU3EN0IAnLCUMQldLfnz6Hk5Xw==
X-MS-Exchange-CrossTenant-Network-Message-Id: a40bbd23-229b-4f86-43ac-08df4ac1786c
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6195.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 06:58:12.0758 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 48zxQVcYok5boPrphBtVCPy6RgVOyYF6EEx4z7gIv2fNbsRMfxsd8MW134NjKsioNkK3CsAQfdcKK3kQ3yBwig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7697
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
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 11/25/2026 04:59, Raag Jadav wrote:
> On Tue, Nov 24, 2026 at 09:36:04PM +0100, Lukasz Laguna wrote:
>> After VF FLR, GuC remains unresponsive for VF until PF completes VF
>> cleanup. Before proceeding with VF re-initialization, reset GuC VF state
>> over MMIO until GuC becomes responsive.
> I'm wondering if this can be part of vf_gt_restart() to keep things
> generic? Otherwise we'd end up with a lot of duct taping all over the
> flow like this one.

It can't go into vf_gt_restart() because the ordering matters.

After a VF FLR, the PF sanitizes the VF's resources before it sends
FLR_FINISH to GuC: it resets the VF GGTT entries and clears the VF LMEM.
GuC answering the VF again is just how we know that's done.

vf_gt_restart() runs from xe_gt_resume(), which comes after
xe_bo_restore_map() and xe_gt_reinit() have already rewritten GGTT PTEs
and the migrate page tables. Waiting there would let the PF wipe what we
just restored.

I also considered moving it to the top of the FLR block in
xe_device_resume(), but that function assumes the FLR has already
completed and the hardware state and VRAM contents are gone. For a VF,
that's only true once the PF has finished its cleanup, so the wait is a
precondition for xe_device_resume() rather than part of it.

To keep it generic, it's a single SR-IOV function, which the PF FLR support
will use as well.

I'll extend the commit description to make it clear.

Thanks,
Lukasz

