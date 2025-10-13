Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2814BCCD199
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 20:10:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B55C210E510;
	Mon, 13 Oct 2025 20:10:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BxRNZUQn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0CCC10E500
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Oct 2025 20:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760386203; x=1791922203;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wsaCkkrP/4f6vaWNRoaQncgi5wWW5fgkUleX+yHlaXg=;
 b=BxRNZUQnZKumpjceXjRe/UYgZbDXGMElq5r82CewARuAHpXdVNdbaa8M
 DDK5oxTEl1a1Mfr4S1vNSBdDMw2UP7aqwRSGeYOYZgnL0H0yM88+X5C0g
 EmU6Z7kMAh+MPfVMRO8ZKoxOZvFcDDwt45fSPciGb3i12HNJev4ux34Ax
 7AIsz+Q65wTBJYnqBSDWI6kFUczeLw6aHy+3piK8iqydpHNIseF8YjBDo
 rGOO8sfjsevbe+EOkPL6hTznWrH3N+kO64e4KI9CRKo/CjPHXw/BXGkqH
 h6ytEx9q2l+58trCTAjaezIl/HXBsPegnElFRQs64FA/HVuRp3+DmdQ5t A==;
X-CSE-ConnectionGUID: 0OoZu5sMR4+dF4WJFKMpUQ==
X-CSE-MsgGUID: MyZq1AbdReuDz5ShRw3WwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="72800543"
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="72800543"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 13:10:02 -0700
X-CSE-ConnectionGUID: FPuuNvlDQVW3BWO4vBO6pQ==
X-CSE-MsgGUID: h+EsuMttS3WksGsxNI4I+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="185707575"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 13:10:02 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH v5 13/23] drm/xe: Make display part of Wa_22019338487 a device
 workaround
Date: Mon, 13 Oct 2025 13:09:56 -0700
Message-ID: <20251013200944.2499947-38-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251013200944.2499947-25-matthew.d.roper@intel.com>
References: <20251013200944.2499947-25-matthew.d.roper@intel.com>
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

The display part of Wa_22019338487 (i.e., avoiding use of stolen memory)
is using a platform test rather than an graphics/media IP test.  Since
this workaround is focused on non-GT uses of stolen memory, it makes
sense that we'd want to still apply the workaround on affected platforms
even if the GTs themselves are disabled via configfs.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/display/intel_fbdev_fb.c   | 4 ++--
 drivers/gpu/drm/xe/display/xe_plane_initial.c | 4 ++--
 drivers/gpu/drm/xe/xe_device_wa_oob.rules     | 1 +
 drivers/gpu/drm/xe/xe_wa_oob.rules            | 1 -
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/intel_fbdev_fb.c b/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
index 35a5b07eeba4..af72f7305e5a 100644
--- a/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
+++ b/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
@@ -10,7 +10,7 @@
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_wa.h"
 
-#include <generated/xe_wa_oob.h>
+#include <generated/xe_device_wa_oob.h>
 
 struct drm_gem_object *intel_fbdev_fb_bo_create(struct drm_device *drm, int size)
 {
@@ -19,7 +19,7 @@ struct drm_gem_object *intel_fbdev_fb_bo_create(struct drm_device *drm, int size
 
 	obj = ERR_PTR(-ENODEV);
 
-	if (!IS_DGFX(xe) && !XE_GT_WA(xe_root_mmio_gt(xe), 22019338487_display)) {
+	if (!IS_DGFX(xe) && !XE_DEVICE_WA(xe, 22019338487_display)) {
 		obj = xe_bo_create_pin_map_novm(xe, xe_device_get_root_tile(xe),
 						size,
 						ttm_bo_type_kernel, XE_BO_FLAG_SCANOUT |
diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
index 94f00def811b..12d25c5290fd 100644
--- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
+++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
@@ -25,7 +25,7 @@
 #include "xe_vram_types.h"
 #include "xe_wa.h"
 
-#include <generated/xe_wa_oob.h>
+#include <generated/xe_device_wa_oob.h>
 
 void intel_plane_initial_vblank_wait(struct intel_crtc *crtc)
 {
@@ -123,7 +123,7 @@ initial_plane_bo(struct xe_device *xe,
 		phys_base = base;
 		flags |= XE_BO_FLAG_STOLEN;
 
-		if (XE_GT_WA(xe_root_mmio_gt(xe), 22019338487_display))
+		if (XE_DEVICE_WA(xe, 22019338487_display))
 			return NULL;
 
 		/*
diff --git a/drivers/gpu/drm/xe/xe_device_wa_oob.rules b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
index 3a0c4ccc4224..3cc93f0e77f8 100644
--- a/drivers/gpu/drm/xe/xe_device_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
@@ -1,2 +1,3 @@
 15015404425     PLATFORM(LUNARLAKE)
 		PLATFORM(PANTHERLAKE)
+22019338487_display	PLATFORM(LUNARLAKE)
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index f3a6d5d239ce..eb761d30e066 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -45,7 +45,6 @@
 22019338487	MEDIA_VERSION(2000)
 		GRAPHICS_VERSION(2001), FUNC(xe_rtp_match_not_sriov_vf)
 		MEDIA_VERSION(3000), MEDIA_STEP(A0, B0), FUNC(xe_rtp_match_not_sriov_vf)
-22019338487_display	PLATFORM(LUNARLAKE)
 16023588340	GRAPHICS_VERSION(2001), FUNC(xe_rtp_match_not_sriov_vf)
 14019789679	GRAPHICS_VERSION(1255)
 		GRAPHICS_VERSION_RANGE(1270, 2004)
-- 
2.51.0

