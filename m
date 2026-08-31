Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFF66C624C6
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 21:14:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C55B10EB5E;
	Mon, 31 Aug 2026 21:14:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hi2aZkDg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74AF810EB5B;
 Mon, 31 Aug 2026 21:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788210872; x=1819746872;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nAgp8TPNi/ivDOYRxqp0uyMfPa4NwlAV7o6HZr9BQfA=;
 b=hi2aZkDgnDdfLyFgfJM8C/fdeBXZGAHOuA1Sg1Ut/vzdcOJNfZb4+VlZ
 uNSv70KlHCgSk0ANyvTF1ehagYlmmw2UURdJo+YKrL2F+yPsAcMi+raul
 MP9LUYAK61plaJ62QuvvEkrKH9P8a1q+ndYFrEORyLQo0Wa1E3jPuhFt+
 FtXnbNeIefRTgeVuQYeitEW8uJSEVlFe5TNa5kv0JRvzoDHWpZr5kqX0a
 thL6vsefwFeuQ6KHoP0MY2xN+l/oMU0z3AXtc6kBQaKdkvyUxa0wBva20
 5TYUqz6H6H/nz7+2v/qpp0SY0/Bj2pykUWhl9Lbx7DhEEqLeQASUCvrAP A==;
X-CSE-ConnectionGUID: awfhmipBS5ydMLcjvb3S0w==
X-CSE-MsgGUID: 5z0gIsZFQvyiCAyrPhNz2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="87762508"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; d="scan'208";a="87762508"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 14:14:32 -0700
X-CSE-ConnectionGUID: TnR+tR1FR+2g+6WBSvDSvw==
X-CSE-MsgGUID: 7jDJiTjUQ1SPdGAdj+idAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; d="scan'208";a="264612816"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa006.fm.intel.com with ESMTP; 31 Aug 2026 14:14:30 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: dibin.moolakadan.subrahmanian@intel.com,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v4 2/4] drm/i915/display: Force disable DC3co when AS SDP skip
 frames is enabled
Date: Tue,  1 Sep 2026 03:04:19 +0530
Message-ID: <20260831213421.1804635-3-uma.shankar@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260831213421.1804635-1-uma.shankar@intel.com>
References: <20260831213421.1804635-1-uma.shankar@intel.com>
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

