Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35332C77B6F
	for <intel-xe@archiver.kernel.org>; Wed, 12 Apr 2023 14:21:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F77010E838;
	Wed, 12 Apr 2023 14:21:06 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A763210E839
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Apr 2023 14:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681309262; x=1712845262;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jU0gKLKyl4BhaZc78FRhh+oYDxqOSKu03Z2XSic7s7o=;
 b=P/5/OPAEeWSFAqDsVlZEEoxL4TMEtMKk6p/qkB8LPVUvspHACLadbMjH
 3I3cBoT5sEur0lbz14M/Pj8gRJEJqJAud7UHty8H5MEAtDuU3eL+yPpQR
 8wgGd1YgWwNC/ZBIg5iQLfWSljtQUTKjiK3xTRk+8SkFYfh4Go/9jm8vB
 tIR88gQcY8uH2lPpYkzGSQARK2jkbfqw2Fe7Ul5JHJ12hmIxWF7gXnlLx
 ISJPhF6gYI/9BXW3DOM0ph8k7x/OukeseJwNFdBrQ6j4d7M6wB1wGlH3Q
 UPfSbtX+fzc6+/q3i6f/uw1bpRbaoRrjr0TrzDqKPg977uo2miXH6KzIG A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="409048349"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="409048349"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:20:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="721584427"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="721584427"
Received: from smoticic-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.45.172])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:20:42 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 12 Apr 2023 17:19:29 +0300
Message-Id: <20230412142006.877109-5-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230412142006.877109-1-jani.nikula@intel.com>
References: <20230412142006.877109-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 04/41] fixup! drm/i915/display: Remaining changes
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

Remove g4x_dp.h and dpio ifdefs. No longer needed.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c |  2 +-
 drivers/gpu/drm/i915/display/intel_dp.c      |  9 +--------
 drivers/gpu/drm/i915/display/intel_pps.c     | 13 ++-----------
 3 files changed, 4 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 24c96f388d52..b577e58aec97 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -54,7 +54,6 @@
 #include "gem/i915_gem_lmem.h"
 #include "gem/i915_gem_object.h"
 
-#include "g4x_dp.h"
 #include "g4x_hdmi.h"
 #include "vlv_dsi.h"
 #include "vlv_dsi_pll.h"
@@ -62,6 +61,7 @@
 #include "vlv_sideband.h"
 #endif
 
+#include "g4x_dp.h"
 #include "hsw_ips.h"
 #include "i915_drv.h"
 #include "i915_reg.h"
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 9bd8a8416c58..6900cfb93dc8 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -43,8 +43,8 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_probe_helper.h>
 
-#ifdef I915
 #include "g4x_dp.h"
+#ifdef I915
 #include "i915_debugfs.h"
 #endif
 #include "i915_drv.h"
@@ -2191,10 +2191,8 @@ intel_dp_compute_config(struct intel_encoder *encoder,
 	if (pipe_config->splitter.enable)
 		pipe_config->dp_m_n.data_m *= pipe_config->splitter.link_count;
 
-#ifdef I915
 	if (!HAS_DDI(dev_priv))
 		g4x_dp_set_clock(encoder, pipe_config);
-#endif
 
 	intel_vrr_compute_config(pipe_config, conn_state);
 	intel_psr_compute_config(intel_dp, pipe_config, conn_state);
@@ -5264,8 +5262,6 @@ static void intel_edp_backlight_setup(struct intel_dp *intel_dp,
 				      struct intel_connector *connector)
 {
 	enum pipe pipe = INVALID_PIPE;
-
-#ifdef I915
 	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
 
 	if (IS_VALLEYVIEW(i915) || IS_CHERRYVIEW(i915)) {
@@ -5282,7 +5278,6 @@ static void intel_edp_backlight_setup(struct intel_dp *intel_dp,
 		if (pipe != PIPE_A && pipe != PIPE_B)
 			pipe = PIPE_A;
 	}
-#endif
 
 	intel_backlight_setup(connector, pipe);
 }
@@ -5478,10 +5473,8 @@ intel_dp_init_connector(struct intel_digital_port *dig_port,
 	intel_dp_set_default_sink_rates(intel_dp);
 	intel_dp_set_default_max_sink_lane_count(intel_dp);
 
-#ifdef I915
 	if (IS_VALLEYVIEW(dev_priv) || IS_CHERRYVIEW(dev_priv))
 		intel_dp->pps.active_pipe = vlv_active_pipe(intel_dp);
-#endif
 
 	drm_dbg_kms(&dev_priv->drm,
 		    "Adding %s connector on [ENCODER:%d:%s]\n",
diff --git a/drivers/gpu/drm/i915/display/intel_pps.c b/drivers/gpu/drm/i915/display/intel_pps.c
index 897a7b1beac1..6c39e311d53d 100644
--- a/drivers/gpu/drm/i915/display/intel_pps.c
+++ b/drivers/gpu/drm/i915/display/intel_pps.c
@@ -3,6 +3,7 @@
  * Copyright © 2020 Intel Corporation
  */
 
+#include "g4x_dp.h"
 #include "i915_drv.h"
 #include "i915_reg.h"
 #include "intel_de.h"
@@ -10,17 +11,13 @@
 #include "intel_display_types.h"
 #include "intel_dp.h"
 #include "intel_dpio_phy.h"
+#include "intel_dpio_phy.h"
 #include "intel_dpll.h"
 #include "intel_lvds.h"
 #include "intel_lvds_regs.h"
 #include "intel_pps.h"
 #include "intel_quirks.h"
 
-#ifdef I915
-#include "g4x_dp.h"
-#include "intel_dpio_phy.h"
-#endif
-
 static void vlv_steal_power_sequencer(struct drm_i915_private *dev_priv,
 				      enum pipe pipe);
 
@@ -86,7 +83,6 @@ intel_wakeref_t intel_pps_unlock(struct intel_dp *intel_dp,
 	return 0;
 }
 
-#ifdef I915
 static void
 vlv_power_sequencer_kick(struct intel_dp *intel_dp)
 {
@@ -271,7 +267,6 @@ bxt_power_sequencer_idx(struct intel_dp *intel_dp)
 
 	return pps_idx;
 }
-#endif
 
 typedef bool (*pps_check)(struct drm_i915_private *dev_priv, int pps_idx);
 
@@ -489,14 +484,12 @@ static void intel_pps_get_registers(struct intel_dp *intel_dp,
 
 	memset(regs, 0, sizeof(*regs));
 
-#ifdef I915
 	if (IS_VALLEYVIEW(dev_priv) || IS_CHERRYVIEW(dev_priv))
 		pps_idx = vlv_power_sequencer_pipe(intel_dp);
 	else if (IS_GEMINILAKE(dev_priv) || IS_BROXTON(dev_priv))
 		pps_idx = bxt_power_sequencer_idx(intel_dp);
 	else
 		pps_idx = intel_dp->pps.pps_idx;
-#endif
 
 	regs->pp_ctrl = PP_CONTROL(pps_idx);
 	regs->pp_stat = PP_STATUS(pps_idx);
@@ -1689,7 +1682,6 @@ void assert_pps_unlocked(struct drm_i915_private *dev_priv, enum pipe pipe)
 		return;
 
 	if (HAS_PCH_SPLIT(dev_priv)) {
-#ifdef I915
 		u32 port_sel;
 
 		pp_reg = PP_CONTROL(0);
@@ -1716,7 +1708,6 @@ void assert_pps_unlocked(struct drm_i915_private *dev_priv, enum pipe pipe)
 		/* presumably write lock depends on pipe, not port select */
 		pp_reg = PP_CONTROL(pipe);
 		panel_pipe = pipe;
-#endif
 	} else {
 		u32 port_sel;
 
-- 
2.39.2

