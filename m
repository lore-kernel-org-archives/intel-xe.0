Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 620A4107BCC8
	for <intel-xe@archiver.kernel.org>; Fri, 13 Mar 2026 16:03:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2603010EB9A;
	Fri, 13 Mar 2026 16:03:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OvJRm0aE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC4D410E45E;
 Fri, 13 Mar 2026 16:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773417803; x=1804953803;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OjLM/H7EJ3ZRLV8h0mGzSngrG9RwrzmvlAUsxOSQpAQ=;
 b=OvJRm0aE5k2f1UTzHP3bjNp9COtNeoK1vF/TkyPrqdUgt4a5QT1QO63k
 9jVLgKGvNzyKjg4vAtCHGGkWXEJ+86oDSV+5G3WcnshdUaICAvFiUGkO4
 jESNXw/U3wWcuvoHph9v3g8XhOrbffzc08NUUwU5Na7p7rBPEmQrZMO6e
 rxb95tzaYXizhNhhmJtvynXf3jC7lypdLuF+FcN6Y9dSc3qL15uxZkujO
 cW6FTLL4BoY8EfeRfqwqV3xXI+37tulxJ78sNSdfIaz1VSA64puFLyj3w
 6MV89bw8m0fpAq8KMS7HbDKv9rFd3aL3hqDQcPtgUYDBTVYSJdVs5nihy g==;
X-CSE-ConnectionGUID: GsITScXGTxOaYO+uFK9H9w==
X-CSE-MsgGUID: ggDrV7e+RmmWsULIs8q1fQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11728"; a="74715437"
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; d="scan'208";a="74715437"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2026 09:03:23 -0700
X-CSE-ConnectionGUID: 5PeirMVxQE2ltTGcuwlNbQ==
X-CSE-MsgGUID: LXroVNXHTGiekXaQQxoWgA==
X-ExtLoop1: 1
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by fmviesa003.fm.intel.com with ESMTP; 13 Mar 2026 09:03:20 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, uma.shankar@intel.com,
 dibin.moolakadan.subrahmanian@intel.com,
 Animesh Manna <animesh.manna@intel.com>
Subject: [PATCH v3 10/12] drm/i915/cmtg: Add CMTG interrupt handling
Date: Fri, 13 Mar 2026 21:02:58 +0530
Message-Id: <20260313153300.3530695-11-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20260313153300.3530695-1-animesh.manna@intel.com>
References: <20260313153300.3530695-1-animesh.manna@intel.com>
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

Add support fot vsync, vblank, and delayed vlank interrupts of
CMTG which are part of DE port interrupt.

Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cmtg.c     | 37 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_cmtg.h     |  2 +
 drivers/gpu/drm/i915/display/intel_display.c  |  5 ++-
 .../gpu/drm/i915/display/intel_display_irq.c  | 12 ++++++
 .../gpu/drm/i915/display/intel_display_regs.h |  6 +++
 5 files changed, 61 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cmtg.c b/drivers/gpu/drm/i915/display/intel_cmtg.c
index fff299e1acfb..35d39f2fb86b 100644
--- a/drivers/gpu/drm/i915/display/intel_cmtg.c
+++ b/drivers/gpu/drm/i915/display/intel_cmtg.c
@@ -13,6 +13,7 @@
 #include "intel_crtc.h"
 #include "intel_de.h"
 #include "intel_display_device.h"
+#include "intel_display_irq.h"
 #include "intel_display_power.h"
 #include "intel_display_regs.h"
 #include "intel_display_types.h"
@@ -380,3 +381,39 @@ void intel_cmtg_enable_ddi(const struct intel_crtc_state *crtc_state)
 	crtc->cmtg.enabled = true;
 	drm_dbg_kms(display->drm, "CMTG: %s enabled\n", transcoder_name(cpu_transcoder));
 }
+
+void intel_cmtg_mask_interrupt(const struct intel_crtc_state *crtc_state)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
+	u32 interrupt_mask = 0;
+
+	if (!HAS_DC3CO(display))
+		return;
+
+	if (cpu_transcoder == TRANSCODER_A)
+		interrupt_mask = CMTG_VBLANK_A | CMTG_DELAYED_VBLANK_A | CMTG_VSYNC_A;
+
+	if (cpu_transcoder == TRANSCODER_B)
+		interrupt_mask = CMTG_VBLANK_B | CMTG_DELAYED_VBLANK_B | CMTG_VSYNC_B;
+
+	bdw_update_port_irq(display, interrupt_mask, 0);
+}
+
+void intel_cmtg_unmask_interrupt(const struct intel_crtc_state *crtc_state)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
+	u32 enabled_irq_mask = 0;
+
+	if (!HAS_DC3CO(display))
+		return;
+
+	if (cpu_transcoder == TRANSCODER_A)
+		enabled_irq_mask = CMTG_VBLANK_A | CMTG_DELAYED_VBLANK_A | CMTG_VSYNC_A;
+
+	if (cpu_transcoder == TRANSCODER_B)
+		enabled_irq_mask = CMTG_VBLANK_B | CMTG_DELAYED_VBLANK_B | CMTG_VSYNC_B;
+
+	bdw_update_port_irq(display, 0, enabled_irq_mask);
+}
diff --git a/drivers/gpu/drm/i915/display/intel_cmtg.h b/drivers/gpu/drm/i915/display/intel_cmtg.h
index 79785afccc51..0a6fad9635ab 100644
--- a/drivers/gpu/drm/i915/display/intel_cmtg.h
+++ b/drivers/gpu/drm/i915/display/intel_cmtg.h
@@ -21,5 +21,7 @@ void intel_cmtg_set_timings(const struct intel_crtc_state *crtc_state, bool lrr)
 void intel_cmtg_set_clk_select(const struct intel_crtc_state *crtc_state);
 void intel_cmtg_sanitize(struct intel_display *display);
 bool intel_cmtg_is_allowed(const struct intel_crtc_state *crtc_state);
+void intel_cmtg_mask_interrupt(const struct intel_crtc_state *crtc_state);
+void intel_cmtg_unmask_interrupt(const struct intel_crtc_state *crtc_state);
 
 #endif /* __INTEL_CMTG_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index baf4d640bfbf..6febf569889f 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -1084,6 +1084,7 @@ static void intel_post_plane_update(struct intel_atomic_state *state,
 	if (!crtc->cmtg.enabled && intel_vrr_is_fixed_rr(new_crtc_state)) {
 		intel_cmtg_enable_sync(new_crtc_state);
 		intel_cmtg_enable_ddi(new_crtc_state);
+		intel_cmtg_unmask_interrupt(new_crtc_state);
 	}
 }
 
@@ -6925,8 +6926,10 @@ static void intel_update_crtc(struct intel_atomic_state *state,
 	    old_crtc_state->inherited)
 		intel_crtc_arm_fifo_underrun(crtc, new_crtc_state);
 
-	if (crtc->cmtg.enabled && intel_crtc_vrr_enabling(state, crtc))
+	if (crtc->cmtg.enabled && intel_crtc_vrr_enabling(state, crtc)) {
 		intel_cmtg_disable(new_crtc_state);
+		intel_cmtg_mask_interrupt(new_crtc_state);
+	}
 }
 
 static void intel_old_crtc_state_disables(struct intel_atomic_state *state,
diff --git a/drivers/gpu/drm/i915/display/intel_display_irq.c b/drivers/gpu/drm/i915/display/intel_display_irq.c
index 70c1bba7c0a8..95e6523b32d9 100644
--- a/drivers/gpu/drm/i915/display/intel_display_irq.c
+++ b/drivers/gpu/drm/i915/display/intel_display_irq.c
@@ -1467,6 +1467,18 @@ void gen8_de_irq_handler(struct intel_display *display, u32 master_ctl)
 				found = true;
 			}
 
+			if (DISPLAY_VER(display) > 30) {
+				if (iir & (CMTG_VBLANK_A | CMTG_VSYNC_A | CMTG_DELAYED_VBLANK_A)) {
+					intel_handle_vblank(display, PIPE_A);
+					found = true;
+				}
+
+				if (iir & (CMTG_VBLANK_B | CMTG_VSYNC_B | CMTG_DELAYED_VBLANK_B)) {
+					intel_handle_vblank(display, PIPE_B);
+					found = true;
+				}
+			}
+
 			if (DISPLAY_VER(display) >= 11) {
 				u32 te_trigger = iir & (DSI0_TE | DSI1_TE);
 
diff --git a/drivers/gpu/drm/i915/display/intel_display_regs.h b/drivers/gpu/drm/i915/display/intel_display_regs.h
index 4746e9ebd920..5838338f495a 100644
--- a/drivers/gpu/drm/i915/display/intel_display_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_display_regs.h
@@ -1427,6 +1427,12 @@
 #define  GEN9_AUX_CHANNEL_B		(1 << 25)
 #define  DSI1_TE			(1 << 24)
 #define  DSI0_TE			(1 << 23)
+#define  CMTG_VSYNC_B			(1 << 19)
+#define  CMTG_DELAYED_VBLANK_B		(1 << 18)
+#define  CMTG_VBLANK_B			(1 << 17)
+#define  CMTG_VSYNC_A			(1 << 16)
+#define  CMTG_DELAYED_VBLANK_A		(1 << 15)
+#define  CMTG_VBLANK_A			(1 << 14)
 #define  GEN8_DE_PORT_HOTPLUG(hpd_pin)	REG_BIT(3 + _HPD_PIN_DDI(hpd_pin))
 #define  BXT_DE_PORT_HOTPLUG_MASK	(GEN8_DE_PORT_HOTPLUG(HPD_PORT_A) | \
 					 GEN8_DE_PORT_HOTPLUG(HPD_PORT_B) | \
-- 
2.29.0

