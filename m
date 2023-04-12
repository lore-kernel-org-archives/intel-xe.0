Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1146C77B6E
	for <intel-xe@archiver.kernel.org>; Wed, 12 Apr 2023 14:21:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AD9D10E823;
	Wed, 12 Apr 2023 14:21:54 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA2C310E82A
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Apr 2023 14:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681309312; x=1712845312;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=On9ESuJwJqb1zvtEzAxJ0F19vP1Ilathpq5/ts5IwGQ=;
 b=g8oVKYrUIH/WJ9VucJZrOUGmhqHM10WwFofg+xWZ5EhshNc2GATDcLF9
 85MCZt86eMaXVYBBRipY5bmstAfV8WbNnD9qxtCTj0RUCUdQVIJCzRAIr
 cZmT87HpyHXiJblmqVbw8ZSU1BSEZ+swQ6VJiAyPmhuzN1vHicNr2LOUg
 YXlotEQmR5z4/+DYjXJnXMaPr7ZziZnVDsz7vKIuHBs9sr1XWkUvyadvG
 XXkYMZKN74u3vde9hGLhm4PJ8Q85tvWztgLE4udL2tFF7T8af5jWmQYku
 yE0qNtMJoE2RDzGg0Zvs6v3lRp574Pb0sj79aRuiWchqiq7My17vwXpY0 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="406738397"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="406738397"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:21:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="1018761056"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="1018761056"
Received: from smoticic-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.45.172])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:21:41 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 12 Apr 2023 17:19:40 +0300
Message-Id: <20230412142006.877109-16-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230412142006.877109-1-jani.nikula@intel.com>
References: <20230412142006.877109-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 15/41] fixup! drm/i915/display: Remaining changes
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
Cc: jani.nikula@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

With the earlier changes this can just be removed.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index a5ffd92bb8f3..25ead23cd150 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -46,19 +46,12 @@
 #include <drm/drm_rect.h>
 
 #ifdef I915
-#include "intel_dvo.h"
-#include "intel_sdvo.h"
-#include "intel_tv.h"
-
 #include "gem/i915_gem_lmem.h"
 #include "gem/i915_gem_object.h"
-
-#include "g4x_hdmi.h"
-#include "vlv_dsi_pll.h"
-#include "vlv_dsi_regs.h"
 #endif
 
 #include "g4x_dp.h"
+#include "g4x_hdmi.h"
 #include "hsw_ips.h"
 #include "i915_drv.h"
 #include "i915_reg.h"
@@ -91,6 +84,7 @@
 #include "intel_dpt.h"
 #include "intel_drrs.h"
 #include "intel_dsi.h"
+#include "intel_dvo.h"
 #include "intel_fb.h"
 #include "intel_fbc.h"
 #include "intel_fbdev.h"
@@ -116,8 +110,10 @@
 #include "intel_pps.h"
 #include "intel_psr.h"
 #include "intel_quirks.h"
+#include "intel_sdvo.h"
 #include "intel_snps_phy.h"
 #include "intel_tc.h"
+#include "intel_tv.h"
 #include "intel_vblank.h"
 #include "intel_vdsc.h"
 #include "intel_vdsc_regs.h"
@@ -128,6 +124,8 @@
 #include "skl_universal_plane.h"
 #include "skl_watermark.h"
 #include "vlv_dsi.h"
+#include "vlv_dsi_pll.h"
+#include "vlv_dsi_regs.h"
 #include "vlv_sideband.h"
 
 static void intel_set_transcoder_timings(const struct intel_crtc_state *crtc_state);
@@ -7963,7 +7961,6 @@ static void intel_setup_outputs(struct drm_i915_private *dev_priv)
 			intel_ddi_init(dev_priv, PORT_D);
 		if (found & SFUSE_STRAP_DDIF_DETECTED)
 			intel_ddi_init(dev_priv, PORT_F);
-#ifdef I915
 	} else if (HAS_PCH_SPLIT(dev_priv)) {
 		bool dpd_is_edp = false;
 		int found;
@@ -8102,7 +8099,6 @@ static void intel_setup_outputs(struct drm_i915_private *dev_priv)
 
 		intel_crt_init(dev_priv);
 		intel_dvo_init(dev_priv);
-#endif
 	}
 
 	for_each_intel_encoder(&dev_priv->drm, encoder) {
-- 
2.39.2

