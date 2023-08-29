Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC082C6FA8F
	for <intel-xe@archiver.kernel.org>; Tue, 29 Aug 2023 16:33:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E88110E44B;
	Tue, 29 Aug 2023 16:33:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40E8110E445
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Aug 2023 16:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693326808; x=1724862808;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Gw6yQjvJrrXT/7FWpzEEg9I9iGjGXpolJY+kybKgK7g=;
 b=Nai5lBdOmpA08V/2Ty/VeR/DGnFREBNGbXmxZ8337copfbYpETdWD5H6
 p3Rv3qfRXrFaWBjrNj+RrFyx2hXIQTLZllF3xRIQfhiXkvLt4LvtZ1qyo
 f9J99Wy04uRqTNCfFKm2rNVuRBkm2fi+qWW9P6+HgriuNHI1/Tf1UZMDc
 ZrWl6MUxuzDPF4h0/E6ze9QZlN3/Xksnt4e0GGlE7vS003i4KmQP3TlhQ
 qw3pTD508WBuzOzRGEzCYV/F9yHVNkO5xCGJ5wKGc1HbBbRt8/tOKKWoq
 EuHpWhyeSlLYW/jn0JGTZKtaTHXl/r3yDQ/uRO0cnp5iuxmJL2ak8HNVe w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="379186191"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="379186191"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 09:29:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="804189284"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="804189284"
Received: from gtmcgeac-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.21.125])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 09:29:48 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 29 Aug 2023 17:28:44 +0100
Message-ID: <20230829162840.73444-10-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230829162840.73444-7-matthew.auld@intel.com>
References: <20230829162840.73444-7-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC 3/5] drm/xe: move pat_table into device info
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

We need to able to know the max pat_index range for a given platform, as
well being able to lookup the pat_index for a given platform in upcoming
vm_bind uapi, where userspace can directly provide the pat_index. Move
the platform definition of the pat_table into the device info with the
idea of encoding more information about each pat_index in a future
patch.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Pallavi Mishra <pallavi.mishra@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  3 +++
 drivers/gpu/drm/xe/xe_pat.c          | 39 ++++++++++++++++++----------
 drivers/gpu/drm/xe/xe_pat.h          |  3 ++-
 drivers/gpu/drm/xe/xe_pci.c          |  6 +++++
 4 files changed, 36 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 5037b8c180b8..06235da647bb 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -238,6 +238,9 @@ struct xe_device {
 		/** @enable_display: display enabled */
 		u8 enable_display:1;
 
+		const u32 *pat_table;
+		int pat_table_n_entries;
+
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
 		const struct intel_display_device_info *display;
 		struct intel_display_runtime_info display_runtime;
diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index a468655db956..f19f5d8dcd94 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -106,24 +106,17 @@ static void program_pat_mcr(struct xe_gt *gt, const u32 table[], int n_entries)
 	}
 }
 
-void xe_pat_init(struct xe_gt *gt)
+int xe_pat_fill_info(struct xe_device *xe)
 {
-	struct xe_device *xe = gt_to_xe(gt);
-
 	if (xe->info.platform == XE_METEORLAKE) {
-		/*
-		 * SAMedia register offsets are adjusted by the write methods
-		 * and they target registers that are not MCR, while for normal
-		 * GT they are MCR
-		 */
-		if (xe_gt_is_media_type(gt))
-			program_pat(gt, mtl_pat_table, ARRAY_SIZE(mtl_pat_table));
-		else
-			program_pat_mcr(gt, mtl_pat_table, ARRAY_SIZE(mtl_pat_table));
+		xe->info.pat_table = mtl_pat_table;
+		xe->info.pat_table_n_entries = ARRAY_SIZE(mtl_pat_table);
 	} else if (xe->info.platform == XE_PVC || xe->info.platform == XE_DG2) {
-		program_pat_mcr(gt, pvc_pat_table, ARRAY_SIZE(pvc_pat_table));
+		xe->info.pat_table = pvc_pat_table;
+		xe->info.pat_table_n_entries = ARRAY_SIZE(pvc_pat_table);
 	} else if (GRAPHICS_VERx100(xe) <= 1210) {
-		program_pat(gt, tgl_pat_table, ARRAY_SIZE(tgl_pat_table));
+		xe->info.pat_table = tgl_pat_table;
+		xe->info.pat_table_n_entries = ARRAY_SIZE(tgl_pat_table);
 	} else {
 		/*
 		 * Going forward we expect to need new PAT settings for most
@@ -135,7 +128,25 @@ void xe_pat_init(struct xe_gt *gt)
 		 */
 		drm_err(&xe->drm, "Missing PAT table for platform with graphics version %d.%2d!\n",
 			GRAPHICS_VER(xe), GRAPHICS_VERx100(xe) % 100);
+		return -ENODEV;
 	}
+
+	return 0;
+}
+
+void xe_pat_init(struct xe_gt *gt)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+
+	/*
+	 * SAMedia register offsets are adjusted by the write methods
+	 * and they target registers that are not MCR, while for normal
+	 * GT they are MCR.
+	 */
+	if (xe_gt_is_media_type(gt) || GRAPHICS_VERx100(xe) < 1255)
+		program_pat(gt, xe->info.pat_table, xe->info.pat_table_n_entries);
+	else
+		program_pat_mcr(gt, xe->info.pat_table, xe->info.pat_table_n_entries);
 }
 
 void xe_pte_pat_init(struct xe_device *xe)
diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
index 54022f591621..9ab059758ad1 100644
--- a/drivers/gpu/drm/xe/xe_pat.h
+++ b/drivers/gpu/drm/xe/xe_pat.h
@@ -26,8 +26,9 @@
 #define XELPG_PAT_WB_CACHE_1_WAY       3
 
 struct xe_gt;
-extern struct xe_device *xe;
+struct xe_device;
 
+int xe_pat_fill_info(struct xe_device *xe);
 void xe_pat_init(struct xe_gt *gt);
 void xe_pte_pat_init(struct xe_device *xe);
 unsigned int xe_pat_get_index(struct xe_device *xe, enum xe_cache_level cache);
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 791107dec045..24f2021aae22 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -22,6 +22,7 @@
 #include "xe_gt.h"
 #include "xe_macros.h"
 #include "xe_module.h"
+#include "xe_pat.h"
 #include "xe_pci_types.h"
 #include "xe_pm.h"
 #include "xe_step.h"
@@ -553,6 +554,7 @@ static int xe_info_init(struct xe_device *xe,
 	struct xe_tile *tile;
 	struct xe_gt *gt;
 	u8 id;
+	int err;
 
 	xe->info.platform = desc->platform;
 	xe->info.subplatform = subplatform_desc ?
@@ -601,6 +603,10 @@ static int xe_info_init(struct xe_device *xe,
 	xe->info.enable_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
 				  enable_display &&
 				  desc->has_display;
+
+	err = xe_pat_fill_info(xe);
+	if (err)
+		return err;
 	/*
 	 * All platforms have at least one primary GT.  Any platform with media
 	 * version 13 or higher has an additional dedicated media GT.  And
-- 
2.41.0

