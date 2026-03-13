Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1360C107BCC6
	for <intel-xe@archiver.kernel.org>; Fri, 13 Mar 2026 16:03:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9F7410EB8A;
	Fri, 13 Mar 2026 16:03:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V/ngCu6E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C08F210E45E;
 Fri, 13 Mar 2026 16:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773417802; x=1804953802;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AepmilfWL8FAaDfd3MaqD6lQLcubEY+VzTDs8KJCsoQ=;
 b=V/ngCu6EPKCky/C3TX3qcqp36hKplIXKdBc1+sX321DOH1iUE/Cwtyse
 NC1vRhq7vsjEkz1Dw55VRR2NdxXcASDtaOEz6mGVtKFSz5FfpS9CX2oW2
 f6r4lT66OtitsPlRXRyquoAwXTxTFeP8rUOzXUR95d7kbF5mogDNxNR6l
 dCSE6l4wXhYNYDyCCQ9wArfdCG3UKY7AX/z/7m7RBlRs5vuoDaNHpPVrp
 Mr989hJgwWylk1eX5TTUxUVofdEvz/eJlhEotMkGvp3w0fhJTGkkHWIqa
 UUrFWqc/kZtYhHVl7btBfH7HYS5TM6RD7uYcEGFH6GmjvDV9819Gx85WI w==;
X-CSE-ConnectionGUID: lHeAcsKtTUWwEnd8ce0AFA==
X-CSE-MsgGUID: uatAQmNcQ1ab4saO8nu8oA==
X-IronPort-AV: E=McAfee;i="6800,10657,11728"; a="74715419"
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; d="scan'208";a="74715419"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2026 09:03:20 -0700
X-CSE-ConnectionGUID: dkNDXit5Qdm10V13geUOWA==
X-CSE-MsgGUID: jZFQF980T+a1Zns77RFw5w==
X-ExtLoop1: 1
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by fmviesa003.fm.intel.com with ESMTP; 13 Mar 2026 09:03:18 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, uma.shankar@intel.com,
 dibin.moolakadan.subrahmanian@intel.com,
 Animesh Manna <animesh.manna@intel.com>
Subject: [PATCH v3 09/12] drm/i915/cmtg: Add trigger to enable/disable cmtg
Date: Fri, 13 Mar 2026 21:02:57 +0530
Message-Id: <20260313153300.3530695-10-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20260313153300.3530695-1-animesh.manna@intel.com>
References: <20260313153300.3530695-1-animesh.manna@intel.com>
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

Enable CMTG with fixed refresh rate mode and with dynamic
dc state enabled.

Disable CMTG with transcoder disable or if there is a transition
to vrr mode from fixed refresh rate mode.

Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cmtg.c          |  5 ++++-
 drivers/gpu/drm/i915/display/intel_display.c       | 10 ++++++++++
 drivers/gpu/drm/i915/display/intel_display_types.h |  4 ++++
 3 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cmtg.c b/drivers/gpu/drm/i915/display/intel_cmtg.c
index a6ac87fd552e..fff299e1acfb 100644
--- a/drivers/gpu/drm/i915/display/intel_cmtg.c
+++ b/drivers/gpu/drm/i915/display/intel_cmtg.c
@@ -160,6 +160,7 @@ static void intel_cmtg_disable_all(struct intel_display *display,
 void intel_cmtg_disable(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
+	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 	u32 val;
 
@@ -184,7 +185,7 @@ void intel_cmtg_disable(const struct intel_crtc_state *crtc_state)
 			 transcoder_name(cpu_transcoder));
 		return;
 	}
-
+	crtc->cmtg.enabled = false;
 	drm_dbg_kms(display->drm, "CMTG: %s disabled\n", transcoder_name(cpu_transcoder));
 }
 /*
@@ -368,6 +369,7 @@ void intel_cmtg_enable_sync(const struct intel_crtc_state *crtc_state)
 void intel_cmtg_enable_ddi(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
+	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 
 	if (!intel_cmtg_is_allowed(crtc_state))
@@ -375,5 +377,6 @@ void intel_cmtg_enable_ddi(const struct intel_crtc_state *crtc_state)
 
 	intel_de_rmw(display, TRANS_DDI_FUNC_CTL2(display, cpu_transcoder), 0, CMTG_SECONDARY_MODE);
 
+	crtc->cmtg.enabled = true;
 	drm_dbg_kms(display->drm, "CMTG: %s enabled\n", transcoder_name(cpu_transcoder));
 }
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 35f5fd02c815..baf4d640bfbf 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -1080,6 +1080,11 @@ static void intel_post_plane_update(struct intel_atomic_state *state,
 		intel_alpm_lobf_enable(new_crtc_state);
 
 	intel_psr_post_plane_update(state, crtc);
+
+	if (!crtc->cmtg.enabled && intel_vrr_is_fixed_rr(new_crtc_state)) {
+		intel_cmtg_enable_sync(new_crtc_state);
+		intel_cmtg_enable_ddi(new_crtc_state);
+	}
 }
 
 static void intel_post_plane_update_after_readout(struct intel_atomic_state *state,
@@ -1793,6 +1798,8 @@ static void hsw_crtc_disable(struct intel_atomic_state *state,
 	struct intel_crtc *pipe_crtc;
 	int i;
 
+	if (crtc->cmtg.enabled)
+		intel_cmtg_disable(old_crtc_state);
 	/*
 	 * FIXME collapse everything to one hook.
 	 * Need care with mst->ddi interactions.
@@ -6917,6 +6924,9 @@ static void intel_update_crtc(struct intel_atomic_state *state,
 	if (intel_crtc_needs_fastset(new_crtc_state) &&
 	    old_crtc_state->inherited)
 		intel_crtc_arm_fifo_underrun(crtc, new_crtc_state);
+
+	if (crtc->cmtg.enabled && intel_crtc_vrr_enabling(state, crtc))
+		intel_cmtg_disable(new_crtc_state);
 }
 
 static void intel_old_crtc_state_disables(struct intel_atomic_state *state,
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 8a92ea4f1438..b4c3d8537a99 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1574,6 +1574,10 @@ struct intel_crtc {
 #endif
 
 	bool vblank_psr_notify;
+
+	struct {
+		bool enabled;
+	} cmtg;
 };
 
 struct intel_plane_error {
-- 
2.29.0

