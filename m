Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ACA5CD343F
	for <intel-xe@archiver.kernel.org>; Mon, 18 May 2026 04:09:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E124010E2DA;
	Mon, 18 May 2026 04:09:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ETKUVI7Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2652110E5C4;
 Mon, 18 May 2026 04:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779077390; x=1810613390;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+ukcfKImL1y8CYIH1FQBrUyNIc3ZeRpAkPxCkGPODeg=;
 b=ETKUVI7Y3c7w7V7S9u8yYOE1fhwnfej7NpKoEzK4lGwLOIzYbR7PSPvL
 NY6E0steqWhSBOMTNdPiuZZkJ19Qfv5AfuQPBcHvsiV+7cIBCA6fRnFcR
 X31rovy9DNr6gVmi0v74w4wMJ7SBy4kwhPOKei49WBCa9IQml4zP5Usis
 xt2oYwnAtGXZyeW0Sq2Pq8LVXPHPc6Ko77DiNAK/fzTxbv0M1F3qPTS2z
 pBO6s8GJiUgE53tgr2BJguEn5lvDkpPrB0rv7GQvcZusDTx3YoEsv6ysR
 YIM/sEQEGI9uJw7zW2XBfqP4zfeDlOJ0Qe7rSljRg4KeZFvkIb9iObCNR A==;
X-CSE-ConnectionGUID: 401RyofsScSAWxXW8a6SGw==
X-CSE-MsgGUID: IMGzsztoQvKl/U0CmKjF0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="97495626"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; d="scan'208";a="97495626"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2026 21:09:50 -0700
X-CSE-ConnectionGUID: X3ZkaRLZTTaekNp4lyK+Nw==
X-CSE-MsgGUID: ZtBYnwOQTb+JJIKt0bkqjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; d="scan'208";a="277403629"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2026 21:09:48 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, jouni.hogander@intel.com,
 animesh.manna@intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 09/11] drm/i915/dp: Split AS SDP computation between
 compute_config and compute_config_late
Date: Mon, 18 May 2026 09:24:59 +0530
Message-ID: <20260518035502.2909359-10-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260518035502.2909359-1-ankit.k.nautiyal@intel.com>
References: <20260518035502.2909359-1-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This is a preparatory change. A subsequent patches will compute PR related
AS SDP fields and enable AS SDP not only for VRR but for other features
as well.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 66 ++++++++++++++++---------
 1 file changed, 43 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 8d0d04f306a7..c1c6f394eb0b 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -3187,10 +3187,6 @@ static bool intel_dp_needs_as_sdp(struct intel_dp *intel_dp,
 static void intel_dp_compute_as_sdp(struct intel_dp *intel_dp,
 				    struct intel_crtc_state *crtc_state)
 {
-	struct drm_dp_as_sdp *as_sdp = &crtc_state->infoframes.as_sdp;
-	const struct drm_display_mode *adjusted_mode =
-		&crtc_state->hw.adjusted_mode;
-
 	/*
 	 * #FIXME: SDP/infoframe updates aren’t truly atomic, and with the new
 	 * cdclk->tc clock crossing we may transiently send a corrupted packet
@@ -3199,23 +3195,13 @@ static void intel_dp_compute_as_sdp(struct intel_dp *intel_dp,
 	if (!intel_dp_needs_as_sdp(intel_dp, crtc_state))
 		return;
 
+	/*
+	 * Only set the infoframes.enable flag here. The remaining AS SDP fields
+	 * are programmed in the compute_config_late() phase. We need this flag
+	 * early so that the VRR guardband calculation can properly account for
+	 * AS SDP requirements.
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
@@ -7459,11 +7445,45 @@ void intel_dp_mst_resume(struct intel_display *display)
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
@@ -7483,7 +7503,7 @@ int intel_dp_compute_config_late(struct intel_encoder *encoder,
 
 	intel_psr_compute_config_late(intel_dp, crtc_state);
 
-	ret = intel_dp_sdp_compute_config_late(crtc_state);
+	ret = intel_dp_sdp_compute_config_late(intel_dp, crtc_state);
 	if (ret)
 		return ret;
 
-- 
2.45.2

