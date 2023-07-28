Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0F19C001DF
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jul 2023 21:26:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 538C310E042;
	Fri, 28 Jul 2023 21:26:51 +0000 (UTC)
Received: from mgamail.intel.com (unknown [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9430710E042
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jul 2023 21:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690579609; x=1722115609;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Mu8DetRaHmIfg4DbJEm9H1K1oXQubtMtdV59sHifHiA=;
 b=c4UaETf7z+Wryjo428fltjnO+a0BA4Q8HNjm+B8VxJ5xLtqJmkNJNKMu
 wIx6QiEkQ9qP/NDGcSGz+5sRDn6/90rGU00CLaDCqjn/x2YCscsJ1Wfn3
 O9+886m05UMEoixjG+1w7uiZ9gowSVZS+jeVquKm0Szso5fQp1vV7Cxz8
 rydiqR0hOi/gc+h4x4vwtCVNVLvNiHTQKjfDPNEew4zfkcAXw9Sv3QQTT
 bRyICzfwMPuxcu0dy4lJ1AO09Qr0s76KCFrwLEKh9Rs8ImJDI+qXDamQv
 hPyjvDTm98UtTcf9h5W3ltbNgoRf4oRxB8et1018dhgcbbbCBZdLKqrNW g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="368697852"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200"; d="scan'208";a="368697852"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2023 14:26:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="851354715"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200"; d="scan'208";a="851354715"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 28 Jul 2023 14:26:48 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 28 Jul 2023 14:26:48 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 28 Jul 2023 14:26:48 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 28 Jul 2023 14:26:48 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.109)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 28 Jul 2023 14:26:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pg7tibkWg5PfBIrEdbmYXYsRxb/sII2qiKohK3CEqr1zFnlCBFOhvimu0SfaGK1Wdg8hq0O0/bAi8MyuLYMKhDYnuj9V5RHQ3jAxC6/nq/Jn9di9wIh4WwVQqLnM7BTBSJA6YUznCK2KlaUQzdWx0yG2IqABSKey2o3MLITCDCNthbRvX+w/1FKIzOkQz64DuAzuBY62KUQMm2Iy9gGXNBST4io+m3FEkBxB/+x50Prr6md78Y9sEvjElQXxFRz0rot/FdaCXW0PVQe8I5GcemdwJH/uQLU8EAwECIz3BGQaNjqiFidqoW2vB9MNQybW763XNpC/W6ECHRhFBDi/RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v3JQS5qam2o6bQePG8JvLgYo3qs6rOY3QuvpZhHOdiA=;
 b=U7BPfoJBvT81ZnQpu8LsDXAyLB+V979kofHt/v/php9o2mlKAvvD3XzYocRi59ignuDvb3bHvHtB34SL9jrPbiIpgxNS8DVpusC4mW/NW8BSAMChROnTNr1MSWQkMiwqfo0b178B5SalUTLo0TrMoe7pB4PQmV4huunx7LZDay/jUkH/rMObm0Q3v8G6wYIyovJMP5URdvvivG5sUKvamQwh/kbn4FpUaq+ii+1qwFKTwaEE8lNPef6d5ukBatKJlMG9jF0mYAdRAKvtKoUuaVX4PP9RWH3/oyOilsk3AI0Qt/utCL4jrXzvryYe57So2iF6OKUDesKmBxZmlWBeTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SA3PR11MB8021.namprd11.prod.outlook.com (2603:10b6:806:2fd::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Fri, 28 Jul
 2023 21:26:45 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41%5]) with mapi id 15.20.6631.026; Fri, 28 Jul 2023
 21:26:45 +0000
Date: Fri, 28 Jul 2023 14:26:42 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <20230728212642.GM138014@mdroper-desk1.amr.corp.intel.com>
References: <20230727213745.430938-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230727213745.430938-1-rodrigo.vivi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0367.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::12) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SA3PR11MB8021:EE_
X-MS-Office365-Filtering-Correlation-Id: 21f7ccd2-0565-4600-72df-08db8fb157d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 35+cLVU9Bx0TVF/mf7D7a+CVRo/M+em84YsOte/9o3M3zh+vQ2MIjdLNa8Q5XbQMwfUtc2ICHCaziQdAfDQJcbcJ9oIDI/g09zdDiZgN0VGL0tkhV6GqaY07dbKldHPvirTaxzuXYS+P941SMNp3RGnWMncPOtLMYwZat5CLEY/M9RFlcu1ufOWX7upD3h2Ngiqb2OX2Sa62CJaptrdxj9mXeaN8M14m0mN7UaxC5BtuUgyblNHATFw0oZtwTcv+AivgpqQsxuUrvkzLPdwVbn+P0ANPnRlcKpM+/qMewBcxds8rHFclZXuPYPQG5k5lXiXsZn9zUjgrkxRbzcFM9JHv9F3yZcsma/ZVZ6qehJmwJN0cVyAgX79UcGT9lk1gv76wGdYjHwU4iHdtMADO//k/eQqjbGq+Axhn93nGhYrn3+NAG+/VC3J0Vyqf1njE/forZVW08aBGXRTpTwIvradCCK83rUoRM/V3n0wxK2YgrR+iFjIFYM3yq6OoHHtoQfppXcU3gDuxqZQ2X36gIdaSNcN7xLUMDIJjepxigB6+OJOqNxZb6b9F8c41FY1xyd/R9Ob+F7LLpGIPNQmBpa2dccS3gUcA6MtcNqOaiao=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(136003)(366004)(396003)(39860400002)(376002)(451199021)(83380400001)(478600001)(316002)(8676002)(33656002)(8936002)(6862004)(41300700001)(2906002)(82960400001)(86362001)(66556008)(38100700002)(66476007)(66946007)(5660300002)(6636002)(4326008)(26005)(6512007)(6506007)(6666004)(186003)(1076003)(6486002)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?moCJd1bQYX/uWT6g0kGxh1sLczgOw39x37K95CsVZ9hk8n2uZB19abZyKxdS?=
 =?us-ascii?Q?C8ZUDAsZDrx+gwJgxetz8bxfmzdgrA6OW6oDL+J50M2/zdCoS4bp3E+HviY5?=
 =?us-ascii?Q?qFnlbkYHXcNNR2ObXpW5cXpre7BNZdgcbythAyUoLyLetUNNPoGOeJGUjoz8?=
 =?us-ascii?Q?gniHmdQBlwBkUVX3iIbhY7TjJrT70iPS0YrQUznM5ML1T+ycUh381lIntPhh?=
 =?us-ascii?Q?iHkLRAKEfhOHDORwbwIuksFgM0gFsA18pnqjz2jcEQYLPJI3D2feFc3YQpGz?=
 =?us-ascii?Q?pkeCr+DYbsXAQ1HvyxWfGNoqOGnHb6OqbgpvqpXbnzKA1p7XRgk3qhulGZ4I?=
 =?us-ascii?Q?7V+vQh/lfkzqfI2KMlMUUqdZ3TqJNHXT9ulr65Iq+KROEdSHuUe8TpfvcM8F?=
 =?us-ascii?Q?YeslyUlPoCFg/5CVyDKvsRXiq6cnMsFyhAh56CzqDkfVNsKhACX+8XZMO981?=
 =?us-ascii?Q?2W8GapXzUvsGZGT7/aBhD8sw2uizdRyyT6OyWMKrLaz+yhDIC5EnxS5pAybl?=
 =?us-ascii?Q?NdxouPokaZewzjv8BIBRhWdy2/gBPXjCrBpa4yXpNRtSXwDzmjtrxv9UQfIQ?=
 =?us-ascii?Q?2Ozs1uAgPxWU1XqusqpWsxRccuLqtLxoAlWwKHsozJmBRGgaUS+DSjetPA7O?=
 =?us-ascii?Q?aj6xKGrxUcksZiYx4CM1vSHpye4SrndAnMdmOQ+PTDwFKI59LQYEx1mVd9gx?=
 =?us-ascii?Q?c9T6e/hhg1UZlvVFhTrYD2XKBOjDuDOphDFdZdHxyy6dhUPfTJkCh40Tka8F?=
 =?us-ascii?Q?+Dgx1g0sVB1pd2exE5eCJESw9Dlw9iZNJqOB4CtHiUA1IJwC70DJMe/lEozh?=
 =?us-ascii?Q?lyVAzo+GzqioKxBmGDmbkm/vl5+j94RgvttknOTe5B9NpYPn5XM2cYCklysU?=
 =?us-ascii?Q?CPNjuseVGHcn6WynD+hb1VgIjHlDTmUy3twXISkUZJKeh5F7C5q1Ju39us+k?=
 =?us-ascii?Q?+tmoqtFMFCliQJnWcR8+IyfT7SmKHYTcc1IciEAoDdCwi7dHSTAUMBZRWkc8?=
 =?us-ascii?Q?p8lN0WM3LAmX9NyCN30D6tGyYEYPZWgMtHBeZiyLzOV2kjjPTsYxqtAlj+3T?=
 =?us-ascii?Q?R1KdHV/+5EM7sU1iVIgMDamxUe8wVLwB/fGRvvQsGfCty1omamFI6QNaw9/E?=
 =?us-ascii?Q?HtZhtvmeU8rPPzMM463CjdXH58wr6kYd9JW9vM7VVg4S8lz0qW/+2B+nie4b?=
 =?us-ascii?Q?torIKCM9flbrC0dNnZ1f4zPvRL9Cs69Uq6ezkzqqKS9T/kebS74DBLRK9EVH?=
 =?us-ascii?Q?2TyGQ1MZnR0spzJJTJj0BrWxa/dprh5cjHQetzYLlPZaETPRpF63nzCHeova?=
 =?us-ascii?Q?5fEZFnGiwGcrtkYSvxHzMWKc/jUrQU5TaxqiQe+e2YI4027HapM/Z+WZ+2+E?=
 =?us-ascii?Q?XQL6xG3nnwe5K4PW7KfCa9hsxOSYBXng9CEi3i1AjQNBmvUKPIkh5OW8pS2B?=
 =?us-ascii?Q?HoB0aBWw9IHdkdHmbrzOmwcw2ic6EZjv7KPZQhF3DFjR4ss0ciriTS+h2huO?=
 =?us-ascii?Q?x/kSj/NumAutotA4/1h1xPCvNmU/HfCGMoovrHMa4R9Xopbtzv/cEATqwgi8?=
 =?us-ascii?Q?miVMYlXnKi8KG098jHBXjU6k9oKyAMG3TF2Ze8HnPcW4kiF4FFOVfVc2MhI7?=
 =?us-ascii?Q?1w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 21f7ccd2-0565-4600-72df-08db8fb157d9
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2023 21:26:45.0709 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6NyQ6i5Pd+QF08GQxAzGDohMEfuyCEkEzCty5INN59KjRi6JwQ7AX8OCv/iA01cKKa5Z4PsHgHB4BC586hxCitYWVwc6zlEac6QFE72LrzU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8021
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Fix and clarify PAT Index selection.
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Jul 27, 2023 at 05:37:45PM -0400, Rodrigo Vivi wrote:
> PAT selection here in the Xe driver had inherited a lot
> of history from i915 and ended up with some strange cases
> like doing logical 'or' with 0, or even unnecessarily selecting
> pat_index = 7, instead of simply opting for the 0.
> 
> XXX: More work needs to be done in MTL and PVC for the right
> selection, starting from the fact that pat_index = 2 is now the
> uncached and pat_index = 3 is WB with some kind of coherence.
> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.h      | 24 ++++++++++++++++++++----
>  drivers/gpu/drm/xe/xe_migrate.c |  4 ++--
>  drivers/gpu/drm/xe/xe_pt.c      | 10 +++++-----
>  3 files changed, 27 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index b29750a47d23..8c80c0784010 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -37,10 +37,26 @@
>  #define XE_BO_INTERNAL_TEST		BIT(30)
>  #define XE_BO_INTERNAL_64K		BIT(31)
>  
> -#define PPAT_UNCACHED                   GENMASK_ULL(4, 3)
> -#define PPAT_CACHED_PDE                 0
> -#define PPAT_CACHED                     BIT_ULL(7)
> -#define PPAT_DISPLAY_ELLC               BIT_ULL(4)
> +/*
> + * PAT Index Mechanism
> + *
> + * Some bits encoded in the page table entries and directories,
> + * are put together to form the "PAT_INDEX". The value of
> + * PAT Index points to some cache options such as:
> + *
> + *   PAT_INDEX = 0 --> WB Cache
> + *   PAT_INDEX = 1 --> WC Cache
> + *   PAT_INDEX = 2 --> WT Cache
> + *   PAT_INDEX = 3 --> Uncached
> + *   (The full per-platform table can be found at xe_pat.c)
> + *
> + * The bits that form the PAT index for PPGTT are:
> + *   PTE     - [62][ 7][4][3]
> + *   PDE/PDP - [62][12][4][3]
> + */
> +#define PPAT_INDEX			(BIT_ULL(62) | BIT_ULL(7) | BIT_ULL(4) | BIT_ULL(3))
> +#define PPAT_WT				BIT_ULL(4) /* PAT_INDEX = 2 */
> +#define PPAT_UNCACHED			GENMASK_ULL(4, 3) /* PAT_INDEX = 3 */

Which index corresponds to what behavior is platform-specific and will
likely change with every major hardware change.  We should eliminate
things like PPAT_WT or PPAT_UNCACHED completely.  If there's a
platform-specific PAT index which is used internally by the driver in a
bunch of places (e.g., "give me fully uncached behavior") we should
cache that index in something like xe_gt->pat_uc.  It can't be a
driver-wide constant.

Generally the PAT selection is either going to come from userspace (and
winds up getting passed all the way down to the pte/pde encoding
functions), or we're working with some kernel-allocated buffer (like a
GuC CTB or a golden LRC) and the exact characteristics that make sense
need to be selected on a platform-by-platform basis at init time.

>  
>  #define XE_PTE_SHIFT			12
>  #define XE_PAGE_SIZE			(1 << XE_PTE_SHIFT)
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index aad76a6a8094..5d33ee1aa3a0 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -257,7 +257,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>  
>  		level = 2;
>  		ofs = map_ofs + XE_PAGE_SIZE * level + 256 * 8;
> -		flags = XE_PAGE_RW | XE_PAGE_PRESENT | PPAT_CACHED |
> +		flags = XE_PAGE_RW | XE_PAGE_PRESENT |

Although a constant PPAT_CACHED isn't correct, it also isn't correct to
just leave the PAT index as 0 either since that will result in different
behavior on different platforms.

>  			XE_PPGTT_PTE_DM | XE_PDPE_PS_1G;
>  
>  		/*
> @@ -465,7 +465,7 @@ static void emit_pte(struct xe_migrate *m,
>  				addr += vram_region_gpu_offset(bo->ttm.resource);
>  				addr |= XE_PPGTT_PTE_DM;
>  			}
> -			addr |= PPAT_CACHED | XE_PAGE_PRESENT | XE_PAGE_RW;
> +			addr |= XE_PAGE_PRESENT | XE_PAGE_RW;
>  			bb->cs[bb->len++] = lower_32_bits(addr);
>  			bb->cs[bb->len++] = upper_32_bits(addr);
>  
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 3129fdb0551c..20f2d1139e8c 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -65,10 +65,10 @@ u64 xe_pde_encode(struct xe_bo *bo, u64 bo_offset,
>  	pde = xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE);
>  	pde |= XE_PAGE_PRESENT | XE_PAGE_RW;
>  
> -	/* FIXME: I don't think the PPAT handling is correct for MTL */
> +	/* FIXME: the PPAT handling is incorrect for MTL and PVC */
>  
>  	if (level != XE_CACHE_NONE)

The important thing to accomplish for these encoding functions is to
eliminate these symbolic values like XE_CACHE_NONE completely.
Eventually we should just take the PAT index as a parameter and encode
it directly without trying to interpret what it means.  The upper layers
of the code (and/or userspace) are the ones responsible for selecting
which index is actually appropriate.


Matt

> -		pde |= PPAT_CACHED_PDE;
> +		pde &= ~PPAT_INDEX;
>  	else
>  		pde |= PPAT_UNCACHED;
>  
> @@ -86,17 +86,17 @@ static u64 __pte_encode(u64 pte, enum xe_cache_level cache,
>  	if (unlikely(vma && xe_vma_is_null(vma)))
>  		pte |= XE_PTE_NULL;
>  
> -	/* FIXME: I don't think the PPAT handling is correct for MTL */
> +	/* FIXME: the PPAT handling is incorrect for MTL and PVC */
>  
>  	switch (cache) {
>  	case XE_CACHE_NONE:
>  		pte |= PPAT_UNCACHED;
>  		break;
>  	case XE_CACHE_WT:
> -		pte |= PPAT_DISPLAY_ELLC;
> +		pte |= PPAT_WT;
>  		break;
>  	default:
> -		pte |= PPAT_CACHED;
> +		pte &= ~PPAT_INDEX;
>  		break;
>  	}
>  
> -- 
> 2.41.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
