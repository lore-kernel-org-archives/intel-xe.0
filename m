Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A935CC44512
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jul 2026 04:49:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B46210EC40;
	Wed, 22 Jul 2026 04:49:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="faHofMbp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE1B210EC41;
 Wed, 22 Jul 2026 04:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784695796; x=1816231796;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0IF9PoHfOagLs7AdhTFrObfWEGKv01TdlzLhyXlr+Vs=;
 b=faHofMbp+i/BIrC1xnkbN6LMXI3ng/xC/HAJv5WdLcknAGBJDc+IBQ2y
 7pr9XiSu8sGs42zAwWEcZKDW8KLoDb4xnad8WZcggh4lib81vFqa6x7Mc
 Xx/bKtN07G/G58erZ6kZaiK93WsXQitbzF47hudHRbz/hlxplyiZ3cbwz
 7sD/Svw/htAcUPNDvQ/beGG7B7UsRmOBBcoBxSNzHcq12CeNXdLY3Pukx
 ll/erfF3IjhA9PHEVNISiTG1V6nj1ZODAf2Kfz+4dFqI2kLbxoXrwJm9E
 Km6BqDX4nrV7VCQSsD+6lsF0vhbTykYoICrxA4KedgvQA8sul9v0gDN/B A==;
X-CSE-ConnectionGUID: D1GNjDffQcqTbSW/F6qZTQ==
X-CSE-MsgGUID: iDRYd04ATFucf3sDw9SEBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="84298493"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="84298493"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 21:49:56 -0700
X-CSE-ConnectionGUID: 45ERvwOrR8m6yxrNowFDIA==
X-CSE-MsgGUID: WzWWzEeyRE22m4bjyeJjvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="253603243"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by fmviesa006.fm.intel.com with ESMTP; 21 Jul 2026 21:49:54 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, uma.shankar@intel.com,
 ankit.k.nautiyal@intel.com, chaitanya.kumar.borah@intel.com
Subject: [PATCH v6 8/9] drm/i915/vrr: Program CMRR enable/disable from
 transcoder timings
Date: Wed, 22 Jul 2026 10:09:20 +0530
Message-ID: <20260722043923.3241977-9-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260722043923.3241977-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20260722043923.3241977-1-mitulkumar.ajitkumar.golani@intel.com>
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

--v4:
- Guard CMRR enable/disable with platform check

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Assisted-by: Claude:claude-opus-4-8
---
 drivers/gpu/drm/i915/display/intel_vrr.c | 66 +++++++++++++++++-------
 1 file changed, 47 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index e8c6516fd36a..6bc3ccd62513 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -195,6 +195,40 @@ static bool intel_vrr_cmrr_possible(const struct intel_crtc_state *crtc_state)
 	return (HAS_CMRR(display) && intel_vrr_always_use_vrr_tg(display));
 }
 
+static void
+intel_vrr_enable_cmrr(const struct intel_crtc_state *crtc_state)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
+
+	if (!intel_vrr_cmrr_possible(crtc_state))
+		return;
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
+	if (!intel_vrr_cmrr_possible(crtc_state))
+		return;
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
@@ -351,6 +385,11 @@ void intel_vrr_set_fixed_rr_timings(const struct intel_crtc_state *crtc_state,
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
@@ -662,17 +701,6 @@ void intel_vrr_set_transcoder_timings(const struct intel_crtc_state *crtc_state)
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
 
@@ -938,8 +966,7 @@ intel_vrr_disable_dc_balancing(const struct intel_crtc_state *old_crtc_state)
 	intel_de_write(display, TRANS_VRR_CTL(display, cpu_transcoder), vrr_ctl);
 }
 
-static void intel_vrr_tg_enable(const struct intel_crtc_state *crtc_state,
-				bool cmrr_enable)
+static void intel_vrr_tg_enable(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
@@ -951,11 +978,12 @@ static void intel_vrr_tg_enable(const struct intel_crtc_state *crtc_state,
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
@@ -991,7 +1019,7 @@ void intel_vrr_enable(const struct intel_crtc_state *crtc_state)
 	intel_vrr_enable_dc_balancing(crtc_state);
 
 	if (!intel_vrr_always_use_vrr_tg(display))
-		intel_vrr_tg_enable(crtc_state, crtc_state->vrr.cmrr.enable);
+		intel_vrr_tg_enable(crtc_state);
 }
 
 void intel_vrr_disable(const struct intel_crtc_state *old_crtc_state)
@@ -1018,7 +1046,7 @@ void intel_vrr_transcoder_enable(const struct intel_crtc_state *crtc_state)
 		return;
 
 	if (intel_vrr_always_use_vrr_tg(display))
-		intel_vrr_tg_enable(crtc_state, false);
+		intel_vrr_tg_enable(crtc_state);
 }
 
 void intel_vrr_transcoder_disable(const struct intel_crtc_state *old_crtc_state)
-- 
2.48.1

