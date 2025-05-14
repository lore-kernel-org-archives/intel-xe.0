Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 467BCC3ABD8
	for <intel-xe@archiver.kernel.org>; Wed, 14 May 2025 18:36:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B76010E297;
	Wed, 14 May 2025 18:36:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PgiAeNzE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D44F710E297
 for <intel-xe@lists.freedesktop.org>; Wed, 14 May 2025 18:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747247759; x=1778783759;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Q2caNSn2CgRLY6sY+uV6iYTQvtu/EUWBkChXIrx71Z4=;
 b=PgiAeNzENH9B+PSPnYVrgK1aLy/GIWXRWTN+Rtw7qA2GzifWp//uOgnn
 BZsGPAqqz5CEIPEiFY0HSEmVBd/OiUE/jwPjFfdPWik0PgqcZN5IxRMfT
 /d6MUa0Gx6NtNDGkTRpy8nLBTvIhQvBOvWdUPSIchVV8cU4NG7HnRSyui
 QD5pKsWfYglPx7dDVxUOptA51Li7s+yeLFQQluJMBI4EDrFpyAhCH+ibU
 u4GfNriLWc5oxmlByPTknv9txLA7o9MHbOOJNYi/Vc9pwTTfTSx9cV/o9
 /eC9ORK4d2N4ib35zNhc3+Z6bUd7KUaXPFvfZNeQtJ/uGq1kEFv/xNVoZ Q==;
X-CSE-ConnectionGUID: A9tDGxOuRTawcCwmCKo2Sg==
X-CSE-MsgGUID: fWDYqTY+SV6lN28II/kplw==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="52831544"
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="52831544"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 11:35:59 -0700
X-CSE-ConnectionGUID: I98H2poSQLy16BjIQXGjGQ==
X-CSE-MsgGUID: vXiqmEYGRSGozg2xdyt8vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="138001194"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 11:35:49 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 14 May 2025 11:35:48 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 14 May 2025 11:35:48 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 14 May 2025 11:35:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FR0vx76X+dAbRHUn8GcDshY4L7jnuL0XiJSWSTWGu3xsxOxyBZybFcXdXfg02KqzGzkBK+tYQeM5ZayYSwQXb2LjYBS4d30EkT+UH/OL6Y6eH2AqucVy9L2JfO3noQ0NPia+0mAYsKLj1MNaaEaDcG+2yKA2u9+nZqJlqTzAaH85ee19SRaTQvqtcHc2SFMksOWHy8B0LkmG8nu2tlYB1mvyXn9odHnrRwmb3UDyrPjutgNgDnk3JFFp47N6ZoWPCymS1+UEtDjOgcSTxt92QZD/glblfUsgkP60tJBAl8sYeAVQwB1TpMP9TF7eRNUvrao4nLE8PgsZOCXSpXS54A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hAzcgYEkS0t6aZDNpoI+zA5SRkPhYHZkg3EFFPD9H5A=;
 b=KwrYuWsnley3h2yNzenz04jqJbf5ZRRxwgOEunnwoeLCMoCE8K4V92sYjnJkAHMIblX2Dg86exxJhO1btet5cyK9eX4J0kKL0XbdWcz3nOAowkUEYYrF6GdTxcu9zzZatZ37KNkoNkwhYXiZmvOTkvFKEVEoVj6lKx9o7eiVJZ+swVML+l3t8/hQ2R8AWECNdFO5/y/CiW/IOz1JAJ9WsUWXUJnUFJjHJJLk6+UyN3JCxYdFQaEVN7NikpO4O13NXRCF0tgJ6Y469IwHMMgH6dHwp2YRKb2dZGSf1WW/iamICV2k9iYTkztT3ekNFNtGEI+G2t9EWFElO3BDpd2W1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY5PR11MB6437.namprd11.prod.outlook.com (2603:10b6:930:36::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Wed, 14 May
 2025 18:35:39 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8699.026; Wed, 14 May 2025
 18:35:39 +0000
Date: Wed, 14 May 2025 11:37:06 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2 19/32] drm/xe/vma: Move pat_index to vma attributes
Message-ID: <aCTi0kHEoNjd8sIG@lstrano-desk.jf.intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
 <20250407101719.3350996-20-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250407101719.3350996-20-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4P222CA0023.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY5PR11MB6437:EE_
X-MS-Office365-Filtering-Correlation-Id: e0e3e77e-6fef-4d58-938c-08dd93161fc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?R3c4vphQOQUBQfT5T7vNc5K2SqxamSV4mPmmhWKkUT883M7Z3TONfHfHIRG1?=
 =?us-ascii?Q?OxGQd87ME0oQmT/rP3EX7t1lWhS4UMD0vCHER1L77mk7KcJohf0z++XssoXZ?=
 =?us-ascii?Q?zbj6WOQAZeIxMpZ4YsfF5Oi0Nqc3qv47NA34vr1cES8PggLPUebj/rPkHSKl?=
 =?us-ascii?Q?rZj6gp3qvEl9O94MQ1PoEJssXqdgwzmAqCNVGmmGX6OZPPXqzbM/yliif9hM?=
 =?us-ascii?Q?Ngpmr65O7dgx6/XtVsDckRWwDgzjW2htKFrmc1qV52Sd3jqO+HGsa5uz1Dgu?=
 =?us-ascii?Q?xeWud4Ezynxq4v+87amMW8YDUIGS5zaqK97/LkMMi70ahCjUpzzxvq4OSxwp?=
 =?us-ascii?Q?Rd75s3SJevw+V7uoMiYTpu5gZ4zQB9p4VFI+QIsnNgX5fQhIiYcPlDE+7Bi/?=
 =?us-ascii?Q?QEKNXponEFn22fUwZr3eizqTzbww9Gg0LMr9ho9qqaUzKQ/vKUSZMoKPgWHq?=
 =?us-ascii?Q?DfDsJJycpN1gbDw3WOEe2YhRaUoFMGYQaERKhv3d9holRPCFnjkhiHF+zaxj?=
 =?us-ascii?Q?9gHsUeT7Nj/YHxs/eBMHWBBXJ11qthEl1vPAiX6RV9hEpa+cqRBhVNBMdAt1?=
 =?us-ascii?Q?jpCinqmO9gGf/omizUMO+IsgxwwQXGBOfiPmevDtScg0BVqEN0rAi96Mil75?=
 =?us-ascii?Q?f9cCaI7g64vSVF8/ty9i8nxWocl8p7ptjRjfpp/FXXbJQYlvIJwLg3UhMmAO?=
 =?us-ascii?Q?8OFVIix/ozxr95sn5TkqarmfGYPaAwiZzCWQ3SKnkNVaKLOtgvy3k1mUo/C7?=
 =?us-ascii?Q?D+VuQxZ6OD/g5PeBOeq0HfIFRtuLBDPpdzlVSVaSdxF3CXNCZVXdljbsbb0p?=
 =?us-ascii?Q?CFPJ7IdsNY6k2fr0kWyzp+nD5/NaogoSqUiRWU/4PD99A94NwtpH7GOoY3cR?=
 =?us-ascii?Q?56+hvhmaHXnBWO9Vama9SITGZWTanbBom2hh2St/58z4CE5vWWg7ZksWQEKg?=
 =?us-ascii?Q?xYMh0Fl6axFFbxibtpmZL0W9oh6mYvwxSTmdn8gTfXZXw/ufn8O5y3Bc5AtC?=
 =?us-ascii?Q?qrzCU62TA6AcFuHIJhkyMXP1ZcVyG+cmu8uB/bpsc2uFvC3x+wtdI/1G3MEK?=
 =?us-ascii?Q?mSA8Ff6IBajrYNNEzqUkzjgQ72QwPoRXxQkLYcWitedTBj3nZMFpVV29VS0z?=
 =?us-ascii?Q?i3YAqoymvp9heNxuxwuFo70BeQBP0UbX2nsebjMaOe8bJJE4KLggSzYDU2ub?=
 =?us-ascii?Q?mdm+a70a2MzSjwcgJDkhL3e5bJqXpP2+vytS/alwlBDfP/h5AR1ADUuLY4dG?=
 =?us-ascii?Q?m7nmtVZtyyZI2s6Nnt/TG0wyOvY0b58z2PgmYPk0I78EEkeGTBd/d/uzhQ5e?=
 =?us-ascii?Q?AsnJCPpzCn70AEUzzuQNeeKi8cbFZI0K1WyTWpuzyDwunlLnnXLX5pnC5/I5?=
 =?us-ascii?Q?rpVuc0MJ7hO4h3y6ACnJ8YqoD5au8ERRefTF7vWqpclaVrTWAGFRoDXQLRXO?=
 =?us-ascii?Q?VrVFU61iE94=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZlTJlcQ8xCUjBiCjbsHycp6asNXxVcI52f/VavugFqSCCa2PP24mVEKy0A9x?=
 =?us-ascii?Q?S00NHjX9jFVU6yWAhElZJKOeawtmgu8vOIPHDiZ6L6ehy7czRxxTPPtZ5xYT?=
 =?us-ascii?Q?42576PnG2QHqAYowOkqD0iz/UGDW4rjBhXbFaal/YT97rOO9rAdDL1vWugyk?=
 =?us-ascii?Q?UDZrOjTMeWTaTe4DL/afBkshHInD2BF7B+WoVDxAiZt01R+oRphPR3wcAR0j?=
 =?us-ascii?Q?csRLLaCETvD86wNvWAHzGGkzAEgulpLau7Z3B6melgjTJI3mpxXnE2EPr3eI?=
 =?us-ascii?Q?tCD5NQfEHwWitkQwzhgyhvGSu7Faxk7tNyeRz0j51GHKsug7IMZpR9pmC3/v?=
 =?us-ascii?Q?vACMVcywCacmJWk6A4/3rH8tUpI5+mzfx4qgoG3RcWXEJNeU7oAizA4XnWmK?=
 =?us-ascii?Q?+V8eJqa2VmNIae5mVnQtAAFPIntS2AxGPzN6tzcaJt+JtR/iNglmjFM38gp5?=
 =?us-ascii?Q?gEjYkiv5GUwytjOzycCiHz0O5a5lBdFB7Oeqfzb4DTPcc3FAStgnW9UTwrK/?=
 =?us-ascii?Q?I6xVLpCvNkefTH/voBwrha/shNI6KkGR5vHOqt8f8JO/25nT/RPZaK7q+tUc?=
 =?us-ascii?Q?h/Dm60bzR3/X5kKk6CJCIEeBe6cxAG2R3HyjIk1UZZq180F64aro1ZibF4H3?=
 =?us-ascii?Q?EIqVZ6PA1+tkXDqmvjf6S1O5nEH2U7ER0dwvajdAhKmoA3//mRoxXlWS5OUa?=
 =?us-ascii?Q?wFVPF5Gl0Np/w1BFGACRviJNCMXFDfgkXHZL35yPUl3N8ZWJwnOHYT8tTRmo?=
 =?us-ascii?Q?ZUzgvOz/+2eLAlydjWmnwTtk3+tLGTfGWEtqFR+7qyhtpO5PdLIsCjA6YaI9?=
 =?us-ascii?Q?sJRbd0+0yVxcMxrfsOYsMM60hB3A34JiyIN5gAtmByeEBxHkTzbxDkDWYbmG?=
 =?us-ascii?Q?XIxaa65rMUy7LiGhxAaUZ6XnmX+vIH59AD3Oi0vi+bDsbs0FqQ3iTR6gfUEQ?=
 =?us-ascii?Q?jcX+IRRDKwaSULRKqWmFCEt9Us2VbTuIe4wgFTpAqLQlEul7UfQb40fzUKnb?=
 =?us-ascii?Q?bL18DMXETZC63W6tYAzM2yOiGdfavEIJmrr3Lx+MbYBXDgObdI3jU0Fgd4CN?=
 =?us-ascii?Q?TcJgEYuADsqeHpJXzZx43PypF1SdpANG9Y3NlLxLHcQvVETR6UPTbj8LUwGC?=
 =?us-ascii?Q?kGLQNAVpfpHruduhKcUx6yoWTFhhGSy1j6BqHQmQgYC4FZdqAmx3fkuF0+9w?=
 =?us-ascii?Q?TdEzwD3RhknUAnyKb5Dc/Rvfz8/f3EFaUG23pmijNkpPtKKLEcO8RUTMFZoU?=
 =?us-ascii?Q?ucxdRHRO3csikxYke5CxvbTdQc0xAwjZN9VYj1z+c5CSc40LBWMgE9ICFr3V?=
 =?us-ascii?Q?kGLDoQHosTvBFHTO0su5lP9I9h+KSWY3pbgD9u2CVCrVZFYUmO3MoNFEUZG+?=
 =?us-ascii?Q?LNUFZN4GtOwLQ951Xe7VMI5UNCcpH65BpOZ+MSfQci/HZ2iHR7r3YnWltwnI?=
 =?us-ascii?Q?AZOjsAtJE3nHHbbzHmm9TdpkwePU9Tlva10OWJnQ94Chv9cY0cZ74c1Uuldo?=
 =?us-ascii?Q?P4q+ofNJIqbo7nKZlW0fYY2OspOaA5oDGi+CtZlYd9qVQ/VhVDnm8pg7aIsp?=
 =?us-ascii?Q?JOffROIY7iSvpEw08UmJPBNvHUXIP7earD2/8GFiq1lVjVu39517ABhQyTlT?=
 =?us-ascii?Q?8A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e0e3e77e-6fef-4d58-938c-08dd93161fc0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 18:35:38.9858 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t3GOT0Fg5LRiHxHt+FjJ72QcnL4UVYqMWgS/jfbz5rm7Lwmhv3wW4Ss0AA+NHN+rh0KWBqfhpNAkgkgKqGBZfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6437
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

On Mon, Apr 07, 2025 at 03:47:06PM +0530, Himal Prasad Ghimiray wrote:
> The PAT index determines how PTEs are encoded and can be modified by
> madvise. Therefore, it is now part of the vma attributes.
> 
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

I think this patch makes sense assuming we land the previous patch.

Matt 

> ---
>  drivers/gpu/drm/xe/xe_pt.c       |  2 +-
>  drivers/gpu/drm/xe/xe_vm.c       |  6 +++---
>  drivers/gpu/drm/xe/xe_vm_types.h | 10 ++++------
>  3 files changed, 8 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 59dc065fae93..2479d830d90a 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -518,7 +518,7 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
>  {
>  	struct xe_pt_stage_bind_walk *xe_walk =
>  		container_of(walk, typeof(*xe_walk), base);
> -	u16 pat_index = xe_walk->vma->pat_index;
> +	u16 pat_index = xe_walk->vma->attr.pat_index;
>  	struct xe_pt *xe_parent = container_of(parent, typeof(*xe_parent), base);
>  	struct xe_vm *vm = xe_walk->vm;
>  	struct xe_pt *xe_child;
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 1ff9e477e061..59e2a951db25 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1224,7 +1224,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>  	if (vm->xe->info.has_atomic_enable_pte_bit)
>  		vma->gpuva.flags |= XE_VMA_ATOMIC_PTE_BIT;
>  
> -	vma->pat_index = pat_index;
> +	vma->attr.pat_index = pat_index;
>  
>  	if (bo) {
>  		struct drm_gpuvm_bo *vm_bo;
> @@ -2657,7 +2657,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>  
>  			if (op->base.remap.prev) {
>  				vma = new_vma(vm, op->base.remap.prev,
> -					      old->pat_index, flags);
> +					      old->attr.pat_index, flags);
>  				if (IS_ERR(vma))
>  					return PTR_ERR(vma);
>  
> @@ -2687,7 +2687,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>  
>  			if (op->base.remap.next) {
>  				vma = new_vma(vm, op->base.remap.next,
> -					      old->pat_index, flags);
> +					      old->attr.pat_index, flags);
>  				if (IS_ERR(vma))
>  					return PTR_ERR(vma);
>  
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 5f5feffecb82..2fcc48d9d776 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -88,6 +88,10 @@ struct xe_vma_mem_attr {
>  	} preferred_loc;
>  	/** @atomic_access: The atomic access type for the vma */
>  	u32 atomic_access;
> +	/**
> +	 * @pat_index: The pat index to use when encoding the PTEs for this vma.
> +	 */
> +	u16 pat_index;
>  };
>  
>  struct xe_vma {
> @@ -131,11 +135,6 @@ struct xe_vma {
>  	/** @tile_staged: bind is staged for this VMA */
>  	u8 tile_staged;
>  
> -	/**
> -	 * @pat_index: The pat index to use when encoding the PTEs for this vma.
> -	 */
> -	u16 pat_index;
> -
>  	/**
>  	 * @ufence: The user fence that was provided with MAP.
>  	 * Needs to be signalled before UNMAP can be processed.
> @@ -147,7 +146,6 @@ struct xe_vma {
>  	 * and encoding of the PTEs for this vma.
>  	 */
>  	struct xe_vma_mem_attr attr;
> -
>  };
>  
>  /**
> -- 
> 2.34.1
> 
