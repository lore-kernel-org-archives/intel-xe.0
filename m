Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 272D7CD98E1
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jun 2026 12:45:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1C2910EB1F;
	Tue, 16 Jun 2026 12:45:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SltKSnGI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A493410EB18;
 Tue, 16 Jun 2026 12:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781613944; x=1813149944;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=aNCuZwKBJn/zvD6IU9g4aOK2VqvjdjJxp8PWusuBCYs=;
 b=SltKSnGIB7GsXTC/VQxmjm3kCTY06JWDZ6adTFLFAACuQk4tIi67HnkA
 lHnEZDwM6nO8GVR9pA/B6YXn36031Ebi5dEnO53NPT6/r8VydJSmK6PpL
 9zBbOaT8B5M9kNsR0zLLH8xPbBmFYOs+brQAYMn7USTP/QDD24O0L4xll
 5PPvnSaiutcIVHPuvoQa5nV4fWI+ZgTtrjR1uuEfP/GI05YbQq7sukhWk
 yFAxVb2HZyElvlKsthGs5XYpLRBatS5P+OzHg7cNCsSBSdppSxle/uFd2
 t5OHGnh37TGO8kmipAcNi0wh24E/qn1XzqsOjDw9q1dEKH0uQYzBzfW+p Q==;
X-CSE-ConnectionGUID: HpX6AAizS86qXnuu57vvyA==
X-CSE-MsgGUID: TUC0QNfJQmC511Zo2MyG7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="81513257"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="81513257"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 05:45:44 -0700
X-CSE-ConnectionGUID: 109dgpPAR32Aq5b3v44NHg==
X-CSE-MsgGUID: Y1eFlaimTByhRTU7YTRAtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="244876322"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 05:45:43 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [CI v4 21/39] drm/i915/cmtg: Restore CMTG after DC6 exit
Date: Tue, 16 Jun 2026 18:13:57 +0530
Message-ID: <20260616124416.2442161-22-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260616124416.2442161-1-dibin.moolakadan.subrahmanian@intel.com>
References: <20260616124416.2442161-1-dibin.moolakadan.subrahmanian@intel.com>
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

From: Animesh Manna <animesh.manna@intel.com>

Restore CMTG registers after DC6 exit, as they lose their values
in the low-power state.

v2: Introduce intel_cmtg_restore() instead of calling multiple cmtg
functions. [Uma]

Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cmtg.c     | 21 +++++++++++++----
 .../drm/i915/display/intel_display_power.c    | 23 +++++++++++++++++++
 .../drm/i915/display/intel_display_power.h    |  2 ++
 3 files changed, 42 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cmtg.c b/drivers/gpu/drm/i915/display/intel_cmtg.c
index 8684d2ec2f83..ae59d7e755f3 100644
--- a/drivers/gpu/drm/i915/display/intel_cmtg.c
+++ b/drivers/gpu/drm/i915/display/intel_cmtg.c
@@ -391,20 +391,33 @@ static void intel_cmtg_set_hwgb(const struct intel_crtc_state *crtc_state)
 	intel_de_write(display, CMTG_HW_GB(cpu_transcoder), val);
 }
 
+static void intel_cmtg_restore(const struct intel_crtc_state *crtc_state)
+{
+	intel_cmtg_set_clk_select(crtc_state);
+	intel_cmtg_set_timings(crtc_state, MODESET);
+	intel_cmtg_set_vrr_timings(crtc_state);
+	intel_cmtg_set_vrr_ctl(crtc_state);
+	intel_cmtg_set_m_n(crtc_state);
+}
+
 void intel_cmtg_program(struct intel_atomic_state *state)
 {
+	struct intel_display *display = to_intel_display(state);
 	struct intel_crtc *crtc;
 	struct intel_crtc_state *new_crtc_state;
+	bool dc3co_to_dc6 = intel_display_power_get_and_reset_dc3co_to_dc6(display);
 
 	for_each_new_intel_crtc_in_state(state, crtc, new_crtc_state) {
 		bool modeset = intel_crtc_needs_modeset(new_crtc_state);
 
 		if (!intel_cmtg_is_allowed(new_crtc_state))
 			continue;
-		/*
-		 * TODO: CMTG needs to be restored on DC6 exit.
-		 */
-		if (modeset && new_crtc_state->hw.active && !crtc->cmtg.enabled) {
+
+		if ((modeset || dc3co_to_dc6) &&
+		    new_crtc_state->hw.active && !crtc->cmtg.enabled) {
+			if (dc3co_to_dc6)
+				intel_cmtg_restore(new_crtc_state);
+
 			intel_cmtg_enable_sync(new_crtc_state);
 			intel_cmtg_set_hwgb(new_crtc_state);
 			intel_cmtg_enable_ddi(new_crtc_state);
diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
index 2e51dfcd5dce..9783257651d2 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
@@ -285,6 +285,19 @@ sanitize_target_dc_state(struct intel_display *display,
 	return target_dc_state;
 }
 
+bool intel_display_power_get_and_reset_dc3co_to_dc6(struct intel_display *display)
+{
+	struct i915_power_domains *power_domains = &display->power.domains;
+	bool ret;
+
+	mutex_lock(&power_domains->lock);
+	ret = power_domains->dc3co_to_dc6;
+	power_domains->dc3co_to_dc6 = false;
+	mutex_unlock(&power_domains->lock);
+
+	return ret;
+}
+
 /**
  * intel_display_power_set_target_dc_state - Set target dc state.
  * @display: display device
@@ -300,6 +313,7 @@ void intel_display_power_set_target_dc_state(struct intel_display *display,
 	struct i915_power_well *power_well;
 	bool dc_off_enabled;
 	struct i915_power_domains *power_domains = &display->power.domains;
+	u32 old_target_dc_state;
 
 	mutex_lock(&power_domains->lock);
 	power_well = lookup_power_well(display, SKL_DISP_DC_OFF);
@@ -320,8 +334,17 @@ void intel_display_power_set_target_dc_state(struct intel_display *display,
 	if (!dc_off_enabled)
 		intel_power_well_enable(display, power_well);
 
+	old_target_dc_state =  power_domains->target_dc_state;
 	power_domains->target_dc_state = state;
 
+	/*
+	 * CMTG must be restored explicitly after DC6 exit. The dc3co_to_dc6
+	 * flag helps CMTG determine whether restoration is required.
+	 */
+	if (old_target_dc_state == DC_STATE_EN_DC3CO &&
+	    power_domains->target_dc_state == DC_STATE_EN_UPTO_DC6)
+		power_domains->dc3co_to_dc6 = true;
+
 	if (!dc_off_enabled)
 		intel_power_well_disable(display, power_well);
 
diff --git a/drivers/gpu/drm/i915/display/intel_display_power.h b/drivers/gpu/drm/i915/display/intel_display_power.h
index 56dc89eed3f8..b9c9b68072af 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.h
+++ b/drivers/gpu/drm/i915/display/intel_display_power.h
@@ -138,6 +138,7 @@ struct i915_power_domains {
 	 */
 	bool initializing;
 	bool display_core_suspended;
+	bool dc3co_to_dc6;
 	int power_well_count;
 
 	u32 dc_state;
@@ -179,6 +180,7 @@ void intel_display_power_sanitize_state(struct intel_display *display);
 
 void intel_display_power_suspend_late(struct intel_display *display, bool s2idle);
 void intel_display_power_resume_early(struct intel_display *display);
+bool intel_display_power_get_and_reset_dc3co_to_dc6(struct intel_display *display);
 void intel_display_power_set_target_dc_state(struct intel_display *display,
 					     u32 state);
 u32 intel_display_power_get_current_dc_state(struct intel_display *display);
-- 
2.43.0

