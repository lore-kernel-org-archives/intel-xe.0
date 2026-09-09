Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D0C7C79FB5
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 07:48:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E77910EF91;
	Wed,  9 Sep 2026 07:48:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O+kcNy29";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BE0E10EF8E;
 Wed,  9 Sep 2026 07:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788940093; x=1820476093;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2qCKG3b1TO5S0rYlypuXmbgQFFfub8oBZSycQIVLFys=;
 b=O+kcNy29cVWnizM5orLXhm0liTr7yQBLBdXVRcfyZh/5jjYlreknws8T
 Et4BXw2OrGj9vrCZ0hW3R+rvxpNnyL+5HsuUCza+7kiE+8KLRaDMUvelz
 O7lzTUlwVWEqP1o/Ig3MFULp03jBskEDMN/UfZnTvyDuYCQHNYYRMwgNX
 ihbBObyR0O5Q2+I1F3pfvnbB5aZAmasZtj66PBWwuX0Jr9dMt+o5olsOZ
 K1W8Y91yXt9RBHy74ylFtiE4/IXS2LSID8nykOQALZJRhC5+Ofcsr7BDl
 LGZEsiFdkoFOZF9eAlktt7BHu7arNW07u/W23M5+pAUh7njrL+lIW3V+g A==;
X-CSE-ConnectionGUID: q+uFP69xRzGgKlmJASL24g==
X-CSE-MsgGUID: Tz2W5v+LR+6DfQCce0Nn+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89480429"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="89480429"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 00:48:13 -0700
X-CSE-ConnectionGUID: 200P7nxAR0KJaRknGaUGEQ==
X-CSE-MsgGUID: q2jihIf9Tb6mqnwQGyISVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="268680914"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa008.fm.intel.com with ESMTP; 09 Sep 2026 00:48:11 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dibin.moolakadan.subrahmanian@intel.com, ramanaidu.naladala@intel.com
Cc: Uma Shankar <uma.shankar@intel.com>
Subject: [v5 2/4] drm/i915/display: Force disable DC3co when AS SDP skip
 frames is enabled
Date: Wed,  9 Sep 2026 13:38:08 +0530
Message-ID: <20260909080810.2202879-3-uma.shankar@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260909080810.2202879-1-uma.shankar@intel.com>
References: <20260909080810.2202879-1-uma.shankar@intel.com>
MIME-Version: 1.0
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

Periodic AS SDP (skip frames) relies on the AS SDP still being
transmitted while Panel Replay is active. DC3co uses the idle protocol
which suppresses AS SDP transmission entirely, so the two are mutually
exclusive: leaving DC3co enabled while skip frames is programmed breaks
the periodic AS SDP and the panel never sees the slower refresh.

Add intel_alpm_pr_as_sdp_skip_frames_enabled() as the single predicate
for "skip frames will be programmed" (mirroring the gating in
lnl_alpm_configure(), including that it only applies when VRR is not
active) and use it in intel_display_power_dc3co_compute() to force the
DC3co trigger to NONE. This drops the pipe onto the
DC_STATE_EN_UPTO_DC6 target instead of DC3co whenever skip frames is
active, without touching the DC state module parameter or the allowed
DC mask, and only for the skip-frame case.

v2: Fixed Sashiko review findings

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
Reviewed-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
Tested-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 drivers/gpu/drm/i915/display/intel_alpm.c     | 23 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_alpm.h     |  2 ++
 .../drm/i915/display/intel_display_power.c    |  9 ++++++++
 3 files changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
index a6838e0fd3aa..0a33a89975bc 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.c
+++ b/drivers/gpu/drm/i915/display/intel_alpm.c
@@ -404,6 +404,29 @@ static u32 intel_pr_as_sdp_skip_frames(struct intel_dp *intel_dp)
 		     REG_FIELD_MAX(PR_ALPM_CTL_AS_SDP_SKIP_FRAMES_MASK));
 }
 
+/*
+ * Whether periodic AS SDP transmission (AS SDP skip frames) will be programmed
+ * for this Panel Replay config. The skip counter needs the AS SDP to keep
+ * flowing during PR active, which is incompatible with DC3co, so this is used
+ * to keep DC3co disabled while skip frames is enabled.
+ */
+bool intel_alpm_pr_as_sdp_skip_frames_enabled(struct intel_dp *intel_dp,
+					      const struct intel_crtc_state *crtc_state)
+{
+	struct intel_display *display = to_intel_display(intel_dp);
+
+	/*
+	 * The AS SDP skip frames field only exists on Xe3p_LPD+. Periodic AS SDP
+	 * drives the panel down to its minimum refresh rate on its own, so it is
+	 * only used when VRR is not actively driving the refresh rate.
+	 */
+	if (DISPLAY_VER(display) < 35 || !intel_dp->as_sdp_supported ||
+	    !crtc_state->has_panel_replay || crtc_state->vrr.enable)
+		return false;
+
+	return intel_pr_as_sdp_skip_frames(intel_dp) > 0;
+}
+
 static void lnl_alpm_configure(struct intel_dp *intel_dp,
 			       const struct intel_crtc_state *crtc_state)
 {
diff --git a/drivers/gpu/drm/i915/display/intel_alpm.h b/drivers/gpu/drm/i915/display/intel_alpm.h
index 1cf70668ab1b..328920027f1c 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.h
+++ b/drivers/gpu/drm/i915/display/intel_alpm.h
@@ -34,6 +34,8 @@ bool intel_alpm_aux_wake_supported(struct intel_dp *intel_dp);
 bool intel_alpm_aux_less_wake_supported(struct intel_dp *intel_dp);
 bool intel_alpm_is_alpm_aux_less(struct intel_dp *intel_dp,
 				 const struct intel_crtc_state *crtc_state);
+bool intel_alpm_pr_as_sdp_skip_frames_enabled(struct intel_dp *intel_dp,
+					      const struct intel_crtc_state *crtc_state);
 void intel_alpm_disable(struct intel_dp *intel_dp);
 bool intel_alpm_get_error(struct intel_dp *intel_dp);
 void intel_alpm_lobf_compute_config_late(struct intel_dp *intel_dp,
diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
index 0ebec6e0c240..1b60ce2dd00c 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
@@ -10,6 +10,7 @@
 #include <drm/intel/intel_pcode_regs.h>
 #include <drm/intel/step.h>
 
+#include "intel_alpm.h"
 #include "intel_backlight_regs.h"
 #include "intel_cdclk.h"
 #include "intel_clock_gating.h"
@@ -488,6 +489,14 @@ void intel_display_power_dc3co_compute(struct intel_atomic_state *state)
 	if (crtc_state->has_sel_update)
 		trigger |= DC3CO_TRIGGER_PSR2;
 
+	/*
+	 * Periodic AS SDP (skip frames) needs the AS SDP to keep flowing during
+	 * PR active, which is incompatible with DC3co. Keep DC3co disabled while
+	 * skip frames is enabled.
+	 */
+	if (intel_alpm_pr_as_sdp_skip_frames_enabled(intel_dp, crtc_state))
+		trigger = DC3CO_TRIGGER_NONE;
+
 done:
 	intel_display_power_dc3co_update(display, trigger);
 }
-- 
2.50.1

