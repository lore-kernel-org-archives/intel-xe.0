Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5550DD15DB6
	for <intel-xe@archiver.kernel.org>; Wed,  3 Dec 2025 22:54:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1755F10E19E;
	Wed,  3 Dec 2025 22:54:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dgqi+w1n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BFF910E19E
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Dec 2025 22:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764802488; x=1796338488;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=BbztF/plewfsu5T1VdzvXSi3ieIQ0sm5PhQLNTKdj4s=;
 b=Dgqi+w1njUnNMkFwsTEjiesHqzCgnH41fQtiGUn32T2iCJRgeCjhQODi
 4TysHZGctwuYREh2sV2jxvcaMuWvvlHnPJQXBeXd/9sg7IGStoQ6j4HMT
 klCfko5ZBrWFNvzrFugnGiKJnQkeQsH2nztqqQXRyVGONqebpF1nB/7DV
 tMJmL8T2jk17s+OwxF54z1cBpA9rA78a0O3oFnXKp/5D1/E+Zezxx/qKs
 bsQqXHMI8OyxGUgfI9LLmvyuGtLdm1ocSkp7C02udTNYL7j/bZmBS/6OQ
 avlhoJQEojhZUOYZVUMNgeGN8x67KHKB9Qq7ba2Q2TVVkKUbV0FwnriGE g==;
X-CSE-ConnectionGUID: XneEto2kR6OW1YWV5NViug==
X-CSE-MsgGUID: 0ZLO2DFXQEK/UgbriF/7ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="70663590"
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; d="scan'208";a="70663590"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 14:54:48 -0800
X-CSE-ConnectionGUID: j/tv6zbLQDGQHqAgbYgy2g==
X-CSE-MsgGUID: TsHS0H08TKiutul5It1LxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; d="scan'208";a="194101698"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 14:54:47 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 14:54:47 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 3 Dec 2025 14:54:47 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.42) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 14:54:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Erjzc2fE5rBsg205AmXj3q5d/oS4M1/qDiUQaQ4BTcPGtG+Q7qBExEeKD4uQ3sNztEBvfBuv7M0SMsCS6meW1kW5Jpb7L2SsE49EdtHz7zBVlVKALPriM97O6J3aoGlXEAj92wvhN+TmqXLo224WIMdJVetNWcVvorypKsH9D5r5eP1cwqk0CaiOChYAXq5giuAEuSqG3OQ0PyeUXvk3aWJJg1e5de3xFkEWOXp00lBW3sCOnv9dcxvgCBgFyjSoOzKdR1rsBPvOxBoi+Tjwc8kgs5GsEpDOeQc2JougXdMo0ziPSO3DZILy/kAM4Vi/K9RMzaRDw84rFbiSvKO6qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eVa/eU5mqhov48LJWTumxww1g2rI0C+pw9Cu0VfLrBo=;
 b=rFHdR8DTHrak9aKEG87+nv/13CQEXl68L0bRKz5lV/KaO8EPGf2N37CciCpVf7nc2bX3eb9NlRE06E+TgBAAgS7Ijff1MIN9yHdDx0bjTsHsVKORf4yevIxHpR6bv6fI2J8+HoadAS6zEvmfX8IVrOzDf9x3ctvlcdwsjDROF2bsejluCgbQjFbRS18R5a0vEDXYTEo82bYYOrdOYG+QZueBe3r5cYSgv6rqitBsPxpjGwVCe2SDj5IGlasLEgprE8WrWEdd2jcqYVvMbYbBhuW3n6bQ1OFR+y56oPXhnVmIIi6/5fVv/+02RJQVtgQ1MsTOlcjseFWRfjro2L/VUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM4PR11MB7351.namprd11.prod.outlook.com (2603:10b6:8:104::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 22:54:42 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 22:54:42 +0000
Date: Wed, 3 Dec 2025 14:54:40 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Harish Chegondi <harish.chegondi@intel.com>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1?=
 =?utf-8?Q?re_for_series_starting_with_=5B1=2F1=5D_drm=2Fxe=2Fxe3?=
 =?utf-8?Q?=3A?= Remove graphics IP 30.01 from Wa_18041344222 IP list
Message-ID: <20251203225440.GO4065316@mdroper-desk1.amr.corp.intel.com>
References: <280ab3e8dce8d7a40540ae634a5432694ac17ab0.1763762330.git.harish.chegondi@intel.com>
 <176400864371.21320.1999694142570900132@a3b018990fe9>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <176400864371.21320.1999694142570900132@a3b018990fe9>
X-ClientProxiedBy: BYAPR06CA0015.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::28) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM4PR11MB7351:EE_
X-MS-Office365-Filtering-Correlation-Id: b24e72a0-2d6d-4cb1-b292-08de32bef274
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|366016|376014|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Dc9Z/y/rb8MIzjWu+S6iBcAQWLvYp9HKaII1jNQCtDxyIVhYtDQBhN23QFCl?=
 =?us-ascii?Q?zD/KInkceeI8tMWQBJ70JSTsIeTdH4nx87Ok1hMxxkxMs8eKUDYy+HwO4M1s?=
 =?us-ascii?Q?1x3P917+xjQClnoOUdUxLL+d0WtkgU8No1zDI4uk8Pc5kRiSGl2afdDCGQ8e?=
 =?us-ascii?Q?+rdGfHBgC5TNl/6pDSFnArJVPjgkgwO5PM4y4soIvnv+ocjbsrXbetLU2C0f?=
 =?us-ascii?Q?MYLz4Lo3DeUFqVXD4UOjjO77b/WzDI6n2PDZ2N6B6Aaq2ZNVehqWvD3aDvXF?=
 =?us-ascii?Q?2E0i335vwLiRJpZM91+SyCWtckPOniWI9tpsgk1q1mOJegn47qRR48jNyfwT?=
 =?us-ascii?Q?mqFwN4LWymuCT4CtzsnijZUB7Tv7pfn2jyrWyoKZMNW7zClP5VMPCnlPI+B9?=
 =?us-ascii?Q?STw3GNJAgqTm5kAGhJVUBut8F7+0ikwBC/JEs0e/1a4XELNKUYHTc7VSD2Jm?=
 =?us-ascii?Q?5tXB1ZqMDdlCOmSTIOVBpRx7lMqVo6YGwyjW6AJ4dZnHDO28892xofGh7/5S?=
 =?us-ascii?Q?PNVEvw4fZt0LO464QLXYg4un2XpQscsEfZuiecLa2K8/FeiQ5yxDOhZOu3xf?=
 =?us-ascii?Q?QXwzl0tpMSyoZl/XqTRGJHSQUcn5gOtS1WQksZUIAL70mSvbRTfBAxCoqJxw?=
 =?us-ascii?Q?SxGZgG9lto3gksOttdSzF5lFzIz3HKQCIp2vIixOsy1u9qkFeQiVYPw+UN7N?=
 =?us-ascii?Q?dYg67ABhU7yssSlalhy58Bj9yZIt8JT7eTqHRdFhcf0sP0sJROol42ZK2iWb?=
 =?us-ascii?Q?ppf/fi0XBRuFHxrD+uTX3s1NME0C/LBBMMuHsKKPMXrrMMWUxgWEN2Yxd9oe?=
 =?us-ascii?Q?NgfpYrHy5xoyqBe98jHoOBQ9aiEIzrPJPyQ154FI7DZ4hLmusMbsDUs6tKE2?=
 =?us-ascii?Q?oYo7US5R8zG0SOcfXOFB3DUci292Nao67OKkMytnx8Xhu2bnWLwTpk9oT7bH?=
 =?us-ascii?Q?hgb2Z+aCMXMcR9e1U/9/f105oN1vjAneA6YFnF0DnYplaa+UdXAADzAhYvsI?=
 =?us-ascii?Q?F0COwLxIyqvxj9A/ZOD6sUnm/o8wxoBO/OkuYOhoWeYMSVUBNbfTgbNVnFuK?=
 =?us-ascii?Q?7CF8m3+vZWOm6AKttjM2i5RXRDCnBf92LI5YhvcQNS1trZEMuh138vbd5vqJ?=
 =?us-ascii?Q?kEPSi5ky6Kak/AaSMobmY59RL6uKwcZ/PAKetuTSg8/cLQVSiLkVcGqYt7wv?=
 =?us-ascii?Q?gOCaB+Xg1SoQLFbvSAYlzEyn3YkP6rJL6wz1XjvpSHydnke6d0nWxPiE/fYE?=
 =?us-ascii?Q?2M+h1Wu3oHMXfXarckF4aFlzzGSTJvGqPdDkS2OxNU0/WKxPmX3gyrRNV4OI?=
 =?us-ascii?Q?b25uidtyFt1Sm+8szlOPc5cV6I1X0MYgWhEIBCb+J3mxKIIJMxZ7vk7OGYH+?=
 =?us-ascii?Q?E4dW8KvR9+WrWHhJfQbqwzFUPvCJBKUGdPeLlVAV89bWB60Z1w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xlU43k36FTMMWsdaXdGBHseLkkVdL0uJTKmW96/3rPH/tf+bLInwQobB7qs+?=
 =?us-ascii?Q?TU40AkuyWuEM797zxXVv7vGYH8xbt8CWrTXTJX4nY7nGcVujJZ9d07Chtqq0?=
 =?us-ascii?Q?VoYqMwY1bnT9tsggjBvB02cH12Bezbyztdh76QTVsAkOy6g5+BgT+sRltYre?=
 =?us-ascii?Q?Bjwk35ULNINtQ5FKYVzBIe9Y0pNvYY2rKeXMCpM/RkLcqecdkdtzVZL3y75f?=
 =?us-ascii?Q?fAfTlqNk2QtoDehw02MDFjnnjtnekxpfQUg8J1hl+OLEkXwIzu7tBCKuOEzi?=
 =?us-ascii?Q?freFPYXZYGXTa9Tu1eQf3YvLL2aT2+leKkUq0oVWrnod6CkeYGs9W701kXK2?=
 =?us-ascii?Q?/m/JKUSqnURgpibPFbYieLwreyM4tPG30w4k+vfKA4jrfFUnVaea1piy6e6r?=
 =?us-ascii?Q?eR8jJgaU5N4yYMmM2MXM8es2ubY6dalfVSY+2JWr87Th8nBY2AqA4zp8Dknq?=
 =?us-ascii?Q?+wi87rSfm6l4WF+TvcOc7VUD0z8W+dWbuP1w9QZLpMR8YvlmBZwmEOJojrFH?=
 =?us-ascii?Q?k4BrfcAidqS0nXagRd2tcaExQMuWF4d8jOVZ/21IjehmMbE44fv5DvUZLR/q?=
 =?us-ascii?Q?O/jSvo8T/4QQYKFumu+3eeleb/RwMqY73WA/EOcv84V4svxA/bcfIdJuamQY?=
 =?us-ascii?Q?gIkhAgm/CQUcr12UQX8LvxJm/AVgwLYmN/gkeMKEqFBG0UPOAIHQrO2AchCS?=
 =?us-ascii?Q?E8Jb3bebliunl/GtHdGTlZh29woEa74/aB5W8Y0cvkri9kaw/7i3MC3tjlTq?=
 =?us-ascii?Q?PQwGgj1ggGlf8eNjvsExT+RhTsj7vK/CIixfwsl72jnSwvw9iOtheE2lN3gD?=
 =?us-ascii?Q?sPuTP1+yRFL1DmOR40j9rQM+PHLSNvIN4/QXx/EXvTSB5xaLMAK2fO8+mJOa?=
 =?us-ascii?Q?rEhOEMgtZZ5oqtzbtb9V2k9oi3NBGN4s3nx9vrB7go+tK5cM29NkL1bCCKP3?=
 =?us-ascii?Q?CTV/bHdyfuN8nf2mCnKDgDZYoT6xKJgp1Td2rmxx7JdM6yDFrEMJEvVXnXwE?=
 =?us-ascii?Q?FiDguilzeHd0dOnXG/Xumd+g5yl9u7zNoftTYzLNp+XAT2xQy+FuEIlseytX?=
 =?us-ascii?Q?sfo0V7+HWhhapV6tGAM/byjqyaIqNsWqP5uPtz01ezBuS1thp3BMbvGhlNwt?=
 =?us-ascii?Q?W1sGi3gkONmSPEu8Tcp+LQRpSP85xBEBFVG2bH+pG1NWP+uVrj6G1nKRpGEP?=
 =?us-ascii?Q?SdKhDmGB9UNkOR5f4yRAh0UDMPXnhyiCZ6q/mTWThAry45apEMoo1mDsFEi3?=
 =?us-ascii?Q?YPTXV7PtCV6fEa4QVPI9hgRtAP/86tVfeNBMqjP6DJBS0ndLlP9jOWS+0G5/?=
 =?us-ascii?Q?nO0Ar8uMmeT+cZ2hPFUF4efpvHwbdV13qKVjloZL7/RXrNRZSu7JF2yPxpn3?=
 =?us-ascii?Q?MOQn58giWqmoM3TBAsg8+jnNvSFzgXKy7cFs/tcE6Lb1I6RztRneVASqLHd7?=
 =?us-ascii?Q?uU6Bch1FDXaHB6nPqv9kEFHOY1JVR6wgRsA/uTchHOPKzvgqNSFbTF5r1ks5?=
 =?us-ascii?Q?BY5+4d4vj9eCCWQvhy4fZ0MHJ4K2Ixxc38g/GEbU369byvIWJMEaI21vNNVy?=
 =?us-ascii?Q?ijjYq3/AHb/Z4n2hKXGgSGvtSrab5E/KTftajqj4GkNpoOyi3KHeUh5NOPZ7?=
 =?us-ascii?Q?rA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b24e72a0-2d6d-4cb1-b292-08de32bef274
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 22:54:42.8320 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aECHU9A8tJPlOeN3ZdCUpsVDwcuvnEiNNXT7EyfLp2mnPixzHTHwJQyOOevy1ezjeKZYjg9HapHNXeViJozXweKqYRAltWfgyNyyJ4jTFoA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7351
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

On Mon, Nov 24, 2025 at 06:24:03PM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: series starting with [1/1] drm/xe/xe3: Remove graphics IP 30.01 from Wa_18041344222 IP list
> URL   : https://patchwork.freedesktop.org/series/157934/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98_FULL -> xe-pw-157934v1_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-157934v1_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-157934v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-157934v1_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####

None of the failures here are on platforms with graphics version 30.01,
so they do not relate to this patch.

Applied to drm-xe-next.  Thanks for the patch.


Matt

> 
>   * igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-edp-1-linear-rgb565:
>     - shard-lnl:          [PASS][1] -> [FAIL][2] +63 other tests fail
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-lnl-1/igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-edp-1-linear-rgb565.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-lnl-5/igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-edp-1-linear-rgb565.html
> 
>   * igt@kms_pm_rpm@system-suspend-modeset:
>     - shard-dg2-set2:     [PASS][3] -> [ABORT][4] +28 other tests abort
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-dg2-436/igt@kms_pm_rpm@system-suspend-modeset.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-dg2-434/igt@kms_pm_rpm@system-suspend-modeset.html
>     - shard-lnl:          [PASS][5] -> [ABORT][6] +24 other tests abort
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-lnl-2/igt@kms_pm_rpm@system-suspend-modeset.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-lnl-8/igt@kms_pm_rpm@system-suspend-modeset.html
> 
>   * igt@kms_vblank@ts-continuation-suspend:
>     - shard-adlp:         [PASS][7] -> [ABORT][8] +19 other tests abort
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-adlp-6/igt@kms_vblank@ts-continuation-suspend.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-adlp-8/igt@kms_vblank@ts-continuation-suspend.html
> 
>   * igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01:
>     - shard-bmg:          NOTRUN -> [ABORT][9] +20 other tests abort
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-6/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01.html
> 
>   
> New tests
> ---------
> 
>   New tests have been introduced between xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98_FULL and xe-pw-157934v1_FULL:
> 
> ### New IGT tests (12) ###
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-13:
>     - Statuses : 1 pass(s)
>     - Exec time: [1.67] s
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-14:
>     - Statuses : 1 pass(s)
>     - Exec time: [1.73] s
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-15:
>     - Statuses : 1 pass(s)
>     - Exec time: [1.66] s
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-16:
>     - Statuses : 1 pass(s)
>     - Exec time: [1.64] s
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-17:
>     - Statuses : 1 pass(s)
>     - Exec time: [1.70] s
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-18:
>     - Statuses : 1 pass(s)
>     - Exec time: [1.69] s
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-19:
>     - Statuses : 1 pass(s)
>     - Exec time: [1.72] s
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-20:
>     - Statuses : 1 pass(s)
>     - Exec time: [1.70] s
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-21:
>     - Statuses : 1 pass(s)
>     - Exec time: [1.76] s
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-22:
>     - Statuses : 1 pass(s)
>     - Exec time: [1.73] s
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-23:
>     - Statuses : 1 pass(s)
>     - Exec time: [1.76] s
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-24:
>     - Statuses : 1 pass(s)
>     - Exec time: [1.77] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-157934v1_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
>     - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2370]) +1 other test skip
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
> 
>   * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
>     - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2327]) +11 other tests skip
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-6/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
>     - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#607])
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
>     - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#610])
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-6/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#1124]) +21 other tests skip
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
>     - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2314] / [Intel XE#2894]) +1 other test skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-2/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
> 
>   * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
>     - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#367]) +5 other tests skip
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-8/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2887]) +29 other tests skip
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-2/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-a-dp-4:
>     - shard-dg2-set2:     [PASS][18] -> [INCOMPLETE][19] ([Intel XE#3862])
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#3432]) +4 other tests skip
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
>     - shard-dg2-set2:     [PASS][21] -> [INCOMPLETE][22] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345] / [Intel XE#6168])
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     [PASS][23] -> [INCOMPLETE][24] ([Intel XE#6168] / [i915#14968])
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4.html
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [PASS][25] -> [DMESG-WARN][26] ([Intel XE#1727] / [Intel XE#3113])
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6.html
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
>     - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2652] / [Intel XE#787]) +17 other tests skip
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html
> 
>   * igt@kms_cdclk@mode-transition-all-outputs:
>     - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2724])
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-5/igt@kms_cdclk@mode-transition-all-outputs.html
> 
>   * igt@kms_chamelium_color@ctm-0-50:
>     - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2325]) +5 other tests skip
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-8/igt@kms_chamelium_color@ctm-0-50.html
> 
>   * igt@kms_chamelium_frames@hdmi-aspect-ratio:
>     - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2252]) +19 other tests skip
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-3/igt@kms_chamelium_frames@hdmi-aspect-ratio.html
> 
>   * igt@kms_chamelium_sharpness_filter@filter-basic:
>     - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#6507])
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-2/igt@kms_chamelium_sharpness_filter@filter-basic.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-0:
>     - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2390])
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-2/igt@kms_content_protection@dp-mst-lic-type-0.html
> 
>   * igt@kms_content_protection@srm:
>     - shard-bmg:          NOTRUN -> [FAIL][33] ([Intel XE#1178]) +1 other test fail
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-7/igt@kms_content_protection@srm.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-128x42:
>     - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#2320]) +8 other tests skip
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-128x42.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x512:
>     - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#2321])
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-512x512.html
> 
>   * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
>     - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2291]) +3 other tests skip
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
>     - shard-bmg:          NOTRUN -> [FAIL][37] ([Intel XE#5299])
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
>     - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2286]) +1 other test skip
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
> 
>   * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
>     - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#1508])
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-2/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
> 
>   * igt@kms_dsc@dsc-fractional-bpp:
>     - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2244]) +2 other tests skip
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-2/igt@kms_dsc@dsc-fractional-bpp.html
> 
>   * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
>     - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#4422]) +1 other test skip
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-3/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html
> 
>   * igt@kms_fbcon_fbt@fbc:
>     - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#4156])
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-6/igt@kms_fbcon_fbt@fbc.html
> 
>   * igt@kms_feature_discovery@display-3x:
>     - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#2373])
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-2/igt@kms_feature_discovery@display-3x.html
> 
>   * igt@kms_feature_discovery@display-4x:
>     - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#1138])
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-7/igt@kms_feature_discovery@display-4x.html
> 
>   * igt@kms_feature_discovery@psr1:
>     - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2374])
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-6/igt@kms_feature_discovery@psr1.html
> 
>   * igt@kms_flip@2x-flip-vs-dpms-on-nop:
>     - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2316]) +5 other tests skip
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop.html
> 
>   * igt@kms_flip@dpms-off-confusion@c-hdmi-a1:
>     - shard-adlp:         [PASS][47] -> [DMESG-WARN][48] ([Intel XE#4543]) +2 other tests dmesg-warn
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-adlp-3/igt@kms_flip@dpms-off-confusion@c-hdmi-a1.html
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-adlp-3/igt@kms_flip@dpms-off-confusion@c-hdmi-a1.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
>     - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#2293]) +4 other tests skip
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2293] / [Intel XE#2380]) +4 other tests skip
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2312]) +30 other tests skip
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#4141]) +15 other tests skip
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2311]) +54 other tests skip
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#2313]) +41 other tests skip
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
> 
>   * igt@kms_joiner@basic-big-joiner:
>     - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#346])
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-6/igt@kms_joiner@basic-big-joiner.html
> 
>   * igt@kms_joiner@basic-force-ultra-joiner:
>     - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2934])
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-1/igt@kms_joiner@basic-force-ultra-joiner.html
> 
>   * igt@kms_joiner@basic-max-non-joiner:
>     - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#6590])
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-7/igt@kms_joiner@basic-max-non-joiner.html
> 
>   * igt@kms_joiner@basic-ultra-joiner:
>     - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#2927])
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-3/igt@kms_joiner@basic-ultra-joiner.html
> 
>   * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>     - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2501])
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> 
>   * igt@kms_panel_fitting@atomic-fastset:
>     - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#2486])
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-5/igt@kms_panel_fitting@atomic-fastset.html
> 
>   * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
>     - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#4329])
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-8/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
> 
>   * igt@kms_plane_lowres@tiling-y:
>     - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#2393])
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-5/igt@kms_plane_lowres@tiling-y.html
> 
>   * igt@kms_plane_multiple@2x-tiling-y:
>     - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#5021])
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-y.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a:
>     - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#2763]) +4 other tests skip
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-2/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a.html
> 
>   * igt@kms_pm_backlight@fade:
>     - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#870]) +1 other test skip
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-1/igt@kms_pm_backlight@fade.html
> 
>   * igt@kms_pm_dc@dc3co-vpb-simulation:
>     - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#2391])
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-3/igt@kms_pm_dc@dc3co-vpb-simulation.html
> 
>   * igt@kms_pm_dc@dc5-retention-flops:
>     - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#3309])
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-6/igt@kms_pm_dc@dc5-retention-flops.html
> 
>   * igt@kms_pm_dc@deep-pkgc:
>     - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#2505])
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-2/igt@kms_pm_dc@deep-pkgc.html
> 
>   * igt@kms_pm_rpm@modeset-lpsp-stress:
>     - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836]) +1 other test skip
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-2/igt@kms_pm_rpm@modeset-lpsp-stress.html
> 
>   * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
>     - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#1406] / [Intel XE#1489]) +19 other tests skip
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-1/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_su@page_flip-p010:
>     - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#1406] / [Intel XE#2387])
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-3/igt@kms_psr2_su@page_flip-p010.html
> 
>   * igt@kms_psr@fbc-psr2-cursor-plane-move:
>     - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +31 other tests skip
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-3/igt@kms_psr@fbc-psr2-cursor-plane-move.html
> 
>   * igt@kms_psr@psr2-suspend@edp-1:
>     - shard-lnl:          [PASS][73] -> [ABORT][74] ([Intel XE#2625]) +3 other tests abort
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-lnl-8/igt@kms_psr@psr2-suspend@edp-1.html
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-lnl-4/igt@kms_psr@psr2-suspend@edp-1.html
> 
>   * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>     - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#1406] / [Intel XE#2414]) +1 other test skip
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
> 
>   * igt@kms_rotation_crc@primary-rotation-270:
>     - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#3414] / [Intel XE#3904]) +4 other tests skip
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-5/igt@kms_rotation_crc@primary-rotation-270.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
>     - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#2330])
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
> 
>   * igt@kms_scaling_modes@scaling-mode-center:
>     - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#2413])
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-8/igt@kms_scaling_modes@scaling-mode-center.html
> 
>   * igt@kms_setmode@basic-clone-single-crtc:
>     - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#1435])
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-1/igt@kms_setmode@basic-clone-single-crtc.html
> 
>   * igt@kms_sharpness_filter@filter-modifiers:
>     - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#6503]) +3 other tests skip
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-2/igt@kms_sharpness_filter@filter-modifiers.html
> 
>   * igt@kms_vrr@flip-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#1499]) +4 other tests skip
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-5/igt@kms_vrr@flip-suspend.html
> 
>   * igt@kms_vrr@lobf:
>     - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#2168])
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-2/igt@kms_vrr@lobf.html
> 
>   * igt@xe_eudebug_online@single-step:
>     - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#4837]) +29 other tests skip
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-1/igt@xe_eudebug_online@single-step.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
>     - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#2322]) +19 other tests skip
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
> 
>   * igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset:
>     - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#4943]) +49 other tests skip
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset.html
> 
>   * igt@xe_exec_threads@threads-rebind:
>     - shard-adlp:         [PASS][86] -> [ABORT][87] ([Intel XE#3970])
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-adlp-2/igt@xe_exec_threads@threads-rebind.html
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-adlp-8/igt@xe_exec_threads@threads-rebind.html
> 
>   * igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:
>     - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#6281])
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-2/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html
> 
>   * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
>     - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#2229])
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-7/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
> 
>   * igt@xe_mmap@small-bar:
>     - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#586])
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-6/igt@xe_mmap@small-bar.html
> 
>   * igt@xe_oa@oa-tlb-invalidate:
>     - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#2248])
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-2/igt@xe_oa@oa-tlb-invalidate.html
> 
>   * igt@xe_pat@pat-index-xelpg:
>     - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#2236])
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-5/igt@xe_pat@pat-index-xelpg.html
> 
>   * igt@xe_pm@s3-d3cold-basic-exec:
>     - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#2284]) +4 other tests skip
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-1/igt@xe_pm@s3-d3cold-basic-exec.html
> 
>   * igt@xe_pm@vram-d3cold-threshold:
>     - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#579])
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-2/igt@xe_pm@vram-d3cold-threshold.html
> 
>   * igt@xe_pxp@pxp-termination-key-update-post-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#4733]) +3 other tests skip
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-2/igt@xe_pxp@pxp-termination-key-update-post-suspend.html
> 
>   * igt@xe_query@multigpu-query-invalid-cs-cycles:
>     - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#944]) +5 other tests skip
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-1/igt@xe_query@multigpu-query-invalid-cs-cycles.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_flip@basic-plain-flip@b-hdmi-a1:
>     - shard-adlp:         [DMESG-WARN][97] ([Intel XE#4543]) -> [PASS][98]
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-adlp-9/igt@kms_flip@basic-plain-flip@b-hdmi-a1.html
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-adlp-4/igt@kms_flip@basic-plain-flip@b-hdmi-a1.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
>     - shard-lnl:          [FAIL][99] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][100] +1 other test pass
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
> 
>   * igt@xe_module_load@load:
>     - shard-lnl:          ([PASS][101], [PASS][102], [PASS][103], [SKIP][104], [PASS][105], [PASS][106], [PASS][107], [PASS][108], [PASS][109], [PASS][110], [PASS][111], [PASS][112], [PASS][113], [PASS][114], [PASS][115], [PASS][116], [PASS][117], [PASS][118], [PASS][119], [PASS][120], [PASS][121], [PASS][122], [PASS][123], [PASS][124], [PASS][125], [PASS][126]) ([Intel XE#378]) -> ([PASS][127], [PASS][128], [PASS][129], [PASS][130], [PASS][131], [PASS][132], [PASS][133], [PASS][134], [PASS][135], [PASS][136], [PASS][137], [PASS][138], [PASS][139], [PASS][140], [PASS][141], [PASS][142], [PASS][143], [PASS][144], [PASS][145], [PASS][146], [PASS][147], [PASS][148], [PASS][149], [PASS][150], [PASS][151])
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-lnl-2/igt@xe_module_load@load.html
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-lnl-7/igt@xe_module_load@load.html
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-lnl-7/igt@xe_module_load@load.html
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-lnl-3/igt@xe_module_load@load.html
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-lnl-8/igt@xe_module_load@load.html
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-lnl-3/igt@xe_module_load@load.html
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-lnl-1/igt@xe_module_load@load.html
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-lnl-1/igt@xe_module_load@load.html
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-lnl-3/igt@xe_module_load@load.html
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-lnl-2/igt@xe_module_load@load.html
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-lnl-2/igt@xe_module_load@load.html
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-lnl-1/igt@xe_module_load@load.html
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-lnl-4/igt@xe_module_load@load.html
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-lnl-8/igt@xe_module_load@load.html
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-lnl-5/igt@xe_module_load@load.html
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-lnl-5/igt@xe_module_load@load.html
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-lnl-7/igt@xe_module_load@load.html
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-lnl-5/igt@xe_module_load@load.html
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-lnl-4/igt@xe_module_load@load.html
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-lnl-5/igt@xe_module_load@load.html
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-lnl-3/igt@xe_module_load@load.html
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-lnl-3/igt@xe_module_load@load.html
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-lnl-4/igt@xe_module_load@load.html
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-lnl-8/igt@xe_module_load@load.html
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-lnl-4/igt@xe_module_load@load.html
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-lnl-2/igt@xe_module_load@load.html
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-lnl-2/igt@xe_module_load@load.html
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-lnl-2/igt@xe_module_load@load.html
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-lnl-3/igt@xe_module_load@load.html
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-lnl-2/igt@xe_module_load@load.html
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-lnl-8/igt@xe_module_load@load.html
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-lnl-8/igt@xe_module_load@load.html
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-lnl-4/igt@xe_module_load@load.html
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-lnl-8/igt@xe_module_load@load.html
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-lnl-4/igt@xe_module_load@load.html
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-lnl-7/igt@xe_module_load@load.html
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-lnl-1/igt@xe_module_load@load.html
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-lnl-5/igt@xe_module_load@load.html
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-lnl-3/igt@xe_module_load@load.html
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-lnl-7/igt@xe_module_load@load.html
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-lnl-7/igt@xe_module_load@load.html
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-lnl-7/igt@xe_module_load@load.html
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-lnl-3/igt@xe_module_load@load.html
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-lnl-3/igt@xe_module_load@load.html
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-lnl-5/igt@xe_module_load@load.html
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-lnl-4/igt@xe_module_load@load.html
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-lnl-5/igt@xe_module_load@load.html
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-lnl-5/igt@xe_module_load@load.html
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-lnl-1/igt@xe_module_load@load.html
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-lnl-1/igt@xe_module_load@load.html
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-lnl-1/igt@xe_module_load@load.html
>     - shard-adlp:         ([PASS][152], [SKIP][153], [PASS][154], [PASS][155], [PASS][156], [PASS][157], [PASS][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170], [PASS][171], [PASS][172], [PASS][173], [PASS][174], [PASS][175], [PASS][176], [PASS][177]) ([Intel XE#378] / [Intel XE#5612]) -> ([PASS][178], [PASS][179], [PASS][180], [PASS][181], [PASS][182], [PASS][183], [PASS][184], [PASS][185], [PASS][186], [PASS][187], [PASS][188], [PASS][189], [PASS][190], [PASS][191], [PASS][192], [PASS][193], [PASS][194], [PASS][195], [PASS][196], [PASS][197], [PASS][198], [PASS][199], [PASS][200], [PASS][201])
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-adlp-1/igt@xe_module_load@load.html
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-adlp-4/igt@xe_module_load@load.html
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-adlp-4/igt@xe_module_load@load.html
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-adlp-4/igt@xe_module_load@load.html
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-adlp-4/igt@xe_module_load@load.html
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-adlp-9/igt@xe_module_load@load.html
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-adlp-6/igt@xe_module_load@load.html
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-adlp-2/igt@xe_module_load@load.html
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-adlp-2/igt@xe_module_load@load.html
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-adlp-9/igt@xe_module_load@load.html
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-adlp-2/igt@xe_module_load@load.html
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-adlp-2/igt@xe_module_load@load.html
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-adlp-1/igt@xe_module_load@load.html
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-adlp-3/igt@xe_module_load@load.html
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-adlp-3/igt@xe_module_load@load.html
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-adlp-8/igt@xe_module_load@load.html
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-adlp-8/igt@xe_module_load@load.html
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-adlp-8/igt@xe_module_load@load.html
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-adlp-9/igt@xe_module_load@load.html
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-adlp-3/igt@xe_module_load@load.html
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-adlp-6/igt@xe_module_load@load.html
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-adlp-6/igt@xe_module_load@load.html
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-adlp-3/igt@xe_module_load@load.html
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-adlp-4/igt@xe_module_load@load.html
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-adlp-1/igt@xe_module_load@load.html
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-adlp-1/igt@xe_module_load@load.html
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-adlp-1/igt@xe_module_load@load.html
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-adlp-6/igt@xe_module_load@load.html
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-adlp-4/igt@xe_module_load@load.html
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-adlp-8/igt@xe_module_load@load.html
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-adlp-4/igt@xe_module_load@load.html
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-adlp-3/igt@xe_module_load@load.html
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-adlp-2/igt@xe_module_load@load.html
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-adlp-2/igt@xe_module_load@load.html
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-adlp-2/igt@xe_module_load@load.html
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-adlp-2/igt@xe_module_load@load.html
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-adlp-1/igt@xe_module_load@load.html
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-adlp-9/igt@xe_module_load@load.html
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-adlp-4/igt@xe_module_load@load.html
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-adlp-9/igt@xe_module_load@load.html
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-adlp-8/igt@xe_module_load@load.html
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-adlp-6/igt@xe_module_load@load.html
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-adlp-3/igt@xe_module_load@load.html
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-adlp-3/igt@xe_module_load@load.html
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-adlp-9/igt@xe_module_load@load.html
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-adlp-4/igt@xe_module_load@load.html
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-adlp-6/igt@xe_module_load@load.html
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-adlp-6/igt@xe_module_load@load.html
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-adlp-8/igt@xe_module_load@load.html
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-adlp-1/igt@xe_module_load@load.html
>     - shard-dg2-set2:     ([PASS][202], [PASS][203], [PASS][204], [PASS][205], [PASS][206], [PASS][207], [SKIP][208], [PASS][209], [PASS][210], [PASS][211], [PASS][212], [PASS][213], [PASS][214], [PASS][215], [PASS][216], [PASS][217], [PASS][218], [PASS][219], [PASS][220], [PASS][221], [PASS][222], [PASS][223], [PASS][224], [PASS][225], [PASS][226], [PASS][227]) ([Intel XE#378]) -> ([PASS][228], [PASS][229], [PASS][230], [PASS][231], [PASS][232], [PASS][233], [PASS][234], [PASS][235], [PASS][236], [PASS][237], [PASS][238], [PASS][239], [PASS][240], [PASS][241], [PASS][242], [PASS][243], [PASS][244], [PASS][245], [PASS][246], [PASS][247], [PASS][248], [PASS][249], [PASS][250], [PASS][251])
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-dg2-464/igt@xe_module_load@load.html
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-dg2-464/igt@xe_module_load@load.html
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-dg2-435/igt@xe_module_load@load.html
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-dg2-464/igt@xe_module_load@load.html
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-dg2-463/igt@xe_module_load@load.html
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-dg2-463/igt@xe_module_load@load.html
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-dg2-434/igt@xe_module_load@load.html
>    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-dg2-435/igt@xe_module_load@load.html
>    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-dg2-434/igt@xe_module_load@load.html
>    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-dg2-434/igt@xe_module_load@load.html
>    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-dg2-436/igt@xe_module_load@load.html
>    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-dg2-433/igt@xe_module_load@load.html
>    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-dg2-436/igt@xe_module_load@load.html
>    [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-dg2-435/igt@xe_module_load@load.html
>    [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-dg2-434/igt@xe_module_load@load.html
>    [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-dg2-434/igt@xe_module_load@load.html
>    [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-dg2-433/igt@xe_module_load@load.html
>    [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-dg2-433/igt@xe_module_load@load.html
>    [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-dg2-432/igt@xe_module_load@load.html
>    [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-dg2-432/igt@xe_module_load@load.html
>    [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-dg2-432/igt@xe_module_load@load.html
>    [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-dg2-466/igt@xe_module_load@load.html
>    [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-dg2-466/igt@xe_module_load@load.html
>    [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-dg2-466/igt@xe_module_load@load.html
>    [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-dg2-436/igt@xe_module_load@load.html
>    [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-dg2-463/igt@xe_module_load@load.html
>    [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-dg2-434/igt@xe_module_load@load.html
>    [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-dg2-435/igt@xe_module_load@load.html
>    [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-dg2-435/igt@xe_module_load@load.html
>    [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-dg2-435/igt@xe_module_load@load.html
>    [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-dg2-433/igt@xe_module_load@load.html
>    [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-dg2-464/igt@xe_module_load@load.html
>    [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-dg2-432/igt@xe_module_load@load.html
>    [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-dg2-434/igt@xe_module_load@load.html
>    [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-dg2-463/igt@xe_module_load@load.html
>    [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-dg2-463/igt@xe_module_load@load.html
>    [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-dg2-433/igt@xe_module_load@load.html
>    [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-dg2-466/igt@xe_module_load@load.html
>    [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-dg2-466/igt@xe_module_load@load.html
>    [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-dg2-466/igt@xe_module_load@load.html
>    [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-dg2-432/igt@xe_module_load@load.html
>    [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-dg2-432/igt@xe_module_load@load.html
>    [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-dg2-436/igt@xe_module_load@load.html
>    [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-dg2-435/igt@xe_module_load@load.html
>    [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-dg2-464/igt@xe_module_load@load.html
>    [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-dg2-434/igt@xe_module_load@load.html
>    [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-dg2-463/igt@xe_module_load@load.html
>    [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-dg2-464/igt@xe_module_load@load.html
>    [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-dg2-432/igt@xe_module_load@load.html
>    [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-dg2-433/igt@xe_module_load@load.html
> 
>   * igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_copy0:
>     - shard-lnl:          [FAIL][252] ([Intel XE#6251]) -> [PASS][253]
>    [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-lnl-7/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_copy0.html
>    [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-lnl-8/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_copy0.html
> 
>   
> #### Warnings ####
> 
>   * igt@xe_exec_reset@cm-cat-error:
>     - shard-adlp:         [DMESG-WARN][254] ([Intel XE#3868]) -> [DMESG-FAIL][255] ([Intel XE#3868])
>    [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-adlp-2/igt@xe_exec_reset@cm-cat-error.html
>    [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-adlp-8/igt@xe_exec_reset@cm-cat-error.html
> 
>   * igt@xe_module_load@load:
>     - shard-bmg:          ([DMESG-WARN][256], [DMESG-WARN][257], [DMESG-WARN][258], [DMESG-WARN][259], [DMESG-WARN][260], [DMESG-WARN][261], [DMESG-WARN][262], [DMESG-WARN][263], [DMESG-WARN][264], [DMESG-WARN][265], [DMESG-WARN][266], [DMESG-WARN][267], [DMESG-WARN][268], [DMESG-WARN][269], [DMESG-WARN][270], [DMESG-WARN][271], [DMESG-WARN][272], [DMESG-WARN][273], [DMESG-WARN][274], [DMESG-WARN][275], [DMESG-WARN][276], [DMESG-WARN][277], [DMESG-WARN][278], [DMESG-WARN][279]) ([Intel XE#6659]) -> ([PASS][280], [PASS][281], [DMESG-WARN][282], [DMESG-WARN][283], [PASS][284], [PASS][285], [PASS][286], [PASS][287], [PASS][288], [PASS][289], [PASS][290], [DMESG-WARN][291], [PASS][292], [PASS][293], [PASS][294], [PASS][295], [PASS][296], [PASS][297], [PASS][298], [PASS][299], [PASS][300], [PASS][301], [PASS][302]) ([Intel XE#5254])
>    [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-bmg-2/igt@xe_module_load@load.html
>    [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-bmg-2/igt@xe_module_load@load.html
>    [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-bmg-2/igt@xe_module_load@load.html
>    [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-bmg-5/igt@xe_module_load@load.html
>    [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-bmg-7/igt@xe_module_load@load.html
>    [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-bmg-7/igt@xe_module_load@load.html
>    [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-bmg-7/igt@xe_module_load@load.html
>    [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-bmg-7/igt@xe_module_load@load.html
>    [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-bmg-6/igt@xe_module_load@load.html
>    [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-bmg-6/igt@xe_module_load@load.html
>    [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-bmg-1/igt@xe_module_load@load.html
>    [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-bmg-1/igt@xe_module_load@load.html
>    [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-bmg-1/igt@xe_module_load@load.html
>    [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-bmg-8/igt@xe_module_load@load.html
>    [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-bmg-8/igt@xe_module_load@load.html
>    [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-bmg-5/igt@xe_module_load@load.html
>    [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-bmg-8/igt@xe_module_load@load.html
>    [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-bmg-8/igt@xe_module_load@load.html
>    [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-bmg-5/igt@xe_module_load@load.html
>    [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-bmg-5/igt@xe_module_load@load.html
>    [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-bmg-2/igt@xe_module_load@load.html
>    [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-bmg-3/igt@xe_module_load@load.html
>    [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-bmg-3/igt@xe_module_load@load.html
>    [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-bmg-3/igt@xe_module_load@load.html
>    [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-7/igt@xe_module_load@load.html
>    [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-3/igt@xe_module_load@load.html
>    [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-3/igt@xe_module_load@load.html
>    [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-3/igt@xe_module_load@load.html
>    [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-2/igt@xe_module_load@load.html
>    [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-7/igt@xe_module_load@load.html
>    [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-6/igt@xe_module_load@load.html
>    [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-6/igt@xe_module_load@load.html
>    [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-5/igt@xe_module_load@load.html
>    [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-3/igt@xe_module_load@load.html
>    [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-3/igt@xe_module_load@load.html
>    [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-3/igt@xe_module_load@load.html
>    [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-6/igt@xe_module_load@load.html
>    [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-8/igt@xe_module_load@load.html
>    [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-7/igt@xe_module_load@load.html
>    [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-7/igt@xe_module_load@load.html
>    [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-5/igt@xe_module_load@load.html
>    [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-5/igt@xe_module_load@load.html
>    [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-6/igt@xe_module_load@load.html
>    [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-2/igt@xe_module_load@load.html
>    [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-8/igt@xe_module_load@load.html
>    [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-2/igt@xe_module_load@load.html
>    [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/shard-bmg-1/igt@xe_module_load@load.html
> 
>   
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>   [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>   [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
>   [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
>   [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
>   [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
>   [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
>   [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
>   [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
>   [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
>   [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
>   [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
>   [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
>   [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
>   [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
>   [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
>   [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
>   [Intel XE#2391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391
>   [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
>   [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
>   [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
>   [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
>   [Intel XE#2501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501
>   [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
>   [Intel XE#2625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625
>   [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
>   [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
>   [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
>   [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
>   [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
>   [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
>   [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
>   [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
>   [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
>   [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>   [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
>   [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
>   [Intel XE#3868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868
>   [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
>   [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>   [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
>   [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
>   [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
>   [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
>   [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
>   [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
>   [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
>   [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
>   [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
>   [Intel XE#5254]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5254
>   [Intel XE#5299]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299
>   [Intel XE#5612]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5612
>   [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
>   [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
>   [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
>   [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
>   [Intel XE#6168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168
>   [Intel XE#6251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251
>   [Intel XE#6281]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281
>   [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
>   [Intel XE#6507]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507
>   [Intel XE#6590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6590
>   [Intel XE#6659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6659
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [i915#14968]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14968
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98 -> xe-pw-157934v1
> 
>   IGT_8636: 254cd102396ff95d61f2ebe49fc09128878bf483 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98: c3869a42c28feb9db1633aa045a698ab89f3bc98
>   xe-pw-157934v1: 157934v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157934v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
