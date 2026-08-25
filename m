Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24381C61CE3
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 06:19:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0F5710E8F7;
	Tue, 25 Aug 2026 06:19:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IEXSV+QR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0DF110E8EC;
 Tue, 25 Aug 2026 06:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787638769; x=1819174769;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fvY5hqkEpFmvzRqHi3+NARzgl7U93KVNTNTsVMt6FvA=;
 b=IEXSV+QR9h75M7ixI/79ZbYPqS9WxuZ2/RzqELxYHgOIS1ughTOlLgVR
 P1E7wEWgIbUaTfCU+XCHyD+9SIiLa6vvyQ+VRiTnkbMdTTsSc21Ko4p+y
 ZMYQpgJjIrUPdSmQ8u+Oi6l9x5XVULK/WODhiSByjGspr8c6AI7hys4Ha
 BBnMmGRm8sEz63JnhfXu8fKbEKeTgH6qRl7+mpX5Exqq3B/8uL2rt6rbA
 IuoaGdF2ZYK9v3CNm09dKQP6r8MZwKRsU/yJrQnc6e0+wSkPErQQt3TE6
 RXF+ir5htgSWNTo9zSglumIKNXm6AlwuwM0gWn5bPOwQSEzfbovGzOOIt w==;
X-CSE-ConnectionGUID: TyUkGUrSSueds5kvKvvKRA==
X-CSE-MsgGUID: uMq0tzIWSmWdxV2abBs0kQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="88112674"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="88112674"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 23:19:29 -0700
X-CSE-ConnectionGUID: EFSe70zIQ1SjAZ1ERh71xA==
X-CSE-MsgGUID: aFtr+zjyQhOCNc+mE0fIWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="263912971"
Received: from unknown (HELO SRR4-3-Linux-101-amanna.iind.intel.com)
 ([10.190.238.88])
 by fmviesa007.fm.intel.com with ESMTP; 24 Aug 2026 23:19:27 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jouni.hogander@intel.com, jani.nikula@intel.com, suraj.kandpal@intel.com,
 Animesh Manna <animesh.manna@intel.com>
Subject: [PATCH v5 09/15] drm/i915/alpm: Modify LFPS cycle count for DP ALPM
Date: Tue, 25 Aug 2026 11:15:30 +0530
Message-Id: <20260825054536.3455704-10-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20260825054536.3455704-1-animesh.manna@intel.com>
References: <20260825054536.3455704-1-animesh.manna@intel.com>
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

For DP minimum LFPS count is set to minimum 16.

Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_alpm.c     | 28 +++++++++++++++++--
 drivers/gpu/drm/i915/display/intel_psr_regs.h |  2 ++
 2 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
index 98aa418a6ff7..890bf2488554 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.c
+++ b/drivers/gpu/drm/i915/display/intel_alpm.c
@@ -24,7 +24,8 @@
 				(SILENCE_PERIOD_MAX_TIME -	\
 				 SILENCE_PERIOD_MIN_TIME) / 2)
 
-#define LFPS_CYCLE_COUNT 10
+#define LFPS_CYCLE_COUNT	10
+#define LFPS_CYCLE_COUNT_DP	16
 
 bool intel_alpm_aux_wake_supported(struct intel_dp *intel_dp)
 {
@@ -105,10 +106,22 @@ static int get_lfps_cycle_time(const struct intel_crtc_state *crtc_state)
 	return tlfps_cycle_min +  (tlfps_cycle_max - tlfps_cycle_min) / 2;
 }
 
+static int get_lfps_cycle_count(const struct intel_crtc_state *crtc_state)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+
+	/* External DP on Xe3lpd+ uses a minimum of 16 LFPS cycles. */
+	if (!intel_crtc_has_type(crtc_state, INTEL_OUTPUT_EDP) &&
+	    DISPLAY_VER(display) >= 35)
+		return LFPS_CYCLE_COUNT_DP;
+
+	return LFPS_CYCLE_COUNT;
+}
+
 static int get_lfps_half_cycle_clocks(const struct intel_crtc_state *crtc_state)
 {
 	return get_lfps_cycle_time(crtc_state) * crtc_state->port_clock / 1000 /
-		1000 / (2 * LFPS_CYCLE_COUNT);
+		1000 / (2 * get_lfps_cycle_count(crtc_state));
 }
 
 #define ML_PHY_LOCK_LEN		252
@@ -622,12 +635,21 @@ void intel_alpm_port_configure(struct intel_dp *intel_dp,
 		return;
 
 	if (intel_alpm_is_alpm_aux_less(intel_dp, crtc_state)) {
+		int lfps_cycle = get_lfps_cycle_count(crtc_state);
+		u32 lfps_cycle_val;
+
+		if (intel_crtc_has_type(crtc_state, INTEL_OUTPUT_EDP))
+			lfps_cycle_val = PORT_ALPM_LFPS_CTL_LFPS_CYCLE_COUNT(lfps_cycle);
+		else
+			lfps_cycle_val = PORT_ALPM_LFPS_CTL_LFPS_CYCLE_COUNT_XE3LPD(lfps_cycle);
+
 		alpm_ctl_val = PORT_ALPM_CTL_ALPM_AUX_LESS_ENABLE |
 			PORT_ALPM_CTL_MAX_PHY_SWING_SETUP(15) |
 			PORT_ALPM_CTL_MAX_PHY_SWING_HOLD(0) |
 			PORT_ALPM_CTL_SILENCE_PERIOD(
 				crtc_state->alpm_state.silence_period_sym_clocks);
-		lfps_ctl_val = PORT_ALPM_LFPS_CTL_LFPS_CYCLE_COUNT(LFPS_CYCLE_COUNT) |
+
+		lfps_ctl_val = lfps_cycle_val |
 			PORT_ALPM_LFPS_CTL_LFPS_HALF_CYCLE_DURATION(
 				crtc_state->alpm_state.lfps_half_cycle_num_of_syms) |
 			PORT_ALPM_LFPS_CTL_FIRST_LFPS_HALF_CYCLE_DURATION(
diff --git a/drivers/gpu/drm/i915/display/intel_psr_regs.h b/drivers/gpu/drm/i915/display/intel_psr_regs.h
index 8ec99bbd84b6..d33e9b0a81d7 100644
--- a/drivers/gpu/drm/i915/display/intel_psr_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_psr_regs.h
@@ -333,8 +333,10 @@
 #define PORT_ALPM_LFPS_CTL(port)				_MMIO_PORT(port, _PORT_ALPM_LFPS_CTL_A, _PORT_ALPM_LFPS_CTL_B)
 #define  PORT_ALPM_LFPS_CTL_LFPS_START_POLARITY			REG_BIT(31)
 #define  PORT_ALPM_LFPS_CTL_LFPS_CYCLE_COUNT_MASK		REG_GENMASK(27, 24)
+#define  PORT_ALPM_LFPS_CTL_LFPS_CYCLE_COUNT_MASK_XE3LPD	REG_GENMASK(30, 24)
 #define  PORT_ALPM_LFPS_CTL_LFPS_CYCLE_COUNT_MIN		7
 #define  PORT_ALPM_LFPS_CTL_LFPS_CYCLE_COUNT(val)		REG_FIELD_PREP(PORT_ALPM_LFPS_CTL_LFPS_CYCLE_COUNT_MASK, (val) - PORT_ALPM_LFPS_CTL_LFPS_CYCLE_COUNT_MIN)
+#define  PORT_ALPM_LFPS_CTL_LFPS_CYCLE_COUNT_XE3LPD(val)	REG_FIELD_PREP(PORT_ALPM_LFPS_CTL_LFPS_CYCLE_COUNT_MASK_XE3LPD, (val) - PORT_ALPM_LFPS_CTL_LFPS_CYCLE_COUNT_MIN)
 #define  PORT_ALPM_LFPS_CTL_LFPS_HALF_CYCLE_DURATION_MASK	REG_GENMASK(20, 16)
 #define  PORT_ALPM_LFPS_CTL_LFPS_HALF_CYCLE_DURATION(val)	REG_FIELD_PREP(PORT_ALPM_LFPS_CTL_LFPS_HALF_CYCLE_DURATION_MASK, val)
 #define  PORT_ALPM_LFPS_CTL_FIRST_LFPS_HALF_CYCLE_DURATION_MASK	REG_GENMASK(12, 8)
-- 
2.29.0

