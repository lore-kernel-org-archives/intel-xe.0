Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BCDDE7718B
	for <intel-xe@archiver.kernel.org>; Mon, 23 Dec 2024 10:25:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26BC510E308;
	Mon, 23 Dec 2024 10:25:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dBmCN8pG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2636210E308
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Dec 2024 10:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734949541; x=1766485541;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PgzbAC8Up0jxTHHRZ26dA43U3GV3oFFz+F6VCB2KoAE=;
 b=dBmCN8pGCDYevOVrTA9t9TATJudldKmMUTMGVjWFy3ahQSUg/UDsawgT
 oN3xYBmwici15BOPCXA4jckefnesVuMAJNzo5+4j2D3uT8uOxBMuux0qT
 H/toB8tNqKiHe/Yjj6mhtbjHocJIWdlpMiOWn8775Ki4Y2FUJ/gm3ngf/
 3MsGTsFKp9544jEPe3svvU2eagfFkuP0tlZLsL//U1SSxOPtKkrYqjhV4
 +w5vjNop4798KDvC7h3PTj362pAC/jy5XKVLVn1AfXZCBaQAlDHbORL8i
 CD1ni/CBfgG1J66nyDp6C7lrdYzXfF9csfDJs4uPnPDqJqsptKtb3Cxa2 g==;
X-CSE-ConnectionGUID: uI8FjH37TN+cj6Dxpj5M0Q==
X-CSE-MsgGUID: CzvtsJxLTW6q6x0ijpKwzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11294"; a="46417953"
X-IronPort-AV: E=Sophos;i="6.12,256,1728975600"; d="scan'208";a="46417953"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2024 02:25:41 -0800
X-CSE-ConnectionGUID: 57Ut4ltyRuGzDnPv6L9Lvg==
X-CSE-MsgGUID: rHvq+470TAy6aPcbpbcCBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,256,1728975600"; d="scan'208";a="98986531"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Dec 2024 02:25:40 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 23 Dec 2024 02:25:40 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 23 Dec 2024 02:25:39 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 23 Dec 2024 02:25:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E6ou1kVM2/5VDjlP5b5IVX0eDOZ9aQBt6e1Gs8QkAfb6nGxuZVkECgTAbuNWLVPprMPA94JR50Vub086/Yh9wJYV9D1wqbRnqJwYlM39z8xb1EDuNGdwWCuaGhiDh5By9gQC0KdDX7lB/JJeFg1KnH2cLGpF1hApn9n2Kp+uEGsyBY4+gP1bL0l6LTpmfIvDgpxkY8MPgMqXS1wMmV+1zmlbUjc02DMyEvt5gbgyJ9JkBl95afYxg05PppDkr++ft3ima3iKx59UaVVLA3IPWnk2kSHHbRU+1u9zHFb/Qqe9OH64GuaZYBEeYJ18KSP9p1TEWKtAqQV+3lIGvqS1hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EUJIiTd6kmkzvX4lXy5kmOMjOVTaabY7h2AsL82Mp1s=;
 b=UEO4u9uj4fwbdb0gmqZNPvJjd6OC3YBsUlu6FUQQJuLbMGyo71HdAEXP/uHVfVlUNJRFFWfDSuifrhjuYPTa5bJA3alIKcy4e0DDjU6Vi/owQyFw2H9MASA0r56bQSN+UT8kF9Q8IfrPuOrBAlhYInoXH3c8hmlzXGtSuE5YwrOZ1oJyWQbwaOOpA/iQPvbEhjJR4/jkRCTE31joDy5sBjZhOZgwYGBeoa9UAh96620eIFE1Xv0x4LjJVUlG43pir9yQR07da/fCMeK6LM+NChHHhU+n962xaRLSYvUNOq20dNL4f8TqehgN8SkHRPeb2Y67ms1VjmlHolrKDEUnUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by MN0PR11MB6205.namprd11.prod.outlook.com (2603:10b6:208:3c7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.20; Mon, 23 Dec
 2024 10:25:07 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%5]) with mapi id 15.20.8272.013; Mon, 23 Dec 2024
 10:25:07 +0000
Message-ID: <12fb5585-93d5-4e9b-bfdc-36c5c252efca@intel.com>
Date: Mon, 23 Dec 2024 15:54:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/xe: trace bo create
To: Oak Zeng <oak.zeng@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <Thomas.Hellstrom@linux.intel.com>, <rodrigo.vivi@intel.com>
References: <20241218164833.2364049-1-oak.zeng@intel.com>
 <20241218164833.2364049-2-oak.zeng@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20241218164833.2364049-2-oak.zeng@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PEPF000001AC.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c04::12) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|MN0PR11MB6205:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b14e1b9-8a63-4a2f-0b62-08dd233c1239
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?THVncG5LWE9PTHhaN1B2U05aZWdFRUIyQTRheTFHNksxUTM1d21jd1BBcjdQ?=
 =?utf-8?B?S2toMXAzRDc0ODRUWTliOC90dzBEcE43VmhyZTdRTTdZSUVlN2ZBYnBqWEpQ?=
 =?utf-8?B?VTNTdG9NcTN6TzFueWR5bWE0VGRTTmZLUXpzTDdhbm1lR0dVUVRBUkRXMHZn?=
 =?utf-8?B?bEw3am4zeXFXU1JuSXpwRzZYc1B4UXZyNitJTTZmb1pxNDc2SkVYcWtMMWhn?=
 =?utf-8?B?NUhkYUMwTG9weVZUOGpLMHpocVB4bkw3bnZYWDZZeEQ4VWZ4cmpNL0dmaHZU?=
 =?utf-8?B?bVRkRVY2VGUwVVVidEZ5QTNReFdONDVYUUZ3dzBTZFZaRjFac2pQWnZoMjVD?=
 =?utf-8?B?WU5PcC9YUmdsSkdYaGlYckFJaFZTQm5ZWXplZXdmbGdKNG8yY1dzcnBrcHlP?=
 =?utf-8?B?LzgvakFKOGtLS0lmOW80R2V5WkM0K1c0MlVydXFCR3VsOE1oellyMzZld2pG?=
 =?utf-8?B?Q0dkSDZyTUNMQ0g4dnhqNVZuUU9zZlFESUQrLzFSanN5ZnJUSkhQS0lVTG42?=
 =?utf-8?B?d2l5WkJvYXpML0srQmRpR25tTlhXNWgzVHBsdm1xeE8xaFdmaW5RWWFSZVBQ?=
 =?utf-8?B?MzMrdDFPK0JRaVl2Z0srVUtwUXgyTEt5TFlDYU9heHRUR3JZUWlzSXNad1pr?=
 =?utf-8?B?STFRRmhKVWVNMEVmd3grVnVFQkxoVHI2WGtNaUdtd2JzdHNWNW5Xa0ZLSk9C?=
 =?utf-8?B?MmpYQUk5SFhjQk9uM3BhMXNBc3g5elZjMlJDS29seEU5L0lPL3hoc1AyK3JX?=
 =?utf-8?B?THRuK0xSdk1COEJ0Yk5sWXN1a1AzbG5kRlJoa1FRTWRtTUgzRFkySlZBOHdD?=
 =?utf-8?B?Q3VvN2t5RHJkZHI5VzF4bWdUSmc5L0dPU0YwV25kRVNpdVVXTHdYa2lNaUNx?=
 =?utf-8?B?eG9zR3h3clAzZDRXT2FHOHFCSU1hdTFhY0xDemNCUFkwRVpwQ0g3MUFIckQ4?=
 =?utf-8?B?aG4rWlovdUVkL2JidTEvWGtpbWRjQjJ0OG5SRGQzQWQ3ODYwVXAvT3pPTVpz?=
 =?utf-8?B?SWlOZVl4S3Yzd2RBMjNlbDZKYnRvOWoxcWFtYUlPZWhDdlRzM2xGQWlUSWFs?=
 =?utf-8?B?L2FIZVhmRU1MVk9LeUxTNlV1WTdCS2E5dVdqcHNFdmFRKy9maHVrWVAxbWYx?=
 =?utf-8?B?c1hqTy84Qlhmd1h1V0czeEZnclY2aUQyMzdxb1lZTzZ3aHR2c3pkSjZ3YjdY?=
 =?utf-8?B?K1FGZGw5Rk5rMFFjTnMzQWlzU3oydzlseWdiMS9ac1hXUzNZei9oTUVmWVVV?=
 =?utf-8?B?WWFQYUkra3lpYzFUSmdINTFwQTdOVjVJUkd6QkhPUGk0dVc2eFRLY1R0OFIv?=
 =?utf-8?B?K0xEWDlLWFphcXo3cTVvdTVvb25vWTNlR2hLSkZSeGFyRi9zU25CQlFrU3pG?=
 =?utf-8?B?MkloczBvd1VrL2J6M3N2WXNXTG1TMFdWZ3ZYRGFueVFDWDZRRXgzRzdJMEk3?=
 =?utf-8?B?ODZjOVRBbTMrR3VoeWVub3ZyeXZtcDJvMkxvNTFSZ0pURS9SVkJSSHJySnZV?=
 =?utf-8?B?a29ST21qdi9CaWZTNmxWeHBqL1BYUXpqRmpReUdkdWR5ZGVhVmxiQW1UNmRV?=
 =?utf-8?B?LzRMVEYvMU5mNmlqRk1Seld1am0rMVBMU3FYU1ZJaENJODF1dk03ZzM0bmxZ?=
 =?utf-8?B?dmNWTm1md1lqMW9keGxiMUhqQkwwd1dnWWZjbjYyVVV6S1ZsMmY0dEp0Qjdi?=
 =?utf-8?B?YytQQVNFcUtjR0dCMVpFeHQ3KzZDclpaQndDbmI0V3l2V01xbUNRaWxMSXRv?=
 =?utf-8?B?bERCVUlpRmthRVp6SUxvMFg3WEU1aUJERklPTnA1R2drakFlY1pySnBjRU9p?=
 =?utf-8?B?dGdTVDNHSlpMUDdHb29uYWpwejVvS3BjT2JibEtiTUFucU9jUTEybTJUWEE0?=
 =?utf-8?Q?tyN5p3Kz1pwEh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:vi; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVY3aXZGMy9weWdxTi9WOFVjc01EamV2UVVDUDRPT3hkZXF4WmdHMXFmcTlU?=
 =?utf-8?B?ZWxlTHF2UHhGYS8xUGcyRnNYNUhRTlIzRVNPYjQrWWtXZUZySnFRdENhUmlP?=
 =?utf-8?B?SkNrMElYS1RvQ2dydytpYmg4emRTc0Jpclp5SW52T1ZJMVQzQU11NkhnSjJn?=
 =?utf-8?B?NlJtODdjU0gzbzl3cnRaNGFBanhYaEhIOTVvOEtnYWMwMEROREI1aFJkZmZE?=
 =?utf-8?B?WEF6cFJ3VlJuK2d3d0JkcDZzWlJLekV4M2VIb3NCa2tLTlc5NzNjUGJWcitw?=
 =?utf-8?B?eE43STVYbDRERXlsN1p5clRTVTkvc1RZWVlZdjIxNVJXUnhtSk5pNTUra3lQ?=
 =?utf-8?B?WlJKWTIzbDlKelFQRWZMdWFGbDIxOXdvN0VJaTI2V2c5d2x1cHRTYkRCMDBr?=
 =?utf-8?B?a1hMOUlsYTM4UnVLczhpMW1zdEk3MUlEQ1BUamd6Z1dzTnZpZGZHMVFpMHF4?=
 =?utf-8?B?MHRWZ3JCZW02NmNqTnBveGdLMnVJRUNyU3ovN3B4ZzdCSEdQZWdCOTNJN1cz?=
 =?utf-8?B?aTh5Y3phNTZJQUhhN1NUWTZYN3dEaDRxU2M1UUVQQjZJTVhTTHNIOEc3Qm9i?=
 =?utf-8?B?dkZYWWRCNUNqdnp6WXpiQmtYM2dEbmQ5NlNTaFdyNnBIU29WdDhCUFFJNFg1?=
 =?utf-8?B?TUVYMFZZNEFJVXFLa2ZMODV0YnFpRFBmUzN6RTRRVnBjV3FUT29oM2FLdUlQ?=
 =?utf-8?B?NzRvWmtsTWlCU2Q3QTNVWWN3OURCVHhiR3NESkZpeXNHMTQ5NG1DcUNaZENy?=
 =?utf-8?B?RWR2ZTBIZGllb0l5bk9NenBpdDYxSm5tYkRjajBUcUtlMTBYNlR6N0pSVExF?=
 =?utf-8?B?SlZRYkRxdzBHRzNoVDVkcnhWZ01hS05WVVZ3SEUvdklvU1NVb0VEQnM2SHZy?=
 =?utf-8?B?TGowLzFpZSthUlBWcS82YTNVMGdMSXZLdkxuZFdaWWdUSlBxOG9IVUxhK2FO?=
 =?utf-8?B?OTJQQWREU0R1ZVkyRTdpSHZSSllia0ZUVWJRT3k5bjM5dFgzTWVkVXRCcUU4?=
 =?utf-8?B?VE9Pak4zMEZ3aHdIaXFOcW16VUdPWkhQcTh1OThiZGRMcWtHaG11QlVVWU1V?=
 =?utf-8?B?dVUyMSs1dnRvb2hHQUYraTdtczl2NUZoUC9vYStCbnphM3ZaY0YybzVRZUhG?=
 =?utf-8?B?WE1kY3R3bXF6SS9oNllIOTdWa0w5RllsaFQrR1h3RGRLOUpVL0s0ajNPeXQr?=
 =?utf-8?B?amZyQ1dQazVTVjhzbzVOL3pDMlhDdzE4Y1ExSUNuU0duSURpdkZnTTVOQzFJ?=
 =?utf-8?B?VFpMK0JsS2Q3VnNUNHc1ZG91dEhzb2hKdkZiR2ZHS20rVkdSM05DckpDcnhX?=
 =?utf-8?B?ZU9VQUFxeHlqc0pLcllrZThpWUQzRzdTcXhnN1ovLzlFUUhNblRjQjdrRit0?=
 =?utf-8?B?bTh2OXR3MHRHN0lOMFRCMDd4SlJUTnoxdDJUdjBPM2JKY1c5a3JPQldoVHZI?=
 =?utf-8?B?NEttbkoxWFViRlZBWTdjTWMrSUpHU0RkRlJSQ29BOGozdEk1M3hJRTIrMjFo?=
 =?utf-8?B?bjBDcjhwRnptcmphdjVVL0g0VGNHNE54SHBnWVJ3ak5sdDFka1NML1B1MXJl?=
 =?utf-8?B?SnR6QzZ3TlVNQzVsL05mZmNOQTFrTzhEUHZEUmJtdVlUS0tnRzJpdllpNnMz?=
 =?utf-8?B?Z1F0bVdzL0MrUGtCa0Z4ZWszNU9uT3dWR0FXcmgzZFRoZWVWN2ZzRmIxTzE0?=
 =?utf-8?B?WEZKTG9pNXRyVEpaZURKTitoYU9UTXh3Mlh4NXpHQnpxMlFxUHNXM2hWRjVj?=
 =?utf-8?B?MXlNQVNnVFRLL1NRUzRJbkMyVUpRbE5kN1hrUG9ibVlHbG1IcGViQ0JacWpV?=
 =?utf-8?B?bDZWSDFqdnVvaTJpQmhObTJmc3dTcDJ6WUxxSzlEL0E0YnlzSEtPUStRMUdJ?=
 =?utf-8?B?ckdPMlNlUXRDMlI4ZlZxbFJmNml6L0pVM0VtVG1qTHd1Y0tXem93Uzk1Ullm?=
 =?utf-8?B?L1dwZmhYREJoZllkYmtaWmo4NXBpZ0R6QmR6UVYwWENJZE9jVDFXT0RXSlh0?=
 =?utf-8?B?L3NUN080UldJU0NXd2ZZcytNUnRRMnBBb29RcTFORTFXNzJ1d0tBQ2JBZUNh?=
 =?utf-8?B?NkJrWDhRZUdacXNqZFdFU2sraWRHM1JjcEJKMnM5aFh2eWE5WE5Ed0wvWURW?=
 =?utf-8?B?YzBhMVZ3M0RhdStZd2lWQ3ZVdW1URXU4dEU0YnVHMlp5NTBhNWE2QUhUS2Ni?=
 =?utf-8?Q?KOvbCmQTh9ebqgImiHJdTac=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b14e1b9-8a63-4a2f-0b62-08dd233c1239
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2024 10:25:07.0672 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /hzX4TlPi8OqwsWZhL62+CrEQaPnBRo7m+1ajMNTLQ3dmB/GEL9Sx//YuTrup7uyxd3WA8vS3KpwT1FypiZgkgEg4Qyaw1Y1+VUe+ZZ6gR8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6205
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



On 18-12-2024 22:18, Oak Zeng wrote:
> Add a tracepoint to trace bo create.
> 
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_bo.c       | 1 +
>   drivers/gpu/drm/xe/xe_trace_bo.h | 5 +++++
>   2 files changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index abdeed1c325ea..61f4326e96504 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1649,6 +1649,7 @@ __xe_bo_create_locked(struct xe_device *xe,
>   		}
>   	}
>   
> +	trace_xe_bo_create(bo);
>   	return bo;
>   
>   err_unlock_put_bo:
> diff --git a/drivers/gpu/drm/xe/xe_trace_bo.h b/drivers/gpu/drm/xe/xe_trace_bo.h
> index 1762dd30ba6dc..53807f2ef4808 100644
> --- a/drivers/gpu/drm/xe/xe_trace_bo.h
> +++ b/drivers/gpu/drm/xe/xe_trace_bo.h
> @@ -53,6 +53,11 @@ DEFINE_EVENT(xe_bo, xe_bo_validate,
>   	     TP_ARGS(bo)
>   );
>   
> +DEFINE_EVENT(xe_bo, xe_bo_create,
> +	     TP_PROTO(struct xe_bo *bo),
> +	     TP_ARGS(bo)
> +);
> +

Looks good.
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>   TRACE_EVENT(xe_bo_move,
>   	    TP_PROTO(struct xe_bo *bo, uint32_t new_placement, uint32_t old_placement,
>   		     bool move_lacks_source),

