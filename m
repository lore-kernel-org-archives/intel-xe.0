Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A7A0C10DC2
	for <intel-xe@archiver.kernel.org>; Thu, 30 Nov 2023 18:40:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A51B10E763;
	Thu, 30 Nov 2023 18:40:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8101B10E07C
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Nov 2023 18:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701369615; x=1732905615;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r3v5Hq1+tFBvLYsBoYVlMD9ZxjBdNAFcOvJUo+Q6j1k=;
 b=FQckqxnptUEWwIY75bvuy1ZlvUG5LyjRucIpMRSD0SreLzl4sIWQuz9c
 /pyScnAXrCLw3q+hI8YU3mLQLF41egp5uDEBk6cQfCFui8adPE5uVQu45
 v38gO0ms2fpBEcSlvwLfnYzBcXZ4UI2VGvQv8fx2oQqQLEVDNM7OoIstu
 oab58FCVq4EktZB2oeRJz4CNXV0LscflymXZQ71+RrVpc61oAHkKZUf1u
 66S8RLq/5yhMUejLs1L8T3QHOQOuQyt1653GMcMEZrdoynP+RhA1sgd1+
 DSXqVyvtDiEEnQ3ZaVdI3RCc+QU3+xHRbxkj1aviw0QJY5mPNrQkRTo6I w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="393111720"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="393111720"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 10:40:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="913294918"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="913294918"
Received: from stefanwe-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.252.60.146])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 10:40:14 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 30 Nov 2023 18:39:42 +0000
Message-Id: <20231130183955.7-4-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130183955.7-1-francois.dugast@intel.com>
References: <20231130183955.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 03/16] drm/xe: Make
 DRM_XE_DEVICE_QUERY_ENGINES future proof
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

From: José Roberto de Souza <jose.souza@intel.com>

We have at least 2 future features(OA and future media engines
capabilities) that will require Xe to provide more information about
engines to UMDs.

But this information should not just be added to
drm_xe_engine_class_instance for a couple of reasons:
- drm_xe_engine_class_instance is used as input to other structs/uAPIs
and those uAPIs don't care about any of these future new engine fields
- those new fields are useless information after initialization for
some UMDs, so it should not need to carry that around

So here my proposal is to make DRM_XE_DEVICE_QUERY_ENGINES return an
array of drm_xe_query_engine_info that contain
drm_xe_engine_class_instance and 3 u64s to be used for future features.

Reference OA:
https://patchwork.freedesktop.org/patch/558362/?series=121084&rev=6

v2: Reduce reserved[] to 3 u64 (Matthew Brost)

Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
[Rodrigo Rebased]
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 15 ++++++++-------
 include/uapi/drm/xe_drm.h     | 24 +++++++++++++++++++++++-
 2 files changed, 31 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 61a7d92b7e88..0cbfeaeb1330 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -53,7 +53,7 @@ static size_t calc_hw_engine_info_size(struct xe_device *xe)
 			i++;
 		}
 
-	return i * sizeof(struct drm_xe_engine_class_instance);
+	return i * sizeof(struct drm_xe_query_engine_info);
 }
 
 typedef u64 (*__ktime_func_t)(void);
@@ -186,9 +186,9 @@ static int query_engines(struct xe_device *xe,
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
@@ -211,12 +211,13 @@ static int query_engines(struct xe_device *xe,
 			if (xe_hw_engine_is_reserved(hwe))
 				continue;
 
-			hw_engine_info[i].engine_class =
+			hw_engine_info[i].instance.engine_class =
 				xe_to_user_engine_class[hwe->class];
-			hw_engine_info[i].engine_instance =
+			hw_engine_info[i].instance.engine_instance =
 				hwe->logical_instance;
-			hw_engine_info[i].gt_id = gt->info.id;
-			hw_engine_info[i].pad = 0;
+			hw_engine_info[i].instance.gt_id = gt->info.id;
+			hw_engine_info[i].instance.pad = 0;
+			memset(hw_engine_info->reserved, 0, sizeof(hw_engine_info->reserved));
 
 			i++;
 		}
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 20bf2aa89e2c..921126465685 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -124,7 +124,14 @@ struct xe_user_extension {
 #define DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_GET_PROPERTY, struct drm_xe_exec_queue_get_property)
 #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
 
-/** struct drm_xe_engine_class_instance - instance of an engine class */
+/**
+ * struct drm_xe_engine_class_instance - instance of an engine class
+ *
+ * It is returned as part of the @drm_xe_query_engine_info, but it also is
+ * used as the input of engine selection for both @drm_xe_exec_queue_create
+ * and @drm_xe_query_engine_cycles
+ *
+ */
 struct drm_xe_engine_class_instance {
 #define DRM_XE_ENGINE_CLASS_RENDER		0
 #define DRM_XE_ENGINE_CLASS_COPY		1
@@ -145,6 +152,21 @@ struct drm_xe_engine_class_instance {
 	__u16 pad;
 };
 
+/**
+ * struct drm_xe_query_engine_info - describe hardware engine
+ *
+ * If a query is made with a struct @drm_xe_device_query where .query
+ * is equal to %DRM_XE_DEVICE_QUERY_ENGINES, then the reply uses an array of
+ * struct @drm_xe_query_engine_info in .data.
+ */
+struct drm_xe_query_engine_info {
+	/** @instance: The @drm_xe_engine_class_instance */
+	struct drm_xe_engine_class_instance instance;
+
+	/** @reserved: Reserved */
+	__u64 reserved[3];
+};
+
 /**
  * enum drm_xe_memory_class - Supported memory classes.
  */
-- 
2.34.1

