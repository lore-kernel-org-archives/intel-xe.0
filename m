Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2CBBC7619A
	for <intel-xe@archiver.kernel.org>; Wed,  5 Apr 2023 15:40:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD01F10E9FE;
	Wed,  5 Apr 2023 15:40:01 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8196C10E9FD
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Apr 2023 15:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680709199; x=1712245199;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y3w7VJPYPEUMAzFVRcWKhptPTiDwTk4SVZrjFcC/nso=;
 b=PI+coigZ9D4JrKuOUWgn0rEf31bHaSoPS3ckQcDavrv+sayxwjpO2cTW
 919hmp11V1QxRiMMvOmYJWPy1aBUhI6k2JL8kyE/rs+bl018aWXvQ02XI
 P0tx4eIRcH6e7KZU1ootzbmAvyYDyo8olLir4iekXRSq7dHR2O1UrCdwL
 iw0ax+tA9LR3IH8px9NLDb7Ewuy4XVZahzDTe4//+bRG3S0Nd8QGtdc9v
 5nqKs155WXlyCqdJ5CYGNaUe+PSJZ/cZeFRq+i9q6hDkevOSBDLOa320n
 Uh3k3Ubx3CPwmPFyj+CoD6TzW7J+EJVB9mV4hKLEXoOynvzX0JyYYYRcf w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="322865076"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; d="scan'208";a="322865076"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 08:39:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="680327035"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; d="scan'208";a="680327035"
Received: from dlemiech-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.43.158])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 08:39:56 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  5 Apr 2023 18:39:05 +0300
Message-Id: <20230405153920.926583-7-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230405153920.926583-1-jani.nikula@intel.com>
References: <20230405153920.926583-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 06/21] fixup! drm/i915/display: Remaining changes
 to make xe compile
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
Cc: tvrtko.ursulin@linux.intel.com, Jani Nikula <jani.nikula@intel.com>,
 joonas.lahtinen@linux.intel.com, lucas.demarchi@intel.com, daniel@ffwll.ch,
 rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Remove hsw_ips.c ifdefs

With IPS conditional build, this is not needed.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cdclk.c   | 4 +---
 drivers/gpu/drm/i915/display/intel_display.c | 8 +-------
 2 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
index 8e92091c4a1b..5ab20ca7c000 100644
--- a/drivers/gpu/drm/i915/display/intel_cdclk.c
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
@@ -23,6 +23,7 @@
 
 #include <linux/time.h>
 
+#include "hsw_ips.h"
 #include "i915_reg.h"
 #include "intel_atomic.h"
 #include "intel_atomic_plane.h"
@@ -37,7 +38,6 @@
 #include "intel_psr.h"
 
 #ifdef I915
-#include "hsw_ips.h"
 #include "vlv_sideband.h"
 #endif
 
@@ -2415,11 +2415,9 @@ int intel_crtc_compute_min_cdclk(const struct intel_crtc_state *crtc_state)
 
 	min_cdclk = intel_pixel_rate_to_cdclk(crtc_state);
 
-#ifdef I915
 	/* pixel rate mustn't exceed 95% of cdclk with IPS on BDW */
 	if (IS_BROADWELL(dev_priv) && hsw_crtc_state_ips_capable(crtc_state))
 		min_cdclk = DIV_ROUND_UP(min_cdclk * 100, 95);
-#endif
 
 	/* BSpec says "Do not use DisplayPort with CDCLK less than 432 MHz,
 	 * audio enabled, port width x4, and link rate HBR2 (5.4 GHz), or else
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 2d59330ff5ab..9c80292e5666 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -57,7 +57,6 @@
 
 #include "g4x_dp.h"
 #include "g4x_hdmi.h"
-#include "hsw_ips.h"
 #include "i9xx_plane.h"
 #include "vlv_dsi.h"
 #include "vlv_dsi_pll.h"
@@ -65,6 +64,7 @@
 #include "vlv_sideband.h"
 #endif
 
+#include "hsw_ips.h"
 #include "i915_drv.h"
 #include "i915_reg.h"
 #include "i915_utils.h"
@@ -4039,9 +4039,7 @@ static bool hsw_get_pipe_config(struct intel_crtc *crtc,
 			ilk_get_pfit_config(pipe_config);
 	}
 
-#ifdef I915
 	hsw_ips_get_config(pipe_config);
-#endif
 
 	if (pipe_config->cpu_transcoder != TRANSCODER_EDP &&
 	    !transcoder_is_dsi(pipe_config->cpu_transcoder)) {
@@ -4725,7 +4723,6 @@ static int hsw_compute_linetime_wm(struct intel_atomic_state *state,
 	else
 		crtc_state->linetime = hsw_linetime_wm(crtc_state);
 
-#ifdef I915
 	if (!hsw_crtc_supports_ips(crtc))
 		return 0;
 
@@ -4735,7 +4732,6 @@ static int hsw_compute_linetime_wm(struct intel_atomic_state *state,
 
 	crtc_state->ips_linetime = hsw_ips_linetime_wm(crtc_state,
 						       cdclk_state);
-#endif
 
 	return 0;
 }
@@ -4804,13 +4800,11 @@ static int intel_crtc_atomic_check(struct intel_atomic_state *state,
 			return ret;
 	}
 
-#ifdef I915
 	if (HAS_IPS(dev_priv)) {
 		ret = hsw_ips_compute_config(state, crtc);
 		if (ret)
 			return ret;
 	}
-#endif
 
 	if (DISPLAY_VER(dev_priv) >= 9 ||
 	    IS_BROADWELL(dev_priv) || IS_HASWELL(dev_priv)) {
-- 
2.39.2

