Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3C54C61DBE
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 06:19:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF25610E8EB;
	Tue, 25 Aug 2026 06:19:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QBjB0BOF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A44310E8DF;
 Tue, 25 Aug 2026 06:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787638761; x=1819174761;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mEBnnUSgbkLrTmX1R5MMSo7l/U8nryuobDbDndlkBUI=;
 b=QBjB0BOFrMSFVCPU9gsnXB5GHHri1D5cU7LbquetxRlpb7swsdm8uQhL
 dSVuO9eX/X8q40JO/3V8Ei9eClN8W9I7ez81LjbnNQCkc+NHRpjE13Pja
 QC+XVBP5MEyeiPpB3X9FY+aGyD6Rfb4zVeEwnHvP/o2eeYiJUNjeZVx+3
 rMA12tkyXLTBYcNXjFkY25WOIOAJ3Gbmwew4DOYLLKg2nyQU+VxzCAYBR
 KK749A47hG/xOQWqcnFSqXXLWt1Laj78Uamb/zuHs3/gWUqbAvSedGVyF
 RbRz5G+8rjMKr6oCLuwoDvgs2zl+NQ8e9Ch4xZ+WtuuUo9tYF9NW+W1UK w==;
X-CSE-ConnectionGUID: Ei7E+QjKRMa2Z/YJb4bB7g==
X-CSE-MsgGUID: TYwdMZxiSLqwF2ZD8k3tbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="88112666"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="88112666"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 23:19:21 -0700
X-CSE-ConnectionGUID: MEh9KiWwTqC7HWDUepjRlw==
X-CSE-MsgGUID: 59qV2+HlS8CHUv28Hq0KvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="263912927"
Received: from unknown (HELO SRR4-3-Linux-101-amanna.iind.intel.com)
 ([10.190.238.88])
 by fmviesa007.fm.intel.com with ESMTP; 24 Aug 2026 23:19:19 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jouni.hogander@intel.com, jani.nikula@intel.com, suraj.kandpal@intel.com,
 Animesh Manna <animesh.manna@intel.com>
Subject: [PATCH v5 06/15] drm/i915/alpm: Auxless wake time calculation for Xe3p
Date: Tue, 25 Aug 2026 11:15:27 +0530
Message-Id: <20260825054536.3455704-7-animesh.manna@intel.com>
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

Add support for auxless waketime calculation for DP2.1 ALPM
as dependent parameter got changed.

v1: Initial version.
v2: Use intel_dp_is_uhbr(). [Jani]
v3:
- Separate out switch to active latency calculation.
- Use macro definition for ML_PHY_LOCK length. [Suraj]
- Modify AUX_LESS_WAKE_TIME bitfield for xe3lpd. [Suraj]

Bspec: 71477
Cc: Jouni Högander <jouni.hogander@intel.com>
Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_alpm.c     | 61 +++++++++++++++----
 drivers/gpu/drm/i915/display/intel_psr_regs.h |  2 +
 2 files changed, 51 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
index 4b15d96d0ad7..af2733805505 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.c
+++ b/drivers/gpu/drm/i915/display/intel_alpm.c
@@ -105,21 +105,50 @@ static int get_lfps_half_cycle_clocks(const struct intel_crtc_state *crtc_state)
 		1000 / (2 * LFPS_CYCLE_COUNT);
 }
 
+#define ML_PHY_LOCK_LEN		252
+#define ML_PHY_LOCK_LEN_UHBR	396
+
 static int get_tphy2_p2_to_p0(const struct intel_crtc_state *crtc_state)
 {
-	return 12 * 1000;
+	struct intel_display *display = to_intel_display(crtc_state);
+
+	return DISPLAY_VER(display) >= 35 ? (20 * 1000) : (12 * 1000);
 }
 
-static int get_establishment_period(const struct intel_crtc_state *crtc_state)
+static int get_establishment_period(struct intel_dp *intel_dp,
+				    const struct intel_crtc_state *crtc_state)
 {
 	int t1 = 50 * 1000;
-	int tps4 = 252;
+	int tps4 = intel_dp_is_uhbr(crtc_state) ? (ML_PHY_LOCK_LEN_UHBR * 32) :
+		   (ML_PHY_LOCK_LEN * 10);
 	/* port_clock is link rate in 10kbit/s units */
-	int tml_phy_lock = 1000 * 1000 * tps4 / crtc_state->port_clock;
+	int tml_phy_lock = 1000 * 1000 * tps4 / crtc_state->port_clock / 10;
+	int lttpr_count = 0;
 	int tcds, establishment_period;
 
-	tcds = (7 + DIV_ROUND_UP(6500, tml_phy_lock) + 1) * tml_phy_lock;
-	establishment_period = (SILENCE_PERIOD_TIME + t1 + tcds);
+	if (intel_crtc_has_type(crtc_state, INTEL_OUTPUT_EDP)) {
+		tcds = (7 + DIV_ROUND_UP(6500, tml_phy_lock) + 1) * tml_phy_lock;
+	} else {
+		tcds = 7 * tml_phy_lock;
+		lttpr_count = drm_dp_lttpr_count(intel_dp->lttpr_common_caps);
+	}
+
+	if (lttpr_count) {
+		int tlw = 13000;
+		int tcs = 10000;
+		int tlfps_period = get_lfps_cycle_time(crtc_state);
+		int tdcs = (SILENCE_PERIOD_TIME + t1 + tcs +
+			    (lttpr_count - 1) * (tlw + tlfps_period));
+		int tacds = 70000;
+		int tds = (lttpr_count - 1) * 7 * tml_phy_lock;
+
+		/* tdrl is same as tcds*/
+		establishment_period = tlw + tlfps_period + tdcs + tacds + tds + tcds;
+	} else {
+		/* TODO: Add a check for data realign by DPCD 0x116[3] */
+
+		establishment_period = (SILENCE_PERIOD_TIME + t1 + tcds);
+	}
 
 	return establishment_period;
 }
@@ -141,12 +170,16 @@ static int get_establishment_period(const struct intel_crtc_state *crtc_state)
  * within the CDS period complete within the CDS period regardless of
  * entry into the period
  * tML_PHY_LOCK = TPS4 Length * ( 10 / (Link Rate in MHz) )
- * TPS4 Length = 252 Symbols
+ * ML_PHY_LOCK Length (8b/10b): 252
+ * ML_PHY_LOCK Length (128b/132b): 396
+ * TPS4 Length = ML_PHY_LOCK * Rate Div
+ * Rate Div = 32 for 128b/132b and 10 for 8b/10b.
  */
-static int _lnl_compute_aux_less_wake_time(const struct intel_crtc_state *crtc_state)
+static int _lnl_compute_aux_less_wake_time(struct intel_dp *intel_dp,
+					   const struct intel_crtc_state *crtc_state)
 {
 	int tphy2_p2_to_p0 = get_tphy2_p2_to_p0(crtc_state);
-	int establishment_period = get_establishment_period(crtc_state);
+	int establishment_period = get_establishment_period(intel_dp, crtc_state);
 
 	return DIV_ROUND_UP(tphy2_p2_to_p0 + get_lfps_cycle_time(crtc_state) +
 			    establishment_period, 1000);
@@ -161,7 +194,7 @@ _lnl_compute_aux_less_alpm_params(struct intel_dp *intel_dp,
 		lfps_half_cycle;
 
 	aux_less_wake_time =
-		_lnl_compute_aux_less_wake_time(crtc_state);
+		_lnl_compute_aux_less_wake_time(intel_dp, crtc_state);
 	aux_less_wake_lines = intel_usecs_to_scanlines(&crtc_state->hw.adjusted_mode,
 						       aux_less_wake_time);
 	silence_period = get_silence_period_symbols(crtc_state);
@@ -430,8 +463,12 @@ static void lnl_alpm_configure(struct intel_dp *intel_dp,
 	if (intel_alpm_is_alpm_aux_less(intel_dp, crtc_state)) {
 		alpm_ctl = ALPM_CTL_ALPM_ENABLE |
 			ALPM_CTL_ALPM_AUX_LESS_ENABLE |
-			ALPM_CTL_AUX_LESS_SLEEP_HOLD_TIME_50_SYMBOLS |
-			ALPM_CTL_AUX_LESS_WAKE_TIME(crtc_state->alpm_state.aux_less_wake_lines);
+			ALPM_CTL_AUX_LESS_SLEEP_HOLD_TIME_50_SYMBOLS;
+
+		if (DISPLAY_VER(display) < 35)
+			alpm_ctl |= ALPM_CTL_AUX_LESS_WAKE_TIME(crtc_state->alpm_state.aux_less_wake_lines);
+		else
+			alpm_ctl |= ALPM_CTL_AUX_LESS_WAKE_TIME_XE3LPD(crtc_state->alpm_state.aux_less_wake_lines);
 
 		if (intel_dp->as_sdp_supported) {
 			u32 pr_alpm_ctl = get_pr_alpm_as_sdp_transmission_time(crtc_state);
diff --git a/drivers/gpu/drm/i915/display/intel_psr_regs.h b/drivers/gpu/drm/i915/display/intel_psr_regs.h
index 16a9e3af198d..8ec99bbd84b6 100644
--- a/drivers/gpu/drm/i915/display/intel_psr_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_psr_regs.h
@@ -299,7 +299,9 @@
 #define  ALPM_CTL_EXTENDED_FAST_WAKE_MIN_LINES		5
 #define  ALPM_CTL_EXTENDED_FAST_WAKE_TIME(lines)	REG_FIELD_PREP(ALPM_CTL_EXTENDED_FAST_WAKE_TIME_MASK, (lines) - ALPM_CTL_EXTENDED_FAST_WAKE_MIN_LINES)
 #define  ALPM_CTL_AUX_LESS_WAKE_TIME_MASK		REG_GENMASK(5, 0)
+#define  ALPM_CTL_AUX_LESS_WAKE_TIME_MASK_XE3LPD	REG_GENMASK(7, 0)
 #define  ALPM_CTL_AUX_LESS_WAKE_TIME(val)		REG_FIELD_PREP(ALPM_CTL_AUX_LESS_WAKE_TIME_MASK, val)
+#define  ALPM_CTL_AUX_LESS_WAKE_TIME_XE3LPD(val)	REG_FIELD_PREP(ALPM_CTL_AUX_LESS_WAKE_TIME_MASK_XE3LPD, val)
 
 #define _ALPM_CTL2_A	0x60954
 #define ALPM_CTL2(dev_priv, tran)	_MMIO_TRANS2(dev_priv, tran, _ALPM_CTL2_A)
-- 
2.29.0

