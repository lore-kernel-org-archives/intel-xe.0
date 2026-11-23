Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D46E606A31A
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 06:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=C7xUH20N;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=V+G/SwYw
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20B3C10E256;
	Mon, 23 Nov 2026 06:46:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8833C10E52F
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Nov 2026 06:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795416401; x=1826952401;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=AjXxwIQ78bGeuhqg9dz4z7MWE6kh90Z1vp5uVYHEjqk=;
 b=C7xUH20N/yQyBcZgRRGjOzUEVna6oiv0gp2/FIgWYsuCc3zTrLTvaD8j
 +YPKvwJAimwXV7b9gmxQt7jPUJPBu5h6U3XKiV1+7KlJIOOLrppRtUrqG
 pIccD4k4gmdi6Q4UF08vJu9z7LBWKScscD9B2h/6RXho2KsnNEPDiA0ev
 +xIvsVZf9gpYNi8Og1ywKQlsing2KHfofs85nM10qanev9Ds9J+F5VJzS
 zJT/Welh/vhDwcXPe1hnCbutGZRnMQtuFNR6DavSv2RujRg3PwzU4Hv+K
 /BT4myvvRQbom58y1qap71M4PDF9fNO2b8gET4uC7g9b0Q3/R6nTCxWQA Q==;
X-CSE-ConnectionGUID: BVLvR2fhQly4O1rS/Wlwmg==
X-CSE-MsgGUID: KoX0SbdyTny9Nh8rCZ0zgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4105883"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4105883"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2026 22:46:33 -0800
X-CSE-ConnectionGUID: VWEMXwiFQOu06cin/HWOxQ==
X-CSE-MsgGUID: ZAAyjoz4TaSLQsbmEfp3Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="11200533"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2026 22:46:33 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Sun, 22 Nov 2026 22:46:32 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Sun, 22 Nov 2026 22:46:32 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.23) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 22 Nov 2026 22:46:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s+9lmHcEtRNt4h4/xKuH97TWeMFh9LaMN8DhkmNQyk3kBlGZoO7Eg/pH1dprK2pn0hjA5/pZeUO0hUUSgQjpoM3NRYs8GYeDV819nMd8J8FiObOMpDfLQT9kgFriwL9HqfL47u7ATQuXi+hqFfsnn7MOPa5n1m3W9aUn36BF+WTpSVhzwmdr7kN9X0heXKL0jBjrenXElIqntGT5OVsKo7GDkYoK7ALRmKeFiQlM665e23umTLNJBBsIreYKGrTBB9nZHqDiyA9hC8vT9w8SkJUCmf2k1vyJPoX/NY02s2OBAJ62tnl7WXid7RbQDMzrwZm97r84PHjklQnv6nEDwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bUotOVxJnyHc6OH6CP6Sww+Pcfm2zIqFpSJaKd3k9u8=;
 b=uB2a1YbCga46jEa29ki3quQPuSrdkMWXCNyVVoeGzVQgVswYkgFuqmsxeLY1LZvM6MwoztxuKriA/XioCd46RFBLA6T1qgs/39MTHA1dKQHbOeVBaaf59vEoU5uals3S/uhLOTNetLP48G1YfvNbVlQhJIVeFsaJBKlUyODiaz7MfeSFWT9DTMsIrsCYhYneBNuBVIfC9eDhj10Y3FTepsQA3Dj1nCBws1otaudmwYeBEWWTsalF+mRLAXsF08WmkJDH2JBdWRr1x4GnNwQI7l/lv9s3Fgsd5nrAFX6vJJ1uPLkuFpGzf9b3EJZWhNz3BEiaZKavM05hBZb769RLEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bUotOVxJnyHc6OH6CP6Sww+Pcfm2zIqFpSJaKd3k9u8=;
 b=V+G/SwYw907c957VoMAWeuKJqM0ZrGhruFpYus/DYPptsJHGO6A3lbU6Sqcj/40eR9U6KylL+oGLf2zlTn3980DKXvLFTH+7tRaC+Ji0R61fGkzJhGNZkh0hTmQnorTvWr0bOtKbUq/syXcQkmQd+FH9yrj9FzYa4/8VuHlXdB8=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH3PPF55C5E51F2.namprd11.prod.outlook.com (2603:10b6:518:1::d20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 06:46:29 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 06:46:29 +0000
Message-ID: <b49b7767-155c-4f85-9680-0e9500f3e8ee@intel.com>
Date: Mon, 23 Nov 2026 12:16:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/xe/ras: Distinguish between detailed and aggregate
 counters
To: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20261102090424.987843-1-raag.jadav@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20261102090424.987843-1-raag.jadav@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0207.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ab::15) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH3PPF55C5E51F2:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ad3b90d-c33f-4ad4-5672-08df492d80b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|18002099003|22082099003|11063799006|56012099006|261026121527099003|261102123227099003|261028144727099003|261026140227099003|261021123027099003|261022105027099003|261021121427099003|261022075727099003|261009221227099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info: l/ei9K2eYm1Qp+6AI9RGk6fufePLegrlH2dkx5SRuS/ujN8wtu5aZTUFhnPZohi50OQXqxOmAE8jbLDGoN5sc9RYeB0Yww26PyG+wKHJwz4BVxqxsO3oiFBpMkkbifiz2LZ1+wN0u3/5nqUSIO72FrgW3moBcFStYaLe/JDLfypCDnTGfFuG+07r2nAx9U7lE2XFfBjZQyxFLMbqLzgP9enZ8GkvQJkS3PITJE+81i7isysjKx9+hXjif8yu10qQDGv8qiqpubpwndU/CX+mxIoeU+ekDIldeW1HAgsHh92MOfIk/3KjdlHyJeqo7kJV+8T+iDgVH1QBweij+nDY2MdYGkaGWk87iYfjyS3s2jkEcGkslMfxT19S8WYhMg6kD6oiWx9krx0mn36M021QMplbNTQiP8K5nEfa8TTWo0sX978jmJumhMxjWYZl1wWAh9RI5YWpoZoZMiOqQGaP83o5sRenp9V2zD3kwtPRoKr1fhRNvcqnE8QHOf9D4zs3/6tKl47K2Xpfci2gfE0VIFe/TF7UlizDzC96fzcst5Yirxpbeh1igf18e8NF54WqA/uSBVztD8HHXR5og3IfVN77TEV+6KI8Swvpv8BvEowTVnybCUpstknIjX2POwJix3DWIXCCanFW8MPRjRAQE8IwpiA3m0VY1PqxeulzbA8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(18002099003)(22082099003)(11063799006)(56012099006)(261026121527099003)(261102123227099003)(261028144727099003)(261026140227099003)(261021123027099003)(261022105027099003)(261021121427099003)(261022075727099003)(261009221227099003)(261009223027099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NW81UnpRRjR1Q1NqbENQN2J1b0NTUFN0RXNnZzF2SHFLSVRaTUY2ZWFVS1FE?=
 =?utf-8?B?UVFHc0VJWDU3cHEybzFGVFlKaWdvNXBPdVhkL3pRWlJtd3pzR29JYUNZb05D?=
 =?utf-8?B?d3VWRVl0ZWhuVDJCbDZkcjFGTWkya2tPcjF1VWJKckM0UWtVaVR6SFpsWlZE?=
 =?utf-8?B?N1pJMklsQVZpUmU2NVg0S0w4azVmU3RHeTYwQjFENHJ6VmovRDB4YTVoNE1x?=
 =?utf-8?B?NXRQU3h3ZFl3d0pkVFlLWTBIMnFBQkF1T3IvcHFDUjBJRTVjM2VZQWRaS29T?=
 =?utf-8?B?NjVnbGpvay9wQlVpRGo1WUhuWW9teGxBejRkUlBXbTBGeFdPL1Z5VHF1TUNY?=
 =?utf-8?B?Uk4raXB4WjRJTzdERW1xWEdRMFFhRmlLTlphOFpwdVJXR3BrY0pubHdHVnRW?=
 =?utf-8?B?WDJKOE1BajFJcEw2RjMyWHBtY0tSaWkxUldmMWsxTEhzWCtaK1ZXUUYrRjgy?=
 =?utf-8?B?aGx4V2lSUnltbHVPZElVR1BLSHdrUG1kS2Z6eHNIRTJ1MzIxN05RVzNVL0J6?=
 =?utf-8?B?cnprQmFlMTN5RG9oRFpPRDREWVpwQm9HbmZ5QnpoeXRuNUMzY0d1RXM5MWVv?=
 =?utf-8?B?bEtyYTUyNEhSN29PblR1dXZQLzAyODRYZGdlejdQdDhvZHRuY2g0Q3VxQ0s5?=
 =?utf-8?B?eEcyUjJ6Sm1wTEFvYW1BdStXMjBoQTlyY3llZGhJY05MSzlTZVVBVndhVDZ3?=
 =?utf-8?B?YTcyRWRYazZ5b2tyZmJ2WnBuSTJvYys2YzNROWtsV242NmdoWEdTcm9UN3lQ?=
 =?utf-8?B?QkVWa2pBZ2N6cXVkVlJPaGF5MDdGS3BlSmdKc2ora2luR0VDakVlN3hneFZo?=
 =?utf-8?B?RkFQcEtyZVU4M0N1ZEdJdWxneHJRajRETXFEZy80QUpLaGUrMUNWbjc0NmFu?=
 =?utf-8?B?UGJPSFFzNy9maW5ubkIwVzlOdVF4aXhDUDJnVHZUSFZ6ZVFXRThjeXg5MExZ?=
 =?utf-8?B?eGdBaStzRlVuOUlLZDNXSUljUGlnUU9Ld3hmTjZ3ck5QTURlN1VsR0lucGdx?=
 =?utf-8?B?TFV5UUxUeGdmS2tTbjR2WjgxV0FDMzhGSWFHSTQydElWbzhGWWhBSWE5NWta?=
 =?utf-8?B?cVJBZGhkNmNmVkY5SFhLbHVYVlNtc0tRV2lzTlIwU1dBSUhNcXQzeWlzeWlV?=
 =?utf-8?B?VVNUZ1JxSXJraFpVaGtvQ0lrUmJ5QnBvVjk4cEZBSUxkYk02cU9SdUdRRVdY?=
 =?utf-8?B?TGlDUUdQazNHVk5NYjhEOVB2WUpJWUdrZ1c5cTVuOTF2OVRwOWNPcnJjSjlS?=
 =?utf-8?B?a0tkbG5EbEhEWXhSUGUzSGVYLzRLN21rM25oaTY4Z3dtNFdCTDc2MWVpNEIv?=
 =?utf-8?B?bDhIZlJLemlSSFY0Q2Jyd1hSK25PdHk2UFFtdHd4ZUZFOWV5OHRuTXpCZnZ6?=
 =?utf-8?B?MCtKNEd2ZFZYYXNEeTJ0Y3ZUNDZNRHlmUmduV2NKYmorWXduL1RCd1RrQmRt?=
 =?utf-8?B?SmFCenJsTkFMVldNVzVwZ1BjT1JYRVFaTzF3b2FDZjJwUVErUEYvamtwdHhx?=
 =?utf-8?B?SEludnhSQkd0cy9XaHJPYnhhNk5xcDhPYTI3TmZHYjdKRmVmZ09iUWprVlpp?=
 =?utf-8?B?ZUFENGxZckxVTFA0a0V5QlJwM2w4NDl4K1lOSldZVmExZlFtN3dyeWxkSEpF?=
 =?utf-8?B?cS85Vm1GS3JOeVN0NVBBZ1g2RnpoeUZFMTdwOEthMkozOWsxTXZQNGM0a1o0?=
 =?utf-8?B?Smt4cWkyMmg1U291N2FKNjNWWnBYVE84OUs1WEd5UmExQVlVSkl0Y2IyeGJ2?=
 =?utf-8?B?WDlxWW1WWnpIa2hWbm5PMjdBMUxDYWlzQWhYNDVtTzNCeUNZNDhrYm1pZjZW?=
 =?utf-8?B?MnNpeHM5bVpBTE5naFczR0hVTWc0YkdDTmkxMkljemsxR1ljb3p5MWdhaWkw?=
 =?utf-8?B?enVRZS9sKzErMFNteVc1akdiczNqMFMxYng2UXVvL3hvNmVNREdSd1A1Tlgx?=
 =?utf-8?B?MmVLK0xOd1h1Vmd5YytGcWNpa1BPVGJ3YVk4bnQ2aFZodVd1MTJVL0RONVQ4?=
 =?utf-8?B?Nm53VU4vWlVKbm5ib05FTVpSU2N4L1loN0V0UGJHNG00Y3dOck5kL2dPQmJ6?=
 =?utf-8?B?OEJCejdzMXlYVmNIRW14aU56LzhCZElTMkpucXJYaXhzV2EraEdsK2Fqa0do?=
 =?utf-8?B?R3EvVisvZUtmTjk1Mm00L3RGS082NU1lUElvY0ZEL21vKzFwVktKdVNPNjYz?=
 =?utf-8?B?WDZpRXBXaTVFRnc0VnFrSks2R0NWM2U2b1h1c2FvZy9wSlZBajJQTS9VRTJp?=
 =?utf-8?B?RE56Rk9JcTkzZmsvbFNFdzF2WGRHV1Qxa0JsY0ZOOCtpZnRYOGhXdWVKS2tO?=
 =?utf-8?B?cDI2WktwdFBUZ2svREZ6SVVTTkRSRG5pREROMERoMklCUXk2RXloQT09?=
X-Exchange-RoutingPolicyChecked: bSszf8UrLrCDXDCNz7sIQ8kvxO6GEhK3JU1JveF/0fZwSqU2vHjkf7p366OHUqloW0MlEwMwrg8dp2wjC7+6u+3ufvge+L7q4CO3QQLojIqTPLW/p3rVh/vdpoXtAW8Y+cLKDjnVXUHGxfaOvjIKpGvsI1jTFY5LS5IEQ6CZ2c751Z2Wrnmn1NzAhpyVTm2KU5bmQJ63MpnXggyxvfpcKveJyxShuOrxfycOR1ZgwUQbBMe3kJwCq3b0C9g6/sigDa/bwzaxQoSi7v39TO1j80rKSVKw0+o0ntSTp1Bj94qIvW3mP3y/zRM0HMHANoF3q5QEkITFNxSSGu83nTpVOA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ad3b90d-c33f-4ad4-5672-08df492d80b7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 06:46:29.2723 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +mncJ/UiyCEoVug/+FmGNQLcLEtszswBY2D1nYyQP3XoFda0JIE3JRb0eO1ypcA8GhES0POQuM06Bolc9UB7dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF55C5E51F2
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


On 02-11-2026 14:34, Raag Jadav wrote:
> xe_ras_get_counter_response() only logs counter value, severity and
> component. Also log the type of counter for easier debugging.
>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_ras.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 2c01c183d02b..381ea19a8b4a 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -772,7 +772,9 @@ int xe_ras_get_counter_response(struct xe_device *xe, const struct xe_ras_error_
>   {
>   	struct xe_ras_get_counter_request request = {0};
>   	struct xe_sysctrl_mailbox_command command = {0};
> +	const struct xe_ras_error_product product = {0};
>   	struct xe_ras_error_common *common;
> +	bool detailed;
>   	size_t rlen;
>   	int ret;
>   
> @@ -798,8 +800,11 @@ int xe_ras_get_counter_response(struct xe_device *xe, const struct xe_ras_error_
>   
>   	common = &response->counter.common;
>   
> -	xe_dbg(xe, "[RAS]: get counter %u for %s %s\n", response->value,
> -	       comp_to_str(common->component), sev_to_str(common->severity));
> +	BUILD_BUG_ON(sizeof(*counter) != sizeof(counter->common) + sizeof(counter->product));

Why do we need this? This is already common+product and passed by caller.

Riana

> +	detailed = memcmp(&response->counter.product, &product, sizeof(product));
> +
> +	xe_dbg(xe, "[RAS]: get %s counter %u for %s %s\n", detailed ? "detailed" : "aggregate",
> +	       response->value, comp_to_str(common->component), sev_to_str(common->severity));
>   
>   	return 0;
>   }
