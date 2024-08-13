Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1CD2C52D7C
	for <intel-xe@archiver.kernel.org>; Tue, 13 Aug 2024 16:41:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AF8810E39D;
	Tue, 13 Aug 2024 16:41:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jeB4qKyG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A28610E39B;
 Tue, 13 Aug 2024 16:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723567317; x=1755103317;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=t99oK9lddpVDRlEYzEEVYoC+aj5zYlB0jVik63qekJw=;
 b=jeB4qKyGK1Wiv7ho0TxKeZejyW3Oefig+Uekhz8B7+vJJ0cetOm3O0Yu
 uuregQ+S9C9l9ErOK1Yrw1lMNwASd1FNdHAhlVTnQJanRvix/diklaILf
 GTGTUEX5gvJV9c5W2/Vam+OKycJOUegLYfW/4x3HytlADsuJ/OdwFdj7G
 GNUlxP85J/OB18gpAcrTNX5QUmoZN6AJdOTLHH4mJETR5di4TeOcTHQrX
 yN6KdHiWrZxMh/2Sd4XZBSImkOeY12Dag6eOajXV6PHtpyz2PKaTNPK0+
 oo2SWoybpBas0fsjjDkW3UNdPwRcX2Urkthn3UPaNgsq50X8PdgkO4cbt Q==;
X-CSE-ConnectionGUID: eXSpsN01TUu8HTjqcCyLwQ==
X-CSE-MsgGUID: uu6fWh2fQOCk21DWd1RvYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="21714852"
X-IronPort-AV: E=Sophos;i="6.09,286,1716274800"; d="scan'208";a="21714852"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 09:41:57 -0700
X-CSE-ConnectionGUID: 9kZVJM1OTg2j8T7E0pZI7g==
X-CSE-MsgGUID: OJbJfVNSTGWHfXxVIY/o4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,286,1716274800"; d="scan'208";a="58611953"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.234])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 09:41:56 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 7/7] drm/i915/hti: convert to struct intel_display
Date: Tue, 13 Aug 2024 19:41:23 +0300
Message-Id: <20240813164123.2674462-7-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240813164123.2674462-1-jani.nikula@intel.com>
References: <20240813164123.2674462-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
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

Going forward, struct intel_display shall replace struct
drm_i915_private as the main display device data pointer type. Convert
intel_hti.[ch] to struct intel_display.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c      |  2 +-
 .../drm/i915/display/intel_display_driver.c   |  2 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c |  3 ++-
 drivers/gpu/drm/i915/display/intel_hti.c      | 20 +++++++++----------
 drivers/gpu/drm/i915/display/intel_hti.h      |  8 ++++----
 5 files changed, 18 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 926cf3751593..25ff3ff0ab95 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -4900,7 +4900,7 @@ void intel_ddi_init(struct intel_display *display,
 	 * driver.  In that case we should skip initializing the corresponding
 	 * outputs.
 	 */
-	if (intel_hti_uses_phy(dev_priv, phy)) {
+	if (intel_hti_uses_phy(display, phy)) {
 		drm_dbg_kms(&dev_priv->drm, "PORT %c / PHY %c reserved by HTI\n",
 			    port_name(port), phy_name(phy));
 		return;
diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/drivers/gpu/drm/i915/display/intel_display_driver.c
index 328d8b5a6b66..eced20d2ce6e 100644
--- a/drivers/gpu/drm/i915/display/intel_display_driver.c
+++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
@@ -453,7 +453,7 @@ int intel_display_driver_probe_nogem(struct drm_i915_private *i915)
 	if (i915->display.cdclk.max_cdclk_freq == 0)
 		intel_update_max_cdclk(i915);
 
-	intel_hti_init(i915);
+	intel_hti_init(display);
 
 	/* Just disable it once at startup */
 	intel_vga_disable(i915);
diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
index 292d163036b1..f490b2157828 100644
--- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
+++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
@@ -3339,6 +3339,7 @@ static int icl_get_combo_phy_dpll(struct intel_atomic_state *state,
 				  struct intel_crtc *crtc,
 				  struct intel_encoder *encoder)
 {
+	struct intel_display *display = to_intel_display(crtc);
 	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
 	struct intel_crtc_state *crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
@@ -3379,7 +3380,7 @@ static int icl_get_combo_phy_dpll(struct intel_atomic_state *state,
 	}
 
 	/* Eliminate DPLLs from consideration if reserved by HTI */
-	dpll_mask &= ~intel_hti_dpll_mask(i915);
+	dpll_mask &= ~intel_hti_dpll_mask(display);
 
 	port_dpll->pll = intel_find_shared_dpll(state, crtc,
 						&port_dpll->hw_state,
diff --git a/drivers/gpu/drm/i915/display/intel_hti.c b/drivers/gpu/drm/i915/display/intel_hti.c
index a92d008d4e6e..19d1f196d9fb 100644
--- a/drivers/gpu/drm/i915/display/intel_hti.c
+++ b/drivers/gpu/drm/i915/display/intel_hti.c
@@ -9,33 +9,33 @@
 #include "intel_hti.h"
 #include "intel_hti_regs.h"
 
-void intel_hti_init(struct drm_i915_private *i915)
+void intel_hti_init(struct intel_display *display)
 {
 	/*
 	 * If the platform has HTI, we need to find out whether it has reserved
 	 * any display resources before we create our display outputs.
 	 */
-	if (DISPLAY_INFO(i915)->has_hti)
-		i915->display.hti.state = intel_de_read(i915, HDPORT_STATE);
+	if (DISPLAY_INFO(display)->has_hti)
+		display->hti.state = intel_de_read(display, HDPORT_STATE);
 }
 
-bool intel_hti_uses_phy(struct drm_i915_private *i915, enum phy phy)
+bool intel_hti_uses_phy(struct intel_display *display, enum phy phy)
 {
-	if (drm_WARN_ON(&i915->drm, phy == PHY_NONE))
+	if (drm_WARN_ON(display->drm, phy == PHY_NONE))
 		return false;
 
-	return i915->display.hti.state & HDPORT_ENABLED &&
-		i915->display.hti.state & HDPORT_DDI_USED(phy);
+	return display->hti.state & HDPORT_ENABLED &&
+		display->hti.state & HDPORT_DDI_USED(phy);
 }
 
-u32 intel_hti_dpll_mask(struct drm_i915_private *i915)
+u32 intel_hti_dpll_mask(struct intel_display *display)
 {
-	if (!(i915->display.hti.state & HDPORT_ENABLED))
+	if (!(display->hti.state & HDPORT_ENABLED))
 		return 0;
 
 	/*
 	 * Note: This is subtle. The values must coincide with what's defined
 	 * for the platform.
 	 */
-	return REG_FIELD_GET(HDPORT_DPLL_USED_MASK, i915->display.hti.state);
+	return REG_FIELD_GET(HDPORT_DPLL_USED_MASK, display->hti.state);
 }
diff --git a/drivers/gpu/drm/i915/display/intel_hti.h b/drivers/gpu/drm/i915/display/intel_hti.h
index 2893d6668657..b692571c5558 100644
--- a/drivers/gpu/drm/i915/display/intel_hti.h
+++ b/drivers/gpu/drm/i915/display/intel_hti.h
@@ -8,11 +8,11 @@
 
 #include <linux/types.h>
 
-struct drm_i915_private;
+struct intel_display;
 enum phy;
 
-void intel_hti_init(struct drm_i915_private *i915);
-bool intel_hti_uses_phy(struct drm_i915_private *i915, enum phy phy);
-u32 intel_hti_dpll_mask(struct drm_i915_private *i915);
+void intel_hti_init(struct intel_display *display);
+bool intel_hti_uses_phy(struct intel_display *display, enum phy phy);
+u32 intel_hti_dpll_mask(struct intel_display *display);
 
 #endif /* __INTEL_HTI_H__ */
-- 
2.39.2

