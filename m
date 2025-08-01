Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14B6AC87FCB
	for <intel-xe@archiver.kernel.org>; Fri,  1 Aug 2025 06:00:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEE2D10E3BC;
	Fri,  1 Aug 2025 06:00:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eRH9fQ4V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFC6410E3B6
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Aug 2025 06:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754028057; x=1785564057;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/0dP9hkf9yqKNVM4ekTsaFNT8sJK98QIHr6qDAIQS3I=;
 b=eRH9fQ4VqNxzrti9V+KqJcn92/MMd+jBM+eY8XSW+zCmdd57y80t5bLv
 dvgHw+9PDrXVYZJ7Vl8BUZA6/s7131RthwNzqFvLU+9LyxehGjf5D2wjY
 l/1513DPBPBgvlOjfsj1q49U3k/IlwE2PITIF4ck/yJAOGw19CdxMzfm/
 qXPagusm6I0muuuXQ9dtjQifRHd4vvlLs3De8o1y7Yz2Y1e/ELg9s30Ij
 YLLzIHUmA5EsXgtMaF63Pp7fxZ6ufAMwJ9Si7LUVWWd7WE83QCyawax1D
 zsh9/W1NtJ0im9X+GZKDViG/cnh4PCyxzrEm4jCxT/eqIpQPxqWTv5aBL Q==;
X-CSE-ConnectionGUID: 2HlcdEE1RC+uhg8QGmF4Sw==
X-CSE-MsgGUID: SyxWLe4mRDidINFMIQFpqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="58988812"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="58988812"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 23:00:56 -0700
X-CSE-ConnectionGUID: sv3gOtceTba5vNh4XPgbBQ==
X-CSE-MsgGUID: 5KTwGgtNQCmL2gzBJ/10oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="163919864"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 23:00:56 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 31 Jul 2025 23:00:56 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 31 Jul 2025 23:00:56 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.52)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 31 Jul 2025 23:00:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bz7aosoDv/vw/PDKTgTVkvt0AUZBBT7VUNaRSzCiIH/2hPd/SaTSzYrlUufvhhS2BYtrZhVeRu4+icTmOvNi/5c3oTWAnYr17ySDejxBW88dIWKQaD8AtxRgpSBQsFx5QstHBlndZmvGWKXcOnruQ2Ze3JdsmIwO9knLkjO6BsXz5cVgeZSxmKcvkYtM/+/USDskuz/NXOJdSKnVGLGP8RJzzD+8PWln08TFG3Et38UyPgMcd1mrbEaxAxPipF7mbAedAIOYjSPkcNUrtKTQYVUoe8Q5D0IOAXd/vrGt2nvl4akJ/6ThZELvEUW6iTvE1Ksa4YFiBebSqJDET3Rjlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tkBn8sRsHu+MpQoN3Noz6nLweLdVGh1Apr6AIZtJ6Cc=;
 b=RVxjWWykRbPrLq/cdwO1cUWilOOjvmwOwJat4OkkolWmpEY0ry7M5rYDR0P3XZJpBiMt+/ilWLOlPUXdQ3k4jbx5ZQR3UexTDnMfdZNNmKYcOBOQxCuWaWWXPHWNFyEL3bTbt7P5ZT4qqcGv2gIzVKnCFtH20RKVYJJj2zOmbF7Q8TQhrxHkemRlAp2CI9Y8QTKEUYiNvAd99ILuc1OLYoynW3A2WBBh/Vuobt9J8e5o+FgcrSVSmyida45FUtT5Te/hyTBe9WhL8K6y+kAMVL5eyB3GblsrYHEx3LNhG1mWiugzfHsedZXtEtLJcRxopMZRAgn4Lrxnjrqzb07AfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DM6PR11MB4754.namprd11.prod.outlook.com (2603:10b6:5:2ad::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.14; Fri, 1 Aug
 2025 06:00:25 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%4]) with mapi id 15.20.8989.010; Fri, 1 Aug 2025
 06:00:24 +0000
Message-ID: <14339103-f014-41b5-8f5f-7df17a5650c2@intel.com>
Date: Fri, 1 Aug 2025 08:00:19 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/gsc: Don't create mei-gscfi aux device while
 running in VF mode
To: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Alexander Usyskin <alexander.usyskin@intel.com>, Lukasz Laguna
 <lukasz.laguna@intel.com>
References: <20250731220124.3113996-1-vivek.kasireddy@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250731220124.3113996-1-vivek.kasireddy@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0019.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::23) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DM6PR11MB4754:EE_
X-MS-Office365-Filtering-Correlation-Id: 73305f03-87d6-413d-4178-08ddd0c0b49b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VU9BWitpZ1pmYU9jR2M5ZzNZVkg0REtuSytJeG1uNzRtR2FiTC9GWXIweUlt?=
 =?utf-8?B?RUN5bGJjTm9sTUZLTHphMTl6bjZEdWozQUFEOEN0bTNOYzcvNDhsR2lIT2Vk?=
 =?utf-8?B?aERsOFQ4dE5icVU2OWVPL2c1MW4xMUxoNTJlTXlxN201ci9ZbWR6Syt5eXpP?=
 =?utf-8?B?djBxMkdha2drVC8vOVlTTXE3QXh0anlqUkdSamF3TEVaVnovUUkxNXdBTEdN?=
 =?utf-8?B?YkVzSlFJVWdkZWlBcUZLZ2JodHgxZjg4NDVkQ0JoK04yWStUL0k1dUlKOWJv?=
 =?utf-8?B?UnZTUHczV0V6cHp0b2R1Yk9jWUcxd1A0Vlo0RWR0UnV2T3NvVCsybm1Fei80?=
 =?utf-8?B?cFA5UVhCUGtpbCtlUVlFai94OXYrMlNOSnphSzlJTHJUbDlmc1czczVLWmJY?=
 =?utf-8?B?aE1qT0Z0Q2JKeVZoNXZvdkg1ekl4alJ5NlZjM3FlVkUyQXg4MmxIeERjVDRI?=
 =?utf-8?B?VXJlVmJ0ZTArOWsyQmVVK05GNFY1M3pvRk5sWUlNNXppOTBjeFY1SGFzckpr?=
 =?utf-8?B?cWp2NUZMSnNSQkcwTlM4em80SEprQkJxTlU1K0JWZmYwaVRzSG9jK0g0VXJv?=
 =?utf-8?B?NEYwWDNIWEdXOTEydGdZbWFuMG1GMUcyU3NncjZON3lCZkdlcUQ2b01idlpx?=
 =?utf-8?B?RXgvZUFDY3BPSUszZFk4RjFYUStkSGdhSUFtMXFwZUFna2VDMjByUEp2M2xs?=
 =?utf-8?B?MDR3ZlZBa3JnZlduQWs2RWswcmhlMFBydWNuMDc1TkdRNVdCVTQ1YzkzUDNx?=
 =?utf-8?B?dFNlMjN6S0dYUlgvQ21wdlpuZk1DVCtMdVdLYk8wWThQT1pMWnBqdFFBQVJl?=
 =?utf-8?B?VFNRQ3ZzVXd6VHFzblZkcWZyWnl5ZEJSRUcraVhoVmRGbjMxMUpjeEZRZkFp?=
 =?utf-8?B?cks5OUoyc3lld1VTN3JBemFxVEZiVi9XaHJsTytXNm1GMEU4eWtoOFM1SVhE?=
 =?utf-8?B?Y3RJVTd5WkJhVU4xOGg2U2JjVVRvdjBhQzFyRldqSklHSDZUcEh0cExCS25J?=
 =?utf-8?B?WWh0cWVIWHVYYWhjVk9VdDRMWTZvUzZxcXN2SnNuNUhuY210OW9tMTZQamFM?=
 =?utf-8?B?NW5OUjNCZUJ4OGZPejYxVzhFNS90SEVnWjA4Si84d3pXU2Zib1d6Y05Jbjlz?=
 =?utf-8?B?OFJuYjBKZ0x2bHpHSE1udFJrdXRvaXg2cmcwNnR3TVEwNHcydXRMaFBLMFVh?=
 =?utf-8?B?MCt0enFGOWJITEpvcTB0ZitjV1lKSlFEenI1em94aFNMcVlDdXUzaHI0SThQ?=
 =?utf-8?B?RkpXOVQvcTQrMnd5L0hQR3ZCSlEyWWlza0x1TjBFSXBZTGlrL08xK2haRUdT?=
 =?utf-8?B?VVg3NTh0ZGZkd0JSeGpISWwwMUtUMHVSdXEzYnU2RVNIcWE2Nmc1VTcwODla?=
 =?utf-8?B?NkFZL2JBNWxuc1BJK1VjbEEraUEyUmVqRDh3M21kWlhUZlM4RVhWRHVPdGFk?=
 =?utf-8?B?UUg1czJIMHAwejZ6b3kyMkJvWFlZSGVVelhBNk50MjZJSTZ3L3oyaVJuODA2?=
 =?utf-8?B?cHloZEZkTUsrMG9CUXhGSUNReFVOUjJnMElXbGtvRXczRXdlSjZ5Q0xieEF1?=
 =?utf-8?B?cUREREJLK3FOTWJaMjhKWTdoQjFsdHpMOWI3V1V1eGMzUHlEMGEwL2habjg4?=
 =?utf-8?B?bFphOHdLYjRQT3BRL1pNdC8yYWh5MllzS3B6M0tvZk01bjFuZFdqTzdjek1j?=
 =?utf-8?B?d2gvR0JRdk5abEU5bm1kTjdXL1RoVGwrV3JmSjdIOHRTT2ZUcFFtN1E4UG9M?=
 =?utf-8?B?YzczZGhVUmVVdkRrY2Y1V1BwRWhWRnVWNVJLNThETzBidUhRUHlRL0N0ZUhI?=
 =?utf-8?B?eTNkdGthYlZTQVVGTDZJcDZpTWFBQ2JPUnMzdWZ6VU5HQS81aFg2MHZrWnVo?=
 =?utf-8?B?V01ScWZmTlJ3ZkFPemVvTldhU0hWSWdoVk5EbU12MCtUb1FneFRKL0ZoUmhH?=
 =?utf-8?Q?b1IkZv8QPqo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NjNjaGhmUHk3dHVUVXpBUVRDOUoxSHlnNjhqZyt0R1dyWWpFYThDcEdBN1d5?=
 =?utf-8?B?RHRtenpxYlc2VXM4cGpFallaRWVrSzlRKzBLc1R0Vk8vWTFPd05zLzRUT09q?=
 =?utf-8?B?UThnVlZwQklmQ0ZDMEtqTG1UK1JKSm5hOGNXNTVURjBCRTZrY1lkS0JvdzRE?=
 =?utf-8?B?KzJydlpGazRGWXZmSGZGSVFtUTYvOWVkcTdFZlRvOHlXbUF6RngyN3huNDgr?=
 =?utf-8?B?Qk42YjVReHE4MmwrM3ZuOWI0Unk5aiszN2dFbG1QYmxiQis0b1BENjcrejNN?=
 =?utf-8?B?TG1RTGU0ZTB6cUdxUVFNNXh4S040MStva0lGZWR4eGVEdSs0YnRaTGw1bjR5?=
 =?utf-8?B?U0VQRnRhNUlVbjFKYXFuaDZXL21tM0VnQ2ovdGdLR1lnaE43UGthYkRJeEJa?=
 =?utf-8?B?N3dWVmN5OHkyMEZFNHk0d3AyZTRiWm1PaWpCNXU2VzNTc1Q4c1ZDVXpXUFRq?=
 =?utf-8?B?NkNWdGlNZDdhMkZSdVdOb05UQXlhbkY4ZVdyZXhQTWQ0UXNxRXUxckpud1c3?=
 =?utf-8?B?cUlmY3hPMFo4eDhRTzhJM0pkWW9yRUJaQ2ZBZllJaCtFb3hEVktValRSK0RH?=
 =?utf-8?B?MktsU1VnSzVvV0tqWVJ3amJ4RHF0M1RnSktqd2FvUU5GQlA1N3FOUk5TLzYx?=
 =?utf-8?B?ZlBrbUNzMXNLZ0hLVzBNb1ZSYXo5TzZhU1hvSmhFc3p1QnRJbm9PRmE3MU5k?=
 =?utf-8?B?TForWjhsRFlGbE4rNXE4YjdOdkNNSzZEeDh3bFQzMTRQdlRjYWk4ZmsyaVpJ?=
 =?utf-8?B?Y3hXNkU2bmZPQ0s0WlR1ZXVEc3V2SjR1UjVWRnc5NXI5ZG14anRqYzR3c3k3?=
 =?utf-8?B?T21tMXArdDBpRnZCV0VvYjNmUnRtTFFvWGpWNC9tMEQvazJpK1BBd2RINVFj?=
 =?utf-8?B?MlFya1l4R2JQMVdXcU5KSnMwa2hIdjF6a2tURUVYdEhSVGp1a2JzdlJNUkNP?=
 =?utf-8?B?ak01U3pzQmtvSjZoU2hSdThQQjE0M2VxVGRoOUwva29yS2NqYWxpcU41VGNN?=
 =?utf-8?B?U2F4cFNMSlNwaGN4WSttWmNOTVp1RjdvVE1wVGpEL1Juby8ydEQxays4TUlq?=
 =?utf-8?B?V3BBZ1hiZGE3ZG5zejg5dU56SXNlNVdkbU9wU2grMDFWcUNhWUx4dGNSckky?=
 =?utf-8?B?MFhzN01JeWZDdS9oZDgvUVR5UXpLQnFUOWN0aXd4eGpkMzVlODRHQkNEQUdE?=
 =?utf-8?B?QnJyYXBFTEhxeGwzN1FHQjFuQngvMU0rYyt2cXpWMjdiZUl6ZlRDZHJ3TjZ5?=
 =?utf-8?B?djhCUXNMaVJtTHNlODZ3Q3Y1VS9yWG9LMmZoR01hN0l0dzZGVVVZaVFlVE1h?=
 =?utf-8?B?VkNncGlaaDJRc1JMb1I4REhkZXNLN2lLYzlhV0hvWEl2NnRnNE9xVXIwekxs?=
 =?utf-8?B?cVFaMmNBRmE4TERpVTBGRWprUW0vU3JNTlZEYmkxTUp0cmpTLzBiT1dtZm1Q?=
 =?utf-8?B?NG9GcHdwYmhseVFQN3Q1QUppS24ydlZVWlNYbEFVUmd4bkRlNHBsdDV5Ly91?=
 =?utf-8?B?Um1GK2I3ODdTRGJ5UFRqWVZtVTdoTlo3Y09aN1JFbER0TkRtVHI0ZDJoSEVu?=
 =?utf-8?B?Nk85ekVLZGxFSlRHYm9lUVpoekIxOFdJcjJXK2Nuc2NBMkFodGpxNGhMeXBB?=
 =?utf-8?B?eVpCUk9XQ3gweUlWNC81dnpMSzBDY3hTT3o1NjYyVHc3N1RNYytuZmNYTlRZ?=
 =?utf-8?B?eUZSQmhuckNkZCtBeXJiZGhwZU93NzlwUjRJbHRtd0tEQTNPc1pscURGQkVK?=
 =?utf-8?B?c01JNHFXY096NTJIMkRQNU9OUDc1aVErem4wQnpzY0hzSmh3TEN3bXN6b1Fx?=
 =?utf-8?B?OXdjUk1yZ0wvQXJxWUdEaEJhQnBVZE9leUhUcHJhOGVMdWRvZXozQmNReWxF?=
 =?utf-8?B?NzVzODROWEkzNlpuMlNROWhGd3UvZFE2UkxlRkEvTVhncm1XYzIvU2Nra3Jx?=
 =?utf-8?B?VGRvNWRYMDBVVUY1aTUzamYzVmRSY01OeHNjMmN1RGQ2OFVNZ1dVQVFTOTJ0?=
 =?utf-8?B?UkFaNkFOZEt6Q21oS3dJUk1kdnlOczY5K3BIWTFtcWxMRHc5aE1MYXpQTFlm?=
 =?utf-8?B?NGhDcWlTVjBmMzBXZjRpRmx1OTNod0RyRm5zZHJZTE9TbWI5RVN1dDh3Qkdj?=
 =?utf-8?B?RDdLb2RFRjVhK21QTitUa0lOQ1pSTnRtc1dqVUk5dURxMjhWSGg5NW9kNFFw?=
 =?utf-8?B?NWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 73305f03-87d6-413d-4178-08ddd0c0b49b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 06:00:24.0911 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QDVEzsOvUVDBO907dr6/diP9CvJCmeNe8yeWB52b9wXjKK6fZm6jzjMKWymxf25VI00Z1MVU37mqNxt35OsfwqgIJ3IkJ7HbHMBVGJ7sUZQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4754
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



On 8/1/2025 12:01 AM, Vivek Kasireddy wrote:
> While running in SR-IOV VF mode inside a Guest Virtual Machine (VM),
> we do not have to initialize and enable the mei-gscfi auxiliary
> device. This is because communication with the GSC/CSC firmware,
> which is the main purpose of the aux device, would not work in
> this mode (as relevant MMIO registers cannot be accessed), and
> can result in the following errors while loading the Xe driver:
> 
> [  762.274208] mei_gsc xe.mei-gscfi.24: H_RST is not set = 0x00000000
> [  764.299203] mei_gsc xe.mei-gscfi.24: wait hw ready failed
> [  764.300334] mei_gsc xe.mei-gscfi.24: hw_start failed ret = -62 fw status = 00000000 00000000 00000000 00000000 00000000 00000000
> [  768.333706] mei_gsc xe.mei-gscfi.24: reset: reached maximal consecutive resets: disabling the device
> [  768.334466] mei_gsc xe.mei-gscfi.24: reset failed ret = -19
> [  768.334941] mei_gsc xe.mei-gscfi.24: link layer initialization failed.
> [  768.335346] mei_gsc xe.mei-gscfi.24: init hw failure.
> 
> Cc: Alexander Usyskin <alexander.usyskin@intel.com>
> Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> ---
> v2: Reword commit message to clarify that the mei-gscfi aux device
>     do not have to be created only while running in SR-IOV VF mode.
> ---
>  drivers/gpu/drm/xe/xe_heci_gsc.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_heci_gsc.c b/drivers/gpu/drm/xe/xe_heci_gsc.c
> index 6d7b62724126..eb94fcb3f03b 100644
> --- a/drivers/gpu/drm/xe/xe_heci_gsc.c
> +++ b/drivers/gpu/drm/xe/xe_heci_gsc.c
> @@ -13,6 +13,7 @@
>  #include "xe_heci_gsc.h"
>  #include "regs/xe_gsc_regs.h"
>  #include "xe_platform_types.h"
> +#include "xe_sriov.h"
>  #include "xe_survivability_mode.h"
>  
>  #define GSC_BAR_LENGTH  0x00000FFC
> @@ -176,6 +177,9 @@ int xe_heci_gsc_init(struct xe_device *xe)
>  	if (!xe->info.has_heci_gscfi && !xe->info.has_heci_cscfi)
>  		return 0;
>  
> +	if (IS_SRIOV_VF(xe))
> +		return 0;
> +

this shouldn't be needed any more after commit 552dbba1caaf
("drm/xe/vf: Disable CSC support on VF")

>  	heci_gsc->irq = -1;
>  
>  	if (xe->info.platform == XE_BATTLEMAGE) {

