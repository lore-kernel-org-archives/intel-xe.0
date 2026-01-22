Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F29D62618
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jan 2026 11:51:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1B0310E99E;
	Thu, 22 Jan 2026 11:51:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VPRLhJ7Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B108C10E094;
 Thu, 22 Jan 2026 11:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769082702; x=1800618702;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=jfr8kn3V0aWXrwdr5yf10x2cmM0L0paUnfzJbc+BxFc=;
 b=VPRLhJ7YF7uRzltQ8NoyF1n5QZ22YZjLtHUJKYQzGSm9WZYdcmEk/WK9
 3B2sRqrzO59Ak0f6L+GG2Ivtd1IcsaYZfHtY1E/CzGK6owf9HMejBhYcU
 Rm85/W3OSqdgcsFIAHR6ymIfgSER0rz9zV0xg3cPO/7cpuJXQbvjPoTN3
 byGiWH9k3OkyH6YdF9lJC020B5MIAilNctso4jUq8ynTbPTQFMeBWDjlh
 WNbO91ziIXOZ0WshRST4ljhq7dGfxYKW+lthtfSmHUzMgEUo7floXOmwG
 r16mRXWEesh7ItpvPAhOG65xo0wRYnez7NdLsDivZmI+rFcRksn5vCZhl g==;
X-CSE-ConnectionGUID: t7hkAEY8RtOab4oR5M52Hw==
X-CSE-MsgGUID: rZ9Xx6t0T4uzeU+diXWGsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="69339829"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="69339829"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 03:51:42 -0800
X-CSE-ConnectionGUID: FVKhefnARMiwfjtMhFp5vw==
X-CSE-MsgGUID: f/yiy5qpQ1+3GRFjo6HHvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="205839217"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.192])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 03:51:40 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Uma Shankar <uma.shankar@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, Uma Shankar <uma.shankar@intel.com>
Subject: Re: [v2 09/19] drm/{i915, xe}: Remove i915_reg.h from intel_overlay.c
In-Reply-To: <20260121232414.707192-10-uma.shankar@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260121232414.707192-1-uma.shankar@intel.com>
 <20260121232414.707192-10-uma.shankar@intel.com>
Date: Thu, 22 Jan 2026 13:51:37 +0200
Message-ID: <5ca273535beadccfab95542b986a65720d44a88f@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Thu, 22 Jan 2026, Uma Shankar <uma.shankar@intel.com> wrote:
> Move GEN2_ISR and some interrupt definitions to common header.
> This removes dependency of i915_reg.h from intel_overlay.c.

Subject: drm/i915.

Here too I think this should be a dedicated file for the feture.

I actually think we might be able to refactor this away, but for the
time being a header in include/drm/intel is probably fine. But at least
you can just git grep who includes it (provided it's not included in
i915_reg.h!) and see what to do about it.

BR,
Jani.

>
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_overlay.c |  2 +-
>  drivers/gpu/drm/i915/i915_reg.h              | 36 -------------------
>  include/drm/intel/intel_gmd_common_regs.h    | 38 ++++++++++++++++++++
>  3 files changed, 39 insertions(+), 37 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_overlay.c b/drivers/gpu/drm/i915/display/intel_overlay.c
> index 88eb7ae5765c..62026f7f71d3 100644
> --- a/drivers/gpu/drm/i915/display/intel_overlay.c
> +++ b/drivers/gpu/drm/i915/display/intel_overlay.c
> @@ -28,6 +28,7 @@
>  
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_print.h>
> +#include <drm/intel/intel_gmd_common_regs.h>
>  
>  #include "gem/i915_gem_internal.h"
>  #include "gem/i915_gem_object_frontbuffer.h"
> @@ -37,7 +38,6 @@
>  #include "gt/intel_ring.h"
>  
>  #include "i915_drv.h"
> -#include "i915_reg.h"
>  #include "intel_color_regs.h"
>  #include "intel_de.h"
>  #include "intel_display_regs.h"
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index c1d141e9ca47..504ba9b2fb5b 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -522,42 +522,6 @@
>  /* These are all the "old" interrupts */
>  #define ILK_BSD_USER_INTERRUPT				(1 << 5)
>  
> -#define I915_PM_INTERRUPT				(1 << 31)
> -#define I915_ISP_INTERRUPT				(1 << 22)
> -#define I915_LPE_PIPE_B_INTERRUPT			(1 << 21)
> -#define I915_LPE_PIPE_A_INTERRUPT			(1 << 20)
> -#define I915_MIPIC_INTERRUPT				(1 << 19)
> -#define I915_MIPIA_INTERRUPT				(1 << 18)
> -#define I915_PIPE_CONTROL_NOTIFY_INTERRUPT		(1 << 18)
> -#define I915_DISPLAY_PORT_INTERRUPT			(1 << 17)
> -#define I915_DISPLAY_PIPE_C_HBLANK_INTERRUPT		(1 << 16)
> -#define I915_MASTER_ERROR_INTERRUPT			(1 << 15)
> -#define I915_DISPLAY_PIPE_B_HBLANK_INTERRUPT		(1 << 14)
> -#define I915_GMCH_THERMAL_SENSOR_EVENT_INTERRUPT	(1 << 14) /* p-state */
> -#define I915_DISPLAY_PIPE_A_HBLANK_INTERRUPT		(1 << 13)
> -#define I915_HWB_OOM_INTERRUPT				(1 << 13)
> -#define I915_LPE_PIPE_C_INTERRUPT			(1 << 12)
> -#define I915_SYNC_STATUS_INTERRUPT			(1 << 12)
> -#define I915_MISC_INTERRUPT				(1 << 11)
> -#define I915_DISPLAY_PLANE_A_FLIP_PENDING_INTERRUPT	(1 << 11)
> -#define I915_DISPLAY_PIPE_C_VBLANK_INTERRUPT		(1 << 10)
> -#define I915_DISPLAY_PLANE_B_FLIP_PENDING_INTERRUPT	(1 << 10)
> -#define I915_DISPLAY_PIPE_C_EVENT_INTERRUPT		(1 << 9)
> -#define I915_OVERLAY_PLANE_FLIP_PENDING_INTERRUPT	(1 << 9)
> -#define I915_DISPLAY_PIPE_C_DPBM_INTERRUPT		(1 << 8)
> -#define I915_DISPLAY_PLANE_C_FLIP_PENDING_INTERRUPT	(1 << 8)
> -#define I915_DISPLAY_PIPE_A_VBLANK_INTERRUPT		(1 << 7)
> -#define I915_DISPLAY_PIPE_A_EVENT_INTERRUPT		(1 << 6)
> -#define I915_DISPLAY_PIPE_B_VBLANK_INTERRUPT		(1 << 5)
> -#define I915_DISPLAY_PIPE_B_EVENT_INTERRUPT		(1 << 4)
> -#define I915_DISPLAY_PIPE_A_DPBM_INTERRUPT		(1 << 3)
> -#define I915_DISPLAY_PIPE_B_DPBM_INTERRUPT		(1 << 2)
> -#define I915_DEBUG_INTERRUPT				(1 << 2)
> -#define I915_WINVALID_INTERRUPT				(1 << 1)
> -#define I915_USER_INTERRUPT				(1 << 1)
> -#define I915_ASLE_INTERRUPT				(1 << 0)
> -#define I915_BSD_USER_INTERRUPT				(1 << 25)
> -
>  #define GEN6_BSD_RNCID			_MMIO(0x12198)
>  
>  #define GEN7_FF_THREAD_MODE		_MMIO(0x20a0)
> diff --git a/include/drm/intel/intel_gmd_common_regs.h b/include/drm/intel/intel_gmd_common_regs.h
> index 489d59379ab0..2214cee38cf7 100644
> --- a/include/drm/intel/intel_gmd_common_regs.h
> +++ b/include/drm/intel/intel_gmd_common_regs.h
> @@ -110,4 +110,42 @@
>  #define   GMD_ID_RELEASE_MASK			REG_GENMASK(21, 14)
>  #define   GMD_ID_STEP				REG_GENMASK(5, 0)
>  
> +#define GEN2_ISR       _MMIO(0x20ac)

This is duplication, and only used in display.

> +
> +#define I915_PM_INTERRUPT				(1 << 31)
> +#define I915_ISP_INTERRUPT				(1 << 22)
> +#define I915_LPE_PIPE_B_INTERRUPT			(1 << 21)
> +#define I915_LPE_PIPE_A_INTERRUPT			(1 << 20)
> +#define I915_MIPIC_INTERRUPT				(1 << 19)
> +#define I915_MIPIA_INTERRUPT				(1 << 18)
> +#define I915_PIPE_CONTROL_NOTIFY_INTERRUPT		(1 << 18)
> +#define I915_DISPLAY_PORT_INTERRUPT			(1 << 17)
> +#define I915_DISPLAY_PIPE_C_HBLANK_INTERRUPT		(1 << 16)
> +#define I915_MASTER_ERROR_INTERRUPT			(1 << 15)
> +#define I915_DISPLAY_PIPE_B_HBLANK_INTERRUPT		(1 << 14)
> +#define I915_GMCH_THERMAL_SENSOR_EVENT_INTERRUPT	(1 << 14) /* p-state */
> +#define I915_DISPLAY_PIPE_A_HBLANK_INTERRUPT		(1 << 13)
> +#define I915_HWB_OOM_INTERRUPT				(1 << 13)
> +#define I915_LPE_PIPE_C_INTERRUPT			(1 << 12)
> +#define I915_SYNC_STATUS_INTERRUPT			(1 << 12)
> +#define I915_MISC_INTERRUPT				(1 << 11)
> +#define I915_DISPLAY_PLANE_A_FLIP_PENDING_INTERRUPT	(1 << 11)
> +#define I915_DISPLAY_PIPE_C_VBLANK_INTERRUPT		(1 << 10)
> +#define I915_DISPLAY_PLANE_B_FLIP_PENDING_INTERRUPT	(1 << 10)
> +#define I915_DISPLAY_PIPE_C_EVENT_INTERRUPT		(1 << 9)
> +#define I915_OVERLAY_PLANE_FLIP_PENDING_INTERRUPT	(1 << 9)
> +#define I915_DISPLAY_PIPE_C_DPBM_INTERRUPT		(1 << 8)
> +#define I915_DISPLAY_PLANE_C_FLIP_PENDING_INTERRUPT	(1 << 8)
> +#define I915_DISPLAY_PIPE_A_VBLANK_INTERRUPT		(1 << 7)
> +#define I915_DISPLAY_PIPE_A_EVENT_INTERRUPT		(1 << 6)
> +#define I915_DISPLAY_PIPE_B_VBLANK_INTERRUPT		(1 << 5)
> +#define I915_DISPLAY_PIPE_B_EVENT_INTERRUPT		(1 << 4)
> +#define I915_DISPLAY_PIPE_A_DPBM_INTERRUPT		(1 << 3)
> +#define I915_DISPLAY_PIPE_B_DPBM_INTERRUPT		(1 << 2)
> +#define I915_DEBUG_INTERRUPT				(1 << 2)
> +#define I915_WINVALID_INTERRUPT				(1 << 1)
> +#define I915_USER_INTERRUPT				(1 << 1)
> +#define I915_ASLE_INTERRUPT				(1 << 0)
> +#define I915_BSD_USER_INTERRUPT				(1 << 25)
> +
>  #endif

-- 
Jani Nikula, Intel
