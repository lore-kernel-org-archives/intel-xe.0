Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34D6ECD98CB
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jun 2026 12:04:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D563B10E31C;
	Tue,  9 Jun 2026 12:04:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kIf5zwzz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74F8210E31E;
 Tue,  9 Jun 2026 12:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781006656; x=1812542656;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=LHy1Zwnr7UQsEWwBm4XFZcw2iJf4xaindNNxjxC0kYk=;
 b=kIf5zwzzoAMGQGff5Rk7zv+XLxL7jh8zm1qaQo90NQL62eeuqqGlkik/
 WGBXumdBftqYCkahzgXS7Ou6CNbEm0rLTJZRL92L+DMykU5B89w0MrLS3
 FXJTt6bgjj7Baum6fwyTgKw5OFQKzqPZgW46ALW/+7u9lg5mfuYitwh3M
 W3NdPu0xNUQkdasAr/eGy89vHrgTmn/EJU5ZN6MPOC0SwPyjdj9HacDtr
 TxZCPl63GZZQvvBzldPyAZ2JPqb/dXuTlyJwZ25ZD4wF11FNFTXcipc6e
 Z4rOWm2fGXgEmLrcuOjCDbdQj5DW8FVs9HZ6abaiM1iPOMDStpAXy7Xrs Q==;
X-CSE-ConnectionGUID: nr9s54ahTj67mjgknVf8CQ==
X-CSE-MsgGUID: LPf7GtBwQCWn2lp28KyLDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="99340425"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="99340425"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 05:04:16 -0700
X-CSE-ConnectionGUID: EF6WfuYFTAG2lunvrn/JQg==
X-CSE-MsgGUID: 5tF/PpieT3ykdrGSdnY6TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="244988457"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 05:04:15 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [CI v3 27/36] drm/i915/display: Add DC3CO compute and set target
 state in commit tail
Date: Tue,  9 Jun 2026 17:32:41 +0530
Message-ID: <20260609120250.867750-28-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609120250.867750-1-dibin.moolakadan.subrahmanian@intel.com>
References: <20260609120250.867750-1-dibin.moolakadan.subrahmanian@intel.com>
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

Compute if dc3co is allowed in intel_atomic_commit_tail()
based on pipe/port constraints and runtime triggers and store
result in display->power.dc3co.

When DC3CO can be enabled, request DC_STATE_EN_UPTO_DC3CO and
reduce the DC entry delay. Otherwise, retain the existing
delay and set default DC_STATE_EN_UPTO_DC6.

Changes in v5:
- Move DC3CO compute logic from intel_atomic_check()
  to intel_atomic_commit_tail as it is not advisable to
  change persistent state in atomic check (Jani Nikula)
- Add psr2 deep sleep check in dc3co compute.
- Move allowed computation logic inside dc3co update (Jani Nikula).
- Add dc3co support check in dc3co allowed function (Jani Nikula)
- Move all dc3co functions to intel_display_power.c and
  rename functions accordingly  (Jani Nikula)
- Clean up dc3co/dc6 power async delay in
  intel_atomic_commit_tail() (Jani Nikula)

BSpec: 75253
Signed-off-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c  |  14 +-
 .../gpu/drm/i915/display/intel_display_core.h |   2 +
 .../drm/i915/display/intel_display_power.c    | 135 ++++++++++++++++++
 .../drm/i915/display/intel_display_power.h    |  37 +++++
 4 files changed, 183 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 161bed86fec5..109efb36ef21 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -7455,6 +7455,7 @@ static void intel_atomic_commit_tail(struct intel_atomic_state *state)
 	struct intel_crtc *crtc;
 	struct intel_power_domain_mask put_domains[I915_MAX_PIPES] = {};
 	struct ref_tracker *wakeref = NULL;
+	int power_async_delay;
 
 	for_each_new_intel_crtc_in_state(state, crtc, new_crtc_state)
 		intel_atomic_dsb_prepare(state, crtc);
@@ -7563,6 +7564,8 @@ static void intel_atomic_commit_tail(struct intel_atomic_state *state)
 	/* Now enable the clocks, plane, pipe, and connectors that we set up. */
 	display->modeset.funcs->commit_modeset_enables(state);
 
+	intel_display_power_dc3co_compute(state);
+
 	/* FIXME probably need to sequence this properly */
 	intel_program_dpkgc_latency(state);
 
@@ -7676,11 +7679,12 @@ static void intel_atomic_commit_tail(struct intel_atomic_state *state)
 		 */
 		intel_uncore_arm_unclaimed_mmio_detection(uncore);
 	}
-	/*
-	 * Delay re-enabling DC states by 17 ms to avoid the off->on->off
-	 * toggling overhead at and above 60 FPS.
-	 */
-	intel_display_power_put_async_delay(display, POWER_DOMAIN_DC_OFF, wakeref, 17);
+
+	power_async_delay = intel_display_power_select_target_dc_state(state);
+
+	intel_display_power_put_async_delay(display,
+					    POWER_DOMAIN_DC_OFF, wakeref, power_async_delay);
+
 	intel_display_rpm_put(display, state->wakeref);
 
 	/*
diff --git a/drivers/gpu/drm/i915/display/intel_display_core.h b/drivers/gpu/drm/i915/display/intel_display_core.h
index 09ce25a6d4b1..6068d0f5089e 100644
--- a/drivers/gpu/drm/i915/display/intel_display_core.h
+++ b/drivers/gpu/drm/i915/display/intel_display_core.h
@@ -538,6 +538,8 @@ struct intel_display {
 
 	struct {
 		struct i915_power_domains domains;
+		/* DC3CO state */
+		struct intel_dc3co_state dc3co;
 
 		/* Shadow for DISPLAY_PHY_CONTROL which can't be safely read */
 		u32 chv_phy_control;
diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
index e213e02aadaa..122b3e98103e 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
@@ -14,7 +14,9 @@
 #include "intel_cdclk.h"
 #include "intel_clock_gating.h"
 #include "intel_combo_phy.h"
+#include "intel_crtc.h"
 #include "intel_de.h"
+#include "intel_display.h"
 #include "intel_display_power.h"
 #include "intel_display_power_map.h"
 #include "intel_display_power_well.h"
@@ -30,6 +32,8 @@
 #include "intel_pch_refclk.h"
 #include "intel_pmdemand.h"
 #include "intel_pps_regs.h"
+#include "intel_psr.h"
+#include "intel_psr_regs.h"
 #include "intel_snps_phy.h"
 #include "skl_watermark.h"
 #include "skl_watermark_regs.h"
@@ -385,6 +389,136 @@ bool intel_display_power_dc3co_supported(struct intel_display *display)
 	return (power_domains->allowed_dc_mask & DC_STATE_EN_UPTO_DC3CO) == DC_STATE_EN_UPTO_DC3CO;
 }
 
+bool intel_display_power_dc3co_allowed(struct intel_display *display)
+{
+	struct intel_dc3co_state *dc3co = &display->power.dc3co;
+	bool allowed;
+
+	if (!intel_display_power_dc3co_supported(display))
+		return false;
+
+	mutex_lock(&dc3co->lock);
+	allowed = dc3co->allowed;
+	mutex_unlock(&dc3co->lock);
+
+	return allowed;
+}
+
+void intel_display_power_dc3co_update(struct intel_display *display, u32 trigger)
+{
+	struct intel_dc3co_state *dc3co = &display->power.dc3co;
+
+	if (!intel_display_power_dc3co_supported(display))
+		return;
+
+	mutex_lock(&dc3co->lock);
+	dc3co->trigger = trigger;
+	dc3co->allowed = !!trigger;
+	mutex_unlock(&dc3co->lock);
+	drm_dbg_kms(display->drm, "DC3CO allowed=%d trigger=0x%x\n",
+		    dc3co->allowed, dc3co->trigger);
+}
+
+static bool intel_dc3co_port_pipe_compatible(struct intel_dp *intel_dp,
+					     const struct intel_crtc_state *crtc_state)
+{
+	struct intel_digital_port *dig_port = dp_to_dig_port(intel_dp);
+	enum pipe pipe = to_intel_crtc(crtc_state->uapi.crtc)->pipe;
+	enum port port = dig_port->base.port;
+	int num_pipes = intel_crtc_num_joined_pipes(crtc_state);
+
+	/* Need to follow 1:1 mapping because of CMTG restriction */
+	if (DISPLAY_VER(to_intel_display(crtc_state)) == 35)
+		return num_pipes == 1 &&
+		       ((pipe == PIPE_A && port == PORT_A) ||
+			(pipe == PIPE_B && port == PORT_B));
+	else
+		return num_pipes == 1 && pipe <= PIPE_B && port <= PORT_B;
+}
+
+void intel_display_power_dc3co_compute(struct intel_atomic_state *state)
+{
+	struct intel_display *display = to_intel_display(state);
+	struct intel_crtc *crtc;
+	struct intel_crtc_state *crtc_state;
+	struct intel_encoder *encoder;
+	struct intel_dp *intel_dp;
+	u8 active_pipes = 0;
+	enum pipe pipe;
+	u32 trigger = DC3CO_TRIGGER_NONE;
+
+	if (!intel_display_power_dc3co_supported(display))
+		return;
+
+	for_each_intel_crtc(display, crtc)
+		active_pipes |= crtc->active ? BIT(crtc->pipe) : 0;
+
+	active_pipes = intel_calc_active_pipes(state, active_pipes);
+
+	if (hweight8(active_pipes) != 1)
+		goto done;
+
+	pipe = ffs(active_pipes) - 1;
+	crtc = intel_crtc_for_pipe(display, pipe);
+
+	crtc_state = to_intel_crtc_state(crtc->base.state);
+
+	for_each_intel_encoder_mask(display->drm, encoder,
+				    crtc_state->uapi.encoder_mask) {
+		if (encoder->type != INTEL_OUTPUT_EDP)
+			goto done;
+
+		intel_dp = enc_to_intel_dp(encoder);
+
+		if (!intel_dc3co_port_pipe_compatible(intel_dp, crtc_state))
+			goto done;
+
+		if (intel_psr2_in_deep_sleep(intel_dp))
+			goto done;
+	}
+
+	if (crtc_state->has_lobf)
+		trigger |= DC3CO_TRIGGER_LOBF;
+	if (crtc_state->has_panel_replay && intel_dp->as_sdp_supported)
+		trigger |= DC3CO_TRIGGER_PANEL_REPLAY;
+	if (crtc_state->has_sel_update)
+		trigger |= DC3CO_TRIGGER_PSR2;
+
+done:
+	intel_display_power_dc3co_update(display, trigger);
+}
+
+/*
+ * Select the target DC state for this commit and return the async-put delay
+ * to use when releasing the DC_OFF reference.
+ *
+ * Picks DC_STATE_EN_UPTO_DC3CO when DC3CO can be enabled
+ * otherwise falls back to default DC state of DC_STATE_EN_UPTO_DC6.
+ * The chosen target is programmed via intel_display_power_set_target_dc_state().
+ *
+ * Returns the async-put delay (in ms) to use when releasing the DC_OFF
+ * reference: DC3CO_PUT_ASYNC_DELAY_MS when DC3CO was selected, otherwise
+ * DC6_PUT_ASYNC_DELAY_MS.
+ */
+int intel_display_power_select_target_dc_state(struct intel_atomic_state *state)
+{
+	struct intel_display *display = to_intel_display(state);
+	u32 target_dc_state;
+
+	if (!intel_display_power_dc3co_supported(display))
+		return DC6_PUT_ASYNC_DELAY_MS;
+
+	if (intel_display_power_dc3co_allowed(display))
+		target_dc_state = DC_STATE_EN_UPTO_DC3CO;
+	else
+		target_dc_state = DC_STATE_EN_UPTO_DC6;
+
+	intel_display_power_set_target_dc_state(display, target_dc_state);
+
+	return target_dc_state == DC_STATE_EN_UPTO_DC3CO ?
+		DC3CO_PUT_ASYNC_DELAY_MS : DC6_PUT_ASYNC_DELAY_MS;
+}
+
 static void __async_put_domains_mask(struct i915_power_domains *power_domains,
 				     struct intel_power_domain_mask *mask)
 {
@@ -1064,6 +1198,7 @@ int intel_display_power_init(struct intel_display *display)
 		sanitize_target_dc_state(display, DC_STATE_EN_UPTO_DC6);
 
 	mutex_init(&power_domains->lock);
+	mutex_init(&display->power.dc3co.lock);
 
 	INIT_DELAYED_WORK(&power_domains->async_put_work,
 			  intel_display_power_put_async_work);
diff --git a/drivers/gpu/drm/i915/display/intel_display_power.h b/drivers/gpu/drm/i915/display/intel_display_power.h
index 41b4be9018b4..546af67b680b 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.h
+++ b/drivers/gpu/drm/i915/display/intel_display_power.h
@@ -9,9 +9,12 @@
 #include <linux/mutex.h>
 #include <linux/workqueue.h>
 
+#include "intel_display_limits.h"
+
 enum aux_ch;
 enum port;
 struct i915_power_well;
+struct intel_atomic_state;
 struct intel_display;
 struct intel_encoder;
 struct ref_tracker;
@@ -131,6 +134,36 @@ struct intel_power_domain_mask {
 	DECLARE_BITMAP(bits, POWER_DOMAIN_NUM);
 };
 
+/*
+ * DC3CO enabling triggers (bitmask).
+ * DC3CO may be enabled when at least one of these triggers is active.
+ * Additional constraints may still apply.
+ */
+#define DC3CO_TRIGGER_NONE		(0)
+#define DC3CO_TRIGGER_PSR2		BIT(0)
+#define DC3CO_TRIGGER_LOBF		BIT(1)
+#define DC3CO_TRIGGER_PANEL_REPLAY	BIT(2)
+#define DC3CO_TRIGGER_ALL		(DC3CO_TRIGGER_PSR2 | \
+					 DC3CO_TRIGGER_LOBF | \
+					 DC3CO_TRIGGER_PANEL_REPLAY)
+
+/*
+ * Delay to re-enable DC5/DC6 states by 17 ms to avoid the off->on->off
+ * toggling overhead at and above 60 FPS.
+ */
+#define DC6_PUT_ASYNC_DELAY_MS		17
+/*
+ * Use minimal re-enable delay to allow DC3CO entry on
+ * the next idle frame.
+ */
+#define DC3CO_PUT_ASYNC_DELAY_MS	1
+
+struct intel_dc3co_state {
+	struct mutex lock; /* protects allowed and trigger fields */
+	bool allowed; /* DC3CO compute result */
+	u32 trigger; /* Bitmask of active DC3CO triggers */
+};
+
 struct i915_power_domains {
 	/*
 	 * Power wells needed for initialization at driver init and suspend
@@ -185,6 +218,10 @@ void intel_display_power_set_target_dc_state(struct intel_display *display,
 					     u32 state);
 u32 intel_display_power_get_current_dc_state(struct intel_display *display);
 bool intel_display_power_dc3co_supported(struct intel_display *display);
+void intel_display_power_dc3co_update(struct intel_display *display, u32 trigger);
+bool intel_display_power_dc3co_allowed(struct intel_display *display);
+void intel_display_power_dc3co_compute(struct intel_atomic_state *state);
+int intel_display_power_select_target_dc_state(struct intel_atomic_state *state);
 
 void intel_display_power_runtime_suspend(struct intel_display *display);
 void intel_display_power_runtime_resume(struct intel_display *display);
-- 
2.43.0

