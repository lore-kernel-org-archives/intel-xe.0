Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B11A3C53219
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jul 2026 15:11:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E72910E96C;
	Tue, 28 Jul 2026 15:11:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ILcLaCkj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9738A10E926;
 Tue, 28 Jul 2026 15:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785251485; x=1816787485;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=80YikCK21YQb+r524cZ8QZTBBCJJFNf7699Nt5zuCKs=;
 b=ILcLaCkjn73FclemIPf9QLU7DP/JInpjCuDzvilqITHLpWL70UzGcBLu
 P6W7toCwq+yrz8gPpUqapJrO0J6Y4TABCRqYlayHyvFwkKAcgBD4b9LKO
 CspPM9Xt+a3QA6WGZHV73RYSrkT9ajgQXWaUyKZUyIAOqbS8vrA4OWhI2
 Oc5RKwkuId0B2bTIfCNHI4pADMLKETBd00dexc41AUg4U0wn7gy+47tjh
 1OKLEiBzOezQ0R78LVm+eYlILSGASnyW+hwJZsD8pNKIPz2PIukrO7bw5
 LWTwxa6lrZFNm+0odPm90O1RKnGxOBNZJJE/HS5SxqvR+DPNj6He88zv4 g==;
X-CSE-ConnectionGUID: FcItPFZoRoKH2xDQ6rrivQ==
X-CSE-MsgGUID: BBF5XAhDSdaQNo57uirKqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="88376958"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="88376958"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 08:10:12 -0700
X-CSE-ConnectionGUID: c/sxYMJbToOYH8Eq/vgO/A==
X-CSE-MsgGUID: JsnloefpTLaYL2zDvQHbZg==
X-ExtLoop1: 1
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by fmviesa003.fm.intel.com with ESMTP; 28 Jul 2026 08:10:10 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, uma.shankar@intel.com,
 ankit.k.nautiyal@intel.com, chaitanya.kumar.borah@intel.com
Subject: [PATCH v7 08/10] drm/i915/vrr: Program CMRR enable/disable from
 transcoder timings
Date: Tue, 28 Jul 2026 20:29:40 +0530
Message-ID: <20260728145943.3848704-9-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260728145943.3848704-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20260728145943.3848704-1-mitulkumar.ajitkumar.golani@intel.com>
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

--v5:
- Update CMRR in enable/disable path

--v6:
- Simplify enable/disable calls (Chaitanya)
- Make function usable for common cmtg and cpu transcoder
(Chaitanya)

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Assisted-by: Claude:claude-opus-4-8
---
 drivers/gpu/drm/i915/display/intel_vrr.c | 59 ++++++++++++++++--------
 1 file changed, 40 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index 056d513ab637..8d871aa58cab 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -352,6 +352,36 @@ int intel_vrr_fixed_rr_hw_flipline(const struct intel_crtc_state *crtc_state)
 	return intel_vrr_fixed_rr_hw_vtotal(crtc_state);
 }
 
+static void
+intel_vrr_set_cmrr_timings(const struct intel_crtc_state *crtc_state,
+			   enum transcoder transcoder)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+
+	if (!intel_vrr_cmrr_possible(crtc_state))
+		return;
+
+	intel_de_write(display, TRANS_CMRR_M_HI(display, transcoder),
+		       upper_32_bits(crtc_state->vrr.cmrr.cmrr_m));
+	intel_de_write(display, TRANS_CMRR_M_LO(display, transcoder),
+		       lower_32_bits(crtc_state->vrr.cmrr.cmrr_m));
+	intel_de_write(display, TRANS_CMRR_N_LO(display, transcoder),
+		       lower_32_bits(crtc_state->vrr.cmrr.cmrr_n));
+	intel_de_write(display, TRANS_CMRR_N_HI(display, transcoder),
+		       upper_32_bits(crtc_state->vrr.cmrr.cmrr_n));
+
+	/*
+	 * On always-VRR-TG platforms the fastset path does not rewrite the
+	 * whole TRANS_VRR_CTL, so RMW only the CMRR enable bit here. On a
+	 * modeset the authoritative writes (intel_vrr_tg_enable(),
+	 * intel_cmtg_set_vrr_ctl()) carry the same bit, so this stays
+	 * consistent.
+	 */
+	intel_de_rmw(display, TRANS_VRR_CTL(display, transcoder),
+		     VRR_CTL_CMRR_ENABLE,
+		     crtc_state->vrr.cmrr.enable ? VRR_CTL_CMRR_ENABLE : 0);
+}
+
 void intel_vrr_set_fixed_rr_timings(const struct intel_crtc_state *crtc_state,
 				    enum transcoder transcoder)
 {
@@ -360,6 +390,8 @@ void intel_vrr_set_fixed_rr_timings(const struct intel_crtc_state *crtc_state,
 	if (!intel_vrr_possible(crtc_state))
 		return;
 
+	intel_vrr_set_cmrr_timings(crtc_state, transcoder);
+
 	intel_de_write(display, TRANS_VRR_VMIN(display, transcoder),
 		       intel_vrr_fixed_rr_hw_vmin(crtc_state) - 1);
 	intel_de_write(display, TRANS_VRR_VMAX(display, transcoder),
@@ -671,17 +703,6 @@ void intel_vrr_set_transcoder_timings(const struct intel_crtc_state *crtc_state)
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
 
@@ -947,8 +968,7 @@ intel_vrr_disable_dc_balancing(const struct intel_crtc_state *old_crtc_state)
 	intel_de_write(display, TRANS_VRR_CTL(display, cpu_transcoder), vrr_ctl);
 }
 
-static void intel_vrr_tg_enable(const struct intel_crtc_state *crtc_state,
-				bool cmrr_enable)
+static void intel_vrr_tg_enable(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
@@ -960,11 +980,12 @@ static void intel_vrr_tg_enable(const struct intel_crtc_state *crtc_state,
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
@@ -1000,7 +1021,7 @@ void intel_vrr_enable(const struct intel_crtc_state *crtc_state)
 	intel_vrr_enable_dc_balancing(crtc_state);
 
 	if (!intel_vrr_always_use_vrr_tg(display))
-		intel_vrr_tg_enable(crtc_state, crtc_state->vrr.cmrr.enable);
+		intel_vrr_tg_enable(crtc_state);
 }
 
 void intel_vrr_disable(const struct intel_crtc_state *old_crtc_state)
@@ -1027,7 +1048,7 @@ void intel_vrr_transcoder_enable(const struct intel_crtc_state *crtc_state)
 		return;
 
 	if (intel_vrr_always_use_vrr_tg(display))
-		intel_vrr_tg_enable(crtc_state, false);
+		intel_vrr_tg_enable(crtc_state);
 }
 
 void intel_vrr_transcoder_disable(const struct intel_crtc_state *old_crtc_state)
-- 
2.48.1

