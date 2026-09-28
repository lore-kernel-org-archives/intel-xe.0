Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C43ADC9832F
	for <intel-xe@archiver.kernel.org>; Mon, 28 Sep 2026 08:55:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 738C010E828;
	Mon, 28 Sep 2026 08:55:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VXPGZWso";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26CFB10E828
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Sep 2026 08:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790585740; x=1822121740;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ium/Wle2Qn31xdLYk/Kvita1NJLBxRNkiK3v41rbsn8=;
 b=VXPGZWsonAZ+dJDzMgjhE1Nk5Aa9j9Hyi9eQDZp4L6LJXFsluibSVJ4O
 RzYH6NH3V3mi6sgqO8ZUhmrOuaNa5Z+5byakZa3G/q/KNgbc4LpfA5j5e
 VKm9EwBUQ0NxFvaqlFFgFhuyDymD8xAhPcBjhSnL884NkzOCx4xUL++/K
 /xiYQVUnrZFIgPy6URMr794LcZKre+UH9m9F1eF4/qhWLChFQ0/SdRuXl
 K85LDoLrETWlmqJrNhHRAImNI2nR3QltnM4CdFhSQ6HogBPi8EaPqWG7r
 yFaT9hD1MTvHPRVN+1bGZXuk/LSuY5nIR0W+49yG6HwVfhyaramNbu0dn A==;
X-CSE-ConnectionGUID: HTkCHOqMTPmWI05vbLZPmA==
X-CSE-MsgGUID: R3yLBt1wQFeK/8it2OaUhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="113063175"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="113063175"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 01:55:40 -0700
X-CSE-ConnectionGUID: 0KO10uE6S++U0+1DMeEJzw==
X-CSE-MsgGUID: aXb7hDbcT6yVjBLMd8qP2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="278348065"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 01:55:40 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 01:55:38 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 28 Sep 2026 01:55:38 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.67) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 01:55:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wM3UH8BeRClo63DUQNrLKVD7gme79Ux+39QYF2HFSG/VerZiLWlQl6st0j6+3Bho/q5hAzqNzgCkBD0DvmkFpjZLPYYfPOTjn1P8Mg3X9tdrW6xAgaQKQMKi+1pfOV9ZI4hWU22WebNpZjFh9CFpohAHBm/I9azHguJxDM5MruXOpzR76KMoQwvduvF4Xxsg5rhVlG7lr3XSVLEgMVR5QaRiWFsbnhCBVVWiVjqwB5frucRfW626YyDVNNyk6UNP0kp0FwpCOfJFpCIBKIVnwNcPCdq5mt0xvTXuUW8IqyCXlR6LGcTFHtafSulXUqqMdYaPV2qLGKJIFNyHwQOPUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hW/VUybI8Gmz/sOU6LErVYJ5EstAI9LVSswjT6dkgXQ=;
 b=ReKGWxeYFn4cTil0WhUAMn59LSSiKDob6o4Y6Un2TkcOKEnMdYK3yjE6VhXakDDzzSIaAcqTYPoe1TDaHeZpUaHNUWgxnT3CO2kOb4u0zno7f6i2jw9//OsgmSSvazHHGxh9av3AxwlFyn9kXJ9cRLseX1WJM7nG3gHM3Mq8f3fRMejO6b6slGB+3TkyrbX0QuPMosf0vPhW8gULn6GbDS7XGdlt076Rbmd2ZFl2NId/TWyaUzyg0Vg83Y3d7va53s/wHnHuMQLMCOijcgfFsg5luplFkcGw0rkbzXpN6voJ94zKw3/yC23yhUNhYSbEoEtKwv+lJOjGdmjdf/qUhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by MN6PR11MB8145.namprd11.prod.outlook.com
 (2603:10b6:208:474::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 08:55:35 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687%6]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 08:55:35 +0000
Message-ID: <c62890f7-43fd-4176-9d0b-74f571602209@intel.com>
Date: Mon, 28 Sep 2026 14:25:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] drm/xe/xe_ras: Handle page offline requests for
 device memory ecc errors
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>, <tejas.upadhyay@intel.com>
References: <20260928061830.417395-8-riana.tauro@intel.com>
 <20260928061830.417395-9-riana.tauro@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260928061830.417395-9-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0050.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::7) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|MN6PR11MB8145:EE_
X-MS-Office365-Filtering-Correlation-Id: 1128b0a6-afa8-45f5-cdc5-08df1d3e4279
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|22082099003|18002099003|4143699003|10067099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: 5xJwrimfV/W2KPOs+DfCFltVaW5Ee6nL2Vqlga93G8yQwCGaLjeaRnpv7yDtoHUMMyMy7wgyiQY8HMNnTOs0ngBSICRN3pee3W8o5/Lh8IslRU1GEvt/ZRKZoohFWGGRMH6ikkBa6tsK9yqy4uWM5XOs9mS0CPNAC9M1l9syCWeyt9YVoXXnyZK1jDR3kNLes2Nzz32NOCD/G+1JuPz7GUBEOO7GfA+qQmbL7eaoL8vUlNhhDzpy/K9+MotZIqAYoF/cV0kcCmRLdKrtTUKqNn5TpyBt3G7PyZwEKBRxbuZFrDkNc5Ff42bipWQfQP1fX0FmNnY6NJEVHbZxS/h8JW8R4H3m0llEidmjoFJnbqoFhgNREoDpZx47P+9YU9vU1+jM93RbLM1zWgNNnBF2MWBuJTxtdmoZHTIGVcN2UjB74pQUwFuOqIpZXsf0Dp51+lDyG/VHQV8xs4hz1wokvn8R4RNmxfdp7qmwQw/NK8zt0ZfiS5C/PcHBpNBaCQBHyjdtKpGCfGNCudJ0f5nUJ1zbDbhdcWJY8mrUo0/SckvxzHYddTdUuCSoZNL6lW/Z/xxhRW1JnCx1O3R8tLS6ZP9GwleA3mGjmP6c55jCbi6py4ABVNNXYaXCFBV5zttQMXukfPogJZmF5NgGPh1/LdVVg9pjwZ9j07vxIir1nNo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(22082099003)(18002099003)(4143699003)(10067099003)(56012099006)(11063799006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWpzNTNvTXduYjlka1NRT1krclpOT0trNzVIS3I4V2dYeWZSK2lIa0t2NnVS?=
 =?utf-8?B?V2FOLzY0SlcrMEFWNFU5TkJXak1udHBXNDM1NTAvbm5xOUJreW5xbGlQT2dZ?=
 =?utf-8?B?QkdNWHBuaFQxcVduaExVMGdiVVVUK2ZNbmd2cEVPSE84ZkthZ2tYeElEQlp2?=
 =?utf-8?B?Yy96eEtSUHMxdXRkQTZzRnV5TkYyeThtT1BaaldheTdIMVl6K1F2OUh2SExZ?=
 =?utf-8?B?akpjVktOeEpWeFpFNWZTVlV5dE5oYkMxanE2d1lhWmYxdGVFU2dqYytDTlh1?=
 =?utf-8?B?WFMyUTdWMFF1K1luMzg0RjdyTjIyWG1Ua0NVV2s1b01vOC94bnNjd21IQ1B0?=
 =?utf-8?B?M3hpUDVtbjJKNUtBSE05Q2twbWhneDVybHNYOXpoRCtXMTdQb1BhWHVFTkJZ?=
 =?utf-8?B?Vlo5aXpXVU40TUsyd2ptS2FNU1FYSFlYeTU2Yjl0YTFEUGZyN2M5NmhHZkoz?=
 =?utf-8?B?bFI4SEVzTktpaVJSSzFabGxCZzRFNncvNDUwMlNLbGh2Wis5LytiMmZuZUpN?=
 =?utf-8?B?MXJCYnQrSEowcjFld2ZHV21HdHNtdFV3NE50ZEtsdVpYZ0JnWU56bHhWMnBk?=
 =?utf-8?B?cUtMblVITDBhNEZRdlBQdk1LTGloRHN6dmk0SWN6RjdVMC9hOXk2Zm9jdWFW?=
 =?utf-8?B?UnN1Z1V2UFUyRGo1QXVsMHRSQUxrMnQrckovd0dLaEovSFpXZG82QVlkRmtR?=
 =?utf-8?B?NUdZWEFuQ3lCOEV5c29jKytyTVhsZDVRNC9xOC9mcWNPMjd0dmZaSnRvYmZm?=
 =?utf-8?B?YVBBQS9KWkNDVFNhNWtDZU1nT2toSTlYNGlaT1pML0VLdGlLa2dBYTlhRVdL?=
 =?utf-8?B?bVkyTmEraGdlVVppekdCUVVwNFVzUTJQYWpKbTN1Z0R4R2MwTjIrM3hhaWU3?=
 =?utf-8?B?dkVyaTNwYmlHMG8xSnVPUEVhbHBlaVNGNXdoVklWV0p6ZzdnMVR4eW1lamJ4?=
 =?utf-8?B?Q2RLaDZHZUd2bkpjckVEd2hUaS9DUWR1ckJxYXJSMUxtM3FtSlIrS3VPcnB1?=
 =?utf-8?B?M1M5SWFSeGRMSzZzVnlTU2I3ZUl3UDdYVzBxR0xSNGF0djkyVUFIOHR5cG1S?=
 =?utf-8?B?RkxJL0hyZFZBL1NaSXNxdENQQldkeDZ6TWhyNFB5MzI0SzRFakhIY3E5ZmFE?=
 =?utf-8?B?NkVrVENvVEdLWE5CaENzaDFlTzNGZTRtMEYrNmZ5aC9oWGRnNHlsM2Q1dnQ5?=
 =?utf-8?B?ZS9MaW5nNFVBbHg0QkxwbDk5WnhCdnVOaEVueFJEK1ZwTFFvRG1SbEpRS09R?=
 =?utf-8?B?VjVBV0ZLU1o4ejVuTmNSWGRReERRRlVjdUU5ZU4rK0FWcS85VlVvL1FFc1Zp?=
 =?utf-8?B?MlVNRk5DSlZWU0IxUVREWGFWRE9ORlRkbjdXZGkrZmxtM3h4M3JYdWIvRGNK?=
 =?utf-8?B?aGt1NG1kQ1VsMmNnSkl2OTUwZkg3V2Z3SXgra2tRYk5lYnptTWpON0NuRVVF?=
 =?utf-8?B?YzZGdHlHZHR1R25zbU5mczl2QnJUdzdEeTNGOTEzL1lMWWRYY2xNSUYvZ1Vt?=
 =?utf-8?B?Z0xIdGgyMzZ1RjZLUHE1TVZnSFA0ZlFLc1NYc3V2WGlySDRZVWtRemVRK01F?=
 =?utf-8?B?WStDL1lQdHZBYlJoa3Mrd2FTNGl4aEtYL2ozdDdmbFd1cG1tOGVZa3BjMEJP?=
 =?utf-8?B?TGVkZWZRYmJaM0RCcWlaN3ZkclhKaVBNSTdReHRXbEhDbEY0amdmQ2NuSFBL?=
 =?utf-8?B?YS9ibzhFcHJ6S0VEakluVHVMTi9NaHp4ZUNibkFkQ3pFQ1lwckFDaTlVT2ZD?=
 =?utf-8?B?elJVUDNaRkpoKzJnanhYc2xWc3NTL2xxWjZySE04MDV2VkFYVGhNQkFtOXVS?=
 =?utf-8?B?ZlRwU2lpT1N4ZUR0UDlKMmVnZk1LSURpMkI1N0l2MHNtWVVEd0tMTmdQUytt?=
 =?utf-8?B?WUpVL1pDM3Q4YXBKemdqWDljNVZnTFNZYnpZeGRMU0dyTG9wRmZZNGpESkNK?=
 =?utf-8?B?QVBMUmduVmptdHdKMDU3ZG5UN1pKZU1ERUhFQkUzbWRVZFpLU25LYmZWUzlX?=
 =?utf-8?B?NjVOandRN1hUV0VVWmQzaHJuYXB6SEpEVVZwQ0I5UG5tdmI4UU96MUpRT3ov?=
 =?utf-8?B?aE0wdkFuVTFPZlg5enZkK2dpT3d0VDJhaUthTXhZd3ptVWZtNW0yNyt4MUt3?=
 =?utf-8?B?cjl0K3dVenpNbEVIM1FYaHM4VlZXZ1QvV1pJVEhSWlV5U2htOE12UVczOGdq?=
 =?utf-8?B?UFFkTmc1OWo0VEl4aG1NV1FpbjE3T0dQYm9FNFFzaWVqWFRqYkVKTVgxWlBm?=
 =?utf-8?B?clFrWTVmUHFlb21rYThGVFR5TVFOWlNhQyt0QlQwMG1rQy9MMmlsTGhUcHNR?=
 =?utf-8?B?NDFEOGNzcUx4UGZEaEU2akVIay84ay80MEhKdmxFYXpzaGtSZURpMU5sMTgx?=
 =?utf-8?Q?irAUEKbVGPU68Ogg=3D?=
X-Exchange-RoutingPolicyChecked: PGxb1usWL+CW76R+pZebnIwu3w2wc/7Rl+K3IT5UI/fzdNr4EV2oSWRo444Sk/PaL9Y90OE3easn6d6YqgQTnMGLzJfF4ivuPj8EjibHZT/ntBSZXZNf5U3U8Z/IqNoTOV8ZD8LR8j2Fxieue/JaXG56vPRUes5kSa3jPfk5FY5wm/O7STNr6hhL+XmLGeozgpE3M4s9KwdJ8ZqLcfTkrIwG7j6PRkR5IsWkp0S9cteda9sXZOOEG7i9b/FgoUyFc2wVizBG81X9bSInlOlli94A4pZKzgttXyzIRqi6LBjTfHn7DZRNDXK9HtJFDD7jYsgTw3wtscNQG1MU/qSK4Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1128b0a6-afa8-45f5-cdc5-08df1d3e4279
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 08:55:35.2143 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q+kq16eVrJs5cmYO0YjWntz28+E50OBWgPg+d2YU7zX0K3iQG0s0kLDc1MN/hzSksd3jSDg6Wvo1nRhmkCs26UHei1g3grdrZzLNF4oP1wM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8145
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



On 28-09-2026 11:48, Riana Tauro wrote:
> Add basic support for sending page offline/remove requests to system
> controller and use it for device memory ECC error handling.
> Pages that belong to critical BOs cannot be handled by offlining and
> require a SBR (Secondary Bus Reset).
> Pages that are configured for log-only handling are not marked as bad by
> firmware.
> 
> For all other valid page addresses, the first occurrence of error
> indicates a poison error and the page is offlined only by software.
> Firmware avoids permanently marking the page as bad. The second occurrence
> of an error indicates a Double-bit ECC error and the firmware
> permanently marks the page as bad.
> 
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
> v2: use ret in sigid logging (Mallesh)
>      remove additional log
>      use xe_assert (Michal)
> 
> v3: align address to PAGE_SIZE (sashiko, Himal)
>      rename decline to remove
>      add more descriptive logs (Himal)
> ---
>   drivers/gpu/drm/xe/xe_ras.c                   | 127 +++++++++++++++++-
>   drivers/gpu/drm/xe/xe_ras_types.h             |  35 +++++
>   drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   2 +
>   3 files changed, 159 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 7a85735c57d5..1225c561a872 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -3,6 +3,8 @@
>    * Copyright © 2026 Intel Corporation
>    */
>   
> +#include "xe_assert.h"
> +#include "xe_bo.h"
>   #include "xe_configfs.h"
>   #include "xe_debugfs.h"
>   #include "xe_device.h"
> @@ -16,6 +18,7 @@
>   #include "xe_sysctrl_event_types.h"
>   #include "xe_sysctrl_mailbox.h"
>   #include "xe_sysctrl_mailbox_types.h"
> +#include "xe_ttm_vram_mgr.h"
>   
>   #define CORE_COMPUTE_UNCORR_TYPE	GENMASK(26, 25)
>   /*
> @@ -201,6 +204,119 @@ static inline const char *comp_to_str(u8 component)
>   	return xe_ras_components[component];
>   }
>   
> +static int send_page_offline_cmd(struct xe_device *xe, u64 page_address,
> +				 enum xe_ras_page_action action)
> +{
> +	struct xe_sysctrl_mailbox_command command = {0};
> +	struct xe_ras_page_offline_request request = {0};
> +	struct xe_ras_page_offline_response response = {0};
> +	size_t rlen;
> +	int ret;
> +
> +	if (!xe->info.has_sysctrl)
> +		return 0;
> +
> +	xe_assert(xe, action < XE_RAS_PAGE_ACTION_MAX);
> +
> +	request.page_address = page_address;
> +	request.action = action;
> +
> +	if (action == XE_RAS_PAGE_ACTION_OFFLINE)
> +		xe_log_err(xe, DEVICE_MEMORY, 0, "Requesting firmware to offline page 0x%llx\n",
> +			   page_address);
> +	else
> +		xe_log_err(xe, DEVICE_MEMORY, 0, "Requesting firmware to remove page 0x%llx from queue\n",
> +			   page_address);
> +
> +	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_PAGE_OFFLINE,
> +				  &request, sizeof(request), &response, sizeof(response));
> +
> +	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
> +	if (ret) {
> +		xe_log_err(xe, SYSCTRL, ret, "failed to send page offline command\n");
> +		return ret;
> +	}
> +
> +	if (rlen != sizeof(response)) {
> +		xe_log_err(xe, SYSCTRL, -EINVAL,
> +			   "unexpected page offline response length %zu (expected %zu)\n",
> +			   rlen, sizeof(response));
> +		return -EINVAL;
> +	}
> +
> +	ret = ras_status_to_errno(response.status);
> +	if (ret)
> +		xe_log_err(xe, SYSCTRL, ret, "page offline command failed with status %u\n",
> +			   response.status);
> +
> +	return ret;
> +}
> +
> +static int handle_page_offline(struct xe_device *xe, u64 page_address, bool send_cmd)
> +{
> +	enum xe_ras_page_action action;
> +	u64 addr;
> +	int ret = 0;
> +
> +	if (!IS_ALIGNED(page_address, XE_PAGE_SIZE)) {
> +		xe_log_err(xe, SYSCTRL, -EINVAL, "Unaligned physical page address: 0x%llx\n",
> +			   page_address);
> +		return -EINVAL;
> +	}
> +
> +	addr = ALIGN_DOWN(page_address, PAGE_SIZE);
> +
> +	ret = xe_ttm_vram_handle_addr_fault(xe, addr);
> +
> +	/*
> +	 * Handle return code from address fault handling function:
> +	 *  0: Page softofflined, remove from firmware queue
> +	 * -EIO: Address belongs to a critical BO/stolen area that cannot be offlined
> +	 * -EOPNOTSUPP: Address is valid and can be offlined but user policy is not to offline
> +	 * -EEXIST: Address is soft offlined but yet to be offlined by firmware for second
> +	 * occurrence
> +	 */
> +
> +	switch (ret) {
> +	case 0:
> +		action = XE_RAS_PAGE_ACTION_REMOVE;
> +		xe_log_err(xe, DEVICE_MEMORY, ret,
> +			   "Poison detected at physical address 0x%llx, page soft-offlined\n",
> +			   page_address);
> +		break;
> +	/* User policy set to decline page offlining */
> +	case -EOPNOTSUPP:


xe_ttm_vram_handle_addr_fault() can also return -EOPNOTSUPP, since 
xe_ttm_vram_addr_to_region() may return that error as well. Either add a 
policy check alongside the existing check -EOPNOTSUPP, or change 
xe_ttm_vram_addr_to_region() to return 0 instead.


> +		action = XE_RAS_PAGE_ACTION_REMOVE;
> +		xe_log_err(xe, DEVICE_MEMORY, ret,
> +			   "Poison detected at physical address 0x%llx, user policy set to decline soft-offlining\n",
> +			   page_address);
> +		break;
> +	case -EIO:
> +		xe_log_err(xe, DEVICE_MEMORY, ret,
> +			   "Poison detected at physical address 0x%llx, page belongs to critical BO and cannot be soft-offlined\n",
> +			   page_address);
> +		return ret;
> +	case -EEXIST:
> +		action = XE_RAS_PAGE_ACTION_OFFLINE;
> +		xe_log_err(xe, DEVICE_MEMORY, ret,
> +			   "Double-bit ECC error detected at physical address 0x%llx, page soft-offlined\n",
> +			   page_address);
> +		break;
> +	default:
> +		xe_log_err(xe, DEVICE_MEMORY, ret, "Failed to handle address fault at physical address 0x%llx\n",
> +			   page_address);
> +		return 0;
> +	}
> +
> +	if (send_cmd) {
> +		ret = send_page_offline_cmd(xe, page_address, action);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
>   static bool ras_counter_is_valid(struct xe_device *xe, struct xe_ras_error_class *counter)
>   {
>   	u8 severity = counter->common.severity;
> @@ -368,11 +484,12 @@ static u8 handle_soc_internal_errors(struct xe_device *xe, struct xe_ras_error_a
>   static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_array *arr)
>   {
>   	struct xe_ras_memory_error *info = (void *)arr->details;
> +	int ret;
>   
>   	/*
>   	 * For memory errors, the recovery action depends on the error category
>   	 *
> -	 * TODO: Double-bit ECC errors: Page offlining
> +	 * Double-bit ECC errors: Page offlining
>   	 * Poison and data parity errors: Log only
>   	 * For any other memory errors, request a reset as recovery mechanism
>   	 */
> @@ -384,10 +501,10 @@ static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_
>   		xe_info(xe, "[RAS]: Data parity error detected\n");
>   		break;
>   	case XE_RAS_MEMORY_DB_ECC:
> -		xe_info(xe, "[RAS]: Double-bit ECC error detected at sw address 0x%llx\n",
> -			info->sw_address);
> -		/* TODO: Add page offlining for Double-bit ECC error */
> -		fallthrough;
> +		ret = handle_page_offline(xe, info->sw_address, true);
> +		if (ret)
> +			return XE_RAS_RECOVERY_ACTION_RESET;
> +		break;
>   	default:
>   		return XE_RAS_RECOVERY_ACTION_RESET;
>   	}
> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
> index fe6f3658a2a4..f119489bcdf2 100644
> --- a/drivers/gpu/drm/xe/xe_ras_types.h
> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> @@ -17,6 +17,19 @@
>   #define XE_RAS_MEMORY_POISON			BIT(2)
>   #define XE_RAS_MEMORY_DATA_PARITY		BIT(5)
>   
> +/**
> + * enum xe_ras_page_action - Page offline actions for page offline request
> + *
> + * @XE_RAS_PAGE_ACTION_OFFLINE: Instruct firmware to offline the page
> + * @XE_RAS_PAGE_ACTION_REMOVE: Instruct firmware to remove the page from queue
> + * @XE_RAS_PAGE_ACTION_MAX: Max value
> + */
> +enum xe_ras_page_action {
> +	XE_RAS_PAGE_ACTION_OFFLINE,
> +	XE_RAS_PAGE_ACTION_REMOVE,
> +	XE_RAS_PAGE_ACTION_MAX
> +};
> +
>   /**
>    * enum xe_ras_recovery_action - RAS recovery actions
>    *
> @@ -295,6 +308,28 @@ struct xe_ras_memory_error {
>   	u32 reserved2[10];
>   } __packed;
>   
> +/**
> + * struct xe_ras_page_offline_request - Request for page offline command
> + */
> +struct xe_ras_page_offline_request {
> +	/** @page_address: Page address (4KB aligned) */
> +	u64 page_address;
> +	/** @action: Action to be performed, see &enum xe_ras_page_action */
> +	u32 action;
> +	/** @reserved: Reserved for future use */
> +	u32 reserved;
> +} __packed;
> +
> +/**
> + * struct xe_ras_page_offline_response - Response from page offline command
> + */
> +struct xe_ras_page_offline_response {
> +	/** @status: Status of the page offline request */
> +	u32 status;
> +	/** @reserved: Reserved for future use */
> +	u32 reserved;
> +} __packed;
> +
>   /**
>    * struct xe_ras_get_health_request - Request structure for obtaining gpu health
>    */
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> index c236e5377f30..a01576bf2e73 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> @@ -30,6 +30,7 @@ enum xe_sysctrl_group {
>    * @XE_SYSCTRL_CMD_GET_THRESHOLD: Retrieve error threshold
>    * @XE_SYSCTRL_CMD_SET_THRESHOLD: Set error threshold
>    * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
> + * @XE_SYSCTRL_CMD_PAGE_OFFLINE: Instruct firmware to offline/remove a page
>    * @XE_SYSCTRL_CMD_GET_HEALTH: Retrieve gpu health
>    * @XE_SYSCTRL_CMD_SET_HEALTH: Set gpu health
>    */
> @@ -40,6 +41,7 @@ enum xe_sysctrl_gfsp_cmd {
>   	XE_SYSCTRL_CMD_GET_THRESHOLD		= 0x05,
>   	XE_SYSCTRL_CMD_SET_THRESHOLD		= 0x06,
>   	XE_SYSCTRL_CMD_GET_PENDING_EVENT	= 0x07,
> +	XE_SYSCTRL_CMD_PAGE_OFFLINE		= 0x08,
>   	XE_SYSCTRL_CMD_GET_HEALTH		= 0x0B,
>   	XE_SYSCTRL_CMD_SET_HEALTH		= 0x0C,
>   };

