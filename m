Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85DA5FEC0EA
	for <intel-xe@archiver.kernel.org>; Tue, 24 Mar 2026 17:40:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E9ED10E604;
	Tue, 24 Mar 2026 17:40:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jr3075Gn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FB3110E604;
 Tue, 24 Mar 2026 17:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774374057; x=1805910057;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=u/0gFANZ5dEfzWgxa0UPUJKda+e3XcIJ6yuvzDP764k=;
 b=jr3075Gnb+hNB7bPcFKqwPIadjVhkpVHSVOxwV3YCTzRu1i5ZenKYF+g
 x9boZtjWURKHGW9NPZEyaS550zaXI2esEKM64NEQOWXlXKyCu340+v5Jh
 RLiJ9OuXSrTLy1OOCTRfdEd5gQesZFB+5kwdljnoA8finTWTzmbzTtUic
 HqgimAZH96A+g0Vheg5/mgIgarH13kifneOTCPQwQyCSLvFhD5tczJPry
 E4NbhLkioxZ0QymHlTTyO6sx2e5PobIdsQ95eKUyvCR8qorTeynfWxrQC
 W5Rk49JtceusNR5CEZtyKXfdipJBw9ONWVpv+I9jzlsPDbp33Lf6Yk4Jb w==;
X-CSE-ConnectionGUID: ljj57ReoQNurY38cgA7E8w==
X-CSE-MsgGUID: J7TfOu+rSa26BcmxXguGNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="62951184"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="62951184"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 10:40:56 -0700
X-CSE-ConnectionGUID: 0ul2hjvvSQCWITK3SjN1mg==
X-CSE-MsgGUID: J7VUNphATei40d1FcSZ4Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="219550234"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.81])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 10:40:54 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Luca Coelho <luciano.coelho@intel.com>, intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 1/8] drm/i915: move SKL clock gating init to display
In-Reply-To: <20260324143420.310800-2-luciano.coelho@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260324143420.310800-1-luciano.coelho@intel.com>
 <20260324143420.310800-2-luciano.coelho@intel.com>
Date: Tue, 24 Mar 2026 19:40:51 +0200
Message-ID: <f747c63ee19db048d2fe746170e9c151b0ba1056@intel.com>
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

On Tue, 24 Mar 2026, Luca Coelho <luciano.coelho@intel.com> wrote:
> Move the SKL-specific display clock gating programming into a new file
> inside display.
>
> This removes dependency from intel_clock_gating.c to the display's
> intel_pch.h file, so we can remove the include statement.
>
> Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
> ---
>  drivers/gpu/drm/i915/Makefile                 |  1 +
>  .../i915/display/intel_display_clock_gating.c | 19 +++++++++++++++++++
>  .../i915/display/intel_display_clock_gating.h | 17 +++++++++++++++++
>  drivers/gpu/drm/i915/intel_clock_gating.c     |  8 ++------
>  4 files changed, 39 insertions(+), 6 deletions(-)
>  create mode 100644 drivers/gpu/drm/i915/display/intel_display_clock_gating.c
>  create mode 100644 drivers/gpu/drm/i915/display/intel_display_clock_gating.h
>
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index be976a90c5a6..89232873d4b7 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -254,6 +254,7 @@ i915-y += \
>  	display/intel_crtc_state_dump.o \
>  	display/intel_cursor.o \
>  	display/intel_dbuf_bw.o \
> +	display/intel_display_clock_gating.o \
>  	display/intel_display.o \
>  	display/intel_display_conversion.o \
>  	display/intel_display_driver.o \
> diff --git a/drivers/gpu/drm/i915/display/intel_display_clock_gating.c b/drivers/gpu/drm/i915/display/intel_display_clock_gating.c
> new file mode 100644
> index 000000000000..4a94593335e0
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/display/intel_display_clock_gating.c
> @@ -0,0 +1,19 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright 2026 Intel Corporation
> + */
> +
> +#include <drm/intel/intel_gmd_misc_regs.h>
> +
> +#include "intel_de.h"
> +#include "intel_display_clock_gating.h"
> +#include "intel_display_regs.h"
> +
> +void intel_display_skl_init_clock_gating(struct intel_display *display)
> +{
> +	/*
> +	 * WaFbcTurnOffFbcWatermark:skl
> +	 * Display WA #0562: skl
> +	 */
> +	intel_de_rmw(display, DISP_ARB_CTL, 0, DISP_FBC_WM_DIS);
> +}
> diff --git a/drivers/gpu/drm/i915/display/intel_display_clock_gating.h b/drivers/gpu/drm/i915/display/intel_display_clock_gating.h
> new file mode 100644
> index 000000000000..c93997417dcb
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/display/intel_display_clock_gating.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright 2026 Intel Corporation
> + */
> +
> +#ifndef __INTEL_DISPLAY_CLOCK_GATING_H__
> +#define __INTEL_DISPLAY_CLOCK_GATING_H__
> +
> +struct intel_display;
> +
> +#ifdef I915
> +void intel_display_skl_init_clock_gating(struct intel_display *display);
> +#else
> +static inline void intel_display_skl_init_clock_gating(struct intel_display *display) {}
> +#endif

I don't think we should add any of this #ifdef I915 stuff, because the
next step will be to remove all of them anyway.

Currently they'll only get called for i915, but their existence in xe
doesn't matter. And eventually they'll be part of the display module.

BR,
Jani.


> +
> +#endif /* __INTEL_DISPLAY_CLOCK_GATING_H__ */
> diff --git a/drivers/gpu/drm/i915/intel_clock_gating.c b/drivers/gpu/drm/i915/intel_clock_gating.c
> index ee2489a2fbe7..454334fef5e7 100644
> --- a/drivers/gpu/drm/i915/intel_clock_gating.c
> +++ b/drivers/gpu/drm/i915/intel_clock_gating.c
> @@ -31,9 +31,9 @@
>  
>  #include "display/i9xx_plane_regs.h"
>  #include "display/intel_display.h"
> +#include "display/intel_display_clock_gating.h"
>  #include "display/intel_display_core.h"
>  #include "display/intel_display_regs.h"
> -#include "display/intel_pch.h"
>  #include "gt/intel_engine_regs.h"
>  #include "gt/intel_gt.h"
>  #include "gt/intel_gt_mcr.h"
> @@ -349,11 +349,7 @@ static void skl_init_clock_gating(struct drm_i915_private *i915)
>  	/* WAC6entrylatency:skl */
>  	intel_uncore_rmw(&i915->uncore, FBC_LLC_READ_CTRL, 0, FBC_LLC_FULLY_OPEN);
>  
> -	/*
> -	 * WaFbcTurnOffFbcWatermark:skl
> -	 * Display WA #0562: skl
> -	 */
> -	intel_uncore_rmw(&i915->uncore, DISP_ARB_CTL, 0, DISP_FBC_WM_DIS);
> +	intel_display_skl_init_clock_gating(i915->display);
>  }
>  
>  static void bdw_init_clock_gating(struct drm_i915_private *i915)

-- 
Jani Nikula, Intel
