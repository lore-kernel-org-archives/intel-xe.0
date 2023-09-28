Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5606ECE7B1F
	for <intel-xe@archiver.kernel.org>; Thu, 28 Sep 2023 10:59:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16EBD10E613;
	Thu, 28 Sep 2023 10:59:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9564510E606
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Sep 2023 10:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695898764; x=1727434764;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yV9iKbsFcPoF48x6COJW9hR9UH0IXg94IYkHQOLlkQk=;
 b=if+yxoSIhLReZ/eBaPvSNIPktMwdffC0Dj/bv7Ie3KcmDGJ1ey6D6cGM
 pWmUQqtsz2vQMiIa5U2LzxBiuIonjADH9aQniTAD+xv9v3llW54bOP7Gl
 tqP8DfRXA4Ujo6msAjNWdybGG22fhMcnxjXrV7u5U4vhAD1/wGHIOJZx8
 B76Ekw2JoMMrVIcCFD4YSuUPNOlnFmTtmpBguYBoUj0zkpn6LwB6PuAT3
 9whZpJB6NzaGz1FpOke4lXkDJACAisTJ1+LN3lAMcDDD/qmeP5GC8PDUE
 +CHkIwRTX0M16Go+1aXSwWGKhZaWdYn0drtGPW84wXFZqVgi3fTQfE951 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="640205"
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; 
   d="scan'208";a="640205"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 03:59:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="923174508"
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; d="scan'208";a="923174508"
Received: from nsolmsdo-mobl.ger.corp.intel.com (HELO 8b338166fae8.intel.com)
 ([10.251.220.162])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 03:59:21 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 28 Sep 2023 10:58:42 +0000
Message-Id: <20230928105843.7-20-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230928105843.7-1-francois.dugast@intel.com>
References: <20230928105843.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 19/20] drm/xe/uapi: Rename gts to gt_list
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
Cc: Francois Dugast <francois.dugast@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Rodrigo Vivi <rodrigo.vivi@intel.com>

During the uapi review it was identified a possible confusion
with the plural of acronym with a new acronym. So the
recommendation is to go with gt_list instead.

Suggested-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 40 +++++++++++++++++------------------
 include/uapi/drm/xe_drm.h     | 18 ++++++++--------
 2 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index a698479f292a..e47639fa2bba 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -347,14 +347,14 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
 	return 0;
 }
 
-static int query_gts(struct xe_device *xe, struct drm_xe_device_query *query)
+static int query_gt_list(struct xe_device *xe, struct drm_xe_device_query *query)
 {
 	struct xe_gt *gt;
-	size_t size = sizeof(struct drm_xe_query_gts) +
+	size_t size = sizeof(struct drm_xe_query_gt_list) +
 		xe->info.gt_count * sizeof(struct drm_xe_query_gt);
-	struct drm_xe_query_gts __user *query_ptr =
+	struct drm_xe_query_gt_list __user *query_ptr =
 		u64_to_user_ptr(query->data);
-	struct drm_xe_query_gts *gts;
+	struct drm_xe_query_gt_list *gt_list;
 	u8 id;
 
 	if (query->size == 0) {
@@ -364,34 +364,34 @@ static int query_gts(struct xe_device *xe, struct drm_xe_device_query *query)
 		return -EINVAL;
 	}
 
-	gts = kzalloc(size, GFP_KERNEL);
-	if (!gts)
+	gt_list = kzalloc(size, GFP_KERNEL);
+	if (!gt_list)
 		return -ENOMEM;
 
-	gts->num_gt = xe->info.gt_count;
+	gt_list->num_gt = xe->info.gt_count;
 	for_each_gt(gt, xe, id) {
 		if (xe_gt_is_media_type(gt))
-			gts->gts[id].type = XE_QUERY_GT_TYPE_MEDIA;
+			gt_list->gt_list[id].type = XE_QUERY_GT_TYPE_MEDIA;
 		else if (gt_to_tile(gt)->id > 0)
-			gts->gts[id].type = XE_QUERY_GT_TYPE_REMOTE;
+			gt_list->gt_list[id].type = XE_QUERY_GT_TYPE_REMOTE;
 		else
-			gts->gts[id].type = XE_QUERY_GT_TYPE_MAIN;
-		gts->gts[id].gt_id = gt->info.id;
-		gts->gts[id].clock_freq = gt->info.clock_freq;
+			gt_list->gt_list[id].type = XE_QUERY_GT_TYPE_MAIN;
+		gt_list->gt_list[id].gt_id = gt->info.id;
+		gt_list->gt_list[id].clock_freq = gt->info.clock_freq;
 		if (!IS_DGFX(xe))
-			gts->gts[id].native_mem_regions = 0x1;
+			gt_list->gt_list[id].native_mem_regions = 0x1;
 		else
-			gts->gts[id].native_mem_regions =
+			gt_list->gt_list[id].native_mem_regions =
 				BIT(gt_to_tile(gt)->id) << 1;
-		gts->gts[id].slow_mem_regions = xe->info.mem_region_mask ^
-			gts->gts[id].native_mem_regions;
+		gt_list->gt_list[id].slow_mem_regions = xe->info.mem_region_mask ^
+			gt_list->gt_list[id].native_mem_regions;
 	}
 
-	if (copy_to_user(query_ptr, gts, size)) {
-		kfree(gts);
+	if (copy_to_user(query_ptr, gt_list, size)) {
+		kfree(gt_list);
 		return -EFAULT;
 	}
-	kfree(gts);
+	kfree(gt_list);
 
 	return 0;
 }
@@ -503,7 +503,7 @@ static int (* const xe_query_funcs[])(struct xe_device *xe,
 	query_engines,
 	query_memory_usage,
 	query_config,
-	query_gts,
+	query_gt_list,
 	query_hwconfig,
 	query_gt_topology,
 	query_engine_cycles,
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 538873361d17..b02a63270972 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -337,7 +337,7 @@ struct drm_xe_query_config {
 /**
  * struct drm_xe_query_gt - describe an individual GT.
  *
- * To be used with drm_xe_query_gts, which will return a list with all the
+ * To be used with drm_xe_query_gt_list, which will return a list with all the
  * existing GT individual descriptions.
  * Graphics Technology (GT) is a subset of a GPU/tile that is responsible for
  * implementing graphics and/or media operations.
@@ -374,19 +374,19 @@ struct drm_xe_query_gt {
 };
 
 /**
- * struct drm_xe_query_gts - describe GTs
+ * struct drm_xe_query_gt_list - A list with GT description items.
  *
  * If a query is made with a struct drm_xe_device_query where .query
- * is equal to DRM_XE_DEVICE_QUERY_GTS, then the reply uses struct
- * drm_xe_query_gts in .data.
+ * is equal to DRM_XE_DEVICE_QUERY_GT_LIST, then the reply uses struct
+ * drm_xe_query_gt_list in .data.
  */
-struct drm_xe_query_gts {
-	/** @num_gt: number of GTs returned in gts */
+struct drm_xe_query_gt_list {
+	/** @num_gt: number of GT items returned in gt_list */
 	__u32 num_gt;
 	/** @pad: MBZ */
 	__u32 pad;
-	/** @gts: The GT list returned for this device */
-	struct drm_xe_query_gt gts[];
+	/** @gt_list: The GT list returned for this device */
+	struct drm_xe_query_gt gt_list[];
 };
 
 /**
@@ -479,7 +479,7 @@ struct drm_xe_device_query {
 #define DRM_XE_DEVICE_QUERY_ENGINES		0
 #define DRM_XE_DEVICE_QUERY_MEM_USAGE		1
 #define DRM_XE_DEVICE_QUERY_CONFIG		2
-#define DRM_XE_DEVICE_QUERY_GTS			3
+#define DRM_XE_DEVICE_QUERY_GT_LIST		3
 #define DRM_XE_DEVICE_QUERY_HWCONFIG		4
 #define DRM_XE_DEVICE_QUERY_GT_TOPOLOGY		5
 #define DRM_XE_DEVICE_QUERY_ENGINE_CYCLES	6
-- 
2.34.1

