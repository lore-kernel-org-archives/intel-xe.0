Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44106D116FE
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 13:53:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F1D110E64F;
	Tue,  2 Dec 2025 13:53:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NkzcFe5v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9136410E64F
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 13:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764683582; x=1796219582;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UjylB0xrLS41d+HYulDwsW4LIfvwF4uVtEYdvMoZYNc=;
 b=NkzcFe5vgoWW4BBTMDjuxCJOdlSK59O3pxuhAY1Qcu82W5VJKOSOi3Ma
 kPfEuEcQ9mvRB1Ruw+bbL981dlB7ZOOlBqP8sh1DdRVJZCZwH9T2gpjB8
 18zLLjfOEC6N3XXemv05w1x4yh4p0Hg1sDldMMpIjcMcaCynMclIyyy/F
 tVMF7J4fFV1J4GawDQcmOxxxcDzWTpdvJ/xSAiT6SV5sea4XQajG+gzUx
 Lk8u2bzjLBlM1tlN0S09QHoCICR+1UfwVJUuQGBCycaoIa/YRN3S/4RAR
 /UAVPJph1iSy0i5VBpoSxm2Jn2vrH/W8ql+7iefvg0Ur72BICMb/0vSx1 Q==;
X-CSE-ConnectionGUID: o6DjAlTlSe+RqzOxFNRK8w==
X-CSE-MsgGUID: WHxhOdvBRDyGFxI4/cvf4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66537027"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="66537027"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 05:53:02 -0800
X-CSE-ConnectionGUID: zh8GB7clSUeFRbmViXUYRw==
X-CSE-MsgGUID: gyLMgPEgSNCJX3Zn/Z5fkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="199505567"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO mkuoppal-desk.lan)
 ([10.245.246.189])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 05:52:58 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, matthew.brost@intel.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, joonas.lahtinen@linux.intel.com,
 christoph.manszewski@intel.com, rodrigo.vivi@intel.com,
 andrzej.hajda@intel.com, matthew.auld@intel.com,
 maciej.patelczyk@intel.com, gwan-gyeong.mun@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Subject: [PATCH 02/20] drm/xe/eudebug: Introduce discovery for resources
Date: Tue,  2 Dec 2025 15:52:21 +0200
Message-ID: <20251202135241.880267-3-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251202135241.880267-1-mika.kuoppala@linux.intel.com>
References: <20251202135241.880267-1-mika.kuoppala@linux.intel.com>
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
 drivers/gpu/drm/xe/xe_device.c        | 13 +++-
 drivers/gpu/drm/xe/xe_device.h        | 42 ++++++++++++
 drivers/gpu/drm/xe/xe_device_types.h  |  6 ++
 drivers/gpu/drm/xe/xe_eudebug.c       | 96 ++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_eudebug_types.h |  7 ++
 5 files changed, 160 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 1c7f98dd42be..a60e5265ae59 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -109,6 +109,7 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
 #if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
 	mutex_init(&xef->eudebug.lock);
 	INIT_LIST_HEAD(&xef->eudebug.target_link);
+	init_rwsem(&xef->eudebug.ioctl_lock);
 #endif
 
 	file->driver_priv = xef;
@@ -232,8 +233,12 @@ static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 
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
@@ -250,8 +255,12 @@ static long xe_drm_compat_ioctl(struct file *file, unsigned int cmd, unsigned lo
 
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
index 6604b89330d5..b3b4cd72e658 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -7,6 +7,7 @@
 #define _XE_DEVICE_H_
 
 #include <drm/drm_util.h>
+#include <drm/drm_ioctl.h>
 
 #include "xe_device_types.h"
 #include "xe_gt_types.h"
@@ -214,4 +215,45 @@ int xe_is_injection_active(void);
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
index 2b4ae7aedd12..6fe6e200fe9f 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -676,6 +676,9 @@ struct xe_device {
 
 		/** @eudebug.lock: protects state and targets */
 		struct mutex lock;
+
+		/** @wq: used for client discovery */
+		struct workqueue_struct *wq;
 	} eudebug;
 #endif
 };
@@ -750,6 +753,9 @@ struct xe_file {
 
 		/** @target_link: link into xe_device.eudebug.targets */
 		struct list_head target_link;
+
+		/** @eudebug.ioctl_lock syncing ioctl access */
+		struct rw_semaphore ioctl_lock;
 	} eudebug;
 #endif
 };
diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index df7ad93d032c..8b43e0384b57 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -168,6 +168,8 @@ static void xe_eudebug_free(struct kref *ref)
 	struct xe_eudebug *d = container_of(ref, typeof(*d), ref);
 	struct drm_xe_eudebug_event *event;
 
+	WARN_ON(work_pending(&d->discovery_work));
+
 	xe_assert(d->xe, xe_eudebug_detached(d));
 
 	while (kfifo_get(&d->events.fifo, &event))
@@ -228,6 +230,8 @@ static bool xe_eudebug_detach(struct xe_device *xe,
 	}
 	spin_unlock(&d->target.lock);
 
+	flush_work(&d->discovery_work);
+
 	if (!target)
 		return false;
 
@@ -259,7 +263,7 @@ static int _xe_eudebug_disconnect(struct xe_eudebug *d,
 })
 
 static struct xe_eudebug *
-xe_eudebug_get(struct xe_file *xef)
+xe_eudebug_get_nolock(struct xe_file *xef)
 {
 	struct xe_eudebug *d;
 
@@ -272,7 +276,8 @@ xe_eudebug_get(struct xe_file *xef)
 	if (!d)
 		return NULL;
 
-	if (xe_eudebug_detached(d)) {
+	if (xe_eudebug_detached(d) ||
+	    !completion_done(&d->discovery)) {
 		xe_eudebug_put(d);
 		return NULL;
 	}
@@ -280,6 +285,14 @@ xe_eudebug_get(struct xe_file *xef)
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
@@ -503,6 +516,8 @@ static int xe_eudebug_remove_handle(struct xe_eudebug *d, int type, void *p,
 {
 	int ret;
 
+	XE_WARN_ON(!completion_done(&d->discovery));
+
 	ret = _xe_eudebug_remove_handle(d, type, p, seqno);
 
 	eu_dbg(d, "handle type %d handle %p removed: %d\n", type, p, ret);
@@ -634,6 +649,66 @@ void xe_eudebug_vm_destroy(struct xe_file *xef, struct xe_vm *vm)
 	xe_eudebug_event_put(d, vm_destroy_event(d, xef, vm));
 }
 
+static struct xe_file *xe_eudebug_target_get(struct xe_eudebug *d)
+{
+	struct xe_file *xef = NULL;
+
+	spin_lock(&d->target.lock);
+	if (d->target.xef)
+		xef = xe_file_get(d->target.xef);
+	spin_unlock(&d->target.lock);
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
@@ -831,6 +906,10 @@ static long xe_eudebug_ioctl(struct file *file,
 	struct xe_eudebug * const d = file->private_data;
 	long ret;
 
+	if (cmd != DRM_XE_EUDEBUG_IOCTL_READ_EVENT &&
+	    !completion_done(&d->discovery))
+		return -EBUSY;
+
 	switch (cmd) {
 	case DRM_XE_EUDEBUG_IOCTL_READ_EVENT:
 		ret = xe_eudebug_read_event(d, arg,
@@ -892,9 +971,11 @@ xe_eudebug_connect(struct xe_device *xe,
 	spin_lock_init(&d->target.lock);
 	init_waitqueue_head(&d->events.write_done);
 	init_waitqueue_head(&d->events.read_done);
+	init_completion(&d->discovery);
 
 	spin_lock_init(&d->events.lock);
 	INIT_KFIFO(d->events.fifo);
+	INIT_WORK(&d->discovery_work, discovery_work_fn);
 
 	d->res = xe_eudebug_resources_alloc();
 	if (XE_IOCTL_DBG(xe, IS_ERR(d->res))) {
@@ -912,6 +993,9 @@ xe_eudebug_connect(struct xe_device *xe,
 		goto err_detach;
 	}
 
+	kref_get(&d->ref);
+	queue_work(xe->eudebug.wq, &d->discovery_work);
+
 	eu_dbg(d, "connected session %lld", d->session);
 
 	return fd;
@@ -1003,6 +1087,7 @@ static void xe_eudebug_sysfs_fini(void *arg)
 void xe_eudebug_init(struct xe_device *xe)
 {
 	struct drm_device *dev = &xe->drm;
+	struct workqueue_struct *wq;
 	int err;
 
 	INIT_LIST_HEAD(&xe->eudebug.targets);
@@ -1013,6 +1098,13 @@ void xe_eudebug_init(struct xe_device *xe)
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
index 1e673c934169..55b71ddd92b6 100644
--- a/drivers/gpu/drm/xe/xe_eudebug_types.h
+++ b/drivers/gpu/drm/xe/xe_eudebug_types.h
@@ -17,6 +17,7 @@
 
 struct xe_device;
 struct task_struct;
+struct workqueue_struct;
 
 /**
  * enum xe_eudebug_state - eudebug capability state
@@ -103,6 +104,12 @@ struct xe_eudebug {
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

