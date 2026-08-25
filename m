Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6696BC5DF94
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 06:19:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 268AC10E8FC;
	Tue, 25 Aug 2026 06:19:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A2HuWYPj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE58110E8F6;
 Tue, 25 Aug 2026 06:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787638783; x=1819174783;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gZMMp7/PZYfecyttCqJRJbT4bdxbQ7kuMvrpCBXSKs8=;
 b=A2HuWYPjuatc/ged1rlpqVv1DS5U2ndS5EShttDgbVdb3mx3itOexY+U
 /n9F29eEH942upKoSD0eXvgxwvSHg1R58LVVE/c8ga8jAyzs60VA6SdNC
 trhKeN1D+Sn0V9zGPHiojEKUbdGzK7AktmAzzx8h/Sy3dvLocztX7Y2H+
 MIitn/eggvQ2L8ZOdWD5UQSX1Rhv+yhLk8qZ+8zWlJoq2J1z5rbO2wAnj
 CNM63CxHvAyHuv1HnsKU4pIjzdm7GjcOSBcLgoIvxD2V7ePOBsZB8brzJ
 3tuWreHNMlQTyENosj80av/jcZerDcy//f64wkjfiGBPEfWoZtGXb4nuB A==;
X-CSE-ConnectionGUID: j6hoIfjjQYS/5Gg801EHzA==
X-CSE-MsgGUID: Fx9aI6VfR9+BYtqFkGqaCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="88112702"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="88112702"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 23:19:43 -0700
X-CSE-ConnectionGUID: alwXDLsyT327hFcNAMD+TQ==
X-CSE-MsgGUID: cUuwZqr4RQqd1xk5k1aYyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="263913016"
Received: from unknown (HELO SRR4-3-Linux-101-amanna.iind.intel.com)
 ([10.190.238.88])
 by fmviesa007.fm.intel.com with ESMTP; 24 Aug 2026 23:19:41 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jouni.hogander@intel.com, jani.nikula@intel.com, suraj.kandpal@intel.com,
 Animesh Manna <animesh.manna@intel.com>
Subject: [PATCH v5 14/15] drm/i915/alpm: Compute and program switch to active
 latency
Date: Tue, 25 Aug 2026 11:15:35 +0530
Message-Id: <20260825054536.3455704-15-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20260825054536.3455704-1-animesh.manna@intel.com>
References: <20260825054536.3455704-1-animesh.manna@intel.com>
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

Program the ALPM switch to active latency into ALPM_CTL2. For UHBR link
rates the latency is derived from the link symbol clock and converted to
scanlines, for non-UHBR rates it is zero.

Cc: Jouni Högander <jouni.hogander@intel.com>
Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_alpm.c     | 32 +++++++++++++++++--
 .../drm/i915/display/intel_display_types.h    |  1 +
 2 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
index 8c17da9883d6..5d2ac7561567 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.c
+++ b/drivers/gpu/drm/i915/display/intel_alpm.c
@@ -270,6 +270,31 @@ static int get_establishment_period(struct intel_dp *intel_dp,
 	return establishment_period;
 }
 
+
+static int get_switch_to_active(const struct intel_crtc_state *crtc_state)
+{
+	int port_clock = crtc_state->port_clock;
+	int switch_to_active;
+
+	if (intel_dp_is_uhbr(crtc_state)) {
+		/* symbol_clock (fLink) in MHz */
+		int symbol_clock = port_clock / intel_dp_link_symbol_size(port_clock) / 100;
+
+		/*
+		 * tSwitch to Active = 32 * (ML_PHY_LOCK Length + 3 + 64) / fLink
+		 *
+		 * The "+ 3" term is the trailing zero padding after the
+		 * POST_LT_SCRAMBLER_RESET, the "+ 64" term represents the MTP
+		 * time slots. The result is in microseconds.
+		 */
+		switch_to_active = 32 * ((396 + 3 + 64) / symbol_clock);
+	} else {
+		switch_to_active = 0;
+	}
+
+	return switch_to_active;
+}
+
 /*
  * AUX-Less Wake Time = CEILING( ((PHY P2 to P0) + tLFPS_Period, Max+
  * tSilence, Max+ tPHY Establishment + tCDS) / tline)
@@ -329,7 +354,8 @@ _lnl_compute_aux_less_alpm_params(struct intel_dp *intel_dp,
 	crtc_state->alpm_state.aux_less_wake_lines = aux_less_wake_lines;
 	crtc_state->alpm_state.silence_period_sym_clocks = silence_period;
 	crtc_state->alpm_state.lfps_half_cycle_num_of_syms = lfps_half_cycle;
-
+	crtc_state->alpm_state.switch_to_active = intel_usecs_to_scanlines(&crtc_state->hw.adjusted_mode,
+									   get_switch_to_active(crtc_state));
 	return true;
 }
 
@@ -619,8 +645,10 @@ static void lnl_alpm_configure(struct intel_dp *intel_dp,
 	lttpr_count = drm_dp_lttpr_count(intel_dp->lttpr_common_caps);
 
 	alpm_ctl2 = intel_de_read(display, ALPM_CTL2(display, cpu_transcoder));
-	alpm_ctl2 &= ~ALPM_CTL2_NUMBER_OF_LTTPR_MASK;
+	alpm_ctl2 &= ~(ALPM_CTL2_NUMBER_OF_LTTPR_MASK |
+		       ALPM_CTL2_SWITCH_TO_ACTIVE_LATENCY_MASK);
 	alpm_ctl2 |= ALPM_CTL2_NUMBER_OF_LTTPR(lttpr_count);
+	alpm_ctl2 |= ALPM_CTL2_SWITCH_TO_ACTIVE_LATENCY(crtc_state->alpm_state.switch_to_active);
 
 	intel_de_write(display, ALPM_CTL2(display, cpu_transcoder), alpm_ctl2);
 	intel_de_write(display, ALPM_CTL(display, cpu_transcoder), alpm_ctl);
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index f8ac98ff8a87..4cbf56a9195f 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1441,6 +1441,7 @@ struct intel_crtc_state {
 		u8 aux_less_wake_lines;
 		u8 silence_period_sym_clocks;
 		u8 lfps_half_cycle_num_of_syms;
+		int switch_to_active;
 	} alpm_state;
 	bool has_alpm;
 
-- 
2.29.0

