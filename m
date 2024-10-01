Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D656CEACDB
	for <intel-xe@archiver.kernel.org>; Tue,  1 Oct 2024 14:53:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BF7010E642;
	Tue,  1 Oct 2024 14:53:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ijkd5KfW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FBD210E64B
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Oct 2024 14:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727794431; x=1759330431;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MQHNbr6BXuVe9gXO+uia3SJWuAyYfglZeyGxNuhX2h4=;
 b=Ijkd5KfWubMp2tStoSMn/IUND+vfIVRPpEb2ZcDtgZ8vjSReHRbxvsz+
 xW4pcSS/XtlAeW6LIxiZX5ywytM9RQeRpphLMbnDkLd1WJBkVLOS1Q9tJ
 T6Xbpd4edWSgwxLDrVh1LKa8OgAEcSRhlyI5Q6K3Xcd65VKaZ69H07vqd
 Wgmpy6N2yJwUsKYO7uUBlC1jgJen1cocsjogUxvXGIMySjIYu6Xbugjsu
 mQXgokeOpsbrLCiVBuBakqMao0KcisMxLpmdTzXmFeuMuzmBZ5rhBmEmK
 7M8MfaXT0WKc25rsCTr2nfWUheTG1kBxxB/IWh83wifVDJHHYVxK0lFwY w==;
X-CSE-ConnectionGUID: LRZsGeTbStOPZc9VhYO5ew==
X-CSE-MsgGUID: DyPcNo+CTaagF5mfKv2iUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="27091419"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="27091419"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2024 07:53:51 -0700
X-CSE-ConnectionGUID: Kx4lsa6sR76JkY4ZMbsIVA==
X-CSE-MsgGUID: 9oL0prVpTwu0bKfEY/5Jmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="97048742"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2024 07:53:49 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH 13/18] drm/xe: Debug metadata create/destroy ioctls
Date: Tue,  1 Oct 2024 17:43:01 +0300
Message-Id: <20241001144306.1991001-14-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241001144306.1991001-1-mika.kuoppala@linux.intel.com>
References: <20241001144306.1991001-1-mika.kuoppala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>

Ad a part of eu debug feature introduce debug metadata objects.
These are to be used to pass metadata between client and debugger,
by attaching them to vm_bind operations.

todo: WORK_IN_PROGRESS_* defines need to be reworded/refined when
      the real usage and need is established by l0+gdb.

v2: - include uapi/drm/xe_drm.h
    - metadata behind kconfig (Mika)

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/Makefile                  |   3 +-
 drivers/gpu/drm/xe/xe_debug_metadata.c       | 108 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_debug_metadata.h       |  50 +++++++++
 drivers/gpu/drm/xe/xe_debug_metadata_types.h |  28 +++++
 drivers/gpu/drm/xe/xe_device.c               |   5 +
 drivers/gpu/drm/xe/xe_device.h               |   2 +
 drivers/gpu/drm/xe/xe_device_types.h         |   7 ++
 drivers/gpu/drm/xe/xe_eudebug.c              |  13 +++
 include/uapi/drm/xe_drm.h                    |  53 ++++++++-
 9 files changed, 267 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_debug_metadata.c
 create mode 100644 drivers/gpu/drm/xe/xe_debug_metadata.h
 create mode 100644 drivers/gpu/drm/xe/xe_debug_metadata_types.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 660c1dbba8d0..a94f771529a4 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -114,7 +114,8 @@ xe-y += xe_bb.o \
 	xe_wa.o \
 	xe_wopcm.o
 
-xe-$(CONFIG_DRM_XE_EUDEBUG) += xe_eudebug.o
+xe-$(CONFIG_DRM_XE_EUDEBUG) += xe_eudebug.o \
+	xe_debug_metadata.o
 
 xe-$(CONFIG_HMM_MIRROR) += xe_hmm.o
 
diff --git a/drivers/gpu/drm/xe/xe_debug_metadata.c b/drivers/gpu/drm/xe/xe_debug_metadata.c
new file mode 100644
index 000000000000..72a00b628475
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_debug_metadata.c
@@ -0,0 +1,108 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+#include "xe_debug_metadata.h"
+
+#include <drm/drm_device.h>
+#include <drm/drm_file.h>
+#include <uapi/drm/xe_drm.h>
+
+#include "xe_device.h"
+#include "xe_macros.h"
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
+
+	err = copy_from_user(mdata->ptr, u64_to_user_ptr(args->user_addr), mdata->len);
+	if (err) {
+		err = -EFAULT;
+		goto put_mdata;
+	}
+
+	mutex_lock(&xef->eudebug.metadata.lock);
+	err = xa_alloc(&xef->eudebug.metadata.xa, &id, mdata, xa_limit_32b, GFP_KERNEL);
+	mutex_unlock(&xef->eudebug.metadata.lock);
+
+	args->metadata_id = id;
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
+	mutex_lock(&xef->eudebug.metadata.lock);
+	mdata = xa_erase(&xef->eudebug.metadata.xa, args->metadata_id);
+	mutex_unlock(&xef->eudebug.metadata.lock);
+	if (XE_IOCTL_DBG(xe, !mdata))
+		return -ENOENT;
+
+	xe_debug_metadata_put(mdata);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_debug_metadata.h b/drivers/gpu/drm/xe/xe_debug_metadata.h
new file mode 100644
index 000000000000..3266c25e657e
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_debug_metadata.h
@@ -0,0 +1,50 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_DEBUG_METADATA_H_
+#define _XE_DEBUG_METADATA_H_
+
+struct drm_device;
+struct drm_file;
+
+#if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
+
+#include "xe_debug_metadata_types.h"
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
+#else /* CONFIG_DRM_XE_EUDEBUG */
+
+#include <linux/errno.h>
+
+struct xe_debug_metadata;
+
+static inline void xe_debug_metadata_put(struct xe_debug_metadata *mdata) { }
+
+static inline int xe_debug_metadata_create_ioctl(struct drm_device *dev,
+						 void *data,
+						 struct drm_file *file)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int xe_debug_metadata_destroy_ioctl(struct drm_device *dev,
+						  void *data,
+						  struct drm_file *file)
+{
+	return -EOPNOTSUPP;
+}
+
+#endif /* CONFIG_DRM_XE_EUDEBUG */
+
+
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
index 77049c56c26c..e0d55e11ace6 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -24,6 +24,7 @@
 #include "xe_bo.h"
 #include "xe_debugfs.h"
 #include "xe_devcoredump.h"
+#include "xe_debug_metadata.h"
 #include "xe_dma_buf.h"
 #include "xe_drm_client.h"
 #include "xe_drv.h"
@@ -203,6 +204,10 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
 			  DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(XE_OBSERVATION, xe_observation_ioctl, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(XE_EUDEBUG_CONNECT, xe_eudebug_connect_ioctl, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(XE_DEBUG_METADATA_CREATE, xe_debug_metadata_create_ioctl,
+			  DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(XE_DEBUG_METADATA_DESTROY, xe_debug_metadata_destroy_ioctl,
+			  DRM_RENDER_ALLOW),
 };
 
 static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index b2fc85b1d26e..ce01e3fc9fdf 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -204,6 +204,8 @@ static inline int xe_eudebug_needs_lock(const unsigned int cmd)
 	case DRM_XE_EXEC_QUEUE_CREATE:
 	case DRM_XE_EXEC_QUEUE_DESTROY:
 	case DRM_XE_EUDEBUG_CONNECT:
+	case DRM_XE_DEBUG_METADATA_CREATE:
+	case DRM_XE_DEBUG_METADATA_DESTROY:
 		return 1;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 562cc8930533..40b0f61b64b8 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -671,6 +671,13 @@ struct xe_file {
 	struct {
 		/** @client_link: list entry in xe_device.clients.list */
 		struct list_head client_link;
+
+		struct {
+			/** @xa: xarray to store debug metadata */
+			struct xarray xa;
+			/** @lock: protects debug metadata xarray */
+			struct mutex lock;
+		} metadata;
 	} eudebug;
 #endif
 };
diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index b09d7414cfe3..6ee06a58b640 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -21,6 +21,7 @@
 #include "xe_assert.h"
 #include "xe_bo.h"
 #include "xe_device.h"
+#include "xe_debug_metadata.h"
 #include "xe_eudebug.h"
 #include "xe_eudebug_types.h"
 #include "xe_exec_queue.h"
@@ -2132,6 +2133,8 @@ void xe_eudebug_file_open(struct xe_file *xef)
 	struct xe_eudebug *d;
 
 	INIT_LIST_HEAD(&xef->eudebug.client_link);
+	mutex_init(&xef->eudebug.metadata.lock);
+	xa_init_flags(&xef->eudebug.metadata.xa, XA_FLAGS_ALLOC1);
 
 	down_read(&xef->xe->eudebug.discovery_lock);
 
@@ -2149,12 +2152,22 @@ void xe_eudebug_file_open(struct xe_file *xef)
 void xe_eudebug_file_close(struct xe_file *xef)
 {
 	struct xe_eudebug *d;
+	unsigned long idx;
+	struct xe_debug_metadata *mdata;
 
 	down_read(&xef->xe->eudebug.discovery_lock);
 	d = xe_eudebug_get(xef);
 	if (d)
 		xe_eudebug_event_put(d, client_destroy_event(d, xef));
 
+	mutex_lock(&xef->eudebug.metadata.lock);
+	xa_for_each(&xef->eudebug.metadata.xa, idx, mdata)
+		xe_debug_metadata_put(mdata);
+	mutex_unlock(&xef->eudebug.metadata.lock);
+
+	xa_destroy(&xef->eudebug.metadata.xa);
+	mutex_destroy(&xef->eudebug.metadata.lock);
+
 	spin_lock(&xef->xe->clients.lock);
 	list_del_init(&xef->eudebug.client_link);
 	spin_unlock(&xef->xe->clients.lock);
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 985dcf852458..0d75a072b838 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -103,7 +103,8 @@ extern "C" {
 #define DRM_XE_WAIT_USER_FENCE		0x0a
 #define DRM_XE_OBSERVATION		0x0b
 #define DRM_XE_EUDEBUG_CONNECT		0x0c
-
+#define DRM_XE_DEBUG_METADATA_CREATE	0x0d
+#define DRM_XE_DEBUG_METADATA_DESTROY	0x0e
 /* Must be kept compact -- no holes */
 
 #define DRM_IOCTL_XE_DEVICE_QUERY		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_DEVICE_QUERY, struct drm_xe_device_query)
@@ -119,6 +120,8 @@ extern "C" {
 #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
 #define DRM_IOCTL_XE_OBSERVATION		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OBSERVATION, struct drm_xe_observation_param)
 #define DRM_IOCTL_XE_EUDEBUG_CONNECT		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EUDEBUG_CONNECT, struct drm_xe_eudebug_connect)
+#define DRM_IOCTL_XE_DEBUG_METADATA_CREATE	 DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_DEBUG_METADATA_CREATE, struct drm_xe_debug_metadata_create)
+#define DRM_IOCTL_XE_DEBUG_METADATA_DESTROY	 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_DEBUG_METADATA_DESTROY, struct drm_xe_debug_metadata_destroy)
 
 /**
  * DOC: Xe IOCTL Extensions
@@ -1714,6 +1717,54 @@ struct drm_xe_eudebug_connect {
 	__u32 version; /* output: current ABI (ioctl / events) version */
 };
 
+/*
+ * struct drm_xe_debug_metadata_create - Create debug metadata
+ *
+ * Add a region of user memory to be marked as debug metadata.
+ * When the debugger attaches, the metadata regions will be delivered
+ * for debugger. Debugger can then map these regions to help decode
+ * the program state.
+ *
+ * Returns handle to created metadata entry.
+ */
+struct drm_xe_debug_metadata_create {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
+#define DRM_XE_DEBUG_METADATA_ELF_BINARY     0
+#define DRM_XE_DEBUG_METADATA_PROGRAM_MODULE 1
+#define WORK_IN_PROGRESS_DRM_XE_DEBUG_METADATA_MODULE_AREA 2
+#define WORK_IN_PROGRESS_DRM_XE_DEBUG_METADATA_SBA_AREA 3
+#define WORK_IN_PROGRESS_DRM_XE_DEBUG_METADATA_SIP_AREA 4
+#define WORK_IN_PROGRESS_DRM_XE_DEBUG_METADATA_NUM (1 + \
+	  WORK_IN_PROGRESS_DRM_XE_DEBUG_METADATA_SIP_AREA)
+
+	/** @type: Type of metadata */
+	__u64 type;
+
+	/** @user_addr: pointer to start of the metadata */
+	__u64 user_addr;
+
+	/** @len: length, in bytes of the medata */
+	__u64 len;
+
+	/** @metadata_id: created metadata handle (out) */
+	__u32 metadata_id;
+};
+
+/**
+ * struct drm_xe_debug_metadata_destroy - Destroy debug metadata
+ *
+ * Destroy debug metadata.
+ */
+struct drm_xe_debug_metadata_destroy {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
+	/** @metadata_id: metadata handle to destroy */
+	__u32 metadata_id;
+};
+
 #include "xe_drm_eudebug.h"
 
 #if defined(__cplusplus)
-- 
2.34.1

