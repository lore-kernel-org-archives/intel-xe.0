Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B824E1062870
	for <intel-xe@archiver.kernel.org>; Wed, 11 Mar 2026 11:52:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6911810E8C9;
	Wed, 11 Mar 2026 11:52:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y1H6En93";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84AFC10E8C7;
 Wed, 11 Mar 2026 11:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773229936; x=1804765936;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UjBj0a47YsNhFTRJrcjeUxgcxIFePYkdrHKqrlFzmlY=;
 b=Y1H6En93/eXNEso5WnAhwXi/CGmcQPFnPsEKPomcm24Wf1iz14Wuy8Ot
 3Xqi/c8571rttkokuuY/E0uQRY2461pKc5BVzsWI2S1My2/mJ1Tidysyy
 rR6dVTXwANUke6oYcOudliCCAPhFQbbyXygx/pXCoG51KD+5PkbziXL5l
 9ZeF2f8m6wHV0kuTsmD4iq5pjysHcPk/qXBr/20NRsam0PsY7Tg2+mRJ1
 1OCycaRAMFjd5j+BKYwoFwDcLhpBLxoQjF7Nwb0je3HYl2Lc7/W0h7dEk
 rIjhbwhCITz7IV0m5ky0dxOpjPLuPG4ENiv+erZW1J1pGqrBnQBbnz7zu Q==;
X-CSE-ConnectionGUID: 3UwkkH8cTdKI0bv9ppOOEg==
X-CSE-MsgGUID: OkZ8ss6HRbKaB21NtHtKUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="74205006"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="74205006"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 04:52:15 -0700
X-CSE-ConnectionGUID: CdRDiR1fSdixQOvTB93PNA==
X-CSE-MsgGUID: 0eI9k4LURjW7yhY8u7Z3Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="224602431"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 04:52:12 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, jouni.hogander@intel.com,
 animesh.manna@intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 17/19] drm/i915/dp: Split AS SDP computation between
 compute_config and compute_config_late
Date: Wed, 11 Mar 2026 17:06:09 +0530
Message-ID: <20260311113611.3393194-18-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260311113611.3393194-1-ankit.k.nautiyal@intel.com>
References: <20260311113611.3393194-1-ankit.k.nautiyal@intel.com>
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

Currently we enable AS SDP only when VRR is enabled. As we start using
AS SDP for other features, this becomes a problem. The AS SDP
configuration can change dynamically based on VRR, CMRR, PR, ALPM, etc.
Since these features may be enabled or disabled after the initial
configuration, the AS SDP parameters need to be computed later in the
pipeline.

However, not all of the AS SDP logic can be moved to the late stage:
the VRR guardband optimization depends on knowing early whether AS SDP
can be used. Without this, we would end up accounting for AS SDP on all
platforms that support it, even for panels that do not support AS SDP.
Therefore we set the infoframe enable bit for AS SDP during
compute_config(), before the guardband is computed.

To handle these constraints, split the AS SDP programming into two
phases:

 - intel_dp_compute_as_sdp()
   Runs during compute_config().
   Sets only the infoframe enable bit so that the guardband logic can
   account for AS SDP requirements.

 - intel_dp_as_sdp_compute_config_late()
   Runs during compute_config_late().
   Computes all remaining AS SDP fields based on the features that need
   it.

The late-stage computation is called from
intel_dp_sdp_compute_config_late(), before computing the minimum guardband
for SDPs.

This is a preparatory change. A subsequent patch will always enable AS
SDP when the source and sink support it.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 67 ++++++++++++++++---------
 1 file changed, 44 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 2b0318e0ceb0..4d0a7695be5a 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -3142,30 +3142,17 @@ static bool intel_dp_can_use_as_sdp(struct intel_dp *intel_dp,
 static void intel_dp_compute_as_sdp(struct intel_dp *intel_dp,
 				    struct intel_crtc_state *crtc_state)
 {
-	struct drm_dp_as_sdp *as_sdp = &crtc_state->infoframes.as_sdp;
-	const struct drm_display_mode *adjusted_mode =
-		&crtc_state->hw.adjusted_mode;
-
 	if (!intel_dp_can_use_as_sdp(intel_dp, crtc_state))
 		return;
 
+	/*
+	 * Only set the infoframes.enable flag here.
+	 * The remaining AS SDP fields are programmed in the
+	 * compute_config_late() phase. We need this flag early so that the
+	 * VRR guardband calculation can properly account for AS SDP
+	 * requirements.
+	 */
 	crtc_state->infoframes.enable |= intel_hdmi_infoframe_enable(DP_SDP_ADAPTIVE_SYNC);
-
-	as_sdp->sdp_type = DP_SDP_ADAPTIVE_SYNC;
-	as_sdp->length = 0x9;
-	as_sdp->duration_incr_ms = 0;
-	as_sdp->revision = 0x2;
-	as_sdp->vtotal = intel_vrr_vmin_vtotal(crtc_state);
-
-	if (crtc_state->cmrr.enable) {
-		as_sdp->mode = DP_AS_SDP_FAVT_TRR_REACHED;
-		as_sdp->target_rr = drm_mode_vrefresh(adjusted_mode);
-		as_sdp->target_rr_divider = true;
-	} else if (crtc_state->vrr.enable) {
-		as_sdp->mode = DP_AS_SDP_AVT_DYNAMIC_VTOTAL;
-	} else {
-		as_sdp->mode = DP_AS_SDP_AVT_FIXED_VTOTAL;
-	}
 }
 
 static void intel_dp_compute_vsc_sdp(struct intel_dp *intel_dp,
@@ -7344,11 +7331,45 @@ void intel_dp_mst_resume(struct intel_display *display)
 }
 
 static
-int intel_dp_sdp_compute_config_late(struct intel_crtc_state *crtc_state)
+void intel_dp_as_sdp_compute_config_late(struct intel_dp *intel_dp,
+					 struct intel_crtc_state *crtc_state)
+{
+	struct drm_dp_as_sdp *as_sdp = &crtc_state->infoframes.as_sdp;
+	const struct drm_display_mode *adjusted_mode =
+		&crtc_state->hw.adjusted_mode;
+
+	if ((crtc_state->infoframes.enable &
+	    intel_hdmi_infoframe_enable(DP_SDP_ADAPTIVE_SYNC)) == 0)
+		return;
+
+	as_sdp->sdp_type = DP_SDP_ADAPTIVE_SYNC;
+	as_sdp->length = 0x9;
+	as_sdp->duration_incr_ms = 0;
+	as_sdp->revision = 0x2;
+	as_sdp->vtotal = intel_vrr_vmin_vtotal(crtc_state);
+
+	if (crtc_state->cmrr.enable) {
+		as_sdp->mode = DP_AS_SDP_FAVT_TRR_REACHED;
+		as_sdp->target_rr = drm_mode_vrefresh(adjusted_mode);
+		as_sdp->target_rr_divider = true;
+	} else if (crtc_state->vrr.enable) {
+		as_sdp->mode = DP_AS_SDP_AVT_DYNAMIC_VTOTAL;
+	} else {
+		as_sdp->mode = DP_AS_SDP_AVT_FIXED_VTOTAL;
+	}
+}
+
+static
+int intel_dp_sdp_compute_config_late(struct intel_dp *intel_dp,
+				     struct intel_crtc_state *crtc_state)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
 	int guardband = intel_crtc_vblank_length(crtc_state);
-	int min_sdp_guardband = intel_dp_sdp_min_guardband(crtc_state, false);
+	int min_sdp_guardband;
+
+	intel_dp_as_sdp_compute_config_late(intel_dp, crtc_state);
+
+	min_sdp_guardband = intel_dp_sdp_min_guardband(crtc_state, false);
 
 	if (guardband < min_sdp_guardband) {
 		drm_dbg_kms(display->drm, "guardband %d < min sdp guardband %d\n",
@@ -7368,7 +7389,7 @@ int intel_dp_compute_config_late(struct intel_encoder *encoder,
 
 	intel_psr_compute_config_late(intel_dp, crtc_state);
 
-	ret = intel_dp_sdp_compute_config_late(crtc_state);
+	ret = intel_dp_sdp_compute_config_late(intel_dp, crtc_state);
 	if (ret)
 		return ret;
 
-- 
2.45.2

