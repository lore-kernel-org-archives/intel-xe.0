Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7604AD0E6D8
	for <intel-xe@archiver.kernel.org>; Mon, 21 Oct 2024 09:59:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37C3D10E472;
	Mon, 21 Oct 2024 09:59:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jYU76C1o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 168A310E475
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Oct 2024 09:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729504779; x=1761040779;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PiG+bU99/ldqTvRsvcsUmBh2DwCYgReabuS2r0xK324=;
 b=jYU76C1odURz5vvgn6Ee20XSanXHeH7hlwAykjMoj137WlAQRW+jI07a
 3h8sGUfkE62WmCW/e+T4JPHwVUohQBRYrxxsKF/Rhj6N0p3I8NkQkgzno
 6Va/yQAolFxn85s/sgmAbTCw5Stccgd92WEkO0Fs63KjroX+2SG/izk7U
 rRapz14Rap5bnl9qIj4c9SPEwFSu8DPXGaFiNIj8d62ALo8aWJuOYS3ST
 SNyq5zuTK26lsZaYwxE3JX/ZjCnYhaMo8GwcpXm0J8Wr64huiCuocKA1y
 Etl588utPHvbnUJYCarbjn3g+vA4xQpNgq9IGx6l/YlHcolw56p9g6UUM Q==;
X-CSE-ConnectionGUID: Z6U3UEEsQK+vS+yAqKKSvw==
X-CSE-MsgGUID: 89IsJTqDSOy1FdH0MzxkIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11231"; a="40350806"
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; d="scan'208";a="40350806"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 02:59:39 -0700
X-CSE-ConnectionGUID: xvKp39b6QcGUJcD7rXin7Q==
X-CSE-MsgGUID: UnPiLOSBTlaBUxHtJwq54g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; d="scan'208";a="84546098"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO rapter.intel.com)
 ([10.245.246.221])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 02:59:36 -0700
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: nirmoy.das@intel.com, matthew.brost@intel.com, stuart.summers@intel.com,
 christoph.manszewski@intel.com, mika.kuoppala@linux.intel.com,
 dominik.grzegorzek@intel.com, andrzej.hajda@intel.com,
 maciej.patelczyk@intel.com
Subject: [RFC 09/19] drm/xe/eudebug: Add vm bind and vm bind ops
Date: Mon, 21 Oct 2024 12:58:48 +0300
Message-ID: <20241021095904.439555-10-gwan-gyeong.mun@intel.com>
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

From: Christoph Manszewski <christoph.manszewski@intel.com>

Add events dedicated to track vma bind and vma unbind operations. The
events are generated for operations performed on xe_vma MAP and UNMAP
for boss and userptrs.

As one bind can result in multiple operations and fail in the middle,
we want to store the events until full successful chain of operations
can be relayed to debugger.

Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
Co-developed-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
---
 drivers/gpu/drm/xe/xe_eudebug.c       | 316 +++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_eudebug.h       |  13 ++
 drivers/gpu/drm/xe/xe_eudebug_types.h |  29 +++
 drivers/gpu/drm/xe/xe_vm.c            |  16 +-
 drivers/gpu/drm/xe/xe_vm_types.h      |  13 ++
 include/uapi/drm/xe_drm_eudebug.h     |  64 ++++++
 6 files changed, 448 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index 5211a3c21a31..a114201696fe 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -824,7 +824,7 @@ static long xe_eudebug_read_event(struct xe_eudebug *d,
 		u64_to_user_ptr(arg);
 	struct drm_xe_eudebug_event user_event;
 	struct xe_eudebug_event *event;
-	const unsigned int max_event = DRM_XE_EUDEBUG_EVENT_EU_ATTENTION;
+	const unsigned int max_event = DRM_XE_EUDEBUG_EVENT_VM_BIND_OP;
 	long ret = 0;
 
 	if (XE_IOCTL_DBG(xe, copy_from_user(&user_event, user_orig, sizeof(user_event))))
@@ -2270,6 +2270,320 @@ void xe_eudebug_exec_queue_destroy(struct xe_file *xef, struct xe_exec_queue *q)
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
+	spin_lock(&vm->eudebug.lock);
+	list_add_tail(&env->link, &vm->eudebug.events);
+
+	if (event->type == DRM_XE_EUDEBUG_EVENT_VM_BIND_OP)
+		++vm->eudebug.ops;
+	spin_unlock(&vm->eudebug.lock);
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
+void xe_eudebug_vm_init(struct xe_vm *vm)
+{
+	INIT_LIST_HEAD(&vm->eudebug.events);
+	spin_lock_init(&vm->eudebug.lock);
+	vm->eudebug.ops = 0;
+	vm->eudebug.ref_seqno = 0;
+}
+
+void xe_eudebug_vm_bind_start(struct xe_vm *vm)
+{
+	struct xe_eudebug *d;
+	u64 seqno = 0;
+	int err;
+
+	if (!xe_vm_in_lr_mode(vm))
+		return;
+
+	d = xe_eudebug_get(vm->xef);
+	if (!d)
+		return;
+
+	lockdep_assert_held_write(&vm->lock);
+
+	if (XE_WARN_ON(!list_empty(&vm->eudebug.events)) ||
+	    XE_WARN_ON(vm->eudebug.ops) ||
+	    XE_WARN_ON(vm->eudebug.ref_seqno)) {
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
+	spin_lock(&vm->eudebug.lock);
+	XE_WARN_ON(vm->eudebug.ref_seqno);
+	vm->eudebug.ref_seqno = seqno;
+	vm->eudebug.ops = 0;
+	spin_unlock(&vm->eudebug.lock);
+
+	xe_eudebug_put(d);
+}
+
+void xe_eudebug_vm_bind_op_add(struct xe_vm *vm, u32 op, u64 addr, u64 range)
+{
+	struct xe_eudebug *d;
+	u32 flags;
+
+	if (!xe_vm_in_lr_mode(vm))
+		return;
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
+	spin_lock(&vm->eudebug.lock);
+	env = list_first_entry_or_null(&vm->eudebug.events,
+				       struct xe_eudebug_event_envelope, link);
+	if (env) {
+		e = env->event;
+		list_del(&env->link);
+	}
+	spin_unlock(&vm->eudebug.lock);
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
+	if (!xe_vm_in_lr_mode(vm))
+		return;
+
+	spin_lock(&vm->eudebug.lock);
+	ref = vm->eudebug.ref_seqno;
+	vm->eudebug.ref_seqno = 0;
+	bind_ops = vm->eudebug.ops;
+	vm->eudebug.ops = 0;
+	spin_unlock(&vm->eudebug.lock);
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
index 1fe86bec99e1..ccc7202b3308 100644
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
 
@@ -33,6 +36,11 @@ void xe_eudebug_vm_destroy(struct xe_file *xef, struct xe_vm *vm);
 void xe_eudebug_exec_queue_create(struct xe_file *xef, struct xe_exec_queue *q);
 void xe_eudebug_exec_queue_destroy(struct xe_file *xef, struct xe_exec_queue *q);
 
+void xe_eudebug_vm_init(struct xe_vm *vm);
+void xe_eudebug_vm_bind_start(struct xe_vm *vm);
+void xe_eudebug_vm_bind_op_add(struct xe_vm *vm, u32 op, u64 addr, u64 range);
+void xe_eudebug_vm_bind_end(struct xe_vm *vm, bool has_ufence, int err);
+
 #else
 
 static inline int xe_eudebug_connect_ioctl(struct drm_device *dev,
@@ -53,6 +61,11 @@ static inline void xe_eudebug_vm_destroy(struct xe_file *xef, struct xe_vm *vm)
 static inline void xe_eudebug_exec_queue_create(struct xe_file *xef, struct xe_exec_queue *q) { }
 static inline void xe_eudebug_exec_queue_destroy(struct xe_file *xef, struct xe_exec_queue *q) { }
 
+static inline void xe_eudebug_vm_init(struct xe_vm *vm) { }
+static inline void xe_eudebug_vm_bind_start(struct xe_vm *vm) { }
+static inline void xe_eudebug_vm_bind_op_add(struct xe_vm *vm, u32 op, u64 addr, u64 range) { }
+static inline void xe_eudebug_vm_bind_end(struct xe_vm *vm, bool has_ufence, int err) { }
+
 #endif /* CONFIG_DRM_XE_EUDEBUG */
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_eudebug_types.h b/drivers/gpu/drm/xe/xe_eudebug_types.h
index 73b3f906da66..78739954967b 100644
--- a/drivers/gpu/drm/xe/xe_eudebug_types.h
+++ b/drivers/gpu/drm/xe/xe_eudebug_types.h
@@ -177,6 +177,11 @@ struct xe_eudebug_event {
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
@@ -258,4 +263,28 @@ struct xe_eudebug_event_eu_attention {
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
index 034e17d039ec..c9840c3fd3b8 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1412,6 +1412,8 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	for_each_tile(tile, xe, id)
 		xe_range_fence_tree_init(&vm->rftree[id]);
 
+	xe_eudebug_vm_init(vm);
+
 	vm->pt_ops = &xelp_pt_ops;
 
 	/*
@@ -1640,6 +1642,8 @@ static void vm_destroy_work_func(struct work_struct *w)
 	struct xe_tile *tile;
 	u8 id;
 
+	xe_eudebug_vm_bind_end(vm, 0, -ENOENT);
+
 	/* xe_vm_close_and_put was not called? */
 	xe_assert(xe, !vm->size);
 
@@ -2649,7 +2653,7 @@ static void vm_bind_ioctl_ops_fini(struct xe_vm *vm, struct xe_vma_ops *vops,
 				   struct dma_fence *fence)
 {
 	struct xe_exec_queue *wait_exec_queue = to_wait_exec_queue(vm, vops->q);
-	struct xe_user_fence *ufence;
+	struct xe_user_fence *ufence = NULL;
 	struct xe_vma_op *op;
 	int i;
 
@@ -2664,6 +2668,9 @@ static void vm_bind_ioctl_ops_fini(struct xe_vm *vm, struct xe_vma_ops *vops,
 			xe_vma_destroy(gpuva_to_vma(op->base.remap.unmap->va),
 				       fence);
 	}
+
+	xe_eudebug_vm_bind_end(vm, ufence, 0);
+
 	if (ufence)
 		xe_sync_ufence_put(ufence);
 	for (i = 0; i < vops->num_syncs; i++)
@@ -3072,6 +3079,8 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		if (err)
 			goto unwind_ops;
 
+		xe_eudebug_vm_bind_op_add(vm, op, addr, range);
+
 #ifdef TEST_VM_OPS_ERROR
 		if (flags & FORCE_OP_ERROR) {
 			vops.inject_error = true;
@@ -3095,8 +3104,11 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
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
index 7f9a303e51d8..557b047ebdd7 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -282,6 +282,19 @@ struct xe_vm {
 	bool batch_invalidate_tlb;
 	/** @xef: XE file handle for tracking this VM's drm client */
 	struct xe_file *xef;
+
+#if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
+	struct {
+		/** @lock: Lock for eudebug_bind members */
+		spinlock_t lock;
+		/** @events: List of vm bind ops gathered */
+		struct list_head events;
+		/** @ops: How many operations we have stored */
+		u32 ops;
+		/** @ref_seqno: Reference to the VM_BIND that the ops relate */
+		u64 ref_seqno;
+	} eudebug;
+#endif
 };
 
 /** struct xe_vma_op_map - VMA map operation */
diff --git a/include/uapi/drm/xe_drm_eudebug.h b/include/uapi/drm/xe_drm_eudebug.h
index 3c43aefefedd..44cf1b699589 100644
--- a/include/uapi/drm/xe_drm_eudebug.h
+++ b/include/uapi/drm/xe_drm_eudebug.h
@@ -29,6 +29,8 @@ struct drm_xe_eudebug_event {
 #define DRM_XE_EUDEBUG_EVENT_VM			3
 #define DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE		4
 #define DRM_XE_EUDEBUG_EVENT_EU_ATTENTION	5
+#define DRM_XE_EUDEBUG_EVENT_VM_BIND		6
+#define DRM_XE_EUDEBUG_EVENT_VM_BIND_OP		7
 
 	__u16 flags;
 #define DRM_XE_EUDEBUG_EVENT_CREATE		(1 << 0)
@@ -93,6 +95,68 @@ struct drm_xe_eudebug_eu_control {
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
2.46.1

