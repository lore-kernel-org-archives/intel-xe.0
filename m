Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26A2DCCFA13
	for <intel-xe@archiver.kernel.org>; Thu, 30 Apr 2026 10:52:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7BF410F304;
	Thu, 30 Apr 2026 10:52:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LvQvuwz4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2A3710F304
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Apr 2026 10:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777546362; x=1809082362;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CClVfLpc9sydn7I8iwYEYQUe+3qqQmCqGvyEyF7KkWQ=;
 b=LvQvuwz4IStt2IlTPLNRNN2sh9KlsY+e0BKb69sywj9lfBpNpyzHmYvG
 qEJkp3LX+eH+4sYHJHigYkfXG6HWs4mRh0ffJx4DULWz17WXgNOYbDvJC
 kYzCZzGUh3+Sqf2+mtgMhpnaOmEmOenJJLIZ6YbTKRL4saoNS7CLLKL7f
 fZQ3+T0qvEaS/SqgDdKX2O6v0GWorGYvsui6xpmTOHCkwl++jpPNDWmbN
 WjJYgrEW5CNa+Q4Hw6b3cpSss8j4ZYiIBKNBOCTQuyrw36YBUtUT7Xuui
 /TDCvn51ZqDdTZ0ByjEIFSalunQAH8A8nRlp17lAjPKjsT1GlXC6WL19q w==;
X-CSE-ConnectionGUID: LJG3xjngTC2vGOI6wi6YgA==
X-CSE-MsgGUID: Lxskmw4oSIiz+65ht8TM6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="89585944"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="89585944"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 03:52:42 -0700
X-CSE-ConnectionGUID: 43dUTGeMSBS8zUGItmULIw==
X-CSE-MsgGUID: p4ltI6mtQHij1bMmpXiNDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="233518682"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO
 mkuoppal-desk.home.arpa) ([10.245.250.15])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 03:52:36 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, matthew.brost@intel.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, joonas.lahtinen@linux.intel.com,
 gustavo.sousa@intel.com, jan.maslak@intel.com,
 dominik.karol.piatkowski@intel.com, rodrigo.vivi@intel.com,
 andrzej.hajda@intel.com, matthew.auld@intel.com,
 maciej.patelczyk@intel.com, gwan-gyeong.mun@intel.com,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH 09/24] drm/xe/eudebug: Introduce vm bind and vm bind debug
 data events
Date: Thu, 30 Apr 2026 13:51:05 +0300
Message-ID: <20260430105121.712843-10-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430105121.712843-1-mika.kuoppala@linux.intel.com>
References: <20260430105121.712843-1-mika.kuoppala@linux.intel.com>
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

From: Christoph Manszewski <christoph.manszewski@intel.com>

This patch adds events to track the bind ioctl and associated debug data add
and remove operations. As a single bind can involve multiple operations and
may fail mid-process.

Add bind event to signal to debugger when bind operation is executed.
Further add debug data add and remove operations so debugger
can keep track of regions where they reside. The bind event is
important as we will want to include ufence event further
in the series and tie it to this bind.

Only deliver bind+operations to the debugger if the vm bind
op execution chain succeeds.

v2: - avoid sending bind if there is no operations (Mika)
    - documentation (Christoph, Mika)

Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
Co-developed-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 Documentation/gpu/xe/xe_eudebug.rst   |   6 +
 drivers/gpu/drm/xe/xe_eudebug.c       | 226 +++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_eudebug.h       |   7 +
 drivers/gpu/drm/xe/xe_eudebug_types.h |   2 +-
 drivers/gpu/drm/xe/xe_vm.c            |   4 +
 include/uapi/drm/xe_drm_eudebug.h     |  85 ++++++++++
 6 files changed, 325 insertions(+), 5 deletions(-)

diff --git a/Documentation/gpu/xe/xe_eudebug.rst b/Documentation/gpu/xe/xe_eudebug.rst
index e191e2c8ded4..1f743f1d6f2a 100644
--- a/Documentation/gpu/xe/xe_eudebug.rst
+++ b/Documentation/gpu/xe/xe_eudebug.rst
@@ -57,3 +57,9 @@ Resource Event Types
 
 .. kernel-doc:: include/uapi/drm/xe_drm_eudebug.h
    :identifiers: drm_xe_eudebug_event_exec_queue
+
+.. kernel-doc:: include/uapi/drm/xe_drm_eudebug.h
+   :identifiers: drm_xe_eudebug_event_vm_bind
+
+.. kernel-doc:: include/uapi/drm/xe_drm_eudebug.h
+   :identifiers: drm_xe_eudebug_event_vm_bind_op_debug_data
diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index 7c553881a617..b66b834c0575 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -12,6 +12,7 @@
 #include <uapi/drm/xe_drm.h>
 
 #include "xe_assert.h"
+#include "xe_debug_data_types.h"
 #include "xe_device.h"
 #include "xe_eudebug.h"
 #include "xe_eudebug_types.h"
@@ -924,6 +925,167 @@ void xe_eudebug_exec_queue_destroy(struct xe_file *xef, struct xe_exec_queue *q)
 	xe_eudebug_event_put(d, exec_queue_destroy_event(d, xef, q));
 }
 
+static int send_vm_bind_event(struct xe_eudebug *d,
+			      struct xe_vm *vm,
+			      u64 vm_handle,
+			      u32 bind_flags,
+			      u32 num_ops, u64 *seqno)
+{
+	struct drm_xe_eudebug_event_vm_bind *e;
+	struct drm_xe_eudebug_event *event;
+	const u32 sz = sizeof(*e);
+	const u32 base_flags = DRM_XE_EUDEBUG_EVENT_STATE_CHANGE;
+
+	*seqno = atomic_long_inc_return(&d->events.seqno);
+
+	event = xe_eudebug_create_event(d, DRM_XE_EUDEBUG_EVENT_VM_BIND,
+					*seqno, base_flags, sz);
+	if (!event)
+		return -ENOMEM;
+
+	e = cast_event(e, event);
+
+	e->vm_handle = vm_handle;
+	e->flags = bind_flags;
+	e->num_bind_ops = num_ops;
+
+	return xe_eudebug_queue_event(d, event);
+}
+
+static int vm_bind_event(struct xe_eudebug *d,
+			 struct xe_vm *vm,
+			 u32 flags,
+			 u32 num_ops,
+			 u64 *seqno)
+{
+	int h_vm;
+
+	h_vm = find_handle(d, XE_EUDEBUG_RES_TYPE_VM, vm);
+	if (h_vm < 0)
+		return h_vm;
+
+	return send_vm_bind_event(d, vm, h_vm, flags,
+				  num_ops, seqno);
+}
+
+static int vm_bind_op_event(struct xe_eudebug *d,
+			    struct xe_vm *vm,
+			    const u32 flags,
+			    const u64 bind_ref_seqno,
+			    const u64 num_extensions,
+			    struct xe_debug_data *debug_data,
+			    u64 *op_seqno)
+{
+	struct drm_xe_eudebug_event_vm_bind_op_debug_data *e;
+	struct drm_xe_eudebug_event *event;
+	const u32 sz = sizeof(*e);
+
+	*op_seqno = atomic_long_inc_return(&d->events.seqno);
+
+	event = xe_eudebug_create_event(d, DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_DEBUG_DATA,
+					*op_seqno, flags, sz);
+	if (!event)
+		return -ENOMEM;
+
+	e = cast_event(e, event);
+
+	e->vm_bind_ref_seqno = bind_ref_seqno;
+	e->num_extensions = num_extensions;
+	e->addr = debug_data->addr;
+	e->range = debug_data->range;
+	e->flags = debug_data->flags;
+	e->offset = debug_data->offset;
+
+	if (debug_data->flags & DRM_XE_VM_BIND_DEBUG_DATA_FLAG_PSEUDO)
+		e->pseudopath = debug_data->pseudopath;
+	else
+		strscpy(e->pathname, debug_data->pathname, PATH_MAX);
+
+	return xe_eudebug_queue_event(d, event);
+}
+
+static int vm_bind_op(struct xe_eudebug *d, struct xe_vm *vm,
+		      const u32 flags, const u64 bind_ref_seqno,
+		      struct xe_debug_data *debug_data)
+{
+	u64 op_seqno = 0;
+	u64 num_extensions = 0;
+	int ret;
+
+	ret = vm_bind_op_event(d, vm, flags, bind_ref_seqno, num_extensions,
+			       debug_data, &op_seqno);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+void xe_eudebug_vm_bind_execute(struct xe_vm *vm,
+				struct xe_vma_ops *ops)
+{
+	struct xe_eudebug *d;
+	struct xe_vma_op *op;
+	u64 bind_seqno = 0;
+	u32 num_ops;
+	int err;
+
+	if (!xe_vm_in_lr_mode(vm))
+		return;
+
+	d = xe_eudebug_get(vm->xef);
+	if (!d)
+		return;
+
+	num_ops = 0;
+	list_for_each_entry(op, &ops->list, link) {
+		if (op->base.op != DRM_GPUVA_OP_DRIVER)
+			continue;
+
+		if (op->subop == XE_VMA_SUBOP_ADD_DEBUG_DATA ||
+		    op->subop == XE_VMA_SUBOP_REMOVE_DEBUG_DATA)
+			num_ops++;
+	}
+
+	lockdep_assert_held_write(&vm->lock);
+
+	if (!num_ops) {
+		xe_eudebug_put(d);
+		return;
+	}
+
+	err = vm_bind_event(d, vm, 0,
+			    num_ops, &bind_seqno);
+	if (err)
+		goto out_err;
+
+	list_for_each_entry(op, &ops->list, link) {
+		u32 flags = 0;
+
+		if (op->base.op != DRM_GPUVA_OP_DRIVER)
+			continue;
+
+		if (op->subop == XE_VMA_SUBOP_ADD_DEBUG_DATA)
+			flags = DRM_XE_EUDEBUG_EVENT_CREATE;
+
+		if (op->subop == XE_VMA_SUBOP_REMOVE_DEBUG_DATA)
+			flags = DRM_XE_EUDEBUG_EVENT_DESTROY;
+
+		if (!flags)
+			continue;
+
+		err = vm_bind_op(d, vm, flags, bind_seqno,
+				 &op->modify_debug_data.debug_data);
+		if (err)
+			goto out_err;
+	}
+
+out_err:
+	if (err)
+		xe_eudebug_disconnect(d, err);
+
+	xe_eudebug_put(d);
+}
+
 static struct xe_file *xe_eudebug_target_get(struct xe_eudebug *d)
 {
 	struct xe_file *xef = NULL;
@@ -936,19 +1098,67 @@ static struct xe_file *xe_eudebug_target_get(struct xe_eudebug *d)
 	return xef;
 }
 
+static int vm_discover_binds(struct xe_eudebug *d, struct xe_vm *vm)
+{
+	struct xe_debug_data *dd;
+	struct list_head *pos;
+	unsigned int ops, count;
+	u64 ref_seqno;
+	int err;
+
+	if (list_empty(&vm->debug_data.list))
+		return 0;
+
+	count = 0;
+	list_for_each(pos, &vm->debug_data.list)
+		count++;
+
+	ops = count;
+	ref_seqno = 0;
+	err = vm_bind_event(d, vm, 0, ops, &ref_seqno);
+	if (err) {
+		eu_dbg(d, "vm_bind_event error %d\n", err);
+		return err;
+	}
+
+	list_for_each_entry(dd, &vm->debug_data.list, link) {
+		err = vm_bind_op(d, vm, DRM_XE_EUDEBUG_EVENT_CREATE, ref_seqno, dd);
+		if (err) {
+			eu_dbg(d, "vm_bind_op error %d\n", err);
+			return err;
+		}
+
+		ops--;
+	}
+
+	XE_WARN_ON(ops);
+
+	return ops ? -EIO : count;
+}
+
 static void discover_client(struct xe_eudebug *d)
 {
 	struct xe_file *xef;
 	struct xe_exec_queue *q;
 	struct xe_vm *vm;
 	unsigned long i;
-	unsigned int vm_count = 0, eq_count = 0;
+	unsigned int vm_count = 0, eq_count = 0, ops_count = 0;
 	int err = 0;
 
 	xef = xe_eudebug_target_get(d);
 	if (!xef)
 		return;
 
+	/*
+	 * xe_eudebug ref is taken for discovery worker. It will
+	 * hold target xe_file ref and xe_file holds vm and exec_queue
+	 * refs.
+	 *
+	 * The relevant ioctls through xe_file are through
+	 * down_read(&xef->eudebug.lock). That means we can peek inside
+	 * the resources without taking their respective locks by
+	 * taking write lock.
+	 */
 	down_write(&xef->eudebug.ioctl_lock);
 
 	eu_dbg(d, "Discovery start for %lld", d->session);
@@ -958,6 +1168,12 @@ static void discover_client(struct xe_eudebug *d)
 		if (err)
 			break;
 		vm_count++;
+
+		err = vm_discover_binds(d, vm);
+		if (err < 0)
+			break;
+
+		ops_count += err;
 	}
 
 	xa_for_each(&xef->exec_queue.xa, i, q) {
@@ -967,6 +1183,8 @@ static void discover_client(struct xe_eudebug *d)
 		err = exec_queue_create_event(d, xef, q);
 		if (err)
 			break;
+
+		eq_count++;
 	}
 
 	complete_all(&d->discovery);
@@ -975,9 +1193,9 @@ static void discover_client(struct xe_eudebug *d)
 
 	up_write(&xef->eudebug.ioctl_lock);
 
-	if (vm_count || eq_count)
-		eu_dbg(d, "Discovery found %u vms, %u exec_queues",
-		       vm_count, eq_count);
+	if (vm_count || eq_count || ops_count)
+		eu_dbg(d, "Discovery found %u vms, %u exec_queues, %u bind_ops",
+		       vm_count, eq_count, ops_count);
 
 	xe_file_put(xef);
 }
diff --git a/drivers/gpu/drm/xe/xe_eudebug.h b/drivers/gpu/drm/xe/xe_eudebug.h
index 10480a226fac..9c622362c0f7 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.h
+++ b/drivers/gpu/drm/xe/xe_eudebug.h
@@ -10,10 +10,14 @@
 
 struct drm_device;
 struct drm_file;
+struct xe_debug_data;
 struct xe_device;
 struct xe_file;
 struct xe_vm;
+struct xe_vma;
+struct xe_vma_ops;
 struct xe_exec_queue;
+struct xe_user_fence;
 
 #if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
 
@@ -50,6 +54,8 @@ int xe_eudebug_enable(struct xe_device *xe, bool enable);
 void xe_eudebug_exec_queue_create(struct xe_file *xef, struct xe_exec_queue *q);
 void xe_eudebug_exec_queue_destroy(struct xe_file *xef, struct xe_exec_queue *q);
 
+void xe_eudebug_vm_bind_execute(struct xe_vm *vm, struct xe_vma_ops *ops);
+
 #else
 
 static inline int xe_eudebug_connect_ioctl(struct drm_device *dev,
@@ -67,6 +73,7 @@ static inline void xe_eudebug_vm_destroy(struct xe_file *xef, struct xe_vm *vm)
 static inline void xe_eudebug_exec_queue_create(struct xe_file *xef, struct xe_exec_queue *q) { }
 static inline void xe_eudebug_exec_queue_destroy(struct xe_file *xef, struct xe_exec_queue *q) { }
 
+static inline void xe_eudebug_vm_bind_execute(struct xe_vm *vm, struct xe_vma_ops *ops) { }
 #endif /* CONFIG_DRM_XE_EUDEBUG */
 
 #endif /* _XE_EUDEBUG_H_ */
diff --git a/drivers/gpu/drm/xe/xe_eudebug_types.h b/drivers/gpu/drm/xe/xe_eudebug_types.h
index 9c111c483778..1bd6eb2aa102 100644
--- a/drivers/gpu/drm/xe/xe_eudebug_types.h
+++ b/drivers/gpu/drm/xe/xe_eudebug_types.h
@@ -33,7 +33,7 @@ enum xe_eudebug_state {
 };
 
 #define CONFIG_DRM_XE_DEBUGGER_EVENT_QUEUE_SIZE 64
-#define XE_EUDEBUG_MAX_EVENT_TYPE DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE
+#define XE_EUDEBUG_MAX_EVENT_TYPE DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_DEBUG_DATA
 
 /**
  * struct xe_eudebug_handle - eudebug resource handle
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 9a3980e8422a..f00bd5801b0c 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3588,6 +3588,10 @@ static struct dma_fence *vm_bind_ioctl_ops_execute(struct xe_vm *vm,
 		xe_vm_set_validation_exec(vm, &exec);
 		fence = ops_execute(vm, vops);
 		xe_vm_set_validation_exec(vm, NULL);
+
+		if (!IS_ERR(fence) || PTR_ERR(fence) == -ENODATA)
+			xe_eudebug_vm_bind_execute(vm, vops);
+
 		if (IS_ERR(fence)) {
 			if (PTR_ERR(fence) == -ENODATA)
 				vm_bind_ioctl_ops_fini(vm, vops, NULL);
diff --git a/include/uapi/drm/xe_drm_eudebug.h b/include/uapi/drm/xe_drm_eudebug.h
index c9f21283ffdf..230c8cdcbd21 100644
--- a/include/uapi/drm/xe_drm_eudebug.h
+++ b/include/uapi/drm/xe_drm_eudebug.h
@@ -46,6 +46,8 @@ struct drm_xe_eudebug_event {
 #define DRM_XE_EUDEBUG_EVENT_READ		1
 #define DRM_XE_EUDEBUG_EVENT_VM			2
 #define DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE		3
+#define DRM_XE_EUDEBUG_EVENT_VM_BIND		4
+#define DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_DEBUG_DATA	5
 
 	/** @flags: Flags */
 	__u16 flags;
@@ -99,6 +101,89 @@ struct drm_xe_eudebug_event_exec_queue {
 	__u64 lrc_handle[];
 };
 
+/**
+ * struct drm_xe_eudebug_event_vm_bind - VM Bind Event
+ *
+ * When the client (debuggee) calls the vm_bind_ioctl with the
+ * DRM_XE_VM_BIND_OP_[ADD|REMOVE]_DEBUG_DATA operation, the following event
+ * sequence will be created (for the debugger)::
+ *
+ *  ┌───────────────────────┐
+ *  │  EVENT_VM_BIND        ├──────────────────┬─┬┄┐
+ *  └───────────────────────┘                  │ │ ┊
+ *      ┌──────────────────────────────────┐   │ │ ┊
+ *      │ EVENT_VM_BIND_OP_DEBUG_DATA #1   ├───┘ │ ┊
+ *      └──────────────────────────────────┘     │ ┊
+ *                      ...                      │ ┊
+ *      ┌──────────────────────────────────┐     │ ┊
+ *      │ EVENT_VM_BIND_OP_DEBUG_DATA #n   ├─────┘ ┊
+ *      └──────────────────────────────────┘       ┊
+ *                                                 ┊
+ *      ┌┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┐       ┊
+ *      ┊ EVENT_UFENCE                     ├┄┄┄┄┄┄┄┘
+ *      └┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┘
+ *
+ * All the events below VM_BIND will reference the VM_BIND
+ * they associate with, by field .vm_bind_ref_seqno.
+ */
+struct drm_xe_eudebug_event_vm_bind {
+	/** @base: Base event */
+	struct drm_xe_eudebug_event base;
+
+	/** @vm_handle: VM handle for this bind */
+	__u64 vm_handle;
+
+	/** @flags: Bind specific flags */
+	__u32 flags;
+
+	/** @num_bind_ops: How many [ADD|REMOVE]_DEBUG_DATA operations this bind has */
+	__u32 num_bind_ops;
+};
+
+/**
+ * struct drm_xe_eudebug_event_vm_bind_op_debug_data - VM Bind Op Debug Data Event
+ *
+ * When the target drm client issues a vm bind, each operation of type
+ * %DRM_XE_VM_BIND_OP_ADD_DEBUG_DATA or %DRM_XE_VM_BIND_OP_REMOVE_DEBUG_DATA
+ * will generate an event of this type. For reference see
+ * :c:type:`drm_xe_vm_bind_op_ext_debug_data`.
+ */
+struct drm_xe_eudebug_event_vm_bind_op_debug_data {
+	/** @base: Base event */
+	struct drm_xe_eudebug_event base;
+
+	/** @vm_bind_ref_seqno: Parent :c:member:`drm_xe_eudebug_event_vm_bind.base.seqno` */
+	__u64 vm_bind_ref_seqno;
+
+	/** @num_extensions: Extension count for this op */
+	__u64 num_extensions;
+
+	/** @addr: Address of the debug data mapping */
+	__u64 addr;
+
+	/** @range: Range of the debug data mapping */
+	__u64 range;
+
+	/** @flags: Debug data flags */
+	__u64 flags;
+
+	/** @offset: Offset into the debug data file */
+	__u32 offset;
+
+	/** @reserved: Reserved, must be zero */
+	__u32 reserved;
+	union {
+		/**
+		 * @pseudopath: Pseudopath if
+		 * %DRM_XE_VM_BIND_DEBUG_DATA_FLAG_PSEUDO was set
+		 */
+		__u64 pseudopath;
+
+		/** @pathname: Path to the debug data file */
+		char pathname[PATH_MAX];
+	};
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.43.0

