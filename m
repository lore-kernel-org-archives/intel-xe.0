Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2A27C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 31 Oct 2023 18:59:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8931110E5B0;
	Tue, 31 Oct 2023 18:59:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C45DB10E5B0
 for <intel-xe@lists.freedesktop.org>; Tue, 31 Oct 2023 18:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698778763; x=1730314763;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vHlxy98FJ1ZB158D6gJyk7jJjj7rwz4YR5aWhVJaqF0=;
 b=fzp6ExyKXymsrRGwrlUyZrfAC+TgnsqYJY6FPjgiuwZmhNQEBvNX8I6N
 xoQwd8SjJVBT6CeySNPOEixEiBW6+yLb+1v6VyWzw5hElNZutbXNvlAEu
 yA+xl/4qBDFOY1FLPjpm4JJHA/9ZF7bMWU6LWK9mFyqlXSvFyyIja14uY
 BcndJuz2/1xf/lqL7nBWchg0c4HMmrg++s0riVVT3Nime+QgUAVcToK3i
 m9SCVixbnZZ+A0egci0JSlp7HGpiNIk+CVPhxwz62BGzcHH0hrV7EggkB
 x3QE9WHNf5zgGajnved7nH3SJnrKJm+kbVgS6k8dyGwSUn0hf9SQilyPu Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="452644407"
X-IronPort-AV: E=Sophos;i="6.03,266,1694761200"; d="scan'208";a="452644407"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2023 11:59:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="851337742"
X-IronPort-AV: E=Sophos;i="6.03,266,1694761200"; d="scan'208";a="851337742"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Oct 2023 11:59:22 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 31 Oct 2023 11:59:22 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 31 Oct 2023 11:59:21 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 31 Oct 2023 11:59:21 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 31 Oct 2023 11:59:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=md/l5J6iAKdNfVAqZ+hogZrwswwtCixo/28m9138bNf7P/rlVBDLvb5rYhPzWT6NPJuighg5r778CNWmigMVj3GGoXrN3kNDG7cXtEw9idpyVjI+8pgLBwENPaJOayH1GsR5Ctym5vNTSNVx9Koykg51qtLSGyCOFTWhXLe/1/eyOKm7oMfzRU8jvq2q+YIMKpq4ELFEoShH4xdkN+MjiwQZGg2eGu+JvIva+1er7KRZsHLOChugSzvoSZTSJq7nCQqDyeY3hEprs/36YEv4Gmi9tVSH5wzLaU8wnXl1isJPNWqOiFEZI3GqrqDHNQyCTsrbUaJ/60k9i7T8x/G8FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ytVQKgGLqH+8hmOTLhPaGIKIIrDwy3XwGEgvcvIN3dk=;
 b=Aw45OktS+rXFM/exMxO5ap7xv80Bn+9L6nKS7QTjHXujr770iJysqOF+XTLuagbKsE7OFdkV4eLCL7YHHtsMOnAnztxlDBUsWx4Fw3RbBdyWPblFdtqpPXqsKc2msCXUlY2pd+dK91BAjDaOaOd0ojOXiulv2AYOp+JQfXB0TYhppx6pC5/mkt8yoMkZCUEHwGC3kwLj7HX7A+e6Gx8xypawCcSyBB4s14/M5+QbCLhhiUQiqsKgpcmpupJFezUNuJUgsHzAJEF+O259wjcSRPrYYYStV/jBGlWA3eQdW1Bho/k8HGiT4y6sxlzb2zlMpCWH8UEkUjXFBXurcdkw0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7649.namprd11.prod.outlook.com (2603:10b6:8:146::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.29; Tue, 31 Oct
 2023 18:59:16 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777%7]) with mapi id 15.20.6933.029; Tue, 31 Oct 2023
 18:59:16 +0000
Date: Tue, 31 Oct 2023 18:59:14 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Brian Welty <brian.welty@intel.com>
Message-ID: <ZUFOgtkFu9w3FOH4@DUT025-TGLU.fm.intel.com>
References: <20231025180008.24167-1-brian.welty@intel.com>
 <20231025180008.24167-4-brian.welty@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231025180008.24167-4-brian.welty@intel.com>
X-ClientProxiedBy: SJ0PR05CA0145.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7649:EE_
X-MS-Office365-Filtering-Correlation-Id: e68caa5c-6c0b-42f4-1399-08dbda437ad7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cItLtlPJG7Z3a17PXSj8gYzv2fB658KgKtLagAo7Ogt++xqcafR27RWE1Bad4Yvh21HsNSv2jKMtcXZXemKOdsKNwupzjJsV1ikDy9lhtHeraE9uRRwBuTKOXJxObgPDkyDUDo1C93mNsxKUs6eYrU1DsAlo3vf8O1d/D2ju2IDR0GdiBmVvClvM9xL2gIaG2zE+KSu7R56HTbHZhmQnYxapuP6a0iNtoWkpIqgz0XR1sCXsBojzq0yoM+xK0S7twHYUE/j9fOV/zm/SSQZYMTeiAYFsPCs0eKOsBityd/lMbTNvLo7bQq/phqhgya2IZYa1gbiUpBhy9kETCtODShURl9jS/0qlT+Lm4WBpVCNRrdV0+wv5UpW4rXdF/vCwJZK/XywFTDd5tfdhdKoXFpsO594Y39F613pVutRWYnf0j051dHdSEFbLO7+MwKHxIMh7Uthop/FVOsy+UG8kfg6Fij2HafMwYLHVujEwCLnCxgN8gOvvDQb+WUXQU0x5+3awFm8O4CVi8lL8P01V12K1bbsYErCQK0pPohYiVD9IE2G4HtmnOdNrBidLlcag
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(376002)(136003)(396003)(346002)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(82960400001)(6486002)(6512007)(478600001)(66946007)(6506007)(66476007)(66556008)(86362001)(26005)(83380400001)(107886003)(41300700001)(2906002)(6636002)(44832011)(316002)(6862004)(4326008)(8676002)(5660300002)(8936002)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?azqytS70Wp968MhcbVpBX7eLTqa4t+6/cv+Y8XM8974PAqLYwtptqBO2Nc9M?=
 =?us-ascii?Q?+rIMHJjAtN5//LdqNlEO4/A8dwEx6OcqmpA5KJNc7H/eGoyXfAldgKdvE5/b?=
 =?us-ascii?Q?hrivqKhULr0E7AkBH89jyqjqh1lccNGUXUhQlGfPA+qRm+4G1xag5XoLABrI?=
 =?us-ascii?Q?zfm2+AzYsYJeydqclJcAC2Iro++fuYqochrZuyg4up+cU9XxKLqM/L7KIblu?=
 =?us-ascii?Q?SqJWsfpnKjkU9vUXLjgMgLHkrEXiXDRj60z7MRMPxRsEnZ2alw8R/Ar2Ct32?=
 =?us-ascii?Q?PvQsq2CK18nj4qypnM97n2sGah4syxy9qBlv3gLLJLqgE1faheyOFGUf+OTQ?=
 =?us-ascii?Q?0zWyHgoP2pnUjoNTxOjAiAYQKbEkHtLqXwjA3m7LeK1ROBNTpwz39Nttgnik?=
 =?us-ascii?Q?NSr54tfBRr1v0dsVDZqm3IDfqrrk9i4pHGhtvBVI+Gpp196l0znNPsFEoFAo?=
 =?us-ascii?Q?3OBMFCy3WvsV9KpB3kJwOWkqrByaNURvVBOjzD/DPdIiKHGZ0tHbz5+gdQaD?=
 =?us-ascii?Q?9De8oNdOtOe8rly0RT9j0DYZQxfYwiH0ICcUCthj3MJZQVIWH/oba+GYDNnP?=
 =?us-ascii?Q?//NqwYwojRFv2/UxndHTmkZsxKqwZ7TVCaT9NFAP0yhEOU05ysfjlowRkb3P?=
 =?us-ascii?Q?266KI0Jw9q+PXFMOqic352TNXiO/fVDQ0yzqdVeLohUBHhRxT2IMwi2gtvRf?=
 =?us-ascii?Q?QTYCy6k0j5yFUf1GkuDmK4w9ubOIM83j6tG37n8EYrDmGBIeAc4eqdhWAQ0a?=
 =?us-ascii?Q?JW2tJL/l3Up82BgC/oGE1wOaHf9x4Y/rwN366e6e6F9NBZ+1AXrp8i5xm58T?=
 =?us-ascii?Q?EnVDlE2yJPXXjagm/UTlph/Wi1F1m2IQ3mVeOr9g9a0WP3AmyveQDesHRZli?=
 =?us-ascii?Q?OHAyeGkYBF3o9i/bwN06R0ixJ3Ig8D/4vyEQowhmh5KPs/92OGz8zEu8m7ns?=
 =?us-ascii?Q?epI1EOwDneLWkkxoey5nqnPO8ZwxAsTDblSTK4gxQZwwdEdDG80H2gTXgaZc?=
 =?us-ascii?Q?ozPgpdtYqR4uipHWqHD+mbm4Clqyln7gtY/CmmD4oaaidZDoegMkaEoIzAHW?=
 =?us-ascii?Q?pR9+Z15uuftuS1d835AbZcEAMfUTvlp4IM7eVCIYIBTKKlZZIv5SOSD/v8Z0?=
 =?us-ascii?Q?D1nBxCobfXZq7HQpIKqN+ccNOfDvSOocT246Yirg13acxzrYGyk2MweqUzIy?=
 =?us-ascii?Q?2tvY0B0orMLmTV40xYhG0PRUHeWGmg95S9/9SmCjxPveZZxrYzK2uU/REZYb?=
 =?us-ascii?Q?Ir2zqoaDOAF01VbDRgw/DSeZ2nWErSL3pwRF7ZNd+YVl40bCFVAtzUEXzQNP?=
 =?us-ascii?Q?CuZu8ynY/LZgIiQPqQvl6Jjj1O9wNkvLvXstCOfUgzzDHTt8bBecAsc5mE9p?=
 =?us-ascii?Q?hjxZnLwu142Bj+oBipkDeAfBGXrRKBp2H1rmUyMS6CKCIwq2nDMzy0C9sScT?=
 =?us-ascii?Q?OV7F8plDWL/D2ZNzthT475NsF0bdtPEZveD0uUBsaZ+oWMv4L1psnU8ESIGo?=
 =?us-ascii?Q?kNsFZdVS8mEvKvmpaEYaAx2UeWreKfuDaU8pHP+bDPi3ySgO4c+9PlPG2yc3?=
 =?us-ascii?Q?1sABWRJENbkC29mhbs3+q7OgjiIFwasKOGH04OQXVMEKx1gpl0fKcKHbO8y9?=
 =?us-ascii?Q?PQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e68caa5c-6c0b-42f4-1399-08dbda437ad7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2023 18:59:16.3490 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CdfOl4vI2AcI0p4ZqILMQoT7gzHON491NtBopjdxEL0GdEKttjkiyVRLu07tYk7irB3LCOr9BNHPuyD7XcIJ5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7649
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/3] drm/xe: Replace usage of mem_type_to_tile
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Oct 25, 2023 at 11:00:08AM -0700, Brian Welty wrote:
> Currently mem_type_to_tile() is being used to access the tile's underlying
> tile.mem.vram. However, this function makes the assumption that a mem_type
> will only ever map to a single tile. Now that the TTM vram manager contains
> a pointer to the memory_region, make use of this in xe_bo.c.
> 
> As such, introduce a helper function res_to_mem_region() to get the
> ttm_vram_mgr->vram from the BO's resource, and use this to replace usage
> of mem_type_to_tile().
> 
> xe_tile is still needed to choose the migration context, so this part is
> unchanged. But as this is only renaming usage, function is renamed now to
> mem_type_to_migrate().
> 
> Signed-off-by: Brian Welty <brian.welty@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_bo.c | 63 +++++++++++++++++++++++---------------
>  1 file changed, 38 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 795234886f7e..688036ff9fc5 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -101,12 +101,24 @@ static bool xe_bo_is_user(struct xe_bo *bo)
>  	return bo->flags & XE_BO_CREATE_USER_BIT;
>  }
>  
> -static struct xe_tile *
> -mem_type_to_tile(struct xe_device *xe, u32 mem_type)
> +static struct xe_migrate *
> +mem_type_to_migrate(struct xe_device *xe, u32 mem_type)
>  {
> +	struct xe_tile *tile;
> +
>  	xe_assert(xe, mem_type == XE_PL_STOLEN || mem_type_is_vram(mem_type));
> +	tile = &xe->tiles[mem_type == XE_PL_STOLEN ? 0 : (mem_type - XE_PL_VRAM0)];
> +	return tile->migrate;
> +}
> +
> +static struct xe_mem_region *res_to_mem_region(struct ttm_resource *res)
> +{
> +	struct xe_device *xe = ttm_to_xe_device(res->bo->bdev);
> +	struct ttm_resource_manager *mgr;
>  
> -	return &xe->tiles[mem_type == XE_PL_STOLEN ? 0 : (mem_type - XE_PL_VRAM0)];
> +	xe_assert(xe, resource_is_vram(res));
> +	mgr = ttm_manager_type(&xe->ttm, res->mem_type);
> +	return to_xe_ttm_vram_mgr(mgr)->vram;
>  }
>  
>  static void try_add_system(struct xe_bo *bo, struct ttm_place *places,
> @@ -126,11 +138,13 @@ static void try_add_system(struct xe_bo *bo, struct ttm_place *places,
>  static void add_vram(struct xe_device *xe, struct xe_bo *bo,
>  		     struct ttm_place *places, u32 bo_flags, u32 mem_type, u32 *c)
>  {
> -	struct xe_tile *tile = mem_type_to_tile(xe, mem_type);
>  	struct ttm_place place = { .mem_type = mem_type };
> -	u64 io_size = tile->mem.vram.io_size;
> +	struct xe_mem_region *vram;
> +	u64 io_size;
>  
> -	xe_assert(xe, tile->mem.vram.usable_size);
> +	vram = to_xe_ttm_vram_mgr(ttm_manager_type(&xe->ttm, mem_type))->vram;
> +	xe_assert(xe, vram && vram->usable_size);
> +	io_size = vram->io_size;
>  
>  	/*
>  	 * For eviction / restore on suspend / resume objects
> @@ -140,7 +154,7 @@ static void add_vram(struct xe_device *xe, struct xe_bo *bo,
>  			XE_BO_CREATE_GGTT_BIT))
>  		place.flags |= TTM_PL_FLAG_CONTIGUOUS;
>  
> -	if (io_size < tile->mem.vram.usable_size) {
> +	if (io_size < vram->usable_size) {
>  		if (bo_flags & XE_BO_NEEDS_CPU_ACCESS) {
>  			place.fpfn = 0;
>  			place.lpfn = io_size >> PAGE_SHIFT;
> @@ -404,21 +418,21 @@ static int xe_ttm_io_mem_reserve(struct ttm_device *bdev,
>  		return 0;
>  	case XE_PL_VRAM0:
>  	case XE_PL_VRAM1: {
> -		struct xe_tile *tile = mem_type_to_tile(xe, mem->mem_type);
>  		struct xe_ttm_vram_mgr_resource *vres =
>  			to_xe_ttm_vram_mgr_resource(mem);
> +		struct xe_mem_region *vram = res_to_mem_region(mem);
>  
>  		if (vres->used_visible_size < mem->size)
>  			return -EINVAL;
>  
>  		mem->bus.offset = mem->start << PAGE_SHIFT;
>  
> -		if (tile->mem.vram.mapping &&
> +		if (vram->mapping &&
>  		    mem->placement & TTM_PL_FLAG_CONTIGUOUS)
> -			mem->bus.addr = (u8 *)tile->mem.vram.mapping +
> +			mem->bus.addr = (u8 *)vram->mapping +
>  				mem->bus.offset;
>  
> -		mem->bus.offset += tile->mem.vram.io_start;
> +		mem->bus.offset += vram->io_start;
>  		mem->bus.is_iomem = true;
>  
>  #if  !defined(CONFIG_X86)
> @@ -611,7 +625,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>  	struct ttm_resource *old_mem = ttm_bo->resource;
>  	u32 old_mem_type = old_mem ? old_mem->mem_type : XE_PL_SYSTEM;
>  	struct ttm_tt *ttm = ttm_bo->ttm;
> -	struct xe_tile *tile = NULL;
> +	struct xe_migrate *migrate = NULL;
>  	struct dma_fence *fence;
>  	bool move_lacks_source;
>  	bool tt_has_data;
> @@ -689,14 +703,13 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>  	}
>  
>  	if (bo->tile)
> -		tile = bo->tile;
> +		migrate = bo->tile->migrate;
>  	else if (resource_is_vram(new_mem))
> -		tile = mem_type_to_tile(xe, new_mem->mem_type);
> +		migrate = mem_type_to_migrate(xe, new_mem->mem_type);
>  	else if (mem_type_is_vram(old_mem_type))
> -		tile = mem_type_to_tile(xe, old_mem_type);
> +		migrate = mem_type_to_migrate(xe, old_mem_type);
>  
> -	xe_assert(xe, tile);
> -	xe_tile_assert(tile, tile->migrate);
> +	xe_assert(xe, migrate);
>  
>  	trace_xe_bo_move(bo);
>  	xe_device_mem_access_get(xe);
> @@ -717,7 +730,8 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>  
>  			/* Create a new VMAP once kernel BO back in VRAM */
>  			if (!ret && resource_is_vram(new_mem)) {
> -				void *new_addr = tile->mem.vram.mapping +
> +				struct xe_mem_region *vram = res_to_mem_region(new_mem);
> +				void *new_addr = vram->mapping +
>  					(new_mem->start << PAGE_SHIFT);
>  
>  				if (XE_WARN_ON(new_mem->start == XE_BO_INVALID_OFFSET)) {
> @@ -734,9 +748,9 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>  		}
>  	} else {
>  		if (move_lacks_source)
> -			fence = xe_migrate_clear(tile->migrate, bo, new_mem);
> +			fence = xe_migrate_clear(migrate, bo, new_mem);
>  		else
> -			fence = xe_migrate_copy(tile->migrate,
> +			fence = xe_migrate_copy(migrate,
>  						bo, bo, old_mem, new_mem);
>  		if (IS_ERR(fence)) {
>  			ret = PTR_ERR(fence);
> @@ -905,16 +919,16 @@ int xe_bo_restore_pinned(struct xe_bo *bo)
>  static unsigned long xe_ttm_io_mem_pfn(struct ttm_buffer_object *ttm_bo,
>  				       unsigned long page_offset)
>  {
> -	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
>  	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
> -	struct xe_tile *tile = mem_type_to_tile(xe, ttm_bo->resource->mem_type);
>  	struct xe_res_cursor cursor;
> +	struct xe_mem_region *vram;
>  
>  	if (ttm_bo->resource->mem_type == XE_PL_STOLEN)
>  		return xe_ttm_stolen_io_offset(bo, page_offset << PAGE_SHIFT) >> PAGE_SHIFT;
>  
> +	vram = res_to_mem_region(ttm_bo->resource);
>  	xe_res_first(ttm_bo->resource, (u64)page_offset << PAGE_SHIFT, 0, &cursor);
> -	return (tile->mem.vram.io_start + cursor.start) >> PAGE_SHIFT;
> +	return (vram->io_start + cursor.start) >> PAGE_SHIFT;
>  }
>  
>  static void __xe_bo_vunmap(struct xe_bo *bo);
> @@ -1451,12 +1465,11 @@ struct xe_bo *xe_bo_create_from_data(struct xe_device *xe, struct xe_tile *tile,
>  uint64_t vram_region_gpu_offset(struct ttm_resource *res)
>  {
>  	struct xe_device *xe = ttm_to_xe_device(res->bo->bdev);
> -	struct xe_tile *tile = mem_type_to_tile(xe, res->mem_type);
>  
>  	if (res->mem_type == XE_PL_STOLEN)
>  		return xe_ttm_stolen_gpu_offset(xe);
>  
> -	return tile->mem.vram.dpa_base;
> +	return res_to_mem_region(res)->dpa_base;
>  }
>  
>  /**
> -- 
> 2.38.0
> 
