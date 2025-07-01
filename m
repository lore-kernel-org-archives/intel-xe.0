Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5BF0C83F04
	for <intel-xe@archiver.kernel.org>; Tue,  1 Jul 2025 20:13:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 825C410E63D;
	Tue,  1 Jul 2025 20:13:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dNj7nC+X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1950D10E135
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Jul 2025 20:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751400812; x=1782936812;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0Qgl5UvrIkkD7wZuTJ45scVB/5PMhqg+n0XaL6jxMuY=;
 b=dNj7nC+X8oC91Sh1YzhcEHqxIQMO32n3+CzHn+GvVvPOtFCCk7ttEMZA
 9379ixdr5V9csui4OXVNU/FV+bT+oUBYKhc2ADy+fRnTo5buABrhFTS6g
 SaUYo5ubaTfCIekuBV4NPEJVdUpZjOLfLFz2GRXkIOZytgQLmDKTGg4xL
 D1rEjPRND7KG/4lYNK1cn5kTdkSOeegu4i8GHLZ8IvkzKIxcCIojHJ+6I
 soVLuXYoBp8EXQ3KX4sS6SxboqsJOn7N7vhd8VlHsF6b5AunxPW17vOCh
 t2BElCL2CLni855FvaMHuBQVALgnZ4snW4QUVJPvmWeTzibYSLL5Txmvq w==;
X-CSE-ConnectionGUID: vYe/iHD9S9uaxLvySQusbA==
X-CSE-MsgGUID: OC9CHyJ4QzCq6vucff89XA==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53545998"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="53545998"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 13:13:32 -0700
X-CSE-ConnectionGUID: OgMqg4LcTdGq04ZQGzviPA==
X-CSE-MsgGUID: 9G9AVbmISyaSAMzIPq5n6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="177539685"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 13:13:31 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH v4 7/7] drm/xe/xe_query: Use separate iterator while filling
 GT list
Date: Tue,  1 Jul 2025 13:13:28 -0700
Message-ID: <20250701201320.2514369-16-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250701201320.2514369-9-matthew.d.roper@intel.com>
References: <20250701201320.2514369-9-matthew.d.roper@intel.com>
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

The 'id' value updated by for_each_gt() is the uapi GT ID of the GTs
being iterated over, and may skip over values if a GT is not present on
the device.  Use a separate iterator for GT list array assignments to
ensure that the array will be filled properly on future platforms where
index in the GT query list may not match the uapi ID.

v2:
 - Include the missing increment of the iterator.  (Jonathan)

Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index e615b0916217..d517ec9ddcbf 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -368,6 +368,7 @@ static int query_gt_list(struct xe_device *xe, struct drm_xe_device_query *query
 	struct drm_xe_query_gt_list __user *query_ptr =
 		u64_to_user_ptr(query->data);
 	struct drm_xe_query_gt_list *gt_list;
+	int iter = 0;
 	u8 id;
 
 	if (query->size == 0) {
@@ -385,12 +386,12 @@ static int query_gt_list(struct xe_device *xe, struct drm_xe_device_query *query
 
 	for_each_gt(gt, xe, id) {
 		if (xe_gt_is_media_type(gt))
-			gt_list->gt_list[id].type = DRM_XE_QUERY_GT_TYPE_MEDIA;
+			gt_list->gt_list[iter].type = DRM_XE_QUERY_GT_TYPE_MEDIA;
 		else
-			gt_list->gt_list[id].type = DRM_XE_QUERY_GT_TYPE_MAIN;
-		gt_list->gt_list[id].tile_id = gt_to_tile(gt)->id;
-		gt_list->gt_list[id].gt_id = gt->info.id;
-		gt_list->gt_list[id].reference_clock = gt->info.reference_clock;
+			gt_list->gt_list[iter].type = DRM_XE_QUERY_GT_TYPE_MAIN;
+		gt_list->gt_list[iter].tile_id = gt_to_tile(gt)->id;
+		gt_list->gt_list[iter].gt_id = gt->info.id;
+		gt_list->gt_list[iter].reference_clock = gt->info.reference_clock;
 		/*
 		 * The mem_regions indexes in the mask below need to
 		 * directly identify the struct
@@ -406,19 +407,21 @@ static int query_gt_list(struct xe_device *xe, struct drm_xe_device_query *query
 		 * assumption.
 		 */
 		if (!IS_DGFX(xe))
-			gt_list->gt_list[id].near_mem_regions = 0x1;
+			gt_list->gt_list[iter].near_mem_regions = 0x1;
 		else
-			gt_list->gt_list[id].near_mem_regions =
+			gt_list->gt_list[iter].near_mem_regions =
 				BIT(gt_to_tile(gt)->id) << 1;
-		gt_list->gt_list[id].far_mem_regions = xe->info.mem_region_mask ^
-			gt_list->gt_list[id].near_mem_regions;
+		gt_list->gt_list[iter].far_mem_regions = xe->info.mem_region_mask ^
+			gt_list->gt_list[iter].near_mem_regions;
 
-		gt_list->gt_list[id].ip_ver_major =
+		gt_list->gt_list[iter].ip_ver_major =
 			REG_FIELD_GET(GMD_ID_ARCH_MASK, gt->info.gmdid);
-		gt_list->gt_list[id].ip_ver_minor =
+		gt_list->gt_list[iter].ip_ver_minor =
 			REG_FIELD_GET(GMD_ID_RELEASE_MASK, gt->info.gmdid);
-		gt_list->gt_list[id].ip_ver_rev =
+		gt_list->gt_list[iter].ip_ver_rev =
 			REG_FIELD_GET(GMD_ID_REVID, gt->info.gmdid);
+
+		iter++;
 	}
 
 	if (copy_to_user(query_ptr, gt_list, size)) {
-- 
2.49.0

