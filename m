Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00210D0E6D8
	for <intel-xe@archiver.kernel.org>; Mon, 21 Oct 2024 09:59:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7E8210E472;
	Mon, 21 Oct 2024 09:59:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KKet0QMf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A17610E472
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Oct 2024 09:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729504794; x=1761040794;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kgLK9LpLsuTkru58uMh0riYYfl4lXUu6z5c8kBOeDc8=;
 b=KKet0QMfNmiHXAf6YpNGrE0whVV2VFNkNi/RUGsrljmQpKABf+B/wdVO
 yesBxN5ZVcnz29DNTIYZqwiGlGFaFExSJYrXAU+Yyz1krTmLCBnzMRN4/
 ywbrzwsmaov1j2/UC6zyN1rbBJJ4IaMKFI7RfvddgBi9aYAnyyst4nLgj
 xjeDCUTg/ib6ZwL9vqQS72x5b2me9evD5GxXe9wc45Q53uPcDNOPdog/r
 aEeiQIj3Za3qv0i2Za2eCbDaESpDj0zQLhavPiHfjEP9T6GEa6yi5EGgT
 /oS90fauG5I6RzIwOd4spl8C/7BxZurjDtB96wgqMhnkU/Az5LLWOd+ay Q==;
X-CSE-ConnectionGUID: 0ywSfIoXTdqtgGy4dXG7nQ==
X-CSE-MsgGUID: mOf19IH6TZKwvkWd1imruw==
X-IronPort-AV: E=McAfee;i="6700,10204,11231"; a="40350832"
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; d="scan'208";a="40350832"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 02:59:53 -0700
X-CSE-ConnectionGUID: X3/81lelQAmtyOAuucrJzg==
X-CSE-MsgGUID: 5qjRZUikQGWOs5wbRHF/ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; d="scan'208";a="84546167"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO rapter.intel.com)
 ([10.245.246.221])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 02:59:50 -0700
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: nirmoy.das@intel.com, matthew.brost@intel.com, stuart.summers@intel.com,
 christoph.manszewski@intel.com, mika.kuoppala@linux.intel.com,
 dominik.grzegorzek@intel.com, andrzej.hajda@intel.com,
 maciej.patelczyk@intel.com
Subject: [RFC 13/19] drm/xe: Debug metadata create/destroy ioctls
Date: Mon, 21 Oct 2024 12:58:52 +0300
Message-ID: <20241021095904.439555-14-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241021095904.439555-1-gwan-gyeong.mun@intel.com>
References: <20241021095904.439555-1-gwan-gyeong.mun@intel.com>
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
Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
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
index c5f703d22ba4..155cd6e34362 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -115,7 +115,8 @@ xe-y += xe_bb.o \
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
index 66d26ae3e11c..d125951e0f73 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -25,6 +25,7 @@
 #include "xe_bo.h"
 #include "xe_debugfs.h"
 #include "xe_devcoredump.h"
+#include "xe_debug_metadata.h"
 #include "xe_dma_buf.h"
 #include "xe_drm_client.h"
 #include "xe_drv.h"
@@ -204,6 +205,10 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
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
index 9802347258d0..5cf33c624f30 100644
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
@@ -2133,6 +2134,8 @@ void xe_eudebug_file_open(struct xe_file *xef)
 	struct xe_eudebug *d;
 
 	INIT_LIST_HEAD(&xef->eudebug.client_link);
+	mutex_init(&xef->eudebug.metadata.lock);
+	xa_init_flags(&xef->eudebug.metadata.xa, XA_FLAGS_ALLOC1);
 
 	down_read(&xef->xe->eudebug.discovery_lock);
 
@@ -2150,12 +2153,22 @@ void xe_eudebug_file_open(struct xe_file *xef)
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
index de8c6669176a..023e0a336eea 100644
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
@@ -1716,6 +1719,54 @@ struct drm_xe_eudebug_connect {
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
2.46.1

