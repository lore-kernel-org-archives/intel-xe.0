Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59F62CE79A7
	for <intel-xe@archiver.kernel.org>; Mon, 25 Sep 2023 23:27:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23CEC10E337;
	Mon, 25 Sep 2023 23:27:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3814310E337
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Sep 2023 23:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695684449; x=1727220449;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=GMxSVUjcpXkInLMgNT+jq+vBR+7R/Iblqwyp+ASKVLg=;
 b=UjALbZpwJLcmVEM7vp9Mm0DFk3A+ZvsA/HHgW9FlNkyTgBBlME9tOFUM
 +gjrWeG4mMEnRkPA0SMCUd8IPZO+8Bcv8i+PLKtMcQ1rCKhVjT3GLwbEo
 01KJ/8b7DXVL5tyNCpqUPk8NSMziGq6qZfybO6su7sf4yUeEMKPtOFGh/
 iUeRZr49EhZWOql1DO5G/opkTQAE5DKY+55kpLabkjKTuksvpiLk8U1Sz
 8cYzDIKqA+aE9fMv6emTUEFeiC7kvAZs1BjJEVPSVCYwMixFjwcUb/ALb
 jDmXjU06BbhHZAOjJpdk2gM1RHH8NHkfp9he77fnY8LyW6VeBS56tM1Xu Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="380303407"
X-IronPort-AV: E=Sophos;i="6.03,176,1694761200"; d="scan'208";a="380303407"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 16:27:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="838774266"
X-IronPort-AV: E=Sophos;i="6.03,176,1694761200"; d="scan'208";a="838774266"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Sep 2023 16:27:28 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 25 Sep 2023 16:27:28 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 25 Sep 2023 16:27:27 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 25 Sep 2023 16:27:27 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 25 Sep 2023 16:27:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f/+MniPYfQxAUpRU36WS8HO8/ZuBM0wUiuMtXgjAdWTfUikELn3T1MGMinOjUnQAzscFpMTH7KP/jqdtuMit37k7NaUaUL6fiXWa2xD/gGQmGAlHkTTnHSDkzUnWxSRtOQIFzektfk2ad+yWDIeibuGG2yRRf8+bzvwdLa6ExNzF+eb2eDGwWmGy2zaGJNbuaEUaqckWgbmwXTMiFExYyT4eE1uuha93oL1h5oySWxt1uxp23cx0wW9LfNMViPYCpOh27QxX+lefXNgtDBwScZi5D5AWETzR/uluScv4PcN3ILURIVeMvk8IfW3Ki6SznnXHlvx42MduKUKEO9+Opw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LFpb1RWDQJajhG5FMd7eEzbbLsgn59P2nrrojM28PS8=;
 b=LnbTegIVzen+MTfKFWA3hcUeg4NjjTWUuIsqc8O/oC7JU3emvi2GZAtyM1y82GKKlJVVTIkPLQvuf6yaVYywIfWAET/0hcWZVzpVQDo8n699Krpar91m+4RwbVebcwW0BcwJToH2NZ4dy1zmQtGIEiCQ/YtrGfL3Dy9xuwgaPomKc2xDa58X7CfWpyiyO3csTDY4a5NEionbH0KmqJQnCoZd8YPpspLMc4v4oHOoT8SrXL3Fxwd6E00sCJyPLrsmsskalfVE7pGXgzxMoGzTQudy0k/e9pQmsb1vs10OuANDKbpWJMQXPUeqpXQSVeqQfhAaaiQLCJdh4sHCCX6kpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SA1PR11MB7087.namprd11.prod.outlook.com (2603:10b6:806:2b5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Mon, 25 Sep
 2023 23:27:23 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66%4]) with mapi id 15.20.6768.029; Mon, 25 Sep 2023
 23:27:23 +0000
Date: Mon, 25 Sep 2023 16:27:20 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230925232720.GD2706891@mdroper-desk1.amr.corp.intel.com>
References: <20230925221049.2681491-1-lucas.demarchi@intel.com>
 <20230925221049.2681491-8-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230925221049.2681491-8-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR05CA0090.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::31) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SA1PR11MB7087:EE_
X-MS-Office365-Filtering-Correlation-Id: ba296530-c022-44d6-36ae-08dbbe1ef875
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s0UVTkpX6ZBNoJqSmDTb0/uMuQEZVbXyr6E37S0+WRpHa/T4UwWQFRrVKy08cxos/Gv0olWsBR29EaVPxVPAsT0ia+la/TkdYCdCiKAXVo0gFf0iDAlbrlbVCx0wT4lEt0Sv06ElAzFBPgJCxEQfAlIs0kU/8/MKB59Uk2yldNOryFmyveRwMaLn6lLbRed3C1j9GYbzzT9RYKSSkA7nq4N9ephzz6KE14sFySfa89e083W8YDn57fQAAWYX24Qzqt+iOjr/Y2UAIJol5zf9/cQ77efarKAe6tF2USu9T0OlngzslJUNzzbLRMzT03YMh4kx/sMd7VNt4Mrla0xGWBH223aROI2GmvZpRYlwrLacSHR60mCmkT0JzbWU21IO7W3ra1695pvPxLM1t5jRwnviG18d+pFYv4paN9vhU19gzqW+pFajERsgIiYAFbfvoQ1J/h4/+Op3bDkSCrI0aq2MESCcJda9oa9lJJBSNVfEQFSVRgavCsqj8L678E5XF92RsErCJPhw1LiSbfDBqtHDP4BtDbCMIpmv2nsbdaJj9CNvFvPYLJ8qbDaBkBFM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(39860400002)(366004)(396003)(376002)(230922051799003)(186009)(451199024)(1800799009)(2906002)(86362001)(33656002)(6512007)(6506007)(5660300002)(38100700002)(83380400001)(82960400001)(478600001)(6486002)(4326008)(8676002)(6862004)(8936002)(1076003)(107886003)(41300700001)(26005)(66476007)(66556008)(66946007)(6636002)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CkexQATHPgFQsuLyV/zOmCsZI1nh4j9mFQP+DovS7pPteIUctIx2Ft+HDJWx?=
 =?us-ascii?Q?QXduRV2E3k4d9OjK6043mpR2NN7pQQ3HQFIdjAD8sB0uQknh1ldEexvoOc3A?=
 =?us-ascii?Q?k8PPFSQQXosPRrQrvCtIDbulrornh8BXgm6+YGK1uKpDCjIUwgeP7GgGHX8o?=
 =?us-ascii?Q?/oZinzJZlYq4QCk36bLfnsxkuuWn0uc1BCaD+qMCQ21m7Mm1680pTVnTrsFw?=
 =?us-ascii?Q?hzdZKg3gxIT4cj9s+AW5Jucciw6uZH7UawlY+FJcRrYPxbQ9uFKnMgw3YJOU?=
 =?us-ascii?Q?h3V7zw+AIjwxvPAyhsYR9WyNGKUQHCLiBKEQ8s1QjOd+iu7Ktm2WU+rE85Hg?=
 =?us-ascii?Q?u0fdeNdsaSKWbwDR/yTrThppruzAuvoNdRTVPnUiG2z1E5Qm79c0+NzPHwZQ?=
 =?us-ascii?Q?joomB0rQHoF0ZIMGxGNUchffxtiOFrc+IZFpCFWRLsWwIVbo7uu8xpzhRCWO?=
 =?us-ascii?Q?hPchziHAzPFbNfMEsXvAM/riTo130WswKshjtYwOlOi3tHLiyOLqJaVdTOfG?=
 =?us-ascii?Q?mjVVJHTjbGviyDS1KLWD7sJ/DRr3vXvXEh/xK4rnt01Aa2kBFAd22izhTxnB?=
 =?us-ascii?Q?ytN7cY0QHXmGytUh3PccztZG4Zm1Cr+W0FOyddOn3rXbBJJWA2UXTHTjV0oo?=
 =?us-ascii?Q?o3plu1Lzfn08MVSkKH4Sec+JW6f2OVDfJpgTZNSWoWhyonf9OhjiYMO2lxiV?=
 =?us-ascii?Q?Yz2fxWTXEq4N2BAn7fDIVLpPwJg5Z+3YvnUAhrn93FXfNQz+hkJ4utPEn8ds?=
 =?us-ascii?Q?T0iYcI8RVP1xUs7Ufg7e/MsBQ6tjjbPI4pOn5v405y4W5trNMrtzfNMjllcq?=
 =?us-ascii?Q?GZuUPcAkjOQy8XtEfgamsQOKxFi5gP1g8yGQ+4IAe3EdkooKN0hkKNq/F77F?=
 =?us-ascii?Q?+5XEiXMajQHCDnLRi3dvcoEAewEDsitTgnUvg+8VAESwExeV+kSGfW4AlcKQ?=
 =?us-ascii?Q?4MRGMTEt/qDOx8043dCQ0UiKLrMdTR2WKE9dYB1RDn6ycIz0TjuRgDBXIijw?=
 =?us-ascii?Q?JMej8lMq5AF0+55aFmh4bbLeDcNN7km2hZOlrBJB0mUUOvocLIN4A7gxLKMc?=
 =?us-ascii?Q?khRNlbSJnwmLpyyZ6SGsQX9A4aHjuQuSwE/kVW2B0NY/zrvohVEdQIk0orz9?=
 =?us-ascii?Q?EDHiB7cRbiiAoeS9s894ahPXFgf2O5E2IF9kSSCAt5SSbH0pTHAr5qf5eERm?=
 =?us-ascii?Q?nnfHKTCwxan2yHjXYRG0kvYSYGeHM5ERrZrDs9UnlEkw499UW4b/5usMiHnq?=
 =?us-ascii?Q?pbeNhZCCMwHpzPQYiLTur80crWE2HBDZqyMApQmIJfByafDnVOIxY/O/jAAY?=
 =?us-ascii?Q?XA6//WbPncXqwvCfeD5PRrJ0Yvc15pj6ZI0M67Khhkjw2rR+p3E6n72xm9gR?=
 =?us-ascii?Q?fPi2jOQqZfUIx91NZirguFZpvBPjKHPpip/jkXug8IOfYiyCVcfCYHh6xg1p?=
 =?us-ascii?Q?zAKwryhX7yrGHKZ3jQsawHHPEWnq/0P2nX2UUth2AbjAbfJNWaA2GvELnaj0?=
 =?us-ascii?Q?HfNHiI632CfxmOitoTiOb/Y5K3gyeBJGBBssPvA3qVX/a3G6ms8dnoaCV/zI?=
 =?us-ascii?Q?DZ+FIvRFGYCl9qs4Igo6WXgM8ANlklpZFQKaOV6qHlWSjdU9KIvIUj85mR3O?=
 =?us-ascii?Q?nQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ba296530-c022-44d6-36ae-08dbbe1ef875
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 23:27:23.1721 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: duYjGZDnvrAYHVDwEZKuBi1XoHiRdc5/nd+k5gkFRGpU1qlpwagbFzLJeckBhslQcpeq3j8akGAe/F1pI61E1NnWwLvORKrZguT8hwLoleo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7087
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 7/9] drm/xe: Use pat_index to encode pte
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
Cc: intel-xe@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Sep 25, 2023 at 03:10:47PM -0700, Lucas De Marchi wrote:
> Change the xelp_pte_encode() function to use the platform-dependent
> pat_index.  The same function can be used for all platforms as they only
> need to encode the pat_index bits in the same pte layout. For platforms
> that don't have the most significant bit, as long as they don't return a
> bogus index they should be fine.
> 
> To maintain consistency, also add xe argument to pde_encode_cache().
> This will be needed for Xe2 later.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.h       | 11 ++++---
>  drivers/gpu/drm/xe/xe_migrate.c  |  6 ++--
>  drivers/gpu/drm/xe/xe_pt_types.h |  4 ++-
>  drivers/gpu/drm/xe/xe_vm.c       | 50 +++++++++++++++++++-------------
>  4 files changed, 44 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index e3c90d45e723..885412581158 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -39,10 +39,13 @@
>  #define XE_BO_INTERNAL_TEST		BIT(30)
>  #define XE_BO_INTERNAL_64K		BIT(31)
>  
> -#define PPAT_UNCACHED                   GENMASK_ULL(4, 3)
> -#define PPAT_CACHED_PDE                 0
> -#define PPAT_CACHED                     BIT_ULL(7)
> -#define PPAT_DISPLAY_ELLC               BIT_ULL(4)
> +#define XE_PPGTT_PDE_UNCACHED		GENMASK_ULL(4, 3)
> +#define XE_PPGTT_PDE_CACHED		0

Shouldn't these two be going away?  Indices 0 and 3 are only correct for
certain platforms.  The PDE uses the same PAT encoding as the PTE, as
documented in the bspec's PTF_COMMON_BITS (55730) and referenced from
pages 62361, 55731, etc.

> +
> +#define XELPG_PPGTT_PTE_PAT3		BIT_ULL(62)
> +#define XE_PPGTT_PTE_PAT2		BIT_ULL(7)
> +#define XE_PPGTT_PTE_PAT1		BIT_ULL(4)
> +#define XE_PPGTT_PTE_PAT0		BIT_ULL(3)
>  
>  #define XE_PTE_SHIFT			12
>  #define XE_PAGE_SIZE			(1 << XE_PTE_SHIFT)
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index f22356d69ae3..11dc3b0e0350 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -261,7 +261,8 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>  
>  		level = 2;
>  		ofs = map_ofs + XE_PAGE_SIZE * level + 256 * 8;
> -		flags = vm->pt_ops->pte_encode_addr(0, XE_CACHE_WB, level, true, 0);
> +		flags = vm->pt_ops->pte_encode_addr(xe, 0, XE_CACHE_WB, level,
> +						    true, 0);
>  
>  		/*
>  		 * Use 1GB pages, it shouldn't matter the physical amount of
> @@ -498,7 +499,8 @@ static void emit_pte(struct xe_migrate *m,
>  				devmem = true;
>  			}
>  
> -			addr |= m->q->vm->pt_ops->pte_encode_addr(addr, XE_CACHE_WB,
> +			addr |= m->q->vm->pt_ops->pte_encode_addr(m->tile->xe,
> +								  addr, XE_CACHE_WB,
>  								  0, devmem, flags);
>  			bb->cs[bb->len++] = lower_32_bits(addr);
>  			bb->cs[bb->len++] = upper_32_bits(addr);
> diff --git a/drivers/gpu/drm/xe/xe_pt_types.h b/drivers/gpu/drm/xe/xe_pt_types.h
> index bf5000499251..bd6645295fe6 100644
> --- a/drivers/gpu/drm/xe/xe_pt_types.h
> +++ b/drivers/gpu/drm/xe/xe_pt_types.h
> @@ -11,6 +11,7 @@
>  #include "xe_pt_walk.h"
>  
>  struct xe_bo;
> +struct xe_device;
>  struct xe_vma;
>  
>  enum xe_cache_level {
> @@ -40,7 +41,8 @@ struct xe_pt_ops {
>  			     enum xe_cache_level cache, u32 pt_level);
>  	u64 (*pte_encode_vma)(u64 pte, struct xe_vma *vma,
>  			      enum xe_cache_level cache, u32 pt_level);
> -	u64 (*pte_encode_addr)(u64 addr, enum xe_cache_level cache,
> +	u64 (*pte_encode_addr)(struct xe_device *xe, u64 addr,
> +			       enum xe_cache_level cache,
>  			       u32 pt_level, bool devmem, u64 flags);
>  	u64 (*pde_encode_bo)(struct xe_bo *bo, u64 bo_offset,
>  			     const enum xe_cache_level cache);
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 23452b98d853..ab9cf1de566a 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1191,27 +1191,32 @@ static struct drm_gpuva_fn_ops gpuva_ops = {
>  	.op_alloc = xe_vm_op_alloc,
>  };
>  
> -static u64 pde_encode_cache(enum xe_cache_level cache)
> +static u64 pde_encode_cache(struct xe_device *xe, enum xe_cache_level cache)
>  {
> -	/* FIXME: I don't think the PPAT handling is correct for MTL */
> -
>  	if (cache != XE_CACHE_NONE)
> -		return PPAT_CACHED_PDE;
> +		return XE_PPGTT_PDE_CACHED;
>  
> -	return PPAT_UNCACHED;
> +	return XE_PPGTT_PDE_UNCACHED;

As noted above, we're getting different behavior from these on different
platforms.  We should be encoding the same way we do for the PTE.


Matt

>  }
>  
> -static u64 pte_encode_cache(enum xe_cache_level cache)
> +static u64 pte_encode_cache(struct xe_device *xe, enum xe_cache_level cache)
>  {
> -	/* FIXME: I don't think the PPAT handling is correct for MTL */
> -	switch (cache) {
> -	case XE_CACHE_NONE:
> -		return PPAT_UNCACHED;
> -	case XE_CACHE_WT:
> -		return PPAT_DISPLAY_ELLC;
> -	default:
> -		return PPAT_CACHED;
> -	}
> +	u32 pat_index = xe->pat.idx[cache];
> +	u64 pte = 0;
> +
> +	if (pat_index & BIT(0))
> +		pte |= XE_PPGTT_PTE_PAT0;
> +
> +	if (pat_index & BIT(1))
> +		pte |= XE_PPGTT_PTE_PAT1;
> +
> +	if (pat_index & BIT(2))
> +		pte |= XE_PPGTT_PTE_PAT2;
> +
> +	if (pat_index & BIT(3))
> +		pte |= XELPG_PPGTT_PTE_PAT3;
> +
> +	return pte;
>  }
>  
>  static u64 pte_encode_ps(u32 pt_level)
> @@ -1229,11 +1234,12 @@ static u64 pte_encode_ps(u32 pt_level)
>  static u64 xelp_pde_encode_bo(struct xe_bo *bo, u64 bo_offset,
>  			      const enum xe_cache_level cache)
>  {
> +	struct xe_device *xe = xe_bo_device(bo);
>  	u64 pde;
>  
>  	pde = xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE);
>  	pde |= XE_PAGE_PRESENT | XE_PAGE_RW;
> -	pde |= pde_encode_cache(cache);
> +	pde |= pde_encode_cache(xe, cache);
>  
>  	return pde;
>  }
> @@ -1241,11 +1247,12 @@ static u64 xelp_pde_encode_bo(struct xe_bo *bo, u64 bo_offset,
>  static u64 xelp_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
>  			      enum xe_cache_level cache, u32 pt_level)
>  {
> +	struct xe_device *xe = xe_bo_device(bo);
>  	u64 pte;
>  
>  	pte = xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE);
>  	pte |= XE_PAGE_PRESENT | XE_PAGE_RW;
> -	pte |= pte_encode_cache(cache);
> +	pte |= pte_encode_cache(xe, cache);
>  	pte |= pte_encode_ps(pt_level);
>  
>  	if (xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo))
> @@ -1257,12 +1264,14 @@ static u64 xelp_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
>  static u64 xelp_pte_encode_vma(u64 pte, struct xe_vma *vma,
>  			       enum xe_cache_level cache, u32 pt_level)
>  {
> +	struct xe_device *xe = xe_vma_vm(vma)->xe;
> +
>  	pte |= XE_PAGE_PRESENT;
>  
>  	if (likely(!xe_vma_read_only(vma)))
>  		pte |= XE_PAGE_RW;
>  
> -	pte |= pte_encode_cache(cache);
> +	pte |= pte_encode_cache(xe, cache);
>  	pte |= pte_encode_ps(pt_level);
>  
>  	if (unlikely(xe_vma_is_null(vma)))
> @@ -1271,7 +1280,8 @@ static u64 xelp_pte_encode_vma(u64 pte, struct xe_vma *vma,
>  	return pte;
>  }
>  
> -static u64 xelp_pte_encode_addr(u64 addr, enum xe_cache_level cache,
> +static u64 xelp_pte_encode_addr(struct xe_device *xe, u64 addr,
> +				enum xe_cache_level cache,
>  				u32 pt_level, bool devmem, u64 flags)
>  {
>  	u64 pte;
> @@ -1281,7 +1291,7 @@ static u64 xelp_pte_encode_addr(u64 addr, enum xe_cache_level cache,
>  
>  	pte = addr;
>  	pte |= XE_PAGE_PRESENT | XE_PAGE_RW;
> -	pte |= pte_encode_cache(cache);
> +	pte |= pte_encode_cache(xe, cache);
>  	pte |= pte_encode_ps(pt_level);
>  
>  	if (devmem)
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
