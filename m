Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85C2BCCFA13
	for <intel-xe@archiver.kernel.org>; Thu, 30 Apr 2026 10:52:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C0AF10F307;
	Thu, 30 Apr 2026 10:52:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OYbAO+A5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34D4310F307
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Apr 2026 10:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777546333; x=1809082333;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uWgMDw13D+a1QA6kI9D/nsRr9Dt3TevXKT6mX4hdDxY=;
 b=OYbAO+A5Dmb/pxO9yThGR+s7rPxwMOdKPsZaQmDADUSmbE00qMvw3qhF
 F3lwdy3GvYF9UdcX502oqL10+6LZDN+MvrOCfMn4m2dkIN8zmMO5ciSsP
 CO6LyL46w0k9AnNTm/YdrS/6XZd2iM2MmJDERMJPHSxux6hlfJiZXhA1u
 ECSxKfjoJ+N0jp0WPbioTysCGWwxSpFDWGdH6ijh6o6xrn5ha7uCDeli6
 Kbd+zEjWa2eEer7W+YWyWp48FFugBprVvYsNP+2ZvIoCiZGJlu1krfEGB
 d+tUVg86R0Ol82Fnd61ow1eG8S6UXYk5EwURFyB9ESM+IUq0NPQ30HQoK A==;
X-CSE-ConnectionGUID: 54ofzqJgRqe0Bc65wMS5Qw==
X-CSE-MsgGUID: MTMqNd4IRfGOnXOFHd4LSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="89585909"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="89585909"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 03:52:12 -0700
X-CSE-ConnectionGUID: xhkyI+NvQwyeP9r4GfPznA==
X-CSE-MsgGUID: 6qttZ/bkSy675Yo9PO5DKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="233518507"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO
 mkuoppal-desk.home.arpa) ([10.245.250.15])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 03:52:07 -0700
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
Subject: [PATCH 04/24] drm/xe/eudebug: Introduce discovery for resources
Date: Thu, 30 Apr 2026 13:51:00 +0300
Message-ID: <20260430105121.712843-5-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430105121.712843-1-mika.kuoppala@linux.intel.com>
References: <20260430105121.712843-1-mika.kuoppala@linux.intel.com>
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

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Co-developed-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Acked-by: Matthew Brost <matthew.brost@intel.com> #locking
---
 drivers/gpu/drm/xe/xe_device.c        |  13 +++-
 drivers/gpu/drm/xe/xe_device.h        |  42 +++++++++++
 drivers/gpu/drm/xe/xe_device_types.h  |   6 ++
 drivers/gpu/drm/xe/xe_eudebug.c       | 104 +++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_eudebug_types.h |   7 ++
 5 files changed, 166 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 4e6773cf806f..7f04951188d9 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -114,6 +114,7 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
 #if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
 	mutex_init(&xef->eudebug.lock);
 	INIT_LIST_HEAD(&xef->eudebug.target_link);
+	init_rwsem(&xef->eudebug.ioctl_lock);
 #endif
 
 	file->driver_priv = xef;
@@ -241,8 +242,12 @@ static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 
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
@@ -259,8 +264,12 @@ static long xe_drm_compat_ioctl(struct file *file, unsigned int cmd, unsigned lo
 
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
index 355d69dc8f54..5a56050bf403 100644
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
index 733f4ab391bd..b72edf776f93 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -584,6 +584,9 @@ struct xe_device {
 
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
index f661b3ae9c9a..360273d25d51 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -35,6 +35,10 @@
  * :ref:`File Descriptor Acquisition Methods <fd_acquisition_methods>` for
  * details on how to obtain the target's fd.
  *
+ * After a successful connection, all existing resources that the target Xe DRM
+ * client already has are sent as events, as if they had been
+ * created right after the connection. This is referred to as discovery.
+ *
  */
 
 /**
@@ -241,6 +245,8 @@ static void xe_eudebug_free(struct kref *ref)
 	struct xe_eudebug *d = container_of(ref, typeof(*d), ref);
 	struct drm_xe_eudebug_event *event;
 
+	WARN_ON(work_pending(&d->discovery_work));
+
 	xe_assert(d->xe, xe_eudebug_detached(d));
 
 	while (kfifo_get(&d->events.fifo, &event))
@@ -302,6 +308,8 @@ static bool xe_eudebug_detach(struct xe_device *xe,
 	}
 	mutex_unlock(&d->target.lock);
 
+	flush_work(&d->discovery_work);
+
 	if (!target)
 		return false;
 
@@ -333,7 +341,7 @@ static int _xe_eudebug_disconnect(struct xe_eudebug *d,
 })
 
 static struct xe_eudebug *
-xe_eudebug_get(struct xe_file *xef)
+xe_eudebug_get_nolock(struct xe_file *xef)
 {
 	struct xe_eudebug *d;
 
@@ -346,7 +354,8 @@ xe_eudebug_get(struct xe_file *xef)
 	if (!d)
 		return NULL;
 
-	if (xe_eudebug_detached(d)) {
+	if (xe_eudebug_detached(d) ||
+	    !completion_done(&d->discovery)) {
 		xe_eudebug_put(d);
 		return NULL;
 	}
@@ -354,6 +363,14 @@ xe_eudebug_get(struct xe_file *xef)
 	return d;
 }
 
+static struct xe_eudebug *
+xe_eudebug_get(struct xe_file *xef)
+{
+	lockdep_assert_held(&xef->eudebug.ioctl_lock);
+
+	return xe_eudebug_get_nolock(xef);
+}
+
 static int xe_eudebug_queue_event(struct xe_eudebug *d,
 				  struct drm_xe_eudebug_event *event)
 {
@@ -575,6 +592,8 @@ static int xe_eudebug_remove_handle(struct xe_eudebug *d, int type, void *p,
 {
 	int ret;
 
+	XE_WARN_ON(!completion_done(&d->discovery));
+
 	ret = _xe_eudebug_remove_handle(d, type, p, seqno);
 
 	eu_dbg(d, "handle type %d handle %p removed: %d\n", type, p, ret);
@@ -706,6 +725,66 @@ void xe_eudebug_vm_destroy(struct xe_file *xef, struct xe_vm *vm)
 	xe_eudebug_event_put(d, vm_destroy_event(d, xef, vm));
 }
 
+static struct xe_file *xe_eudebug_target_get(struct xe_eudebug *d)
+{
+	struct xe_file *xef = NULL;
+
+	mutex_lock(&d->target.lock);
+	if (d->target.xef)
+		xef = xe_file_get(d->target.xef);
+	mutex_unlock(&d->target.lock);
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
+	if (!xef)
+		return;
+
+	down_write(&xef->eudebug.ioctl_lock);
+
+	eu_dbg(d, "Discovery start for %lld", d->session);
+
+	xa_for_each(&xef->vm.xa, i, vm) {
+		err = vm_create_event(d, xef, vm);
+		if (err)
+			break;
+		vm_count++;
+	}
+
+	complete_all(&d->discovery);
+
+	eu_dbg(d, "Discovery end for %lld: %d", d->session, err);
+
+	up_write(&xef->eudebug.ioctl_lock);
+
+	if (vm_count)
+		eu_dbg(d, "Discovery found %u vms", vm_count);
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
@@ -920,6 +999,10 @@ static long xe_eudebug_ioctl(struct file *file,
 	struct xe_eudebug * const d = file->private_data;
 	long ret;
 
+	if (cmd != DRM_XE_EUDEBUG_IOCTL_READ_EVENT &&
+	    !completion_done(&d->discovery))
+		return -EBUSY;
+
 	switch (cmd) {
 	case DRM_XE_EUDEBUG_IOCTL_READ_EVENT:
 		ret = xe_eudebug_read_event(d, arg,
@@ -982,9 +1065,11 @@ xe_eudebug_connect(struct xe_device *xe,
 	mutex_init(&d->target.lock);
 	init_waitqueue_head(&d->events.write_done);
 	init_waitqueue_head(&d->events.read_done);
+	init_completion(&d->discovery);
 
 	spin_lock_init(&d->events.lock);
 	INIT_KFIFO(d->events.fifo);
+	INIT_WORK(&d->discovery_work, discovery_work_fn);
 
 	err = xe_eudebug_resources_init(d);
 	if (XE_IOCTL_DBG(xe, err))
@@ -1006,10 +1091,13 @@ xe_eudebug_connect(struct xe_device *xe,
 		goto err_fd;
 	}
 
-	eu_dbg(d, "connected session %lld", d->session);
-
 	fd_install(fd, file);
 
+	kref_get(&d->ref); /* for discovery */
+	queue_work(xe->eudebug.wq, &d->discovery_work);
+
+	eu_dbg(d, "connected session %lld", d->session);
+
 	return fd;
 
 err_fd:
@@ -1102,6 +1190,7 @@ static void xe_eudebug_sysfs_fini(void *arg)
 void xe_eudebug_init(struct xe_device *xe)
 {
 	struct drm_device *dev = &xe->drm;
+	struct workqueue_struct *wq;
 	int err;
 
 	INIT_LIST_HEAD(&xe->eudebug.targets);
@@ -1112,6 +1201,13 @@ void xe_eudebug_init(struct xe_device *xe)
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
diff --git a/drivers/gpu/drm/xe/xe_eudebug_types.h b/drivers/gpu/drm/xe/xe_eudebug_types.h
index a73eb6c98b02..d7625e55d711 100644
--- a/drivers/gpu/drm/xe/xe_eudebug_types.h
+++ b/drivers/gpu/drm/xe/xe_eudebug_types.h
@@ -17,6 +17,7 @@
 
 struct xe_device;
 struct task_struct;
+struct workqueue_struct;
 
 /**
  * enum xe_eudebug_state - eudebug capability state
@@ -96,6 +97,12 @@ struct xe_eudebug {
 	/** @session: session number for this connection (for logs) */
 	u64 session;
 
+	/** @discovery: completion to wait for discovery */
+	struct completion discovery;
+
+	/** @discovery_work: worker to discover resources for target_task */
+	struct work_struct discovery_work;
+
 	/** @events: kfifo queue of to-be-delivered events */
 	struct {
 		/** @lock: guards access to fifo */
-- 
2.43.0

