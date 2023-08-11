Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EF95EB64DD
	for <intel-xe@archiver.kernel.org>; Fri, 11 Aug 2023 18:23:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D782310E6E5;
	Fri, 11 Aug 2023 18:23:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF4EC10E6E5
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Aug 2023 18:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691778181; x=1723314181;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xvdfwP9mkXe0lHSj7UFFuCgPGGVrYpACmbDLmFxELMk=;
 b=UO5TLeD1a2czv5aw3IcqZFa7kFq97H/DjRYGo/0sVHoK0nmv9y4YX+ca
 HDPCzC9BX38tQnXZCLaw9drM0NzrhL5ubzl8vF/Aist4ez9QuFbpzHxk3
 v/pXV69J10KRVKJYZHOwxiM6J8bmrQ+Ogm4NwfHyfR1aYOAaHAbVIKtNt
 j6JsDqLHOtDxARcdTWm1HAYSj4XP+SYmY9dh3eonyISkPyvhXQUsYgaRx
 MZWQKAhhp50t7TmsIf6oSMIBO2KhtV3xHoNhPmeOSHssoqhlGDIAaLOQO
 KzN2EpkzhdXmGWxnDIHXdEQSdLqgp+trTlCzN9JV/J4FJnJpcXurtEkly A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="438070718"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="438070718"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 11:22:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="876264001"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga001.fm.intel.com with ESMTP; 11 Aug 2023 11:22:37 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 11 Aug 2023 11:22:33 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 11 Aug 2023 11:22:33 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 11 Aug 2023 11:22:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WZwO23PlqpYAQYdZcmqufDmT5bRkOu86ivmwiiSnrMheXs0QDUR7Zp3/juO4jM819884nuOz/D18dNyYC5G0BRJnRVlGa6Lug+1fgzV0ZmcgOlrbIzGN0rpCg1TeFkF3oYA9S4Y59kC/U/UYqU2Q0qbnzN3Yjk4AvLAPcLBXLD74cnuMqckEtNYF4T1wgq0eMiFQHWOsjz9yNqR4LfNX9zLugG8G5evoLo9DYTYRSaWyB2fHlrkyBBNgKgL+zq+njIRWmGx46SCrBRAqSahWXMQeaafksD+M/gXoV86KEfbGWQ5P7uy3d70cXOX3ykNoG2uhHADCZzr/kWWIkAVAxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YI4AiLUo3zs6YBlLMUY+qRWu3jZLfx86LAIGZsTAGO8=;
 b=e0RHkJBafrnRSu9CLtK77QdNMrK5nZVFpTBpzt5xftwgjdNhzud3ww3kT4fcjul7+hHF8EsiQrWr/M9Pnd/ERlijeLsQH5soaMPf7Jedvq+qtiLNnRE3tTD1KuhI33ldJ3ZFoaD59III32EpdBlhGSnEiU8KiUaiQWX2Ens5cU6NSOZ+dEL94cD3OvZOWe9KxtuM9SZtjEQZ+QXpx7X1VGMvTNWWuCaKTRB94/b3HP1xN2hGHayLlly7cByypvUYyu/R9GLXs9n9doG8v0GbTdSh1jsn4hJzi+ss8saMwXW61beJDzyMxJKHgaRunrQPLusUwi3gR+hNfwgweeE3Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.20; Fri, 11 Aug
 2023 18:22:31 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b429:ee19:a001:eb69]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b429:ee19:a001:eb69%4]) with mapi id 15.20.6652.029; Fri, 11 Aug 2023
 18:22:31 +0000
Date: Fri, 11 Aug 2023 18:21:39 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Oak Zeng <oak.zeng@intel.com>
Message-ID: <ZNZ8M1JsZeQdGwxX@DUT025-TGLU.fm.intel.com>
References: <20230810160815.41423-1-oak.zeng@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230810160815.41423-1-oak.zeng@intel.com>
X-ClientProxiedBy: SJ0PR03CA0174.namprd03.prod.outlook.com
 (2603:10b6:a03:338::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB6909:EE_
X-MS-Office365-Filtering-Correlation-Id: ace0fcb7-c3ba-4d47-33df-08db9a97ecfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n536NS52hNzVHbKyEQ2d39xE3P4NARAhrBhDXGt0O0n1s461bsn1HMkNuMO3NfvvlBjWP+gidLFXZgl7OcbePCnOK+SLBdDUpEwsxCP7siHag2Em7BEFfc2nFSFea0OnBgl0d9Bx2LCsf7TmJtQkLu3bbCfOA6KGpnYB2QJhFCtQ3TvHvlSxgHuT8kTyc/wGR4MMTGqjb8pCL7JMugw9GR43MlrXRZpI5DK5w49a5Y2A7PZLQ0fSylKowZd2rOO+7jdG16FEE5lt450EhFEGn6B09y1jIe0Ng2L/RvwQLbDcp86cbdEMk2VWupM1NwUL37n97tnmN5VxREFH9FpBXpB8YlKP0y1YE5ipdCkE1v83upOcd2afdfpVilrA/SsF4S+ulRkwRvn76qvGNLEiB/dhkiTZRdLUH51td3fSEjClu26XntC4P1jkxxpcQ63LyqK9BWjkqbMBvyVi5OZl1+p9OJqcUpB/UcHqUFTLjrACfAbAxR29ksNqEnnhHFmOycDXwSEvLD9AHvCiT5t0E6rgMa4R9pOk8br18FH0v7nAfhWhYYY9ChDxFFBmtv+ks1pWkvY/qR8EJJCYxk5k/100lwr3j0gOywR5fzDPj0g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(396003)(376002)(136003)(366004)(1800799006)(186006)(451199021)(107886003)(5660300002)(82960400001)(8676002)(6862004)(4326008)(8936002)(38100700002)(6512007)(86362001)(478600001)(83380400001)(66476007)(66946007)(26005)(66556008)(2906002)(316002)(6636002)(41300700001)(6486002)(44832011)(6506007)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?n8kwQ9q/YL+HNJz8COSSUUkK6AkJeKr5ixJwjeqhr2JbfsAbRnM3oQTMr4HD?=
 =?us-ascii?Q?0BGTTnH7R3IxPecVIUyVjOi5x4SA5tQPlgr9Hlf3hK5lYLzxl9QFH/Dzmet8?=
 =?us-ascii?Q?HzEQN6RUx5Yeh/Iirv7503RshfO/ZTCfLCJy6833wK30bqEboaSW9PyxAEXS?=
 =?us-ascii?Q?XPnDfGUvryo0zD4clyZAR9rF3i6Kvz+O4oGWDdToSFGnVou6yybiRwR4P/j0?=
 =?us-ascii?Q?AEqUdPNeo8iZF2YnOLXweUB4NkaQ6XTzm5aFZD+VoSphk4qBVFgMBzxC/3tF?=
 =?us-ascii?Q?wtA3Zg3d+GbK7+Q7pYsqeAobZY0WexPj6B6ETOD4sskXcs3Kmm0PIgDhS1x/?=
 =?us-ascii?Q?jevRjHTw1cjsI5MwZ8oJpZpFsHzj2Thtpa5EoF1TQlvzN1MVQ5gm7oDnsmAY?=
 =?us-ascii?Q?cH2enCk26fp1MoyQyuoGKoNFJ4sxlwmnBp3mdxF4p0iVA7midTdURAInEa8B?=
 =?us-ascii?Q?HWA4jrgMX8+XaffhG6xPghnJX0qZGu7IIw8lzaV4nShAYC1IGXHAsRX2OJz5?=
 =?us-ascii?Q?PkMDF/wjgpxD8X98LG9h8gMumBxNy1uDhNwRCr+1dBJGmZt9AUhW8FoFSJ3J?=
 =?us-ascii?Q?Xn3a/iB/kS7KcRSkVJWT40Qk83LiQcTaLxhT7i/Wdb9OaJR/mWGeVSE15raQ?=
 =?us-ascii?Q?4vSv/Kr1jPHaFE1wnuwdOZ0K6gSd6AiHLcfsLTKbP8dwOm9yq2I3lDJPx7Gc?=
 =?us-ascii?Q?FdruFc1kb8F00nRXZgVr6q/NeLyKQuJmj5j4JzAWHi5Wk0Ofo4/fU0HBzmj0?=
 =?us-ascii?Q?Cp93fqs5mtbAsFYGig894NnjfpqSXAcLaP0Lc00M26rH3lM8cpEOnbYqD+SV?=
 =?us-ascii?Q?7kKP0+ypyqnJRgJBzTgdTAEWmRfn75CeOuOPEu7BmfMT3DgZwiBRYWSE1xNO?=
 =?us-ascii?Q?dhmfMYAL4MWq9xlh066x+RYssHOpgy591ft2WRRUQziFfb1gfUGtr6uMBSrF?=
 =?us-ascii?Q?FBD06BOhKQk8wPJONFEXJ1ZCMgKCMiTiCyda8ar9GB2/P5w8Hc4E50r/xkk1?=
 =?us-ascii?Q?ms6dy2d8W9RhhyOfWvWtfaxwPPnLYJO8K1VG/Ih6vif9Bjb4uUhIOs5Pcr+V?=
 =?us-ascii?Q?VrsMAr2QVJZoAk0y7zL0szpR7h6/0M+Lm33jS0amgIVSDmLh6VBYJh63+o9n?=
 =?us-ascii?Q?NKukDWLU5fabfZlgkdqrreyk7LkGF5SYzdAHGuhC8sYUFqoyW9fUoF6e22VK?=
 =?us-ascii?Q?DCpijAcTS95aXRqzOrkrV+WwuiyXZ6KDOBVOcOAGYY3XYOe1Bvhw2P0uzjsc?=
 =?us-ascii?Q?Pg3D8ivH5yQPOvBR6VKl/dT4gZo2P96SaVlQKlYgXFfvj8iPiqbbVhY8DQ1o?=
 =?us-ascii?Q?xQyessfYTIMG0W5GYcM01ER5Cnzam8Y+NuSGlZOuxs4uO34Z0nShdpjtfpx8?=
 =?us-ascii?Q?2Litg5Eh3X6KrsZSHvwjq3yGoE4xd0yj1oHpyeDLBPOlO/l8RPXB4nSPFC1Z?=
 =?us-ascii?Q?24jOdMaTgYzUYvRRC7NFWcLJzeJ4u5C/ZUMj2HyGX5XrfkqYB3tnWpgDaBVJ?=
 =?us-ascii?Q?i2ftHsOWltJNtO0AteRYfe8MoVM+sZh+QYVZtzR4ff2mRNNR/kxCRsq4VqQL?=
 =?us-ascii?Q?YXtlGVGvaiQb1JtRjQdb+lL+5fSggnXAaa3Uon88DYYEV1q9YxcXR3YjHuXf?=
 =?us-ascii?Q?cQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ace0fcb7-c3ba-4d47-33df-08db9a97ecfe
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2023 18:22:31.1416 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OnIY2CJ6jUB9TkJ5HrZ/kbecuImAl4DIy+eMw+Ee8Eyws+HXWeInCKvdhP+UK/7YByGwA229j3mm/h3MkF8hmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6909
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Make xe_mem_region struct
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

On Thu, Aug 10, 2023 at 12:08:14PM -0400, Oak Zeng wrote:
> Make a xe_mem_region structure which will be used in the
> coming patches. The new structure is used in both xe device
> level (xe->mem.vram) and xe_tile level (tile->vram).
> 
> Make the definition of xe_mem_region.dpa_base to be the DPA
> base of this memory region and change codes according to
> this new definition.
> 
> v1:
>   - rename xe_mem_region.base to dpa_base per conversation with Mike
>     Ruhl
> 
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_bo.c           |  2 +-
>  drivers/gpu/drm/xe/xe_device_types.h | 94 ++++++++++++----------------
>  drivers/gpu/drm/xe/xe_migrate.c      |  2 +-
>  drivers/gpu/drm/xe/xe_mmio.c         |  9 +--
>  4 files changed, 47 insertions(+), 60 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 284c86107a5f..480f4e59f891 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1457,7 +1457,7 @@ uint64_t vram_region_gpu_offset(struct ttm_resource *res)
>  	if (res->mem_type == XE_PL_STOLEN)
>  		return xe_ttm_stolen_gpu_offset(xe);
>  
> -	return xe->mem.vram.base + tile->mem.vram.base;
> +	return tile->mem.vram.dpa_base;
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index bfedcc7571b0..8e45724f3d2f 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -56,6 +56,44 @@ struct xe_ggtt;
>  		 const struct xe_tile * : (const struct xe_device *)((tile__)->xe),	\
>  		 struct xe_tile * : (tile__)->xe)
>  
> +/**
> + * struct xe_mem_region - memory region structure
> + * This is used to describe a memory region in xe
> + * device, such as HBM memory or CXL extension memory.
> + */
> +struct xe_mem_region {
> +	/** @io_start: IO start address of this VRAM instance */
> +	resource_size_t io_start;
> +	/**
> +	 * @io_size: IO size of this VRAM instance
> +	 *
> +	 * This represents how much of this VRAM we can access
> +	 * via the CPU through the VRAM BAR. This can be smaller
> +	 * than @usable_size, in which case only part of VRAM is CPU
> +	 * accessible (typically the first 256M). This
> +	 * configuration is known as small-bar.
> +	 */
> +	resource_size_t io_size;
> +	/** @base: This memory regions's DPA (device physical address) base */
> +	resource_size_t dpa_base;
> +	/**
> +	 * @usable_size: usable size of VRAM
> +	 *
> +	 * Usable size of VRAM excluding reserved portions
> +	 * (e.g stolen mem)
> +	 */
> +	resource_size_t usable_size;
> +	/**
> +	 * @actual_physical_size: Actual VRAM size
> +	 *
> +	 * Actual VRAM size including reserved portions
> +	 * (e.g stolen mem)
> +	 */
> +	resource_size_t actual_physical_size;
> +	/** @mapping: pointer to VRAM mappable space */
> +	void *__iomem mapping;
> +};
> +
>  /**
>   * struct xe_tile - hardware tile structure
>   *
> @@ -113,38 +151,7 @@ struct xe_tile {
>  		 * Although VRAM is associated with a specific tile, it can
>  		 * still be accessed by all tiles' GTs.
>  		 */
> -		struct {
> -			/** @io_start: IO start address of this VRAM instance */
> -			resource_size_t io_start;
> -			/**
> -			 * @io_size: IO size of this VRAM instance
> -			 *
> -			 * This represents how much of this VRAM we can access
> -			 * via the CPU through the VRAM BAR. This can be smaller
> -			 * than @size, in which case only part of VRAM is CPU
> -			 * accessible (typically the first 256M). This
> -			 * configuration is known as small-bar.
> -			 */
> -			resource_size_t io_size;
> -			/** @base: offset of VRAM starting base */
> -			resource_size_t base;
> -			/**
> -			 * @usable_size: usable size of VRAM
> -			 *
> -			 * Usable size of VRAM excluding reserved portions
> -			 * (e.g stolen mem)
> -			 */
> -			resource_size_t usable_size;
> -			/**
> -			 * @actual_physical_size: Actual VRAM size
> -			 *
> -			 * Actual VRAM size including reserved portions
> -			 * (e.g stolen mem)
> -			 */
> -			resource_size_t actual_physical_size;
> -			/** @mapping: pointer to VRAM mappable space */
> -			void *__iomem mapping;
> -		} vram;
> +		struct xe_mem_region vram;
>  
>  		/** @vram_mgr: VRAM TTM manager */
>  		struct xe_ttm_vram_mgr *vram_mgr;
> @@ -263,28 +270,7 @@ struct xe_device {
>  	/** @mem: memory info for device */
>  	struct {
>  		/** @vram: VRAM info for device */
> -		struct {
> -			/** @io_start: IO start address of VRAM */
> -			resource_size_t io_start;
> -			/**
> -			 * @io_size: IO size of VRAM.
> -			 *
> -			 * This represents how much of VRAM the CPU can access
> -			 * via the VRAM BAR.
> -			 * On systems that do not support large BAR IO space,
> -			 * this can be smaller than the actual memory size, in
> -			 * which case only part of VRAM is CPU accessible
> -			 * (typically the first 256M).  This configuration is
> -			 * known as small-bar.
> -			 */
> -			resource_size_t io_size;
> -			/** @size: Total size of VRAM */
> -			resource_size_t size;
> -			/** @base: Offset to apply for Device Physical Address control */
> -			resource_size_t base;
> -			/** @mapping: pointer to VRAM mappable space */
> -			void *__iomem mapping;
> -		} vram;
> +		struct xe_mem_region vram;
>  		/** @sys_mgr: system TTM manager */
>  		struct ttm_resource_manager sys_mgr;
>  	} mem;
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 18c94022930f..956a96b38346 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -264,7 +264,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>  		 * Use 1GB pages, it shouldn't matter the physical amount of
>  		 * vram is less, when we don't access it.
>  		 */
> -		for (pos = 0; pos < xe->mem.vram.size; pos += SZ_1G, ofs += 8)
> +		for (pos = 0; pos < xe->mem.vram.actual_physical_size; pos += SZ_1G, ofs += 8)
>  			xe_map_wr(xe, &bo->vmap, ofs, u64, pos | flags);
>  	}
>  
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index aa9c573b1243..41ee89247ddb 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -173,7 +173,8 @@ static int xe_determine_lmem_bar_size(struct xe_device *xe)
>  	if (!xe->mem.vram.io_size)
>  		return -EIO;
>  
> -	xe->mem.vram.base = 0; /* DPA offset */
> +	/* XXX: Need to change when xe link code is ready */
> +	xe->mem.vram.dpa_base = 0;
>  
>  	/* set up a map to the total memory area. */
>  	xe->mem.vram.mapping = ioremap_wc(xe->mem.vram.io_start, xe->mem.vram.io_size);
> @@ -281,7 +282,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
>  			return -ENODEV;
>  		}
>  
> -		tile->mem.vram.base = tile_offset;
> +		tile->mem.vram.dpa_base = xe->mem.vram.dpa_base + tile_offset;
>  		tile->mem.vram.usable_size = vram_size;
>  		tile->mem.vram.mapping = xe->mem.vram.mapping + tile_offset;
>  
> @@ -304,10 +305,10 @@ int xe_mmio_probe_vram(struct xe_device *xe)
>  		io_size -= min_t(u64, tile_size, io_size);
>  	}
>  
> -	xe->mem.vram.size = total_size;
> +	xe->mem.vram.actual_physical_size = total_size;
>  
>  	drm_info(&xe->drm, "Total VRAM: %pa, %pa\n", &xe->mem.vram.io_start,
> -		 &xe->mem.vram.size);
> +		 &xe->mem.vram.actual_physical_size);
>  	drm_info(&xe->drm, "Available VRAM: %pa, %pa\n", &xe->mem.vram.io_start,
>  		 &available_size);
>  
> -- 
> 2.26.3
> 
