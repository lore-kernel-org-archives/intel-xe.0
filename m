Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFF9BF99362
	for <intel-xe@archiver.kernel.org>; Thu, 23 Apr 2026 10:28:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78C5F10E312;
	Thu, 23 Apr 2026 10:28:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J67lr+NC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E874610E312;
 Thu, 23 Apr 2026 10:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776940095; x=1808476095;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=2vDQhyRZwu7tXOsMoRBoIRg0h71fufbQmYn28SKtEpc=;
 b=J67lr+NCgj0ZqZvUN6nCAATTqleU3e+R5Lu1FFAvCpC7CpABqdgNQAVA
 KiXUe7CuxYXqMDOuU6ZNipOJ0QhQtU/GRPo8FqoV1u15ro5TSwC1t/9TC
 HUX0aoQuLshsn7ScH2pZoaWNUoyrmGPEq1U3rgcq5digzNjxmvqCqbwyj
 1xNyZ21MTa0NHT2V+8zBKEjESmB9EjP1NxMw+yw8nUgJ/sYInaIBpM6Yf
 XMcJ1jXM2aMbmvRnSxTAQ176xA30Gp0J1PrQYcEmbKZfDoCvTvP/tMSDw
 0fpOJl2kgTdUSKq7jTD4cRhs/Vhg5ausgUYd+/FUN3VtMAPZMLCEdJDST Q==;
X-CSE-ConnectionGUID: nVrIZEauSgqWawL5xYVvZw==
X-CSE-MsgGUID: z507VFrdRmmtz3zLH1dpAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="78095160"
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; d="scan'208";a="78095160"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 03:28:15 -0700
X-CSE-ConnectionGUID: RK9OaqFzTFStC1cQ3WXZDg==
X-CSE-MsgGUID: ZlBPevDARyGgCyZDrYwRAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; d="scan'208";a="236990484"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.201])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 03:28:13 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>
Subject: Re: [PATCH] drm/i915/display: enable ccs modifiers on dg2
In-Reply-To: <20260423101739.2772745-1-juhapekka.heikkila@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260423101739.2772745-1-juhapekka.heikkila@gmail.com>
Date: Thu, 23 Apr 2026 13:28:09 +0300
Message-ID: <efeef92c230d81764e1fada17c2a81012548cead@intel.com>
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

On Thu, 23 Apr 2026, Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com> wrote:
> Since Xe driver aux ccs enablement dg2 ccs modifiers have been
> disabled on both Xe and i915 drivers. Here allow dg2 to use
> ccs again for framebuffers.
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

Sorry, can't do this in i915 core.

BR,
Jani.

>  	       IS_ALDERLAKE_P(i915) ||
>  	       IS_METEORLAKE(i915);
>  }

-- 
Jani Nikula, Intel
