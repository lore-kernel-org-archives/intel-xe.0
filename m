Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDF30CE7AB8
	for <intel-xe@archiver.kernel.org>; Fri,  6 Sep 2024 07:01:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82B9510E817;
	Fri,  6 Sep 2024 07:01:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m/d+Jxvh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F91210E817
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Sep 2024 07:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725606098; x=1757142098;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=K2qzTMQ/oTDK2Q1Ag0Tvdv7aBh7JDHAyowvMl1zeZEk=;
 b=m/d+Jxvhxxj3a70Yo5aisGeeFFwwedtBSD9pm64agyBpZOiAeO+ZwS0a
 tAJdhVEEeKanhjfGd8JgfZT+C0MRXfQ1x1U1iEi+PjNCjsoyCJRlhmwQF
 O7HTiMhQtJGFyCW00XwfLnSq0wpsKLI0VeUHKWSjFWblrq8943XEd+YxZ
 UlXXtKQZo1LGwmclQVNiMPcEVVUaeOvof6EsuJUJRqB1pch1F8k+jLIvV
 Mpl2duF2SrLGvFrlHhdhGDC+UQW/QB5QCuZVGxjD6/SMQCULmgFWEuV5W
 aFiJNKB09P5C8OtBESNLKbFCDNYzol9WVLyXI6Y69P8hegsd7uIA3Qtv/ w==;
X-CSE-ConnectionGUID: kVD/IduMQmWFR1CoV6VWzA==
X-CSE-MsgGUID: /7VrJ89LTz+g5wQVOTL7oQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="24510425"
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; d="scan'208";a="24510425"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 00:01:38 -0700
X-CSE-ConnectionGUID: NrdtgNkcQZKmVMnqUHxZNA==
X-CSE-MsgGUID: ttaDlBv/QxWC/OfdBOYCmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; d="scan'208";a="65857590"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by orviesa009.jf.intel.com with ESMTP; 06 Sep 2024 00:01:36 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH] drm/i915/display: Workaround for odd panning for planar yuv
Date: Fri,  6 Sep 2024 12:31:33 +0530
Message-Id: <20240906070133.3843174-1-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
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

Disable the support for odd x pan for NV12 format as underrun
issue is seen.

WA: 16024459452

Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
---
 .../gpu/drm/i915/display/intel_atomic_plane.c    | 16 ++++++++++++++--
 drivers/gpu/drm/i915/display/intel_display_wa.h  |  2 ++
 drivers/gpu/drm/xe/display/xe_display_wa.c       |  5 +++++
 3 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
index e979786aa5cf..9b17321f3477 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
@@ -47,11 +47,13 @@
 #include "intel_display_rps.h"
 #include "intel_display_trace.h"
 #include "intel_display_types.h"
+#include "intel_display_wa.h"
 #include "intel_fb.h"
 #include "intel_fb_pin.h"
 #include "skl_scaler.h"
 #include "skl_watermark.h"
 
+
 static void intel_plane_state_reset(struct intel_plane_state *plane_state,
 				    struct intel_plane *plane)
 {
@@ -1029,8 +1031,18 @@ int intel_plane_check_src_coordinates(struct intel_plane_state *plane_state)
 		 * This allows NV12 and P0xx formats to have odd size and/or odd
 		 * source coordinates on DISPLAY_VER(i915) >= 20
 		 */
-		hsub = 1;
-		vsub = 1;
+
+		/*
+		 * Wa_16023981245 for display version 20.
+		 * Do not support odd x-panning for NV12.
+		 */
+		if (intel_display_needs_wa_16023981245(i915) &&
+		    fb->format->format == DRM_FORMAT_NV12) {
+			vsub = 1;
+		} else {
+			hsub = 1;
+			vsub = 1;
+		}
 	} else {
 		hsub = fb->format->hsub;
 		vsub = fb->format->vsub;
diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.h b/drivers/gpu/drm/i915/display/intel_display_wa.h
index be644ab6ae00..9be35a751503 100644
--- a/drivers/gpu/drm/i915/display/intel_display_wa.h
+++ b/drivers/gpu/drm/i915/display/intel_display_wa.h
@@ -14,8 +14,10 @@ void intel_display_wa_apply(struct drm_i915_private *i915);
 
 #ifdef I915
 static inline bool intel_display_needs_wa_16023588340(struct drm_i915_private *i915) { return false; }
+static inline bool intel_display_needs_wa_16023981245(struct drm_i915_private *i915) { return false; }
 #else
 bool intel_display_needs_wa_16023588340(struct drm_i915_private *i915);
+bool intel_display_needs_wa_16023981245(struct drm_i915_private *i915);
 #endif
 
 #endif
diff --git a/drivers/gpu/drm/xe/display/xe_display_wa.c b/drivers/gpu/drm/xe/display/xe_display_wa.c
index 68e3d1959ad6..fde4e09589a3 100644
--- a/drivers/gpu/drm/xe/display/xe_display_wa.c
+++ b/drivers/gpu/drm/xe/display/xe_display_wa.c
@@ -14,3 +14,8 @@ bool intel_display_needs_wa_16023588340(struct drm_i915_private *i915)
 {
 	return XE_WA(xe_root_mmio_gt(i915), 16023588340);
 }
+
+bool intel_display_needs_wa_16023981245(struct drm_i915_private *i915)
+{
+	return XE_WA(xe_root_mmio_gt(i915), 22019338487_display);
+}
-- 
2.25.1

