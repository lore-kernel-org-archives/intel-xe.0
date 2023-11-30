Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D0AAC4167B
	for <intel-xe@archiver.kernel.org>; Thu, 30 Nov 2023 18:40:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAB0910E06F;
	Thu, 30 Nov 2023 18:40:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D685E10E75D
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Nov 2023 18:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701369633; x=1732905633;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CQGrHxdVRWr5nNGwmqugZqk20Ic+X8K+G4f9ka355d4=;
 b=A9U6ydOYX/khig0jryvWlgLfmMiqKGVrnYnrw3qG/onZOYB3XBfvkh+O
 ZbZUnc/6ZPXTgPkGdfWTrFONT6/Pb+sVmuaMswepfOuN7kuoQjlgbiGED
 IMUekDDexPR6E7UpBZeNianOR68IflZYiRp9qvoUt+E5Yzcpj2Mqe2kOW
 9geUzXq4b1Il6LTb6o5cSwZZOOWXZ1AjYprW/LHB5n8FNaLY1MGoLJEum
 eq+ps5Prw1uNXYqxZDH9d+yXVls4MyimGiqoRo6Qih286OEP0nwU8L4sB
 Awsh6XSPmRenuNtOqX7HqIofcpYbqqymFIqxWZV+O5ihYTWpgEu5q9aqU g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="393111756"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="393111756"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 10:40:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="913294976"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="913294976"
Received: from stefanwe-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.252.60.146])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 10:40:32 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 30 Nov 2023 18:39:55 +0000
Message-Id: <20231130183955.7-17-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130183955.7-1-francois.dugast@intel.com>
References: <20231130183955.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 16/16] drm/xe/uapi: Kill
 exec_queue_set_property
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

From: Rodrigo Vivi <rodrigo.vivi@intel.com>

All the properties should be immutable and set upon exec_queue creation
using the existent extension. So, let's kill this useless and dangerous
uapi.

Cc: Francois Dugast <francois.dugast@intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: José Roberto de Souza <jose.souza@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c     |  2 --
 drivers/gpu/drm/xe/xe_exec_queue.c | 38 -----------------------
 drivers/gpu/drm/xe/xe_exec_queue.h |  2 --
 include/uapi/drm/xe_drm.h          | 48 ++++++++----------------------
 4 files changed, 13 insertions(+), 77 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 54202623e255..8a96551ec836 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -121,8 +121,6 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
 			  DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(XE_EXEC_QUEUE_DESTROY, xe_exec_queue_destroy_ioctl,
 			  DRM_RENDER_ALLOW),
-	DRM_IOCTL_DEF_DRV(XE_EXEC_QUEUE_SET_PROPERTY, xe_exec_queue_set_property_ioctl,
-			  DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(XE_EXEC_QUEUE_GET_PROPERTY, xe_exec_queue_get_property_ioctl,
 			  DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(XE_WAIT_USER_FENCE, xe_wait_user_fence_ioctl,
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index d01c2967badb..cb284c4ad049 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -883,44 +883,6 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
 	return 0;
 }
 
-int xe_exec_queue_set_property_ioctl(struct drm_device *dev, void *data,
-				     struct drm_file *file)
-{
-	struct xe_device *xe = to_xe_device(dev);
-	struct xe_file *xef = to_xe_file(file);
-	struct drm_xe_exec_queue_set_property *args = data;
-	struct xe_exec_queue *q;
-	int ret;
-	u32 idx;
-
-	if (XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
-		return -EINVAL;
-
-	q = xe_exec_queue_lookup(xef, args->exec_queue_id);
-	if (XE_IOCTL_DBG(xe, !q))
-		return -ENOENT;
-
-	if (XE_IOCTL_DBG(xe, args->property >=
-			 ARRAY_SIZE(exec_queue_set_property_funcs))) {
-		ret = -EINVAL;
-		goto out;
-	}
-
-	idx = array_index_nospec(args->property,
-				 ARRAY_SIZE(exec_queue_set_property_funcs));
-	ret = exec_queue_set_property_funcs[idx](xe, q, args->value, false);
-	if (XE_IOCTL_DBG(xe, ret))
-		goto out;
-
-	if (args->extensions)
-		ret = exec_queue_user_extensions(xe, q, args->extensions, 0,
-						 false);
-out:
-	xe_exec_queue_put(q);
-
-	return ret;
-}
-
 static void xe_exec_queue_last_fence_lockdep_assert(struct xe_exec_queue *q,
 						    struct xe_vm *vm)
 {
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
index 59a54bfb9a8c..8b587d1b2c2c 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue.h
@@ -55,8 +55,6 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 			       struct drm_file *file);
 int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
 				struct drm_file *file);
-int xe_exec_queue_set_property_ioctl(struct drm_device *dev, void *data,
-				     struct drm_file *file);
 int xe_exec_queue_get_property_ioctl(struct drm_device *dev, void *data,
 				     struct drm_file *file);
 enum drm_sched_priority xe_exec_queue_device_get_max_priority(struct xe_device *xe);
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index ffd9fc1172e8..742544e78c76 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -105,10 +105,9 @@ struct xe_user_extension {
 #define DRM_XE_VM_BIND			0x05
 #define DRM_XE_EXEC_QUEUE_CREATE	0x06
 #define DRM_XE_EXEC_QUEUE_DESTROY	0x07
-#define DRM_XE_EXEC_QUEUE_SET_PROPERTY	0x08
-#define DRM_XE_EXEC_QUEUE_GET_PROPERTY	0x09
-#define DRM_XE_EXEC			0x0a
-#define DRM_XE_WAIT_USER_FENCE		0x0b
+#define DRM_XE_EXEC_QUEUE_GET_PROPERTY	0x08
+#define DRM_XE_EXEC			0x09
+#define DRM_XE_WAIT_USER_FENCE		0x0a
 /* Must be kept compact -- no holes */
 
 #define DRM_IOCTL_XE_DEVICE_QUERY		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_DEVICE_QUERY, struct drm_xe_device_query)
@@ -860,38 +859,17 @@ struct drm_xe_vm_bind {
 /* Monitor 64MB contiguous region with 2M sub-granularity */
 #define DRM_XE_ACC_GRANULARITY_64M 3
 
-/**
- * struct drm_xe_exec_queue_set_property - exec queue set property
- *
- * Same namespace for extensions as drm_xe_exec_queue_create
- */
-struct drm_xe_exec_queue_set_property {
-	/** @extensions: Pointer to the first extension struct, if any */
-	__u64 extensions;
-
-	/** @exec_queue_id: Exec queue ID */
-	__u32 exec_queue_id;
-
-#define DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY			0
-#define DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
-#define DRM_XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT	2
-#define DRM_XE_EXEC_QUEUE_SET_PROPERTY_PERSISTENCE		3
-#define DRM_XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT		4
-#define DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER		5
-#define DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY		6
-#define DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY		7
-	/** @property: property to set */
-	__u32 property;
-
-	/** @value: property value */
-	__u64 value;
-
-	/** @reserved: Reserved */
-	__u64 reserved[2];
-};
-
 struct drm_xe_exec_queue_create {
-#define DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY               0
+#define DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY		0
+#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
+#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
+#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT	2
+#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PERSISTENCE		3
+#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT		4
+#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER		5
+#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY		6
+#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY	7
+
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
-- 
2.34.1

