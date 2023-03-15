Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66115C61DA4
	for <intel-xe@archiver.kernel.org>; Wed, 15 Mar 2023 09:52:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E71810E998;
	Wed, 15 Mar 2023 09:52:31 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A26E10E996
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Mar 2023 09:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678873948; x=1710409948;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=xS6xJUjKsGVRxcp0wpOq8FKrj4mMH4gFoDbbveZ0FlA=;
 b=SGeKJk1R8O0yp9P+SuK2O3NJfziv13pzRnCvFctLPraWT0dYw4klsgIm
 jOlN6tnmNTK3I3Rn939g2lGogjk0jpKJ7wDM7bC2nbi/ZgImS3MUJEIOs
 JBNBBJMawydUY/duHNgY/VRb7P+gpmyderD5+u/QBe/0sX1veskUlS+vK
 YvDEkNFIWWOla6KOoHg1UW0iOaDD59LSw0J4INxBlbFJCHonmDFyLeEGW
 OjSst48wXiNAtG+gPtzxq7zkpGQYZrg28KRWJfdYkFydYu4xi+R78Of2G
 B3xJc2qn8ld1N7XJJUsnAkGkHXLNiwSeKG2yfxfs1ABPO12kiauxMxpJq Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="340022385"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; d="scan'208";a="340022385"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2023 02:52:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="709623188"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; d="scan'208";a="709623188"
Received: from wujunyox-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.59.32])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2023 02:52:26 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20230314155111.1546283-2-francois.dugast@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230314155111.1546283-1-francois.dugast@intel.com>
 <20230314155111.1546283-2-francois.dugast@intel.com>
Date: Wed, 15 Mar 2023 11:52:23 +0200
Message-ID: <87ttym5oko.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [RFC PATCH v2 1/3] drm/xe: Introduce function
 pointers in xe_gt.c with local structure
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

On Tue, 14 Mar 2023, Francois Dugast <francois.dugast@intel.com> wrote:
> A local structure of function pointers is used as a minimal
> hardware abstraction layer to split between common and platform
> specific code. This structure is initialized once with the
> functions matching the platform, then it is used in the common
> code with no need for switch or if/else to detect the platform.
> For now only the function setup_private_ppat() is refactored.
>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_types.h |  1 +
>  drivers/gpu/drm/xe/xe_gt.c           | 46 +++++++++++++++++++---------
>  2 files changed, 33 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 034e0956f4ea..411e7a62d28a 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -311,6 +311,7 @@ struct xe_device {
>  		u32 lvds_channel_mode;
>  	} params;
>  #endif
> +	struct xe_gt_platform_funcs *gt_funcs;

IMO this should be a const pointer.

>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index daa433d0f2f5..3b092f951378 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -42,6 +42,10 @@
>  #include "xe_wa.h"
>  #include "xe_wopcm.h"
>  
> +struct xe_gt_platform_funcs {
> +	void (*setup_private_ppat)(struct xe_gt *gt);
> +};
> +
>  struct xe_gt *xe_find_full_gt(struct xe_gt *gt)
>  {
>  	struct xe_gt *search;
> @@ -157,18 +161,6 @@ static void mtl_setup_private_ppat(struct xe_gt *gt)
>  			MTL_PPAT_0_WB | MTL_3_COH_2W);
>  }
>  
> -static void setup_private_ppat(struct xe_gt *gt)
> -{
> -	struct xe_device *xe = gt_to_xe(gt);
> -
> -	if (xe->info.platform == XE_METEORLAKE)
> -		mtl_setup_private_ppat(gt);
> -	else if (xe->info.platform == XE_PVC)
> -		pvc_setup_private_ppat(gt);
> -	else
> -		tgl_setup_private_ppat(gt);
> -}

IMO keep this as a wrapper that calls the function pointer.

> -
>  static int gt_ttm_mgr_init(struct xe_gt *gt)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
> @@ -380,6 +372,28 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
>  int xe_gt_init_early(struct xe_gt *gt)
>  {
>  	int err;
> +	struct xe_device *xe = gt_to_xe(gt);
> +
> +	xe->gt_funcs = kzalloc(sizeof(*xe->gt_funcs), GFP_KERNEL);
> +	switch (xe->info.platform) {
> +	case XE_METEORLAKE:
> +		xe->gt_funcs->setup_private_ppat = mtl_setup_private_ppat;
> +		break;
> +	case XE_PVC:
> +		xe->gt_funcs->setup_private_ppat = pvc_setup_private_ppat;
> +		break;
> +	case XE_ROCKETLAKE:
> +	case XE_DG1:
> +	case XE_DG2:
> +	case XE_ALDERLAKE_S:
> +	case XE_ALDERLAKE_P:
> +	case XE_TIGERLAKE:
> +		xe->gt_funcs->setup_private_ppat = tgl_setup_private_ppat;
> +		break;
> +	default:
> +		DRM_ERROR("Unsupported platform\n");
> +		break;
> +	}

IMO you should always aim to have static const initialized structs with
the function pointers, assign the const pointer to the struct, and avoid
assigning individual function pointers members.

It's a bad practise to allocate the function pointer struct.

>  
>  	xe_force_wake_init_gt(gt, gt_to_fw(gt));
>  
> @@ -441,13 +455,15 @@ int xe_gt_init_noalloc(struct xe_gt *gt)
>  static int gt_fw_domain_init(struct xe_gt *gt)
>  {
>  	int err, i;
> +	struct xe_device *xe = gt_to_xe(gt);
>  
>  	xe_device_mem_access_get(gt_to_xe(gt));
>  	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>  	if (err)
>  		goto err_hw_fence_irq;
>  
> -	setup_private_ppat(gt);
> +	if (xe->gt_funcs->setup_private_ppat)
> +		xe->gt_funcs->setup_private_ppat(gt);

IME it's better to keep functions like setup_private_ppat() as wrappers
to the function calls. The caller does not need to know the
implementation details i.e. whether it's a function pointer or not.

BR,
Jani.

>  
>  	if (!xe_gt_is_media_type(gt)) {
>  		err = xe_ggtt_init(gt, gt->mem.ggtt);
> @@ -630,8 +646,10 @@ static int do_gt_restart(struct xe_gt *gt)
>  	struct xe_hw_engine *hwe;
>  	enum xe_hw_engine_id id;
>  	int err;
> +	struct xe_device *xe = gt_to_xe(gt);
>  
> -	setup_private_ppat(gt);
> +	if (xe->gt_funcs->setup_private_ppat)
> +		xe->gt_funcs->setup_private_ppat(gt);
>  
>  	xe_gt_mcr_set_implicit_defaults(gt);
>  	xe_reg_sr_apply_mmio(&gt->reg_sr, gt);

-- 
Jani Nikula, Intel Open Source Graphics Center
