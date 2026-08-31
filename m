Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14B0DC624C6
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 21:14:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A93AD10EB5C;
	Mon, 31 Aug 2026 21:14:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fQHsqXFG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E4CB10EB4F;
 Mon, 31 Aug 2026 21:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788210870; x=1819746870;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iKSU8fGuLgDFnYAeRqJ+G5dKr4+BZvHc4rv2PvDIhVs=;
 b=fQHsqXFGadAWtbVRhjB6oWSR2LRT9Hjo4UFdpYnLoxXubOA6Xu+NRdEy
 21RiuyXIT6CBTrvLZ67Zd8b9aYJ8RKPvX7edBARiRoGamWhhefM2lE+cw
 t5MJEsVZ1YVb+HbRMznm91SzlMkBzBVUAHRn+8x1JM6GQ44uCaf69Bora
 ZqOa/M2MLPxvnxp2LAnnp2Ukbr8CDciDQ24xwt2/BFiVyfc07pkrlnC+F
 TmoVJxDrjsOsSrU0WKWESlwhHPuxeCI7P4bkr8F7L9ywripgg4xh4IcPx
 QLrBN8Q7owoc2H6bbNym8WKl2xMCx0SgQ+NxzEY5ATllq88hMTP+bLFiY g==;
X-CSE-ConnectionGUID: PuMrgJXZTZOPxONjAzjNeg==
X-CSE-MsgGUID: xsl5VFK0S1CtA7h01WTydw==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="87762502"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; d="scan'208";a="87762502"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 14:14:30 -0700
X-CSE-ConnectionGUID: lLSFvR39QWWstartDzuN+A==
X-CSE-MsgGUID: drJc48PKSVywo6TtUquymg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; d="scan'208";a="264612797"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa006.fm.intel.com with ESMTP; 31 Aug 2026 14:14:28 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: dibin.moolakadan.subrahmanian@intel.com,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v4 1/4] drm/i915/display: Enable periodic AS SDP skip frames
Date: Tue,  1 Sep 2026 03:04:18 +0530
Message-ID: <20260831213421.1804635-2-uma.shankar@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260831213421.1804635-1-uma.shankar@intel.com>
References: <20260831213421.1804635-1-uma.shankar@intel.com>
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

When Panel Replay is active the transcoder timing generator runs at the
panel's maximum refresh rate. To drive the panel down to its minimum
refresh rate the Adaptive-Sync SDP (AS SDP) only needs to reach the panel
once per minimum-rate frame, so transmitting it on every (maximum-rate)
frame is redundant and shows up as repeated SDPs on the link.

Xe3p_LPD adds a HW skip-frame counter in PR_ALPM_CTL that lets the source
send a single AS SDP and then suppress it for a programmed number of
frames. Program this counter so that one AS SDP is followed by
(max_vrefresh / min_vrefresh - 1) idle frames, i.e. one AS SDP per
slowest panel frame, allowing the link to be driven down to as low as
1Hz when the hardware supports it.

The maximum and minimum refresh rates come from the panel's adaptive-sync
monitor range, so the skip count is a function of the sink's capabilities
and independent of the current content/flip rate. If the panel does not
advertise a usable range the skip counter is left at zero, i.e. the
feature is a no-op and AS SDP continues to be sent on every frame.

Periodic AS SDP drives the panel down to its minimum refresh rate on its
own, so it is only programmed when VRR is not actively driving the
refresh rate.

The skip-frame mechanism relies on the AS SDP still being transmitted
(just less often) while Panel Replay is active, so when a non-zero
skip-frame count is programmed both
PR_ALPM_CTL_AS_SDP_TRANSMISSION_IN_ACTIVE_DISABLE and
PR_ALPM_CTL_USE_DC3CO_IDLE_PROTOCOL are left cleared. The previous
behaviour (honouring disable_as_sdp_when_pr_active and the DC3CO idle
protocol) is retained for the non skip-frame case.

v3: Fixed Sashiko review findings

v2: Decoupled CMMRR dependency and using sink refresh rate range for
skip frame claculations. This addresses Dibin's review feedback as well.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_alpm.c     | 61 +++++++++++++++++--
 drivers/gpu/drm/i915/display/intel_psr_regs.h |  2 +
 2 files changed, 58 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
index f1383764b702..a6838e0fd3aa 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.c
+++ b/drivers/gpu/drm/i915/display/intel_alpm.c
@@ -375,6 +375,35 @@ static u32 get_pr_alpm_as_sdp_transmission_time(const struct intel_crtc_state *c
 	}
 }
 
+/*
+ * Periodic Adaptive-Sync SDP skip frames.
+ *
+ * While Panel Replay is active the transcoder timing generator runs at the
+ * panel's maximum refresh rate. To drive the panel down to its minimum
+ * refresh rate the Adaptive-Sync SDP only needs to reach the panel once per
+ * minimum-rate frame, so transmitting it on every (maximum-rate) frame is
+ * unnecessary and shows up as repeated SDPs on the link. Program the HW skip
+ * counter so that a single AS SDP is followed by
+ * (max_vrefresh / min_vrefresh - 1) idle frames, i.e. one AS SDP per slowest
+ * panel frame.
+ *
+ * The maximum and minimum refresh rates come from the panel's adaptive-sync
+ * monitor range, so this is independent of the current content/flip rate.
+ */
+static u32 intel_pr_as_sdp_skip_frames(struct intel_dp *intel_dp)
+{
+	const struct drm_display_info *info =
+		&intel_dp->attached_connector->base.display_info;
+	int max_vrefresh = info->monitor_range.max_vfreq;
+	int min_vrefresh = info->monitor_range.min_vfreq;
+
+	if (min_vrefresh <= 0 || max_vrefresh <= min_vrefresh)
+		return 0;
+
+	return min_t(u32, max_vrefresh / min_vrefresh - 1,
+		     REG_FIELD_MAX(PR_ALPM_CTL_AS_SDP_SKIP_FRAMES_MASK));
+}
+
 static void lnl_alpm_configure(struct intel_dp *intel_dp,
 			       const struct intel_crtc_state *crtc_state)
 {
@@ -399,16 +428,38 @@ static void lnl_alpm_configure(struct intel_dp *intel_dp,
 
 		if (intel_dp->as_sdp_supported) {
 			u32 pr_alpm_ctl = get_pr_alpm_as_sdp_transmission_time(crtc_state);
+			u32 skip_frames = 0;
+
+			/*
+			 * AS SDP skip frames field only exists on Xe3p_LPD+, and
+			 * periodic AS SDP is a Panel Replay feature that is only
+			 * used when VRR is not actively driving the refresh rate.
+			 */
+			if (DISPLAY_VER(display) >= 35 && crtc_state->has_panel_replay &&
+			    !crtc_state->vrr.enable)
+				skip_frames = intel_pr_as_sdp_skip_frames(intel_dp);
 
 			if (crtc_state->link_off_after_as_sdp_when_pr_active)
 				pr_alpm_ctl |= PR_ALPM_CTL_ALLOW_LINK_OFF_BETWEEN_AS_SDP_AND_SU;
-			if (crtc_state->disable_as_sdp_when_pr_active)
-				pr_alpm_ctl |= PR_ALPM_CTL_AS_SDP_TRANSMISSION_IN_ACTIVE_DISABLE;
 
-			if (intel_display_power_dc3co_allowed(display))
-				pr_alpm_ctl |= PR_ALPM_CTL_USE_DC3CO_IDLE_PROTOCOL;
-			else
+			/*
+			 * Skip frames needs the AS SDP to keep flowing during PR
+			 * active, so it is mutually exclusive with disabling AS SDP
+			 * transmission in active and with the DC3CO idle protocol.
+			 */
+			if (skip_frames) {
+				pr_alpm_ctl |= PR_ALPM_CTL_AS_SDP_SKIP_FRAMES(skip_frames);
+				pr_alpm_ctl &= ~PR_ALPM_CTL_AS_SDP_TRANSMISSION_IN_ACTIVE_DISABLE;
 				pr_alpm_ctl &= ~PR_ALPM_CTL_USE_DC3CO_IDLE_PROTOCOL;
+			} else {
+				pr_alpm_ctl &= ~PR_ALPM_CTL_AS_SDP_SKIP_FRAMES_MASK;
+
+				if (crtc_state->disable_as_sdp_when_pr_active)
+					pr_alpm_ctl |= PR_ALPM_CTL_AS_SDP_TRANSMISSION_IN_ACTIVE_DISABLE;
+
+				if (intel_display_power_dc3co_allowed(display))
+					pr_alpm_ctl |= PR_ALPM_CTL_USE_DC3CO_IDLE_PROTOCOL;
+			}
 
 			intel_de_write(display, PR_ALPM_CTL(display, cpu_transcoder),
 				       pr_alpm_ctl);
diff --git a/drivers/gpu/drm/i915/display/intel_psr_regs.h b/drivers/gpu/drm/i915/display/intel_psr_regs.h
index 16a9e3af198d..bb577e7e3bbd 100644
--- a/drivers/gpu/drm/i915/display/intel_psr_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_psr_regs.h
@@ -276,6 +276,8 @@
 #define  PR_ALPM_CTL_ADAPTIVE_SYNC_SDP_POSITION_T1_OR_T2	REG_FIELD_PREP(PR_ALPM_CTL_ADAPTIVE_SYNC_SDP_POSITION_MASK, 0)
 #define  PR_ALPM_CTL_ADAPTIVE_SYNC_SDP_POSITION_T1		REG_FIELD_PREP(PR_ALPM_CTL_ADAPTIVE_SYNC_SDP_POSITION_MASK, 1)
 #define  PR_ALPM_CTL_ADAPTIVE_SYNC_SDP_POSITION_T2		REG_FIELD_PREP(PR_ALPM_CTL_ADAPTIVE_SYNC_SDP_POSITION_MASK, 2)
+#define  PR_ALPM_CTL_AS_SDP_SKIP_FRAMES_MASK			REG_GENMASK(27, 16)
+#define  PR_ALPM_CTL_AS_SDP_SKIP_FRAMES(frames)			REG_FIELD_PREP(PR_ALPM_CTL_AS_SDP_SKIP_FRAMES_MASK, (frames))
 
 #define _ALPM_CTL_A	0x60950
 #define ALPM_CTL(dev_priv, tran)	_MMIO_TRANS2(dev_priv, tran, _ALPM_CTL_A)
-- 
2.50.1

