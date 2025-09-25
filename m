Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98FAFCCA470
	for <intel-xe@archiver.kernel.org>; Thu, 25 Sep 2025 23:46:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B80C10E9D8;
	Thu, 25 Sep 2025 23:46:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IIrJ/01Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F51110E330
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Sep 2025 23:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758844007; x=1790380007;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yGnXnotyjvzXsoQ8XvfJqUXmDxIWOqJTL7U5EUaz5E0=;
 b=IIrJ/01QprAMQ3ax/LmR11IZRfmR8+AqqvcD5d+ixZJWPb6QLb2vTFzc
 gLZ7mLZE/b9mOz9RVjuUEs8C1QkJmB/S05pxfRs3QFiX6HQ2f+g/1IB1v
 DfuhQFE2Dpg8NSEk5YqYAmL0JwybT5fYO4XL9+bqAZdSiO0/SM3pbuvHC
 9n3Pvq1sJONRawG1gK59lGIRgGPdM3Nhgg3zqNfaEEZZVbhLRevRpZ2fs
 Je7v4jYMTACf5wj73isqXbFEQs8t1bL6tZ33UFF+AEQ5TmEU/kvnmfuMc
 uw2LGtJXZ/Lixp362l2IdJR8u3MhY/9KPzTQ4y6yjBBBF4t1V8hgqLTsH w==;
X-CSE-ConnectionGUID: bvI7mw6XQ9W4ahDY2dmDqA==
X-CSE-MsgGUID: bM+MdAn/S1SaBk36LxDpRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="78817674"
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; d="scan'208";a="78817674"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 16:46:46 -0700
X-CSE-ConnectionGUID: OL5P0DX2SBKFyybCl6ukug==
X-CSE-MsgGUID: vZFc6VIbRg2hk6Anj1ZErA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; d="scan'208";a="181852980"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 16:46:46 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH v2 12/22] drm/xe: Make display part of Wa_22019338487 a device
 workaround
Date: Thu, 25 Sep 2025 16:46:40 -0700
Message-ID: <20250925234628.2112163-36-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250925234628.2112163-24-matthew.d.roper@intel.com>
References: <20250925234628.2112163-24-matthew.d.roper@intel.com>
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

