Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53A6DC25B75
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jun 2024 06:53:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 152C210E12D;
	Thu,  6 Jun 2024 06:53:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VSM93FLH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0382F10E12D
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jun 2024 06:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717656807; x=1749192807;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RnpE5nDSW5BV93mKCEftf5i1peddYM1i6T2e10dBf2M=;
 b=VSM93FLHi9V3NXIA4Bg9ha+PSBeuG1iZ6i6nGEpVMGeEHNENYt6VcW7G
 FMxIt+MNHorVYl0tMIIJnrj6TPfu92Am/9rqf2HOa86abkfxKNCMNmFuH
 /tseddYN6dXn9PuVnipvhzg0IjN8qdCyCQ9o13yRv2yZhBl5d5slAWuq8
 IPpPHQPlNg+94CjraEyu0goZLXotp2Rzq+XGGwjgNa43KmUQheyy/z2+I
 uRi/47LkzMAH4xqDteDD6isG+G5zryF7Q3z11xt5A17UZgdq/X9pdKftV
 avhnopOOc7ZbtZGC6WEp36QK+Ibs7IwuOQmpCr3b4IvYV29IgE44ozAyC Q==;
X-CSE-ConnectionGUID: uX7UNfNMTfyOSVU1Qx31mQ==
X-CSE-MsgGUID: n9lUTYKYRCqeCIyqTD3xwg==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="18091628"
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; d="scan'208";a="18091628"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 23:53:16 -0700
X-CSE-ConnectionGUID: FHnvpZ0MTG+/hwy9iS3r2g==
X-CSE-MsgGUID: UHNKeOHgQ5K+zMF++theIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; d="scan'208";a="37869756"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Jun 2024 23:53:16 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 5 Jun 2024 23:53:15 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 5 Jun 2024 23:53:15 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 5 Jun 2024 23:53:15 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 5 Jun 2024 23:53:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ecOhnpuswCbtGBnsH4E53Eg+6PqYDRgG6AS3CV3XSgFFJvypinPtcphNof4yZ8IxJloZJS9IplbhBtStFr59AWScfve1EgmEJ6+nUK5jw+mKhsXuPwJerDpU/wJsI898qcxd2Ke4oXwF8fangwfl5Ht4slUN3siGoveFtiFEed2Ovd82jUsIoIorAHt/SKLOruihRKUqIz6hvXUdfsDCkY96jINFBQPCECxq1HtuWSi3lXeLmn/+/Of6Rupixo+OOWFGiZLnUNtgfNH4U3y921Mf+uGzr+2uyvyVj8Aa1nFuifkhJMl3252c+ypJ+BMJGAXlJDr0GBOdn9ZabWB6VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hlbzQGSoa6C74NenZWRTg4WohomW4DMWJhVbIjCw9oY=;
 b=ElqebvYctFOKF3Ov+zcF9D0Sg+61AUuMBwlj5LDfr1yuf+qshyXLFeztVGSntRDetBXozhAoHck5TH+ZsDzAshBQCpgpa4pSE5M6jj+EvNL/Kb8OYkkkYZl0Tz3uVu/GJrG4n+k4XR4ItZviVVKl5Dg65coOWiPTcYiUkZTJZg+DRJP3vEKzZxl01p0BExqQvFGof/7e+Ya7OWsBp51cAuGhn/4IU08h1a6hRxIPYZ8rCMstrwl3j6Z36pdHsZJHSbYlpjwIuuvg84xRaY6oLpnp9o39C9rr+ebKBjhL7+ZczzgEjGv6iuMT52m44mStBj5/f2T1ndhI4VNWjqQMDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SJ2PR11MB7456.namprd11.prod.outlook.com (2603:10b6:a03:4cd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29; Thu, 6 Jun
 2024 06:53:08 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245%3]) with mapi id 15.20.7633.021; Thu, 6 Jun 2024
 06:53:08 +0000
Message-ID: <b1a97619-3720-48eb-89b0-8ae985e5f80a@intel.com>
Date: Thu, 6 Jun 2024 12:23:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/xe/xe_gt_idle: use GT forcewake domain
 assertion
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <vinay.belgaumkar@intel.com>
References: <20240606055401.934750-1-riana.tauro@intel.com>
 <20240606055401.934750-2-riana.tauro@intel.com>
 <56de0bcb-6154-46fc-b614-81e0af3a34e1@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <56de0bcb-6154-46fc-b614-81e0af3a34e1@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXPR01CA0106.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::24) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SJ2PR11MB7456:EE_
X-MS-Office365-Filtering-Correlation-Id: 57597a76-3bbd-43e5-78cd-08dc85f55277
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aVJUaWpTR1lKdUVodGJndFNWN1A0d2xRdGFOZm1nYUg5TjhEYlVZVE5ZZEQ5?=
 =?utf-8?B?ZEJnQlpubFpadzY5a3B0Q01wdTQ3Tm9LYWYySk83TThCbXZxc3NWVnZYY1ZU?=
 =?utf-8?B?bzhzTzdlSnZMRE93RGFHUEtPMmJMUmliQW93TjVMdm40NXhQK2YvNXRJOUo5?=
 =?utf-8?B?RUZSWjFaQmhHTThVbVVweVM1eEN3dHVJRDZYMG8xZVhXVHZxU1Q2SXJvQnAw?=
 =?utf-8?B?eUtUQjZlWFZCRXZRdEs4L1BTSUlSMW5qVjRGdmVpVEhtUVRNNUE2UEphbDNr?=
 =?utf-8?B?d0ovYW9lTFd3STJzcFFtVmNUY3VSRkNWYXBwNnRGZ09CNk5WWExUVmk4ZVA1?=
 =?utf-8?B?SkYzMkZ4aFNCcXVORlZ0ektpWnhkVG5xVkk5MEVreTJMVmFzK0pvcHl0bE82?=
 =?utf-8?B?RTFLNXI1ZUx0NjdOM0lGZ3h0MkZoUlZUS3FYeWd0Z1lQUXh1bGJWVUF4U0da?=
 =?utf-8?B?K09lTHNMOUpkbXl1dTFuQjBCcWpkalJKbStqSmNOSmE1RGZSMVRDM1ZsNTVU?=
 =?utf-8?B?NThCL3FHTTFKbmVJM3RJb1lLcWRZaStERjlPZHNmRlM5NGkxTWZPRDhzWkxr?=
 =?utf-8?B?MjV5MnRuUjI3NStxRlp0azBIdGFmZXdLcHRGN280VFFvV2drWjBPQ040VFBx?=
 =?utf-8?B?SHlWK0hNdXozSnV3SXB6dGt4TS9aZWlqWnVnWU9CRVc3NG5wYUxIMFJ3TDhY?=
 =?utf-8?B?V2tsRnFqUktRaE1yKzFqQzhzRVA5VDlrQ0JJdWd0UzNiQUhTRlJKK0xnSWVa?=
 =?utf-8?B?NlJZeXJNcWYzbnAzcUY2Sk4wcHJBZ3ZPZHczNFR3TnNwaVByZncwbWFFYU1G?=
 =?utf-8?B?ZXNyTStESVFBVGVuelBkTXppcVRHL0ZKUUdKVXdsOFp6QUk3cUtGK01vbzM0?=
 =?utf-8?B?cUVCUzQ1UGFFNmFwRSsxZEdlU0JFYWVYOXpJVWFINi92dENtM20vSkxpZGFl?=
 =?utf-8?B?cEZZbWtVL0tDOU1NWTZLMXlUTVFlQzNleWxya0pwaTFXNktsYTNvMHJEbjRJ?=
 =?utf-8?B?L3NBMkR3OVd3M09lMVhodDlHYlV0bjg3eG5TYnR3ZE8wc1kxZXpDSzFzYkdr?=
 =?utf-8?B?RUNtcFdadVlpRnV4M2NEc1phNDVmZzI2V1REbHE1RERpc1J2dE9IR1M3NUxJ?=
 =?utf-8?B?SnlnQjJvQVB6aEZ4SzRGY1hjUFZZRndSN21YOHpnNmtCeHhVbzdXcGtEK1Np?=
 =?utf-8?B?aUdWMDIrVC9WRmNCTnBLRFNHUnc4ME4xdlNQWWVvVFdnMEhEazNoRHNmN1RS?=
 =?utf-8?B?L3hwRXI0KzhqekxkWXpTZmxwWjZGTm9rOHEvTkRyZHBTdWwvcW1DS0syZGdi?=
 =?utf-8?B?S3g4c0FhNzVtd0xMM3JoRGM2eWZBMlJIKy9CdUNUamRVK2ZJVW91bGdqeEkr?=
 =?utf-8?B?K0xNSXBLcytxUmk4VmIwNThWRU5ENFZXTWJlRUoyZmNIMFN3dTFIS2R4RThK?=
 =?utf-8?B?ZWZLcFRDWlEyTWIwQ2VQeWlVZ0tTRHp2MkFIb1JNWTUyZTdFcTkzaXIvVXEr?=
 =?utf-8?B?WUZSKzNLTU83NnBzQU1uNWJSejV5ZVRyN3VEeCthL1FjZzEvMzExZ0szWnJ6?=
 =?utf-8?B?QVlQRnJOM0ltblB0SE04aW5HY1R0T3ExQ3p1cU5IZnp6dXEybGZBSk5hNm9P?=
 =?utf-8?B?SUxiTEVVY1ZyLzY1dUkwZzhiYlZUVDlsdlpUYlhjTmRBUWo1WllOQ1AxVXlC?=
 =?utf-8?B?Rmo2QjdOWjMxdTdQRU83NngySmF2SExoTGdhTkI2ZEwvVlR3V2F0TzVGOVhi?=
 =?utf-8?Q?o+CtV1JmaqqGHiuf2I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ym1xVVh5TS80UzRhRWwraGtUUmNiSjhLRlFmd0N2WlVIMU1qUXYxUlBlYjdo?=
 =?utf-8?B?NlhBdTRVU2RVcHpoV2hTZ0l0WmxhVjRJd24vUmhCSlV0S0VqUGlOSlIray9y?=
 =?utf-8?B?M3hvYU9CQ0ZoRGlycStOenBXQ0tGZnJXcys5bjV6VWJTelVYbG5lTGJpRHBv?=
 =?utf-8?B?MW9Xb0JuNTJsL0VKbk9MNU9wMFRiN3hycktJTVdITnRKRE12S0RUa1o5ekEx?=
 =?utf-8?B?ZXNKNVhiQzY3eWR5bzZVMHlmNStvUXE1QWoxeUg1enBqb3VtYW5vNHYwYmwz?=
 =?utf-8?B?UGM2NzJCZTRQY2dwMXdxMFl5MWliYmJ1dWxCUVY5VDlxbnh4VXJXamVKZHc2?=
 =?utf-8?B?THZEalZ1cncxZ3o1TWVmNUV6QVc0UjZRQU5BcXZBbEM0WlYrMGRFWGQ1aEg1?=
 =?utf-8?B?Y2JrRjlwck80WU9BNlVvQ0lzbjlsUzF5RWordnB4SzI4TlhKM0RWTkk1TkJl?=
 =?utf-8?B?YlptUjIwT0dudktoVk4rSUVMbmwrc01iVDcwc3VXRjIrVy9rWE0vTWNBL2xW?=
 =?utf-8?B?WHRqazFQUGt4cFBxRWJNYy8vQ0R6SmQza3gzdUErcFozR21oYTZzTXl5S2pU?=
 =?utf-8?B?Y3NycXhmUGZsU2NWN1JSU0MwQk1QTG9xeWVEQlRTYTByZzJrNWloNVJNYzhM?=
 =?utf-8?B?SzFHSzJlREo0K0hlQlgrUjZxdmg1UWcrcHcyVUlLRXFFTi8vdGMxUmxQbGtZ?=
 =?utf-8?B?WjFiOWIvUUEybG1TWjI5ckJIdzEydWVJck9NVXBwOE5wMmg5MWExODRvb2FD?=
 =?utf-8?B?V3ZrdWhCNHM2ZW9LS0NYMlAyZlNyY2FueHI4elFUdHpPSnNmV3hCS3lzbjhq?=
 =?utf-8?B?TUxtQkIrT25XM0JUWjZRYTFVYmQxTlFRNk45WVhjSFlvYVFRUTJiZHYvQWUz?=
 =?utf-8?B?K25KZjRwSGRReDBwVE1DTndQRjBSODk2K2t2bWRZMVd1Z3ZsaytNVU4rNWxw?=
 =?utf-8?B?TDFyZ296S3FOOU90RmhxdWwyclExYmVqTkRwQjQySHFmNzUwcnFiWWt0N0FE?=
 =?utf-8?B?OHoyT0UrSHdOdHczODJVTzY4K2NsejUvWWEydGlXZEZWQlRNVjcxVmlvazJ1?=
 =?utf-8?B?WkdmTGF6d05JU2JaR2FETFBUVzNDZHNZelh6M3U0Q1Fobnk3R0VIN1Z5V0w0?=
 =?utf-8?B?R3ZMeEs2OFRUenlVbGlZYktsQ1gwTEwrVmhBS2hIOFdjRmN2dmttQmgrVUVL?=
 =?utf-8?B?cWNoekUrRkc0ajVHVU9PSHhRZmp4dlpzbk85MkNhdEswMTlJRU1NbmovZzY0?=
 =?utf-8?B?azE0ZEZHK3MzaGQxWVdUU2o1V2tzaHpybS9SeER2SC8xdXNSa0lOcWd5a0Nn?=
 =?utf-8?B?c3M3dzl1NkM0cENYV3haaGFLUnN3elF3ajRMcy91YXBDV1k3WkRvbEIwOUk0?=
 =?utf-8?B?VGZkeXlXcTMzaWRpYzRJYkN4dVNQRkczdkxET05YODFTR1hLaXBhcmxaQ01w?=
 =?utf-8?B?Ujg5Rk94UlhqUDFhcWg3QUtqaGJXSGo5NUdCbll2L2lBNUl1ZjdDS0JIL2k0?=
 =?utf-8?B?aTNHZTFLdmVCMU5veWtMbVBvMEhiWFhldTFoQjN0cEVKWG5zMVcvQ1Yya0Uw?=
 =?utf-8?B?NHlGZGtqYUxNR2VDSmVIc05wZC9OZDZYbVA1OEh1WjB5Yy91WG9MenpYaTlP?=
 =?utf-8?B?dWs2YUZqMHFrQmovbWNJbEF3cjFSVkZKa05YWnNUUGdHam9tZ2xZREZFMk42?=
 =?utf-8?B?TjQrLzNiZWl3U1JBOTc3R09MUm9pTm96aWIxUTExNEgxUTFmK1F1eWhuTXFr?=
 =?utf-8?B?dlJwTm1BV1NkS0tKaUs3RHYvUlY1TU1kTDk5WXVYaFNsR200RzdBZTdLSjNV?=
 =?utf-8?B?dS8zb0ZZenNGd0NhSEtNNWMvL09tQnR4UWluakJWWDhFa3Q3YTFwYWh5bDQx?=
 =?utf-8?B?dWM2bFdqTEwyZGJLT2dxQ1BxeHB6SkZYcElaMmhpejg2SXo3M21mWEtPVWFl?=
 =?utf-8?B?aVpmc1dKNkI0VlBuU1FUbk1FNnN5Vm5YWTMrWjRuMnIvU3pHUHpLeHcwakxl?=
 =?utf-8?B?MEU1aldWTGoxaTBiRnZoOVM0SXJJVktVaDJOdHhhUEcyYXdCQVVuZnZRc0RL?=
 =?utf-8?B?WmtyMGpnc1cxZGcydk1PUUVFSDN1Nks5TW5KVmErc0ovRy9wQVcvdThiWnNz?=
 =?utf-8?Q?vHMuQhLZ4KleD9Z7LwqV8vEi7?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 57597a76-3bbd-43e5-78cd-08dc85f55277
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 06:53:08.0167 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c21sr2IJEfo9vwvnOGeKFdId7fL19Mdb8x4P5LPBI4HfkN7HwJPG4QjBfUYZ4uuxI2eAXwtnsLYUbagu4EoE8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7456
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



On 6/6/2024 11:36 AM, Ghimiray, Himal Prasad wrote:
> 
> 
> On 06-06-2024 11:24, Riana Tauro wrote:
>> The rc6 registers used in disable_c6 function belong
>> to the GT forcewake domain. Hence change the forcewake
>> assertion to check GT forcewake domain.
> 
> I think this should go with fixes tag.
> with that
> Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Thanks for the review. Will add the fixes tag and resend
> 
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt_idle.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c 
>> b/drivers/gpu/drm/xe/xe_gt_idle.c
>> index 0109d1d2e9c4..a6ab8bb4571d 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
>> @@ -250,7 +250,7 @@ void xe_gt_idle_enable_c6(struct xe_gt *gt)
>>   void xe_gt_idle_disable_c6(struct xe_gt *gt)
>>   {
>>       xe_device_assert_mem_access(gt_to_xe(gt));
>> -    xe_force_wake_assert_held(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>> +    xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
>>       xe_mmio_write32(gt, RC_CONTROL, 0);
>>       xe_mmio_write32(gt, RC_STATE, 0);
