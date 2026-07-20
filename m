Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D508BC44528
	for <intel-xe@archiver.kernel.org>; Mon, 20 Jul 2026 09:12:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DD1E10E865;
	Mon, 20 Jul 2026 09:12:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J1JlhCsL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3894510E84A;
 Mon, 20 Jul 2026 09:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784538734; x=1816074734;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cYTt3a/GMo3ephCqsToCt5k4my/oOyLBpjwCwyRA/Wo=;
 b=J1JlhCsLJvo7sv42i5A7B5BLQChAoMdd5KnW39LTBSWBmOJEdpujMUZa
 8rkG2RJ5lPWDtiLPTGUBwEpBRmT/DANZEQT9P1n92HXIMLXOeCPVo+ggT
 HiiKpcN1KAK0gh0wDo19CGuWKj9FUqOFN85p+5KjLxNopBd2JmBPlB/Uw
 Aoj6enC3H6HtnmLAQWm+a0Ac4JjUAXb3xKSK2oBH4v0i79TKHIcUvYekh
 WC8xY9v0WiNaOTGth6vPlaMiHdIKUHRz1mPkoXu+rP9S9Cj+7GagQa8k5
 P65evVNcjRf5zHO6yVHU8Xf/qnsGhC2OIPubspMLswrex3ChJQ7igOP0L g==;
X-CSE-ConnectionGUID: Vn9PA1blTTycjz179BXHdQ==
X-CSE-MsgGUID: Dcn1DhK8RWe8Oba7ODwb+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11851"; a="102664813"
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; d="scan'208";a="102664813"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 02:12:14 -0700
X-CSE-ConnectionGUID: BZO5xLT2Sh6p20LseaKffw==
X-CSE-MsgGUID: lmeLWnB/TW+JgGiydDilRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; d="scan'208";a="260963492"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orviesa003.jf.intel.com with ESMTP; 20 Jul 2026 02:12:12 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, uma.shankar@intel.com,
 ankit.k.nautiyal@intel.com, chaitanya.kumar.borah@intel.com
Subject: [PATCH v4 8/9] drm/i915/vrr: Program CMRR enable/disable from
 transcoder timings
Date: Mon, 20 Jul 2026 14:31:40 +0530
Message-ID: <20260720090142.2864289-9-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260720090142.2864289-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20260720090142.2864289-1-mitulkumar.ajitkumar.golani@intel.com>
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

Split the CMRR M/N register programming into intel_vrr_enable_cmrr()
and intel_vrr_disable_cmrr(), and drive them from
intel_vrr_set_fixed_rr_timings() based on crtc_state->vrr.cmrr.enable.

VRR_CTL_CMRR_ENABLE is not set explicitly, writing TRANS_CMRR_N_HI
arms CMRR in hardware. Drop the now-unused cmrr_enable
argument to intel_vrr_tg_enable().

No functional change intended for non-CMRR configurations.

--v2:
- Commit message changes.
- Added Simplified enable/disable sequence. (Chaitanya)

--v3:
- Guard CMRR enable condition (Chaitanya)
- Comment changes updated (Chaitanya)
- Squash register write commits together and
avoid double writing issue. (Chaitanya)

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Assisted-by: Claude:claude-opus-4-8
---
 drivers/gpu/drm/i915/display/intel_vrr.c | 60 ++++++++++++++++--------
 1 file changed, 41 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index fa9d1a57f438..ae9824e679f3 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -188,6 +188,34 @@ int intel_vrr_vmax_vblank_start(const struct intel_crtc_state *crtc_state)
 	return intel_vrr_vmax_vtotal(crtc_state) - crtc_state->vrr.guardband;
 }
 
+static void
+intel_vrr_enable_cmrr(const struct intel_crtc_state *crtc_state)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
+
+	intel_de_write(display, TRANS_CMRR_M_HI(display, cpu_transcoder),
+		       upper_32_bits(crtc_state->vrr.cmrr.cmrr_m));
+	intel_de_write(display, TRANS_CMRR_M_LO(display, cpu_transcoder),
+		       lower_32_bits(crtc_state->vrr.cmrr.cmrr_m));
+	intel_de_write(display, TRANS_CMRR_N_LO(display, cpu_transcoder),
+		       lower_32_bits(crtc_state->vrr.cmrr.cmrr_n));
+	intel_de_write(display, TRANS_CMRR_N_HI(display, cpu_transcoder),
+		       upper_32_bits(crtc_state->vrr.cmrr.cmrr_n));
+}
+
+static void
+intel_vrr_disable_cmrr(const struct intel_crtc_state *crtc_state)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
+
+	intel_de_write(display, TRANS_CMRR_M_HI(display, cpu_transcoder), 0);
+	intel_de_write(display, TRANS_CMRR_M_LO(display, cpu_transcoder), 0);
+	intel_de_write(display, TRANS_CMRR_N_LO(display, cpu_transcoder), 0);
+	intel_de_write(display, TRANS_CMRR_N_HI(display, cpu_transcoder), 0);
+}
+
 static void
 intel_vrr_cmrr_compute_config(struct intel_crtc_state *crtc_state)
 {
@@ -342,6 +370,11 @@ void intel_vrr_set_fixed_rr_timings(const struct intel_crtc_state *crtc_state,
 	if (!intel_vrr_possible(crtc_state))
 		return;
 
+	if (crtc_state->vrr.cmrr.enable)
+		intel_vrr_enable_cmrr(crtc_state);
+	else
+		intel_vrr_disable_cmrr(crtc_state);
+
 	intel_de_write(display, TRANS_VRR_VMIN(display, transcoder),
 		       intel_vrr_fixed_rr_hw_vmin(crtc_state) - 1);
 	intel_de_write(display, TRANS_VRR_VMAX(display, transcoder),
@@ -653,17 +686,6 @@ void intel_vrr_set_transcoder_timings(const struct intel_crtc_state *crtc_state)
 		return;
 	}
 
-	if (crtc_state->vrr.cmrr.enable) {
-		intel_de_write(display, TRANS_CMRR_M_HI(display, cpu_transcoder),
-			       upper_32_bits(crtc_state->vrr.cmrr.cmrr_m));
-		intel_de_write(display, TRANS_CMRR_M_LO(display, cpu_transcoder),
-			       lower_32_bits(crtc_state->vrr.cmrr.cmrr_m));
-		intel_de_write(display, TRANS_CMRR_N_HI(display, cpu_transcoder),
-			       upper_32_bits(crtc_state->vrr.cmrr.cmrr_n));
-		intel_de_write(display, TRANS_CMRR_N_LO(display, cpu_transcoder),
-			       lower_32_bits(crtc_state->vrr.cmrr.cmrr_n));
-	}
-
 	intel_vrr_set_fixed_rr_timings(crtc_state, cpu_transcoder);
 	intel_cmtg_set_vrr_timings(crtc_state);
 
@@ -929,8 +951,7 @@ intel_vrr_disable_dc_balancing(const struct intel_crtc_state *old_crtc_state)
 	intel_de_write(display, TRANS_VRR_CTL(display, cpu_transcoder), vrr_ctl);
 }
 
-static void intel_vrr_tg_enable(const struct intel_crtc_state *crtc_state,
-				bool cmrr_enable)
+static void intel_vrr_tg_enable(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
@@ -942,11 +963,12 @@ static void intel_vrr_tg_enable(const struct intel_crtc_state *crtc_state,
 	vrr_ctl = VRR_CTL_VRR_ENABLE | trans_vrr_ctl(crtc_state);
 
 	/*
-	 * FIXME this might be broken as bspec seems to imply that
-	 * even VRR_CTL_CMRR_ENABLE is armed by TRANS_CMRR_N_HI
-	 * when enabling CMRR (but not when disabling CMRR?).
+	 * This full TRANS_VRR_CTL write is the authoritative one, so it must
+	 * carry VRR_CTL_CMRR_ENABLE when CMRR is in use. Writing TRANS_CMRR_N_HI
+	 * arms the bit in hardware, but this later write would otherwise clear
+	 * it again.
 	 */
-	if (cmrr_enable)
+	if (crtc_state->vrr.cmrr.enable)
 		vrr_ctl |= VRR_CTL_CMRR_ENABLE;
 
 	intel_de_write(display, TRANS_VRR_CTL(display, cpu_transcoder), vrr_ctl);
@@ -982,7 +1004,7 @@ void intel_vrr_enable(const struct intel_crtc_state *crtc_state)
 	intel_vrr_enable_dc_balancing(crtc_state);
 
 	if (!intel_vrr_always_use_vrr_tg(display))
-		intel_vrr_tg_enable(crtc_state, crtc_state->vrr.cmrr.enable);
+		intel_vrr_tg_enable(crtc_state);
 }
 
 void intel_vrr_disable(const struct intel_crtc_state *old_crtc_state)
@@ -1009,7 +1031,7 @@ void intel_vrr_transcoder_enable(const struct intel_crtc_state *crtc_state)
 		return;
 
 	if (intel_vrr_always_use_vrr_tg(display))
-		intel_vrr_tg_enable(crtc_state, false);
+		intel_vrr_tg_enable(crtc_state);
 }
 
 void intel_vrr_transcoder_disable(const struct intel_crtc_state *old_crtc_state)
-- 
2.48.1

