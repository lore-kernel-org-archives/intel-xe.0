Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ACD1C0032E
	for <intel-xe@archiver.kernel.org>; Mon,  6 Nov 2023 11:22:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0F1210E2E0;
	Mon,  6 Nov 2023 11:22:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EC6F10E2D9
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Nov 2023 11:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699269760; x=1730805760;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qaaoRfZgN8fQugpCn0ZazSNPXKoyHKIqrLhnwYM4XWs=;
 b=Gcbu2/xYv+2YVHWLgHDYyL6gXpO4RzSJ/d4ICBiRTk0ot3Ht14O6QoOl
 r2xc2RLxabkVcpW6cREbzYVjwaq6QZHD9jk6V+vMDMBxoEfrpFJGBoVdA
 zSeaq4a7TFAvNk8RfXobha1LnLesVuxJ0fjrhW7lludDZgBYtWwI0H/4n
 yiQCVsqj26zUoSdDjLhIn+W1q4qbieESlxKsHAVcCpI0Fd3aAMgJEtxAN
 9MLz+g3mQIakgIIUxZZWYZ/nPyUGyKSpqUgECrZz0H8LOM6t/qr5zmFHx
 pxJy+7r529VRUTFEZu1RBhjqt3gb9MUMsOSXCfGIOfewFedh9J0Okr3i+ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="379646854"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; d="scan'208";a="379646854"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 03:22:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="879411695"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; d="scan'208";a="879411695"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 03:22:35 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  6 Nov 2023 13:18:38 +0200
Message-Id: <20231106111845.2333093-19-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231106111845.2333093-1-mika.kuoppala@linux.intel.com>
References: <20231106111845.2333093-1-mika.kuoppala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC 18/25] drm/xe: Debug metadata create/destroy ioctls
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

From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>

Ad a part of eu debug feature introduce debug metadata objects.
These are to be used to pass metadata between client and debugger,
by attaching them to vm_bind operations.

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 drivers/gpu/drm/xe/Makefile                  |   1 +
 drivers/gpu/drm/xe/xe_debug_metadata.c       | 107 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_debug_metadata.h       |  23 ++++
 drivers/gpu/drm/xe/xe_debug_metadata_types.h |  28 +++++
 drivers/gpu/drm/xe/xe_device.c               |  17 +++
 drivers/gpu/drm/xe/xe_device_types.h         |   8 ++
 6 files changed, 184 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_debug_metadata.c
 create mode 100644 drivers/gpu/drm/xe/xe_debug_metadata.h
 create mode 100644 drivers/gpu/drm/xe/xe_debug_metadata_types.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 59f76d29f44b..a8ff13cf5095 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -47,6 +47,7 @@ xe-y += xe_bb.o \
 	xe_bo.o \
 	xe_bo_evict.o \
 	xe_debugfs.o \
+	xe_debug_metadata.o \
 	xe_devcoredump.o \
 	xe_usercoredump.o \
 	xe_device.o \
diff --git a/drivers/gpu/drm/xe/xe_debug_metadata.c b/drivers/gpu/drm/xe/xe_debug_metadata.c
new file mode 100644
index 000000000000..7c4034d9223c
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_debug_metadata.c
@@ -0,0 +1,107 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+#include "xe_debug_metadata.h"
+
+#include <drm/drm_device.h>
+#include <drm/drm_file.h>
+#include <drm/xe_drm.h>
+
+#include "xe_device.h"
+
+static void xe_debug_metadata_release(struct kref *ref)
+{
+	struct xe_debug_metadata *mdata = container_of(ref, struct xe_debug_metadata, refcount);
+
+	kvfree(mdata->ptr);
+	kfree(mdata);
+}
+
+void xe_debug_metadata_put(struct xe_debug_metadata *mdata)
+{
+	kref_put(&mdata->refcount, xe_debug_metadata_release);
+}
+
+int xe_debug_metadata_create_ioctl(struct drm_device *dev,
+				   void *data,
+				   struct drm_file *file)
+{
+	struct xe_device *xe = to_xe_device(dev);
+	struct xe_file *xef = to_xe_file(file);
+	struct drm_xe_debug_metadata_create *args = data;
+	struct xe_debug_metadata *mdata;
+	int err;
+	u32 id;
+
+	if (XE_IOCTL_DBG(xe, args->extensions))
+		return -EINVAL;
+
+	if (XE_IOCTL_DBG(xe, args->type > DRM_XE_DEBUG_METADATA_PROGRAM_MODULE))
+		return -EINVAL;
+
+	if (XE_IOCTL_DBG(xe, !args->user_addr || !args->len))
+		return -EINVAL;
+
+	if (XE_IOCTL_DBG(xe, !access_ok(u64_to_user_ptr(args->user_addr), args->len)))
+		return -EFAULT;
+
+	mdata = kzalloc(sizeof(*mdata), GFP_KERNEL);
+	if (!mdata)
+		return -ENOMEM;
+
+	mdata->len = args->len;
+	mdata->type = args->type;
+
+	mdata->ptr = kvmalloc(mdata->len, GFP_KERNEL);
+	if (!mdata->ptr) {
+		kfree(mdata);
+		return -ENOMEM;
+	}
+	kref_init(&mdata->refcount);
+	kref_get(&mdata->refcount);
+
+	err = copy_from_user(mdata->ptr, u64_to_user_ptr(args->user_addr), mdata->len);
+	if (err) {
+		err = -EFAULT;
+		goto put_mdata;
+	}
+
+	mutex_lock(&xef->debug_metadata.lock);
+	err = xa_alloc(&xef->debug_metadata.xa, &id, mdata, xa_limit_32b, GFP_KERNEL);
+	mutex_unlock(&xef->debug_metadata.lock);
+
+	args->id = id;
+	mdata->id = id;
+
+	if (err)
+		goto put_mdata;
+
+	return 0;
+
+put_mdata:
+	xe_debug_metadata_put(mdata);
+	return err;
+}
+
+int xe_debug_metadata_destroy_ioctl(struct drm_device *dev,
+				    void *data,
+				    struct drm_file *file)
+{
+	struct xe_device *xe = to_xe_device(dev);
+	struct xe_file *xef = to_xe_file(file);
+	struct drm_xe_debug_metadata_destroy * const args = data;
+	struct xe_debug_metadata *mdata;
+
+	if (XE_IOCTL_DBG(xe, args->extensions))
+		return -EINVAL;
+
+	mutex_lock(&xef->debug_metadata.lock);
+	mdata = xa_erase(&xef->debug_metadata.xa, args->id);
+	mutex_unlock(&xef->debug_metadata.lock);
+	if (XE_IOCTL_DBG(xe, !mdata))
+		return -ENOENT;
+
+	xe_debug_metadata_put(mdata);
+	return 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_debug_metadata.h b/drivers/gpu/drm/xe/xe_debug_metadata.h
new file mode 100644
index 000000000000..abaea076c12d
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_debug_metadata.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_DEBUG_METADATA_H_
+#define _XE_DEBUG_METADATA_H_
+
+#include "xe_debug_metadata_types.h"
+
+struct drm_device;
+struct drm_file;
+
+void xe_debug_metadata_put(struct xe_debug_metadata *mdata);
+
+int xe_debug_metadata_create_ioctl(struct drm_device *dev,
+				   void *data,
+				   struct drm_file *file);
+
+int xe_debug_metadata_destroy_ioctl(struct drm_device *dev,
+				    void *data,
+				    struct drm_file *file);
+#endif
diff --git a/drivers/gpu/drm/xe/xe_debug_metadata_types.h b/drivers/gpu/drm/xe/xe_debug_metadata_types.h
new file mode 100644
index 000000000000..508f2fdbbc42
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_debug_metadata_types.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_DEBUG_METADATA_TYPES_H_
+#define _XE_DEBUG_METADATA_TYPES_H_
+
+#include <linux/kref.h>
+
+struct xe_debug_metadata {
+	/** @type: type of given metadata */
+	u64 type;
+
+	/** @ptr: copy of userptr, given as a metadata payload */
+	void *ptr;
+
+	/** @len: length, in bytes of the metadata */
+	u64 len;
+
+	/** @id */
+	u64 id;
+
+	/** @ref: reference count */
+	struct kref refcount;
+};
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index bc8032266ef0..a71392f33e3c 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -19,6 +19,7 @@
 #include "regs/xe_regs.h"
 #include "xe_bo.h"
 #include "xe_debugfs.h"
+#include "xe_debug_metadata.h"
 #include "xe_display.h"
 #include "xe_dma_buf.h"
 #include "xe_drm_client.h"
@@ -76,6 +77,9 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
 	mutex_init(&xef->exec_queue.lock);
 	xa_init_flags(&xef->exec_queue.xa, XA_FLAGS_ALLOC1);
 
+	mutex_init(&xef->debug_metadata.lock);
+	xa_init_flags(&xef->debug_metadata.xa, XA_FLAGS_ALLOC1);
+
 	file->driver_priv = xef;
 
 	ret = xa_alloc(&xe->clients.xa, &xef->client_id, xef, xa_limit_32b, GFP_KERNEL);
@@ -97,6 +101,7 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
 	struct xe_file *xef = file->driver_priv;
 	struct xe_vm *vm;
 	struct xe_exec_queue *q;
+	struct xe_debug_metadata *mdata;
 	unsigned long idx;
 
 	xe_eudebug_file_close(xef);
@@ -122,7 +127,15 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
 	xa_destroy(&xef->vm.xa);
 	mutex_destroy(&xef->vm.lock);
 
+	mutex_lock(&xef->debug_metadata.lock);
+	xa_for_each(&xef->debug_metadata.xa, idx, mdata)
+		xe_debug_metadata_put(mdata);
+	mutex_unlock(&xef->debug_metadata.lock);
+	xa_destroy(&xef->debug_metadata.xa);
+	mutex_destroy(&xef->debug_metadata.lock);
+
 	xe_drm_client_put(xef->client);
+
 	kfree(xef);
 }
 
@@ -147,6 +160,10 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
 			  DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(XE_VM_MADVISE, xe_vm_madvise_ioctl, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(XE_EUDEBUG_CONNECT, xe_eudebug_connect_ioctl, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(XE_DEBUG_METADATA_CREATE, xe_debug_metadata_create_ioctl,
+			  DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(XE_DEBUG_METADATA_DESTROY, xe_debug_metadata_destroy_ioctl,
+			  DRM_RENDER_ALLOW),
 };
 
 static const struct file_operations xe_driver_fops = {
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 57ec132286d7..bc8d6d1151f9 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -543,6 +543,14 @@ struct xe_file {
 
 	/** @client_id: id in clients.xa for eudebug discovery */
 	int client_id;
+
+	/** @debug_metadata: array of debug metadata for file */
+	struct {
+		/** @xa: xarray to store engines */
+		struct xarray xa;
+		/** @lock: protects file engine state */
+		struct mutex lock;
+	} debug_metadata;
 };
 
 #endif
-- 
2.34.1

