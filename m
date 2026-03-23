Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95DD4F483D8
	for <intel-xe@archiver.kernel.org>; Mon, 23 Mar 2026 17:23:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51A0B10E13E;
	Mon, 23 Mar 2026 17:23:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ktcuCEgC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1CB710E13E
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Mar 2026 17:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774286627; x=1805822627;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1iZl4LTvmQuIsnB1araxOgu9Qnp4Gb78MkzGYDkkNeU=;
 b=ktcuCEgC2BABPvqBIzzJff3loRASB4qbcAcVl4K4N1CCjjlcZdqWAfH3
 b659EWH5FzjXsvzYOcQ65fHswTYxcl39gb0qGzAZmu9F1HDIS1TP5kh/M
 Ut72w1GntY58SomZSfLuYHZe8lobp8kbuDRVSajpZyvVTme1o7bT0yICR
 Bw6RVILsxfMdQk5ns96CLOmcWwBGOWd++84lzUu5pnlueoWK8V5v83nvX
 HoXorcEp3ymsngAOElXtjye3e2rl10Gk+XSM1VFxI3Fy/6/zmuH5izyyG
 tr+QdJG02N5ebMp5GKqB79DsMOjWUt8ch/ICDw0GpYFOKfHC2uCIblcap Q==;
X-CSE-ConnectionGUID: Xepq3eM/RmWNlcANI+WWrg==
X-CSE-MsgGUID: Q9SHy6VDSK2k+l1/F3J6ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="75482865"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="75482865"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 10:23:46 -0700
X-CSE-ConnectionGUID: k/1/kRD4RQ62lsBxG7AqxA==
X-CSE-MsgGUID: kycJnA+HTbm9DedZV3uaaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="228568896"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 10:23:45 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 23 Mar 2026 10:23:44 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 23 Mar 2026 10:23:44 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.59) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 23 Mar 2026 10:23:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IRgFqVUklfHb6GIzvaJvwuWE0qDt36hOww22ZE2SIWSVvajse0nEI1ckX1DABtN3kZgSLdObioQD7DqE/1cVkZFWviSooBG9TmBZ26RL7XhoXcpNc9tfg9/KNOJq2q7ucU6wFNwGiLTMgGjcOzxlvPPyJepNTVorkGIZnb1UtEifNfDvxhWR7RDTB6KwAem+MfVu5NpFvXSQWWtzk3143e6jZSusbVYDIm293c+/K9UXGJ5lpHDt0lClEmc4Qr9fQLwy2ar+O0WvwmP1MXL7JNNzrBDE6M+qifoybqQWeuCEtzpyJGm/tHTkFOymfzonWt9mWpwMNrn5E4Wi557Iyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y/PPVBbfOe7btil6rEo2Khpmp9AcU9bothlzxTaQznw=;
 b=eb5u5Faw45XZqgqfp/O/OB+T+pAJT6jGE0N3sWK0xzgt/vH5j/FxudpzHyObWJ2ZCSDWSClJXYMuwCklYbXpSGCw6st7/ymN+bUrz/1hccMEzrhNvHGSE6aWHp+1u+es7nIt8jqbQsWJbgm4SFVTMXlVLB+afpwK3iOB9fApGd3OwNv4CB/z+GVQqplpUwLdtYaOEZK5ro67My2N+Z1AVh8Pk0OFPECg0uXtkMe43JFrNkur71SXVL4MtjlMEKU26e38bW4kO2gfukC5anCzAon2UJ6ghOAI2A+D8l9ICAkjI38Mqgf3kk+1WRgLgPQmXNytZWYLAmILxjX949WK/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DM4PR11MB7759.namprd11.prod.outlook.com (2603:10b6:8:10e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.15; Mon, 23 Mar
 2026 17:23:42 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.20.9745.019; Mon, 23 Mar 2026
 17:23:41 +0000
Date: Mon, 23 Mar 2026 10:23:38 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Stuart Summers <stuart.summers@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <niranjana.vishwanathapura@intel.com>,
 <jonathan.cavitt@intel.com>
Subject: Re: [PATCH] drm/xe: Add min and max context TLB invalidation sizes
Message-ID: <acF3Gp800SnB/g5D@lstrano-desk.jf.intel.com>
References: <20260320204635.94924-1-stuart.summers@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260320204635.94924-1-stuart.summers@intel.com>
X-ClientProxiedBy: MW4PR04CA0175.namprd04.prod.outlook.com
 (2603:10b6:303:85::30) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DM4PR11MB7759:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b888ab1-09da-4d00-5a2d-08de8900edc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: W3GT/pfTVAD+OlD66VLvkGRu/sPGEjBnLzzbgbtK90JVHxG2y6gq+8rZjREZHouPz1Isbf3uJ9i8zZtQGcZFdSLjH9r4Mu3L0XiMDITMvqr/Mh8EHlLz1qJ8oO/CT9Zz7TvKa/EGlgpMpX+z89yWd1c4Khc7DanNxk8fxrJsHlQBWgUAjeMuB7l7OTIAVFfZQZJQnLjnGpCYBiDqQLAmgr1r8S0d2Mwi5SjtVP6h40sqG4LDigsw92QiZ4SX2fQF95mofXz5q27NO1gu8JxLgerIqiozh4Xv7pKAtMIcOQ27E4LI7cfwDighIdKRS8NjV5DaMEs1Niv6bxlfcY0fWOqlLRqBVTY1KubJQpjfNz0OUsRAfwTJzDRKyn0ZZSZ/JFt1QN+8LKDoxoti+SSLhkEbwEmIUAk1quQ6bmtQxvFUOCpwI5gITtt+brDfm90ETN5nN5pU0YOCge3HTGtvEeG9yswA/q0Iw0hhcu7oJE/5AENXumXx/ujMDCFkaUYAzcKAmMj3U+KdmEJ577YdDqpRC4c5w3HYKdlGuKVS+UJVBG5lodGhKZcYfOpjTd1Oz35/qn/4DxDiidGneW1Ase1Gm2h79Ix/WGFNsHT+EUgRdL4rTNKq5s/n5BdxLmzD25XPJX0/XaGDRvA6IxEFzu+cepxkVaV0HZPsSAa1Af0FgPuFEYVaHvvRNKVv7mk00q+9UyuXLTEQ2fx8/KgmqILzlbXTtn9RUEUXjXiGEpE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?y+pZt6WKLYFYBUgyqBOfWczDVdzPqE8Q1go2pjkAbZMaJ5o3UCxIvJQRRxt6?=
 =?us-ascii?Q?/6Uny50aZZh493sDdyAWBEkc7n/UEI03aLhOb1RqxuowJuNQAzCd8YNkBF45?=
 =?us-ascii?Q?Bd/xmsccBmkdgrCDK/iabHRjRzyBOhF3IRoscJOmwf9WvpoAsL46lSuJnGHi?=
 =?us-ascii?Q?uuh1Q3Vxq9SZVNd5cXkFD239uGosATivIwzCOMGPg0kOlETYvc87mKyfqTLU?=
 =?us-ascii?Q?6iv467esYPVtjdYi5KJyk18s6iNwJ/6tdRuzurJ50gYxegK/OJd6LpyUtDNV?=
 =?us-ascii?Q?XBxfOIxKWxo3U8vPJKdpJBv/VzhSf9dDZOWO6wp8cbv7N7Npj8UT8F0ly+DF?=
 =?us-ascii?Q?MmgO5FusB2zlt6nYA8DpIW3Y+pf0hstA2daJqRPYcZqZbt/mFfbkU+euTB2f?=
 =?us-ascii?Q?rLPrlWEBatyjjQ1h3HeZ3SV8wSqxGrXXPmH1F58Pg3TG1eR75PLt+HIpR//k?=
 =?us-ascii?Q?CKiKj2Ega8vbPbG1A+eJL3FS492rGBvppTdFlAp5EJkrjlRtyfTnkFmT01Cm?=
 =?us-ascii?Q?5lwt+m34h4PvDzF/X0qW1VS2qRZOMxEEhvQcvTRou0xdYBqK8cwUSTtCI1M7?=
 =?us-ascii?Q?damC6ZigEAP5ijW3moNo+N+bmbynLekWYWgCxe/9aySV+4HGPfhTPLjcysS4?=
 =?us-ascii?Q?V1bC4zIpPUalZTHGxxTZ2fRnAP5/L+NlODq7NYFGwHmdooRfbN5hbf6qEUkN?=
 =?us-ascii?Q?56BW3vAJeVqsIN2jr89ktog1dtNAZNbLJD8QQm61GJSX8gmsVeLlw2m9gncH?=
 =?us-ascii?Q?N+6Z5TgzEmUEGQsidYGtRKJC5cZC3CQc3Ca/uwzSJ2w4wIEywud2IWT/NHhy?=
 =?us-ascii?Q?iqd64KIBvFfUoXENl2XX4L2uIBqkS4MYWXuDrqDSzB5VzjKPRI5nCV4JFXNf?=
 =?us-ascii?Q?4cOV6aDiNGoIp6aIpLJFq1TXFIshWr9QW1pdP0VTtbTPlPxR/cdMq3QKv3Fg?=
 =?us-ascii?Q?50GrWaDWpTLDtWHAUSxK62drLKgiz9l1F/kGdHx8s0JTHAAanzj4HLSuT/5y?=
 =?us-ascii?Q?oYDUTHSWAtxUaaumhwJBbcGPbu4H5w/yfo5Vsvgf1W6K2fv3KHNn6Ojnzp4R?=
 =?us-ascii?Q?yNEQwoUcMuvNUbn7aPdSRWsFwIZyErnZ9OW0Q+EjizgLvqrp41ZrYYRpUK3o?=
 =?us-ascii?Q?cU18FVSUmrApjMEUtMSEQj2O13hlyHrD3qJ8zID3WdzdxYy+s92CxsLlZw3t?=
 =?us-ascii?Q?0tnq84zqsKU7nhFGVzsq3FzGM7HOW0RLpeu8hHqdYNdduFtaWrdUjHIs1hNk?=
 =?us-ascii?Q?0yyEyAGfJ68E6bkw+VqtTmVffa3sBucwrTT5kf6dHma2GB6L59jigm6ab+9z?=
 =?us-ascii?Q?WTu+0PtJ/yJ1SlO4O8jzRbOruK288yboZn29TwGhOYO4ZjyDzYnDcYLaiXdn?=
 =?us-ascii?Q?ZDx0r8fMUzzdzxHAgJS+jVZ1M+g2BCqof73VoKu++/YVYCuqrOIp59JQACZw?=
 =?us-ascii?Q?38hm6W17Vkvpgf/rcYV9trTecU1GOctpSKI+6meIVsSmez87OU1K2QadY5Kd?=
 =?us-ascii?Q?Gt3zF+T98tpsDNif0IjOFKx/VEU3n9HeClPr9/XyFkmZehQIIqTj3d/3q5IG?=
 =?us-ascii?Q?vHhQEOR1x5n7b89wZM1wCyJ4OrrvL0MGFLEIk28xQsP9ZoPmYnJ3klV1Cj7f?=
 =?us-ascii?Q?eS8ILnekXtcImBKe1X6z449nUYahNrIh5qvEotHrYJiT56bjabhLF1QLlMAk?=
 =?us-ascii?Q?ygvvSKYvV4FnUqld3UtcLIz5CMp8nO5R76VUltmSUtoIsunWEfqUPYhNcy2R?=
 =?us-ascii?Q?XKJ0e9brig=3D=3D?=
X-Exchange-RoutingPolicyChecked: GR7jYZZ75Ydj8p/dSsL9QFTLLCt9MWgLGnjl3ef9o6apXF/L2q8aWomB81dV+f7AsJ13ze0xlIcRFruIp5qvLYEH0lUT7dWCkK+KagjJRsooH84Op+zT4xXgzWsuZQf6bXK1i2HyOsp4XGSMC4tJTC/6eLlm04geV6cdWRGeE4zUS2h+0X7h+vq+xDqZZ0ATl/je5CN0lHcUkYVfNRs1fqu4KjXqbG+BBxBrd+t+YJYSQeCjYRri0SoqwUMs1CMFrnaRAiW4ukTeXwE/9X/46bPK/dCSLkmi9pM/rG2pYiBzcMwxYm4Sk3Y2v6oWaF3qSzMcOyERGRlMYbtUjoQuig==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b888ab1-09da-4d00-5a2d-08de8900edc9
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 17:23:41.7924 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sxnd5AlNOYctCuWsgedfMNcuZXQUEmpLx2gX+JHx0qIVdkWI2ptSiKPkJYvPAkG5/klxscNxouWBq8+nxz+L9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7759
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

On Fri, Mar 20, 2026 at 08:46:30PM +0000, Stuart Summers wrote:
> Allow platform-defined TLB invalidation min and max lengths.
> 
> This gives finer granular control to which invalidations we
> decide to send to GuC. The min size is essentially a round
> up. The max allows us to switch to a full invalidation.
> 
> The expectation here is that GuC will translate the full
> invalidation in this instance into a series of per context
> invalidaitons. These are then issued with no H2G or G2H
> messages and therefore should be quicker than splitting
> the invalidations from the KMD in max size chunks and sending
> separately.
> 
> v2: Add proper defaults for min/max if not set in the device
>     structures
> v3: Add coverage for pow-of-2 out of bounds cases
> 
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_types.h  |  4 +++
>  drivers/gpu/drm/xe/xe_guc_tlb_inval.c | 39 +++++++++++++++++----------
>  drivers/gpu/drm/xe/xe_pci.c           |  3 +++
>  drivers/gpu/drm/xe/xe_pci_types.h     |  2 ++
>  4 files changed, 34 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 615218d775b1..0c4168fe2ffb 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -137,6 +137,10 @@ struct xe_device {
>  		u8 vm_max_level;
>  		/** @info.va_bits: Maximum bits of a virtual address */
>  		u8 va_bits;
> +		/** @info.min_tlb_inval_size: Minimum size of context based TLB invalidations */
> +		u64 min_tlb_inval_size;
> +		/** @info.max_tlb_inval_size: Maximum size of context based TLB invalidations */
> +		u64 max_tlb_inval_size;
>  
>  		/*
>  		 * Keep all flags below alphabetically sorted
> diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> index ced58f46f846..e9e0be94ceef 100644
> --- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> +++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> @@ -115,14 +115,23 @@ static int send_page_reclaim(struct xe_guc *guc, u32 seqno,
>  			      G2H_LEN_DW_PAGE_RECLAMATION, 1);
>  }
>  
> +/*
> + * Ensure that roundup_pow_of_two(length) doesn't overflow.
> + * Note that roundup_pow_of_two() operates on unsigned long,
> + * not on u64.
> + */
> +#define MAX_RANGE_TLB_INVALIDATION_LENGTH (rounddown_pow_of_two(ULONG_MAX))
> +
>  static u64 normalize_invalidation_range(struct xe_gt *gt, u64 *start, u64 *end)
>  {
> +	struct xe_device *xe = gt_to_xe(gt);
>  	u64 orig_start = *start;
>  	u64 length = *end - *start;
>  	u64 align;
>  
> -	if (length < SZ_4K)
> -		length = SZ_4K;
> +	xe_gt_assert(gt, length <= MAX_RANGE_TLB_INVALIDATION_LENGTH);
> +
> +	length = max_t(u64, xe->info.min_tlb_inval_size, length);
>  
>  	align = roundup_pow_of_two(length);
>  	*start = ALIGN_DOWN(*start, align);
> @@ -147,13 +156,6 @@ static u64 normalize_invalidation_range(struct xe_gt *gt, u64 *start, u64 *end)
>  	return length;
>  }
>  
> -/*
> - * Ensure that roundup_pow_of_two(length) doesn't overflow.
> - * Note that roundup_pow_of_two() operates on unsigned long,
> - * not on u64.
> - */
> -#define MAX_RANGE_TLB_INVALIDATION_LENGTH (rounddown_pow_of_two(ULONG_MAX))
> -
>  static int send_tlb_inval_ppgtt(struct xe_guc *guc, u32 seqno, u64 start,
>  				u64 end, u32 id, u32 type,
>  				struct drm_suballoc *prl_sa)
> @@ -162,8 +164,20 @@ static int send_tlb_inval_ppgtt(struct xe_guc *guc, u32 seqno, u64 start,
>  	struct xe_gt *gt = guc_to_gt(guc);
>  	struct xe_device *xe = guc_to_xe(guc);
>  	u32 action[MAX_TLB_INVALIDATION_LEN];
> -	u64 length = end - start;
> +	u64 normalize_len, length = end - start;
>  	int len = 0, err;
> +	bool do_full_inval = false;
> +
> +	if (!xe->info.has_range_tlb_inval ||
> +	    length > MAX_RANGE_TLB_INVALIDATION_LENGTH) {
> +		do_full_inval = true;
> +	} else {
> +		normalize_len = normalize_invalidation_range(gt, &start,
> +							     &end);
> +
> +		if (normalize_len > xe->info.max_tlb_inval_size)
> +			do_full_inval = true;
> +	}

I suggested this is the last rev, can this logic be moved to
send_tlb_inval_asid_ppgtt / send_tlb_inval_ctx_ppgtt?

For send_tlb_inval_asid_ppgtt it doesn't really matter as
send_tlb_inval_ppgtt is called once.

But consider send_tlb_inval_ctx_ppgtt where send_tlb_inval_ppgtt is
called multiple times and each call fails the
normalize_invalidation_range step (i.e., we set do_full_inval). We only
need to issue one full invalidation, not multiple.

So likely want to hook in early in existing if statement in
send_tlb_inval_ctx_ppgtt.

244 #define EXEC_QUEUE_COUNT_FULL_THRESHOLD 8
245         if (vm->exec_queues.count[id] >= EXEC_QUEUE_COUNT_FULL_THRESHOLD) {
246                 u32 action[] = {
247                         XE_GUC_ACTION_TLB_INVALIDATION,
248                         seqno,
249                         MAKE_INVAL_OP(XE_GUC_TLB_INVAL_FULL),
250                 };
251
252                 err = send_tlb_inval(guc, action, ARRAY_SIZE(action));
253                 goto err_unlock;
254         }
255 #undef EXEC_QUEUE_COUNT_FULL_THRESHOLD

Matt

>  
>  	xe_gt_assert(gt, (type == XE_GUC_TLB_INVAL_PAGE_SELECTIVE &&
>  			  !xe->info.has_ctx_tlb_inval) ||
> @@ -172,12 +186,9 @@ static int send_tlb_inval_ppgtt(struct xe_guc *guc, u32 seqno, u64 start,
>  
>  	action[len++] = XE_GUC_ACTION_TLB_INVALIDATION;
>  	action[len++] = !prl_sa ? seqno : TLB_INVALIDATION_SEQNO_INVALID;
> -	if (!gt_to_xe(gt)->info.has_range_tlb_inval ||
> -	    length > MAX_RANGE_TLB_INVALIDATION_LENGTH) {
> +	if (do_full_inval) {
>  		action[len++] = MAKE_INVAL_OP(XE_GUC_TLB_INVAL_FULL);
>  	} else {
> -		u64 normalize_len = normalize_invalidation_range(gt, &start,
> -								 &end);
>  		bool need_flush = !prl_sa &&
>  			seqno != TLB_INVALIDATION_SEQNO_INVALID;
>  
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 189e2a1c29f9..5e02f9ab625b 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -743,6 +743,9 @@ static int xe_info_init_early(struct xe_device *xe,
>  	xe->info.vm_max_level = desc->vm_max_level;
>  	xe->info.vram_flags = desc->vram_flags;
>  
> +	xe->info.min_tlb_inval_size = desc->min_tlb_inval_size ?: SZ_4K;
> +	xe->info.max_tlb_inval_size = desc->max_tlb_inval_size ?: SZ_1G;
> +
>  	xe->info.is_dgfx = desc->is_dgfx;
>  	xe->info.has_cached_pt = desc->has_cached_pt;
>  	xe->info.has_fan_control = desc->has_fan_control;
> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
> index 8eee4fb1c57c..cd9d3ad96fe0 100644
> --- a/drivers/gpu/drm/xe/xe_pci_types.h
> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> @@ -34,6 +34,8 @@ struct xe_device_desc {
>  	u8 va_bits;
>  	u8 vm_max_level;
>  	u8 vram_flags;
> +	u64 min_tlb_inval_size;
> +	u64 max_tlb_inval_size;
>  
>  	u8 require_force_probe:1;
>  	u8 is_dgfx:1;
> -- 
> 2.43.0
> 
