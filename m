Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B362C624D6
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 15:00:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5829610E154;
	Thu,  3 Sep 2026 15:00:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GGB3x0li";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6153510E154
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 15:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788447626; x=1819983626;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vDsIdHGkY1VYyWveNkv02u1CB87rWOQdQuk/vUWkZUY=;
 b=GGB3x0li2B4HlgT2gNODq51jxohk1qUo0hoEKJB3358qi5eC3+O77lWh
 OKT8XWu2rJ2oKQrheMNl9++qOPpQic1ID5qzDoT3NifPeJ5HGqDscEVQf
 rq5mtfyZ8qxenXguVD3toeBSACtEJohGH2v+MKGzr0wV6Eq5mZeN/M6wn
 cujZiSWD36Z2axAoJxpfQDIN1Kwc0iepZqcSIPIU28xCqG7I1LHoch9Jy
 CZYXSetmXZ1uBp//JOviKrGMY5zIMKb9HoTEX9r1Njnp4n14z5LtdFZzA
 tGfI8HXD8vVJUJu4J9OaDZJ/rcuxwMtHSjLyfUQeekjGDrKkl/jRdaf4S Q==;
X-CSE-ConnectionGUID: UeAlMw9QQvWIfQ0zPnsEVg==
X-CSE-MsgGUID: rQMc9RuaTZGqaSH7emcAOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="76486638"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="76486638"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 08:00:25 -0700
X-CSE-ConnectionGUID: mhGYCcTjRau0lChtB7HCLw==
X-CSE-MsgGUID: P9UzIdJVRdOFZmuYTFb77g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="268440509"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 mkuoppal-desk.intel.com) ([10.245.246.233])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 08:00:20 -0700
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
Subject: [PATCH v10 04/27] drm/xe/eudebug: Introduce discovery for resources
Date: Thu,  3 Sep 2026 17:59:28 +0300
Message-ID: <20260903145952.848051-5-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260903145952.848051-1-mika.kuoppala@linux.intel.com>
References: <20260903145952.848051-1-mika.kuoppala@linux.intel.com>
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

Based on discovery work by Maciej Patelczyk for the i915 driver.

v2: - use rw_semaphore to block DRM ioctls during discovery (Matthew)
    - only lock according to ioctl at play (Dominik)

v4: - s/discovery_lock/ioctl_lock
    - change lock to be per xe_file as is connections
v5: - helper to get eudebug instance during discovery (Maciej)
v6: - complete_all even if no client (Sashiko)
    - don't flush on detach (Sashiko)
v7: - guard close with ioctl lock (Sashiko)
v8: - discovery lock comment fix (Maciej)
v9: - disconnect on failed discovery (Sashiko)
    - avoid close race (Sashiko)

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Co-developed-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Acked-by: Matthew Brost <matthew.brost@intel.com> #locking
---
 Documentation/gpu/xe/xe_eudebug.rst   |   3 +
 drivers/gpu/drm/xe/xe_device.c        |  13 ++-
 drivers/gpu/drm/xe/xe_device.h        |  42 +++++++
 drivers/gpu/drm/xe/xe_device_types.h  |  15 +++
 drivers/gpu/drm/xe/xe_eudebug.c       | 156 +++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_eudebug.h       |   4 +
 drivers/gpu/drm/xe/xe_eudebug_types.h |   9 +-
 drivers/gpu/drm/xe/xe_exec_queue.c    |   1 +
 drivers/gpu/drm/xe/xe_hw_engine.h     |  14 +++
 include/uapi/drm/xe_drm_eudebug.h     |  26 +++++
 10 files changed, 276 insertions(+), 7 deletions(-)

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
index 12c84b7c7758..01254c73b2c6 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -114,6 +114,7 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
 
 #if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
 	INIT_LIST_HEAD(&xef->eudebug.target_link);
+	init_rwsem(&xef->eudebug.ioctl_lock);
 #endif
 
 	file->driver_priv = xef;
@@ -238,8 +239,12 @@ static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 
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
@@ -256,8 +261,12 @@ static long xe_drm_compat_ioctl(struct file *file, unsigned int cmd, unsigned lo
 
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
index 6d3d6d5eba29..5672709bea35 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -7,6 +7,7 @@
 #define _XE_DEVICE_H_
 
 #include <drm/drm_util.h>
+#include <drm/drm_ioctl.h>
 
 #include "xe_device_types.h"
 #include "xe_gt_types.h"
@@ -297,4 +298,45 @@ static inline bool xe_device_is_admin_only(const struct xe_device *xe)
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
index f5a5ff4d8873..a9584634279d 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -616,6 +616,9 @@ struct xe_device {
 
 		/** @eudebug.lock: protects state and targets */
 		struct mutex lock;
+
+		/** @eudebug.discovery_wq: used for client resource discovery */
+		struct workqueue_struct *discovery_wq;
 	} eudebug;
 #endif
 
@@ -704,6 +707,18 @@ struct xe_file {
 
 		/** @eudebug.target_link: link into xe_device.eudebug.targets */
 		struct list_head target_link;
+
+		/**
+		 * @eudebug.ioctl_lock: excludes the ioctls that mutate the
+		 * eudebug visible resources of this client, so that a writer
+		 * sees a stable set of vms and exec queues. Taken for read
+		 * around the whole ioctl by xe_eudebug_discovery_lock(), for
+		 * the ioctls named in xe_eudebug_needs_ioctl_lock(), and for
+		 * write by resource discovery and by file close. Held across
+		 * an entire ioctl, so it nests outside every lock those
+		 * ioctls take.
+		 */
+		struct rw_semaphore ioctl_lock;
 	} eudebug;
 #endif
 };
diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index 835dbd7309af..7a5b14346e05 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -17,6 +17,8 @@
 #include "xe_device.h"
 #include "xe_eudebug.h"
 #include "xe_eudebug_types.h"
+#include "xe_exec_queue.h"
+#include "xe_hw_engine.h"
 #include "xe_macros.h"
 #include "xe_vm.h"
 
@@ -37,6 +39,10 @@
  * :ref:`File Descriptor Acquisition Methods <fd_acquisition_methods>` for
  * details on how to obtain the target's fd.
  *
+ * After a successful connection, all existing resources that the target Xe DRM
+ * client already has are sent as events, as if they had been
+ * created right after the connection. This is referred to as discovery.
+ *
  */
 
 /**
@@ -223,6 +229,8 @@ static void xe_eudebug_free(struct kref *ref)
 {
 	struct xe_eudebug *d = container_of(ref, typeof(*d), ref);
 
+	WARN_ON(work_pending(&d->discovery_work));
+
 	xe_assert(d->xe, xe_eudebug_detached(d));
 
 	xe_eudebug_resources_destroy(d);
@@ -234,7 +242,7 @@ static void xe_eudebug_free(struct kref *ref)
 	kfree(d);
 }
 
-static void xe_eudebug_put(struct xe_eudebug *d)
+void xe_eudebug_put(struct xe_eudebug *d)
 {
 	kref_put(&d->ref, xe_eudebug_free);
 }
@@ -323,7 +331,7 @@ static int event_fifo_pending(struct xe_eudebug *d,
 }
 
 static struct xe_eudebug *
-xe_eudebug_get(struct xe_file *xef)
+__xe_eudebug_get(struct xe_file *xef)
 {
 	struct xe_device *xe = xef->xe;
 	struct xe_eudebug *d;
@@ -345,6 +353,42 @@ xe_eudebug_get(struct xe_file *xef)
 	return d;
 }
 
+static struct xe_eudebug *
+_xe_eudebug_get(struct xe_file *xef)
+{
+	struct xe_eudebug *d;
+
+	d = __xe_eudebug_get(xef);
+
+	if (d && !completion_done(&d->discovery)) {
+		xe_eudebug_put(d);
+		return NULL;
+	}
+
+	return d;
+}
+
+static struct xe_eudebug *
+xe_eudebug_get(struct xe_file *xef)
+{
+	lockdep_assert_held(&xef->eudebug.ioctl_lock);
+
+	return _xe_eudebug_get(xef);
+}
+
+struct xe_eudebug *
+xe_eudebug_get_nolock(struct xe_file *xef)
+{
+	return _xe_eudebug_get(xef);
+}
+
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
@@ -519,6 +563,8 @@ static int xe_eudebug_remove_handle(struct xe_eudebug *d, int type, void *p,
 {
 	int ret;
 
+	XE_WARN_ON(!completion_done(&d->discovery));
+
 	ret = _xe_eudebug_remove_handle(d, type, p, seqno);
 
 	eu_dbg(d, "handle type %d handle %p removed: %d\n", type, p, ret);
@@ -659,6 +705,87 @@ void xe_eudebug_vm_destroy(struct xe_file *xef, struct xe_vm *vm)
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
+	/*
+	 * An xe_eudebug ref is taken for the discovery worker, which holds a
+	 * ref to the target xe_file; the xe_file in turn holds the vm and
+	 * exec_queue refs.
+	 *
+	 * All the relevant ioctls that manipulate the xe_file resources eudebug
+	 * cares about are gated behind down_read(&xef->eudebug.ioctl_lock).
+	 * Thus taking the write lock excludes all those ioctls, which lets us
+	 * peek into the resource lists without taking their individual locks.
+	 */
+	down_write(&xef->eudebug.ioctl_lock);
+
+	if (xe_eudebug_detached(d))
+		goto out;
+
+	eu_dbg(d, "Discovery start for %lld", d->session);
+
+	/* vm lifetime guaranteed by the ioctl_lock */
+	xa_for_each(&xef->vm.xa, i, vm) {
+		err = vm_create_event(d, vm);
+		if (err)
+			goto out;
+		vm_count++;
+	}
+
+out:
+	complete_all(&d->discovery);
+
+	up_write(&xef->eudebug.ioctl_lock);
+
+	if (vm_count)
+		eu_dbg(d, "Discovery found %u vms",
+		       vm_count);
+
+	xe_file_put(xef);
+
+	eu_dbg(d, "Discovery end for %lld: %d", d->session, err);
+
+	if (err < 0)
+		xe_eudebug_disconnect(d, err);
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
@@ -917,6 +1044,10 @@ static long xe_eudebug_ioctl(struct file *file,
 	struct xe_eudebug * const d = file->private_data;
 	long ret;
 
+	if (cmd != DRM_XE_EUDEBUG_IOCTL_READ_EVENT &&
+	    !completion_done(&d->discovery))
+		return -EBUSY;
+
 	switch (cmd) {
 	case DRM_XE_EUDEBUG_IOCTL_READ_EVENT:
 		ret = xe_eudebug_read_event(d, arg,
@@ -967,9 +1098,11 @@ xe_eudebug_connect(struct xe_device *xe,
 
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
@@ -1017,6 +1150,9 @@ xe_eudebug_connect(struct xe_device *xe,
 		goto err_fd;
 	}
 
+	kref_get(&d->ref); /* for discovery */
+	queue_work(xe->eudebug.discovery_wq, &d->discovery_work);
+
 	eu_dbg(d, "connected session %lld", d->session);
 
 	drm_dev_get(&xe->drm);
@@ -1039,11 +1175,15 @@ void xe_eudebug_file_close(struct xe_file *xef)
 {
 	struct xe_eudebug *d;
 
-	d = xe_eudebug_get(xef);
+	down_write(&xef->eudebug.ioctl_lock);
+
+	d = __xe_eudebug_get(xef);
 	if (d) {
 		xe_eudebug_detach(d, 0);
 		xe_eudebug_put(d);
 	}
+
+	up_write(&xef->eudebug.ioctl_lock);
 }
 
 bool xe_eudebug_is_enabled(struct xe_device *xe)
@@ -1126,12 +1266,20 @@ void xe_eudebug_init_early(struct xe_device *xe)
 void xe_eudebug_init(struct xe_device *xe)
 {
 	struct drm_device *dev = &xe->drm;
+	struct workqueue_struct *wq;
 	int err;
 
 	/* early init failed */
 	if (xe->eudebug.cap_state == XE_EUDEBUG_CAP_NOT_SUPPORTED)
 		return;
 
+	wq = drmm_alloc_ordered_workqueue(dev, "xe-eudebug-discovery", 0);
+	if (IS_ERR(wq)) {
+		err = PTR_ERR(wq);
+		goto out_err;
+	}
+	xe->eudebug.discovery_wq = wq;
+
 	err = sysfs_create_file(&dev->dev->kobj,
 				&dev_attr_enable_eudebug.attr);
 	if (err)
diff --git a/drivers/gpu/drm/xe/xe_eudebug.h b/drivers/gpu/drm/xe/xe_eudebug.h
index a314cfa26a68..2d9b6e23315d 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.h
+++ b/drivers/gpu/drm/xe/xe_eudebug.h
@@ -51,6 +51,10 @@ void xe_eudebug_vm_create(struct xe_file *xef, struct xe_vm *vm);
 void xe_eudebug_vm_destroy(struct xe_file *xef, struct xe_vm *vm);
 int xe_eudebug_enable(struct xe_device *xe, bool enable);
 
+struct xe_eudebug *xe_eudebug_get_nolock(struct xe_file *xef);
+struct xe_eudebug *xe_eudebug_get_nolock_with_discovery(struct xe_file *xef);
+void xe_eudebug_put(struct xe_eudebug *d);
+
 #else
 
 static inline int xe_eudebug_connect_ioctl(struct drm_device *dev,
diff --git a/drivers/gpu/drm/xe/xe_eudebug_types.h b/drivers/gpu/drm/xe/xe_eudebug_types.h
index 46d78f4f8061..cc4b5f6f2a3a 100644
--- a/drivers/gpu/drm/xe/xe_eudebug_types.h
+++ b/drivers/gpu/drm/xe/xe_eudebug_types.h
@@ -19,6 +19,7 @@
 #include <uapi/drm/xe_drm_eudebug.h>
 
 struct xe_device;
+struct workqueue_struct;
 
 /**
  * enum xe_eudebug_cap_state - eudebug capability state
@@ -33,7 +34,7 @@ enum xe_eudebug_cap_state {
 	XE_EUDEBUG_CAP_ENABLED,
 };
 
-#define XE_EUDEBUG_MAX_EVENT_TYPE DRM_XE_EUDEBUG_EVENT_VM
+#define XE_EUDEBUG_MAX_EVENT_TYPE DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE
 
 /**
  * struct xe_eudebug_handle - eudebug resource handle
@@ -100,6 +101,12 @@ struct xe_eudebug {
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
 		/** @events.lock: guards access to fifo, pending and staging */
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index c4213bb9c137..a663c55b386d 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -29,6 +29,7 @@
 #include "xe_trace.h"
 #include "xe_vm.h"
 #include "xe_pxp.h"
+#include "xe_eudebug.h"
 
 /**
  * DOC: Execution Queue
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
index d33b8b371aae..934afe400330 100644
--- a/include/uapi/drm/xe_drm_eudebug.h
+++ b/include/uapi/drm/xe_drm_eudebug.h
@@ -66,6 +66,7 @@ struct drm_xe_eudebug_event {
 #define DRM_XE_EUDEBUG_EVENT_NONE		0
 #define DRM_XE_EUDEBUG_EVENT_READ		1
 #define DRM_XE_EUDEBUG_EVENT_VM			2
+#define DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE		3
 
 	/** @flags: Flags */
 	__u16 flags;
@@ -94,6 +95,31 @@ struct drm_xe_eudebug_event_vm {
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
2.53.0

