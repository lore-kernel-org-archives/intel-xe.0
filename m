Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0670E937E0
	for <intel-xe@archiver.kernel.org>; Sun, 12 Apr 2026 11:08:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B185510E2B3;
	Sun, 12 Apr 2026 11:08:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P31gdit0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AA5910E2B3;
 Sun, 12 Apr 2026 11:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775992096; x=1807528096;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8gGBEavNuq89wxf0+RzCWIFEnA11EO0y8WZblT89AF4=;
 b=P31gdit0QRrjyFLjfD+a0otloN+fw2gph6MwwnGWwuiUwO5CIlSlKtq2
 QZuD4aVISuFMq/Ha3l9qBAFFpyE62vXn/d1nol4UgiHRuPNexbVBb3251
 UJyT+FNf6aiKP3+i+xOl8XQwAjyYlgeCs7Gi/bRkI2WCwZq0319IEKHDO
 qHlbvOHDNo83MZS5dw/XE2VxMIIZtyavSsxSaJ7S8YnNKB9CfXw28wb7y
 v/grWQ43+vHNs2IGa6pKaKHP4ApNmjcqD6EsiOizn9gtPtWsRa8Nt0nlz
 q3P+R0nCgcOlLgrXeOR/Fg/uCkoS1O0DY9zO7buuvYLZM0XKd8IMrRygX w==;
X-CSE-ConnectionGUID: n+q/CiXeTBK22ChV+fL2Ng==
X-CSE-MsgGUID: 17tVs8l2RYyIlfv5KVhCEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="76115132"
X-IronPort-AV: E=Sophos;i="6.23,175,1770624000"; d="scan'208";a="76115132"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2026 04:08:15 -0700
X-CSE-ConnectionGUID: slLmFVMIQJugyqim6OHgcw==
X-CSE-MsgGUID: nU7kKN9aQZ6YVMz5JyrJbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,175,1770624000"; d="scan'208";a="267507748"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by orviesa001.jf.intel.com with ESMTP; 12 Apr 2026 04:08:13 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: uma.shankar@intel.com, dibin.moolakadan.subrahmanian@intel.com,
 jani.nikula@intel.com, Animesh Manna <animesh.manna@intel.com>
Subject: [PATCH v4 11/13] drm/i915/cmtg: Add CMTG interrupt handling
Date: Sun, 12 Apr 2026 16:07:10 +0530
Message-Id: <20260412103712.4021213-12-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20260412103712.4021213-1-animesh.manna@intel.com>
References: <20260412103712.4021213-1-animesh.manna@intel.com>
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

v2:
- Use consistent DC3co check as used in earlier patches. [Uma]
- Use else-if instead of separate if block. [Uma]
- Merge mask and unmask function as it is similar. [Uma]
- Modify DISPLAY_VER() check. [Uma]

Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cmtg.c     | 31 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_cmtg.h     |  2 ++
 drivers/gpu/drm/i915/display/intel_display.c  |  5 ++-
 .../gpu/drm/i915/display/intel_display_irq.c  | 12 +++++++
 .../gpu/drm/i915/display/intel_display_regs.h |  6 ++++
 5 files changed, 55 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cmtg.c b/drivers/gpu/drm/i915/display/intel_cmtg.c
index fc4595efec2d..e49123fac595 100644
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
@@ -398,3 +399,33 @@ void intel_cmtg_enable_ddi(const struct intel_crtc_state *crtc_state)
 	crtc->cmtg.enabled = true;
 	drm_dbg_kms(display->drm, "CMTG: %s enabled\n", transcoder_name(cpu_transcoder));
 }
+
+static void intel_cmtg_mask_interrupt(const struct intel_crtc_state *crtc_state, bool mask)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
+	u32 interrupt_mask = 0;
+
+	if (!intel_cmtg_is_supported(crtc_state))
+		return;
+
+	if (cpu_transcoder == TRANSCODER_A)
+		interrupt_mask = CMTG_VBLANK_A | CMTG_DELAYED_VBLANK_A | CMTG_VSYNC_A;
+	else if (cpu_transcoder == TRANSCODER_B)
+		interrupt_mask = CMTG_VBLANK_B | CMTG_DELAYED_VBLANK_B | CMTG_VSYNC_B;
+
+	if (mask)
+		bdw_update_port_irq(display, interrupt_mask, 0);
+	else
+		bdw_update_port_irq(display, interrupt_mask, interrupt_mask);
+}
+
+void intel_cmtg_enable_interrupt(const struct intel_crtc_state *crtc_state)
+{
+	intel_cmtg_mask_interrupt(crtc_state, false);
+}
+
+void intel_cmtg_disable_interrupt(const struct intel_crtc_state *crtc_state)
+{
+	intel_cmtg_mask_interrupt(crtc_state, true);
+}
diff --git a/drivers/gpu/drm/i915/display/intel_cmtg.h b/drivers/gpu/drm/i915/display/intel_cmtg.h
index 79785afccc51..8fcb44d6398f 100644
--- a/drivers/gpu/drm/i915/display/intel_cmtg.h
+++ b/drivers/gpu/drm/i915/display/intel_cmtg.h
@@ -21,5 +21,7 @@ void intel_cmtg_set_timings(const struct intel_crtc_state *crtc_state, bool lrr)
 void intel_cmtg_set_clk_select(const struct intel_crtc_state *crtc_state);
 void intel_cmtg_sanitize(struct intel_display *display);
 bool intel_cmtg_is_allowed(const struct intel_crtc_state *crtc_state);
+void intel_cmtg_enable_interrupt(const struct intel_crtc_state *crtc_state);
+void intel_cmtg_disable_interrupt(const struct intel_crtc_state *crtc_state);
 
 #endif /* __INTEL_CMTG_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 30bc209d8fb6..3d683d290fa6 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -1065,6 +1065,7 @@ static void intel_post_plane_update(struct intel_atomic_state *state,
 	if (!crtc->cmtg.enabled && intel_vrr_is_fixed_rr(new_crtc_state)) {
 		intel_cmtg_enable_sync(new_crtc_state);
 		intel_cmtg_enable_ddi(new_crtc_state);
+		intel_cmtg_enable_interrupt(new_crtc_state);
 	}
 }
 
@@ -6873,8 +6874,10 @@ static void intel_update_crtc(struct intel_atomic_state *state,
 	    old_crtc_state->inherited)
 		intel_crtc_arm_fifo_underrun(crtc, new_crtc_state);
 
-	if (crtc->cmtg.enabled && intel_crtc_vrr_enabling(state, crtc))
+	if (crtc->cmtg.enabled && intel_crtc_vrr_enabling(state, crtc)) {
 		intel_cmtg_disable(new_crtc_state);
+		intel_cmtg_disable_interrupt(new_crtc_state);
+	}
 }
 
 static void intel_old_crtc_state_disables(struct intel_atomic_state *state,
diff --git a/drivers/gpu/drm/i915/display/intel_display_irq.c b/drivers/gpu/drm/i915/display/intel_display_irq.c
index 70c1bba7c0a8..6754c131b007 100644
--- a/drivers/gpu/drm/i915/display/intel_display_irq.c
+++ b/drivers/gpu/drm/i915/display/intel_display_irq.c
@@ -1467,6 +1467,18 @@ void gen8_de_irq_handler(struct intel_display *display, u32 master_ctl)
 				found = true;
 			}
 
+			if (DISPLAY_VER(display) == 35) {
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
index dada8dc27ea4..0a641daf22c6 100644
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

