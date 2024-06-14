Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D7CC27C6E
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jun 2024 03:42:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 682B410EC18;
	Fri, 14 Jun 2024 03:42:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ls0Knrf8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 720D810E068
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jun 2024 03:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718336550; x=1749872550;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=euLN0Xyjb2K9+MDdZM+thGF0eeuF6ITnLBKoPmSXiuU=;
 b=ls0Knrf8YTeHTAt2UfJT1T5EiZxbPksjr97G2vOWzzOcQwoYVdS/aNrH
 t2zlPlLOo1KkAjjNoxMu0cTWJf7oiJN6+J8rhg+bz/3IpK9X6HQwyecqV
 p0OwpWudMmOU2JpS85+X7O5gJRAfU4TOv08iQbVxtmcyQK7nl2C4Ua6XG
 zKGjlFthll+toDLjh0xSGLMvfuugwpRHiEUL7Y5QGDB7VpF6n8GhvjaDm
 TCNtEbPB7TIr+b27npZPn0eWGrKHb8Ov0moQsL0beWht1mBwny4O/IBQc
 mSv4AuJHqjTIYxfVTvUHuG5XUeaa3tlTRecukv4dDV1MfoEcq/BAE8rcT Q==;
X-CSE-ConnectionGUID: pqM9RY9uSFuWC/RIJajYcQ==
X-CSE-MsgGUID: xci42jerRbqRLFzaevkQoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="18990362"
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; d="scan'208";a="18990362"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 20:42:29 -0700
X-CSE-ConnectionGUID: LRsF7Qs7SUiCO/163t88WA==
X-CSE-MsgGUID: sEiBcv5PSsOYEaQHgUe5Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; d="scan'208";a="71582886"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Jun 2024 20:42:29 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 13 Jun 2024 20:42:28 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 13 Jun 2024 20:42:28 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 13 Jun 2024 20:42:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ceSTSrS56XHy/xAGBDKoPxeiXo39JGFbsitz/mmnLJBh2UJL442nfpKF5YZxJOJjG2orZPVVguL4/j7/S+KO8zYaxYhT3jQrNN0UbG4p0AuaR3umLAI/ue6t9bAgfnnH/Fdb+ZSLY0b9pRcshZoDmlgFjQBpRjigZTTXN7FxIUkiQ0p67uvxpax6UDrMN/4OgztIS0vEvBzziSsLZaWuGvIDbhmYqLf1BIefxPtYAzMag82dGKdhKDJD8HqSLUL5bopgpRiNHaxGgYtPryhFYfoJddh8fULnDpl2zcnLpQhB0B5TW+1DPa+sMZH/eKwg8BuMh3eL51xC/bVCI/75zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lbcY2zEl4lpuQz7NYSUnh1oF2op7Fx5A3/hyM3LyFE4=;
 b=EHMrPt4UI9nrQYmqBYjNn78ldRmhMPY5HPj/s/4Vh9zK1vxiuvOQw1IjMwhL4l3hGji0mDNfQgiYlw5pgImgIXVP95RN0dcKZWU/vQJclz7NSUHb3J2Lkqk2Ot4iEg/9iaKJwFlEaCKc7uVJP+njEBxYNoA+WP3lw4SQrZ5scB9sik9mQ+vcTM0Xkdnh/JQlprrsJOZVpDg14hG2oedLzULpoNpCIFFYKrSfEHjxRlwucw/pgEf+uwdxhFS1x0mnYuXlc6mpyzqvvssOc0AsjvzSKLTMoNVSYuSDozdykJ+tybOLiPEJHQeI3RVtge4hGWDn72dVmjkxCUQ43q2D0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DS7PR11MB7888.namprd11.prod.outlook.com (2603:10b6:8:e6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.20; Fri, 14 Jun
 2024 03:42:26 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%3]) with mapi id 15.20.7677.024; Fri, 14 Jun 2024
 03:42:25 +0000
Message-ID: <8aeddb31-4089-4261-8821-36fc0f052caf@intel.com>
Date: Fri, 14 Jun 2024 09:12:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe: Introduce GGTT documentation
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
References: <20240613214700.306424-1-rodrigo.vivi@intel.com>
 <20240613214700.306424-2-rodrigo.vivi@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240613214700.306424-2-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0149.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::19) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|DS7PR11MB7888:EE_
X-MS-Office365-Filtering-Correlation-Id: 4387463b-2eb1-434d-27df-08dc8c2401cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230035|1800799019|366011|376009;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c1gyVmljMlZzZmhseW5KdVQwR3lZV0wzMklLcXJ5WjV1a1oxVU1jN3J1YmZY?=
 =?utf-8?B?TTJtUjJXSVdFR1IwdXNRSjBmUWFzVGpPdHNjR0ZEVVBra3FOTW9NUjNGR0Mv?=
 =?utf-8?B?TXVBYVVrcmY4STdYYW1scEhZRDdVZVF3cURZc0N2MTZwdU1xQjIzWFEwblpy?=
 =?utf-8?B?cGNxVTB5Z1k3QXAzdnhidHFYSVJzTEhxSzdUWGVEYnRNUFl3d2h3RFJ5TlQx?=
 =?utf-8?B?cjIyWmNjV2N6UVV6Z0tBaG1FeGdETXk0ZEFrV3NiUUVERGJ3UDVHelFKbkVO?=
 =?utf-8?B?REErYUdmVk5JKzgvNVdrTVdTeHZacVh3QitJV3BSS1hlZEloaWVHb1VUNUJw?=
 =?utf-8?B?Z3RJQlVNY284dXZDZy9hUXlLbkExN0lkZkFyNXU3ZzFpckl0SEpvUWlEWE51?=
 =?utf-8?B?Q2lueGdhNUxpNzMzczd2K3NjV1JyRmNLcW56enFYT1pjdmdwU3UvWjVneEl2?=
 =?utf-8?B?bzZlRzZCM3REQ0NjS3QzbnVEUmx5enZYc3NQYmpBSFlqNnZMbjhzRXhZNTBs?=
 =?utf-8?B?T0xteHprZ3ViVXFDLzgyUWd0c3RNa04vNXN0eldaOG5SK1FKRnkyZU9QYmZq?=
 =?utf-8?B?bVFsbXZPbGxTVmNwVmg0Z0p0U2RCWnRoWlh2M3Z6MThpaVBHUk5qQWN2cVdD?=
 =?utf-8?B?MFVMTWxydmZUYmcvSmlXS3BJek0zSURIbzZPVzQ5emlkVGlNSTZDL3dsbXNQ?=
 =?utf-8?B?d2d2Y04xRDZUeFR3azRCbnMrbENhZGllb1JIMG9Hd28rZEwvRlV0bnVkTkdN?=
 =?utf-8?B?YU9ES0xOaTVmRUZnUDl2T3pHWUdlZGsxNi82VlpMMWV6OFRCbXlRcWhVMkdp?=
 =?utf-8?B?Nys4THBobzQ2TWU1Y3pSQXArUHhta1FLSThRU0ozbWIrYmExemJDYnZOeWha?=
 =?utf-8?B?S1N3QWV6YVRZb0xXMFBrUGszRXRjVmtJRm9VblJJSm4wMURUdHIzZlBoTTVT?=
 =?utf-8?B?aHRxc2FnNDNIY1hVYUJNR202NGg1NTl5YmE2Z2pJNGl2T21KN1lJVmpHblFx?=
 =?utf-8?B?TjJmZXNmR3JqSXNEZTZxMU84Rmh5bXUwU29uejVKbUpuS0RJR1d6YmdaL3F1?=
 =?utf-8?B?VzJScG5RVSs2WmdxR1UvOVFUclcwTCtuS1dteDF3QTdIUnlYeGNwek5MWFdC?=
 =?utf-8?B?OUVpRm5zVkRLVWFZYysxcFY1eWw4d084Ymw2cmM3Sjdrd3NQTWd4aXNJUWJ4?=
 =?utf-8?B?dDdEV21HM1FFSStBQllhRzViN09JNGcxOEJ6cXpBcUVyUkxMS1JORWI3eFFo?=
 =?utf-8?B?b0RMSnA1WTJMOFEvcDBmTTFPcXh1U3BBVDVWYjhUdWxPaXJBZUR1bXpINTJu?=
 =?utf-8?B?STZMT25mRVlUSlZoNzVaQXQxWkFuaVMxODB1NlFxQTIzSU5LQXFRc0VXVFdo?=
 =?utf-8?B?aUp4ZWFjTE5tQWR5M09BdThSc1p0L2pRSkFKd3ZKY3Q2blRsTVhKVnoySjg0?=
 =?utf-8?B?NWlMN3pqeWN5ZXBvc1J2dEFrYTZuL3lDekRBMVBFelVwRkxUSkc3MmhyNGJC?=
 =?utf-8?B?YnFjZzF6UEdiWkFkUWZEZHgzMWVuSjYyRE84NmZuRXNMcjdOUmVoR1Y5WkNs?=
 =?utf-8?B?VjYyVGN0TytxWEluSTkxd2todmJXejRQNUZ3K1dya1l3WTVodElhOVQwbzNO?=
 =?utf-8?B?bHgrVjJxUWt6VUF3eXRyUzdTeVd6eksvamp6MXlQOEFhSlVVMkZvRzFlNjg3?=
 =?utf-8?B?ZytDOUtaaGpXK2haS1htRUg1dGlxY0p1REJxMlRxdFJzak5pNzJhYmgyU3Q0?=
 =?utf-8?Q?9F8BHGKY4W4N2Dmu2Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230035)(1800799019)(366011)(376009); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmhLZWJYeitnYVhRbTdRNHBCdDhqZW5ka01Fak40RG5DRjBhMmM3MGhpbHB3?=
 =?utf-8?B?d2pGQWtzVnVsaDNvdGhqbDRVM09Lb1RqTFI5R2g1SnRFb3VCQkNmN3lLdi9H?=
 =?utf-8?B?NllLMmU1dys0OXhDemVGd09kYSs1d2R3WllLeWZ1TVU2anNoZlNsUGJ4VmZI?=
 =?utf-8?B?L0FjZGdiRVlFb0pUN0c2WFhOVzk2TDlneEI3UTdpVTFBVWM4ZVVXNE1na29R?=
 =?utf-8?B?SzBJVE5lSU4rWmhTeU9qR2lRVGZZbmtKWlhBN0J5V0RtTGFHVDQvYUEvQmlW?=
 =?utf-8?B?WW03bmIvUlpZUU45d2RGS0paSUR1eU9Fa2tha1dIcGJVcFBWU1hKL2xGN01Q?=
 =?utf-8?B?aVFVamZwNVpQMlN0bXU5UmlOWFRoemdqbnhhVXBEV3FrczNjV01zRU5OWUxh?=
 =?utf-8?B?cTh0a0Y5REZOQmlQSDdUaGdCQm1tR3ZwcWNLQ3dHYXVPc2hidWtXTFpoZlI2?=
 =?utf-8?B?VEJQbmozYU5kcmxValhyS2hhMnZYSktYektaS2tkRTljSDAzQW9LYjR6QUNQ?=
 =?utf-8?B?U0FTRWlydXZ4NzBnRFJraHJmRW9xanF0V2FNSXNqb2RqZ3k0SUxWMzFTc3Jy?=
 =?utf-8?B?V3JYTXlML3lvMTIzRG1nTHJKWlpla1JQeHBzU25vUEdJalcyWG1DTW9KWGZT?=
 =?utf-8?B?TVp1WDFqRFpWbDl3WHplNzJRNk9Kd3AxdnhCekRQRVRLcTVCd2xiRDdTdGVx?=
 =?utf-8?B?dXdLdWE5TkF6NWdOYU9jVWh4VXNGQTQvZTdjaWVMYXBqaGtic216YWw0b3ha?=
 =?utf-8?B?U3d6VnRsZWZjdW02bkxFMTlEUmhXNnovMnAzL2JHVzNmVi9OSG9HTkpEYW56?=
 =?utf-8?B?OWVKU1QvVzNGNFkraUtrU1QyQW1lZnljUnhodVFNQ2tBekY5ODQ3a3EyYXkw?=
 =?utf-8?B?R2I0L1EvK0hUbllSUnp5OGY5YUlTZTh3NVRwNHFWWHRPQTBZL0k1U3FULytE?=
 =?utf-8?B?VENsTDZzaGxLY2Ixa2NaR1hpb0VTWE1tZmNqM3R6NGVrdUo1MHcwdWhuRlh4?=
 =?utf-8?B?YTkwbzlHSHNUdnJOakxMTEh2RllHeDZDdWNGSG1QaHhLNmxPSElTWEpUQmVp?=
 =?utf-8?B?WW1HaHpMTTh2Rk9iaFBxcTJIaGVQL3NqSDd1L2pkVytFQTg1ZGxXTnhxbHhD?=
 =?utf-8?B?TVBJRmhVdlVkNXoyUUxqV3VvM1lqcmJMWXJLVXhMc3RvVzBIV3M1TmdUZGQ5?=
 =?utf-8?B?bitOS01uamtaNW8raXkyRlFoZitHVnViSG9QdGZobWZ6eFJWSGlLTkV3TEg5?=
 =?utf-8?B?M2hEcDZNZWp4blUvOGMrWWVxZTFRejlIaU5OUmp4bXA1dlVpUkVnc0RpUzcy?=
 =?utf-8?B?SDhweUU0ck51N2xRd08yVDYzd2N2NjV4bkhIZjNMNjA3ZnVMaGlTSG9hdDBX?=
 =?utf-8?B?QnA4dnRQaGJtaTBwTzgycGZHS21mS3pQVlMwaE1ZSHRMcUlEdngxbVJwNUEr?=
 =?utf-8?B?MWJ6ZWFGUWFUYk90NkhudHVKTnBJREVpVllTK2M5OGdRYXBENDRnR1VVY25H?=
 =?utf-8?B?aGc3L0xBU2prZEtaMGZ5RThHa1NKNUJNWWYrNnNHOTNpNmNxd2ltMUlwdTNU?=
 =?utf-8?B?UW9qU3ZMbzZvUjdoV1FUdk5ZN09UekdBUEhEQ3pKcXliUzhsemhINmRCSWk0?=
 =?utf-8?B?QVVLNzVjcVVYZDhtU0pxTGlFVXRITGRsZUsvN3UzWGE1SlV5ak9PUHl4RnZa?=
 =?utf-8?B?L2hnTmNXS25HOElVSjdZSWtFVUZSRitJd2M0WGVEV2g4UFNOZWdvRnVCM04r?=
 =?utf-8?B?SjFSczdGaU9kbVE2b1pGZlFCWnN3V3hIanByWmRORTV1Tlk3Q2lwalFESkNt?=
 =?utf-8?B?M3BSNGYwa1hrUVZ0NTNSODNIZXY0SlF5cnNCaW9naWhsMHNjaUk3ZnRYWWJ3?=
 =?utf-8?B?MnpzbW9JV2JGNDFRdkpnS2JVK1BYUjlaeFViQWYvTCtjbHhzR2xQUlU2RGY2?=
 =?utf-8?B?cmtFWDR5aDhwRVNPQmpyUUIxeWJyU3FrYU9IbXRqRjJSTElFSEZvTkhJNmRk?=
 =?utf-8?B?TXc5V0lQTGRiRDFZUFZ1Um9KZTRSVW56NWZMWGZOSXQybEs3bVhXQ3dxZFBF?=
 =?utf-8?B?Y2hlZjlXaVdlMmtMZXB0VGxOd3ZMR0lGcFZveHNtRzgwR0tIaThoM0hpZzNi?=
 =?utf-8?B?Z1kvS1lJKzIveFdoT1U4eHVyQ20xNksrdmloZnI3MEN3c2J4bUFQMG9oNTJ3?=
 =?utf-8?B?elE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4387463b-2eb1-434d-27df-08dc8c2401cb
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2024 03:42:25.9225 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: egezFL1TCdNQQLLlP8tULDPNsq0a7PzveSOk+WvWEmEbSzjYpn5IxrAxx3xd5DhZQTymAXq0BeGb7Y3O2v/XnypSDKAnyHjA+RdD/Y8i2hU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7888
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



On 14-06-2024 03:17, Rodrigo Vivi wrote:
> Document xe_ggtt and ensure it is part of the built kernel docs.
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   Documentation/gpu/xe/xe_mm.rst     | 15 +++++
>   drivers/gpu/drm/xe/xe_ggtt.c       | 99 ++++++++++++++++++++++++++++--
>   drivers/gpu/drm/xe/xe_ggtt_types.h | 26 ++++++--
>   3 files changed, 129 insertions(+), 11 deletions(-)
> 
> diff --git a/Documentation/gpu/xe/xe_mm.rst b/Documentation/gpu/xe/xe_mm.rst
> index 6c8fd8b4a466..95864a4502dd 100644
> --- a/Documentation/gpu/xe/xe_mm.rst
> +++ b/Documentation/gpu/xe/xe_mm.rst
> @@ -7,6 +7,21 @@ Memory Management
>   .. kernel-doc:: drivers/gpu/drm/xe/xe_bo_doc.h
>      :doc: Buffer Objects (BO)
>   
> +GGTT
> +====
> +
> +.. kernel-doc:: drivers/gpu/drm/xe/xe_ggtt.c
> +   :doc: Global Graphics Translation Table (GGTT)
> +
> +GGTT Internal API
> +-----------------
> +
> +.. kernel-doc:: drivers/gpu/drm/xe/xe_ggtt_types.h
> +   :internal:
> +
> +.. kernel-doc:: drivers/gpu/drm/xe/xe_ggtt.c
> +   :internal:
> +
>   Pagetable building
>   ==================
>   
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 2d5e802f862d..950af831113d 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -27,6 +27,19 @@
>   #include "xe_sriov.h"
>   #include "xe_wopcm.h"
>   
> +/**
> + * DOC: Global Graphics Translation Table (GGTT)
> + *
> + * Xe GGTT implements the support for a Global Virtual Address space that is used
> + * for resources that are accessible to privileged (i.e. kernel-mode) processes, and
> + * not tied to a specific user-level process. For example, the Graphics
> + * micro-Controller (GuC) and Display Engine (if present) utilize this Global
> + * address space.
> + *
> + * The Global GTT (GGTT) translates from the Global virtual address to a physical
> + * address that can be accessed by HW. The GGTT is a flat, single-level table.
> + */
> +
>   static u64 xelp_ggtt_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
>   				   u16 pat_index)
>   {
> @@ -69,6 +82,12 @@ static unsigned int probe_gsm_size(struct pci_dev *pdev)
>   	return ggms ? SZ_1M << ggms : 0;
>   }
>   
> +/**
> + * xe_ggtt_set_pte - Allow directly writing to a Page Table Entry (PTE)
> + * @ggtt: the &xe_ggtt with the PTE to be set
> + * @addr: address of the GSM
> + * @pte: value to be set directly to the PTE
> + */
>   void xe_ggtt_set_pte(struct xe_ggtt *ggtt, u64 addr, u64 pte)
>   {
>   	xe_tile_assert(ggtt->tile, !(addr & XE_PTE_MASK));
> @@ -130,12 +149,16 @@ static const struct xe_ggtt_pt_ops xelpg_pt_ops = {
>   	.pte_encode_bo = xelpg_ggtt_pte_encode_bo,
>   };
>   
> -/*
> - * Early GGTT initialization, which allows to create new mappings usable by the
> - * GuC.
> - * Mappings are not usable by the HW engines, as it doesn't have scratch /
> +/**
> + * xe_ggtt_init_early - Early GGTT initialization
> + * @ggtt: the &xe_ggtt to be initialized
> + *
> + * It allows to create new mappings usable by the GuC.
> + * Mappings are not usable by the HW engines, as it doesn't have scratch nor
>    * initial clear done to it yet. That will happen in the regular, non-early
> - * GGTT init.
> + * GGTT initialization.
> + *
> + * Return: 0 on success or a negative error code on failure.
>    */
>   int xe_ggtt_init_early(struct xe_ggtt *ggtt)
>   {
> @@ -225,6 +248,12 @@ static void xe_ggtt_initial_clear(struct xe_ggtt *ggtt)
>   	mutex_unlock(&ggtt->lock);
>   }
>   
> +/**
> + * xe_ggtt_init - Regular non-early GGTT initialization
> + * @ggtt: the &xe_ggtt to be initialized
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
>   int xe_ggtt_init(struct xe_ggtt *ggtt)
>   {
>   	struct xe_device *xe = tile_to_xe(ggtt->tile);
> @@ -345,6 +374,18 @@ void xe_ggtt_deballoon(struct xe_ggtt *ggtt, struct drm_mm_node *node)
>   	mutex_unlock(&ggtt->lock);
>   }
>   
> +/**
> + * xe_ggtt_insert_special_node_locked - Locked version to insert a &drm_mm_node into the GGTT
> + * @ggtt: the &xe_ggtt where node will be inserted
> + * @node: the &drm_mm_node to be inserted
> + * @size: size of the node
> + * @align: alignment constrain of the node
> + * @mm_flags: flags to control the node behavior
> + *
> + * To be used in cases where ggtt->lock is already taken.


How about using lockdep_assert_held to ensure we get warning if used 
without locking ?

This patch appears good to me in its own.
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>


> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
>   int xe_ggtt_insert_special_node_locked(struct xe_ggtt *ggtt, struct drm_mm_node *node,
>   				       u32 size, u32 align, u32 mm_flags)
>   {
> @@ -352,6 +393,15 @@ int xe_ggtt_insert_special_node_locked(struct xe_ggtt *ggtt, struct drm_mm_node
>   					  mm_flags);
>   }
>   
> +/**
> + * xe_ggtt_insert_special_node - Insert a &drm_mm_node into the GGTT
> + * @ggtt: the &xe_ggtt where node will be inserted
> + * @node: the &drm_mm_node to be inserted
> + * @size: size of the node
> + * @align: alignment constrain of the node
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
>   int xe_ggtt_insert_special_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
>   				u32 size, u32 align)
>   {
> @@ -365,6 +415,11 @@ int xe_ggtt_insert_special_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
>   	return ret;
>   }
>   
> +/**
> + * xe_ggtt_map_bo - Map the BO into GGTT
> + * @ggtt: the &xe_ggtt where node will be mapped
> + * @bo: the &xe_bo to be mapped
> + */
>   void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
>   {
>   	u16 cache_mode = bo->flags & XE_BO_FLAG_NEEDS_UC ? XE_CACHE_NONE : XE_CACHE_WB;
> @@ -412,17 +467,39 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
>   	return err;
>   }
>   
> +/**
> + * xe_ggtt_insert_bo_at - Insert BO at a specific GGTT space
> + * @ggtt: the &xe_ggtt where bo will be inserted
> + * @bo: the &xe_bo to be inserted
> + * @start: address where it will be inserted
> + * @end: end of the range where it will be inserted
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
>   int xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
>   			 u64 start, u64 end)
>   {
>   	return __xe_ggtt_insert_bo_at(ggtt, bo, start, end);
>   }
>   
> +/**
> + * xe_ggtt_insert_bo - Insert BO into GGTT
> + * @ggtt: the &xe_ggtt where bo will be inserted
> + * @bo: the &xe_bo to be inserted
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
>   int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
>   {
>   	return __xe_ggtt_insert_bo_at(ggtt, bo, 0, U64_MAX);
>   }
>   
> +/**
> + * xe_ggtt_remove_node - Remove a &drm_mm_node from the GGTT
> + * @ggtt: the &xe_ggtt where node will be removed
> + * @node: the &drm_mm_node to be removed
> + * @invalidate: if node needs invalidation upon removal
> + */
>   void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
>   			 bool invalidate)
>   {
> @@ -451,6 +528,11 @@ void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
>   	drm_dev_exit(idx);
>   }
>   
> +/**
> + * xe_ggtt_remove_bo - Remove a BO from the GGTT
> + * @ggtt: the &xe_ggtt where node will be removed
> + * @bo: the &xe_bo to be removed
> + */
>   void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
>   {
>   	if (XE_WARN_ON(!bo->ggtt_node.size))
> @@ -507,6 +589,13 @@ void xe_ggtt_assign(struct xe_ggtt *ggtt, const struct drm_mm_node *node, u16 vf
>   }
>   #endif
>   
> +/**
> + * xe_ggtt_dump - Dump GGTT for debug
> + * @ggtt: the &xe_ggtt to be dumped
> + * @p: the &drm_mm_printer helper handle to be used to dump the information
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
>   int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p)
>   {
>   	int err;
> diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
> index d8c584d9a8c3..5718726e8b3a 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt_types.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
> @@ -13,26 +13,40 @@
>   struct xe_bo;
>   struct xe_gt;
>   
> +/**
> + * struct xe_ggtt_pt_ops - GGTT Page table operations
> + * Which can vary from platform to platform.
> + */
>   struct xe_ggtt_pt_ops {
> +	/** @pte_encode_bo: Encode PTE address for a given BO */
>   	u64 (*pte_encode_bo)(struct xe_bo *bo, u64 bo_offset, u16 pat_index);
>   };
>   
> +/**
> + * struct xe_ggtt - Main GGTT struct
> + * In general, each tile can contains its own GGTT instance.
> + *
> + * The @flags can be:
> + * - %XE_GGTT_FLAGS_64K - if PTE size is 64K. Otherwise, regular is 4K.
> + */
>   struct xe_ggtt {
> +	/** @tile: Back pointer to tile where this GGTT belongs */
>   	struct xe_tile *tile;
> -
> +	/** @size: Total size of this GGTT */
>   	u64 size;
>   
>   #define XE_GGTT_FLAGS_64K BIT(0)
> +	/** @flags: Flags for this GGTT */
>   	unsigned int flags;
> -
> +	/** @scratch: A BO as scratch page */
>   	struct xe_bo *scratch;
> -
> +	/** @lock: Mutex lock to protect GGTT data */
>   	struct mutex lock;
> -
> +	/** @gsm: The iomem pointer for easy PTE manipulation */
>   	u64 __iomem *gsm;
> -
> +	/** @pt_ops: Page Table operations per platform */
>   	const struct xe_ggtt_pt_ops *pt_ops;
> -
> +	/** @mm: The &drm_mm struct */
>   	struct drm_mm mm;
>   };
>   
