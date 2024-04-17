Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51DE4C4345F
	for <intel-xe@archiver.kernel.org>; Wed, 17 Apr 2024 20:35:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AAF610F848;
	Wed, 17 Apr 2024 20:35:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ORq6NwCx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0471710F848
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Apr 2024 20:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713386143; x=1744922143;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=dq5MKhqnQA7kSnxNrrx2pG65QMY0SpzMwQPYK/dzXi8=;
 b=ORq6NwCxdgNaJcr876YkeLLEACoyQ8v04C9u7OFu+pFAgNHfOqCiOXM0
 auQVWPfWUtJkrIid7vQC07uCQ7LTuT0Xqzbg+mjpf05uvJqe5Ll+1UePO
 ZxSAkdrfmblGJJQA/qLYBiU7J65kR9TwhmrxTG2cY+lP6QPfcHdJ8nQyI
 60C9Oa8GE7Mz8e+vW2IVgAK/Bs835tUOR+2zzsMLTHEvE7+A3BPdTPsin
 uUKEEIB/LYFaymSPVO9PdrGyHBpxkMSahlG3eVRtYmVRMYSwTV1Wzj1IK
 qPM87UW/iIQyCGIT8DfIiPhnQ9aBaEFivRKsS5JQvCCg+PqLCBE99Kcw5 w==;
X-CSE-ConnectionGUID: 9oLdqdh4RPmB6fxCdhunGQ==
X-CSE-MsgGUID: dOhwK7nJSzGoAoPVRXxNsw==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="12683871"
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; d="scan'208";a="12683871"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 13:35:43 -0700
X-CSE-ConnectionGUID: Zbrt9rj5RL6m4YAMn9nuSQ==
X-CSE-MsgGUID: HpxUDXQIThmdoNJit+XLqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; d="scan'208";a="27545167"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Apr 2024 13:35:42 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Apr 2024 13:35:41 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 17 Apr 2024 13:35:41 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 17 Apr 2024 13:35:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hUXWF9ePD90GVvKGftXQ4syDe5I8UYUaiZ1i1fgPU5y9pziOAIgxug2VPIfXdxgRGD+pEsL5uYz7aYLPNOzY7k1eNzR9j80P9+VaH6R6ZMPXax+kc1GPwF0PuYw/JJSn5G3UTluEoPdQ6RbFXG8LJk94QYupOU/4TJZP00aMcdHHaN8F21lGp+f94gok5Bk47cdlPspFGzR5Fv0AFwPYFp/kdqdIBA8sx4/ST7utX2TjjMHD7tnZVkPmlLvJ/cVfX82cGzKAM+YLcRU6jo1RdgeSuIZzd8PYp3xQhtSakSnJg4EdQPQE7jpZjVhZafNex3pPPZwptyqO5zif6KUoLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hjfaO+9zJ5vzcTfx6U95qHxs24zdWRtiRSrYqcU2ERA=;
 b=e4CweaNkha/+mY6YR+KCSmz3uJnaT6e1n6lsXvdhPpcHxH7mJ2fL+lKECiCzZdlaADuZC4WKNcq58UQVSDo8N+lSpsiO2snIfHnbgmMeuBr4HAmk2GsO99LedwTPcdOcrxSBmElu+T5P+BVz56bC6HEWeHkAShAGVoVC/Nf84JQAassvzgoY8bqNECkLWw4mZTwusbPcCX26VemTxl70Q1GbvhPVnZ8wj2xM2uOLVoyZroLaH7MI07TZqNkZF2F4tFzXyNe1cZBRbVTrxcgkLty+poRtIqjiq+DbQ+moYs+rkkqHrF9WhTdxr40y360m4dn1JYHQSEo1CRXn6XZYqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by PH7PR11MB6932.namprd11.prod.outlook.com (2603:10b6:510:207::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7430.46; Wed, 17 Apr
 2024 20:35:35 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::cc14:a507:b02c:b551]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::cc14:a507:b02c:b551%7]) with mapi id 15.20.7472.025; Wed, 17 Apr 2024
 20:35:35 +0000
Date: Wed, 17 Apr 2024 13:35:29 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Tvrtko Ursulin <tursulin@ursulin.net>, <intel-xe@lists.freedesktop.org>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 0/7] drm/xe: Per client usage
Message-ID: <ZiAyUcuQtQ25xnWw@orsosgc001>
References: <20240416030454.3739862-1-lucas.demarchi@intel.com>
 <f2c46934-e137-419d-ba34-cff864a988ce@ursulin.net>
 <zj3ccdsxwfv7yms67c2fycjfhevdzp3qy7yz6u6ffmv4aymo6n@5lu4otfylkbt>
 <foccqtfvgz65tg6yoar5tsqjo4bndmftgwlsm3vujjjdin2wts@7cc3m4fcapyb>
 <6490842a-65b3-4b84-9a8a-ebc9f7b9ac07@ursulin.net>
 <thplv5pk26br3tou6if2otdoq6owb5lmdhfzi3wcboni4vyeos@sqiu7zpgmgrf>
 <8e2af1d5-5d22-47d5-8cee-f8bd1e54c0ed@ursulin.net>
 <fzl42hvf67tb7373gcpovcjjcufs3ba6jajmpt676uymsat4qs@qolxcmhfh6mz>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fzl42hvf67tb7373gcpovcjjcufs3ba6jajmpt676uymsat4qs@qolxcmhfh6mz>
X-ClientProxiedBy: BY5PR20CA0020.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::33) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|PH7PR11MB6932:EE_
X-MS-Office365-Filtering-Correlation-Id: 9567a25f-929c-4075-d50b-08dc5f1def47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xkuRHKqLD0eHY8Rxxjwj+y9XprQXzPdW/sPH2TF4s/sE1J8ubzJN9ho4JCWw/EBvs5GyvNcz0/kmqgzYKrD6C/KRRegDB4axG1vC7rVeXfvDP0OQJdGO5XqT9+c2BxYW5yumMaXB2yylRNZNlDFiT/I+4V359znigoxnu9MRbhe+eLIhl10OEdVsiyGehQY7BV7798UMb0FcY0TZyLGPk8aH8Ppou0AoNCrMyuYbGqTxh/MJIpYs2rZdRGOSKy8V/3Das0R/UPFRWuGCJo4ipAUwewrdKd9lCoGapxwn38NZy9/MeBoOF9FhI1T7xrfYG99khTlhishGxGwDoKXOlq1uePNjc24WL2P7dKyV/dP/PAQ5RcyoH8GHQU9OR4BwGo3WnbYSHGYIQKgCgPjDBlieKhYl5LlxJzIbxxPkVlkZoUGf0yYKaHK/H8zehl4atnPQxXnDipOFrra/UFhGRkQWThq6EEbe3C3w3j1ROo6q2AoFVptTVJIKf4/UfJft60Fl4LDJZGbhufc5xjf5BdkAwhdj6SwXLnyImbK9JmlB9+qA0iWm/Lp7nBMzSpHwQJiXjVt1rrr2c9TvPDRQUIl7WISwTkZT4d8Gt2Ku/3xILipswP+sMalGGBZ09Lhg1oGQyCb9f82kTzLhuQsSNbw0VmGDrTUVKfF6LLSka/A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L3JGZ01MU2JGUE1yUk8rVHhkMSsydi9lb0wvcFZoUmpMZndTNXFxaGZxd2hw?=
 =?utf-8?B?cmMyek44T3NERThjZXdUY3k0QU9CaHJhWEVDUmh1THAvcG1Ca3JEQjNZbmxz?=
 =?utf-8?B?TS9ubWFCdEw2MEdnZ3gwUVp2RlI2cldNaWZ4UHFWNWlrcUFkZkNNRjJIbHVo?=
 =?utf-8?B?cDFoYkE5R2VJdkRSNUtTbyt2L2Iwdkp0ejZ3UWJUbURGa2R4RDU1bTQvY1VV?=
 =?utf-8?B?T1JDZUdiVmhaN0VHYXBuZHZ4ODVDN2JxTm85TXdqSWVoSUpqR0hQOUdvdTJN?=
 =?utf-8?B?L3RlS1YzdGZLUVB5YjYzdTd1UTF1RzlrWXBrZk40R1Z1YWNjM28rdVI0cWhj?=
 =?utf-8?B?a0FvOHhHTW9TbFl2RGNFRzFBdjRRM2lDV0VsQ1NCdnZISDNPTU5zK3NEWHky?=
 =?utf-8?B?WHpXYWd4aDhBYW9yM0Z4dlJaK1VvTC9kbDhveFJFcXpYeWR1V1dJKzBTWkYz?=
 =?utf-8?B?c1FxWWFzQ0dWMDAwRU9ERXZDQ1kzNHlvTDVuaEg5alVMY1hoMEVUWitsdVpP?=
 =?utf-8?B?bTVsTTBMdVpleEV5ZnhHQUhMZE9UNmluZzFPV0lPR2lsUXB2ZmhYYlJrVjRV?=
 =?utf-8?B?anUrVDNBV3pmQkZiRlR6WTViSXNDSCtnQXhzdEtYNFo3RUh4QnMrU1RSbU5M?=
 =?utf-8?B?SXhqemllY053NmE0d3ZmZ0cyaXVtMFEyQ3BIZ2QvSXlrZXpxOWlXVVRHSmxE?=
 =?utf-8?B?RmFhZ2E3YjBZVE1lWEJqL05yTnJSMEltU2xpaTdvSi9yYlZHK3ZHZVp5Vmdm?=
 =?utf-8?B?c0xETVdRZ2tGdG95RTdrUVQvZGlYQk9zTnY0MFR6bFpsUnBGbkxXRGIwMGdX?=
 =?utf-8?B?WW1rUlhuNmlFSGJYSG1FbHh4ckVKNTdFWUJZZHkzNysybjAzc3dlQ1dLa2JN?=
 =?utf-8?B?a0QvaVZzeWI1TzJsalgydUQxbVlBV1RWOTdwOFRHcE00RGUydlBIQ2cvL1dB?=
 =?utf-8?B?Q2JzZjR2R2pMM0FodkgyVkhKQXhqbjI2UHJzZlFycEdORkFGSHFnM1Q4VWN3?=
 =?utf-8?B?amh3UVArTHI4TDhIK3FRWWJOOE80NTZzSUVZMlVwR1o4Rk9TeEdlSTNiQlFO?=
 =?utf-8?B?eVNTUmw3QnRkQ3NrMnZoSkxpdHlKVWQ1VXFoVm1oRm9UMElCOVBKL0ZWUVVa?=
 =?utf-8?B?dkZ2R3BJWU5aM0UyN2wxY0NjVWJVdU91cTBNczJ6SGF4QlFrbUFUdjJOZzlH?=
 =?utf-8?B?V3g4UkFxQjNJdnlDaTZGY3NqUm5FK0dFN3NEL3JDWTFKWHhGVk9VcTNWaHUw?=
 =?utf-8?B?VlIySytYa0hzNUluUUtZY0s0TG0zNXpUUGR1QjRtMVpydGwyTWx2VHdjNE1v?=
 =?utf-8?B?SVF2U3lCTm1sQXRCSUNZMThERmU2M1crQUtRUFdTdUZtVDhGTm1YcmppeFBj?=
 =?utf-8?B?bUJPbm1iZEpNdjVuZnNOOXhNVGpjOTJPek1zNWJ6OVlWem40UzBRbTM3ZGly?=
 =?utf-8?B?NXIyUkRIZkZCNnI1TEUva25mZEYyMmh1Yy9vb25yQ1JEaWhwWTMwWjNncUdT?=
 =?utf-8?B?K0hNNmQ2N2ZSWThyRmllRURzZTZvaVZtRW55dmFJK2ZRTUF3UDJiYlUyNy9S?=
 =?utf-8?B?RlVEWGNLRWYzZ0NieEFlM05TdHI1amhtdWRWUzRGZXZDY2Q5LzM1Z0tHYVBT?=
 =?utf-8?B?N1M3NUJXZkJSaXBvaTQ3QzJ5N3lnaTlVQ2tnVkkxOUJxSmF5ZDhJMXVkVGhs?=
 =?utf-8?B?Wjl6UHVsc3JKWDdkZk53MDRqeHdxekNzMSsrbTh0TGxPbnlFczBoR0dyRWtF?=
 =?utf-8?B?azl0WW5GZlFrMWc5amJRMEpYSmw1UW9sWEF0ZHpUZDVvT3lFd3k2VElyNzV2?=
 =?utf-8?B?NGRic3ZJam5QMklnS3VWcDJvTi90WXlaVUwxU3hQcVEzcnZSbmZvOGJrak03?=
 =?utf-8?B?K1k2akJjdnNrU2xpTjNEZGtKOEdJZ1JrbGw2RmN3cVBleG5sUlFXeVIyUWJV?=
 =?utf-8?B?OEd5UmhzQU04anFWSG50VkY4YThkZ080THUzZ0ZKaE44bFlkY1BLYXhUQmRH?=
 =?utf-8?B?ZlVUbmxnNEFSMXY4OTR6VnNTQkp0WDNkZC9kbWtaaGpIZGpOMVRITXFDUnVJ?=
 =?utf-8?B?OU1Ra09XZmhCN1BydTQ2dGJkL2FvRmU1WXlCdGZNaDQxT1pjU1U4bE9UN2di?=
 =?utf-8?B?K0pxT1BGMkkveFhtMThGV0l2NmVZVFhrOTFhRTFBa05TV0xjQXNaYlM1VmhN?=
 =?utf-8?Q?EJVhNdxA2tJ1y+35klIG2vA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9567a25f-929c-4075-d50b-08dc5f1def47
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2024 20:35:35.4449 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IsjSNk4XtzaL2pLznaQ4A1ZqR5wI33rfY7K+MShhCgv23ka2Py16rqqn0FBYIH8Y7PVao1EnIe1UKw3ruplKuh0hvyzaGpQT8/LgF3YVBd8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6932
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

On Wed, Apr 17, 2024 at 02:05:40PM -0500, Lucas De Marchi wrote:
>On Wed, Apr 17, 2024 at 09:51:42AM GMT, Tvrtko Ursulin wrote:
>>
>>On 16/04/2024 19:29, Lucas De Marchi wrote:
>>>On Tue, Apr 16, 2024 at 03:22:21PM +0100, Tvrtko Ursulin wrote:
>>>>
>>>>On 16/04/2024 14:51, Lucas De Marchi wrote:
>>>>>Forgot to Cc Michal, doing now.
>>>>>
>>>>>Lucas De Marchi
>>>>>
>>>>>On Tue, Apr 16, 2024 at 08:30:33AM -0500, Lucas De Marchi wrote:
>>>>>>On Tue, Apr 16, 2024 at 09:37:44AM +0100, Tvrtko Ursulin wrote:
>>>>>>>
>>>>>>>On 16/04/2024 04:04, Lucas De Marchi wrote:
>>>>>>>>Add per-client usage statistics to xe. This ports xe to 
>>>>>>>>use the common
>>>>>>>>method in drm to export the usage to userspace per client (where 1
>>>>>>>>client == 1 drm fd open).
>>>>>>>>
>>>>>>>>However insted of using the current format, this creates 
>>>>>>>>a new one with
>>>>>>>>the unit "ticks". The intention here is not to mix the 
>>>>>>>>GPU clock domain
>>>>>>>>with the CPU clock. It allows to cover a few more use cases without
>>>>>>>>extra complications.
>>>>>>>>
>>>>>>>>Last patch was a quick implemenation of a gputop-like tool in python.
>>>>>>>>I ended doing it to cross check the gputop implementation. I's not
>>>>>>>>really meant to be applied here.
>>>>>>>>
>>>>>>>>I tested this on DG2 and TGL with kmscube (console-only) and vkcube
>>>>>>>>(in a gnome session), but it would be good to soak this under more
>>>>>>>>tests. The biggest goal for this patch series right now is to get
>>>>>>>>consensus on the new UAPI.
>>>>>>>>
>>>>>>>>TODO: Add documentation on top with the new interface.
>>>>>>>
>>>>>>>Yeah a drm-usage-stats.rst patch would be nice to have in 
>>>>>>>the RFC so one does not have to look into the driver 
>>>>>>>implementation to discuss the proposed uapi.
>>>>>>>
>>>>>>>Nevertheless I understand the proposal is to add this:
>>>>>>>
>>>>>>>drm-engine-<class>: <GPU_TIMESTAMP> <RUNTIME> ticks
>>>>>>
>>>>>>yes, the gputop patch was more explicit about this. Should had added in
>>>>>>the kernel patch series too.
>>>>>>
>>>>>>>
>>>>>>>That's two values per key. I guess "one key value pair for 
>>>>>>>per one line of text" does not get strictly broken and 
>>>>>>>that you propose a heuristics in parsing to detect that 
>>>>>>>the <RUNTIME> cannot be mis-interpreted as the unit?
>>>>>>
>>>>>>the current format is
>>>>>>
>>>>>>    drm-engine-<class>: <RUNTIME> ns
>>>>>>
>>>>>>the "ns" in the end should be parsed by userspace to know
>>>>>>what it is about.
>>>>
>>>>Right.
>>>>
>>>>>>
>>>>>>>
>>>>>>>Not sure it is a good idea though. If you instead added a 
>>>>>>>new key for the gpu time what would be the downside in 
>>>>>>>your view? Like:
>>>>>>>
>>>>>>>drm-engine-<class>: <uint> ticks
>>>>>>>drm-ticks-<class>: <uint>
>>>>>>>
>>>>>>>Or maybe even obsfuscate/generalise as:
>>>>>>>
>>>>>>>drm-engine-<class>: <uint> gpu-time
>>>>>>>drm-gpu-time-<class>: <uint>
>>>>>>
>>>>>>I think both work, but I fail to see the advantage. This alternative is
>>>>>>slightly heavier on the parsing side since you have to correlate the
>>>>>>values from 2 keys, possibly dealing with them appearing in different
>>>>>>order. The only possible breakage remains with this alternative: if
>>>>>>userspace didn't parse the unit before. I checked nvtop and htop and
>>>>>>they were doing the right thing. I sent a fix to igt a few weeks back
>>>>>>for it to consider the unit:
>>>>>>https://lore.kernel.org/igt-dev/20240405060056.59379-8-lucas.demarchi@intel.com/
>>>>
>>>>Advantages are that "drm-engine-something: 1234 5678 ticks" 
>>>>isn't self-explanatory (intuitively humanly readable) and that 
>>>>it doesn't
>>>
>>>maybe I have a different expectation from procfs. When I do e.g.
>>>
>>># cat /proc/self/stat
>>>3861283 (cat) R 3861233 3861283 3861231 34816 3861283 4194304 90 0 
>>>0 0 0 0 0 0 20 0 1 0 1321348797 8560640 384 18446744073709551615 
>>>93979016876032 93979016892449 140720658378704 0 0 0 0 0 0 0 0 0 17 
>>>51 0 0 0 0 0 93979016907440 93979016908904 93979037196288 
>>>140720658380605 140720658380625 140720658380625 140720658382827 0
>>>
>>>it doesn't seem to me "intuitively humanly readable" was the first
>>>concern for people adding files in procfs :)... I'd rather think "machine
>>>readable" was more important.
>>
>>I think you are pushing the argument a bit now :) since IMO we 
>>should evaluate drm-usage-stats.rst proposal more in the context of 
>>drm-usage-stats and other fdinfo files, rather than the whole of 
>>procfs. In other words if there isn't a strong reason to regress 
>>this particular file lets not do it.
>
>:) I like pushing arguments if it helps revisit decisions (human vs
>machine readable for things in procfs). I'm not
>trying to push the 2 counter approaches though. I think other reasons
>like discussed below are enough to consider the other keys.
>
>TBH I was reluctant at first to add a separate uapi rather than re-using
>drm-engine- without realizing there was already a second one (not
>implemented in gputop).
>
>So AFAICS i915 and amdgpu use drm-engine-. msm and panfrost use
>drm-cycles + drm-maxfreq.  And none of them seem suitable to xe.
>
>>
>>>>diverge from the one value per key plus unit format. Latter we 
>>>>would then document clearly.
>>>>
>>>>Different keys potentially appearing in different order does not 
>>>>matter since userspace already has to handle that.
>>>>
>>>>>>>Potentially could also add a key saying how much wall time 
>>>>>>>is one unit of GPU time.
>>>>>>
>>>>>>I wouldn't add it really as it may not make sense depending on the
>>>>>>vendor and or usage. Examples: the gpu time may be different for
>>>>>>different engines depending on where they are located (tile/gt). The
>>>>>>correlation with CPU time is different when running in VF mode, and may
>>>>>>change in runtime depending on the number of VFs. +Michal.
>>>>
>>>>Yes, that's why I said "potentially", which was supposed to mean 
>>>>if and where it makes sense and perhaps adds value.
>>>>
>>>>>>Also, if the userspace side really wants to know (why would it?)
>>>>>>it could be just calculate from 2 samples (possibly repeated a few
>>>>>>times as it updates the output).
>>>>>>
>>>>>>>
>>>>>>>Or.. would even the existing drm-cycles, plus abuse of 
>>>>>>>drm-maxfreq, work? Ticks == cycles, maxfreq == ticks per 
>>>>>>>wall second.
>>>>>>
>>>>>>I think it'd be up to gpu vendor what clock backs this time. For the
>>>>>>current Intel cards, it's the refclock and it doesn't vary the
>>>>>>frequency.
>>>>
>>>>Right, but that doesn't matter. What I was saying is that if you 
>>>>exposed ticks in drm-cycles and tick frequency in drm-maxfreq it 
>>>>would even work, no? (Assuming support for those two was 
>>>>actually in igt_drm_fdinfo/clients/gputop and could be used as 
>>>>fallback to time based stats.)
>>>
>>>oh... I was looking at the output for i915 and missed that we had
>>>drm-cycles as currently i915 doesn't use it. It seems to be a similar
>>>thing. I agree the drm-maxfreq- is unfortunate and that we don't
>>>actually have support for that in gputop.
>>>
>>>So, instead of the 2 numbers + different unit, I can adapt this to
>>>rather use drm-cycles. However for maxfreq, it doesn't seem to be
>>>what we need since it doesn't scale for VF. It brings back the cpu clock
>>>domain this series is trying to avoid. The difference is that using
>>>drm-cycles- and drm-maxfreq- you are expecting the userspace to do
>>>(let me know if I interpreted the docs wrong):
>>>
>>>    s1 = sample()
>>>    sleep(period)
>>>    s2 = sample()
>>>    engine_utilization = ((s2.drm_cycles * s2.drm_max_freq) - 
>>>(s1.drm_cycles * s1.drm_max_freq)) / period
>>>
>>>... considering the drm_max_freq may change from one call to the other.
>>>if we simplify it and assume it doesn't change:
>>>
>>>    engine_utilization = ((s2.drm_cycles - s1.drm_cycles) * 
>>>drm_max_freq) / period
>>>
>>>we'd need different drm_max_freq reported on VF driver that would need
>>>to know the number of VFs enabled to scaled it correctly. Maybe this is
>>>abusing the "drm-maxfreq" a little bit?
>>
>>Yes it would be bad if the observed VF GPU clock will be variable 
>>since maxfreq is supposed to be static.
>>
>>So on VFs would reported GPU clock moves by the VF "used" quanta?
>
>s/used/available/. That's my understanding, yes. Each VF has a quanta
>and the gpu clock moves according to that quanta.  Note that as I said,
>this is not the case right now (we are just reading RING_TIMESTAMP), but
>the intention is to have the UAPI side ready so it's already prepared
>for that.
>
>>Where "used" is defined as time given by the GuC, not necessarily 
>>used
>
>s/used/available/ as above
>
>>GPU time. For instance 16ms quanta, VF GPU clock would move by 16ms 
>>if the GuC decides not to switch out the idle VF? Or it could move 
>>by less than 16ms if it switched it out earlier.
>
>no, afaiu it's 16ms, not less. But the quanta depends on the number of
>VFs enabled, which may change in runtime.
>
>I'm not 100% certain and people in Cc may correct me.
>
>>
>>>What if we had
>>>
>>>drm-cycles-<keystr>: <uint>
>>>drm-total-cycles-<keystr>: <uint>
>>>
>>>Then the utilization can be done:
>>>
>>>    s1 = sample()
>>>    sleep(period)
>>>    s2 = sample()
>>>    engine_utilization = (s2.cycles - s1.cycles) / \
>>>                 (s2.total_cycles - s1.total_cycles + 1);
>>>
>>>Capacity still to be added above, but we'd need to clarify if
>>>drm-total-cycles-<keystr> already accounts for it.
>>>
>>>Here instead of the conversion to cpu clock, I'm expecting to read
>>>"total_cycles" from HW and that being different (slower) for VF.
>>>AFAICS this is not the case with this current polling implementation
>>>since we are simply reading the RING_TIMESTAMP, but there are planned
>>>changes to get it from GuC. Umesh/Michal Cc'ed may know better.
>>
>>I think this works and is clean.
>>
>>Although I have some doubts about the usefulness on VFs, if the 
>>clock movements are at the mercy of the GuC scheduler. Like what 
>>does 100% mean for a VF? Maybe it was full quanta, or maybe it was 
>>half a quanta if GuC decided to switch it out early, either due 
>>going idle or due some other scheduling decision.
>
>in the scenario you described above the quanta could change according to
>the scheduler and 100% wouldn't mean much. That's not my understanding.
>100% always mean the VF used all the allocated time. I see this line
>potentially getting blurred a little bit if the scheduler tries to
>maximize the HW usage and distribute quanta unevenly, but I think the
>interface already contemplates that.
>
>Another case is the VF not being able to reach 100% because the PF is
>submitting high prio work. But I still think the current interface is
>sufficient and it's the implementation by GuC/HW that could be improved
>(e.g. adapting the gpu time reported).
>
>Michal / Umesh, please chime in if that is not accurate.
>

Irrespective of how much quanta a VF used, all calculations will be 
based on the quanta that it was allocated. That way the VF would know 
that it could have better utilized the allotted time if busyness is less 
than 100. This does result in more than 100% usage for a VF that was 
resource hungry and scheduling policies allowed it to run more than the 
allotted quanta, but this is a known limitation of the solution provided 
by GuC. When looking at the overall system (say from a PF), the usage 
should still add up to 100%.

>
>Thinking out loud: IFF the execution quanta is available for VF to query

For the VF, GuC intends to provide a factor that can be used to scale 
the wall time and deduce the VF quanta. This scaled value is used as the 
second counter in a VF.

>and we are ok with just scaling drm-maxfreq, then maybe we could even
>just use the current interface instead of adding a third one. Although
>it could be confusing to have a that freq changing.

Assuming you are talking about using the drm-cycles and drm-max-freq.  
One of the concerns when supporting VFs was that we cannot actually 
export busyness in absolute time units to the user because the GPU is 
shared across VFs. If we scale the busyness such that it is stretched 
across CPU time, then it helps get the right busyness % relative to CPU 
time, but the value of busyness in time units itself is false. This was 
the primary reason to use 2 "unitless" counters.

fwiu, I think by using the drm-maxfreq, you are going to bring the same 
concept back in the discussion - exporting busyness in time units. Not 
sure if that's a good idea. Let me know if I got that wrong.

Regards,
Umesh

>
>Lucas De Marchi
