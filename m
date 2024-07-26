Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F017C52CDA
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jul 2024 14:17:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FF4310E9B2;
	Fri, 26 Jul 2024 14:17:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BTrHUhBh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04CFC10E9AB
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jul 2024 14:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722003454; x=1753539454;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Tvv1c9cgZN3zRY6319msJ2NmU9pS4DmryXL2iCLRJ/E=;
 b=BTrHUhBhsMAZPCYCAEZ6e1JmGGHjKVAt1uwWMNptnk4oNk2BII49NZVu
 aofd3QVIbyoT1EQPnthC1jYOiLe4XdODh4sxPh3mWCicOb5FhqTI6G/IP
 GV0DgLUaECDlVxnrLy6LJ+fc2DWqEEr0nj17Pd2Yxi2fUa6IWZEU7MMtN
 or/65KGeFQd6HoRcPzbN+n4Ke+AHTF7FCHwmB2h7k7L6/XDkzUOJmVvbl
 GIEYQKBzib2WmMZEEGul5srHLYHwGyeX+j+wTFqU0NrkMLwUVdesX5lqQ
 v8/vjU3Q9vDSDKFycWKWXrKvouBF2MhaV2zqsBltnVWMjNLgryv9g5UtE w==;
X-CSE-ConnectionGUID: kTsKCT6jS1OpM+GLRs8jyA==
X-CSE-MsgGUID: y4PPuFgXTy2vJ477B7jjdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="23598764"
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="23598764"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 07:17:34 -0700
X-CSE-ConnectionGUID: xyxBnyDPRrWpRIaPgOMn9Q==
X-CSE-MsgGUID: ThNqtrpwQd+ABBWqhKML8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="57861410"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 07:17:32 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Christoph Manszewski <christoph.manszewski@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH 12/21] drm/xe/eudebug: Add vm bind and vm bind ops
Date: Fri, 26 Jul 2024 17:08:09 +0300
Message-Id: <20240726140818.54304-13-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240726140818.54304-1-mika.kuoppala@linux.intel.com>
References: <20240726140818.54304-1-mika.kuoppala@linux.intel.com>
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

Add events dedicated to track vma bind and vma unbind operations. The
events are generated for operations performed on xe_vma MAP and UNMAP
for boss and userptrs.

As one bind can result in multiple operations and fail in the middle,
we want to store the events until full successful chain of operations
can be relayed to debugger.

v2: !bind_ref warning in wrong spot (Christoph, Maciej)
v3: vm bind flags
v4: _packed fixed in event_vm_bind (jcavitt)
v6: vmbind ops without map/unmaps handled (Mika)
v7: guard ref with spinlock (Mika)
v8: teardown events on vm destroy to avoid leak (Mika)

Co-developed-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_eudebug.c       | 297 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_eudebug.h       |   7 +
 drivers/gpu/drm/xe/xe_eudebug_types.h |  29 +++
 drivers/gpu/drm/xe/xe_vm.c            |  18 +-
 drivers/gpu/drm/xe/xe_vm_types.h      |  11 +
 include/uapi/drm/xe_drm_eudebug.h     |  66 +++++-
 6 files changed, 425 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index 582805bebf26..8f0e6a56a65e 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -2210,6 +2210,303 @@ void xe_eudebug_exec_queue_destroy(struct xe_file *xef, struct xe_exec_queue *q)
 	xe_eudebug_event_put(d, exec_queue_destroy_event(d, xef, q));
 }
 
+static int xe_eudebug_queue_bind_event(struct xe_eudebug *d,
+				       struct xe_vm *vm,
+				       struct xe_eudebug_event *event)
+{
+	struct xe_eudebug_event_envelope *env;
+
+	lockdep_assert_held_write(&vm->lock);
+
+	env = kmalloc(sizeof(*env), GFP_KERNEL);
+	if (!env)
+		return -ENOMEM;
+
+	INIT_LIST_HEAD(&env->link);
+	env->event = event;
+
+	spin_lock(&vm->eudebug_bind.lock);
+	list_add_tail(&env->link, &vm->eudebug_bind.events);
+
+	if (event->type == DRM_XE_EUDEBUG_EVENT_VM_BIND_OP)
+		++vm->eudebug_bind.ops;
+	spin_unlock(&vm->eudebug_bind.lock);
+
+	return 0;
+}
+
+static int queue_vm_bind_event(struct xe_eudebug *d,
+			       struct xe_vm *vm,
+			       u64 client_handle,
+			       u64 vm_handle,
+			       u32 bind_flags,
+			       u32 num_ops, u64 *seqno)
+{
+	struct xe_eudebug_event_vm_bind *e;
+	struct xe_eudebug_event *event;
+	const u32 sz = sizeof(*e);
+	const u32 base_flags = DRM_XE_EUDEBUG_EVENT_STATE_CHANGE;
+
+	*seqno = atomic_long_inc_return(&d->events.seqno);
+
+	event = xe_eudebug_create_event(d, DRM_XE_EUDEBUG_EVENT_VM_BIND,
+					*seqno, base_flags, sz, GFP_KERNEL);
+	if (!event)
+		return -ENOMEM;
+
+	e = cast_event(e, event);
+	write_member(struct drm_xe_eudebug_event_vm_bind, e, client_handle, client_handle);
+	write_member(struct drm_xe_eudebug_event_vm_bind, e, vm_handle, vm_handle);
+	write_member(struct drm_xe_eudebug_event_vm_bind, e, flags, bind_flags);
+	write_member(struct drm_xe_eudebug_event_vm_bind, e, num_binds, num_ops);
+
+	/* If in discovery, no need to collect ops */
+	if (!completion_done(&d->discovery)) {
+		XE_WARN_ON(!num_ops);
+		return xe_eudebug_queue_event(d, event);
+	}
+
+	return xe_eudebug_queue_bind_event(d, vm, event);
+}
+
+static int vm_bind_event(struct xe_eudebug *d,
+			 struct xe_vm *vm,
+			 u32 num_ops,
+			 u64 *seqno)
+{
+	int h_c, h_vm;
+
+	h_c = find_handle(d->res, XE_EUDEBUG_RES_TYPE_CLIENT, vm->xef);
+	if (h_c < 0)
+		return h_c;
+
+	h_vm = find_handle(d->res, XE_EUDEBUG_RES_TYPE_VM, vm);
+	if (h_vm < 0)
+		return h_vm;
+
+	return queue_vm_bind_event(d, vm, h_c, h_vm, 0,
+				   num_ops, seqno);
+}
+
+static int vm_bind_op_event(struct xe_eudebug *d,
+			    struct xe_vm *vm,
+			    const u32 flags,
+			    const u64 bind_ref_seqno,
+			    const u64 num_extensions,
+			    u64 addr, u64 range,
+			    u64 *op_seqno)
+{
+	struct xe_eudebug_event_vm_bind_op *e;
+	struct xe_eudebug_event *event;
+	const u32 sz = sizeof(*e);
+
+	*op_seqno = atomic_long_inc_return(&d->events.seqno);
+
+	event = xe_eudebug_create_event(d, DRM_XE_EUDEBUG_EVENT_VM_BIND_OP,
+					*op_seqno, flags, sz, GFP_KERNEL);
+	if (!event)
+		return -ENOMEM;
+
+	e = cast_event(e, event);
+
+	write_member(struct drm_xe_eudebug_event_vm_bind_op, e, vm_bind_ref_seqno, bind_ref_seqno);
+	write_member(struct drm_xe_eudebug_event_vm_bind_op, e, num_extensions, num_extensions);
+	write_member(struct drm_xe_eudebug_event_vm_bind_op, e, addr, addr);
+	write_member(struct drm_xe_eudebug_event_vm_bind_op, e, range, range);
+
+	/* If in discovery, no need to collect ops */
+	if (!completion_done(&d->discovery))
+		return xe_eudebug_queue_event(d, event);
+
+	return xe_eudebug_queue_bind_event(d, vm, event);
+}
+
+static int vm_bind_op(struct xe_eudebug *d, struct xe_vm *vm,
+		      const u32 flags, const u64 bind_ref_seqno,
+		      u64 addr, u64 range)
+{
+	u64 op_seqno = 0;
+	u64 num_extensions = 0;
+	int ret;
+
+	ret = vm_bind_op_event(d, vm, flags, bind_ref_seqno, num_extensions,
+			       addr, range, &op_seqno);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+void xe_eudebug_vm_bind_start(struct xe_vm *vm)
+{
+	struct xe_eudebug *d;
+	u64 seqno = 0;
+	int err;
+
+	d = xe_eudebug_get(vm->xef);
+	if (!d)
+		return;
+
+	lockdep_assert_held_write(&vm->lock);
+
+	if (XE_WARN_ON(!list_empty(&vm->eudebug_bind.events)) ||
+	    XE_WARN_ON(vm->eudebug_bind.ops) ||
+	    XE_WARN_ON(vm->eudebug_bind.ref)) {
+		eu_err(d, "bind busy on %s",  __func__);
+		xe_eudebug_disconnect(d, -EINVAL);
+	}
+
+	err = vm_bind_event(d, vm, 0, &seqno);
+	if (err) {
+		eu_err(d, "error %d on %s", err, __func__);
+		xe_eudebug_disconnect(d, err);
+	}
+
+	spin_lock(&vm->eudebug_bind.lock);
+	XE_WARN_ON(vm->eudebug_bind.ref);
+	vm->eudebug_bind.ref = seqno;
+	vm->eudebug_bind.ops = 0;
+	spin_unlock(&vm->eudebug_bind.lock);
+
+	xe_eudebug_put(d);
+}
+
+void xe_eudebug_vm_bind_op_add(struct xe_vm *vm, u32 op, u64 addr, u64 range)
+{
+	struct xe_eudebug *d;
+	u32 flags;
+
+	switch (op) {
+	case DRM_XE_VM_BIND_OP_MAP:
+	case DRM_XE_VM_BIND_OP_MAP_USERPTR:
+	{
+		flags = DRM_XE_EUDEBUG_EVENT_CREATE;
+		break;
+	}
+	case DRM_XE_VM_BIND_OP_UNMAP:
+	case DRM_XE_VM_BIND_OP_UNMAP_ALL:
+		flags = DRM_XE_EUDEBUG_EVENT_DESTROY;
+		break;
+	default:
+		flags = 0;
+		break;
+	}
+
+	if (!flags)
+		return;
+
+	d = xe_eudebug_get(vm->xef);
+	if (!d)
+		return;
+
+	xe_eudebug_event_put(d, vm_bind_op(d, vm, flags, 0, addr, range));
+}
+
+static struct xe_eudebug_event *fetch_bind_event(struct xe_vm * const vm)
+{
+	struct xe_eudebug_event_envelope *env;
+	struct xe_eudebug_event *e = NULL;
+
+	spin_lock(&vm->eudebug_bind.lock);
+	env = list_first_entry_or_null(&vm->eudebug_bind.events,
+				       struct xe_eudebug_event_envelope, link);
+	if (env) {
+		e = env->event;
+		list_del(&env->link);
+	}
+	spin_unlock(&vm->eudebug_bind.lock);
+
+	kfree(env);
+
+	return e;
+}
+
+static void fill_vm_bind_fields(struct xe_vm *vm,
+				struct xe_eudebug_event *e,
+				bool ufence,
+				u32 bind_ops)
+{
+	struct xe_eudebug_event_vm_bind *eb = cast_event(eb, e);
+
+	eb->flags = ufence ?
+		DRM_XE_EUDEBUG_EVENT_VM_BIND_FLAG_UFENCE : 0;
+	eb->num_binds = bind_ops;
+}
+
+static void fill_vm_bind_op_fields(struct xe_vm *vm,
+				   struct xe_eudebug_event *e,
+				   u64 ref_seqno)
+{
+	struct xe_eudebug_event_vm_bind_op *op;
+
+	if (e->type != DRM_XE_EUDEBUG_EVENT_VM_BIND_OP)
+		return;
+
+	op = cast_event(op, e);
+	op->vm_bind_ref_seqno = ref_seqno;
+}
+
+void xe_eudebug_vm_bind_end(struct xe_vm *vm, bool has_ufence, int bind_err)
+{
+	struct xe_eudebug_event *e;
+	struct xe_eudebug *d;
+	u32 bind_ops;
+	u64 ref;
+
+	spin_lock(&vm->eudebug_bind.lock);
+	ref = vm->eudebug_bind.ref;
+	vm->eudebug_bind.ref = 0;
+	bind_ops = vm->eudebug_bind.ops;
+	vm->eudebug_bind.ops = 0;
+	spin_unlock(&vm->eudebug_bind.lock);
+
+	e = fetch_bind_event(vm);
+	if (!e)
+		return;
+
+	d = NULL;
+	if (!bind_err && ref) {
+		d = xe_eudebug_get(vm->xef);
+		if (d) {
+			if (bind_ops) {
+				fill_vm_bind_fields(vm, e, has_ufence, bind_ops);
+			} else {
+				/*
+				 * If there was no ops we are interested in,
+				 * we can omit the whole sequence
+				 */
+				xe_eudebug_put(d);
+				d = NULL;
+			}
+		}
+	}
+
+	while (e) {
+		int err = 0;
+
+		if (d) {
+			err = xe_eudebug_queue_event(d, e);
+			if (!err)
+				e = NULL;
+		}
+
+		if (err) {
+			xe_eudebug_disconnect(d, err);
+			xe_eudebug_put(d);
+			d = NULL;
+		}
+
+		kfree(e);
+
+		e = fetch_bind_event(vm);
+		if (e && ref)
+			fill_vm_bind_op_fields(vm, e, ref);
+	}
+
+	if (d)
+		xe_eudebug_put(d);
+}
+
 static int discover_client(struct xe_eudebug *d, struct xe_file *xef)
 {
 	struct xe_exec_queue *q;
diff --git a/drivers/gpu/drm/xe/xe_eudebug.h b/drivers/gpu/drm/xe/xe_eudebug.h
index 1e233c4683d6..2cab90773b21 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.h
+++ b/drivers/gpu/drm/xe/xe_eudebug.h
@@ -5,11 +5,14 @@
 
 #ifndef _XE_EUDEBUG_H_
 
+#include <linux/types.h>
+
 struct drm_device;
 struct drm_file;
 struct xe_device;
 struct xe_file;
 struct xe_vm;
+struct xe_vma;
 struct xe_exec_queue;
 struct xe_hw_engine;
 
@@ -31,4 +34,8 @@ void xe_eudebug_vm_destroy(struct xe_file *xef, struct xe_vm *vm);
 void xe_eudebug_exec_queue_create(struct xe_file *xef, struct xe_exec_queue *q);
 void xe_eudebug_exec_queue_destroy(struct xe_file *xef, struct xe_exec_queue *q);
 
+void xe_eudebug_vm_bind_start(struct xe_vm *vm);
+void xe_eudebug_vm_bind_op_add(struct xe_vm *vm, u32 op, u64 addr, u64 range);
+void xe_eudebug_vm_bind_end(struct xe_vm *vm, bool has_ufence, int err);
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_eudebug_types.h b/drivers/gpu/drm/xe/xe_eudebug_types.h
index a75986180d71..1ffe33f15409 100644
--- a/drivers/gpu/drm/xe/xe_eudebug_types.h
+++ b/drivers/gpu/drm/xe/xe_eudebug_types.h
@@ -176,6 +176,11 @@ struct xe_eudebug_event {
 	u8 data[];
 };
 
+struct xe_eudebug_event_envelope {
+	struct list_head link;
+	struct xe_eudebug_event *event;
+};
+
 /**
  * struct xe_eudebug_event_open - Internal event for client open/close
  */
@@ -257,4 +262,28 @@ struct xe_eudebug_event_eu_attention {
 	u8 bitmask[];
 };
 
+/**
+ * struct xe_eudebug_event_vm_bind - Internal event for vm bind/unbind operation
+ */
+struct xe_eudebug_event_vm_bind {
+	/** @base: base event */
+	struct xe_eudebug_event base;
+
+	u64 client_handle;
+	u64 vm_handle;
+
+	u32 flags;
+	u32 num_binds;
+};
+
+struct xe_eudebug_event_vm_bind_op {
+	/** @base: base event */
+	struct xe_eudebug_event base;
+	u64 vm_bind_ref_seqno;
+	u64 num_extensions;
+
+	u64 addr; /* Zero for unmap all ? */
+	u64 range; /* Zero for unmap all ? */
+};
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 9e101c992d9c..657a54b74eea 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1411,6 +1411,9 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	for_each_tile(tile, xe, id)
 		xe_range_fence_tree_init(&vm->rftree[id]);
 
+	INIT_LIST_HEAD(&vm->eudebug_bind.events);
+	spin_lock_init(&vm->eudebug_bind.lock);
+
 	vm->pt_ops = &xelp_pt_ops;
 
 	/*
@@ -1656,6 +1659,8 @@ static void vm_destroy_work_func(struct work_struct *w)
 	struct xe_tile *tile;
 	u8 id;
 
+	xe_eudebug_vm_bind_end(vm, 0, 0);
+
 	/* xe_vm_close_and_put was not called? */
 	xe_assert(xe, !vm->size);
 
@@ -2675,7 +2680,7 @@ static void vm_bind_ioctl_ops_fini(struct xe_vm *vm, struct xe_vma_ops *vops,
 				   struct dma_fence *fence)
 {
 	struct xe_exec_queue *wait_exec_queue = to_wait_exec_queue(vm, vops->q);
-	struct xe_user_fence *ufence;
+	struct xe_user_fence *ufence = NULL;
 	struct xe_vma_op *op;
 	int i;
 
@@ -2690,6 +2695,9 @@ static void vm_bind_ioctl_ops_fini(struct xe_vm *vm, struct xe_vma_ops *vops,
 			xe_vma_destroy(gpuva_to_vma(op->base.remap.unmap->va),
 				       fence);
 	}
+
+	xe_eudebug_vm_bind_end(vm, ufence, 0);
+
 	if (ufence)
 		xe_sync_ufence_put(ufence);
 	for (i = 0; i < vops->num_syncs; i++)
@@ -3067,6 +3075,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	}
 
 	xe_vma_ops_init(&vops, vm, q, syncs, num_syncs);
+
 	for (i = 0; i < args->num_binds; ++i) {
 		u64 range = bind_ops[i].range;
 		u64 addr = bind_ops[i].addr;
@@ -3089,6 +3098,8 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		if (err)
 			goto unwind_ops;
 
+		xe_eudebug_vm_bind_op_add(vm, op, addr, range);
+
 #ifdef TEST_VM_OPS_ERROR
 		if (flags & FORCE_OP_ERROR) {
 			vops.inject_error = true;
@@ -3112,8 +3123,11 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	err = vm_bind_ioctl_ops_execute(vm, &vops);
 
 unwind_ops:
-	if (err && err != -ENODATA)
+	if (err && err != -ENODATA) {
+		xe_eudebug_vm_bind_end(vm, num_ufence > 0, err);
 		vm_bind_ioctl_ops_unwind(vm, ops, args->num_binds);
+	}
+
 	xe_vma_ops_fini(&vops);
 	for (i = args->num_binds - 1; i >= 0; --i)
 		if (ops[i])
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 7f9a303e51d8..da9d7ef6ab8f 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -282,6 +282,17 @@ struct xe_vm {
 	bool batch_invalidate_tlb;
 	/** @xef: XE file handle for tracking this VM's drm client */
 	struct xe_file *xef;
+
+	struct {
+		/** @lock: Lock for eudebug_bind members */
+		spinlock_t lock;
+		/** @events: List of vm bind ops gathered */
+		struct list_head events;
+		/** @ops: How many operations we have stored */
+		u32 ops;
+		/** @ref: Reference to the VM_BIND that the ops relate */
+		u64 ref;
+	} eudebug_bind;
 };
 
 /** struct xe_vma_op_map - VMA map operation */
diff --git a/include/uapi/drm/xe_drm_eudebug.h b/include/uapi/drm/xe_drm_eudebug.h
index c33c207ffd62..789c8aa81c09 100644
--- a/include/uapi/drm/xe_drm_eudebug.h
+++ b/include/uapi/drm/xe_drm_eudebug.h
@@ -29,7 +29,9 @@ struct drm_xe_eudebug_event {
 #define DRM_XE_EUDEBUG_EVENT_VM			3
 #define DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE		4
 #define DRM_XE_EUDEBUG_EVENT_EU_ATTENTION	5
-#define DRM_XE_EUDEBUG_EVENT_MAX_EVENT		DRM_XE_EUDEBUG_EVENT_EU_ATTENTION
+#define DRM_XE_EUDEBUG_EVENT_VM_BIND		6
+#define DRM_XE_EUDEBUG_EVENT_VM_BIND_OP		7
+#define DRM_XE_EUDEBUG_EVENT_MAX_EVENT		DRM_XE_EUDEBUG_EVENT_VM_BIND_OP
 
 	__u16 flags;
 #define DRM_XE_EUDEBUG_EVENT_CREATE		(1 << 0)
@@ -94,6 +96,68 @@ struct drm_xe_eudebug_eu_control {
 	__u64 bitmask_ptr;
 };
 
+/*
+ *  When client (debuggee) does vm_bind_ioctl() following event
+ *  sequence will be created (for the debugger):
+ *
+ *  ┌───────────────────────┐
+ *  │  EVENT_VM_BIND        ├───────┬─┬─┐
+ *  └───────────────────────┘       │ │ │
+ *      ┌───────────────────────┐   │ │ │
+ *      │ EVENT_VM_BIND_OP #1   ├───┘ │ │
+ *      └───────────────────────┘     │ │
+ *                 ...                │ │
+ *      ┌───────────────────────┐     │ │
+ *      │ EVENT_VM_BIND_OP #n   ├─────┘ │
+ *      └───────────────────────┘       │
+ *                                      │
+ *      ┌───────────────────────┐       │
+ *      │ EVENT_UFENCE          ├───────┘
+ *      └───────────────────────┘
+ *
+ * All the events below VM_BIND will reference the VM_BIND
+ * they associate with, by field .vm_bind_ref_seqno.
+ * event_ufence will only be included if the client did
+ * attach sync of type UFENCE into its vm_bind_ioctl().
+ *
+ * When EVENT_UFENCE is sent by the driver, all the OPs of
+ * the original VM_BIND are completed and the [addr,range]
+ * contained in them are present and modifiable through the
+ * vm accessors. Accessing [addr, range] before related ufence
+ * event will lead to undefined results as the actual bind
+ * operations are async and the backing storage might not
+ * be there on a moment of receiving the event.
+ *
+ * Client's UFENCE sync will be held by the driver: client's
+ * drm_xe_wait_ufence will not complete and the value of the ufence
+ * won't appear until ufence is acked by the debugger process calling
+ * DRM_XE_EUDEBUG_IOCTL_ACK_EVENT with the event_ufence.base.seqno.
+ * This will signal the fence, .value will update and the wait will
+ * complete allowing the client to continue.
+ *
+ */
+
+struct drm_xe_eudebug_event_vm_bind {
+	struct drm_xe_eudebug_event base;
+
+	__u64 client_handle;
+	__u64 vm_handle;
+
+	__u32 flags;
+#define DRM_XE_EUDEBUG_EVENT_VM_BIND_FLAG_UFENCE (1 << 0)
+
+	__u32 num_binds;
+};
+
+struct drm_xe_eudebug_event_vm_bind_op {
+	struct drm_xe_eudebug_event base;
+	__u64 vm_bind_ref_seqno; /* *_event_vm_bind.base.seqno */
+	__u64 num_extensions;
+
+	__u64 addr; /* XXX: Zero for unmap all? */
+	__u64 range; /* XXX: Zero for unmap all? */
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.34.1

