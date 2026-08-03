Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9794C55822
	for <intel-xe@archiver.kernel.org>; Mon,  3 Aug 2026 18:33:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8003C10E76F;
	Mon,  3 Aug 2026 18:33:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K6R0WT1t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2485410E762;
 Mon,  3 Aug 2026 18:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785782024; x=1817318024;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9WxQhdHNwRF/lfpo7YJuHkVFRACkfGxtLIgDr+hvc2o=;
 b=K6R0WT1tjEjZU2Y91TPmw19Vbf3gtfzB+knHvCQdyYj7qnJ2dzmT2Kk6
 eBXCRrPXEhMQV1PltUWOqBn7iFoEQ+fy5wF804M/dEmKoKmjltBBpuCs/
 sFYZQdzK0JLPpP2dTYoeGLn6Cu8AS0XOyOfKtPMlRnATt10i8D5ayMO13
 rNtlRNRD8PTpswX0ra6lDfmnwPWR/gzWJGu5/pDh+NvdtlQRoL3syLnKS
 9VToLqeLALzOZxlucpRZaGj2JAAPvHYxs0bmshfCQFi4PoeZIvJj21eKv
 XAPqBHB3cnxERfq1e+RG7I51Dj/atdA2CYHcazwnqGPZzqUACMoYleZfl w==;
X-CSE-ConnectionGUID: Yn6My7mPQPqL2mGuIfHcHA==
X-CSE-MsgGUID: i7AfEGwDT4iw2bnQQDZsJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="90214483"
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; d="scan'208";a="90214483"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 11:33:44 -0700
X-CSE-ConnectionGUID: a/QIq5/jTHyxQQ1tF4svMQ==
X-CSE-MsgGUID: GO//5tchQJ2EMJCdRdaiRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; d="scan'208";a="291228601"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orviesa002.jf.intel.com with ESMTP; 03 Aug 2026 11:33:43 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: animesh.manna@intel.com, dibin.moolakadan.subrahmanian@intel.com,
 Uma Shankar <uma.shankar@intel.com>
Subject: [PATCH 1/2] drm/i915/display: Enable AS SDP Skip Frames
Date: Tue,  4 Aug 2026 00:23:04 +0530
Message-ID: <20260803185305.562609-2-uma.shankar@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260803185305.562609-1-uma.shankar@intel.com>
References: <20260803185305.562609-1-uma.shankar@intel.com>
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
panel's maximum refresh rate, but content is often presented at a lower
rate. In that case the Adaptive-Sync SDP (AS SDP) only needs to reach the
panel often enough to satisfy its maximum frame time, so transmitting it
on every frame is redundant and shows up as repeated SDPs on the link.

Xe3LPD adds a HW skip-frame counter in PR_ALPM_CTL that lets the source
send a single AS SDP and then suppress it for a programmed number of
frames. Program this counter so that one AS SDP is followed by
(max_vrefresh / flip_rate - 1) idle frames, matching the effective
content rate and allowing the link to be driven down to as low as 1Hz
when the hardware supports it.

The maximum refresh rate is taken from the current mode's vertical
refresh (adjusted_mode), while the actual flip/content rate is derived
from the CMRR target (force_cmrr numerator in milli-Hz over the 1000 or
1001 denominator). If no CMRR target is programmed the skip counter is
left at zero, i.e. the feature is a no-op and AS SDP continues to be sent
on every frame.

ToDo: Currently using CMRR debugfs as an interface to get the flip rate
from userspace, this will be extended to a property interface to receive
actual content fps as follow up.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_alpm.c     | 45 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_psr_regs.h |  2 +
 2 files changed, 47 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
index f1383764b702..0f98f02a1848 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.c
+++ b/drivers/gpu/drm/i915/display/intel_alpm.c
@@ -375,6 +375,46 @@ static u32 get_pr_alpm_as_sdp_transmission_time(const struct intel_crtc_state *c
 	}
 }
 
+/*
+ * Periodic Adaptive-Sync SDP skip frames.
+ *
+ * While Panel Replay is active the transcoder timing generator runs at the
+ * panel's maximum refresh rate, but content may be presented at a lower rate.
+ * The Adaptive-Sync SDP only needs to reach the panel often enough to satisfy
+ * its maximum frame time, so transmitting it on every frame is unnecessary and
+ * shows up as repeated SDPs on the link. Program the HW skip counter so that a
+ * single AS SDP is followed by (max_vrefresh / flip_vrefresh - 1) idle frames,
+ * matching the effective content rate.
+ *
+ * ToDo: Actual flip rate is currently passed on by userspace through debugfs
+ * create for CMRRR, but will be extended later as a property interface.
+ */
+static u32 intel_pr_as_sdp_skip_frames(const struct intel_crtc_state *crtc_state)
+{
+	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
+	int max_vrefresh = drm_mode_vrefresh(&crtc_state->hw.adjusted_mode);
+	int flip_vrefresh;
+	u32 skip_frames;
+
+	/*
+	 * Actual (flip) refresh rate comes from the CMRR target: numerator is
+	 * in milli-Hz, denominator is 1000 (1:1) or 1001 (1000/1001 timing).
+	 */
+	if (!crtc->force_cmrr.numerator || !crtc->force_cmrr.denominator)
+		return 0;
+
+	flip_vrefresh = DIV_ROUND_CLOSEST(crtc->force_cmrr.numerator,
+					  crtc->force_cmrr.denominator);
+
+	if (max_vrefresh <= 0 || flip_vrefresh <= 0 || max_vrefresh <= flip_vrefresh)
+		return 0;
+
+	skip_frames = max_vrefresh / flip_vrefresh - 1;
+
+	return min_t(u32, skip_frames,
+		     REG_FIELD_MAX(PR_ALPM_CTL_AS_SDP_SKIP_FRAMES_MASK));
+}
+
 static void lnl_alpm_configure(struct intel_dp *intel_dp,
 			       const struct intel_crtc_state *crtc_state)
 {
@@ -410,6 +450,11 @@ static void lnl_alpm_configure(struct intel_dp *intel_dp,
 			else
 				pr_alpm_ctl &= ~PR_ALPM_CTL_USE_DC3CO_IDLE_PROTOCOL;
 
+			/* AS SDP skip frames field only exists on Xe3LPD+ */
+			if (DISPLAY_VER(display) >= 35)
+				pr_alpm_ctl |= PR_ALPM_CTL_AS_SDP_SKIP_FRAMES(
+					intel_pr_as_sdp_skip_frames(crtc_state));
+
 			intel_de_write(display, PR_ALPM_CTL(display, cpu_transcoder),
 				       pr_alpm_ctl);
 		}
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

