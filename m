Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E42CC87FCA
	for <intel-xe@archiver.kernel.org>; Fri, 25 Jul 2025 21:52:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1170F10E23C;
	Fri, 25 Jul 2025 21:52:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bIs4C6PD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB9AB10E23C
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Jul 2025 21:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753480357; x=1785016357;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/lMJr0FTVjIJINBsnNvrQOjG/3TEpeKGdEkaE82SDEc=;
 b=bIs4C6PDgB8JvFzbITfm9uXolpfT19Q/0WQaozg+ivTiPzogHzRwsANr
 CzD3Rv+MouRjqMwbNI5XG8+V0EHZqc+xcyQsZKFRn5vHEbnZb6wqT+Hv1
 trh13q0MwWL2uX0y2nVmHEUhMmiPd5W5fu7qnvCKNaMC+u0UlOdHYJjBi
 wr/B4U4/IT2wmai5w5kIA035t5uB+Er2IRklSsGCZ0Qdl9bfxm7yCd7Xk
 tyeaGzxERie9Dd8U1NSzfL+feWOCLWRl5vSb58ff1s8KTgypbOpjUg50c
 kiPrQ9JCFhBwIwg77uZgI8J0shhgfzO+8RQpezM2IqdVMR9sj0M5xfaqu w==;
X-CSE-ConnectionGUID: zbaIxk32Qzy4EVpBWIzKHQ==
X-CSE-MsgGUID: AsyOyOpfTSKM5vebjjlH7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11503"; a="55970675"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="55970675"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2025 14:52:37 -0700
X-CSE-ConnectionGUID: F6wZtZF5Q0qjLi/Tt/Ephw==
X-CSE-MsgGUID: RpLjiIbxTkucSSzZIR0Olg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="166519721"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2025 14:52:37 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 25 Jul 2025 14:52:36 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 25 Jul 2025 14:52:36 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.80)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 25 Jul 2025 14:52:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=opXuLvoD2tkGz1iZ7qkpVrBgIEh2qvw6dmmtMnc6BeE/M7hraNd3q/ifebq6aQA28xOzfb9TbnZCr+dmU3DsmTUXlshO58IJ/L10fD3RE9anlGidviz9ISkHVnYAAffYJVjtaUJ/4zm5GXrVqFLhh2ZIQmkTtgiWHyqRKeEll7rFqIY9YJmIe9cmBqqHoC9hvwjA9Uvaai3ZCXIuxpHdCScsCLqPqhcJVQ/7rOCJPK9zIdDMeqFYiJc8cC99zi9K++zaq2R0fn3C5LvI6qq3UCLSW3lDkspKsDDE0dVKKPLGP5vyIueXxWVMdZa+LtVdQWFcrag6bRzABGjkkjsNCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kArjLbnRx/PtUFIaEP1I/BkPMi9g7wTd9X2ViztQ4Qo=;
 b=VROjgXYyF/AXNN3OaybmrEZyWwaPPP3eh7V7gHrz5KYSyn5jQLwUllDjuFpy5Dt2r01bKzkMcwnkm4z7tWBR2JyLQFi/NE8TEQldlKwRDXeHWr71IYPQkkeOSPNRVgycA0mCk/i6j6TLKYL8ptD3FGXkUdr93U08kMrh9+BVWDLyISv0nkiWFTiBfcoZilqoZtv1oP9rDSR0ftiTIk8QD8/+s8XEA5rhSBKQgIqoPR6+GVfOJSofAfRk13naGg4+cm6d+2SUDO4aTV/fKyXHe9R9pdsca9U4sXxkjEF8NvS0TdALucxV02Ppa++/7C2bmuT+w/vfRIctLLk8NTPVxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA0PR11MB7284.namprd11.prod.outlook.com (2603:10b6:208:438::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Fri, 25 Jul
 2025 21:52:33 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.8964.019; Fri, 25 Jul 2025
 21:52:33 +0000
Date: Fri, 25 Jul 2025 14:54:22 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 3/6] drm/pagemap: DMA map folios when possible
Message-ID: <aIP9Dnp+Ey7snc26@lstrano-desk.jf.intel.com>
References: <20250725154011.2807655-1-francois.dugast@intel.com>
 <20250725154011.2807655-4-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250725154011.2807655-4-francois.dugast@intel.com>
X-ClientProxiedBy: BY5PR17CA0002.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA0PR11MB7284:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e9747a0-191e-4fde-7dc5-08ddcbc58f6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jaJNibIDodNgLjcN1q/FEM3Oned60CjQxUXrJd/gJLEyBQaHG3LXsh6gZkIx?=
 =?us-ascii?Q?//l5bzazXzyndvtXHXyfAUClh1vI0lglmnRUH/T7Na/MG26gBjchFoaR/Xg0?=
 =?us-ascii?Q?0e/3uqGlPNBzziJ0KjKJFkTTZiDtPGA9dkcC/f5vFOxG4v86vY+GwcXnvbAu?=
 =?us-ascii?Q?7mipEC4BRfl7LB2wy5/UGxwJik+TS3F++OcQxCz5w0OTO6U+eMUzavy77TCU?=
 =?us-ascii?Q?yotSw14nr3eZG2XgCVeMWv+/K6x/pyEVObPSkPlOtHZl+p3RFLasYBudIm6k?=
 =?us-ascii?Q?QDBYVxcJSlPpkkONIkzcaU459iu8NYCaaOacQExLx1eb1mK2B0P3RailbxZi?=
 =?us-ascii?Q?ig2dN6RAOAQ4R8rApWqdXnR3B/E3MfphK/ODuoOhy4K1JjiGTuwQ1r2G64G6?=
 =?us-ascii?Q?ZLRMo1eDowf8uBC5FcSTlK5rl+I4ffa6eShudcDbgo8yxPVIKn5afaB7o84G?=
 =?us-ascii?Q?mlDKdt76dCSxGBqDiD2Taspc9QeYdScoIPQ1Z9ufl1LRUs+1l12WB6A6DJBV?=
 =?us-ascii?Q?CGHeRRj+viympFiu6RygE5ANhFDlVyHQpWuAPgHk69P5aDPyh3b+u82zSvKS?=
 =?us-ascii?Q?ML8YPN1mvSMhnL0YHOOnkf3jmbds/3qxRryRpQkrgXifTUMaEvJaazT5+RLm?=
 =?us-ascii?Q?BhobigHTccXDtxoNNqDY4c5EsexO5FE+OjnpuXxAJGw+EbsYRppCUWfhuUx4?=
 =?us-ascii?Q?oIsZI/N31pZodVvUlpxex9m15WNTt6/h/B87Z8ThKxQ7AoVCRwF2dI3c7yuo?=
 =?us-ascii?Q?iW88OTFS9G/nR3SSBScFvV3AFNqYz4Jd9OrbI0kR2bNZctiR5Oe2TvzoW+C8?=
 =?us-ascii?Q?PRLyPU0+yMOpJjmqsMoo5eAF9q9oKK6OqJGEI7lF0deXB1zhARJNZ6J+O/5J?=
 =?us-ascii?Q?xVm73Uqr65wUP/EWXTB5zDEOEZ8SQcDtuyi2ZGeYh6+PH51GgAacnIHNfJqu?=
 =?us-ascii?Q?NDRvRgwnNvzBF281NtHS2DTFaH0P7qtzJl/7ejfMPaWy5DDsoYriWpWuwjQ2?=
 =?us-ascii?Q?niYmOnh7SvZCyOnywBLPH+4/7gep0zUpUjixDVm49A+s47nGSJ3qMOjGR4ab?=
 =?us-ascii?Q?xzhVDRiJ5fN11CFIxuhJ1rP86PpQ+UV8aWHau5zTLM4IawOnRTHSLXnjpQOw?=
 =?us-ascii?Q?RxjL7QBPtxFhRvDmCB76SXvNXMUpnQMI9iR5gPW1m+OJNyJcfJVMEWJYiWH/?=
 =?us-ascii?Q?xlN1H7txFwHI+GuLcJOyDP7bp/Fq6r+oaw8p91mcyDXXN/elsv3EElBxbeXm?=
 =?us-ascii?Q?k7LihgzY1wR5OkwokmecoP1jfcefo6m8YdSZIi/47Qg+Ganlm2fglIG1x0LX?=
 =?us-ascii?Q?ZNOoLs3LgBTz0s+RugvtMGUdUyg/pD8tXVMcXVK1FQCUtoC6xuDWJYpManMM?=
 =?us-ascii?Q?ZpHefWWn+lPi0e79sjDKgFkGNYtbPCdaq30bVww4Kl13qf0pl9329kTKrKAi?=
 =?us-ascii?Q?d2gy2fPcVIE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Drklgc7p1W74B7oZt29bEUL10gRR9OahOWtM4L/fNhrCpwLWME07UWwA8jIG?=
 =?us-ascii?Q?TIsU1HIEIIbMOZ2tWY9lS6E5innKiRezGZNIXGZJ2iBA4hFx+8ucHIf596Mw?=
 =?us-ascii?Q?LACYCbp+Q4oQjfRyf8dkzPIyS31pmpDM42YD/4lUd4MeivpfaX8JbyFQ5vYE?=
 =?us-ascii?Q?XfTmnDjvM3Q3FqapTAExuRXUafhkudZBkSmYAWZ6la9wd4IRXH8nPJMmUDDE?=
 =?us-ascii?Q?xBCd6Gd/0jXrNh4EhbA3L4xD6Vu3BZ0/34K65eS2t5X8vrNs2TrLlhMTo11a?=
 =?us-ascii?Q?NGrocr69f4iwM4rr2UpUzVXvsezd7/ZOycp63VbQ7rGROCID3C1qpVvz94Ra?=
 =?us-ascii?Q?4ePMo7A//cDlKZ2YtD2biu1cyIYF0ry1TgwkjWbjWofbEAaRKX2TSLFrEDIR?=
 =?us-ascii?Q?iQgBn/j0wOq1etdBvMNoWyA+Gq3ZpXs/r0ACj3crvdSzZoE77MsU4jgn8F+H?=
 =?us-ascii?Q?XsJ5m2Zm4QuHnBzGdjozgHtf0HBvQnb9+pQvh7yABux7rwYrSsGECkB0nGsV?=
 =?us-ascii?Q?h1ueE47zSqMFYJM2zt7/CY/EKBw/lbKqoHzQhvT6jKge0eEPHsQEYjoy30ro?=
 =?us-ascii?Q?ii46RuPbSTAms0QoLxxTQXRrmff3ip4obbp8fC1rCX2yfxaj95JJwlsU/zkN?=
 =?us-ascii?Q?UyzVO3zB2MIp0MyFWB22+jGBYmpIsRbAR9kgJVXtK5xPZ0DR2iUBHGaH0RWV?=
 =?us-ascii?Q?1ocH4rA5nF3mPkM4mHBTf0NmuL/vC+E+/SNKdSgIcMNZgIMRS4QjnoAi+y1b?=
 =?us-ascii?Q?s/rxJw3cCTBV+HiiQoM5ZhDJDDINIomd7LnK/CGVbWp8ZMygHrjOO7E+i+r+?=
 =?us-ascii?Q?Bm4Qv0TATaVTdM+kyBL89a7qorUl4zTu9xabCsuq9TS5TEDezFdU8ycs55Mx?=
 =?us-ascii?Q?6RYtlNTWdlNr4pZMfbXeoJpbtu+dgfAi6SrnPDhrExuw2XjI+Us2+g7pqwkY?=
 =?us-ascii?Q?b9MQSXI+BrJcZJkXviq77P3/RnStr1g1Wy5usaq2h0S+9cSGbR6iT6Z+r11k?=
 =?us-ascii?Q?9nlJbjH1Y9rMNszlmTohcDueMLrj1EAM+O7c9mxctEXRaSQrfuXyKgqbgKKO?=
 =?us-ascii?Q?JgRb2RmKSuIRtqiTDJ+YQSaOqxvVn/zT7aftAlt3spagiIGDQ+IWepBmJ2er?=
 =?us-ascii?Q?af3JxchvEdmQRs3EG9912YZLmTX35q20j9pbszMtGwL5C+HcjntB+cC/pAXt?=
 =?us-ascii?Q?KBKzfNwokbZBwdM4ot3Y2Up5C9r8qg5jV+i3bsYcmanjJyDp/Kew4bill0zr?=
 =?us-ascii?Q?pbcmZ6TEao3XcFJLrmKW60BmMhipIQ6k9bWpQqCocQF/B/8X15K4bWpOH6tm?=
 =?us-ascii?Q?+IskipwpBOugzCf+8ociDCXmAZ+GjF+DWC/z2LmqS3r0+zUOw8rtSG91SUd7?=
 =?us-ascii?Q?Rg9k8lVxiioqOpOIgmaaZsbPJz0FIF+9EGxxslY46UioqhNHH3LOmrHn4AoA?=
 =?us-ascii?Q?ZsGycyNNXxhhG+hHzO6ua5tV7Vxt3Ww/PYakEUajz7UJH0frZUBK7/VnreKd?=
 =?us-ascii?Q?NlCRjdmuKoX4EVnhoLi14AsFBqxNxWt3tC2lRRvBlk8yWwS7V+lr3McUy4Mw?=
 =?us-ascii?Q?nlP86mkakTM05loLyQlC0hozn2UVrfMD0zjbLP/dBVx96ERqpysqn9D5JrBf?=
 =?us-ascii?Q?9w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e9747a0-191e-4fde-7dc5-08ddcbc58f6c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 21:52:33.3123 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jNzptkppDIY/4eyWbtCJ5CWjwcCw5iBRQKMq2qP5enqWXQoVQIoGmVQbSwQCPdqJkkSneIJPSTG5ahEJj61V0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7284
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

On Fri, Jul 25, 2025 at 05:39:27PM +0200, Francois Dugast wrote:
> If the page is part of a folio, DMA map the whole folio at once instead of
> mapping individual pages one after the other. For example if 2MB folios
> are used instead of 4KB pages, this reduces the number of DMA mappings by
> 512.
> 
> The folio order (and consequently, the size) is persisted in the struct
> drm_pagemap_device_addr to be available at the time of unmapping.
> 
> v2:
> - Initialize order variable (Matthew Brost)
> - Set proto and dir for completeness (Matthew Brost)
> - Do not populate drm_pagemap_addr, document it (Matthew Brost)
> - Add and use macro NR_PAGES(order) (Matthew Brost)
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/drm_pagemap.c | 25 ++++++++++++++++++-------
>  include/drm/drm_pagemap.h     | 10 ++++++++--
>  2 files changed, 26 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> index de320aeed812..b6f5d3a8e445 100644
> --- a/drivers/gpu/drm/drm_pagemap.c
> +++ b/drivers/gpu/drm/drm_pagemap.c
> @@ -222,22 +222,30 @@ static int drm_pagemap_migrate_map_pages(struct device *dev,
>  {
>  	unsigned long i;
>  
> -	for (i = 0; i < npages; ++i) {
> +	for (i = 0; i < npages;) {
>  		struct page *page = migrate_pfn_to_page(migrate_pfn[i]);
>  		dma_addr_t dma_addr;
> +		struct folio *folio;
> +		unsigned int order = 0;
>  
>  		if (!page)
> -			continue;
> +			goto next;
>  
>  		if (WARN_ON_ONCE(is_zone_device_page(page)))
>  			return -EFAULT;
>  
> -		dma_addr = dma_map_page(dev, page, 0, PAGE_SIZE, dir);
> +		folio = page_folio(page);
> +		order = folio_order(folio);
> +
> +		dma_addr = dma_map_page(dev, page, 0, page_size(page), dir);
>  		if (dma_mapping_error(dev, dma_addr))
>  			return -EFAULT;
>  
>  		pagemap_addr[i] = drm_pagemap_addr_encode(
> -			dma_addr, DRM_INTERCONNECT_SYSTEM, 0, dir);
> +			dma_addr, DRM_INTERCONNECT_SYSTEM, order, dir);
> +
> +next:
> +		i += NR_PAGES(order);
>  	}
>  
>  	return 0;
> @@ -261,11 +269,14 @@ static void drm_pagemap_migrate_unmap_pages(struct device *dev,
>  {
>  	unsigned long i;
>  
> -	for (i = 0; i < npages; ++i) {
> +	for (i = 0; i < npages;) {
>  		if (!pagemap_addr[i].addr || dma_mapping_error(dev, pagemap_addr[i].addr))
> -			continue;
> +			goto next;
> +
> +		dma_unmap_page(dev, pagemap_addr[i].addr, PAGE_SIZE << pagemap_addr[i].order, dir);
>  
> -		dma_unmap_page(dev, pagemap_addr[i].addr, PAGE_SIZE, dir);
> +next:
> +		i += NR_PAGES(pagemap_addr[i].order);
>  	}
>  }
>  
> diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
> index 1d5919a99139..ef18d98dbc7e 100644
> --- a/include/drm/drm_pagemap.h
> +++ b/include/drm/drm_pagemap.h
> @@ -6,6 +6,8 @@
>  #include <linux/hmm.h>
>  #include <linux/types.h>
>  
> +#define NR_PAGES(order) (1U << order)
> +
>  struct drm_pagemap;
>  struct drm_pagemap_zdd;
>  struct device;
> @@ -173,7 +175,9 @@ struct drm_pagemap_devmem_ops {
>  	 * @pagemap_addr: Pointer to array of DMA information (source)
>  	 * @npages: Number of pages to copy
>  	 *
> -	 * Copy pages to device memory.
> +	 * Copy pages to device memory. If the order of a @pagemap_addr entry
> +	 * is greater than 0, the entry is populated but subsequent entries
> +	 * within the range of that order are not populated.
>  	 *
>  	 * Return: 0 on success, a negative error code on failure.
>  	 */
> @@ -187,7 +191,9 @@ struct drm_pagemap_devmem_ops {
>  	 * @pagemap_addr: Pointer to array of DMA information (destination)
>  	 * @npages: Number of pages to copy
>  	 *
> -	 * Copy pages to system RAM.
> +	 * Copy pages to system RAM. If the order of a @pagemap_addr entry
> +	 * is greater than 0, the entry is populated but subsequent entries
> +	 * within the range of that order are not populated.
>  	 *
>  	 * Return: 0 on success, a negative error code on failure.
>  	 */
> -- 
> 2.43.0
> 
