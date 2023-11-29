Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28106C4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 09:38:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF8BA10E3F3;
	Wed, 29 Nov 2023 09:38:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB4C910E3F1
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 09:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701250729; x=1732786729;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=tL/vEL/D23tb26ENzAHELAJiMrQGkc9d+n2TfuWMmpw=;
 b=cVlEXCdNTdNg8j+SKNYHUG8dBIU4+QdMZSGKaABzQoWvHoiMTd4Sg+AR
 JYfR2r0zE+R4IeGdRF5j5OHOznXXvobyFm6nc9TUGTJz2dwMKms3MJoJq
 6KxLfiMw7/ED2Gmmq6MWHPKw/2rQqT7dh1vJSMoq32VHbHDj2Hg9ELEoo
 6OyCHy4j/Ri2Fer3WWnf1MGgHCqUZs/gi/0uETQd4HlRAlkorsg2k9iB4
 9IJGBG833o8cNHv6CexOh6ne/BThbvRRmmGPTztlE61w1uvo3EjgTJt8T
 h9T75wk4mfc8mDI9vksBEI7spKydkESI0pRFzUxfZefNEhYJSHY3yNFj6 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="383528283"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; d="scan'208";a="383528283"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 01:38:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="892375857"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; d="scan'208";a="892375857"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orsmga004.jf.intel.com with ESMTP; 29 Nov 2023 01:38:45 -0800
Received: from [10.249.156.143] (unknown [10.249.156.143])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id A455D36344;
 Wed, 29 Nov 2023 09:38:44 +0000 (GMT)
Message-ID: <e74cb84b-4ecf-45fd-b730-e0009ec76351@intel.com>
Date: Wed, 29 Nov 2023 10:38:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20231129011624.836843-1-michal.winiarski@intel.com>
 <20231129011624.836843-15-michal.winiarski@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20231129011624.836843-15-michal.winiarski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH v4 14/22] drm/xe: Add a helper for DRM
 device-lifetime BO create
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 29.11.2023 02:16, Michał Winiarski wrote:
> A helper for managed BO allocations makes it possible to remove specific
> "fini" actions and will simplify the following patches adding ability to
> execute a release action for specific BO directly.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c           | 33 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_bo.h           |  4 ++++
>  drivers/gpu/drm/xe/xe_ggtt.c         |  6 +----
>  drivers/gpu/drm/xe/xe_guc_ads.c      | 20 +++--------------
>  drivers/gpu/drm/xe/xe_guc_ct.c       |  8 +++----
>  drivers/gpu/drm/xe/xe_guc_hwconfig.c | 18 +++------------
>  drivers/gpu/drm/xe/xe_guc_log.c      | 19 +++-------------
>  drivers/gpu/drm/xe/xe_guc_pc.c       |  9 +++-----
>  drivers/gpu/drm/xe/xe_hw_engine.c    |  8 +++----
>  drivers/gpu/drm/xe/xe_uc_fw.c        |  9 ++++----
>  10 files changed, 60 insertions(+), 74 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index c5aa01c0861c7..7f5b616a7bbeb 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -9,6 +9,7 @@
>  
>  #include <drm/drm_drv.h>
>  #include <drm/drm_gem_ttm_helper.h>
> +#include <drm/drm_managed.h>
>  #include <drm/ttm/ttm_device.h>
>  #include <drm/ttm/ttm_placement.h>
>  #include <drm/ttm/ttm_tt.h>
> @@ -1493,6 +1494,38 @@ struct xe_bo *xe_bo_create_from_data(struct xe_device *xe, struct xe_tile *tile,
>  	return bo;
>  }
>  
> +static void __xe_bo_release(struct drm_device *drm, void *arg)

nit: __release_xe_bo() ? this is a drm action, not a xe_bo function

> +{
> +	xe_bo_unpin_map_no_vm(arg);
> +}
> +
> +struct xe_bo *xe_managed_bo_create_pin_map(struct xe_device *xe, struct xe_tile *tile,
> +					   size_t size, u32 flags)
> +{
> +	struct xe_bo *bo;
> +	int ret;
> +
> +	bo = xe_bo_create_pin_map(xe, tile, NULL, size, ttm_bo_type_kernel, flags);
> +	if (IS_ERR(bo))
> +		return bo;
> +
> +	ret = drmm_add_action_or_reset(&xe->drm, __xe_bo_release, bo);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	return bo;
> +}
> +
> +struct xe_bo *xe_managed_bo_create_from_data(struct xe_device *xe, struct xe_tile *tile,
> +					     const void *data, size_t size, u32 flags)
> +{
> +	struct xe_bo *bo = xe_managed_bo_create_pin_map(xe, tile, size, flags);
> +
> +	xe_map_memcpy_to(xe, &bo->vmap, 0, data, size);

will crash if "bo" is a ERR_PTR

> +
> +	return bo;
> +}
> +
>  /*
>   * XXX: This is in the VM bind data path, likely should calculate this once and
>   * store, with a recalculation if the BO is moved.
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 9f373f6d25f22..2cf32713bde9e 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -109,6 +109,10 @@ struct xe_bo *xe_bo_create_pin_map_at(struct xe_device *xe, struct xe_tile *tile
>  struct xe_bo *xe_bo_create_from_data(struct xe_device *xe, struct xe_tile *tile,
>  				     const void *data, size_t size,
>  				     enum ttm_bo_type type, u32 flags);
> +struct xe_bo *xe_managed_bo_create_pin_map(struct xe_device *xe, struct xe_tile *tile,
> +					   size_t size, u32 flags);
> +struct xe_bo *xe_managed_bo_create_from_data(struct xe_device *xe, struct xe_tile *tile,
> +					     const void *data, size_t size, u32 flags);

nit: isn't "xe_device *xe" redundant if we also pass a "xe_tile *tile" ?

>  
>  int xe_bo_placement_for_flags(struct xe_device *xe, struct xe_bo *bo,
>  			      u32 bo_flags);
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index fab3cc04882da..8dc783e9120d2 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -108,7 +108,6 @@ static void ggtt_fini(struct drm_device *drm, void *arg)
>  {
>  	struct xe_ggtt *ggtt = arg;
>  
> -	xe_bo_unpin_map_no_vm(ggtt->scratch);
>  	ggtt->scratch = NULL;
>  }
>  
> @@ -225,10 +224,7 @@ int xe_ggtt_init(struct xe_ggtt *ggtt)
>  	else
>  		flags |= XE_BO_CREATE_VRAM_IF_DGFX(ggtt->tile);
>  
> -	ggtt->scratch = xe_bo_create_pin_map(xe, ggtt->tile, NULL, XE_PAGE_SIZE,
> -					     ttm_bo_type_kernel,
> -					     flags);
> -
> +	ggtt->scratch = xe_managed_bo_create_pin_map(xe, ggtt->tile, XE_PAGE_SIZE, flags);
>  	if (IS_ERR(ggtt->scratch)) {
>  		err = PTR_ERR(ggtt->scratch);
>  		goto err;
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index 88789826e7817..2f5ff090aa6bd 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -202,13 +202,6 @@ static size_t guc_ads_size(struct xe_guc_ads *ads)
>  		guc_ads_private_data_size(ads);
>  }
>  
> -static void guc_ads_fini(struct drm_device *drm, void *arg)
> -{
> -	struct xe_guc_ads *ads = arg;
> -
> -	xe_bo_unpin_map_no_vm(ads->bo);
> -}
> -
>  static bool needs_wa_1607983814(struct xe_device *xe)
>  {
>  	return GRAPHICS_VERx100(xe) < 1250;
> @@ -274,25 +267,18 @@ int xe_guc_ads_init(struct xe_guc_ads *ads)
>  	struct xe_gt *gt = ads_to_gt(ads);
>  	struct xe_tile *tile = gt_to_tile(gt);
>  	struct xe_bo *bo;
> -	int err;
>  
>  	ads->golden_lrc_size = calculate_golden_lrc_size(ads);
>  	ads->regset_size = calculate_regset_size(gt);
>  
> -	bo = xe_bo_create_pin_map(xe, tile, NULL, guc_ads_size(ads) +
> -				  MAX_GOLDEN_LRC_SIZE,
> -				  ttm_bo_type_kernel,
> -				  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> -				  XE_BO_CREATE_GGTT_BIT);
> +	bo = xe_managed_bo_create_pin_map(xe, tile, guc_ads_size(ads) + MAX_GOLDEN_LRC_SIZE,
> +					  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> +					  XE_BO_CREATE_GGTT_BIT);
>  	if (IS_ERR(bo))
>  		return PTR_ERR(bo);
>  
>  	ads->bo = bo;
>  
> -	err = drmm_add_action_or_reset(&xe->drm, guc_ads_fini, ads);
> -	if (err)
> -		return err;
> -
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index c44e750746958..93c886ef6fdb4 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -112,7 +112,6 @@ static void guc_ct_fini(struct drm_device *drm, void *arg)
>  	struct xe_guc_ct *ct = arg;
>  
>  	xa_destroy(&ct->fence_lookup);
> -	xe_bo_unpin_map_no_vm(ct->bo);
>  }
>  
>  static void g2h_worker_func(struct work_struct *w);
> @@ -146,10 +145,9 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
>  
>  	primelockdep(ct);
>  
> -	bo = xe_bo_create_pin_map(xe, tile, NULL, guc_ct_size(),
> -				  ttm_bo_type_kernel,
> -				  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> -				  XE_BO_CREATE_GGTT_BIT);
> +	bo = xe_managed_bo_create_pin_map(xe, tile, guc_ct_size(),
> +					  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> +					  XE_BO_CREATE_GGTT_BIT);
>  	if (IS_ERR(bo))
>  		return PTR_ERR(bo);
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_hwconfig.c b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> index 57d325ec8ce32..8e3db5d7192c3 100644
> --- a/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> +++ b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> @@ -47,13 +47,6 @@ static int guc_hwconfig_copy(struct xe_guc *guc)
>  	return 0;
>  }
>  
> -static void guc_hwconfig_fini(struct drm_device *drm, void *arg)
> -{
> -	struct xe_guc *guc = arg;
> -
> -	xe_bo_unpin_map_no_vm(guc->hwconfig.bo);
> -}
> -
>  int xe_guc_hwconfig_init(struct xe_guc *guc)
>  {
>  	struct xe_device *xe = guc_to_xe(guc);
> @@ -83,19 +76,14 @@ int xe_guc_hwconfig_init(struct xe_guc *guc)
>  	if (!size)
>  		return -EINVAL;
>  
> -	bo = xe_bo_create_pin_map(xe, tile, NULL, PAGE_ALIGN(size),
> -				  ttm_bo_type_kernel,
> -				  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> -				  XE_BO_CREATE_GGTT_BIT);
> +	bo = xe_managed_bo_create_pin_map(xe, tile, PAGE_ALIGN(size),
> +					  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> +					  XE_BO_CREATE_GGTT_BIT);
>  	if (IS_ERR(bo))
>  		return PTR_ERR(bo);
>  	guc->hwconfig.bo = bo;
>  	guc->hwconfig.size = size;
>  
> -	err = drmm_add_action_or_reset(&xe->drm, guc_hwconfig_fini, guc);
> -	if (err)
> -		return err;
> -
>  	return guc_hwconfig_copy(guc);
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
> index 27c3827bfd054..bcd2f4d34081d 100644
> --- a/drivers/gpu/drm/xe/xe_guc_log.c
> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
> @@ -77,24 +77,15 @@ void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p)
>  	}
>  }
>  
> -static void guc_log_fini(struct drm_device *drm, void *arg)
> -{
> -	struct xe_guc_log *log = arg;
> -
> -	xe_bo_unpin_map_no_vm(log->bo);
> -}
> -
>  int xe_guc_log_init(struct xe_guc_log *log)
>  {
>  	struct xe_device *xe = log_to_xe(log);
>  	struct xe_tile *tile = gt_to_tile(log_to_gt(log));
>  	struct xe_bo *bo;
> -	int err;
>  
> -	bo = xe_bo_create_pin_map(xe, tile, NULL, guc_log_size(),
> -				  ttm_bo_type_kernel,
> -				  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> -				  XE_BO_CREATE_GGTT_BIT);
> +	bo = xe_managed_bo_create_pin_map(xe, tile, guc_log_size(),
> +					  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> +					  XE_BO_CREATE_GGTT_BIT);
>  	if (IS_ERR(bo))
>  		return PTR_ERR(bo);
>  
> @@ -102,9 +93,5 @@ int xe_guc_log_init(struct xe_guc_log *log)
>  	log->bo = bo;
>  	log->level = xe_modparam.guc_log_level;
>  
> -	err = drmm_add_action_or_reset(&xe->drm, guc_log_fini, log);
> -	if (err)
> -		return err;
> -
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index e9dd6c3d750bd..f5009a7968afa 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -936,7 +936,6 @@ void xe_guc_pc_fini(struct xe_guc_pc *pc)
>  	XE_WARN_ON(xe_guc_pc_gucrc_disable(pc));
>  	XE_WARN_ON(xe_guc_pc_stop(pc));
>  	sysfs_remove_files(pc_to_gt(pc)->sysfs, pc_attrs);
> -	xe_bo_unpin_map_no_vm(pc->bo);
>  	mutex_destroy(&pc->freq_lock);
>  }
>  
> @@ -955,11 +954,9 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
>  
>  	mutex_init(&pc->freq_lock);
>  
> -	bo = xe_bo_create_pin_map(xe, tile, NULL, size,
> -				  ttm_bo_type_kernel,
> -				  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> -				  XE_BO_CREATE_GGTT_BIT);
> -
> +	bo = xe_managed_bo_create_pin_map(xe, tile, size,
> +					  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> +					  XE_BO_CREATE_GGTT_BIT);
>  	if (IS_ERR(bo))
>  		return PTR_ERR(bo);
>  
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index e831e63c5e485..34990f396a1a8 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -238,8 +238,6 @@ static void hw_engine_fini(struct drm_device *drm, void *arg)
>  		xe_execlist_port_destroy(hwe->exl_port);
>  	xe_lrc_finish(&hwe->kernel_lrc);
>  
> -	xe_bo_unpin_map_no_vm(hwe->hwsp);
> -
>  	hwe->gt = NULL;
>  }
>  
> @@ -427,9 +425,9 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
>  	xe_reg_sr_apply_mmio(&hwe->reg_sr, gt);
>  	xe_reg_sr_apply_whitelist(hwe);
>  
> -	hwe->hwsp = xe_bo_create_pin_map(xe, tile, NULL, SZ_4K, ttm_bo_type_kernel,
> -					 XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> -					 XE_BO_CREATE_GGTT_BIT);
> +	hwe->hwsp = xe_managed_bo_create_pin_map(xe, tile, SZ_4K,
> +						 XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> +						 XE_BO_CREATE_GGTT_BIT);
>  	if (IS_ERR(hwe->hwsp)) {
>  		err = PTR_ERR(hwe->hwsp);
>  		goto err_name;
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index 25778887d846f..5b86c51941335 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -266,7 +266,6 @@ static void uc_fw_fini(struct drm_device *drm, void *arg)
>  	if (!xe_uc_fw_is_available(uc_fw))
>  		return;
>  
> -	xe_bo_unpin_map_no_vm(uc_fw->bo);
>  	xe_uc_fw_change_status(uc_fw, XE_UC_FIRMWARE_SELECTED);
>  }
>  
> @@ -575,10 +574,9 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
>  	if (err)
>  		goto fail;
>  
> -	obj = xe_bo_create_from_data(xe, tile, fw->data, fw->size,
> -				     ttm_bo_type_kernel,
> -				     XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> -				     XE_BO_CREATE_GGTT_BIT);
> +	obj = xe_managed_bo_create_from_data(xe, tile, fw->data, fw->size,
> +					     XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> +					     XE_BO_CREATE_GGTT_BIT);
>  	if (IS_ERR(obj)) {
>  		drm_notice(&xe->drm, "%s firmware %s: failed to create / populate bo",
>  			   xe_uc_fw_type_repr(uc_fw->type), uc_fw->path);
> @@ -609,6 +607,7 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
>  		 xe_uc_fw_type_repr(uc_fw->type), XE_UC_FIRMWARE_URL);
>  
>  	release_firmware(fw);		/* OK even if fw is NULL */
> +
>  	return err;
>  }
>  
