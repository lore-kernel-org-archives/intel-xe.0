Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B707C25B75
	for <intel-xe@archiver.kernel.org>; Thu, 16 May 2024 00:01:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED78C10E284;
	Thu, 16 May 2024 00:01:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jBMX48GT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2051F10E284
 for <Intel-Xe@lists.freedesktop.org>; Thu, 16 May 2024 00:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715817666; x=1747353666;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=JMvYXmq73mM+cqiXc2l8w695tkXL6/GvUfs07xfW74k=;
 b=jBMX48GTBL01tcA+aCay95qHH9A8anpJlTWVSZ6WMbJkLOevbJPf8qUs
 B6OA9YbkcbIxwEgEtrRbdEVlb53kqsZ2uT+FRZlMQnt8h5aHFNSh/6Eph
 02eAjgb3IqoHTBgVmMkd3RF9qZ16ln6LUa6wCRnRIwOQ0tX63x8Rk2Osl
 5BS/yUkNexXoivkfmR+A2423VgdjpAWoy8zWtctQUc7Liizyaq1ehzUk4
 LcNkfIi9wHXw//EBXIw7H3lyPoDftmXssDu31J7GpbeKxwh3B2SQZ4oEF
 qZuKwC1eH0JS+teq/rBK+jEEVGWfrpJ8WXedaH/+gGzVO1u2Ku7MEtTWV Q==;
X-CSE-ConnectionGUID: bQIgljHkRTKe9mm8ZMgRXA==
X-CSE-MsgGUID: UvECK5vSTXObX9dR+FjfwA==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="15724998"
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; d="scan'208";a="15724998"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 17:01:05 -0700
X-CSE-ConnectionGUID: UUqvVaOrQOiTE6Do0ICwMw==
X-CSE-MsgGUID: O1/jt/cLRdmBr1hTEavWdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; d="scan'208";a="68688678"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 May 2024 17:01:06 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 15 May 2024 17:01:05 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 15 May 2024 17:01:04 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 15 May 2024 17:01:04 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 15 May 2024 17:01:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Crs4KvkUbLdxI0PkO8hxWn8KJ5QGf7wstxMLsJ2ZhiNjz4rdWgQy3x2OMOrkX3CpnPrSqHDZgmM/B/IDBEkGZlq/3lT67WEWgIZRV1d4YCU4fAXm1IXN1ZoWVpixBrKrq0J2CRawsk+5bHBg8fEG9wh/GVc4D8DBr4QRlPgBqsplP0NQf3MRnOoJWoEvhfnKho7elyaYS8cy7CiPl+XTwTSEv0pZ0c/ZsbfqXcw0dbaz7bs+lUyMfCYA/0E4pCOmz74f99Ft2Nsi754tN932wHns2pYX1Q7FuYoSTZv6MaouR+MEQEEPAViKtYoNVIi/OIthk0rFLhkwO3GAv4uXZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oarzm2/jVwiNYJr9uy5o/gwsG2v3quQDA8W/x1n8z+I=;
 b=bqOycomKY8gSdDOGjEZc8Ai/kC8ASrVdApODESDPtKhVaq5G1UA+Z45hZGXiB1eEtdFnwn8DPPcTDg5nOPvVRwqxNh6Hh7RUoixG/jdDuYFx0ihTRlRcUrRF+kPSHdnURIQHPH8LMYclO6jPpmIWw+/9feJ/ac/Lca0nhspQ7wPre0P3zow+gkqf//f5cW2IuMHejD5PXyIeKq0ZbBd+6m1dBccvwrfeQJDAZxYLMSBELlnBr/fLv3/WaIKHZV9/79Kmjepq2Fxwo5NjQhmoxu8zSW5aaZLmb/yXsx20EWTG6Z2hQdr9e6H8etznaoThL/6lFLUlqJX8vj9y3x7TOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by LV3PR11MB8529.namprd11.prod.outlook.com (2603:10b6:408:1b3::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Thu, 16 May
 2024 00:01:02 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.7587.028; Thu, 16 May 2024
 00:01:02 +0000
Message-ID: <5a2f8adf-ed56-4765-8a13-a85f87f0d009@intel.com>
Date: Wed, 15 May 2024 17:00:58 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/xe/guc: Improve robustness of GuC log dumping
 to dmesg
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <Intel-Xe@Lists.FreeDesktop.Org>
References: <20240508224927.11341-1-John.C.Harrison@Intel.com>
 <20240508224927.11341-3-John.C.Harrison@Intel.com>
 <b978eca4-d69f-4d67-b3f2-34ccfbd1b506@intel.com>
 <9da5ca75-58bb-485d-a0fa-909a5d31f8c7@intel.com>
 <9000fac5-b49d-4c1b-b09f-f8b0a2cf60c8@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <9000fac5-b49d-4c1b-b09f-f8b0a2cf60c8@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR20CA0036.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::49) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|LV3PR11MB8529:EE_
X-MS-Office365-Filtering-Correlation-Id: e756e9fd-d117-4e61-4b03-08dc753b4625
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cWU2UnJFUysvclY0ZHNkNFNrNjFDVmJvNEFqYzVEQXROVEEreWJPSjZoSDNV?=
 =?utf-8?B?Y2d2TElXZUxIYTNPUWRHMUo5TlJoVTRSUUtRbnRpMWYvSXBqcGhIVFBTblBz?=
 =?utf-8?B?ai9Td1pLd2xnTk1OaWJCaEZtS0FvZVJRQmhSM1VjT3hETnNGQ1J2SmNQcEVy?=
 =?utf-8?B?NzQ3QjdDSFFFMHp0dW5sejY4UVV3TTN5WVArdUJMSlArL0tZNzFKZ1MyQlVS?=
 =?utf-8?B?RllnRnZQRVo0cElIblVSVmxRNTJQRFExeHpGekFsZUVLcDZaL2s0T3hWUndS?=
 =?utf-8?B?MnpUaS90aFNBT0J4aXhVVktjblZoR1FsZnZpMXdEN0hpeTRtai9PS3RBUGlH?=
 =?utf-8?B?M2YrZGkrbWN0d01hajY5MElFSWxPVUkwQkxTaDl5WkJ4NHZ5SWNWbEdxWEhI?=
 =?utf-8?B?emQ3OThiWXFzYktVZXI3dGpDcGd5VjJPQ0dVelNmWGxBS0Fib05CeERlTHNw?=
 =?utf-8?B?RkZSTktGdHM5UnA0bnhtZ1diQVV0QVpPbUFzbUowOHJXb1A1NnV1c2FYcWt3?=
 =?utf-8?B?N1U4b09MRGZydDhkYVJMcUU5L1NmRlMxVW9VcUZGb0grWHBHd0JuVElFMXNx?=
 =?utf-8?B?aERWZ0Q2NTNncXlJdHpzU3FSZVdiejlzTERVZjA5RDcxbmhYMlZiSnZaQ2Y3?=
 =?utf-8?B?NG1ybnY5YUpYWjFDWTE3amRZaHR1RkMzTzFpQWdVOVV3RDJkM1BTcy9lU3dX?=
 =?utf-8?B?cjlFeWpHYjB3bTNNdXU4WE5aR21HbWhEYjJuWjU3QlZYTnhBRHRtYUw4ZTBt?=
 =?utf-8?B?ZjYzdGRvalI3KzlrK0o3UEVQVldnS3J5TWNTN1pUSlYyRmZ0SmoydVJzeFVJ?=
 =?utf-8?B?aVlBUlFBa2VVTEc0REZFdVNOU0R0dTNjUWUyY1MyVzdhY0VDRlpwNS9QYjRr?=
 =?utf-8?B?bmthT1ExRFIyUEE5cjRlWmxZMTR4QkhEeWRNSzdBM0dBTS8xTWY5Z21way8y?=
 =?utf-8?B?VnRYeU5tYWl2aFg0NzV4UUErRzh3U0Jhcm9uKzh3d210bjFseExIS0dUbHJI?=
 =?utf-8?B?Sk9aOVdFOVlyd01ObkkxSkU4S0h6b2wzUWJuU3hRK3ZJbzgxeGUzYjFoU0pE?=
 =?utf-8?B?YnlzelBlY1hWblY1ZWUrdDdMQndJeFpnZG1aVitTckgvV0x4cVppNmJKZE9N?=
 =?utf-8?B?TGtDd3BndVp5QUtLa2ZMakVKaXNlMHpBcEdISkN6alBPNDc2K2hPK3FCaGl2?=
 =?utf-8?B?THNBMEQzYzVoQmthUVI5MFgxTER0WEpGR3VEV0w3QldpUS8xbzJWVjczSTRR?=
 =?utf-8?B?OWk5L3RndjFiRm9zQUJheEcwOWRoTDNGRE5abnJVKzJ2UDd1RzEyalBsa3NE?=
 =?utf-8?B?U0p0MURhanNxTjZlZXpncmhUZnFYSWhUSlpSekg5bHdCaXc2SGNFc1V0S0ZW?=
 =?utf-8?B?Q1Nzanl4Q1YvM1NOQkE5UmpZaVBDN2ZaYWVCUHRvakZqVHdMWjlLMFcxOUV0?=
 =?utf-8?B?YUpDVGFiT2FUQmNOUXNnanR0RytmalM4UUg3dDBzTnBOdm5reGdxblBrUk8w?=
 =?utf-8?B?L1VnUXdDWGZHUUJYd09XYnArdlFuSFJSaEwrcDVvTXlxNGIrZEZFU0VWQjlE?=
 =?utf-8?B?WS9RdWlJbFlhRHF4dHpHZUppaTdUcGwvbTJGeWQxZllwOFRBRC9sLzZmY25m?=
 =?utf-8?Q?4ztC3boVAfAOelUvbB6o0eXsX6qyRh8VW6wNp5Cf4vGI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aDZadDNnVVkrWmdLM2xxRkNkekhMUFZYWWR5SEJ2WmI0Mnc3RGF2ZkRFWnd3?=
 =?utf-8?B?TTJFQnI0QzN4N1JKTkJTcjU4WFhudUJ0YUhIa3FHVVdGVnNnUlJZdUFtTDhC?=
 =?utf-8?B?RVFkT1lQZ2VSMGIwZXVmSEJLMHlGcWdkalgxMGtmVE9OSmU3SDZ0YXJpaGVk?=
 =?utf-8?B?MUhPQVhXSHRLKzhrTUhCUjVnMndsa0ViajRhN2pzMW1UbkJyT2paQUxwSzk1?=
 =?utf-8?B?VmNreVFYRmJCMFJxWCsrd0tEQk1JQ1RNcUFUTHdoeWVLVlZidW4zUVp0anNs?=
 =?utf-8?B?NXZISDBnSytZOURwK3YwYkhQUzcvVW5WR3dLR3NlU05yMm9YUFpKVC91ZWFq?=
 =?utf-8?B?YkZoSmZReWVKVmdqWWNBcVBWNGpTTFhqbjR0dWVzaWw2b0Z6b2NoS2kwTDFi?=
 =?utf-8?B?OFdTM3IvalY2eTNGNm9DUTN4ajJjeWQxV2ZKUU5ORUgvTGJPZHAwcDBXcHlq?=
 =?utf-8?B?YnBoUC8wbitESDVrdGx3SjhzT1EzL0UwT0VvMTdqSitHdExFVHhrTlFYZVJv?=
 =?utf-8?B?S1Y1UHBFK3MvMkc3V2Z3UFAxblBKL1RIVDhCY3VPU08xYXFyQ0lRQitjNklw?=
 =?utf-8?B?S3RVeE1Uc2E4WGIzM3luWlNTNEw1c29qR1ZUSXhtVFEycUc5dEFhMEIzUHQ2?=
 =?utf-8?B?SE91L1Z2NmNwbmpMSVp4RktWTTJnT2MyM0h6aWthdjJmeEhCazFtbGdyLzNV?=
 =?utf-8?B?QXlSVzVHSytwd3R6V2RsS21LYmJUNWQvNjNMRWZQU2w1VGwzOE1iQ3pEUDBR?=
 =?utf-8?B?U0cvLzlYU1owZkttanhQdjJWTi92WDdsTk1hNWExdzlRc1dBU2U5Q1ZEYWp0?=
 =?utf-8?B?STV2ODlSbmNOUEtad1JRNUpQeGZsUW5Ea0hWbzAxMmk1V0IweXFFVThUQy96?=
 =?utf-8?B?NzZ4Qk9TMTM5Y1ZEUlE5dFRrWXRsUVEzR2pqelQxWVcrUXA3N2hVK2g0U1pK?=
 =?utf-8?B?NmF4L0FER1RQYW1DdzZ1alh5aWMvMytJbFkxL20zdUFjQWpLRkhraTRRUm5s?=
 =?utf-8?B?aVdxUWpxS2ZXNWlKU3l2WlIzR0JyTVRrMW5sNnhsMDVacytQM1RJd0JoZ1pM?=
 =?utf-8?B?ZElLVlcxTnFBcGh1cDR3Q3p1bzIyUmpnQ0JhZ2ZzQU1QOVBSblBiT0N0eitM?=
 =?utf-8?B?T1ArTEt5bkUwcnZDUkg2RE40bVppRWtRV3BBUmM4TDAxb2pvKzdRNWFsZUo4?=
 =?utf-8?B?cEFkSXF4T2srcmhDOWNzTmNzTWZjc1RDUlkyTUdJazNjU2VKOS9hVFBramhO?=
 =?utf-8?B?dkNXdkI0REdTMjVKU3luQU40Y0lwZENvb2QvMjhCMTB6ZnQ1UURRUmpDRzNZ?=
 =?utf-8?B?OFhTaG5oM1Rta1VucXlwYzZFa1JVRjhDUysrdUpZRWZzcHpGNm5jNmdZd0J4?=
 =?utf-8?B?YU11dnVzOXl4SG1DT0FpSHVOcUcwTnRvcStwRVIxUWtobnpxRW9UeTlyaFVP?=
 =?utf-8?B?N2RDdUZTdkZhZEZ5bEtZL2dkTVFTUkRXVU1OZElxNHR4QmJuYzNNdEFmNTVL?=
 =?utf-8?B?MWl1VjRjM1hpVnFUOWlZTFc4YTZ1eU14Sk5mbFgwVjNNNFU2SGkxWXNtMGxW?=
 =?utf-8?B?ZmMrU1phTXp2elkrYUpaT0NKTmg3OExlbXJiZnhqT3FPelZOUG1nLzhUQnYv?=
 =?utf-8?B?bkgvOUxiQ0hhZlJtNFVKcDliOVpVQS9xejBOSThkOXJnN2xaa2xOdS9ZS3p1?=
 =?utf-8?B?dW50d2pJRmNzWVBnZTVibk4xZ3FuaXBCQnJJV1hZSFJqSm1CVXFkYjdsdTNq?=
 =?utf-8?B?STk5WG12QVdxOW85M3N1cW5oeUduUm5QZkZYTUVKMk5UWkF4R0pNS0x2Z1F4?=
 =?utf-8?B?WE91OUlBU3B1S2FzbnRIY3NSNTVzVm1JNEs0TWEwWkRxb01DUkpxbUFreEpC?=
 =?utf-8?B?OXJDRWlmZ2ErUlFkTGJzV1E4K0VFR09jSHhZTjZrd3VmZXZCNWJPeXpFTmdZ?=
 =?utf-8?B?aVkrQUhhRGE0czZISWVZanNxU0FsTDlLUFBnc2JMRnlsWWJwUU9qS2JFODJj?=
 =?utf-8?B?a3NFZTBscWxvcjhsdzBCeC9WSlZ0VmR3YmdpcFlzTmpvaWdsaHRXSTAvWEJC?=
 =?utf-8?B?TVowUFJHcU9QNkFINnhOc3N3QTZIYTcrYXJBNThoWHhwQ2tnT09tTW5ibFFY?=
 =?utf-8?B?MENHTllFRnk1VXN5MzNaU0piZWFvc2lBMnhtaHkwQ2tuUDlGVmtyL2gxanVP?=
 =?utf-8?B?V3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e756e9fd-d117-4e61-4b03-08dc753b4625
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2024 00:01:02.2334 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XcHxSbYtMsaRf4b6gCw4yUeoWZSOFx/J20R+LdCRzWhLDfxbtmP4O5hnOJhPChRllVjbUJCO80RwG+4IfYT5lathVr4bhmhO6bhEfRWo6X4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8529
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

On 5/14/2024 14:05, Michal Wajdeczko wrote:
> On 14.05.2024 20:31, John Harrison wrote:
>> On 5/14/2024 09:01, Michal Wajdeczko wrote:
>>> On 09.05.2024 00:49, John.C.Harrison@Intel.com wrote:
>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>
>>>> There is a debug mechanism for dumping the GuC log as an ASCII hex
>>>> stream via dmesg. This is extremely useful for situations where it is
>>>> not possibe to query the log from debugfs (self tests, bugs that cause
>>>> the driver to fail to load, system hangs, etc.). However, dumping via
>>>> dmesg is not the most reliable. The dmesg buffer is limited in size,
>>>> can be rate limited and a simple hex stream is hard to parse by tools.
>>>>
>>>> So add extra information to the dump to make it more robust and
>>>> parsable. This includes adding start and end tags to delimit the dump,
>>>> using longer lines to reduce the per line overhead, adding a rolling
>>>> count to check for missing lines and interleaved concurrent dumps and
>>>> adding other important information such as the GuC version number and
>>>> timestamp offset.
>>>>
>>>> v2: Remove pm get/put as unnecessary (review feedback from Matthew B).
>>>> v3: Add firmware filename and 'wanted' version number.
>>>>
>>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/regs/xe_guc_regs.h |  1 +
>>>>    drivers/gpu/drm/xe/xe_guc_log.c       | 85 ++++++++++++++++++++++-----
>>>>    2 files changed, 71 insertions(+), 15 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>>>> b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>>>> index 11682e675e0f..45fb3707fabe 100644
>>>> --- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>>>> +++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>>>> @@ -82,6 +82,7 @@
>>>>    #define   HUC_LOADING_AGENT_GUC            REG_BIT(1)
>>>>    #define   GUC_WOPCM_OFFSET_VALID        REG_BIT(0)
>>>>    #define GUC_MAX_IDLE_COUNT            XE_REG(0xc3e4)
>>>> +#define GUC_PMTIMESTAMP                XE_REG(0xc3e8)
>>>>      #define GUC_SEND_INTERRUPT            XE_REG(0xc4c8)
>>>>    #define   GUC_SEND_TRIGGER            REG_BIT(0)
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c
>>>> b/drivers/gpu/drm/xe/xe_guc_log.c
>>>> index a37ee3419428..7e7e2fdc9a11 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc_log.c
>>>> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
>>>> @@ -7,11 +7,19 @@
>>>>      #include <drm/drm_managed.h>
>>>>    +#include "regs/xe_guc_regs.h"
>>>>    #include "xe_bo.h"
>>>>    #include "xe_gt.h"
>>>>    #include "xe_map.h"
>>>> +#include "xe_mmio.h"
>>>>    #include "xe_module.h"
>>>>    +static struct xe_guc *
>>>> +log_to_guc(struct xe_guc_log *log)
>>>> +{
>>>> +    return container_of(log, struct xe_guc, log);
>>>> +}
>>>> +
>>>>    static struct xe_gt *
>>>>    log_to_gt(struct xe_guc_log *log)
>>> as you have log_to_guc() then this log_to_gt() could be updated to:
>>>
>>>      return guc_to_gt(log_to_guc(log));
>> Is there any point? The existing version works fine so why replace a
>> single indirection with a double indirection?
> compiler can inline that, but from our POV we will have single place
> that must know exact placement of the .log member in our xe tree
>
>>
>>>>    {
>>>> @@ -49,32 +57,79 @@ static size_t guc_log_size(void)
>>>>            CAPTURE_BUFFER_SIZE;
>>>>    }
>>>>    +#define BYTES_PER_WORD        sizeof(u32)
>>>> +#define WORDS_PER_DUMP        8
>>>> +#define DUMPS_PER_LINE        4
>>>> +#define LINES_PER_READ        4
>>>> +#define WORDS_PER_READ        (WORDS_PER_DUMP * DUMPS_PER_LINE *
>>>> LINES_PER_READ)
>>>> +
>>> as you are heavily updating this function, maybe it's good time to add
>>> kernel-doc for it ?
>> Good idea. Will do.
>>
>>>>    void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p)
>>>>    {
>>>> +    static int g_count;
>>>> +    struct xe_gt *gt = log_to_gt(log);
>>>> +    struct xe_guc *guc = log_to_guc(log);
>>>> +    struct xe_uc_fw_version *ver_f =
>>>> &guc->fw.versions.found[XE_UC_FW_VER_RELEASE];
>>>> +    struct xe_uc_fw_version *ver_w = &guc->fw.versions.wanted;
>>>>        struct xe_device *xe = log_to_xe(log);
>>>>        size_t size;
>>>> -    int i, j;
>>>> +    char line_buff[DUMPS_PER_LINE * WORDS_PER_DUMP * 9 + 1];
>>>> +    int l_count = g_count++;
>>>> +    int line = 0;
>>>> +    int i, j, k;
>>>> +    u64 ktime;
>>>> +    u32 stamp;
>>>>          xe_assert(xe, log->bo);
>>>>          size = log->bo->size;
>>>>    -#define DW_PER_READ        128
>>>> -    xe_assert(xe, !(size % (DW_PER_READ * sizeof(u32))));
>>>> -    for (i = 0; i < size / sizeof(u32); i += DW_PER_READ) {
>>>> -        u32 read[DW_PER_READ];
>>>> -
>>>> -        xe_map_memcpy_from(xe, read, &log->bo->vmap, i * sizeof(u32),
>>>> -                   DW_PER_READ * sizeof(u32));
>>>> -#define DW_PER_PRINT        4
>>>> -        for (j = 0; j < DW_PER_READ / DW_PER_PRINT; ++j) {
>>>> -            u32 *print = read + j * DW_PER_PRINT;
>>>> -
>>>> -            drm_printf(p, "0x%08x 0x%08x 0x%08x 0x%08x\n",
>>>> -                   *(print + 0), *(print + 1),
>>>> -                   *(print + 2), *(print + 3));
>>>> +    drm_printf(p, "[Capture/%d.%d] Dumping GuC log for %ps...\n",
>>>> +           l_count, line++, __builtin_return_address(0));
>>> this function is also used in debugfs outputs and prefixing all lines
>>> with "[Capture/n.m]" is pointless there (and will also make collecting
>>> GuC log over debugfs even more inefficient)
>>>
>>> and as you likely don't want to have separate print functions (one for
>>> reliable dmesg, other for debugfs) then maybe consider use of cascaded
>>> drm_printer as proposed in [1] - it will also make your code tidier
>>>
>>> [1] https://patchwork.freedesktop.org/series/133613/
>> As already discussed, the intention was to keep this as simple as
>> possible and not over engineer a stop gap measure. Yes, the debugfs
>> version gets some extra overhead (but mitigated by using longer lines).
> but OTOH exposing useless data over debugfs could be perceived as signs
> of bad design and/or laziness, no?
Meaning just the 'Capture X/Y' prefix or all the meta data as well? The 
meta data is absolutely not  useless data.

For the Capture prefix, if you are so set on removing it then feel free 
to post a patch on top. Personally, I do not consider it useless. See below.

>> But size of the debugfs file is really not an issue, and it does provide
>> extra robustness.
> hmm, are you suggesting that reading over debugfs is not robust and
> requires extra protection? and it is xe driver specific issue?
Not debugfs itself, but copying files around afterwards. It might be 
extremely unlikely but it is not impossible. Many file formats have CRCs 
and such built in for that reason.

>
>> The prefix is also trivially easy to remove the prefix
>> if desired with "cut -d ' ' -f 2' < in > out".
> equally we can trivially avoid adding this prefix
Not that trivially.

>
>>>> +
>>>> +    drm_printf(p, "[Capture/%d.%d] GuC version %u.%u.%u (wanted
>>>> %u.%u.%u)\n",
>>>> +           l_count, line++,
>>>> +           ver_f->major, ver_f->minor, ver_f->patch,
>>>> +           ver_w->major, ver_w->minor, ver_w->patch);
>>> hmm, what's the relation between "wanted version" and actual "guc log
>>> buffer format" ? IMO it doesn't really matter what driver wanted to
>>> load, this supposed to be "GuC-log-print" so then only actually running
>>> version matters as it implies schema version needed for proper decoding.
>> It is not necessary but it is potentially useful information that can be
>> added pretty much for free, so why not?
> because this function (undocumented) is still named as xe_guc_log_print
> and is located in xe_guc_log.c which strongly suggests that it is about
> GuC log, not anything else from the GuC
>
> if you need combo print function, place it in guc.c and name properly
It is about the GuC log. It is for dumping everything and anything that 
is required to get a properly decoded and understood GuC log in a single 
file. When we get time to implement VFDs, all of this data would be 
added to the log structure itself as driver specified data blocks.

>
>>>> +    drm_printf(p, "[Capture/%d.%d] GuC firmware: %s\n", l_count,
>>>> line++, guc->fw.path);
>>> again, why do we want include firmware filename here? it's not relevant
>>> to the log buffer content/format (as we already have 'found version')
>> Actually, it is important. The filename gives the GuC platform. And that
>> is required to know what quirks need to be applied when decoding the
>> log. E.g. context switch logs on a TGL platform are truncated because
>> the hardware has fewer bits for the context id. The decoder needs to
>> know that to correctly track context switching.
> then you should explicitly capture the platform name, as firmware file
> name could be provided by the user as modparam xe.guc_firmware_path and
> named anything like foo.bin
If the that is happening then it is probably a custom build firmware 
file and requires a matching custom build of the schema in which case 
nothing will work unless the person doing the decode is passing custom 
options to the decoder anyway. And if an end user is arbitrarily 
renaming files for no valid reason, then they won't get their bug 
investigated. Besides, there is no driver side state that identifies the 
GuC platform. It is not necessarily the same as the actual hardware 
platform because multiple hardware platforms share the same GuC 
firmware. Indeed, there are also multiple GuC platform builds that can 
be run on a single hardware platform.

>
>>> maybe more interesting thing would be status of the GuC firmware?
>>> whether it is still running and writing logs or it is already dead
>> Not sure how you would get that information? Unless the GuC is actually
>> in reset for the duration of the dump, there is no way to know whether
>> it is alive, actively logging, idle, or what.
> we could start with capturing GUC_STATUS(0xc000)
>
> but we can also assume that captured log snapshot is always incomplete
> due to a living nature of the GuC firmware (so there is expected
> mismatch between what we can find in header vs actual last log entry)
Which is why the decoder script has support for detecting unexpected 
wrap points and re-wrapping the log before passing it to the actual 
decoder executable.

But you still have to do a single atomic-as-possible dump of the buffer 
into a single log file to get as close as possible to coherency. The 
more separate reads you split it into, the more likely you are to have 
inconsistencies.

John.

>
>>>> +
>>>> +    ktime = ktime_get_boottime_ns();
>>>> +    drm_printf(p, "[Capture/%d.%d] Kernel timestamp: 0x%08llX
>>>> [%llu]\n",
>>>> +           l_count, line++, ktime, ktime);
>>>> +
>>>> +    stamp = xe_mmio_read32(gt, GUC_PMTIMESTAMP);
>>>> +    drm_printf(p, "[Capture/%d.%d] GuC timestamp: 0x%08X [%u]\n",
>>>> +           l_count, line++, stamp, stamp);
>>>> +
>>>> +    drm_printf(p, "[Capture/%d.%d] CS timestamp frequency: %u Hz\n",
>>>> +           l_count, line++, gt->info.reference_clock);
>>>> +
>>>> +    xe_assert(xe, !(size % (WORDS_PER_READ * BYTES_PER_WORD)));
>>>> +    for (i = 0; i < size / BYTES_PER_WORD; i += WORDS_PER_READ) {
>>>> +        u32 read[WORDS_PER_READ];
>>>> +
>>>> +        xe_map_memcpy_from(xe, read, &log->bo->vmap, i *
>>>> BYTES_PER_WORD,
>>>> +                   WORDS_PER_READ * BYTES_PER_WORD);
>>>> +
>>>> +        for (j = 0; j < WORDS_PER_READ; ) {
>>>> +            u32 done = 0;
>>>> +
>>>> +            for (k = 0; k < DUMPS_PER_LINE; k++) {
>>>> +                line_buff[done++] = ' ';
>>>> +                done += hex_dump_to_buffer(read + j,
>>>> +                               sizeof(*read) * (WORDS_PER_READ - j),
>>>> +                               WORDS_PER_DUMP * BYTES_PER_WORD,
>>>> +                               BYTES_PER_WORD,
>>>> +                               line_buff + done,
>>>> +                               sizeof(line_buff) - done,
>>>> +                               false);
>>>> +                j += WORDS_PER_DUMP;
>>>> +            }
>>> as there could be many holes (zeros) in full GuC log, did you consider
>>> to skip such lines and update custom parser to understand that?
>> As per other response, in a real world live system, there won't be big
>> chunks of zeros. And if you are specifically debugging a start of day
>> issue then you can just use a smaller log size.
>>
>> Rather than attempting to implement some kind of simple RLE, a real and
>> significant benefit would be to re-use the compression mechanism we had
>> in i915. That is a lot more effort, though. So that could be done as a
>> follow up, but it is not worth holding up the current set of trivial
>> fixes for some long term goal.
>>
>>>> +
>>>> +            drm_printf(p, "[Capture/%d.%d]%s\n", l_count, line++,
>>>> line_buff);
>>>>            }
>>>>        }
>>>> +
>>>> +    drm_printf(p, "[Capture/%d.%d] Done.\n", l_count, line++);
>>>>    }
>>> per BKM shouldn't we #undef not used any more local macros ?
>> One could. It didn't seem necessary given that this is the end of the file.
>>
>> John.
>>
>>>>      int xe_guc_log_init(struct xe_guc_log *log)

