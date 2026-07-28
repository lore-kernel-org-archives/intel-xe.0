Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45A30C54F4D
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jul 2026 16:25:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 059D310E974;
	Tue, 28 Jul 2026 16:25:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JjpAAwkg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 796F410E974;
 Tue, 28 Jul 2026 16:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785255919; x=1816791919;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gt6B+yLts86MZ4MFxqPZl3jC2bkkI67GJTY6onKeoNg=;
 b=JjpAAwkgOCho0ehs3NpTVQzHp+bo6i0kZqj4q0zlH9M5vhhVE6v9wVDy
 5k21iSV62ZGA3XfUWJZRpDDYq+jiahUsuBM+A5i8PuCYsc4zzOrAn7yGF
 jZmf3BV2tTQevlqjvJk+ZRYXreyvhQ9Yw0qgpPt0Wb7Uam7TwogZugod9
 Oq68LoP8V3El6gTJdw8RLUfbvWWWg0Teb459LN9F1yZpDDoTI9EiIf39u
 p7+7AYhB/CMCcDDVlmXy2fy/yGIKGAaqkE0kbVjqQJgCBjGg6tdxlzYu5
 rB8+r+jeNID6BXRRsgTDfJa65K/eUMnGq2A7ICTW7Ofm0oMyrBHu5OeTi Q==;
X-CSE-ConnectionGUID: voMJBvfCTHaSyJ3IYTREwg==
X-CSE-MsgGUID: fxUA0FLCSiuhovx+bLGVVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="96202040"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="96202040"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 09:25:19 -0700
X-CSE-ConnectionGUID: UPvQ+GzIT1+pdYDBB3WZLQ==
X-CSE-MsgGUID: myPFoh78Riadle5/vpqCEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="255830676"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.76])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 09:25:17 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH] drm/{i915,
 xe}/display: add core workaround query to display parent interface
Date: Tue, 28 Jul 2026 19:25:14 +0300
Message-ID: <20260728162514.594285-1-jani.nikula@intel.com>
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

There are workarounds display needs to apply depending on information
only available to the core driver. Add a display parent interface for
the query. For starters, there's only one workaround like this, so keep
it simple instead of over-engineering.

This lets us drop an #ifdef I915 as well as xe dependency on some
display headers.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_wa.c |  3 ++-
 drivers/gpu/drm/i915/display/intel_display_wa.h |  9 ---------
 drivers/gpu/drm/xe/display/xe_display.c         |  2 ++
 drivers/gpu/drm/xe/display/xe_display_wa.c      | 13 +++++++++----
 include/drm/intel/display_parent_interface.h    |  7 +++++++
 5 files changed, 20 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.c b/drivers/gpu/drm/i915/display/intel_display_wa.c
index 3662e0f17c69..10dc2930468d 100644
--- a/drivers/gpu/drm/i915/display/intel_display_wa.c
+++ b/drivers/gpu/drm/i915/display/intel_display_wa.c
@@ -4,6 +4,7 @@
  */
 
 #include <drm/drm_print.h>
+#include <drm/intel/display_parent_interface.h>
 #include <drm/intel/step.h>
 
 #include "intel_de.h"
@@ -131,7 +132,7 @@ bool __intel_display_wa(struct intel_display *display, enum intel_display_wa wa,
 	case INTEL_DISPLAY_WA_16011863758:
 		return DISPLAY_VER(display) >= 11;
 	case INTEL_DISPLAY_WA_16023588340:
-		return intel_display_needs_wa_16023588340(display);
+		return display->parent->wa && display->parent->wa->wa_16023588340(display->drm);
 	case INTEL_DISPLAY_WA_16025573575:
 		return intel_display_needs_wa_16025573575(display);
 	case INTEL_DISPLAY_WA_16025596647:
diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.h b/drivers/gpu/drm/i915/display/intel_display_wa.h
index 338b32e4162d..425a300840aa 100644
--- a/drivers/gpu/drm/i915/display/intel_display_wa.h
+++ b/drivers/gpu/drm/i915/display/intel_display_wa.h
@@ -12,15 +12,6 @@ struct intel_display;
 
 void intel_display_wa_apply(struct intel_display *display);
 
-#ifdef I915
-static inline bool intel_display_needs_wa_16023588340(struct intel_display *display)
-{
-	return false;
-}
-#else
-bool intel_display_needs_wa_16023588340(struct intel_display *display);
-#endif
-
 /*
  * This enum lists display workarounds; each entry here must have a
  * corresponding case in __intel_display_wa().  Keep both sorted by lineage
diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index 8da4c457a4a0..10d80dc812bc 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -37,6 +37,7 @@
 #include "xe_display_bo.h"
 #include "xe_display_pcode.h"
 #include "xe_display_rpm.h"
+#include "xe_display_wa.h"
 #include "xe_dsb_buffer.h"
 #include "xe_fb_pin.h"
 #include "xe_frontbuffer.h"
@@ -458,6 +459,7 @@ static const struct intel_display_parent_interface parent = {
 	.pcode = &xe_display_pcode_interface,
 	.rpm = &xe_display_rpm_interface,
 	.stolen = &xe_display_stolen_interface,
+	.wa = &xe_display_wa_interface,
 	.has_auxccs = has_auxccs,
 };
 
diff --git a/drivers/gpu/drm/xe/display/xe_display_wa.c b/drivers/gpu/drm/xe/display/xe_display_wa.c
index 2aa1b8c03411..46e41e8a3304 100644
--- a/drivers/gpu/drm/xe/display/xe_display_wa.c
+++ b/drivers/gpu/drm/xe/display/xe_display_wa.c
@@ -3,17 +3,22 @@
  * Copyright © 2024 Intel Corporation
  */
 
-#include "intel_display_core.h"
-#include "intel_display_wa.h"
+#include <drm/intel/display_parent_interface.h>
+
 #include "xe_device.h"
+#include "xe_display_wa.h"
 #include "xe_wa.h"
 
 #include <generated/xe_wa_oob.h>
 
-bool intel_display_needs_wa_16023588340(struct intel_display *display)
+static bool intel_display_needs_wa_16023588340(struct drm_device *drm)
 {
-	struct xe_device *xe = to_xe_device(display->drm);
+	struct xe_device *xe = to_xe_device(drm);
 	struct xe_gt *wa_gt = xe_root_mmio_gt(xe);
 
 	return wa_gt && XE_GT_WA(wa_gt, 16023588340);
 }
+
+const struct intel_display_wa_interface xe_display_wa_interface = {
+	.wa_16023588340 = intel_display_needs_wa_16023588340,
+};
diff --git a/include/drm/intel/display_parent_interface.h b/include/drm/intel/display_parent_interface.h
index de395df9ca30..bdc9f9ad4fcb 100644
--- a/include/drm/intel/display_parent_interface.h
+++ b/include/drm/intel/display_parent_interface.h
@@ -230,6 +230,10 @@ struct intel_display_vlv_iosf_interface {
 	int (*write)(struct drm_device *drm, enum vlv_iosf_sb_unit unit, u32 addr, u32 val);
 };
 
+struct intel_display_wa_interface {
+	bool (*wa_16023588340)(struct drm_device *drm);
+};
+
 /**
  * struct intel_display_parent_interface - services parent driver provides to display
  *
@@ -291,6 +295,9 @@ struct intel_display_parent_interface {
 	/** @vlv_iosf: VLV IOSF sideband. Optional. */
 	const struct intel_display_vlv_iosf_interface *vlv_iosf;
 
+	/** @wa: Display workarounds query. Optional. */
+	const struct intel_display_wa_interface *wa;
+
 	/* Generic independent functions */
 	struct {
 		/** @fence_priority_display: Set display priority. Optional. */
-- 
2.47.3

