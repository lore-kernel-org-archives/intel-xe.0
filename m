Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C833EEAA51
	for <intel-xe@archiver.kernel.org>; Thu, 14 Sep 2023 15:37:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E790B10E577;
	Thu, 14 Sep 2023 15:37:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 543CD10E577
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Sep 2023 15:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694705870; x=1726241870;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QvHdEtfVtrrEhzizQXnfCcvn8nm6ct05GAulqDGBWWQ=;
 b=ACnivdRB9RBSyeSYIJ1Ld6yDAOaCvo2LotfdptsOQpMouBQLEcTydZXf
 XNQXC630zpF0jlVIcg07hfNsFj4dxtkys0fsvNQECHQjG0fUCngCV9cWm
 TtAxmW2IaAYropVgxZ9xw8890+8hAL3PcTXpS0UBUvbBUE5Adgx1ZdDO7
 ONa/ndh9oGAMxqAmrpTUMVvmHinXncQqUhScsb4Ha/+tQIJkDT+zYbU/f
 Ei6whhqKCyEgZuQTOi7Sas+est9QfZnscAlbNfr/Ceoc5RiLxSASM0ZQ6
 aCRS+ajjzvY4MSg7+VIzCJD5WjRBABlK86c5uQhUmfKcekqmX6vaiNP3p w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="376327323"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="376327323"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 08:37:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="779686189"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="779686189"
Received: from ohararox-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.24.126])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 08:32:22 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 14 Sep 2023 16:31:15 +0100
Message-ID: <20230914153112.455547-10-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230914153112.455547-8-matthew.auld@intel.com>
References: <20230914153112.455547-8-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 2/6] drm/xe: move pat_table into device info
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

v2 (Lucas):
  - s/ENODEV/ENOTSUPP/
  - s/xe_pat_fill_info/xe_pat_init_early/
  - Prefer new pat substruct in xe_info.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Pallavi Mishra <pallavi.mishra@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 11 ++++++++
 drivers/gpu/drm/xe/xe_pat.c          | 39 ++++++++++++++++++----------
 drivers/gpu/drm/xe/xe_pat.h          |  1 +
 drivers/gpu/drm/xe/xe_pci.c          |  7 +++++
 4 files changed, 44 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 5037b8c180b8..6c50d0f03466 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -238,6 +238,17 @@ struct xe_device {
 		/** @enable_display: display enabled */
 		u8 enable_display:1;
 
+		/** @pat: Platform information related to PAT settings. */
+		struct {
+			/**
+			 * @table: The PAT table encoding for every pat_index
+			 * supported by the platform.
+			 */
+			const u32 *table;
+			/** @n_entries: The number of entries in the @table */
+			int n_entries;
+		} pat;
+
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
 		const struct intel_display_device_info *display;
 		struct intel_display_runtime_info display_runtime;
diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index 32b0c922e7fa..aa2c5eb88266 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -106,24 +106,17 @@ static void program_pat_mcr(struct xe_gt *gt, const u32 table[], int n_entries)
 	}
 }
 
-void xe_pat_init(struct xe_gt *gt)
+int xe_pat_init_early(struct xe_device *xe)
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
+		xe->info.pat.table = mtl_pat_table;
+		xe->info.pat.n_entries = ARRAY_SIZE(mtl_pat_table);
 	} else if (xe->info.platform == XE_PVC || xe->info.platform == XE_DG2) {
-		program_pat_mcr(gt, pvc_pat_table, ARRAY_SIZE(pvc_pat_table));
+		xe->info.pat.table = pvc_pat_table;
+		xe->info.pat.n_entries = ARRAY_SIZE(pvc_pat_table);
 	} else if (GRAPHICS_VERx100(xe) <= 1210) {
-		program_pat(gt, tgl_pat_table, ARRAY_SIZE(tgl_pat_table));
+		xe->info.pat.table = tgl_pat_table;
+		xe->info.pat.n_entries = ARRAY_SIZE(tgl_pat_table);
 	} else {
 		/*
 		 * Going forward we expect to need new PAT settings for most
@@ -135,7 +128,25 @@ void xe_pat_init(struct xe_gt *gt)
 		 */
 		drm_err(&xe->drm, "Missing PAT table for platform with graphics version %d.%02d!\n",
 			GRAPHICS_VER(xe), GRAPHICS_VERx100(xe) % 100);
+		return -ENOTSUPP;
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
+		program_pat(gt, xe->info.pat.table, xe->info.pat.n_entries);
+	else
+		program_pat_mcr(gt, xe->info.pat.table, xe->info.pat.n_entries);
 }
 
 void xe_pte_pat_init(struct xe_device *xe)
diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
index 5e71bd98d787..2f89503233b9 100644
--- a/drivers/gpu/drm/xe/xe_pat.h
+++ b/drivers/gpu/drm/xe/xe_pat.h
@@ -28,6 +28,7 @@
 struct xe_gt;
 struct xe_device;
 
+int xe_pat_init_early(struct xe_device *xe);
 void xe_pat_init(struct xe_gt *gt);
 void xe_pte_pat_init(struct xe_device *xe);
 unsigned int xe_pat_get_index(struct xe_device *xe, enum xe_cache_level cache);
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index dc233a1226bd..2806311bd6a4 100644
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
@@ -531,6 +532,7 @@ static int xe_info_init(struct xe_device *xe,
 	struct xe_tile *tile;
 	struct xe_gt *gt;
 	u8 id;
+	int err;
 
 	xe->info.platform = desc->platform;
 	xe->info.subplatform = subplatform_desc ?
@@ -579,6 +581,11 @@ static int xe_info_init(struct xe_device *xe,
 	xe->info.enable_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
 				  enable_display &&
 				  desc->has_display;
+
+	err = xe_pat_init_early(xe);
+	if (err)
+		return err;
+
 	/*
 	 * All platforms have at least one primary GT.  Any platform with media
 	 * version 13 or higher has an additional dedicated media GT.  And
-- 
2.41.0

