Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6FC0F99362
	for <intel-xe@archiver.kernel.org>; Thu, 23 Apr 2026 10:46:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B21F10F085;
	Thu, 23 Apr 2026 10:46:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K9yoWpza";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97AF710F092;
 Thu, 23 Apr 2026 10:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776941161; x=1808477161;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=XIQxumTmWwHIadhRh3QmlvWr0xG9/41nL77hkGe7w9Q=;
 b=K9yoWpzaWlp4SS59BpqhxHHvRjbqScrtsPtLVrj343QuSkBfnkskNrgb
 D63oRBxVbHBLV+B4xMOxVQfCVV7IQ261Bp82DisLZraznuJD48jvoQxQW
 eF7o1WwNDzRHbOnzIx0Ajwe8SUY//tFjhu7N+hLj5+rJJbRlIr3EEezWB
 OHOzX8h4qi8rIfYW5mnsWl1jURuj3tD7yS+iDWLUj8ByJ4RVZ3R37CfSr
 0FcD94I4sm0pXKyV/QMt77SQHL71SPT/MCVwC5xU49khVShsXAIqNuA5Q
 ChRKr+L+XkNJuYzd4+Obz5g1vVk2m11LNDcLu3WEqlnsDlHk8K2N7u6Us w==;
X-CSE-ConnectionGUID: sFOWbO7aTU+4Ti9wOpdysw==
X-CSE-MsgGUID: dS6TYvpiRKKTdt29bE3dIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="76940307"
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; d="scan'208";a="76940307"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 03:46:01 -0700
X-CSE-ConnectionGUID: fcehzkQAT8Gl+XvvB2kPDw==
X-CSE-MsgGUID: rvuqrt+XQ+WI5sure8etsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; d="scan'208";a="263012082"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.188])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 03:45:59 -0700
Date: Thu, 23 Apr 2026 13:45:56 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH] drm/i915/display: enable ccs modifiers on dg2
Message-ID: <aen4ZC9bY2820Bz5@intel.com>
References: <20260423101739.2772745-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260423101739.2772745-1-juhapekka.heikkila@gmail.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

On Thu, Apr 23, 2026 at 01:17:39PM +0300, Juha-Pekka Heikkila wrote:
> Since Xe driver aux ccs enablement dg2 ccs modifiers have been
> disabled on both Xe and i915 drivers. Here allow dg2 to use
> ccs again for framebuffers.

How did CI not catch this? Or did it?

> 
> Fixes: 6a99e91 ("drm/i915/display: Detect AuxCCS support via display parent interface")
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>  drivers/gpu/drm/i915/i915_driver.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> index d31819758f3d..7a73461d398a 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -54,9 +54,11 @@
>  #include "display/intel_bw.h"
>  #include "display/intel_cdclk.h"
>  #include "display/intel_crtc.h"
> +#include "display/intel_display_core.h"
>  #include "display/intel_display_device.h"
>  #include "display/intel_display_driver.h"
>  #include "display/intel_display_power.h"
> +#include "display/intel_display_types.h"
>  #include "display/intel_dmc.h"
>  #include "display/intel_dp.h"
>  #include "display/intel_dpt.h"
> @@ -749,8 +751,9 @@ static void fence_priority_display(struct dma_fence *fence)
>  static bool has_auxccs(struct drm_device *drm)
>  {
>  	struct drm_i915_private *i915 = to_i915(drm);
> +	struct intel_display *display = i915->display;
>  
> -	return IS_GRAPHICS_VER(i915, 9, 12) ||
> +	return IS_DISPLAY_VER(display, 9, 12) ||
>  	       IS_ALDERLAKE_P(i915) ||
>  	       IS_METEORLAKE(i915);
>  }
> -- 
> 2.43.0

-- 
Ville Syrjälä
Intel
