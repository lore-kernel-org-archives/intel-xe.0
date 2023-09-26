Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64652E7F143
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 23:32:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21C5B10E435;
	Tue, 26 Sep 2023 23:32:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C84FD10E435
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Sep 2023 23:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695771137; x=1727307137;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4ByD0dvIfYWj8K2y7BEEVBZO/GJWuaGastln4rChnLg=;
 b=A/6SFd2lTSWgwvMTtBVT6PiO3K1M6r2uBrrB5dmWVgYj37MoZr5BItz3
 J6RMQbkpILit6Dd1eNvxNd+Lc6xJIyQG2TZYjMxYxkSpPKwVjI/O5bmRP
 1wjxMJvpEGunal8T7vegsuPaj4mMy+kysO8PC3h9zWLMgt1c42fUVsj9A
 mFCcBRSTWhUUYqb+P8+w0FoHzy/Ykxci6CjG43G1nHaht6moG5HYRawaK
 yVJ2B/97gDXk2xHU2FNqt7ISa/mGE1NgB05la9N09Z8amSyyaB8pEYmUY
 nH2GwcKnY/bBwymRHsSPX+cR7T7laSV+fJ3bVjDWHpDHwuo62ezniw5n/ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="361070568"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="361070568"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 16:32:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="324857"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Sep 2023 16:32:18 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 16:32:16 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 16:32:16 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 26 Sep 2023 16:32:16 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 26 Sep 2023 16:32:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EdRoaYaDX2D9anbrtDN5F/ta+04HuV+vbUmjoJcmphReeAtQWLnpPSNhn9aEi2QowTlia/ywhdZeIo/6GQE/7pkeqgA+Il4LnqY3lmPVNQ/QabC1WDUNnumLAKjrZwPT1P5dGBT0SQm6rZAgOjS77PPiYhJIm7EI55axyXQnUUW67kvrsHelEyI0sjAAuaygPEe5hdBGwXF2Mhg+zJwj19qMFpg0F3boclY/njDOtpClVIZCCC090c8I6Q34jW2qaM+67YK9lXWaE+UevidBsbM16WRiLjMgdr/x0vZ+4MaTYzCm+ZhHjClnK2UjFGpogin78Scpwk6krCaHTZEx5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1JJjHpOIrydjj/7vqsAbZ60XcliHTSuonEgZINYShoo=;
 b=m7fduKnNKztsnYWvtq7E3YMkYMwVY8XxFhZYRzOBml96PqgpFSpHhEklXxjFk0Rz/D9TI+kdmvqTWsv8TAYOUeQhganyKqrqh/HZ4BxBWHRXHx/t69kweIWxhJVswnv8WWyCqmaLBNHmAK9Ltp6pICI2Z0UNwSLCPpNk0TB43ZDGUfs/qa1HG5Nf7xjz4LqgQPTUNFf8WUGPNFg3t1pQAGx5/iqtQqp3RhojBQyYifE7oeo2conXgiEYhnh4YKt674NFMiviX4RxuPHesL8Xqc65FZdvME18r1mn8nFJ4g96dYJuzZ9O+pFqr073laUE8xDV3V6sghwFRPfOhjynuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 CH3PR11MB8156.namprd11.prod.outlook.com (2603:10b6:610:165::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Tue, 26 Sep
 2023 23:32:14 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66%4]) with mapi id 15.20.6768.029; Tue, 26 Sep 2023
 23:32:14 +0000
Date: Tue, 26 Sep 2023 16:32:11 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230926233211.GZ2706891@mdroper-desk1.amr.corp.intel.com>
References: <20230926223631.2807873-1-lucas.demarchi@intel.com>
 <20230926223631.2807873-10-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230926223631.2807873-10-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR05CA0015.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::28) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|CH3PR11MB8156:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d0ded98-00f1-4541-ce0b-08dbbee8d052
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N6DvaTcIFDDg5eEKbMnocLcaCJ9pD+Fb2heJIjyqMOLUkvMmnFwWC5dXwq38EmqrdyvDQKn2sh/yw1mnjo8IhUbLs5ttRmSxnXXto23NfrlqCD+ZNftxCd0bQUY3gzPevjkxBFJhxpraPQtQnl3OJiRAI31DCYB0/wVyR/rR0H3fHG3uYCNwF/1kkL4/OMKxWEBnQxfK2AcWPwb96pk/SiFoPf6INudgcEZZWtZElvWv1+kECFORlVPYIFZ+c/5+7cGaLsnO1gf8ykKMnctq7my4waJmDIN1KVlCJte9c1uNtMFKaAmD/pwAUe4iOSz69nMWW0moBtIlgdNa/LqWs0Aztdx9K+1EYd/7vYwMJsUqmr42V7R5x7F/6aO8iwBoR7d6IwswuMPvavRPAWjs4NaaLPxCZ+QebJcRVNBPNxvPXs22CTpdC204sSUWhng5nj7hYOuj00sHT9zA9RkkqcFIhW5D7RH19rBASjkm3A19xwJojE3xA/N8HiitiQDwgOkeT33yNAeJgJ1lIc+OsomoAhOsEFqyVl2weEX8x6XGFBY0AsDE/uoQLQYnzGJv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(136003)(346002)(396003)(366004)(230922051799003)(186009)(1800799009)(451199024)(2906002)(107886003)(6506007)(6512007)(38100700002)(6486002)(6666004)(1076003)(86362001)(54906003)(33656002)(478600001)(83380400001)(82960400001)(26005)(316002)(6636002)(5660300002)(66556008)(66476007)(41300700001)(4326008)(8676002)(6862004)(8936002)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bQUjSX9eLqGwDV0fnY3tkSdiAH/FDKRmqwnV0pMo4YubCVDxQTmtmZq0GQIr?=
 =?us-ascii?Q?txHhjemN39NvF1ollLjmCT9Z+qUw0Sn1l1MRuu+xuJepnoTy0hL/EEAXn80B?=
 =?us-ascii?Q?3Bph3dEfd6dwBs9KG7BW5Xpq1TC61Cf77r5EhKQsiaMdTLKJIoAbOPnqQXFo?=
 =?us-ascii?Q?MXTXemCXJRVxx9bdllnqLAvrp5WJOqa1gkAQ4sGnZKxcIcO/4aNuRpLER0JY?=
 =?us-ascii?Q?6ealYXJfn4I74+5S3Ssr5uspqKE2N9jVo0uCCuTW4IijAmFTLE6EPJpaFhXt?=
 =?us-ascii?Q?8lxHXu75UsEXa02ybj8/fMrmZuiU9+00ilezcXHQY3s9UIkgC1WFneC1b+ph?=
 =?us-ascii?Q?0HlG2uycp6hJx7iN8egKfcrTKwvQsJ0tDgI34FRytSBOE2iUGIO1KA8pdl01?=
 =?us-ascii?Q?2gcmmvSIX7kwNuH3ILTweD/eIiy+uARQV2xY/3cXi5GRWIUpI1ctXEOIM58S?=
 =?us-ascii?Q?H0zKmTNWmCQ+gd8669DshgPORxooj68kBHIma1kJffjtI47KuUxwql2eFP/5?=
 =?us-ascii?Q?oY2mbTaKlvtf2YHD8uWSTd5jCjWpE4gLmthAR+h3J0yZZJoZkrX/UKSZMXuM?=
 =?us-ascii?Q?jo7elB63Vve6o5GcXj1zMGzf0nh2AkDf6NBpaA6Md5q8lCvk2/Sb+nSp3FBd?=
 =?us-ascii?Q?UIIeso1jCEQTPRQSVvQRDE+Sef0F3QaRrlbtaldRnpLPkusEDpVpzQs8wx8F?=
 =?us-ascii?Q?9o6dKFh3boBAb6bKO2kI7cX8NqP2AQIvOCi2F2AGMit91L71ORGGTys5enYt?=
 =?us-ascii?Q?hCdFyacF8zP+EyRf4Vf1ADuy9tLRScO/BhK/J6tfHetZ5bvS49RA1ov/uqvc?=
 =?us-ascii?Q?lHGPGw962A/XOAxb49mnQxxKdlvboOlsqEmCijzptEFG8r0RD+9lC/tJYkYO?=
 =?us-ascii?Q?CqT7I5ttEgGTqHz6gJAf8pjEaWlIre/lBqe3YWbmJXH0I7wbrnh/XWvepTmY?=
 =?us-ascii?Q?Kvl3fTSsJ8heVLhlqHxKRPXjj7Zl/ZTFY2MPZrnRmpIBouV+wn+R/nH/XheP?=
 =?us-ascii?Q?gQZUGK4tmcI7cQEdNFhzCshFNP2TCZeujaTmQV/PaA3UocWVwN8+wowxPXUh?=
 =?us-ascii?Q?qz2MQuu7HsmUXhva0CaHJAlKGRmSnjobNskJGXaA1lVoLT1C8LEb0/KBmZK4?=
 =?us-ascii?Q?tJ3r5uEGDr55rBoUeqhJs7jatEepVFdQGaEmTC33oxK5FvMtL+WJZlLKSA9v?=
 =?us-ascii?Q?dXuq55XgKnbgKLVAQ1yIiLQ7l9iYA0x/nT+J/ef0h7QMhGaQFbdtXkk2RCdd?=
 =?us-ascii?Q?tUQ3UUFH2xhGsNsw0pXQdUVkmJW41ojGknNeqWm2pvUCvbttBRSNZwsGVID4?=
 =?us-ascii?Q?93RcWBQcbz15PrYgPn9N4RSIbdYq9Aejmj6hev24Y7qA/RJ4vXSVWXY5uqMK?=
 =?us-ascii?Q?9I8l8SaV0jsYA3lgbqLLaBV1ChWhm8QCniNAL8cbs8biE276wttNqi/1+dAG?=
 =?us-ascii?Q?tswxwomoYaTpdonhsgD8f/0iGjdeLi8uhYGaPM+k7NVUz7mdHKFr1Dfo2ou+?=
 =?us-ascii?Q?LjeMeayx77LiwNWqq13MxzQ1jDGcAC8EKdrGBJ/3J1TEjJr9Cd8/GsUAsSRY?=
 =?us-ascii?Q?Gr7jcL36cwKTWIiKU76N//QjSbFhQnOHRC4km55lMV1paOEZvVXJppOWBbhO?=
 =?us-ascii?Q?VA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d0ded98-00f1-4541-ce0b-08dbbee8d052
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 23:32:14.1063 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ca0OscCQd3tdtCy455yvqsTtNy4n4JKFDe74BlEL7z+2fyei3CIFqS+ZS0iORWxNeFFXYxz58zx2nUYvyOl8DQsmJK7aGiMh0VBmyJ2N3oo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8156
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 09/11] drm/xe: Use pat_index to encode
 pde/pte
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

On Tue, Sep 26, 2023 at 03:36:29PM -0700, Lucas De Marchi wrote:
> Change the xelp_pte_encode() and xelp_pde_encode() functions to use the
> platform-dependent pat_index.  The same function can be used for all
> platforms as they only need to encode the pat_index bits in the same
> pte/pde layout. For platforms that don't have the most significant bit,
> as long as they don't return a bogus index they should be fine.
> 
> v2: Use the same logic to encode pde as it's compatible with previous
>     logic, it's more future proof and also fixes the cache setting for
>     PVC (Matt Roper)
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_bo.h       |  8 ++---
>  drivers/gpu/drm/xe/xe_migrate.c  |  6 ++--
>  drivers/gpu/drm/xe/xe_pt_types.h |  4 ++-
>  drivers/gpu/drm/xe/xe_vm.c       | 56 ++++++++++++++++++++------------
>  4 files changed, 47 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index e3c90d45e723..5090bdd1e462 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -39,10 +39,10 @@
>  #define XE_BO_INTERNAL_TEST		BIT(30)
>  #define XE_BO_INTERNAL_64K		BIT(31)
>  
> -#define PPAT_UNCACHED                   GENMASK_ULL(4, 3)
> -#define PPAT_CACHED_PDE                 0
> -#define PPAT_CACHED                     BIT_ULL(7)
> -#define PPAT_DISPLAY_ELLC               BIT_ULL(4)
> +#define XELPG_PPGTT_PTE_PAT3		BIT_ULL(62)
> +#define XE_PPGTT_PTE_PAT2		BIT_ULL(7)
> +#define XE_PPGTT_PTE_PAT1		BIT_ULL(4)
> +#define XE_PPGTT_PTE_PAT0		BIT_ULL(3)
>  
>  #define XE_PTE_SHIFT			12
>  #define XE_PAGE_SIZE			(1 << XE_PTE_SHIFT)
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index e497b533d410..258c2269c916 100644
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
> -			addr = m->q->vm->pt_ops->pte_encode_addr(addr, XE_CACHE_WB,
> +			addr = m->q->vm->pt_ops->pte_encode_addr(m->tile->xe,
> +								 addr, XE_CACHE_WB,
>  								 0, devmem, flags);
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
> index 23452b98d853..beffbb1039d3 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1191,27 +1191,38 @@ static struct drm_gpuva_fn_ops gpuva_ops = {
>  	.op_alloc = xe_vm_op_alloc,
>  };
>  
> -static u64 pde_encode_cache(enum xe_cache_level cache)
> +static u64 pde_encode_cache(struct xe_device *xe, enum xe_cache_level cache)
>  {
> -	/* FIXME: I don't think the PPAT handling is correct for MTL */
> +	u32 pat_index = xe->pat.idx[cache];
> +	u64 pte = 0;
>  
> -	if (cache != XE_CACHE_NONE)
> -		return PPAT_CACHED_PDE;
> +	if (pat_index & BIT(0))
> +		pte |= XE_PPGTT_PTE_PAT0;
>  
> -	return PPAT_UNCACHED;
> +	if (pat_index & BIT(1))
> +		pte |= XE_PPGTT_PTE_PAT1;
> +
> +	return pte;
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
> @@ -1229,11 +1240,12 @@ static u64 pte_encode_ps(u32 pt_level)
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
> @@ -1241,11 +1253,12 @@ static u64 xelp_pde_encode_bo(struct xe_bo *bo, u64 bo_offset,
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
> @@ -1257,12 +1270,14 @@ static u64 xelp_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
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
> @@ -1271,7 +1286,8 @@ static u64 xelp_pte_encode_vma(u64 pte, struct xe_vma *vma,
>  	return pte;
>  }
>  
> -static u64 xelp_pte_encode_addr(u64 addr, enum xe_cache_level cache,
> +static u64 xelp_pte_encode_addr(struct xe_device *xe, u64 addr,
> +				enum xe_cache_level cache,
>  				u32 pt_level, bool devmem, u64 flags)
>  {
>  	u64 pte;
> @@ -1281,7 +1297,7 @@ static u64 xelp_pte_encode_addr(u64 addr, enum xe_cache_level cache,
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
