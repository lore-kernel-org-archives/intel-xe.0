Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43BEDC10DC2
	for <intel-xe@archiver.kernel.org>; Thu, 30 Nov 2023 18:40:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17FD610E763;
	Thu, 30 Nov 2023 18:40:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD6CC10E763
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Nov 2023 18:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701369620; x=1732905620;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CRHIv7IqI3mXdnPnq3VycgaXLfBPHisCbCxAz3XmS80=;
 b=XDss55IEmKnDQxtZKbCUygv7n8fmFaIXDzoIVLervrVzybK/78kiuLo2
 3XqTNgP8o9G3q7tpHYxvmUxO2YEOrODKl7yPNn6eQS7AcMEZJpuVXw6D4
 kY/HEh4xe+4e13SrMBm8T0mqjqIqmaK5LxN8vyiJp+uX3yMOTYJUBN6jy
 Z89dy9gX+EB3IHw0zKIDLofltZsCNooLexHGrGzN8Ay/705opqwgCZss4
 lCMiysWU17G7hdQhhKtB4f3uYh9shfSknVRD/NesbDXxS33OqqulJyZ6f
 T38dd6rRRHLIvUS4xKAaa957HOoHPsfMWPvXEhjEhuosCBz1F9j2qC5vV g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="393111728"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="393111728"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 10:40:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="913294938"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="913294938"
Received: from stefanwe-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.252.60.146])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 10:40:19 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 30 Nov 2023 18:39:46 +0000
Message-Id: <20231130183955.7-8-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130183955.7-1-francois.dugast@intel.com>
References: <20231130183955.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 07/16] drm/xe/uapi: Align on a common way to
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
Cc: Francois Dugast <francois.dugast@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The uAPI provides queries which return arrays of elements. As of now
the format used in the struct is different depending on which element
is queried. Fix this for engines by applying the pattern below:

        struct drm_xe_query_Xs {
           __u32 num_Xs;
           struct drm_xe_X Xs[];
           ...
        }

Instead of directly returning an array of struct
drm_xe_query_engine_info, a new struct drm_xe_query_engines is
introduced. It contains itself an array of struct drm_xe_engine
which holds the information about each engine.

v2: Use plural for struct drm_xe_query_engines as multiple engines
    are returned (José Roberto de Souza)

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 31 ++++++++------
 include/uapi/drm/xe_drm.h     | 78 +++++++++++++++++++++--------------
 2 files changed, 65 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index a0e3b0c163f9..ad9f23e43920 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -53,7 +53,8 @@ static size_t calc_hw_engine_info_size(struct xe_device *xe)
 			i++;
 		}
 
-	return i * sizeof(struct drm_xe_query_engine_info);
+	return sizeof(struct drm_xe_query_engines) +
+		i * sizeof(struct drm_xe_engine);
 }
 
 typedef u64 (*__ktime_func_t)(void);
@@ -186,9 +187,9 @@ static int query_engines(struct xe_device *xe,
 			 struct drm_xe_device_query *query)
 {
 	size_t size = calc_hw_engine_info_size(xe);
-	struct drm_xe_query_engine_info __user *query_ptr =
+	struct drm_xe_query_engines __user *query_ptr =
 		u64_to_user_ptr(query->data);
-	struct drm_xe_query_engine_info *hw_engine_info;
+	struct drm_xe_query_engines *engines;
 	struct xe_hw_engine *hwe;
 	enum xe_hw_engine_id id;
 	struct xe_gt *gt;
@@ -202,8 +203,8 @@ static int query_engines(struct xe_device *xe,
 		return -EINVAL;
 	}
 
-	hw_engine_info = kmalloc(size, GFP_KERNEL);
-	if (!hw_engine_info)
+	engines = kmalloc(size, GFP_KERNEL);
+	if (!engines)
 		return -ENOMEM;
 
 	for_each_gt(gt, xe, gt_id)
@@ -211,22 +212,26 @@ static int query_engines(struct xe_device *xe,
 			if (xe_hw_engine_is_reserved(hwe))
 				continue;
 
-			hw_engine_info[i].instance.engine_class =
+			engines->engines[i].instance.engine_class =
 				xe_to_user_engine_class[hwe->class];
-			hw_engine_info[i].instance.engine_instance =
+			engines->engines[i].instance.engine_instance =
 				hwe->logical_instance;
-			hw_engine_info[i].instance.gt_id = gt->info.id;
-			hw_engine_info[i].instance.pad = 0;
-			memset(hw_engine_info->reserved, 0, sizeof(hw_engine_info->reserved));
+			engines->engines[i].instance.gt_id = gt->info.id;
+			engines->engines[i].instance.pad = 0;
+			memset(engines->engines[i].reserved, 0,
+			       sizeof(engines->engines[i].reserved));
 
 			i++;
 		}
 
-	if (copy_to_user(query_ptr, hw_engine_info, size)) {
-		kfree(hw_engine_info);
+	engines->pad = 0;
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
index 37b23708f992..782983cc4c49 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -127,9 +127,9 @@ struct xe_user_extension {
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
  */
 struct drm_xe_engine_class_instance {
@@ -153,13 +153,9 @@ struct drm_xe_engine_class_instance {
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
 
@@ -167,6 +163,22 @@ struct drm_xe_query_engine_info {
 	__u64 reserved[3];
 };
 
+/**
+ * struct drm_xe_query_engines - describe engines
+ *
+ * If a query is made with a struct @drm_xe_device_query where .query
+ * is equal to %DRM_XE_DEVICE_QUERY_ENGINES, then the reply uses an array of
+ * struct @drm_xe_query_engines in .data.
+ */
+struct drm_xe_query_engines {
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
@@ -466,28 +478,32 @@ struct drm_xe_query_topology_mask {
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
+ *     struct drm_xe_query_engines *engines;
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
+ *             engines->engines[i].instance.engine_class ==
+ *                 DRM_XE_ENGINE_CLASS_RENDER ? "RENDER":
+ *             engines->engines[i].instance.engine_class ==
+ *                 DRM_XE_ENGINE_CLASS_COPY ? "COPY":
+ *             engines->engines[i].instance.engine_class ==
+ *                 DRM_XE_ENGINE_CLASS_VIDEO_DECODE ? "VIDEO_DECODE":
+ *             engines->engines[i].instance.engine_class ==
+ *                 DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE ? "VIDEO_ENHANCE":
+ *             engines->engines[i].instance.engine_class ==
+ *                 DRM_XE_ENGINE_CLASS_COMPUTE ? "COMPUTE":
+ *             "UNKNOWN");
+ *     }
+ *     free(engines);
  */
 struct drm_xe_device_query {
 	/** @extensions: Pointer to the first extension struct, if any */
-- 
2.34.1

