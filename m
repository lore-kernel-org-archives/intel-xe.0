Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED3E0CD8C9F
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 16:17:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADC5110F6B9;
	Mon,  8 Jun 2026 16:17:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a0UUC3zL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44B5D10F6B7
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jun 2026 16:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780935441; x=1812471441;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0W7OQFTi9PeGirp9pnkqw+2EBvwkc5d9AQ121RRPqng=;
 b=a0UUC3zL9gyL7a68WMXjNqVbx21LxDFK9w5VGfD/Op7ZK+0rH9HAEjsr
 WaWON2LHmRHliDfD9qSByRpvrBPXjDJ7rQF7ryd+T79wk3yrhfu2yD4v+
 bPYNHHMBQApccjSO5Hb7D5koXh+439t90ZlyEqI9GjrCjDuOAGBU2+6yF
 vK1xmYM0ZQcD/dRbuS3vTzDvSdwZLCnKE2Xab4B6by5K3IwTB01aKlx/1
 VwPSnvrnhKxdLKQer/nz2RKVytpQWTLFGkzIXyNyyaxahdRaGoKUeJ+ZL
 +6N8e7BZvpLnqGQTSEjTecA5nUoYDwpZx36oqzDQmAb5sVG5hJZWimWLO A==;
X-CSE-ConnectionGUID: MVXp+6/RRSOcJxEeIfXPyQ==
X-CSE-MsgGUID: aWAJfJOCQs+0hmYIfdz9SA==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="85531785"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="85531785"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 09:17:21 -0700
X-CSE-ConnectionGUID: AWLJXJ1/Tx2WS8sxnGVBfA==
X-CSE-MsgGUID: 2c1D/llUTIGv5ZQJsYsPcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="247457418"
Received: from ikozitz-mobl3.ger.corp.intel.com (HELO mkuoppal-desk.intel.com)
 ([10.245.251.97])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 09:17:16 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, matthew.brost@intel.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, joonas.lahtinen@linux.intel.com,
 gustavo.sousa@intel.com, jan.maslak@intel.com,
 dominik.karol.piatkowski@intel.com, rodrigo.vivi@intel.com,
 andrzej.hajda@intel.com, matthew.auld@intel.com,
 maciej.patelczyk@intel.com, gwan-gyeong.mun@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Subject: [PATCH 04/18] drm/xe/eudebug: Introduce discovery for resources
Date: Mon,  8 Jun 2026 19:16:22 +0300
Message-ID: <20260608161639.1652127-5-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260608161639.1652127-1-mika.kuoppala@linux.intel.com>
References: <20260608161639.1652127-1-mika.kuoppala@linux.intel.com>
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

A debugger connection can occur after a client has created
and destroyed an arbitrary number of resources. To support
this, we need to relay all currently existing resources to
the debugger. The client is held on selected ioctls until
this discovery process, executed by a workqueue, is complete.

This patch is based on discovery work by Maciej Patelczyk
for the i915 driver.

v2: - use rw_semaphore to block DRM ioctls during discovery (Matthew)
    - only lock according to ioctl at play (Dominik)

v4: - s/discovery_lock/ioctl_lock
    - change lock to be per xe_file as is connections
v5: - helper to get eudebug instance during discovery (Maciej)
v6: - complete_all even if no client (Sashiko)
v6: - dont flush on detach (Sashiko)
v7: - guard close with ioctl lock (Sashiko)

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Co-developed-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Acked-by: Matthew Brost <matthew.brost@intel.com> #locking
---
 Documentation/gpu/xe/xe_eudebug.rst   |   3 +
 drivers/gpu/drm/xe/xe_device.c        |  13 ++-
 drivers/gpu/drm/xe/xe_device.h        |  42 +++++++++
 drivers/gpu/drm/xe/xe_device_types.h  |   6 ++
 drivers/gpu/drm/xe/xe_eudebug.c       | 118 +++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_eudebug.h       |  11 +++
 drivers/gpu/drm/xe/xe_eudebug_types.h |  14 ++-
 drivers/gpu/drm/xe/xe_exec_queue.c    |   5 ++
 drivers/gpu/drm/xe/xe_hw_engine.h     |  14 +++
 include/uapi/drm/xe_drm_eudebug.h     |  26 ++++++
 10 files changed, 246 insertions(+), 6 deletions(-)

diff --git a/Documentation/gpu/xe/xe_eudebug.rst b/Documentation/gpu/xe/xe_eudebug.rst
index c21fa7c47ab8..e191e2c8ded4 100644
--- a/Documentation/gpu/xe/xe_eudebug.rst
+++ b/Documentation/gpu/xe/xe_eudebug.rst
@@ -54,3 +54,6 @@ Resource Event Types
 
 .. kernel-doc:: include/uapi/drm/xe_drm_eudebug.h
    :identifiers: drm_xe_eudebug_event_vm
+
+.. kernel-doc:: include/uapi/drm/xe_drm_eudebug.h
+   :identifiers: drm_xe_eudebug_event_exec_queue
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 326d61407dc2..02ab8b307c9f 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -112,6 +112,7 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
 
 #if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
 	INIT_LIST_HEAD(&xef->eudebug.target_link);
+	init_rwsem(&xef->eudebug.ioctl_lock);
 #endif
 
 	file->driver_priv = xef;
@@ -236,8 +237,12 @@ static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 
 	ACQUIRE(xe_pm_runtime_ioctl, pm)(xe);
 	ret = ACQUIRE_ERR(xe_pm_runtime_ioctl, &pm);
-	if (ret >= 0)
+	if (ret >= 0) {
+		bool lock = xe_eudebug_discovery_lock(file, cmd);
 		ret = drm_ioctl(file, cmd, arg);
+		if (lock)
+			xe_eudebug_discovery_unlock(file, cmd);
+	}
 
 	return ret;
 }
@@ -254,8 +259,12 @@ static long xe_drm_compat_ioctl(struct file *file, unsigned int cmd, unsigned lo
 
 	ACQUIRE(xe_pm_runtime_ioctl, pm)(xe);
 	ret = ACQUIRE_ERR(xe_pm_runtime_ioctl, &pm);
-	if (ret >= 0)
+	if (ret >= 0) {
+		bool lock = xe_eudebug_discovery_lock(file, cmd);
 		ret = drm_compat_ioctl(file, cmd, arg);
+		if (lock)
+			xe_eudebug_discovery_unlock(file, cmd);
+	}
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 975768a6a9c8..8fb541952cd2 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -7,6 +7,7 @@
 #define _XE_DEVICE_H_
 
 #include <drm/drm_util.h>
+#include <drm/drm_ioctl.h>
 
 #include "xe_device_types.h"
 #include "xe_gt_types.h"
@@ -234,4 +235,45 @@ static inline bool xe_device_is_admin_only(const struct xe_device *xe)
 #define LNL_FLUSH_WORK(wrk__) \
 	flush_work(wrk__)
 
+#if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
+static inline int xe_eudebug_needs_ioctl_lock(const unsigned int cmd)
+{
+	const unsigned int xe_cmd = DRM_IOCTL_NR(cmd) - DRM_COMMAND_BASE;
+
+	switch (xe_cmd) {
+	case DRM_XE_VM_CREATE:
+	case DRM_XE_VM_DESTROY:
+	case DRM_XE_VM_BIND:
+	case DRM_XE_EXEC_QUEUE_CREATE:
+	case DRM_XE_EXEC_QUEUE_DESTROY:
+		return 1;
+	}
+
+	return 0;
+}
+
+static inline bool xe_eudebug_discovery_lock(struct file *file, unsigned int cmd)
+{
+	struct drm_file *file_priv = file->private_data;
+	struct xe_file *xef = file_priv->driver_priv;
+
+	if (!xe_eudebug_needs_ioctl_lock(cmd))
+		return false;
+
+	down_read(&xef->eudebug.ioctl_lock);
+	return true;
+}
+
+static inline void xe_eudebug_discovery_unlock(struct file *file, unsigned int cmd)
+{
+	struct drm_file *file_priv = file->private_data;
+	struct xe_file *xef = file_priv->driver_priv;
+
+	up_read(&xef->eudebug.ioctl_lock);
+}
+#else
+static inline bool xe_eudebug_discovery_lock(struct file *file, unsigned int cmd) { return false; }
+static inline void xe_eudebug_discovery_unlock(struct file *file, unsigned int cmd) { }
+#endif /* CONFIG_DRM_XE_EUDEBUG */
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 3981473b8b12..b7f140932588 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -587,6 +587,9 @@ struct xe_device {
 
 		/** @eudebug.lock: protects state and targets */
 		struct mutex lock;
+
+		/** @wq: used for client discovery */
+		struct workqueue_struct *wq;
 	} eudebug;
 #endif
 };
@@ -659,6 +662,9 @@ struct xe_file {
 
 		/** @target_link: link into xe_device.eudebug.targets */
 		struct list_head target_link;
+
+		/** @eudebug.ioctl_lock syncing ioctl access */
+		struct rw_semaphore ioctl_lock;
 	} eudebug;
 #endif
 };
diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index 88c6065f31d1..799b34db8f9d 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -15,6 +15,8 @@
 #include "xe_device.h"
 #include "xe_eudebug.h"
 #include "xe_eudebug_types.h"
+#include "xe_exec_queue.h"
+#include "xe_hw_engine.h"
 #include "xe_macros.h"
 #include "xe_vm.h"
 
@@ -35,6 +37,10 @@
  * :ref:`File Descriptor Acquisition Methods <fd_acquisition_methods>` for
  * details on how to obtain the target's fd.
  *
+ * After a successful connection, all existing resources that the target Xe DRM
+ * client already has are sent as events, as if they had been
+ * created right after the connection. This is referred to as discovery.
+ *
  */
 
 /**
@@ -211,6 +217,8 @@ static void xe_eudebug_free(struct kref *ref)
 {
 	struct xe_eudebug *d = container_of(ref, typeof(*d), ref);
 
+	WARN_ON(work_pending(&d->discovery_work));
+
 	xe_assert(d->xe, xe_eudebug_detached(d));
 
 	xe_eudebug_resources_destroy(d);
@@ -222,7 +230,7 @@ static void xe_eudebug_free(struct kref *ref)
 	kfree(d);
 }
 
-static void xe_eudebug_put(struct xe_eudebug *d)
+void xe_eudebug_put(struct xe_eudebug *d)
 {
 	kref_put(&d->ref, xe_eudebug_free);
 }
@@ -340,15 +348,35 @@ _xe_eudebug_get(struct xe_file *xef)
 
 	d = __xe_eudebug_get(xef);
 
+	if (d && !completion_done(&d->discovery)) {
+		xe_eudebug_put(d);
+		return NULL;
+	}
+
 	return d;
 }
 
 static struct xe_eudebug *
 xe_eudebug_get(struct xe_file *xef)
+{
+	lockdep_assert_held(&xef->eudebug.ioctl_lock);
+
+	return _xe_eudebug_get(xef);
+}
+
+struct xe_eudebug *
+xe_eudebug_get_nolock(struct xe_file *xef)
 {
 	return _xe_eudebug_get(xef);
 }
 
+/* Returns eudebug instance even if discovery is running */
+struct xe_eudebug *
+xe_eudebug_get_nolock_with_discovery(struct xe_file *xef)
+{
+	return __xe_eudebug_get(xef);
+}
+
 static int xe_eudebug_queue_event(struct xe_eudebug *d,
 				  struct drm_xe_eudebug_event *event)
 {
@@ -525,6 +553,8 @@ static int xe_eudebug_remove_handle(struct xe_eudebug *d, int type, void *p,
 {
 	int ret;
 
+	XE_WARN_ON(!completion_done(&d->discovery));
+
 	ret = _xe_eudebug_remove_handle(d, type, p, seqno);
 
 	eu_dbg(d, "handle type %d handle %p removed: %d\n", type, p, ret);
@@ -669,6 +699,71 @@ void xe_eudebug_vm_destroy(struct xe_file *xef, struct xe_vm *vm)
 	xe_eudebug_put(d);
 }
 
+static struct xe_file *xe_eudebug_target_get(struct xe_eudebug *d)
+{
+	struct xe_file *xef = NULL;
+
+	mutex_lock(&d->xe->eudebug.lock);
+	if (d->target.xef)
+		xef = xe_file_get(d->target.xef);
+	mutex_unlock(&d->xe->eudebug.lock);
+
+	return xef;
+}
+
+static void discover_client(struct xe_eudebug *d)
+{
+	struct xe_file *xef;
+	struct xe_vm *vm;
+	unsigned long i;
+	unsigned int vm_count = 0;
+	int err = 0;
+
+	xef = xe_eudebug_target_get(d);
+	if (!xef) {
+		complete_all(&d->discovery);
+		return;
+	}
+
+	down_write(&xef->eudebug.ioctl_lock);
+
+	eu_dbg(d, "Discovery start for %lld", d->session);
+
+	/* vm lifetime guaranteed by the ioctl_lock */
+	xa_for_each(&xef->vm.xa, i, vm) {
+		err = vm_create_event(d, xef, vm);
+		if (err)
+			goto out;
+		vm_count++;
+	}
+
+out:
+	complete_all(&d->discovery);
+
+	eu_dbg(d, "Discovery end for %lld: %d", d->session, err);
+
+	up_write(&xef->eudebug.ioctl_lock);
+
+	if (vm_count)
+		eu_dbg(d, "Discovery found %u vms",
+		       vm_count);
+
+	xe_file_put(xef);
+}
+
+static void discovery_work_fn(struct work_struct *work)
+{
+	struct xe_eudebug *d = container_of(work, typeof(*d),
+					    discovery_work);
+
+	if (xe_eudebug_detached(d))
+		complete_all(&d->discovery);
+	else
+		discover_client(d);
+
+	xe_eudebug_put(d);
+}
+
 static int add_debugger(struct xe_device *xe, struct xe_eudebug *d,
 			struct drm_file *target)
 {
@@ -915,6 +1010,10 @@ static long xe_eudebug_ioctl(struct file *file,
 	struct xe_eudebug * const d = file->private_data;
 	long ret;
 
+	if (cmd != DRM_XE_EUDEBUG_IOCTL_READ_EVENT &&
+	    !completion_done(&d->discovery))
+		return -EBUSY;
+
 	switch (cmd) {
 	case DRM_XE_EUDEBUG_IOCTL_READ_EVENT:
 		ret = xe_eudebug_read_event(d, arg,
@@ -973,9 +1072,11 @@ xe_eudebug_connect(struct xe_device *xe,
 
 	kref_init(&d->ref);
 	init_waitqueue_head(&d->events.write_done);
-
 	spin_lock_init(&d->events.lock);
 
+	init_completion(&d->discovery);
+	INIT_WORK(&d->discovery_work, discovery_work_fn);
+
 	err = xe_eudebug_resources_init(d);
 	if (XE_IOCTL_DBG(xe, err)) {
 		kfree(d);
@@ -1023,6 +1124,7 @@ xe_eudebug_connect(struct xe_device *xe,
 	fd_install(fd, file);
 
 	kref_get(&d->ref); /* for discovery */
+	queue_work(xe->eudebug.wq, &d->discovery_work);
 
 	eu_dbg(d, "connected session %lld", d->session);
 
@@ -1042,11 +1144,15 @@ void xe_eudebug_file_close(struct xe_file *xef)
 {
 	struct xe_eudebug *d;
 
+	down_write(&xef->eudebug.ioctl_lock);
+
 	d = xe_eudebug_get(xef);
 	if (d) {
 		xe_eudebug_detach(d, 0);
 		xe_eudebug_put(d);
 	}
+
+	up_write(&xef->eudebug.ioctl_lock);
 }
 
 bool xe_eudebug_is_enabled(struct xe_device *xe)
@@ -1119,6 +1225,7 @@ static void xe_eudebug_sysfs_fini(void *arg)
 void xe_eudebug_init(struct xe_device *xe)
 {
 	struct drm_device *dev = &xe->drm;
+	struct workqueue_struct *wq;
 	int err;
 
 	INIT_LIST_HEAD(&xe->eudebug.targets);
@@ -1129,6 +1236,13 @@ void xe_eudebug_init(struct xe_device *xe)
 	if (err)
 		goto out_err;
 
+	wq = drmm_alloc_ordered_workqueue(dev, "xe-eudebug", 0);
+	if (IS_ERR(wq)) {
+		err = PTR_ERR(wq);
+		goto out_err;
+	}
+	xe->eudebug.wq = wq;
+
 	err = sysfs_create_file(&dev->dev->kobj,
 				&dev_attr_enable_eudebug.attr);
 	if (err)
diff --git a/drivers/gpu/drm/xe/xe_eudebug.h b/drivers/gpu/drm/xe/xe_eudebug.h
index 511decdf0e34..c0d4ccd5f44f 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.h
+++ b/drivers/gpu/drm/xe/xe_eudebug.h
@@ -13,6 +13,7 @@ struct drm_file;
 struct xe_device;
 struct xe_file;
 struct xe_vm;
+struct xe_exec_queue;
 
 #if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
 
@@ -46,6 +47,13 @@ void xe_eudebug_vm_create(struct xe_file *xef, u32 id);
 void xe_eudebug_vm_destroy(struct xe_file *xef, struct xe_vm *vm);
 int xe_eudebug_enable(struct xe_device *xe, bool enable);
 
+struct xe_eudebug *xe_eudebug_get_nolock(struct xe_file *xef);
+struct xe_eudebug *xe_eudebug_get_nolock_with_discovery(struct xe_file *xef);
+void xe_eudebug_put(struct xe_eudebug *d);
+
+void xe_eudebug_exec_queue_create(struct xe_file *xef, u32 id);
+void xe_eudebug_exec_queue_destroy(struct xe_file *xef, struct xe_exec_queue *q);
+
 #else
 
 static inline int xe_eudebug_connect_ioctl(struct drm_device *dev,
@@ -60,6 +68,9 @@ static inline void xe_eudebug_file_close(struct xe_file *xef) { }
 static inline void xe_eudebug_vm_create(struct xe_file *xef, u32 id) { }
 static inline void xe_eudebug_vm_destroy(struct xe_file *xef, struct xe_vm *vm) { }
 
+static inline void xe_eudebug_exec_queue_create(struct xe_file *xef, u32 id) { }
+static inline void xe_eudebug_exec_queue_destroy(struct xe_file *xef, struct xe_exec_queue *q) { }
+
 #endif /* CONFIG_DRM_XE_EUDEBUG */
 
 #endif /* _XE_EUDEBUG_H_ */
diff --git a/drivers/gpu/drm/xe/xe_eudebug_types.h b/drivers/gpu/drm/xe/xe_eudebug_types.h
index 4bf29d8f1f16..4ad692008131 100644
--- a/drivers/gpu/drm/xe/xe_eudebug_types.h
+++ b/drivers/gpu/drm/xe/xe_eudebug_types.h
@@ -17,6 +17,7 @@
 
 struct xe_device;
 struct task_struct;
+struct workqueue_struct;
 
 /**
  * enum xe_eudebug_state - eudebug capability state
@@ -32,7 +33,7 @@ enum xe_eudebug_state {
 };
 
 #define CONFIG_DRM_XE_DEBUGGER_EVENT_QUEUE_SIZE 64
-#define XE_EUDEBUG_MAX_EVENT_TYPE DRM_XE_EUDEBUG_EVENT_VM
+#define XE_EUDEBUG_MAX_EVENT_TYPE DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE
 
 /**
  * struct xe_eudebug_handle - eudebug resource handle
@@ -63,7 +64,9 @@ struct xe_eudebug_resource {
 };
 
 #define XE_EUDEBUG_RES_TYPE_VM		0
-#define XE_EUDEBUG_RES_TYPE_COUNT	(XE_EUDEBUG_RES_TYPE_VM + 1)
+#define XE_EUDEBUG_RES_TYPE_EXEC_QUEUE	1
+#define XE_EUDEBUG_RES_TYPE_LRC		2
+#define XE_EUDEBUG_RES_TYPE_COUNT	(XE_EUDEBUG_RES_TYPE_LRC + 1)
 
 /**
  * struct xe_eudebug - Top level struct for eudebug: the connection
@@ -102,6 +105,12 @@ struct xe_eudebug {
 	unsigned long flags;
 #define XE_EUDEBUG_READER_ACTIVE 0
 
+	/** @discovery: completion to wait for discovery */
+	struct completion discovery;
+
+	/** @discovery_work: worker to discover resources for target_task */
+	struct work_struct discovery_work;
+
 	/** @events: kfifo queue of to-be-delivered events */
 	struct {
 		/** @lock: guards access to fifo, pending and staging */
@@ -130,3 +139,4 @@ struct xe_eudebug {
 };
 
 #endif /* _XE_EUDEBUG_TYPES_H_ */
+
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 1b5ca3ce578a..1a8d3f5ecc25 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -29,6 +29,7 @@
 #include "xe_trace.h"
 #include "xe_vm.h"
 #include "xe_pxp.h"
+#include "xe_eudebug.h"
 
 /**
  * DOC: Execution Queue
@@ -1420,6 +1421,8 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 
 	args->exec_queue_id = id;
 
+	xe_eudebug_exec_queue_create(xef, id);
+
 	return 0;
 
 del_hw_engine_group:
@@ -1617,6 +1620,8 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
 	if (q->vm && q->hwe->hw_engine_group)
 		xe_hw_engine_group_del_exec_queue(q->hwe->hw_engine_group, q);
 
+	xe_eudebug_exec_queue_destroy(xef, q);
+
 	xe_exec_queue_kill(q);
 
 	trace_xe_exec_queue_close(q);
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
index c3ee37f8cfc0..7319ac0bb91e 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine.h
@@ -78,4 +78,18 @@ enum xe_force_wake_domains xe_hw_engine_to_fw_domain(struct xe_hw_engine *hwe);
 
 u32 xe_hw_engine_mmio_read32(struct xe_hw_engine *hwe, struct xe_reg reg);
 
+static inline bool xe_engine_supports_eudebug(const enum xe_engine_class ec)
+{
+	if (ec == XE_ENGINE_CLASS_COMPUTE ||
+	    ec == XE_ENGINE_CLASS_RENDER)
+		return true;
+
+	return false;
+}
+
+static inline bool xe_hw_engine_has_eudebug(const struct xe_hw_engine *hwe)
+{
+	return xe_engine_supports_eudebug(hwe->class);
+}
+
 #endif
diff --git a/include/uapi/drm/xe_drm_eudebug.h b/include/uapi/drm/xe_drm_eudebug.h
index cdb4e4af4879..c9f21283ffdf 100644
--- a/include/uapi/drm/xe_drm_eudebug.h
+++ b/include/uapi/drm/xe_drm_eudebug.h
@@ -45,6 +45,7 @@ struct drm_xe_eudebug_event {
 #define DRM_XE_EUDEBUG_EVENT_NONE		0
 #define DRM_XE_EUDEBUG_EVENT_READ		1
 #define DRM_XE_EUDEBUG_EVENT_VM			2
+#define DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE		3
 
 	/** @flags: Flags */
 	__u16 flags;
@@ -73,6 +74,31 @@ struct drm_xe_eudebug_event_vm {
 	__u64 vm_handle;
 };
 
+/**
+ * struct drm_xe_eudebug_event_exec_queue - Exec Queue resource event
+ *
+ * Resource creation/destruction event for an Exec Queue
+ */
+struct drm_xe_eudebug_event_exec_queue {
+	/** @base: base event */
+	struct drm_xe_eudebug_event base;
+
+	/** @vm_handle: the vm handle this exec queue belongs to */
+	__u64 vm_handle;
+
+	/** @exec_queue_handle: unique handle for this exec queue */
+	__u64 exec_queue_handle;
+
+	/** @engine_class: engine class for the exec queue */
+	__u32 engine_class;
+
+	/** @width: width of exec queue, how many lrcs (handles) it has */
+	__u32 width;
+
+	/** @lrc_handle: array of lrc handles */
+	__u64 lrc_handle[];
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.43.0

