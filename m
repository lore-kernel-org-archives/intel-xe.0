Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70903C87FD2
	for <intel-xe@archiver.kernel.org>; Fri,  8 Aug 2025 10:44:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3765B10E1E1;
	Fri,  8 Aug 2025 10:44:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nD1FwCd7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09F8A10E1E1
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Aug 2025 10:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754649878; x=1786185878;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PEMjpQtVDJh8zYtliIbBBQUyAWMB5DKeefosj7eDtkM=;
 b=nD1FwCd7Xn5r9dbKQXzKcXZJC7l7YRz9dqV4J9i4ThQdXB9h5Nb+Iuh9
 GXpGW1j8fU+X9BMrMruSyoemqgB+Mg5vysBk++7Ib7B60xoLVAohRQxSv
 O27VMswiXTAMcBV9kWSGc0z9/i1ZBJee7ykEuU2RCUbO3qOEz8uJVW7dn
 hbXT890edtAuEdKQ6qle3YhT7pZMCh++EyFLstTkMpjm4IPTeUlBPQhbM
 nZBlAdYy2zy+10eCBzWvYqYYrp19kV5wufz9eSpQyed6dFK5GcFD/I8Dx
 2Qb1JJkYkQZfHLO2cGdCstKtIxcMMfAggyen4wzQPS/x1fmIZczyFLGbj Q==;
X-CSE-ConnectionGUID: UXj5eLLET7ad0oPVYrn3oA==
X-CSE-MsgGUID: BRJOlWDRQn2zdo8lhYZGBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="67265650"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="67265650"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 03:44:38 -0700
X-CSE-ConnectionGUID: hsh0g5m8TH2YFvNGp5jUDw==
X-CSE-MsgGUID: MOWkHLcFR2iLZuQkLPdkrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="164518967"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO mkuoppal-desk.lan)
 ([10.245.245.185])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 03:44:35 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, matthew.brost@intel.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, joonas.lahtinen@linux.intel.com,
 christoph.manszewski@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, andrzej.hajda@intel.com, matthew.auld@intel.com,
 maciej.patelczyk@intel.com, gwan-gyeong.mun@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH 06/15] drm/xe/eudebug: Introduce vm bind and vm bind debug
 data events
Date: Fri,  8 Aug 2025 13:43:41 +0300
Message-ID: <20250808104356.3294210-8-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250808104356.3294210-1-mika.kuoppala@linux.intel.com>
References: <20250808104356.3294210-1-mika.kuoppala@linux.intel.com>
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
may fail mid-process, events are stored until the full chain of operations
succeeds before relaying to the debugger. If no debug data operations occur,
no events are sent to avoid unnecessary debugger notifications.

Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
Co-developed-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_debug_data.c    |   4 +
 drivers/gpu/drm/xe/xe_eudebug.c       | 382 +++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_eudebug.h       |  13 +
 drivers/gpu/drm/xe/xe_eudebug_types.h |   2 +-
 drivers/gpu/drm/xe/xe_vm.c            |  14 +-
 drivers/gpu/drm/xe/xe_vm_types.h      |  13 +
 include/uapi/drm/xe_drm_eudebug.h     |  71 +++++
 7 files changed, 492 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_debug_data.c b/drivers/gpu/drm/xe/xe_debug_data.c
index 99044dc477d5..7952fc764815 100644
--- a/drivers/gpu/drm/xe/xe_debug_data.c
+++ b/drivers/gpu/drm/xe/xe_debug_data.c
@@ -3,6 +3,7 @@
  * Copyright © 2025 Intel Corporation
  */
 
+#include "xe_eudebug.h"
 #include "xe_debug_data.h"
 #include "xe_debug_data_types.h"
 #include "xe_vm.h"
@@ -136,6 +137,8 @@ static int xe_debug_data_add(struct xe_vm *vm, struct xe_vma_op *vma_op,
 
 	memcpy(&vma_op->modify_debug_data.debug_data, dd, sizeof(*dd));
 
+	xe_eudebug_vm_bind_op_add(vm, DRM_XE_VM_BIND_OP_ADD_DEBUG_DATA, dd);
+
 	return 0;
 }
 
@@ -153,6 +156,7 @@ static int xe_debug_data_remove(struct xe_vm *vm, struct xe_vma_op *vma_op,
 	mutex_lock(&vm->debug_data.lock);
 	list_for_each_entry(dd, &vm->debug_data.list, link) {
 		if (dd->addr == ext->addr && dd->range == ext->range) {
+			xe_eudebug_vm_bind_op_add(vm, DRM_XE_VM_BIND_OP_REMOVE_DEBUG_DATA, dd);
 			list_del(&dd->link);
 			memcpy(&vma_op->modify_debug_data.debug_data, dd, sizeof(*dd));
 			kfree(dd);
diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index a6c0d2391e0e..9c44195b5ceb 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -12,6 +12,7 @@
 #include <uapi/drm/xe_drm.h>
 
 #include "xe_assert.h"
+#include "xe_debug_data_types.h"
 #include "xe_device.h"
 #include "xe_eudebug.h"
 #include "xe_eudebug_types.h"
@@ -848,6 +849,323 @@ void xe_eudebug_exec_queue_destroy(struct xe_file *xef, struct xe_exec_queue *q)
 	xe_eudebug_event_put(d, exec_queue_destroy_event(d, xef, q));
 }
 
+struct xe_eudebug_event_envelope {
+	struct list_head link;
+	struct drm_xe_eudebug_event *event;
+};
+
+static int xe_eudebug_queue_bind_event(struct xe_eudebug *d,
+				       struct xe_vm *vm,
+				       struct drm_xe_eudebug_event *event)
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
+	if (event->type == DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_DEBUG_DATA)
+		++vm->eudebug.ops;
+	spin_unlock(&vm->eudebug.lock);
+
+	return 0;
+}
+
+static int queue_vm_bind_event(struct xe_eudebug *d,
+			       struct xe_vm *vm,
+			       u64 vm_handle,
+			       u32 bind_flags,
+			       u32 num_ops, u64 *seqno)
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
+	e->num_binds = num_ops;
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
+	int h_vm;
+
+	h_vm = find_handle(d->res, XE_EUDEBUG_RES_TYPE_VM, vm);
+	if (h_vm < 0)
+		return h_vm;
+
+	return queue_vm_bind_event(d, vm, h_vm, 0,
+				   num_ops, seqno);
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
+	/* If in discovery, no need to collect ops */
+	if (!completion_done(&d->discovery))
+		return xe_eudebug_queue_event(d, event);
+
+	return xe_eudebug_queue_bind_event(d, vm, event);
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
+void xe_eudebug_vm_bind_op_add(struct xe_vm *vm, u32 op, struct xe_debug_data *debug_data)
+{
+	struct xe_eudebug *d;
+	u32 flags;
+
+	if (!xe_vm_in_lr_mode(vm))
+		return;
+
+	switch (op) {
+	case DRM_XE_VM_BIND_OP_ADD_DEBUG_DATA:
+		flags = DRM_XE_EUDEBUG_EVENT_CREATE;
+		break;
+	case DRM_XE_VM_BIND_OP_REMOVE_DEBUG_DATA:
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
+	xe_eudebug_event_put(d, vm_bind_op(d, vm, flags, 0, debug_data));
+}
+
+static struct drm_xe_eudebug_event *fetch_bind_event(struct xe_vm * const vm)
+{
+	struct xe_eudebug_event_envelope *env;
+	struct drm_xe_eudebug_event *e = NULL;
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
+				struct drm_xe_eudebug_event *e,
+				bool ufence,
+				u32 bind_ops)
+{
+	struct drm_xe_eudebug_event_vm_bind *eb = cast_event(eb, e);
+
+	eb->flags = ufence ?
+		DRM_XE_EUDEBUG_EVENT_VM_BIND_FLAG_UFENCE : 0;
+	eb->num_binds = bind_ops;
+}
+
+static void fill_vm_bind_op_fields(struct xe_vm *vm,
+				   struct drm_xe_eudebug_event *e,
+				   u64 ref_seqno)
+{
+	struct drm_xe_eudebug_event_vm_bind_op_debug_data *op;
+
+	if (e->type != DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_DEBUG_DATA)
+		return;
+
+	op = cast_event(op, e);
+	op->vm_bind_ref_seqno = ref_seqno;
+}
+
+void xe_eudebug_vm_bind_end(struct xe_vm *vm, bool has_ufence, int bind_err)
+{
+	struct drm_xe_eudebug_event *e;
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
 static struct xe_file *xe_eudebug_target_get(struct xe_eudebug *d)
 {
 	struct xe_file *xef = NULL;
@@ -860,19 +1178,67 @@ static struct xe_file *xe_eudebug_target_get(struct xe_eudebug *d)
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
+	err = vm_bind_event(d, vm, ops, &ref_seqno);
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
@@ -882,6 +1248,12 @@ static void discover_client(struct xe_eudebug *d)
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
@@ -891,6 +1263,8 @@ static void discover_client(struct xe_eudebug *d)
 		err = exec_queue_create_event(d, xef, q);
 		if (err)
 			break;
+
+		eq_count++;
 	}
 
 	complete_all(&d->discovery);
@@ -899,9 +1273,9 @@ static void discover_client(struct xe_eudebug *d)
 
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
index 39c9aca373f2..8e7e1ad726eb 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.h
+++ b/drivers/gpu/drm/xe/xe_eudebug.h
@@ -10,9 +10,11 @@
 
 struct drm_device;
 struct drm_file;
+struct xe_debug_data;
 struct xe_device;
 struct xe_file;
 struct xe_vm;
+struct xe_vma;
 struct xe_exec_queue;
 
 #if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
@@ -49,6 +51,11 @@ void xe_eudebug_vm_destroy(struct xe_file *xef, struct xe_vm *vm);
 void xe_eudebug_exec_queue_create(struct xe_file *xef, struct xe_exec_queue *q);
 void xe_eudebug_exec_queue_destroy(struct xe_file *xef, struct xe_exec_queue *q);
 
+void xe_eudebug_vm_init(struct xe_vm *vm);
+void xe_eudebug_vm_bind_start(struct xe_vm *vm);
+void xe_eudebug_vm_bind_op_add(struct xe_vm *vm, u32 op, struct xe_debug_data *debug_data);
+void xe_eudebug_vm_bind_end(struct xe_vm *vm, bool has_ufence, int err);
+
 #else
 
 static inline int xe_eudebug_connect_ioctl(struct drm_device *dev,
@@ -66,6 +73,12 @@ static inline void xe_eudebug_vm_destroy(struct xe_file *xef, struct xe_vm *vm)
 static inline void xe_eudebug_exec_queue_create(struct xe_file *xef, struct xe_exec_queue *q) { }
 static inline void xe_eudebug_exec_queue_destroy(struct xe_file *xef, struct xe_exec_queue *q) { }
 
+static inline void xe_eudebug_vm_init(struct xe_vm *vm) { }
+static inline void xe_eudebug_vm_bind_start(struct xe_vm *vm) { }
+static inline void xe_eudebug_vm_bind_op_add(struct xe_vm *vm, u32 op,
+					     struct xe_debug_data *debug_data) { }
+static inline void xe_eudebug_vm_bind_end(struct xe_vm *vm, bool has_ufence, int err) { }
+
 #endif /* CONFIG_DRM_XE_EUDEBUG */
 
 #endif /* _XE_EUDEBUG_H_ */
diff --git a/drivers/gpu/drm/xe/xe_eudebug_types.h b/drivers/gpu/drm/xe/xe_eudebug_types.h
index 57bff7482163..502b121114df 100644
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
index 917228ef84a4..59518504448e 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1700,6 +1700,8 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	for_each_tile(tile, xe, id)
 		xe_range_fence_tree_init(&vm->rftree[id]);
 
+	xe_eudebug_vm_init(vm);
+
 	INIT_LIST_HEAD(&vm->debug_data.list);
 	mutex_init(&vm->debug_data.lock);
 
@@ -1984,6 +1986,8 @@ static void vm_destroy_work_func(struct work_struct *w)
 	struct xe_tile *tile;
 	u8 id;
 
+	xe_eudebug_vm_bind_end(vm, 0, -ENOENT);
+
 	/* xe_vm_close_and_put was not called? */
 	xe_assert(xe, !vm->size);
 
@@ -3287,7 +3291,7 @@ static void vm_bind_ioctl_ops_fini(struct xe_vm *vm, struct xe_vma_ops *vops,
 				   struct dma_fence *fence)
 {
 	struct xe_exec_queue *wait_exec_queue = to_wait_exec_queue(vm, vops->q);
-	struct xe_user_fence *ufence;
+	struct xe_user_fence *ufence = NULL;
 	struct xe_vma_op *op;
 	int i;
 
@@ -3302,6 +3306,9 @@ static void vm_bind_ioctl_ops_fini(struct xe_vm *vm, struct xe_vma_ops *vops,
 			xe_vma_destroy(gpuva_to_vma(op->base.remap.unmap->va),
 				       fence);
 	}
+
+	xe_eudebug_vm_bind_end(vm, ufence, 0);
+
 	if (ufence)
 		xe_sync_ufence_put(ufence);
 	if (fence) {
@@ -3859,8 +3866,11 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		dma_fence_put(fence);
 
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
index 672eeba10499..e20f8341d5e9 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -331,6 +331,19 @@ struct xe_vm {
 	/** @xef: XE file handle for tracking this VM's drm client */
 	struct xe_file *xef;
 
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
+
 	/** @debug_data: track debug_data mapped to vm */
 	struct {
 		struct list_head list;
diff --git a/include/uapi/drm/xe_drm_eudebug.h b/include/uapi/drm/xe_drm_eudebug.h
index 360d7a7ecb67..b2b2b90bb3a7 100644
--- a/include/uapi/drm/xe_drm_eudebug.h
+++ b/include/uapi/drm/xe_drm_eudebug.h
@@ -49,6 +49,8 @@ struct drm_xe_eudebug_event {
 #define DRM_XE_EUDEBUG_EVENT_READ		1
 #define DRM_XE_EUDEBUG_EVENT_VM			2
 #define DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE		3
+#define DRM_XE_EUDEBUG_EVENT_VM_BIND		4
+#define DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_DEBUG_DATA	5
 
 	__u16 flags;
 #define DRM_XE_EUDEBUG_EVENT_CREATE		(1 << 0)
@@ -81,6 +83,75 @@ struct drm_xe_eudebug_event_exec_queue {
 	__u64 lrc_handle[];
 };
 
+/*
+ * When the client (debuggee) calls the vm_bind_ioctl with the
+ * DRM_XE_VM_BIND_OP_[ADD|REMOVE]_DEBUG_DATA operation, the following event
+ * sequence will be created (for the debugger):
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
+ * EVENT_UFENCE will only be included if the client did
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
+	__u64 vm_handle;
+
+	__u32 flags;
+#define DRM_XE_EUDEBUG_EVENT_VM_BIND_FLAG_UFENCE (1 << 0)
+
+	__u32 num_binds;
+};
+
+struct drm_xe_eudebug_event_vm_bind_op_debug_data {
+	struct drm_xe_eudebug_event base;
+	__u64 vm_bind_ref_seqno; /* *_event_vm_bind.base.seqno */
+	__u64 num_extensions;
+
+	__u64 addr;
+	__u64 range;
+	__u64 flags;
+	__u32 offset;
+	__u32 reserved;
+	union {
+		__u64 pseudopath;
+		char pathname[PATH_MAX];
+	};
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.43.0

