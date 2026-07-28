Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7332FC54F54
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jul 2026 17:00:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D74F10E5E5;
	Tue, 28 Jul 2026 17:00:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FadZnrxq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFDCC10E5DF;
 Tue, 28 Jul 2026 17:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785258036; x=1816794036;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hye2immbet8Vg8zsosI0mxS8QrJObg1AT1hc74nE6cg=;
 b=FadZnrxqx8TzOdaSfZzUsyiIEqOJBRX1EveQ6/gRd0AoUNBAbGAmeyBg
 PwJi/CBRMWnh4sMhh3E7WQFxHrkwcV6P67B8AMMmDFlb5jMoa1N9by/bl
 mER+Sy7mkOt0cPsDk38z7bvORiOns74M5pABv2lL19LWo4LcDzvYPN9GJ
 Z0AT4PRwIbiS8KZELMyQGcbDhuXbz9eyGCEocw7C/t1n9rBh0O/MTliSH
 qd1XkgdMYS9+5kwVp35MXTTcL0dTk+ZwMm2M2wc4JQmu0z1+kQmzx6Ro4
 /bTaqNYv2DZa1scfi+q24m81g405bwW6bVmH1k/tCyB2LBw5pI7dOHiTp w==;
X-CSE-ConnectionGUID: MSJO1AeNQWipypu+TpZ8Vw==
X-CSE-MsgGUID: DGRj/oZwQU+L697AQ7AsEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="96510212"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="96510212"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 10:00:35 -0700
X-CSE-ConnectionGUID: lF8EIYplQx29ORDfmJz9Dw==
X-CSE-MsgGUID: y9BZWsnSSheET3iIAVNOkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="297984032"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.76])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 10:00:33 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH] drm/{i915,
 xe}/display: move transient data flush call to display parent
 interface
Date: Tue, 28 Jul 2026 20:00:29 +0300
Message-ID: <20260728170029.608289-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

Move the core driver TDF call to display parent interface to avoid
direct calls from display to xe driver.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c  |  4 +--
 .../gpu/drm/i915/display/intel_frontbuffer.c  |  3 +--
 drivers/gpu/drm/i915/display/intel_parent.c   |  6 +++++
 drivers/gpu/drm/i915/display/intel_parent.h   |  1 +
 drivers/gpu/drm/i915/display/intel_tdf.h      | 25 -------------------
 drivers/gpu/drm/xe/Makefile                   |  3 +--
 drivers/gpu/drm/xe/display/xe_display.c       | 15 +++++++++++
 drivers/gpu/drm/xe/display/xe_tdf.c           | 15 -----------
 include/drm/intel/display_parent_interface.h  |  3 +++
 9 files changed, 29 insertions(+), 46 deletions(-)
 delete mode 100644 drivers/gpu/drm/i915/display/intel_tdf.h
 delete mode 100644 drivers/gpu/drm/xe/display/xe_tdf.c

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 9dfd095f325f..bf838834b89f 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -107,6 +107,7 @@
 #include "intel_modeset_verify.h"
 #include "intel_overlay.h"
 #include "intel_panel.h"
+#include "intel_parent.h"
 #include "intel_pch_display.h"
 #include "intel_pch_refclk.h"
 #include "intel_pfit.h"
@@ -119,7 +120,6 @@
 #include "intel_sdvo.h"
 #include "intel_snps_phy.h"
 #include "intel_tc.h"
-#include "intel_tdf.h"
 #include "intel_tv.h"
 #include "intel_vblank.h"
 #include "intel_vdsc.h"
@@ -7506,7 +7506,7 @@ static void intel_atomic_commit_tail(struct intel_atomic_state *state)
 
 	intel_atomic_commit_fence_wait(state);
 
-	intel_td_flush(display);
+	intel_parent_transient_data_flush(display);
 
 	intel_atomic_prepare_plane_clear_colors(state);
 
diff --git a/drivers/gpu/drm/i915/display/intel_frontbuffer.c b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
index 705742e117ca..70aae6ffa3fe 100644
--- a/drivers/gpu/drm/i915/display/intel_frontbuffer.c
+++ b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
@@ -66,7 +66,6 @@
 #include "intel_frontbuffer.h"
 #include "intel_parent.h"
 #include "intel_psr.h"
-#include "intel_tdf.h"
 
 /**
  * frontbuffer_flush - flush frontbuffer
@@ -95,7 +94,7 @@ static void frontbuffer_flush(struct intel_display *display,
 	trace_intel_frontbuffer_flush(display, frontbuffer_bits, origin);
 
 	might_sleep();
-	intel_td_flush(display);
+	intel_parent_transient_data_flush(display);
 	intel_drrs_flush(display, frontbuffer_bits);
 	intel_psr_flush(display, frontbuffer_bits, origin);
 	intel_fbc_flush(display, frontbuffer_bits, origin);
diff --git a/drivers/gpu/drm/i915/display/intel_parent.c b/drivers/gpu/drm/i915/display/intel_parent.c
index a5e41ea66921..ffc1f5e0518c 100644
--- a/drivers/gpu/drm/i915/display/intel_parent.c
+++ b/drivers/gpu/drm/i915/display/intel_parent.c
@@ -451,6 +451,12 @@ bool intel_parent_has_fenced_regions(struct intel_display *display)
 	return display->parent->has_fenced_regions && display->parent->has_fenced_regions(display->drm);
 }
 
+void intel_parent_transient_data_flush(struct intel_display *display)
+{
+	if (display->parent->transient_data_flush)
+		display->parent->transient_data_flush(display->drm);
+}
+
 bool intel_parent_vgpu_active(struct intel_display *display)
 {
 	return display->parent->vgpu_active && display->parent->vgpu_active(display->drm);
diff --git a/drivers/gpu/drm/i915/display/intel_parent.h b/drivers/gpu/drm/i915/display/intel_parent.h
index 595d4148b8eb..c817a826169c 100644
--- a/drivers/gpu/drm/i915/display/intel_parent.h
+++ b/drivers/gpu/drm/i915/display/intel_parent.h
@@ -155,6 +155,7 @@ int intel_parent_vlv_iosf_write(struct intel_display *display, enum vlv_iosf_sb_
 /* generic */
 bool intel_parent_has_auxccs(struct intel_display *display);
 bool intel_parent_has_fenced_regions(struct intel_display *display);
+void intel_parent_transient_data_flush(struct intel_display *display);
 bool intel_parent_vgpu_active(struct intel_display *display);
 void intel_parent_fence_priority_display(struct intel_display *display, struct dma_fence *fence);
 
diff --git a/drivers/gpu/drm/i915/display/intel_tdf.h b/drivers/gpu/drm/i915/display/intel_tdf.h
deleted file mode 100644
index 0862c2bfd9cd..000000000000
--- a/drivers/gpu/drm/i915/display/intel_tdf.h
+++ /dev/null
@@ -1,25 +0,0 @@
-/* SPDX-License-Identifier: MIT */
-/*
- * Copyright © 2024 Intel Corporation
- */
-
-#ifndef __INTEL_TDF_H__
-#define __INTEL_TDF_H__
-
-/*
- * TDF (Transient-Data-Flush) is needed for Xe2+ where special L3:XD caching can
- * be enabled through various PAT index modes. Idea is to use this caching mode
- * when for example rendering onto the display surface, with the promise that
- * KMD will ensure transient cache entries are always flushed by the time we do
- * the display flip, since display engine is never coherent with CPU/GPU caches.
- */
-
-struct intel_display;
-
-#ifdef I915
-static inline void intel_td_flush(struct intel_display *display) {}
-#else
-void intel_td_flush(struct intel_display *display);
-#endif
-
-#endif
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 67ada1d6c2fb..44ed055439d4 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -228,8 +228,7 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
 	display/xe_hdcp_gsc.o \
 	display/xe_initial_plane.o \
 	display/xe_panic.o \
-	display/xe_stolen.o \
-	display/xe_tdf.o
+	display/xe_stolen.o
 
 # Display code shared with i915
 xe-$(CONFIG_DRM_XE_DISPLAY) += \
diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index 8da4c457a4a0..5f5e79505b3d 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -446,6 +446,20 @@ static bool has_auxccs(struct drm_device *drm)
 	return xe->info.platform == XE_ALDERLAKE_P;
 }
 
+/*
+ * TDF (Transient-Data-Flush) is needed for Xe2+ where special L3:XD caching can
+ * be enabled through various PAT index modes. Idea is to use this caching mode
+ * when for example rendering onto the display surface, with the promise that
+ * KMD will ensure transient cache entries are always flushed by the time we do
+ * the display flip, since display engine is never coherent with CPU/GPU caches.
+ */
+static void transient_data_flush(struct drm_device *drm)
+{
+	struct xe_device *xe = to_xe_device(drm);
+
+	xe_device_td_flush(xe);
+}
+
 static const struct intel_display_parent_interface parent = {
 	.bo = &xe_display_bo_interface,
 	.dsb = &xe_display_dsb_interface,
@@ -459,6 +473,7 @@ static const struct intel_display_parent_interface parent = {
 	.rpm = &xe_display_rpm_interface,
 	.stolen = &xe_display_stolen_interface,
 	.has_auxccs = has_auxccs,
+	.transient_data_flush = transient_data_flush,
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/display/xe_tdf.c b/drivers/gpu/drm/xe/display/xe_tdf.c
deleted file mode 100644
index 78bda4c47874..000000000000
--- a/drivers/gpu/drm/xe/display/xe_tdf.c
+++ /dev/null
@@ -1,15 +0,0 @@
-// SPDX-License-Identifier: MIT
-/*
- * Copyright © 2024 Intel Corporation
- */
-
-#include "intel_display_core.h"
-#include "intel_tdf.h"
-#include "xe_device.h"
-
-void intel_td_flush(struct intel_display *display)
-{
-	struct xe_device *xe = to_xe_device(display->drm);
-
-	xe_device_td_flush(xe);
-}
diff --git a/include/drm/intel/display_parent_interface.h b/include/drm/intel/display_parent_interface.h
index de395df9ca30..8b25107615ea 100644
--- a/include/drm/intel/display_parent_interface.h
+++ b/include/drm/intel/display_parent_interface.h
@@ -302,6 +302,9 @@ struct intel_display_parent_interface {
 		/** @has_fenced_regions: Support legacy fencing? Optional. */
 		bool (*has_fenced_regions)(struct drm_device *drm);
 
+		/** @transient_data_flush: Transient data flush. Optional. */
+		void (*transient_data_flush)(struct drm_device *drm);
+
 		/** @vgpu_active: Is vGPU active? Optional. */
 		bool (*vgpu_active)(struct drm_device *drm);
 	};
-- 
2.47.3

