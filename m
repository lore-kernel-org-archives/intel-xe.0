Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CCC0606A328
	for <intel-xe@archiver.kernel.org>; Wed,  4 Nov 2026 13:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BJML9Rhd
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D8DD10FBF6;
	Wed,  4 Nov 2026 13:09:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BE2E10E130;
 Wed,  4 Nov 2026 13:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793797737; x=1825333737;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9xnGV4aPvOBPmwp7C1RxJUjMgP8YMSFL99mkc9PTIUk=;
 b=BJML9RhdKwejq3kiHcMnrHlERkptMHxolTDwCMHm1GnY168CC3jj2usI
 OOgm5TKLrgqfMjXtZfo8z7oz+RIi60E+p1IF4rbZseye4y0LyTf5k1fc1
 cajW/7TR/+hV7pF0P38AIN9jlXn9IuzHOdBCI4c1o//czYZzNiUU8PD90
 V68ZIQf3gmMKdjdFReoY6m9KLefN8xKNWKqyy5B4/7Anx1heVPfUTJKpH
 Jcq5N+w8ueu24+CFVGBhXWI/Nd8HEXjBtdgIDDHEWc0n90NQpzicnkI1S
 QHJVENTn947vpmSnUinMKidKE6ZSevDeRnSsnBBNdla/OS9lcKhZttrSi g==;
X-CSE-ConnectionGUID: Vp1IZ2KIQ5S3yS6eN0XeAg==
X-CSE-MsgGUID: MbcHu2g/TJqmljdkRj/7ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2449880"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2449880"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 05:08:39 -0800
X-CSE-ConnectionGUID: YimQNA7sRiGHawK2QBNFFw==
X-CSE-MsgGUID: pXF04wA4Q+mdfZbxXMi7Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="7105655"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.244.36])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 05:08:37 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH] TEST ONLY: drm/intel: add mmio to display parent interface
Date: Wed,  4 Nov 2026 15:08:31 +0200
Message-ID: <20261104130831.152563-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Just testing, no need to review. We probably don't want this.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/i9xx_wm.c       |  5 +-
 drivers/gpu/drm/i915/display/intel_de.c      |  6 +-
 drivers/gpu/drm/i915/display/intel_de.h      | 23 ++----
 drivers/gpu/drm/i915/display/intel_display.c |  3 +-
 drivers/gpu/drm/i915/display/intel_vblank.c  |  6 +-
 drivers/gpu/drm/i915/i915_driver.c           |  1 +
 drivers/gpu/drm/i915/intel_uncore.c          | 80 ++++++++++++++++++++
 drivers/gpu/drm/i915/intel_uncore.h          |  2 +
 drivers/gpu/drm/xe/display/xe_display.c      | 78 +++++++++++++++++++
 include/drm/intel/display_parent_interface.h | 17 +++++
 10 files changed, 192 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/i9xx_wm.c b/drivers/gpu/drm/i915/display/i9xx_wm.c
index 0233f5053d95..785f1a7e38a1 100644
--- a/drivers/gpu/drm/i915/display/i9xx_wm.c
+++ b/drivers/gpu/drm/i915/display/i9xx_wm.c
@@ -1863,7 +1863,6 @@ static void vlv_atomic_update_fifo(struct intel_atomic_state *state,
 				   struct intel_crtc *crtc)
 {
 	struct intel_display *display = to_intel_display(crtc);
-	struct intel_uncore *uncore = to_intel_uncore(display->drm);
 	const struct intel_crtc_state *crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 	const struct vlv_fifo_state *fifo_state =
@@ -1892,7 +1891,7 @@ static void vlv_atomic_update_fifo(struct intel_atomic_state *state,
 	 * intel_pipe_update_start() has already disabled interrupts
 	 * for us, so a plain spin_lock() is sufficient here.
 	 */
-	spin_lock(&uncore->lock);
+	display->parent->mmio->lock(display->drm);
 
 	switch (crtc->pipe) {
 	case PIPE_A:
@@ -1952,7 +1951,7 @@ static void vlv_atomic_update_fifo(struct intel_atomic_state *state,
 
 	intel_de_read_fw(display, DSPARB(display));
 
-	spin_unlock(&uncore->lock);
+	display->parent->mmio->unlock(display->drm);
 }
 
 #undef VLV_FIFO
diff --git a/drivers/gpu/drm/i915/display/intel_de.c b/drivers/gpu/drm/i915/display/intel_de.c
index a7417905192d..3f042bbcc80f 100644
--- a/drivers/gpu/drm/i915/display/intel_de.c
+++ b/drivers/gpu/drm/i915/display/intel_de.c
@@ -145,14 +145,14 @@ u8 intel_de_read8(struct intel_display *display, intel_reg_t reg)
 	/* this is only used on VGA registers (possible on pre-g4x) */
 	drm_WARN_ON(display->drm, DISPLAY_VER(display) >= 5 || display->platform.g4x);
 
-	return intel_uncore_read8(__to_uncore(display), reg);
+	return display->parent->mmio->read8(display->drm, intel_reg_offset(reg));
 }
 
 void intel_de_write8(struct intel_display *display, intel_reg_t reg, u8 val)
 {
 	drm_WARN_ON(display->drm, DISPLAY_VER(display) >= 5 || display->platform.g4x);
 
-	intel_uncore_write8(__to_uncore(display), reg, val);
+	display->parent->mmio->write8(display->drm, intel_reg_offset(reg), val);
 }
 
 u16 intel_de_read16(struct intel_display *display, intel_reg_t reg)
@@ -160,5 +160,5 @@ u16 intel_de_read16(struct intel_display *display, intel_reg_t reg)
 	/* this is only used on MCHBAR registers on pre-SNB */
 	drm_WARN_ON(display->drm, DISPLAY_VER(display) >= 6);
 
-	return intel_uncore_read16(__to_uncore(display), reg);
+	return display->parent->mmio->read16(display->drm, intel_reg_offset(reg));
 }
diff --git a/drivers/gpu/drm/i915/display/intel_de.h b/drivers/gpu/drm/i915/display/intel_de.h
index d0a239a36980..1fddb85d5640 100644
--- a/drivers/gpu/drm/i915/display/intel_de.h
+++ b/drivers/gpu/drm/i915/display/intel_de.h
@@ -6,16 +6,11 @@
 #ifndef __INTEL_DE_H__
 #define __INTEL_DE_H__
 
+#include <drm/intel/display_parent_interface.h>
+
 #include "intel_display_core.h"
 #include "intel_dmc_wl.h"
 #include "intel_dsb.h"
-#include "intel_uncore.h"
-#include "intel_uncore_trace.h"
-
-static inline struct intel_uncore *__to_uncore(struct intel_display *display)
-{
-	return to_intel_uncore(display->drm);
-}
 
 u8 intel_de_read8(struct intel_display *display, intel_reg_t reg);
 void intel_de_write8(struct intel_display *display, intel_reg_t reg, u8 val);
@@ -28,7 +23,7 @@ intel_de_read(struct intel_display *display, intel_reg_t reg)
 
 	intel_dmc_wl_get(display, reg);
 
-	val = intel_uncore_read(__to_uncore(display), reg);
+	val = display->parent->mmio->read32(display->drm, intel_reg_offset(reg));
 
 	intel_dmc_wl_put(display, reg);
 
@@ -58,7 +53,7 @@ intel_de_write(struct intel_display *display, intel_reg_t reg, u32 val)
 {
 	intel_dmc_wl_get(display, reg);
 
-	intel_uncore_write(__to_uncore(display), reg, val);
+	display->parent->mmio->write32(display->drm, intel_reg_offset(reg), val);
 
 	intel_dmc_wl_put(display, reg);
 }
@@ -107,19 +102,13 @@ int intel_de_wait_for_clear_ms(struct intel_display *display, intel_reg_t reg,
 static inline u32
 intel_de_read_fw(struct intel_display *display, intel_reg_t reg)
 {
-	u32 val;
-
-	val = intel_uncore_read_fw(__to_uncore(display), reg);
-	trace_i915_reg_rw(false, reg, val, sizeof(val), true);
-
-	return val;
+	return display->parent->mmio->read32_fw(display->drm, intel_reg_offset(reg));
 }
 
 static inline void
 intel_de_write_fw(struct intel_display *display, intel_reg_t reg, u32 val)
 {
-	trace_i915_reg_rw(true, reg, val, sizeof(val), true);
-	intel_uncore_write_fw(__to_uncore(display), reg, val);
+	display->parent->mmio->write32_fw(display->drm, intel_reg_offset(reg), val);
 }
 
 static inline u32
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index c1c2b99cfb53..99864877b74d 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -7731,7 +7731,6 @@ static void intel_atomic_dsb_finish(struct intel_atomic_state *state,
 static void intel_atomic_commit_tail(struct intel_atomic_state *state)
 {
 	struct intel_display *display = to_intel_display(state);
-	struct intel_uncore *uncore = to_intel_uncore(display->drm);
 	struct intel_crtc_state *new_crtc_state, *old_crtc_state;
 	struct intel_crtc *crtc;
 	struct intel_power_domain_mask put_domains[I915_MAX_PIPES] = {};
@@ -7945,7 +7944,7 @@ static void intel_atomic_commit_tail(struct intel_atomic_state *state)
 		 * so enable debugging for the next modeset - and hope we catch
 		 * the culprit.
 		 */
-		intel_uncore_arm_unclaimed_mmio_detection(uncore);
+		display->parent->mmio->arm_unclaimed_mmio_detection(display->drm);
 	}
 
 	power_async_delay = intel_display_power_select_target_dc_state(state);
diff --git a/drivers/gpu/drm/i915/display/intel_vblank.c b/drivers/gpu/drm/i915/display/intel_vblank.c
index 1d4753605675..5a0af95a7442 100644
--- a/drivers/gpu/drm/i915/display/intel_vblank.c
+++ b/drivers/gpu/drm/i915/display/intel_vblank.c
@@ -294,15 +294,13 @@ static int __intel_get_crtc_scanline(struct intel_crtc *crtc)
 static void intel_vblank_section_enter(struct intel_display *display)
 	__acquires(uncore->lock)
 {
-	struct intel_uncore *uncore = to_intel_uncore(display->drm);
-	spin_lock(&uncore->lock);
+	display->parent->mmio->lock(display->drm);
 }
 
 static void intel_vblank_section_exit(struct intel_display *display)
 	__releases(uncore->lock)
 {
-	struct intel_uncore *uncore = to_intel_uncore(display->drm);
-	spin_unlock(&uncore->lock);
+	display->parent->mmio->unlock(display->drm);
 }
 #else
 static void intel_vblank_section_enter(struct intel_display *display)
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index 5787f40ac62e..451a27fed0e7 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -753,6 +753,7 @@ static const struct intel_display_parent_interface parent = {
 	.hdcp = &i915_display_hdcp_interface,
 	.initial_plane = &i915_display_initial_plane_interface,
 	.irq = &i915_display_irq_interface,
+	.mmio = &i915_display_mmio_interface,
 	.overlay = &i915_display_overlay_interface,
 	.panic = &i915_display_panic_interface,
 	.pc8 = &i915_display_pc8_interface,
diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
index e360e4f9d9a2..b11be8acf5b3 100644
--- a/drivers/gpu/drm/i915/intel_uncore.c
+++ b/drivers/gpu/drm/i915/intel_uncore.c
@@ -26,6 +26,7 @@
 
 #include <drm/drm_managed.h>
 #include <drm/drm_print.h>
+#include <drm/intel/display_parent_interface.h>
 
 #include "display/intel_display_core.h"
 #include "gt/intel_engine_regs.h"
@@ -2923,6 +2924,85 @@ intel_uncore_forcewake_for_reg(struct intel_uncore *uncore,
 	return fw_domains;
 }
 
+static u8 i915_uncore_read8(struct drm_device *drm, u32 reg)
+{
+	return intel_uncore_read8(to_intel_uncore(drm), _MMIO(reg));
+}
+
+static void i915_uncore_write8(struct drm_device *drm, u32 reg, u8 val)
+{
+	intel_uncore_write8(to_intel_uncore(drm), _MMIO(reg), val);
+}
+
+static u16 i915_uncore_read16(struct drm_device *drm, u32 reg)
+{
+	return intel_uncore_read16(to_intel_uncore(drm), _MMIO(reg));
+}
+
+static void i915_uncore_write16(struct drm_device *drm, u32 reg, u16 val)
+{
+	intel_uncore_write16(to_intel_uncore(drm), _MMIO(reg), val);
+}
+
+static u32 i915_uncore_read32(struct drm_device *drm, u32 reg)
+{
+	return intel_uncore_read(to_intel_uncore(drm), _MMIO(reg));
+}
+
+static u32 i915_uncore_read32_fw(struct drm_device *drm, u32 reg)
+{
+	u32 val;
+
+	val = intel_uncore_read_fw(to_intel_uncore(drm), _MMIO(reg));
+	trace_i915_reg_rw(false, _MMIO(reg), val, sizeof(val), true);
+
+	return val;
+}
+
+static void i915_uncore_write32(struct drm_device *drm, u32 reg, u32 val)
+{
+	intel_uncore_write(to_intel_uncore(drm), _MMIO(reg), val);
+}
+
+static void i915_uncore_write32_fw(struct drm_device *drm, u32 reg, u32 val)
+{
+	trace_i915_reg_rw(true, _MMIO(reg), val, sizeof(val), true);
+	intel_uncore_write_fw(to_intel_uncore(drm), _MMIO(reg), val);
+}
+
+static void i915_uncore_lock(struct drm_device *drm)
+{
+	struct intel_uncore *uncore = to_intel_uncore(drm);
+
+	spin_lock(&uncore->lock);
+}
+
+static void i915_uncore_unlock(struct drm_device *drm)
+{
+	struct intel_uncore *uncore = to_intel_uncore(drm);
+
+	spin_unlock(&uncore->lock);
+}
+
+static void i915_uncore_arm_unclaimed_mmio_detection(struct drm_device *drm)
+{
+	intel_uncore_arm_unclaimed_mmio_detection(to_intel_uncore(drm));
+}
+
+const struct intel_display_mmio_interface i915_display_mmio_interface = {
+	.read8 = i915_uncore_read8,
+	.write8 = i915_uncore_write8,
+	.read16 = i915_uncore_read16,
+	.write16 = i915_uncore_write16,
+	.read32 = i915_uncore_read32,
+	.read32_fw = i915_uncore_read32_fw,
+	.write32 = i915_uncore_write32,
+	.write32_fw = i915_uncore_write32_fw,
+	.lock = i915_uncore_lock,
+	.unlock = i915_uncore_unlock,
+	.arm_unclaimed_mmio_detection = i915_uncore_arm_unclaimed_mmio_detection,
+};
+
 #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
 #include "selftests/mock_uncore.c"
 #include "selftests/intel_uncore.c"
diff --git a/drivers/gpu/drm/i915/intel_uncore.h b/drivers/gpu/drm/i915/intel_uncore.h
index fafc2ca9a237..0f29fd0a6309 100644
--- a/drivers/gpu/drm/i915/intel_uncore.h
+++ b/drivers/gpu/drm/i915/intel_uncore.h
@@ -515,4 +515,6 @@ struct intel_uncore *to_intel_uncore(struct drm_device *drm);
 #define raw_reg_write(base, reg, value) \
 	writel(value, base + i915_mmio_reg_offset(reg))
 
+extern const struct intel_display_mmio_interface i915_display_mmio_interface;
+
 #endif /* !__INTEL_UNCORE_H__ */
diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index aab416485e3e..42cc19009bab 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -33,6 +33,7 @@
 #include "xe_frontbuffer.h"
 #include "xe_hdcp_gsc.h"
 #include "xe_initial_plane.h"
+#include "xe_mmio.h"
 #include "xe_module.h"
 #include "xe_panic.h"
 #include "xe_stolen.h"
@@ -444,6 +445,82 @@ static void transient_data_flush(struct drm_device *drm)
 	xe_device_td_flush(xe);
 }
 
+static struct xe_mmio *to_xe_mmio(struct drm_device *drm)
+{
+	return xe_root_tile_mmio(to_xe_device(drm));
+}
+
+static u8 xe_uncore_read8(struct drm_device *drm, u32 reg)
+{
+	return xe_mmio_read8(to_xe_mmio(drm), XE_REG(reg));
+}
+
+static void xe_uncore_write8(struct drm_device *drm, u32 reg, u8 val)
+{
+	xe_mmio_write8(to_xe_mmio(drm), XE_REG(reg), val);
+}
+
+static u16 xe_uncore_read16(struct drm_device *drm, u32 reg)
+{
+	return xe_mmio_read16(to_xe_mmio(drm), XE_REG(reg));
+}
+
+static void xe_uncore_write16(struct drm_device *drm, u32 reg, u16 val)
+{
+}
+
+static u32 xe_uncore_read32(struct drm_device *drm, u32 reg)
+{
+	return xe_mmio_read32(to_xe_mmio(drm), XE_REG(reg));
+}
+
+static u32 xe_uncore_read32_fw(struct drm_device *drm, u32 reg)
+{
+	return xe_mmio_read32(to_xe_mmio(drm), XE_REG(reg));
+}
+
+static void xe_uncore_write32(struct drm_device *drm, u32 reg, u32 val)
+{
+	xe_mmio_write32(to_xe_mmio(drm), XE_REG(reg), val);
+}
+
+static void xe_uncore_write32_fw(struct drm_device *drm, u32 reg, u32 val)
+{
+	xe_mmio_write32(to_xe_mmio(drm), XE_REG(reg), val);
+}
+
+static void xe_uncore_lock(struct drm_device *drm)
+{
+	struct xe_device *xe = to_xe_device(drm);
+
+	spin_lock(&xe->uncore.lock);
+}
+
+static void xe_uncore_unlock(struct drm_device *drm)
+{
+	struct xe_device *xe = to_xe_device(drm);
+
+	spin_unlock(&xe->uncore.lock);
+}
+
+static void xe_uncore_arm_unclaimed_mmio_detection(struct drm_device *drm)
+{
+}
+
+const struct intel_display_mmio_interface xe_display_mmio_interface = {
+	.read8 = xe_uncore_read8,
+	.write8 = xe_uncore_write8,
+	.read16 = xe_uncore_read16,
+	.write16 = xe_uncore_write16,
+	.read32 = xe_uncore_read32,
+	.read32_fw = xe_uncore_read32_fw,
+	.write32 = xe_uncore_write32,
+	.write32_fw = xe_uncore_write32_fw,
+	.lock = xe_uncore_lock,
+	.unlock = xe_uncore_unlock,
+	.arm_unclaimed_mmio_detection = xe_uncore_arm_unclaimed_mmio_detection,
+};
+
 static const struct intel_display_parent_interface parent = {
 	.bo = &xe_display_bo_interface,
 	.dsb = &xe_display_dsb_interface,
@@ -452,6 +529,7 @@ static const struct intel_display_parent_interface parent = {
 	.hdcp = &xe_display_hdcp_interface,
 	.initial_plane = &xe_display_initial_plane_interface,
 	.irq = &xe_display_irq_interface,
+	.mmio = &xe_display_mmio_interface,
 	.panic = &xe_display_panic_interface,
 	.pcode = &xe_display_pcode_interface,
 	.rpm = &xe_display_rpm_interface,
diff --git a/include/drm/intel/display_parent_interface.h b/include/drm/intel/display_parent_interface.h
index 464fb588cb60..22a90a7411cc 100644
--- a/include/drm/intel/display_parent_interface.h
+++ b/include/drm/intel/display_parent_interface.h
@@ -136,6 +136,20 @@ struct intel_display_irq_interface {
 	void (*synchronize)(struct drm_device *drm);
 };
 
+struct intel_display_mmio_interface {
+	u8 (*read8)(struct drm_device *drm, u32 reg);
+	void (*write8)(struct drm_device *drm, u32 reg, u8 val);
+	u16 (*read16)(struct drm_device *drm, u32 reg);
+	void (*write16)(struct drm_device *drm, u32 reg, u16 val);
+	u32 (*read32)(struct drm_device *drm, u32 reg);
+	u32 (*read32_fw)(struct drm_device *drm, u32 reg);
+	void (*write32)(struct drm_device *drm, u32 reg, u32 val);
+	void (*write32_fw)(struct drm_device *drm, u32 reg, u32 val);
+	void (*lock)(struct drm_device *drm);
+	void (*unlock)(struct drm_device *drm);
+	void (*arm_unclaimed_mmio_detection)(struct drm_device *drm);
+};
+
 struct intel_display_overlay_interface {
 	bool (*is_active)(struct drm_device *drm);
 
@@ -272,6 +286,9 @@ struct intel_display_parent_interface {
 	/** @irq: IRQ interface */
 	const struct intel_display_irq_interface *irq;
 
+	/** @mmio: MMIO interface */
+	const struct intel_display_mmio_interface *mmio;
+
 	/** @panic: Panic interface */
 	const struct intel_display_panic_interface *panic;
 
-- 
2.47.3

