Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B66CCC4167D
	for <intel-xe@archiver.kernel.org>; Fri,  3 Nov 2023 14:36:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3797D10EA1B;
	Fri,  3 Nov 2023 14:36:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0645A10EA13
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Nov 2023 14:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699022168; x=1730558168;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5QKkVjB0g2kWAaATcsMykyzMTRTDnhwwLjYv/GCUwvY=;
 b=d80X6vhhPdrJajaDKB/SFAHBtU7dDSvQkJbxheZSx6Bk+03EWx7qjWQ2
 xY0JQs8Vbb5M9p0jlklpVpS3hypQ+q1NK8g745UR5sVh3Fh3U0+Sc/MrF
 i/98uNVlU5zOYzg+8Zlr9egtMv8Bi2LGYosmzw5dLeS1mG0xqOc/J1j6Y
 0BuLy9uEtJEDelEe9AulGZUffEKi9xjfZokSgHXbMrmmq4ildxk3bYfbr
 jiPvwuN6/yAlXdrlpagL28CIp84DP5C5wpsWyuCRvMp64ouBGQ00yIVUR
 oHrnlf4cohum9VhC72vxNzmCDubFymQWCrt0kJVqATt8bdLK7EobKjmmV Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="387843563"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="387843563"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 07:36:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="1008832585"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="1008832585"
Received: from mtisan-mobl1.ger.corp.intel.com (HELO 8dd9ac0a63b4.intel.com)
 ([10.249.42.195])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 07:36:06 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  3 Nov 2023 14:34:54 +0000
Message-Id: <20231103143456.7-49-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231103143456.7-1-francois.dugast@intel.com>
References: <20231103143456.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 48/50] drm/xe/uapi: Align on a common way to
 return arrays (engines)
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
Cc: Francois Dugast <francois.dugast@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The uAPI provides queries which return arrays of elements. As of now
the format used in the struct is different depending on which element
is queried. Fix this for engines by applying the pattern below:

        struct drm_xe_query_X {
           __u32 num_X;
           struct drm_xe_X Xs[];
           ...
        }

Instead of directly returning an array of struct
drm_xe_query_engine_info, a new struct drm_xe_query_engine is
introduced. It contains itself an array of struct drm_xe_engine
which holds the information about each engine.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 41 +++++++++++---------
 include/uapi/drm/xe_drm.h     | 73 ++++++++++++++++++++---------------
 2 files changed, 64 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 184ecd9820d1..93edb6c572ce 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -53,7 +53,8 @@ static size_t calc_hw_engine_info_size(struct xe_device *xe)
 			i++;
 		}
 
-	return i * sizeof(struct drm_xe_query_engine_info);
+	return sizeof(struct drm_xe_query_engine) +
+		i * sizeof(struct drm_xe_engine);
 }
 
 typedef u64 (*__ktime_func_t)(void);
@@ -180,9 +181,9 @@ static int query_engines(struct xe_device *xe,
 			 struct drm_xe_device_query *query)
 {
 	size_t size = calc_hw_engine_info_size(xe);
-	struct drm_xe_query_engine_info __user *query_ptr =
+	struct drm_xe_query_engine __user *query_ptr =
 		u64_to_user_ptr(query->data);
-	struct drm_xe_query_engine_info *hw_engine_info;
+	struct drm_xe_query_engine *engines;
 	struct xe_hw_engine *hwe;
 	enum xe_hw_engine_id id;
 	struct xe_gt *gt;
@@ -196,8 +197,8 @@ static int query_engines(struct xe_device *xe,
 		return -EINVAL;
 	}
 
-	hw_engine_info = kmalloc(size, GFP_KERNEL);
-	if (!hw_engine_info)
+	engines = kmalloc(size, GFP_KERNEL);
+	if (!engines)
 		return -ENOMEM;
 
 	for_each_gt(gt, xe, gt_id)
@@ -205,18 +206,18 @@ static int query_engines(struct xe_device *xe,
 			if (xe_hw_engine_is_reserved(hwe))
 				continue;
 
-			hw_engine_info[i].instance.engine_class =
+			engines->engines[i].instance.engine_class =
 				xe_to_user_engine_class[hwe->class];
-			hw_engine_info[i].instance.engine_instance =
+			engines->engines[i].instance.engine_instance =
 				hwe->logical_instance;
 			/*
 			 * Scheduling Group ID is the global GT ID for the
 			 * current hardware, although the API is flexible
 			 */
-			hw_engine_info[i].instance.sched_group_id = gt->info.id;
-			hw_engine_info[i].instance.pad = 0;
-			hw_engine_info[i].tile_id = gt_to_tile(gt)->id;
-			hw_engine_info[i].gt_id = gt->info.id;
+			engines->engines[i].instance.sched_group_id = gt->info.id;
+			engines->engines[i].instance.pad = 0;
+			engines->engines[i].tile_id = gt_to_tile(gt)->id;
+			engines->engines[i].gt_id = gt->info.id;
 
 			/*
 			 * The mem_regions indexes in the mask below need to
@@ -233,22 +234,24 @@ static int query_engines(struct xe_device *xe,
 			 * assumption.
 			 */
 			if (!IS_DGFX(xe))
-				hw_engine_info[i].near_mem_regions = 0x1;
+				engines->engines[i].near_mem_regions = 0x1;
 			else
-				hw_engine_info[i].near_mem_regions =
+				engines->engines[i].near_mem_regions =
 					BIT(gt_to_tile(gt)->id) << 1;
-			hw_engine_info[i].far_mem_regions = xe->info.mem_region_mask ^
-				hw_engine_info[i].near_mem_regions;
-			memset(hw_engine_info->reserved, 0, sizeof(hw_engine_info->reserved));
+			engines->engines[i].far_mem_regions = xe->info.mem_region_mask ^
+				engines->engines[i].near_mem_regions;
+			memset(engines->engines->reserved, 0, sizeof(engines->engines->reserved));
 
 			i++;
 		}
 
-	if (copy_to_user(query_ptr, hw_engine_info, size)) {
-		kfree(hw_engine_info);
+	engines->num_engines = i;
+
+	if (copy_to_user(query_ptr, engines, size)) {
+		kfree(engines);
 		return -EFAULT;
 	}
-	kfree(hw_engine_info);
+	kfree(engines);
 
 	return 0;
 }
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index e4ecd83ea5d7..85dc0d343ea8 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -181,9 +181,9 @@ struct drm_xe_ext_set_property {
 /**
  * struct drm_xe_engine_class_instance - instance of an engine class
  *
- * It is returned as part of the @drm_xe_query_engine_info, but it also is
- * used as the input of engine selection for both @drm_xe_exec_queue_create
- * and @drm_xe_query_engine_cycles
+ * It is returned as part of the @drm_xe_engine, but it also is used as
+ * the input of engine selection for both @drm_xe_exec_queue_create and
+ * @drm_xe_query_engine_cycles
  *
  * The @engine_class can be:
  *  - %DRM_XE_ENGINE_CLASS_RENDER
@@ -220,13 +220,9 @@ struct drm_xe_engine_class_instance {
 };
 
 /**
- * struct drm_xe_query_engine_info - describe hardware engine
- *
- * If a query is made with a struct @drm_xe_device_query where .query
- * is equal to %DRM_XE_DEVICE_QUERY_ENGINES, then the reply uses an array of
- * struct @drm_xe_query_engine_info in .data.
+ * struct drm_xe_engine - describe hardware engine
  */
-struct drm_xe_query_engine_info {
+struct drm_xe_engine {
 	/** @instance: The @drm_xe_engine_class_instance */
 	struct drm_xe_engine_class_instance instance;
 
@@ -262,6 +258,22 @@ struct drm_xe_query_engine_info {
 	__u64 reserved[5];
 };
 
+/**
+ * struct drm_xe_query_engine - describe engines
+ *
+ * If a query is made with a struct @drm_xe_device_query where .query
+ * is equal to %DRM_XE_DEVICE_QUERY_ENGINES, then the reply uses an array of
+ * struct @drm_xe_query_engine in .data.
+ */
+struct drm_xe_query_engine {
+	/** @num_engines: number of engines returned in @engines */
+	__u32 num_engines;
+	/** @pad: MBZ */
+	__u32 pad;
+	/** @engines: The returned engines for this device */
+	struct drm_xe_engine engines[];
+};
+
 /**
  * enum drm_xe_memory_class - Supported memory classes.
  */
@@ -624,28 +636,27 @@ struct drm_xe_query_uc_fw_version {
  *
  * .. code-block:: C
  *
- *	struct drm_xe_engine_class_instance *hwe;
- *	struct drm_xe_device_query query = {
- *		.extensions = 0,
- *		.query = DRM_XE_DEVICE_QUERY_ENGINES,
- *		.size = 0,
- *		.data = 0,
- *	};
- *	ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query);
- *	hwe = malloc(query.size);
- *	query.data = (uintptr_t)hwe;
- *	ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query);
- *	int num_engines = query.size / sizeof(*hwe);
- *	for (int i = 0; i < num_engines; i++) {
- *		printf("Engine %d: %s\n", i,
- *			hwe[i].engine_class == DRM_XE_ENGINE_CLASS_RENDER ? "RENDER":
- *			hwe[i].engine_class == DRM_XE_ENGINE_CLASS_COPY ? "COPY":
- *			hwe[i].engine_class == DRM_XE_ENGINE_CLASS_VIDEO_DECODE ? "VIDEO_DECODE":
- *			hwe[i].engine_class == DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE ? "VIDEO_ENHANCE":
- *			hwe[i].engine_class == DRM_XE_ENGINE_CLASS_COMPUTE ? "COMPUTE":
- *			"UNKNOWN");
- *	}
- *	free(hwe);
+ *     struct drm_xe_query_engine *engines;
+ *     struct drm_xe_device_query query = {
+ *         .extensions = 0,
+ *         .query = DRM_XE_DEVICE_QUERY_ENGINES,
+ *         .size = 0,
+ *         .data = 0,
+ *     };
+ *     ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query);
+ *     engines = malloc(query.size);
+ *     query.data = (uintptr_t)engines;
+ *     ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query);
+ *     for (int i = 0; i < engines->num_engines; i++) {
+ *         printf("Engine %d: %s\n", i,
+ *             engines->engines[i].instance.engine_class == DRM_XE_ENGINE_CLASS_RENDER ? "RENDER":
+ *             engines->engines[i].instance.engine_class == DRM_XE_ENGINE_CLASS_COPY ? "COPY":
+ *             engines->engines[i].instance.engine_class == DRM_XE_ENGINE_CLASS_VIDEO_DECODE ? "VIDEO_DECODE":
+ *             engines->engines[i].instance.engine_class == DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE ? "VIDEO_ENHANCE":
+ *             engines->engines[i].instance.engine_class == DRM_XE_ENGINE_CLASS_COMPUTE ? "COMPUTE":
+ *             "UNKNOWN");
+ *     }
+ *     free(engines);
  */
 struct drm_xe_device_query {
 	/** @extensions: Pointer to the first extension struct, if any */
-- 
2.34.1

