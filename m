Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08BD7C4332F
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 11:18:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A585F10E8C4;
	Thu,  9 Nov 2023 11:18:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8339010E8B5
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 11:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699528734; x=1731064734;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=xKCrRbtLqWDD87y8oNB/Zx2icJf9iKqyYkh8nee5CY8=;
 b=fkQS9drI3jhR/0LbKylgOsHbgaA/pJM2aBKW/PNubh7b9es1a+Yl1tgb
 JU4pUsl0owuk655C1l94Z629NQ7YCLiPgv24Cscgaw5muM+xgzOn8pnX8
 mFh/j4T0+T0fqXKJPKAdtTw9mfMeRCOAYYWLQaYeQa4H6flkHGfRbTaII
 lTRQo1HMhQXiDr9hwvobSBjFmDiDoJ3aNq8b9BO2pVxYJQPsAkHGHv/mO
 aU4+JsDIu3soG2xsk4xEEFfyG0yWMts4VeuNl/k0ZumGL31CudulzVtDU
 asmhGq7j5HJPOAuvdlJAAMwLDXP5BIm0H+rmIm8yV6aHoUgxFIFqIv6ZS w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="375004765"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="375004765"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 03:18:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="833797190"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="833797190"
Received: from maikenmu-mobl.ger.corp.intel.com (HELO [10.251.217.171])
 ([10.251.217.171])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 03:18:52 -0800
Message-ID: <8de54b7d-f4d8-4b76-a374-5eafa357e959@linux.intel.com>
Date: Thu, 9 Nov 2023 12:18:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 intel-xe@lists.freedesktop.org
References: <20231107203032.20115-1-juhapekka.heikkila@gmail.com>
 <20231107203032.20115-2-juhapekka.heikkila@gmail.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20231107203032.20115-2-juhapekka.heikkila@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH v6 2/2] drm/i915: xe dpt integration
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
Cc: Jani Nikula <jani.nikula@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 2023-11-07 21:30, Juha-Pekka Heikkila wrote:
> From: Jani Nikula <jani.nikula@intel.com>
> 
> Abstract i915 and Xe dpt related differences. Create
> intel_dpt_common.c where common dpt code go into.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>   drivers/gpu/drm/i915/Makefile                 |  1 +
>   .../gpu/drm/i915/display/intel_atomic_plane.c | 12 ++++-
>   drivers/gpu/drm/i915/display/intel_display.c  |  1 +
>   .../drm/i915/display/intel_display_types.h    |  1 +
>   drivers/gpu/drm/i915/display/intel_dpt.c      | 26 -----------
>   drivers/gpu/drm/i915/display/intel_dpt.h      |  2 -
>   .../gpu/drm/i915/display/intel_dpt_common.c   | 45 +++++++++++++++++++
>   .../gpu/drm/i915/display/intel_dpt_common.h   | 13 ++++++
>   drivers/gpu/drm/i915/display/intel_fb.c       | 34 +++++++++++---
>   .../drm/i915/display/skl_universal_plane.c    |  6 ++-
>   drivers/gpu/drm/xe/Makefile                   |  2 +-
>   11 files changed, 105 insertions(+), 38 deletions(-)
>   create mode 100644 drivers/gpu/drm/i915/display/intel_dpt_common.c
>   create mode 100644 drivers/gpu/drm/i915/display/intel_dpt_common.h
> 
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index 3c26e9ae3722..3b745ee8b3c5 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -260,6 +260,7 @@ i915-y += \
>   	display/intel_dpll.o \
>   	display/intel_dpll_mgr.o \
>   	display/intel_dpt.o \
> +	display/intel_dpt_common.o \
>   	display/intel_drrs.o \
>   	display/intel_dsb.o \
>   	display/intel_fb.o \
> diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> index 7adf9e0059c5..eabb6c6dde3f 100644
> --- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> +++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> @@ -119,6 +119,15 @@ intel_plane_duplicate_state(struct drm_plane *plane)
>   	return &intel_state->uapi;
>   }
>   
> +static void check_intel_plane_state_vmas(struct drm_device *dev,
> +					 struct intel_plane_state *intel_state)
> +{
> +	drm_WARN_ON(dev, intel_state->ggtt_vma);
> +#ifdef I915
> +	drm_WARN_ON(dev, intel_state->dpt_vma);
> +#endif
> +}
> +
>   /**
>    * intel_plane_destroy_state - destroy plane state
>    * @plane: drm plane
> @@ -133,8 +142,7 @@ intel_plane_destroy_state(struct drm_plane *plane,
>   {
>   	struct intel_plane_state *plane_state = to_intel_plane_state(state);
>   
> -	drm_WARN_ON(plane->dev, plane_state->ggtt_vma);
> -	drm_WARN_ON(plane->dev, plane_state->dpt_vma);
> +	check_intel_plane_state_vmas(plane->dev, plane_state);
>   
>   	__drm_atomic_helper_plane_destroy_state(&plane_state->uapi);
>   	if (plane_state->hw.fb)
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index 9874025cb77e..b1bedccfeae8 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -78,6 +78,7 @@
>   #include "intel_dpll.h"
>   #include "intel_dpll_mgr.h"
>   #include "intel_dpt.h"
> +#include "intel_dpt_common.h"
>   #include "intel_drrs.h"
>   #include "intel_dsb.h"
>   #include "intel_dsi.h"
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> index 8ae36bb8b937..ec708d84ec7f 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -699,6 +699,7 @@ struct intel_plane_state {
>   
>   	struct i915_vma *ggtt_vma;
>   	struct i915_vma *dpt_vma;
> +	struct i915_vma embed_vma;
>   	unsigned long flags;
>   #define PLANE_HAS_FENCE BIT(0)
>   
> diff --git a/drivers/gpu/drm/i915/display/intel_dpt.c b/drivers/gpu/drm/i915/display/intel_dpt.c
> index 2b067cb952f0..b29bceff73f2 100644
> --- a/drivers/gpu/drm/i915/display/intel_dpt.c
> +++ b/drivers/gpu/drm/i915/display/intel_dpt.c
> @@ -9,8 +9,6 @@
>   #include "gt/gen8_ppgtt.h"
>   
>   #include "i915_drv.h"
> -#include "i915_reg.h"
> -#include "intel_de.h"
>   #include "intel_display_types.h"
>   #include "intel_dpt.h"
>   #include "intel_fb.h"
> @@ -318,27 +316,3 @@ void intel_dpt_destroy(struct i915_address_space *vm)
>   	i915_vm_put(&dpt->vm);
>   }
>   
> -void intel_dpt_configure(struct intel_crtc *crtc)
> -{
> -	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
> -
> -	if (DISPLAY_VER(i915) == 14) {
> -		enum pipe pipe = crtc->pipe;
> -		enum plane_id plane_id;
> -
> -		for_each_plane_id_on_crtc(crtc, plane_id) {
> -			if (plane_id == PLANE_CURSOR)
> -				continue;
> -
> -			intel_de_rmw(i915, PLANE_CHICKEN(pipe, plane_id),
> -				     PLANE_CHICKEN_DISABLE_DPT,
> -				     i915->display.params.enable_dpt ? 0 :
> -				     PLANE_CHICKEN_DISABLE_DPT);
> -		}
> -	} else if (DISPLAY_VER(i915) == 13) {
> -		intel_de_rmw(i915, CHICKEN_MISC_2,
> -			     CHICKEN_MISC_DISABLE_DPT,
> -			     i915->display.params.enable_dpt ? 0 :
> -			     CHICKEN_MISC_DISABLE_DPT);
> -	}
> -}
> diff --git a/drivers/gpu/drm/i915/display/intel_dpt.h b/drivers/gpu/drm/i915/display/intel_dpt.h
> index d9a166550185..e18a9f767b11 100644
> --- a/drivers/gpu/drm/i915/display/intel_dpt.h
> +++ b/drivers/gpu/drm/i915/display/intel_dpt.h
> @@ -10,7 +10,6 @@ struct drm_i915_private;
>   
>   struct i915_address_space;
>   struct i915_vma;
> -struct intel_crtc;
>   struct intel_framebuffer;
>   
>   void intel_dpt_destroy(struct i915_address_space *vm);
> @@ -20,6 +19,5 @@ void intel_dpt_suspend(struct drm_i915_private *i915);
>   void intel_dpt_resume(struct drm_i915_private *i915);
>   struct i915_address_space *
>   intel_dpt_create(struct intel_framebuffer *fb);
> -void intel_dpt_configure(struct intel_crtc *crtc);
>   
>   #endif /* __INTEL_DPT_H__ */
> diff --git a/drivers/gpu/drm/i915/display/intel_dpt_common.c b/drivers/gpu/drm/i915/display/intel_dpt_common.c
> new file mode 100644
> index 000000000000..47586ec7f1a2
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/display/intel_dpt_common.c
> @@ -0,0 +1,45 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include "i915_reg.h"
> +#include "intel_de.h"
> +#include "intel_display_types.h"
> +#include "intel_dpt_common.h"
> +
> +/*
> + * For Xe introduce dummy intel_dpt_create which return NULL and will be
> + * optimized out by compiler.
> + */
> +#ifndef I915
> +struct i915_address_space *intel_dpt_create(struct intel_framebuffer *fb)
> +{
> +	return NULL;
> +}
> +#endif
> +
> +void intel_dpt_configure(struct intel_crtc *crtc)
> +{
> +	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
> +
> +	if (DISPLAY_VER(i915) == 14) {
> +		enum pipe pipe = crtc->pipe;
> +		enum plane_id plane_id;
> +
> +		for_each_plane_id_on_crtc(crtc, plane_id) {
> +			if (plane_id == PLANE_CURSOR)
> +				continue;
> +
> +			intel_de_rmw(i915, PLANE_CHICKEN(pipe, plane_id),
> +				     PLANE_CHICKEN_DISABLE_DPT,
> +				     i915->display.params.enable_dpt ? 0 :
> +				     PLANE_CHICKEN_DISABLE_DPT);
> +		}
> +	} else if (DISPLAY_VER(i915) == 13) {
> +		intel_de_rmw(i915, CHICKEN_MISC_2,
> +			     CHICKEN_MISC_DISABLE_DPT,
> +			     i915->display.params.enable_dpt ? 0 :
> +			     CHICKEN_MISC_DISABLE_DPT);
> +	}
> +}
> diff --git a/drivers/gpu/drm/i915/display/intel_dpt_common.h b/drivers/gpu/drm/i915/display/intel_dpt_common.h
> new file mode 100644
> index 000000000000..6d7de405126a
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/display/intel_dpt_common.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef __INTEL_DPT_COMMON_H__
> +#define __INTEL_DPT_COMMON_H__
> +
> +struct intel_crtc;
> +
> +void intel_dpt_configure(struct intel_crtc *crtc);
> +
> +#endif /* __INTEL_DPT_COMMON_H__ */
> diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
> index 3862e55e8980..035f51a310d4 100644
> --- a/drivers/gpu/drm/i915/display/intel_fb.c
> +++ b/drivers/gpu/drm/i915/display/intel_fb.c
> @@ -1885,17 +1885,36 @@ int intel_plane_compute_gtt(struct intel_plane_state *plane_state)
>   	return intel_plane_check_stride(plane_state);
>   }
>   
> -static void intel_user_framebuffer_destroy(struct drm_framebuffer *fb)
> +static void intel_user_framebuffer_destroy_vm(struct drm_framebuffer *fb)
>   {
> +#ifdef I915
>   	struct intel_framebuffer *intel_fb = to_intel_framebuffer(fb);
>   
> -	drm_framebuffer_cleanup(fb);
> -
>   	if (intel_fb_uses_dpt(fb))
>   		intel_dpt_destroy(intel_fb->dpt_vm);
> +#else
> +	if (intel_fb_obj(fb)->flags & XE_BO_CREATE_PINNED_BIT) {
> +		struct xe_bo *bo = intel_fb_obj(fb);
> +
> +		/* Unpin our kernel fb first */
> +		xe_bo_lock(bo, false);
> +		xe_bo_unpin(bo);
> +		xe_bo_unlock(bo);
> +	}
> +	xe_bo_put(intel_fb_obj(fb));
> +#endif
> +}

This chunk should not be part of the xe_dpt integration patch? I think 
it should be part of the fbdev changes.\

Might have been addressed by my changes to split up the big remaining patch.

Cheers,
~Maarten

> +static void intel_user_framebuffer_destroy(struct drm_framebuffer *fb)
> +{
> +	struct intel_framebuffer *intel_fb = to_intel_framebuffer(fb);
> +
> +	drm_framebuffer_cleanup(fb);
>   
>   	intel_frontbuffer_put(intel_fb->frontbuffer);
>   
> +	intel_user_framebuffer_destroy_vm(fb);
> +
>   	kfree(intel_fb);
>   }
>   
> @@ -2137,7 +2156,7 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
>   			}
>   		}
>   
> -		fb->obj[i] = &obj->base;
> +		fb->obj[i] = intel_bo_to_drm_bo(obj);
>   	}
>   
>   	ret = intel_fill_fb_info(dev_priv, intel_fb);
> @@ -2156,6 +2175,10 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
>   
>   		intel_fb->dpt_vm = vm;
>   	}
> +#ifndef I915
> +	/* Hold a reference to object while fb is alive */
> +	xe_bo_get(obj);
> +#endif
>   
>   	ret = drm_framebuffer_init(&dev_priv->drm, fb, &intel_fb_funcs);
>   	if (ret) {
> @@ -2166,8 +2189,7 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
>   	return 0;
>   
>   err_free_dpt:
> -	if (intel_fb_uses_dpt(fb))
> -		intel_dpt_destroy(intel_fb->dpt_vm);
> +	intel_user_framebuffer_destroy_vm(fb);
>   err:
>   	intel_frontbuffer_put(intel_fb->frontbuffer);
>   	return ret;
> diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> index 4553dd6bfbbd..68eabe089aaf 100644
> --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> @@ -1010,9 +1010,13 @@ static u32 skl_surf_address(const struct intel_plane_state *plane_state,
>   		 * The DPT object contains only one vma, so the VMA's offset
>   		 * within the DPT is always 0.
>   		 */
> -		drm_WARN_ON(&i915->drm, plane_state->dpt_vma->node.start);
>   		drm_WARN_ON(&i915->drm, offset & 0x1fffff);
> +#ifdef I915
> +		drm_WARN_ON(&i915->drm, plane_state->dpt_vma->node.start);
>   		return offset >> 9;
> +#else
> +		return 0;
> +#endif
>   	} else {
>   		drm_WARN_ON(&i915->drm, offset & 0xfff);
>   		return offset;
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index a1a8847e2ba3..b82641dcca70 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -201,7 +201,7 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
>   	i915-display/intel_dp_mst.o \
>   	i915-display/intel_dpll.o \
>   	i915-display/intel_dpll_mgr.o \
> -	i915-display/intel_dpt.o \
> +	i915-display/intel_dpt_common.o \
>   	i915-display/intel_drrs.o \
>   	i915-display/intel_dsb.o \
>   	i915-display/intel_dsi.o \
