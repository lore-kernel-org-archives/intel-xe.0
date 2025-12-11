Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85E8CD3E787
	for <intel-xe@archiver.kernel.org>; Thu, 11 Dec 2025 01:03:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1757E10E6DB;
	Thu, 11 Dec 2025 01:03:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XCjdwooD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE91710E6C2
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Dec 2025 01:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765414978; x=1796950978;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=i2MR+kYn5BVCgzXzGfskD7C8C1xzWfHq6uG/PQB9FMo=;
 b=XCjdwooD2KPDlNMbSuKnFASKqTONwLOfDzRKSQJm/1dY+AVeBoA2zoHW
 5GQj4agaSlO0+nEPUAgp5MUO6iOGCQIDUXOoH/MOAv9HdhVfDSf1UbUJV
 IbkB9f3REM79h7TNAnIHyG7Xp/yCt5yp57qIHnie1f7XdZgKet5ezaWDQ
 06h2pTfUHOYk2/dm93S6oLlT91fMqhJU8e68cX3Tlxlbu2Sy8OtzqnDtT
 A+RbVKpFmE5Z2tZSWjrMnIrRgG7jVVbKD1SNor1YRUwij4/+pbD+03KO7
 RNmWnde4GxeusRTezTEGrI3aFW6nfKyYc2qXWR/4mT/p7sFeIub22E0Ez Q==;
X-CSE-ConnectionGUID: zmXlrd8URwi1J3mBebwYnA==
X-CSE-MsgGUID: GfP70eC5TQmC9FAESTtoew==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="67442865"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; d="scan'208";a="67442865"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 17:02:58 -0800
X-CSE-ConnectionGUID: XlYPjpQqTVyYBUjQMkC+Vw==
X-CSE-MsgGUID: KFijICthTcqvUa6we78xCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; d="scan'208";a="196664100"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 17:02:57 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	matthew.d.roper@intel.com
Subject: [PATCH v6 06/17] drm/xe/multi_queue: Add exec_queue set_property
 ioctl support
Date: Wed, 10 Dec 2025 17:02:54 -0800
Message-ID: <20251211010249.1647839-25-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251211010249.1647839-19-niranjana.vishwanathapura@intel.com>
References: <20251211010249.1647839-19-niranjana.vishwanathapura@intel.com>
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

This patch adds support for exec_queue set_property ioctl.
It is derived from the original work which is part of
https://patchwork.freedesktop.org/series/112188/

Currently only DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY
property can be dynamically set.

v2: Check for and update kernel-doc which property this ioctl
    supports (Matt Brost)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c     |  2 ++
 drivers/gpu/drm/xe/xe_exec_queue.c | 35 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_exec_queue.h |  2 ++
 include/uapi/drm/xe_drm.h          | 26 ++++++++++++++++++++++
 4 files changed, 65 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 1197f914ef77..7a498c8db7b1 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -207,6 +207,8 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(XE_MADVISE, xe_vm_madvise_ioctl, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(XE_VM_QUERY_MEM_RANGE_ATTRS, xe_vm_query_vmas_attrs_ioctl,
 			  DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(XE_EXEC_QUEUE_SET_PROPERTY, xe_exec_queue_set_property_ioctl,
+			  DRM_RENDER_ALLOW),
 };
 
 static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index d0082eb45a4a..d738a9fea1e1 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -790,6 +790,41 @@ static const xe_exec_queue_set_property_fn exec_queue_set_property_funcs[] = {
 							exec_queue_set_multi_queue_priority,
 };
 
+int xe_exec_queue_set_property_ioctl(struct drm_device *dev, void *data,
+				     struct drm_file *file)
+{
+	struct xe_device *xe = to_xe_device(dev);
+	struct xe_file *xef = to_xe_file(file);
+	struct drm_xe_exec_queue_set_property *args = data;
+	struct xe_exec_queue *q;
+	int ret;
+	u32 idx;
+
+	if (XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
+		return -EINVAL;
+
+	if (XE_IOCTL_DBG(xe, args->property !=
+			 DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY))
+		return -EINVAL;
+
+	q = xe_exec_queue_lookup(xef, args->exec_queue_id);
+	if (XE_IOCTL_DBG(xe, !q))
+		return -ENOENT;
+
+	idx = array_index_nospec(args->property,
+				 ARRAY_SIZE(exec_queue_set_property_funcs));
+	ret = exec_queue_set_property_funcs[idx](xe, q, args->value);
+	if (XE_IOCTL_DBG(xe, ret))
+		goto err_post_lookup;
+
+	xe_exec_queue_put(q);
+	return 0;
+
+ err_post_lookup:
+	xe_exec_queue_put(q);
+	return ret;
+}
+
 static int exec_queue_user_ext_check(struct xe_exec_queue *q, u64 properties)
 {
 	u64 secondary_queue_valid_props = BIT_ULL(DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP) |
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
index e6daa40003f2..ffcc1feb879e 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue.h
@@ -125,6 +125,8 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
 				struct drm_file *file);
 int xe_exec_queue_get_property_ioctl(struct drm_device *dev, void *data,
 				     struct drm_file *file);
+int xe_exec_queue_set_property_ioctl(struct drm_device *dev, void *data,
+				     struct drm_file *file);
 enum xe_exec_queue_priority xe_exec_queue_device_get_max_priority(struct xe_device *xe);
 
 void xe_exec_queue_last_fence_put(struct xe_exec_queue *e, struct xe_vm *vm);
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index fd79d78de2e9..705081bf0d81 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -106,6 +106,7 @@ extern "C" {
 #define DRM_XE_OBSERVATION		0x0b
 #define DRM_XE_MADVISE			0x0c
 #define DRM_XE_VM_QUERY_MEM_RANGE_ATTRS	0x0d
+#define DRM_XE_EXEC_QUEUE_SET_PROPERTY	0x0e
 
 /* Must be kept compact -- no holes */
 
@@ -123,6 +124,7 @@ extern "C" {
 #define DRM_IOCTL_XE_OBSERVATION		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OBSERVATION, struct drm_xe_observation_param)
 #define DRM_IOCTL_XE_MADVISE			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_MADVISE, struct drm_xe_madvise)
 #define DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_QUERY_MEM_RANGE_ATTRS, struct drm_xe_vm_query_mem_range_attr)
+#define DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY	DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_SET_PROPERTY, struct drm_xe_exec_queue_set_property)
 
 /**
  * DOC: Xe IOCTL Extensions
@@ -2315,6 +2317,30 @@ struct drm_xe_vm_query_mem_range_attr {
 
 };
 
+/**
+ * struct drm_xe_exec_queue_set_property - exec queue set property
+ *
+ * Sets execution queue properties dynamically.
+ * Currently only %DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY
+ * property can be dynamically set.
+ */
+struct drm_xe_exec_queue_set_property {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
+	/** @exec_queue_id: Exec queue ID */
+	__u32 exec_queue_id;
+
+	/** @property: property to set */
+	__u32 property;
+
+	/** @value: property value */
+	__u64 value;
+
+	/** @reserved: Reserved */
+	__u64 reserved[2];
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.43.0

