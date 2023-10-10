Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2471DCD8C8F
	for <intel-xe@archiver.kernel.org>; Tue, 10 Oct 2023 14:33:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7FDA10E16C;
	Tue, 10 Oct 2023 14:33:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2521D10E16C
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Oct 2023 14:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696948422; x=1728484422;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WUxRK4ywITQL39/N27y0HRHVUX4rFsI8wSwg2pCdpa4=;
 b=U0nJwL9kRAixmPD56Cqm0nWxx8ImSfj8GDWiCAWNxkuGcVJ3ebQOIFaL
 yaPh8RDoOJtDPrA+EkaO1aWslw94Hvhv82tJqd21jiyKYo3s4e3adbn/v
 V0vMpgWJOJhgLOC13U6jno/VhdRwiVG7lIKhXp0o2DO7SQkSTaEU9Zace
 T0jMQ+L2RnDlHjQAdTNW0G+ivqBEKMrk5K3MuCuwmrQ2okI7rlnatpfsg
 MLKQYaY0qhciTRTiTsKL2XtmmUyoXV4PfgDxoOurhG4mqc+eEC47wz+uc
 eyi/vWd7YcefKhCgYXnlmuyTVQqelT95nUrACIysrkRtdizZZu54HAVS4 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="374753158"
X-IronPort-AV: E=Sophos;i="6.03,213,1694761200"; d="scan'208";a="374753158"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2023 07:18:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="782894745"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; d="scan'208";a="782894745"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2023 07:18:05 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 10 Oct 2023 07:17:43 -0700
Message-ID: <20231010141743.19474-1-jose.souza@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Make DRM_XE_DEVICE_QUERY_ENGINES future
 proof
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

We have at least 2 future features(OA and future media engines capabilities)
that will require Xe to provide more information about engines to UMDs.

But this information should not just be added to
drm_xe_engine_class_instance for a couple of reasons:
- drm_xe_engine_class_instance is used as input to other structs/uAPIs
and those uAPIs don't care about any of these future new engine fields
- those new fields are useless information after initialization for
some UMDs, so it should not need to carry that around

So here my proposal is to make DRM_XE_DEVICE_QUERY_ENGINES return an
array of drm_xe_query_engine_info that contain
drm_xe_engine_class_instance and 3 u64s to be used for future features.

Reference OA: https://patchwork.freedesktop.org/patch/558362/?series=121084&rev=6
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 13 ++++-----
 include/uapi/drm/xe_drm.h     | 50 ++++++++++++++++++++++-------------
 2 files changed, 39 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index a951205100fea..b825ee07d760c 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -42,16 +42,16 @@ static size_t calc_hw_engine_info_size(struct xe_device *xe)
 			i++;
 		}
 
-	return i * sizeof(struct drm_xe_engine_class_instance);
+	return i * sizeof(struct drm_xe_query_engine_info);
 }
 
 static int query_engines(struct xe_device *xe,
 			 struct drm_xe_device_query *query)
 {
 	size_t size = calc_hw_engine_info_size(xe);
-	struct drm_xe_engine_class_instance __user *query_ptr =
+	struct drm_xe_query_engine_info __user *query_ptr =
 		u64_to_user_ptr(query->data);
-	struct drm_xe_engine_class_instance *hw_engine_info;
+	struct drm_xe_query_engine_info *hw_engine_info;
 	struct xe_hw_engine *hwe;
 	enum xe_hw_engine_id id;
 	struct xe_gt *gt;
@@ -74,11 +74,12 @@ static int query_engines(struct xe_device *xe,
 			if (xe_hw_engine_is_reserved(hwe))
 				continue;
 
-			hw_engine_info[i].engine_class =
+			hw_engine_info[i].instance.engine_class =
 				xe_to_user_engine_class[hwe->class];
-			hw_engine_info[i].engine_instance =
+			hw_engine_info[i].instance.engine_instance =
 				hwe->logical_instance;
-			hw_engine_info[i++].gt_id = gt->info.id;
+			hw_engine_info[i].instance.gt_id = gt->info.id;
+			memset(hw_engine_info->rsvd, 0, sizeof(hw_engine_info->rsvd));
 		}
 
 	if (copy_to_user(query_ptr, hw_engine_info, size)) {
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index d48d8e3c898ce..24be30b67625b 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -346,6 +346,38 @@ struct drm_xe_query_topology_mask {
 	__u8 mask[];
 };
 
+/** struct drm_xe_engine_class_instance - instance of an engine class */
+struct drm_xe_engine_class_instance {
+#define DRM_XE_ENGINE_CLASS_RENDER		0
+#define DRM_XE_ENGINE_CLASS_COPY		1
+#define DRM_XE_ENGINE_CLASS_VIDEO_DECODE	2
+#define DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE	3
+#define DRM_XE_ENGINE_CLASS_COMPUTE		4
+	/*
+	 * Kernel only class (not actual hardware engine class). Used for
+	 * creating ordered queues of VM bind operations.
+	 */
+#define DRM_XE_ENGINE_CLASS_VM_BIND		5
+	__u16 engine_class;
+
+	__u16 engine_instance;
+	__u16 gt_id;
+
+	__u16 pad;
+};
+
+/**
+ * struct drm_xe_query_engine_info - describe hardware engine
+ *
+ * If a query is made with a struct drm_xe_device_query where .query
+ * is equal to DRM_XE_DEVICE_QUERY_ENGINES, then the reply uses an array of
+ * struct drm_xe_query_engine_info in .data.
+ */
+struct drm_xe_query_engine_info {
+	struct drm_xe_engine_class_instance instance;
+	__u64 rsvd[3];
+};
+
 /**
  * struct drm_xe_device_query - main structure to query device information
  *
@@ -732,24 +764,6 @@ struct drm_xe_exec_queue_set_property {
 	__u64 reserved[2];
 };
 
-/** struct drm_xe_engine_class_instance - instance of an engine class */
-struct drm_xe_engine_class_instance {
-#define DRM_XE_ENGINE_CLASS_RENDER		0
-#define DRM_XE_ENGINE_CLASS_COPY		1
-#define DRM_XE_ENGINE_CLASS_VIDEO_DECODE	2
-#define DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE	3
-#define DRM_XE_ENGINE_CLASS_COMPUTE		4
-	/*
-	 * Kernel only class (not actual hardware engine class). Used for
-	 * creating ordered queues of VM bind operations.
-	 */
-#define DRM_XE_ENGINE_CLASS_VM_BIND		5
-	__u16 engine_class;
-
-	__u16 engine_instance;
-	__u16 gt_id;
-};
-
 struct drm_xe_exec_queue_create {
 #define XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY               0
 	/** @extensions: Pointer to the first extension struct, if any */
-- 
2.42.0

