Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3E5AD15DB6
	for <intel-xe@archiver.kernel.org>; Wed,  3 Dec 2025 22:45:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F77010E19A;
	Wed,  3 Dec 2025 22:45:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zu7Ypxpz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E75810E19A
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Dec 2025 22:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764801948; x=1796337948;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6zvEmFT5eohbaJIn+5eAxmS51P2dEm4w74IntHIYcfg=;
 b=Zu7YpxpzJYhlgE4UJyOQvJDcgUAIPt61JlfcZO5V1ess5p7bV54iB8Bk
 sp8bMMFz2d7l+Ue6b079qNxRMbLKrR/QcFAZ4+pjBv+IgSf03q70Xdugn
 eqyKJm+pVM1teg+6TMAJ0UXlslZRmP23G882Ao99EyFJyHwxFdur83JBB
 KKqJku29+8yYTbZ9Kk1WgLjuF1by1cJimr1FTcxCWL6Crx8xZg6PAKRU+
 pGJyEtjV6+k8ovq8CEq77V28Nr3zcJHAmGoK23Bq85STw6TC21ka/xsH/
 p6+hwWd8LXltBHPGnBsBwVj5johB9rI2LAC/ZyDzbK9Q+7g5QQg3a4b6A w==;
X-CSE-ConnectionGUID: GfhwslkbR+K/eWvO47pJkg==
X-CSE-MsgGUID: 8xqdgfzPTIOZ6HkJtmmYXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="89463926"
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; d="scan'208";a="89463926"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 14:45:48 -0800
X-CSE-ConnectionGUID: AYC+WDyxTzmhL9jVljOyfw==
X-CSE-MsgGUID: 61MAt7y6TdKgOeoscW1Mgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; d="scan'208";a="218166664"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 14:45:45 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 14:45:44 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 3 Dec 2025 14:45:44 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.65) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 14:45:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vcrUJsfqk9VJAHRpnTatk3RePoluLrRkyLY7vsyQQ7RtRoA6thWxNhesEHU/8WaPzIxdMzv2xQUwotlG7e3oUOHhtc8dIqNpZ1aa9cDjOVV4cEzUwNzdKb3MufTDgtJVefAe1V6hfICJIzfiJwPMFkayB1lEQcxt/C1Hl8rhb3upEItg5lw/62HpEkQkkbXgNjK0BWsIb0nNuxxlwS5AFs3eEv6UkkatUFyUjse/DtvGqN+eYJNPdUcrG++7X6LQVVc7Z2M/jlowhD8H5bTEERSc3lyVOMDCGacnTsWc/EX/dxQnnVCI2tayNY+jFCU4Q0TQOJb54M8N5tfwpU/84Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+1MCyXaC3mRk5sVFGzWHKmEpkE9mR3+D1UYIwosK/Q8=;
 b=wV5kR+jS6SagKSaITqasL77J090I+JiMeRT4F3dah4OqrmBxEcbD39y8U6TnlTTiaR9wCefP4a+C9m1MRBaGHasYo/AoCF5OPziLUaTtxpeN5XLBXGZPbPRrt1gL3cciQoUYqE1cHcuTOCnWOdc1wbIyLTnuGulRM2+nCopnh5LDAUhlLUYyt8BW6xFql7YTNDuPxOej6PGLLiFCGO3CNwLTLlRbjgAno8ncXCaLqqq7yXYoykA9wk0w4ysW9L2hdRQzPYks5qiZcu9DZPlUxqW+z8cLlUjemTR7CCuBk0TQNYeKr6BBm7sn2NNmqwEdqxfcIOjfNn9rGphZY+Zmmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MN0PR11MB6205.namprd11.prod.outlook.com (2603:10b6:208:3c7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 22:45:37 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 22:45:37 +0000
Date: Wed, 3 Dec 2025 14:45:35 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/xe3p_xpc: Enable Indirect Ring State for xe3p_xpc
Message-ID: <20251203224535.GN4065316@mdroper-desk1.amr.corp.intel.com>
References: <20251203211024.1097968-2-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251203211024.1097968-2-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: SJ0PR13CA0167.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::22) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MN0PR11MB6205:EE_
X-MS-Office365-Filtering-Correlation-Id: 6755b73a-61f0-46af-a96c-08de32bdad41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?L9nqXQI3y5zpO6M7WXKZJm94fht2TTjNkauwgVB8s7J0mzayP2lBI314p8wk?=
 =?us-ascii?Q?XxGOjSsOz8xcvL3IWuNa4n2bEkiD472nvZCU/IA6ZlfdXp5bxsLXxqEqefig?=
 =?us-ascii?Q?Dq0btfELSDnEL6p1Sj3E+YNwXe6/exNm3Qk8NMV8AhO5yvoIYcfUr+R9lBd4?=
 =?us-ascii?Q?jDPy7l+wiC6Z0RcMTewwgLzt/agXT2Gg35jnhAelhYG+tWTlVyUNj439gOU2?=
 =?us-ascii?Q?FbCg+qPlagc5FNId+gVD2Ycr9mTdtZ1tqPu1rPONNC5MBrfvPmWCMXeiG68k?=
 =?us-ascii?Q?TyYCTHtAVN5oG7iVRYhK7AG89uhMwcg/zjPn5D8WATVU4fLGPRhJsjrA4/Fb?=
 =?us-ascii?Q?d5DQMNvjTCvHYubdD8OGpJPitTOPL/1QdR/igtCVeyqOIG+WvCR8t9X/4RmP?=
 =?us-ascii?Q?QoLCxG/dsr33+plavYIOSIO3EeGy7BxYbRQnCqH4UGZpDoV3qHDSrYnzOGtw?=
 =?us-ascii?Q?TWLRbANiQMK6vHJh9pKvGwM/St5AcPUwo9Miz/Xokr7HV2adcu6O+Ql/IHYo?=
 =?us-ascii?Q?dZelSN5MLLxS/IBkY/n+fKn40Hd6jOjHhrZcGVgW1WfVRRcdmmAZu7mnlgT+?=
 =?us-ascii?Q?/i31wqoglVcyvk11LGRZH7n1aXb85kd3lOtGZwFVdj6G/zgyEbNuyknOjA7Y?=
 =?us-ascii?Q?H2vgaOfAii74xAAuXZsLbLENzQkJ5d3i9XmwqRQP1Z9e/5mLaPzlOBeGfiHA?=
 =?us-ascii?Q?9yuvlYsxwI59lorYHQMEvx8Whn/q5cbcVm8iLS/kQCO1PcYD4P2Z8no03iZj?=
 =?us-ascii?Q?Vh55E0FeR2VfH9zu+alD0VMkWjTLD4HeKGfL8riuEQkN53FSFzjqYzaVmbVL?=
 =?us-ascii?Q?cMC3b/w3NQfP4imQVaxwkxs2wuT3scTtdGERXmav4Kd2/Av4rssX3ueoWa60?=
 =?us-ascii?Q?hW/szHZndjGVYvpMh9mEJm10jP2oOIRpTJisNqrAkR6QiS5ILT+tRslYtgc7?=
 =?us-ascii?Q?cW0F+3/JZZCro3gTFL/MbYLeIVCExzHZp8fyI8/49ceen4F80+Vt17JMJ2rF?=
 =?us-ascii?Q?ROmt+eT7eD8FemRUMAnmvkJXpK+vVuRlhpwxG9dkA1L2N/FCISs+nebeHXUd?=
 =?us-ascii?Q?0/qxPInPwBEAMd7ay5aT1B3SIQoaXCv5yfUA+sTdySohwDUb4TUYktnz8THh?=
 =?us-ascii?Q?rfXLFqL4DorNEhQn8NXO8GC3HA88ODuUP6HFdpaUw3045Xizj72rNxYDTqig?=
 =?us-ascii?Q?2zyzsLuCRnYzvKOc3IUK1Fu54cMxfYKXlAOqfUShoruM09UrqhQHtIdDAhq9?=
 =?us-ascii?Q?sZo5+aAdIiJo3Cd0P+6aC7c98WSYwa9Sv0l8/tvtKmpUbyBMGSpSah3KU5te?=
 =?us-ascii?Q?eJvgFXWTG5uoPJqaiUE3yfFpAn9DfJ2ydbrHsMWgCGSRX3lpm7hdI5QiRUgm?=
 =?us-ascii?Q?/IRhnZ9FoEAYmVc7Y05pXldu88MSjue4mDqAupL1xTBnqgQq4grstRWXh8yg?=
 =?us-ascii?Q?kHsvOnrJKAByMM0MS2R1j9Spdf03g/2X?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3U9ZRhz6uHPJGDNQejWuWcW1LdPsrI5xTpLwQnZze5t+IWhNCKEufP/AEOyY?=
 =?us-ascii?Q?xnqnjx/3rCmcaGCNaBEA0ZmzUwwawRg+aCqanmrNKdfQVP2oJtdLq/O/fu8M?=
 =?us-ascii?Q?W6tP+2v1fksJ1a/XFdNBpg6BcBIpbTX1Ys4WJq/CPb/OEMt7Peo9CmVdJQeR?=
 =?us-ascii?Q?s54dH/Ii3Tgf/slyc+j5QvUPMc5eVSmq9JZnLUydyu/wyTNlthpPiSmcpJDE?=
 =?us-ascii?Q?EPB6N5C+R8WvRA7dJ09ohEGqzwjPqzajJnAvbLDgZ+aKbnafkYn1LBHUCZGe?=
 =?us-ascii?Q?Up0OzZICS4f4qg4vz2iNOLTttNJMayGnTmx/1tUJNE2fkO/xEo+Ihbk9wj16?=
 =?us-ascii?Q?z52SyFPbvg6I6HcUf8VyIAwqbbP5doLECmvWtLHzSqJoaQ2qfJ41T1GYvN5T?=
 =?us-ascii?Q?kLR3hZHRKozzt2qjWFMjUXiSISZoDL1gyvXDhG5+rV0IZNkpi68yJtTIpU28?=
 =?us-ascii?Q?QTGjYd+3zlCFfFy40MReKBJAqURyEbAJHtW6N/Uk3SyiKSaoYUvvmaM/LWlk?=
 =?us-ascii?Q?xOp7z3bmiTUilfMAqFBsUo/1VH2TsAYhc7erU88m2Z0yo8EArIJMl4qIrJ4N?=
 =?us-ascii?Q?5+nR5fdiGFBEu6TzMIJ/GZXY7eyYLC6ngCr3gmn73SYhZn/Lp4WSev4DsFS6?=
 =?us-ascii?Q?6JWbTooDfDz6dohaBzKurFsULeTOjO0lxhxX0PovkpNeaL07iSZ6O5VNzHg9?=
 =?us-ascii?Q?2njf4FgHvfbZvQil2nJ8MAmmyVia97qAIGF30IRkjOX42zNEWdOTEbhuwVQU?=
 =?us-ascii?Q?d+sLbfJQ5I4CII0hlEAgNs1Gyuqq2FIritnDqGMrwOCO+9zPCZ+aFsI1hmPh?=
 =?us-ascii?Q?9ErQIzIZCWDXot3GSwNO0+U5EhT2xmmqx876mmRMh8IcY6E3bGNukkNHN3r9?=
 =?us-ascii?Q?uEe2N3RshNtCL/ZcuhzusarPMyCHmUjJcJmixajBMWKYPKh+WCjzUW9bYKRx?=
 =?us-ascii?Q?jB8c2U8EnCJ3Rf1GengSYvq9RlqinYvaVenWle2vBwZsvE32qj88/VawLd5b?=
 =?us-ascii?Q?KnmY12og7u9ifaaEUFh2LojK4Aw37VHvXo7R/oK6OW870jkwegDeU6wFBuHw?=
 =?us-ascii?Q?0EYIc4A5jojqYjTdvHjYoRhXQgfiBYlhBFZUAgBoe/oMtUS+cF+aeX7g1d8q?=
 =?us-ascii?Q?QIxLPT3/xuOqD1036hwG4PuGtaal+ygIPBoRD+Bze5CERFL7GNpJzQABX3ql?=
 =?us-ascii?Q?eMKE/ux2EN6iVfwfj07GLwO5CJNIXv7l3vaPbq4dw5BrwCaZ2bPkbrO8Plqv?=
 =?us-ascii?Q?Lk4xTxR+gxzacfbVJwl1t6Wdqyel2SfToL0Kv0xELUnWBwQnO0JMuvc6Dfa8?=
 =?us-ascii?Q?8IArJMm30Bpw81cLD+3ePtd+FqgPIDIDVancyi2oDsGyTj9qtKy18C4wU/8s?=
 =?us-ascii?Q?eQuhvsmf4VcIvSLrXd+10ZPGM7/ATidYOZceBZZsm7uJRTukQ8VtFRAN/pBz?=
 =?us-ascii?Q?1P2EG2GK3xkGhExRPh52fVhL5GgAKMwLToT01HGwKSRcXqNFPnZQ09mcT15P?=
 =?us-ascii?Q?mkdtYkXf9vrXMHoDcyBTRjA9ZjzEiWu6NPToR6wwUUv0av0EIADCxc7NPhHr?=
 =?us-ascii?Q?AU4DyyUiu1dZU/n7QZDuJp5GR0xPR7ujZQYqsG+hAzAu0/WWczDnRmssrLc6?=
 =?us-ascii?Q?oQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6755b73a-61f0-46af-a96c-08de32bdad41
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 22:45:37.2338 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lA7rSsioQKrrOnNwU/e8GK1eEck1aEbHJKFY4JaRK2nDW1JNTy/OJHVA3F/5P1fpAwCMxe+tjANLDIRtwWcKs5KQGRlVqR6mYJp1ZUPbE8o=
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

On Wed, Dec 03, 2025 at 01:10:25PM -0800, Niranjana Vishwanathapura wrote:
> The xe3p_xpc platform supports Indirect Ring State and
> it is required for the upcoming multi-queue feature.
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>

Xe3p_XPC doesn't require Wa_14025515070 so it should be safe to enable
this immediately.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


Matt

> ---
>  drivers/gpu/drm/xe/xe_pci.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 8dd0ea9d1d56..c8188a5b0f76 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -108,6 +108,7 @@ static const struct xe_graphics_desc graphics_xe2 = {
>  
>  static const struct xe_graphics_desc graphics_xe3p_xpc = {
>  	XE2_GFX_FEATURES,
> +	.has_indirect_ring_state = 1,
>  	.hw_engine_mask =
>  		GENMASK(XE_HW_ENGINE_BCS8, XE_HW_ENGINE_BCS1) |
>  		GENMASK(XE_HW_ENGINE_CCS3, XE_HW_ENGINE_CCS0),
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
