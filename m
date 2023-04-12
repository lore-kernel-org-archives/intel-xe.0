Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F16C8C77B6E
	for <intel-xe@archiver.kernel.org>; Wed, 12 Apr 2023 14:21:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D056110E835;
	Wed, 12 Apr 2023 14:21:34 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24C6610E823
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Apr 2023 14:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681309293; x=1712845293;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DxysKSFdt+KUvpANiKYaCyyMKOx/c5VdtETxxuhwMlI=;
 b=aW4onhIeNUMGIv3NOyJZuV2D0H78BSVJ71NKlh5KvrKDDBEUK26qS992
 DDKYACJMlMZmy1e7CnLrU6qLhdbBxNnSt+tnSF8dmlZjDSuBsgR2OxwDk
 H6Trbp4C9vJl1NrPxfUwp+jo5rbiYzfy3WLntzksGxmMoUD6Sty3PjZkp
 46WzBlrYELMgTeFh5+6C9px7J8qPG/mRly65wlMqGa66te+kL6L+xVkI9
 cXQ9cnXoSc9WPratMy/T9SAMasNLMTfiwfhwKGeepA/8wPqnzqaNQULfb
 NDFpYoMYeS/ZPIbEmvzkvs1u+mVIRPPrV0tOrXKDo/5yax7hbuA2pVksa w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="406738275"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="406738275"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:21:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="1018760915"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="1018760915"
Received: from smoticic-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.45.172])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:21:29 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 12 Apr 2023 17:19:38 +0300
Message-Id: <20230412142006.877109-14-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230412142006.877109-1-jani.nikula@intel.com>
References: <20230412142006.877109-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 13/41] fixup! drm/i915/display: Remaining changes
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

Remove VLV DSI ifdefs. No longer needed as vlv_dsi.h has conditional
build.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c |  4 +---
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c | 14 ++------------
 2 files changed, 3 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index f701b75d1f37..a5ffd92bb8f3 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -54,7 +54,6 @@
 #include "gem/i915_gem_object.h"
 
 #include "g4x_hdmi.h"
-#include "vlv_dsi.h"
 #include "vlv_dsi_pll.h"
 #include "vlv_dsi_regs.h"
 #endif
@@ -128,6 +127,7 @@
 #include "skl_scaler.h"
 #include "skl_universal_plane.h"
 #include "skl_watermark.h"
+#include "vlv_dsi.h"
 #include "vlv_sideband.h"
 
 static void intel_set_transcoder_timings(const struct intel_crtc_state *crtc_state);
@@ -7936,9 +7936,7 @@ static void intel_setup_outputs(struct drm_i915_private *dev_priv)
 		intel_ddi_init(dev_priv, PORT_A);
 		intel_ddi_init(dev_priv, PORT_B);
 		intel_ddi_init(dev_priv, PORT_C);
-#ifdef I915
 		vlv_dsi_init(dev_priv);
-#endif
 	} else if (DISPLAY_VER(dev_priv) >= 9) {
 		intel_ddi_init(dev_priv, PORT_A);
 		intel_ddi_init(dev_priv, PORT_B);
diff --git a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
index c99d17728dbd..442f791b5f7f 100644
--- a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
+++ b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
@@ -46,10 +46,8 @@
 #include "intel_dsi.h"
 #include "intel_dsi_vbt.h"
 #include "intel_gmbus_regs.h"
-#ifdef I915
 #include "vlv_dsi.h"
 #include "vlv_dsi_regs.h"
-#endif
 #include "vlv_sideband.h"
 
 #define MIPI_TRANSFER_MODE_SHIFT	0
@@ -223,10 +221,10 @@ static const u8 *mipi_exec_send_packet(struct intel_dsi *intel_dsi,
 		mipi_dsi_dcs_write_buffer(dsi_device, data, len);
 		break;
 	}
-#ifdef I915
+
 	if (DISPLAY_VER(dev_priv) < 11)
 		vlv_dsi_wait_for_fifo_empty(intel_dsi, port);
-#endif
+
 out:
 	data += len;
 
@@ -829,10 +827,8 @@ void intel_dsi_log_params(struct intel_dsi *intel_dsi)
 		    intel_dsi->clk_lp_to_hs_count);
 	drm_dbg_kms(&i915->drm, "HS to LP Clock Count 0x%x\n",
 		    intel_dsi->clk_hs_to_lp_count);
-#ifdef I915
 	drm_dbg_kms(&i915->drm, "BTA %s\n",
 		    str_enabled_disabled(!(intel_dsi->video_frmt_cfg_bits & DISABLE_VIDEO_BTA)));
-#endif
 }
 
 bool intel_dsi_vbt_init(struct intel_dsi *intel_dsi, u16 panel_id)
@@ -948,7 +944,6 @@ bool intel_dsi_vbt_init(struct intel_dsi *intel_dsi, u16 panel_id)
  * If the GOP did not initialize the panel (HDMI inserted) we may need to also
  * change the pinmux for the SoC's PWM0 pin from GPIO to PWM.
  */
-#ifdef I915
 static struct gpiod_lookup_table pmic_panel_gpio_table = {
 	/* Intel GFX is consumer */
 	.dev_id = "0000:00:02.0",
@@ -972,11 +967,9 @@ static const struct pinctrl_map soc_pwm_pinctrl_map[] = {
 	PIN_MAP_MUX_GROUP("0000:00:02.0", "soc_pwm0", "INT33FC:00",
 			  "pwm0_grp", "pwm"),
 };
-#endif
 
 void intel_dsi_vbt_gpio_init(struct intel_dsi *intel_dsi, bool panel_is_on)
 {
-#ifdef I915
 	struct drm_device *dev = intel_dsi->base.base.dev;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	struct intel_connector *connector = intel_dsi->attached_connector;
@@ -1029,12 +1022,10 @@ void intel_dsi_vbt_gpio_init(struct intel_dsi *intel_dsi, bool panel_is_on)
 			intel_dsi->gpio_backlight = NULL;
 		}
 	}
-#endif
 }
 
 void intel_dsi_vbt_gpio_cleanup(struct intel_dsi *intel_dsi)
 {
-#ifdef I915
 	struct drm_device *dev = intel_dsi->base.base.dev;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	struct intel_connector *connector = intel_dsi->attached_connector;
@@ -1058,5 +1049,4 @@ void intel_dsi_vbt_gpio_cleanup(struct intel_dsi *intel_dsi)
 		pinctrl_unregister_mappings(soc_pwm_pinctrl_map);
 		gpiod_remove_lookup_table(&soc_panel_gpio_table);
 	}
-#endif
 }
-- 
2.39.2

