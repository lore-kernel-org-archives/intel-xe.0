Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91587C44536
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jan 2026 12:20:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5215310E0DE;
	Thu, 22 Jan 2026 12:20:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ceuT2sAv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23D7E10E081;
 Thu, 22 Jan 2026 12:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769084440; x=1800620440;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=uqzJ3gIs+fkUpsgeLFNT0CfwgBBqyRzBVZCuaUD7uKA=;
 b=ceuT2sAv1B9gmg/iNnWwvW91Qb4dj4W/fNLDyODUyXQBQSNR1ZLQsquL
 U0vi9zOxs2cIZPNgjMPLvyvK4q9uVjFo75mn0jtkEES4CPLrlcg3SMwQq
 VEsdjRxi+gxawkiLjRfLnQ8neK7BHRD5LmdoUrLJZwnSHtC4/po4XKwqT
 WU9wHBCQzgl5rsX8fVllkPCUeW9k4dolzyxM0Ie2Fh/xiToEuTVYn+Q+B
 PjYZUZjYwt0ckpXDoPfbC6ptlw4h3NmQFccbQmrrkNwcZ8aGqiNQn3ozQ
 gbE9sgyWAcB9KX9gkBiMDL87P0YEp33y5CmUY+GAkyNYZwjsylNKDv/xF g==;
X-CSE-ConnectionGUID: z/2d5a1URlSEGaj988JK1w==
X-CSE-MsgGUID: C/WcnTNITtuutxIJgA9n/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="70239326"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="70239326"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 04:20:40 -0800
X-CSE-ConnectionGUID: HfKOAvZmQO6Tt3xm0ym3HQ==
X-CSE-MsgGUID: FHvnKRm6Rwu6Pm4bPuJKpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="205844905"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.192])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 04:20:37 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Uma Shankar <uma.shankar@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, Uma Shankar <uma.shankar@intel.com>
Subject: Re: [v2 19/19] drm/{i915, xe}: Remove i915_reg.h from display
In-Reply-To: <20260121232414.707192-20-uma.shankar@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260121232414.707192-1-uma.shankar@intel.com>
 <20260121232414.707192-20-uma.shankar@intel.com>
Date: Thu, 22 Jan 2026 14:20:34 +0200
Message-ID: <68a125c3c34d6c35dc82175a28cc7388c191a9f1@intel.com>
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
> Make display files free from including i915_reg.h.

Yeah, I'd like this with more granular headers, please.

>
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> ---
>  drivers/gpu/drm/i915/display/hsw_ips.c               | 2 +-
>  drivers/gpu/drm/i915/display/i9xx_plane.c            | 1 -
>  drivers/gpu/drm/i915/display/icl_dsi.c               | 1 -
>  drivers/gpu/drm/i915/display/intel_backlight.c       | 1 -
>  drivers/gpu/drm/i915/display/intel_bw.c              | 2 +-
>  drivers/gpu/drm/i915/display/intel_casf.c            | 1 -
>  drivers/gpu/drm/i915/display/intel_ddi.c             | 2 +-
>  drivers/gpu/drm/i915/display/intel_display_debugfs.c | 2 +-
>  drivers/gpu/drm/i915/display/intel_display_power.c   | 2 +-
>  drivers/gpu/drm/i915/display/intel_display_wa.c      | 1 -
>  drivers/gpu/drm/i915/display/intel_dmc.c             | 1 -
>  drivers/gpu/drm/i915/display/intel_fdi.c             | 1 -
>  drivers/gpu/drm/i915/display/intel_hdcp.c            | 2 +-
>  drivers/gpu/drm/i915/display/intel_hotplug_irq.c     | 1 -
>  drivers/gpu/drm/i915/display/intel_lt_phy.c          | 1 -
>  drivers/gpu/drm/i915/display/intel_pps.c             | 1 -
>  drivers/gpu/drm/i915/display/intel_tc.c              | 2 +-
>  drivers/gpu/drm/i915/display/skl_watermark.c         | 2 +-
>  drivers/gpu/drm/i915/display/vlv_dsi.c               | 1 -
>  19 files changed, 8 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/hsw_ips.c b/drivers/gpu/drm/i915/display/hsw_ips.c
> index 008d339d5c21..290d54fe87e4 100644
> --- a/drivers/gpu/drm/i915/display/hsw_ips.c
> +++ b/drivers/gpu/drm/i915/display/hsw_ips.c
> @@ -6,9 +6,9 @@
>  #include <linux/debugfs.h>
>  
>  #include <drm/drm_print.h>
> +#include <drm/intel/intel_gmd_common_regs.h>
>  
>  #include "hsw_ips.h"
> -#include "i915_reg.h"
>  #include "intel_color_regs.h"
>  #include "intel_de.h"
>  #include "intel_display_regs.h"
> diff --git a/drivers/gpu/drm/i915/display/i9xx_plane.c b/drivers/gpu/drm/i915/display/i9xx_plane.c
> index b1fecf178906..9c16753a1f3b 100644
> --- a/drivers/gpu/drm/i915/display/i9xx_plane.c
> +++ b/drivers/gpu/drm/i915/display/i9xx_plane.c
> @@ -10,7 +10,6 @@
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_print.h>
>  
> -#include "i915_reg.h"
>  #include "i9xx_plane.h"
>  #include "i9xx_plane_regs.h"
>  #include "intel_atomic.h"
> diff --git a/drivers/gpu/drm/i915/display/icl_dsi.c b/drivers/gpu/drm/i915/display/icl_dsi.c
> index c8e0333706c1..7cf511a6c0f9 100644
> --- a/drivers/gpu/drm/i915/display/icl_dsi.c
> +++ b/drivers/gpu/drm/i915/display/icl_dsi.c
> @@ -34,7 +34,6 @@
>  #include <drm/drm_print.h>
>  #include <drm/drm_probe_helper.h>
>  
> -#include "i915_reg.h"
>  #include "icl_dsi.h"
>  #include "icl_dsi_regs.h"
>  #include "intel_atomic.h"
> diff --git a/drivers/gpu/drm/i915/display/intel_backlight.c b/drivers/gpu/drm/i915/display/intel_backlight.c
> index a68fdbd2acb9..34e95f05936e 100644
> --- a/drivers/gpu/drm/i915/display/intel_backlight.c
> +++ b/drivers/gpu/drm/i915/display/intel_backlight.c
> @@ -12,7 +12,6 @@
>  #include <drm/drm_file.h>
>  #include <drm/drm_print.h>
>  
> -#include "i915_reg.h"
>  #include "intel_backlight.h"
>  #include "intel_backlight_regs.h"
>  #include "intel_connector.h"
> diff --git a/drivers/gpu/drm/i915/display/intel_bw.c b/drivers/gpu/drm/i915/display/intel_bw.c
> index 4ee3f5172f4e..372081d80aa8 100644
> --- a/drivers/gpu/drm/i915/display/intel_bw.c
> +++ b/drivers/gpu/drm/i915/display/intel_bw.c
> @@ -5,8 +5,8 @@
>  
>  #include <drm/drm_atomic_state_helper.h>
>  #include <drm/drm_print.h>
> +#include <drm/intel/intel_gmd_common_regs.h>
>  
> -#include "i915_reg.h"
>  #include "intel_bw.h"
>  #include "intel_crtc.h"
>  #include "intel_display_core.h"
> diff --git a/drivers/gpu/drm/i915/display/intel_casf.c b/drivers/gpu/drm/i915/display/intel_casf.c
> index 0fe4398a1a4e..b167af31de5b 100644
> --- a/drivers/gpu/drm/i915/display/intel_casf.c
> +++ b/drivers/gpu/drm/i915/display/intel_casf.c
> @@ -3,7 +3,6 @@
>  
>  #include <drm/drm_print.h>
>  
> -#include "i915_reg.h"
>  #include "intel_casf.h"
>  #include "intel_casf_regs.h"
>  #include "intel_de.h"
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
> index d8739e2bb004..4bec15352d0f 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -33,8 +33,8 @@
>  #include <drm/display/drm_scdc_helper.h>
>  #include <drm/drm_print.h>
>  #include <drm/drm_privacy_screen_consumer.h>
> +#include <drm/intel/intel_gmd_common_regs.h>
>  
> -#include "i915_reg.h"
>  #include "icl_dsi.h"
>  #include "intel_alpm.h"
>  #include "intel_audio.h"
> diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> index aba13e8a9051..07cb56f80e88 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> @@ -13,9 +13,9 @@
>  #include <drm/drm_file.h>
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_print.h>
> +#include <drm/intel/intel_gmd_common_regs.h>
>  
>  #include "hsw_ips.h"
> -#include "i915_reg.h"
>  #include "i9xx_wm_regs.h"
>  #include "intel_alpm.h"
>  #include "intel_bo.h"
> diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
> index d27397f43863..20dadabcd812 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_power.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_power.c
> @@ -7,8 +7,8 @@
>  #include <linux/string_helpers.h>
>  
>  #include <drm/drm_print.h>
> +#include <drm/intel/intel_gmd_common_regs.h>
>  
> -#include "i915_reg.h"
>  #include "intel_backlight_regs.h"
>  #include "intel_cdclk.h"
>  #include "intel_clock_gating.h"
> diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.c b/drivers/gpu/drm/i915/display/intel_display_wa.c
> index 581d943b9bdc..518df619f5e5 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_wa.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_wa.c
> @@ -5,7 +5,6 @@
>  
>  #include <drm/drm_print.h>
>  
> -#include "i915_reg.h"
>  #include "intel_de.h"
>  #include "intel_display_core.h"
>  #include "intel_display_regs.h"
> diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i915/display/intel_dmc.c
> index 1182bc9a2e6d..8df06b993890 100644
> --- a/drivers/gpu/drm/i915/display/intel_dmc.c
> +++ b/drivers/gpu/drm/i915/display/intel_dmc.c
> @@ -29,7 +29,6 @@
>  #include <drm/drm_file.h>
>  #include <drm/drm_print.h>
>  
> -#include "i915_reg.h"
>  #include "intel_crtc.h"
>  #include "intel_de.h"
>  #include "intel_display_power_well.h"
> diff --git a/drivers/gpu/drm/i915/display/intel_fdi.c b/drivers/gpu/drm/i915/display/intel_fdi.c
> index 5bb0090dd5ed..24ce8a7842c7 100644
> --- a/drivers/gpu/drm/i915/display/intel_fdi.c
> +++ b/drivers/gpu/drm/i915/display/intel_fdi.c
> @@ -8,7 +8,6 @@
>  #include <drm/drm_fixed.h>
>  #include <drm/drm_print.h>
>  
> -#include "i915_reg.h"
>  #include "intel_atomic.h"
>  #include "intel_crtc.h"
>  #include "intel_ddi.h"
> diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
> index 7114fc405c29..db15bf1980c0 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
> @@ -17,8 +17,8 @@
>  #include <drm/display/drm_hdcp_helper.h>
>  #include <drm/drm_print.h>
>  #include <drm/intel/i915_component.h>
> +#include <drm/intel/intel_gmd_common_regs.h>
>  
> -#include "i915_reg.h"
>  #include "intel_connector.h"
>  #include "intel_de.h"
>  #include "intel_display_jiffies.h"
> diff --git a/drivers/gpu/drm/i915/display/intel_hotplug_irq.c b/drivers/gpu/drm/i915/display/intel_hotplug_irq.c
> index 82c39e4ffa37..8865cb2ac569 100644
> --- a/drivers/gpu/drm/i915/display/intel_hotplug_irq.c
> +++ b/drivers/gpu/drm/i915/display/intel_hotplug_irq.c
> @@ -5,7 +5,6 @@
>  
>  #include <drm/drm_print.h>
>  
> -#include "i915_reg.h"
>  #include "intel_de.h"
>  #include "intel_display_irq.h"
>  #include "intel_display_regs.h"
> diff --git a/drivers/gpu/drm/i915/display/intel_lt_phy.c b/drivers/gpu/drm/i915/display/intel_lt_phy.c
> index b4b281ef258b..d17a9b013b67 100644
> --- a/drivers/gpu/drm/i915/display/intel_lt_phy.c
> +++ b/drivers/gpu/drm/i915/display/intel_lt_phy.c
> @@ -5,7 +5,6 @@
>  
>  #include <drm/drm_print.h>
>  
> -#include "i915_reg.h"
>  #include "intel_cx0_phy.h"
>  #include "intel_cx0_phy_regs.h"
>  #include "intel_ddi.h"
> diff --git a/drivers/gpu/drm/i915/display/intel_pps.c b/drivers/gpu/drm/i915/display/intel_pps.c
> index b217ec7aa758..2d799af73bb7 100644
> --- a/drivers/gpu/drm/i915/display/intel_pps.c
> +++ b/drivers/gpu/drm/i915/display/intel_pps.c
> @@ -9,7 +9,6 @@
>  #include <drm/drm_print.h>
>  
>  #include "g4x_dp.h"
> -#include "i915_reg.h"
>  #include "intel_de.h"
>  #include "intel_display_jiffies.h"
>  #include "intel_display_power_well.h"
> diff --git a/drivers/gpu/drm/i915/display/intel_tc.c b/drivers/gpu/drm/i915/display/intel_tc.c
> index 064f572bbc85..5784d5d5132d 100644
> --- a/drivers/gpu/drm/i915/display/intel_tc.c
> +++ b/drivers/gpu/drm/i915/display/intel_tc.c
> @@ -6,8 +6,8 @@
>  #include <linux/iopoll.h>
>  
>  #include <drm/drm_print.h>
> +#include <drm/intel/intel_gmd_common_regs.h>
>  
> -#include "i915_reg.h"
>  #include "intel_atomic.h"
>  #include "intel_cx0_phy_regs.h"
>  #include "intel_ddi.h"
> diff --git a/drivers/gpu/drm/i915/display/skl_watermark.c b/drivers/gpu/drm/i915/display/skl_watermark.c
> index a6aab79812e5..410289b3fadd 100644
> --- a/drivers/gpu/drm/i915/display/skl_watermark.c
> +++ b/drivers/gpu/drm/i915/display/skl_watermark.c
> @@ -7,8 +7,8 @@
>  
>  #include <drm/drm_blend.h>
>  #include <drm/drm_print.h>
> +#include <drm/intel/intel_gmd_common_regs.h>
>  
> -#include "i915_reg.h"
>  #include "i9xx_wm.h"
>  #include "intel_atomic.h"
>  #include "intel_bw.h"
> diff --git a/drivers/gpu/drm/i915/display/vlv_dsi.c b/drivers/gpu/drm/i915/display/vlv_dsi.c
> index d705af3bf8ba..67f0082d3a69 100644
> --- a/drivers/gpu/drm/i915/display/vlv_dsi.c
> +++ b/drivers/gpu/drm/i915/display/vlv_dsi.c
> @@ -33,7 +33,6 @@
>  #include <drm/drm_print.h>
>  #include <drm/drm_probe_helper.h>
>  
> -#include "i915_reg.h"
>  #include "intel_atomic.h"
>  #include "intel_backlight.h"
>  #include "intel_connector.h"

-- 
Jani Nikula, Intel
