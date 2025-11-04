Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18B59CCFA04
	for <intel-xe@archiver.kernel.org>; Tue,  4 Nov 2025 18:52:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 487DC10E326;
	Tue,  4 Nov 2025 18:51:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hpjQhoqd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD5F510E2B0
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Nov 2025 18:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762282318; x=1793818318;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9APGrcFeK9yZgyY9dkFvwe0QlkI91OsRe832KzLtdUM=;
 b=hpjQhoqdod6GrPpiBBu1OYglQA3TuBIWcmca2raZKYPlGCRXa3EM3PKK
 LdVNElwBjvk7BCPZAfM4idjdiuDljrMHGNoJSRnUap4cPDb4LQtEjBL06
 q3luzZWMeoBBx7sGFtsq7xGK1noDUxVwCAwiyOS29g0b0aqJYZg3mXorS
 nRXkLFFZ66ogB17JI4nyGZoY9ZjAUw68eWtdVOzNi6qo28f272HNp4n2W
 HbWtzg6EkT8An7cuNYK1aHe0vpMMMD4QuS7p3+5rmwOvI5xXhgtDAY1y7
 IPuoi7mnopWenMTJtpTJqty/zkmnu4fqgZBKDzyG55KxcXG+WmjYZMwyw Q==;
X-CSE-ConnectionGUID: +e+wmAFHTMy/tNLNpJRUdw==
X-CSE-MsgGUID: NTxtKoPyTtCS7CCd3FtG2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="68247747"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="68247747"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 10:51:57 -0800
X-CSE-ConnectionGUID: t/7vakR5S+m+lSDtXopLTQ==
X-CSE-MsgGUID: HDjSRbEhSC+jUtEP0tBJFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="187183082"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.131])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 10:51:57 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Subject: [PATCH v2 06/16] drm/xe/multi_queue: Add exec_queue set_property
 ioctl support
Date: Tue,  4 Nov 2025 10:51:40 -0800
Message-ID: <20251104185150.246345-7-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251104185150.246345-1-niranjana.vishwanathapura@intel.com>
References: <20251104185150.246345-1-niranjana.vishwanathapura@intel.com>
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
---
 drivers/gpu/drm/xe/xe_device.c     |  2 ++
 drivers/gpu/drm/xe/xe_exec_queue.c | 35 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_exec_queue.h |  2 ++
 include/uapi/drm/xe_drm.h          | 26 ++++++++++++++++++++++
 4 files changed, 65 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 9f2f19dc1fd3..391b2f9a2846 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -209,6 +209,8 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(XE_MADVISE, xe_vm_madvise_ioctl, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(XE_VM_QUERY_MEM_RANGE_ATTRS, xe_vm_query_vmas_attrs_ioctl,
 			  DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(XE_EXEC_QUEUE_SET_PROPERTY, xe_exec_queue_set_property_ioctl,
+			  DRM_RENDER_ALLOW),
 };
 
 static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index d36d018d7ba0..c96cc085e8e8 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -762,6 +762,41 @@ static const xe_exec_queue_set_property_fn exec_queue_set_property_funcs[] = {
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
index 6734ef7fada1..d5162a3a89db 100644
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
@@ -2286,6 +2288,30 @@ struct drm_xe_vm_query_mem_range_attr {
 
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

