Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53946C624D6
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 15:01:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 184FA10E2B5;
	Thu,  3 Sep 2026 15:01:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ajk/AJTd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CC9C10E2B5
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 15:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788447666; x=1819983666;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dD/TuR3N+hlyFNsJ7Yb9IPlyVWXMKn11Na6KQglAiMU=;
 b=Ajk/AJTdulwVIvd9yGssl8KBboQkty4NMjuI+Z1nJHWJ71GVxKbNi+kd
 CmthBugpfrTptR5SCYhSZg3AMLytZ7vROGAsthI5zkPvZqlsMKsjxqvYK
 p4u7W8lHglaPkD9gDhMXjgD9KJOB/SpSjh5lQKZO0pUIoMIkVHJITY1Dr
 fevTpTguY2B/NpVtkYIbXIlHZepvQtGUD7v6x7zL++g/k4Rg4zodRJyTM
 AxtDH04QTlL4qc+GLeMHad+/l7jJ3IoWavxF9J7m/68E4c8hW7whS0thB
 QbRIwLAVyl5lTfjcsVK6NTF4AXlFNkdAGvslIjT2q8DYSM7dbcfDvKCeU w==;
X-CSE-ConnectionGUID: kF4fhvKEQcqCPtascUIWfA==
X-CSE-MsgGUID: FrPB7jkyRBmnJ3l2S8wX8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="76486733"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="76486733"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 08:00:58 -0700
X-CSE-ConnectionGUID: nzsMmcsyR+KuI/HQxkvtYg==
X-CSE-MsgGUID: EzLCVAqQT3qv1gNQk21dCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="268440890"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 mkuoppal-desk.intel.com) ([10.245.246.233])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 08:00:52 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, matthew.brost@intel.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, joonas.lahtinen@linux.intel.com,
 gustavo.sousa@intel.com, jan.maslak@intel.com,
 dominik.karol.piatkowski@intel.com, rodrigo.vivi@intel.com,
 andrzej.hajda@intel.com, matthew.auld@intel.com,
 maciej.patelczyk@intel.com, gwan-gyeong.mun@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH v10 11/27] drm/xe/eudebug: Add ufence events with acks
Date: Thu,  3 Sep 2026 17:59:35 +0300
Message-ID: <20260903145952.848051-12-mika.kuoppala@linux.intel.com>
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

When the vma is in place, the debugger needs to intercept before
userspace proceeds with the workload, for example to install
a breakpoint in an EU shader.

If the ufence is part of a bind sequence, attach the debugger in
xe_user_fence. When the ufence signal is about to be delivered,
check if this ufence needs to be tracked by the debugger.
If so, stall the delivery of the ufence signal until the
debugger has acked the ufence (event), with the ack ioctl.

v2: - return err instead of 0 to guarantee signalling (Dominik)
    - checkpatch (Tilak)
    - Kconfig (Mika, Andrzej)
    - use lock instead of cmpxchg (Mika)
v4: - improve ref handling and no ufences nodebug binds
v5: - remove overzealous warn_on on bind_ref_seqno (Christoph)
    - remove superfluous signalled (Mika)
    - fix double free on bind sequence (Mika)
    - Don't fill op fields if no debugger (Maciej)
v6: - rework to align with xe_eudebug_bind_execute()
v7: - fix setting signalled before debugger acks (Jan)
v8: - explicit debugger set and clears (Mika)
    - take reference for tracking check (Mika)
    - fix leak of ref in handle_ack (Mika)
v9: - enforce mbz on user_arg.type (Sashiko)
v10: - avoid double signal if not tracked (Sashiko)
     - clear bind ref seqno if no debugger (Sashiko)
     - add reserved field
     - avoid referencing ack after dropping lock (Claude)
     - clear bind ref if tracking fails (Claude)
     - use GFP_KERNEL for ack allocation
     - don't starve discovery wq (Claude)

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 Documentation/gpu/xe/xe_eudebug.rst   |   3 +
 drivers/gpu/drm/xe/xe_device_types.h  |   3 +
 drivers/gpu/drm/xe/xe_eudebug.c       | 349 +++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_eudebug.h       |   9 +
 drivers/gpu/drm/xe/xe_eudebug_types.h |  11 +-
 drivers/gpu/drm/xe/xe_sync.c          |  45 ++--
 drivers/gpu/drm/xe/xe_sync.h          |   7 +-
 drivers/gpu/drm/xe/xe_sync_types.h    |  29 ++-
 include/uapi/drm/xe_drm_eudebug.h     |  61 +++++
 9 files changed, 490 insertions(+), 27 deletions(-)

diff --git a/Documentation/gpu/xe/xe_eudebug.rst b/Documentation/gpu/xe/xe_eudebug.rst
index 1f743f1d6f2a..db52945714f3 100644
--- a/Documentation/gpu/xe/xe_eudebug.rst
+++ b/Documentation/gpu/xe/xe_eudebug.rst
@@ -63,3 +63,6 @@ Resource Event Types
 
 .. kernel-doc:: include/uapi/drm/xe_drm_eudebug.h
    :identifiers: drm_xe_eudebug_event_vm_bind_op_debug_data
+
+.. kernel-doc:: include/uapi/drm/xe_drm_eudebug.h
+   :identifiers: drm_xe_eudebug_event_vm_bind_ufence
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index a9584634279d..c62e774495fd 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -619,6 +619,9 @@ struct xe_device {
 
 		/** @eudebug.discovery_wq: used for client resource discovery */
 		struct workqueue_struct *discovery_wq;
+
+		/** @eudebug.ufence_wq: used for deferred ufence signalling */
+		struct workqueue_struct *ufence_wq;
 	} eudebug;
 #endif
 
diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index fe3b2ae06a31..a1f07db6ad81 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -21,6 +21,7 @@
 #include "xe_exec_queue.h"
 #include "xe_hw_engine.h"
 #include "xe_macros.h"
+#include "xe_sync.h"
 #include "xe_vm.h"
 
 /**
@@ -248,6 +249,120 @@ void xe_eudebug_put(struct xe_eudebug *d)
 	kref_put(&d->ref, xe_eudebug_free);
 }
 
+struct xe_eudebug_ack {
+	struct rb_node rb_node;
+	u64 seqno;
+	u64 ts_insert;
+	struct xe_user_fence *ufence;
+};
+
+#define fetch_ack(x) rb_entry(x, struct xe_eudebug_ack, rb_node)
+
+static int compare_ack(const u64 a, const u64 b)
+{
+	if (a < b)
+		return -1;
+	else if (a > b)
+		return 1;
+
+	return 0;
+}
+
+static int ack_insert_cmp(struct rb_node * const node,
+			  const struct rb_node * const p)
+{
+	return compare_ack(fetch_ack(node)->seqno,
+			   fetch_ack(p)->seqno);
+}
+
+static int ack_lookup_cmp(const void * const key,
+			  const struct rb_node * const node)
+{
+	return compare_ack(*(const u64 *)key,
+			   fetch_ack(node)->seqno);
+}
+
+static struct xe_eudebug_ack *remove_ack(struct xe_eudebug *d, u64 seqno)
+{
+	struct rb_root * const root = &d->acks.tree;
+	struct rb_node *node;
+
+	spin_lock(&d->acks.lock);
+	node = rb_find(&seqno, root, ack_lookup_cmp);
+	if (node)
+		rb_erase(node, root);
+	spin_unlock(&d->acks.lock);
+
+	if (!node)
+		return NULL;
+
+	return rb_entry_safe(node, struct xe_eudebug_ack, rb_node);
+}
+
+static void ufence_signal_worker(struct work_struct *w)
+{
+	struct xe_user_fence * const ufence =
+		container_of(w, struct xe_user_fence, eudebug.worker);
+
+	xe_sync_ufence_signal(ufence);
+
+	xe_sync_ufence_put(ufence);
+}
+
+static void kick_ufence_worker(struct xe_user_fence *f)
+{
+	queue_work(f->xe->eudebug.ufence_wq, &f->eudebug.worker);
+}
+
+static void handle_ack(struct xe_eudebug *d, struct xe_eudebug_ack *ack,
+		       bool on_disconnect)
+{
+	struct xe_user_fence *f = ack->ufence;
+	struct xe_eudebug *debugger = NULL;
+	u64 signalled_by;
+	bool signal = false;
+
+	spin_lock(&f->eudebug.lock);
+	if (!f->eudebug.signalled_seqno) {
+		f->eudebug.signalled_seqno = ack->seqno;
+		f->eudebug.bind_ref_seqno = 0;
+		debugger = f->eudebug.debugger;
+		f->eudebug.debugger = NULL;
+		signal = true;
+	}
+	signalled_by = f->eudebug.signalled_seqno;
+	spin_unlock(&f->eudebug.lock);
+
+	if (signal)
+		kick_ufence_worker(f);
+	else
+		xe_sync_ufence_put(f);
+
+	eu_dbg(d, "ACK: seqno=%llu: signalled by %llu (%s) (held %lluus)",
+	       ack->seqno, signalled_by,
+	       on_disconnect ? "disconnect" : "debugger",
+	       ktime_us_delta(ktime_get(), ack->ts_insert));
+
+	kfree(ack);
+
+	if (debugger)
+		xe_eudebug_put(debugger);
+}
+
+static void release_acks(struct xe_eudebug *d)
+{
+	struct xe_eudebug_ack *ack, *n;
+	struct rb_root root;
+
+	spin_lock(&d->acks.lock);
+	root = d->acks.tree;
+	d->acks.tree = RB_ROOT;
+	spin_unlock(&d->acks.lock);
+
+	rbtree_postorder_for_each_entry_safe(ack, n, &root, rb_node)
+		handle_ack(d, ack, true);
+}
+
 static bool xe_eudebug_detach(struct xe_eudebug *d,
 			      const int err)
 {
@@ -277,6 +392,8 @@ static bool xe_eudebug_detach(struct xe_eudebug *d,
 		xe_file_put(target);
 	}
 
+	release_acks(d);
+
 	return !!target;
 }
 
@@ -1038,11 +1155,169 @@ static int vm_bind_op(struct xe_eudebug *d, struct xe_vm *vm,
 				debug_data, &op_seqno);
 }
 
+void xe_eudebug_ufence_init(struct xe_user_fence *ufence)
+{
+	spin_lock_init(&ufence->eudebug.lock);
+	ufence->eudebug.debugger = NULL;
+	ufence->eudebug.bind_ref_seqno = 0;
+	ufence->eudebug.signalled_seqno = 0;
+	INIT_WORK(&ufence->eudebug.worker, ufence_signal_worker);
+}
+
+void xe_eudebug_ufence_fini(struct xe_user_fence *ufence)
+{
+	struct xe_eudebug *d;
+
+	XE_WARN_ON(READ_ONCE(ufence->eudebug.bind_ref_seqno));
+
+	d = READ_ONCE(ufence->eudebug.debugger);
+	if (!d)
+		return;
+
+	/* last ref */
+	ufence->eudebug.debugger = NULL;
+
+	xe_eudebug_put(d);
+}
+
+static int xe_eudebug_track_ufence(struct xe_eudebug *d,
+				   struct xe_user_fence *f,
+				   u64 seqno)
+{
+	struct xe_eudebug_ack *ack;
+	struct rb_node *old;
+
+	ack = kzalloc_obj(*ack, GFP_KERNEL);
+	if (!ack) {
+		eu_dbg(d, "ack allocation fail");
+		return -ENOMEM;
+	}
+
+	ack->seqno = seqno;
+	ack->ts_insert = ktime_get();
+
+	__xe_sync_ufence_get(f);
+
+	scoped_guard(spinlock, &d->acks.lock) {
+		old = rb_find_add(&ack->rb_node,
+				  &d->acks.tree, ack_insert_cmp);
+		if (!old)
+			ack->ufence = f;
+	}
+
+	if (!old)
+		return 0;
+
+	xe_sync_ufence_put(f);
+	kfree(ack);
+
+	return -EEXIST;
+}
+
+static int track_ufence(struct xe_eudebug *d,
+			struct xe_user_fence *ufence,
+			bool *tracked)
+{
+	struct drm_xe_eudebug_event *event;
+	struct drm_xe_eudebug_event_vm_bind_ufence *e;
+	const u32 sz = sizeof(*e);
+	const u32 flags = DRM_XE_EUDEBUG_EVENT_CREATE |
+		DRM_XE_EUDEBUG_EVENT_NEED_ACK;
+	u64 seqno;
+	int ret;
+
+	*tracked = false;
+
+	if (XE_WARN_ON(!ufence->eudebug.bind_ref_seqno))
+		return -EINVAL;
+
+	seqno = atomic_long_inc_return(&d->events.seqno);
+
+	ret = xe_eudebug_track_ufence(d, ufence, seqno);
+	if (ret)
+		return ret;
+
+	*tracked = true;
+
+	spin_lock(&d->events.lock);
+	event = xe_eudebug_prepare_event(d, DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
+					 seqno, flags, sz);
+
+	e = cast_event(e, event);
+	e->vm_bind_ref_seqno = ufence->eudebug.bind_ref_seqno;
+
+	ret = xe_eudebug_queue_event(d, event);
+	spin_unlock(&d->events.lock);
+
+	return ret;
+}
+
+/**
+ * xe_eudebug_ufence_track - Track the ufence for eudebug
+ * @ufence : user fence that might be applicaple to tracking
+ *
+ * If this user fence was part of bind sequence, we need
+ * to track it so that we can hold the client signalling on behalf
+ * of debugger and thus deliver event to debugger.
+ *
+ * Return: true debugger will track, false debugger not interested
+ *
+ */
+bool xe_eudebug_ufence_track(struct xe_user_fence *ufence)
+{
+	struct xe_eudebug *d;
+	bool tracked = false;
+	int ret;
+
+	spin_lock(&ufence->eudebug.lock);
+	d = ufence->eudebug.debugger;
+	if (d && !kref_get_unless_zero(&d->ref))
+		d = NULL;
+
+	if (!d || xe_eudebug_detached(d)) {
+		ufence->eudebug.bind_ref_seqno = 0;
+		ufence->eudebug.signalled_seqno = 0;
+	}
+	spin_unlock(&ufence->eudebug.lock);
+
+	if (!d)
+		return false;
+
+	if (xe_eudebug_detached(d)) {
+		xe_eudebug_put(d);
+		return false;
+	}
+
+	ret = track_ufence(d, ufence, &tracked);
+	if (ret) {
+		/*
+		 * If we failed before the ack made it into the tree, the
+		 * disconnect below has nothing to release for this fence.
+		 * Drop the bind reference here, or the fence destructor
+		 * will warn about it still being set.
+		 */
+		if (!tracked) {
+			scoped_guard(spinlock, &ufence->eudebug.lock) {
+				ufence->eudebug.bind_ref_seqno = 0;
+				ufence->eudebug.signalled_seqno = 0;
+			}
+		}
+
+		xe_eudebug_disconnect(d, ret);
+	}
+
+	xe_eudebug_put(d);
+
+	return tracked;
+}
+
 void xe_eudebug_vm_bind_execute(struct xe_vm *vm,
 				struct xe_vma_ops *ops)
 {
+	struct xe_user_fence *ufence = NULL;
 	struct xe_eudebug *d;
 	struct xe_vma_op *op;
+	unsigned int i;
 	u64 bind_seqno = 0;
 	u32 num_ops;
 	int err;
@@ -1054,6 +1329,15 @@ void xe_eudebug_vm_bind_execute(struct xe_vm *vm,
 	if (!d)
 		return;
 
+	for (i = 0; i < ops->num_syncs; i++) {
+		struct xe_sync_entry *se = &ops->syncs[i];
+
+		if (xe_sync_is_ufence(se)) {
+			xe_assert(vm->xe, !ufence);
+			ufence = se->ufence;
+		}
+	}
+
 	num_ops = 0;
 	list_for_each_entry(op, &ops->list, link) {
 		if (op->base.op != DRM_GPUVA_OP_DRIVER)
@@ -1071,7 +1355,8 @@ void xe_eudebug_vm_bind_execute(struct xe_vm *vm,
 		return;
 	}
 
-	err = vm_bind_event(d, vm, 0,
+	err = vm_bind_event(d, vm,
+			    ufence ? DRM_XE_EUDEBUG_EVENT_VM_BIND_FLAG_UFENCE : 0,
 			    num_ops, &bind_seqno);
 	if (err)
 		goto out_err;
@@ -1099,6 +1384,14 @@ void xe_eudebug_vm_bind_execute(struct xe_vm *vm,
 			goto out_err;
 	}
 
+	if (ufence) {
+		spin_lock(&ufence->eudebug.lock);
+		kref_get(&d->ref);
+		ufence->eudebug.debugger = d;
+		ufence->eudebug.bind_ref_seqno = bind_seqno;
+		spin_unlock(&ufence->eudebug.lock);
+	}
+
 out_err:
 	if (err)
 		xe_eudebug_disconnect(d, err);
@@ -1489,6 +1782,42 @@ static long xe_eudebug_read_event(struct xe_eudebug *d,
 	return ret;
 }
 
+static long
+xe_eudebug_ack_event_ioctl(struct xe_eudebug *d,
+			   const u64 arg)
+{
+	struct drm_xe_eudebug_ack __user * const user_ptr =
+		u64_to_user_ptr(arg);
+	struct drm_xe_eudebug_ack user_arg;
+	struct xe_eudebug_ack *ack;
+	struct xe_device *xe = d->xe;
+
+	if (XE_IOCTL_DBG(xe, copy_from_user(&user_arg,
+					    user_ptr,
+					    sizeof(user_arg))))
+		return -EFAULT;
+
+	if (XE_IOCTL_DBG(xe, user_arg.type))
+		return -EINVAL;
+
+	if (XE_IOCTL_DBG(xe, user_arg.flags))
+		return -EINVAL;
+
+	if (XE_IOCTL_DBG(xe, user_arg.reserved))
+		return -EINVAL;
+
+	if (XE_IOCTL_DBG(xe, xe_eudebug_detached(d)))
+		return -ENOTCONN;
+
+	ack = remove_ack(d, user_arg.seqno);
+	if (XE_IOCTL_DBG(xe, !ack))
+		return -EINVAL;
+
+	handle_ack(d, ack, false);
+
+	return 0;
+}
+
 /**
  * xe_eudebug_ioctl - Issue a command to eudebug interface
  *
@@ -1516,6 +1845,10 @@ static long xe_eudebug_ioctl(struct file *file,
 		ret = xe_eudebug_read_event(d, arg,
 					    !(file->f_flags & O_NONBLOCK));
 		break;
+	case DRM_XE_EUDEBUG_IOCTL_ACK_EVENT:
+		ret = xe_eudebug_ack_event_ioctl(d, arg);
+		eu_dbg(d, "ioctl cmd=EVENT_ACK ret=%ld\n", ret);
+		break;
 	default:
 		ret = -EINVAL;
 	}
@@ -1566,6 +1899,9 @@ xe_eudebug_connect(struct xe_device *xe,
 	init_completion(&d->discovery);
 	INIT_WORK(&d->discovery_work, discovery_work_fn);
 
+	spin_lock_init(&d->acks.lock);
+	d->acks.tree = RB_ROOT;
+
 	err = xe_eudebug_resources_init(d);
 	if (XE_IOCTL_DBG(xe, err)) {
 		kfree(d);
@@ -1743,6 +2079,17 @@ void xe_eudebug_init(struct xe_device *xe)
 	}
 	xe->eudebug.discovery_wq = wq;
 
+	wq = alloc_workqueue("xe-eudebug-ufence", WQ_UNBOUND, 0);
+	if (!wq) {
+		err = -ENOMEM;
+		goto out_err;
+	}
+
+	err = drmm_add_action_or_reset(dev, __drmm_workqueue_release, wq);
+	if (err)
+		goto out_err;
+	xe->eudebug.ufence_wq = wq;
+
 	err = sysfs_create_file(&dev->dev->kobj,
 				&dev_attr_enable_eudebug.attr);
 	if (err)
diff --git a/drivers/gpu/drm/xe/xe_eudebug.h b/drivers/gpu/drm/xe/xe_eudebug.h
index d54067fdf2c0..48608a061f0c 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.h
+++ b/drivers/gpu/drm/xe/xe_eudebug.h
@@ -65,6 +65,10 @@ void xe_eudebug_exec_queue_destroy(struct xe_file *xef, struct xe_exec_queue *q)
 
 void xe_eudebug_vm_bind_execute(struct xe_vm *vm, struct xe_vma_ops *ops);
 
+void xe_eudebug_ufence_init(struct xe_user_fence *ufence);
+void xe_eudebug_ufence_fini(struct xe_user_fence *ufence);
+bool xe_eudebug_ufence_track(struct xe_user_fence *ufence);
+
 #else
 
 static inline int xe_eudebug_connect_ioctl(struct drm_device *dev,
@@ -84,6 +88,11 @@ static inline void xe_eudebug_exec_queue_create(struct xe_file *xef, struct xe_e
 static inline void xe_eudebug_exec_queue_destroy(struct xe_file *xef, struct xe_exec_queue *q) { }
 
 static inline void xe_eudebug_vm_bind_execute(struct xe_vm *vm, struct xe_vma_ops *ops) { }
+
+static inline void xe_eudebug_ufence_init(struct xe_user_fence *ufence) { }
+static inline void xe_eudebug_ufence_fini(struct xe_user_fence *ufence) { }
+static inline bool xe_eudebug_ufence_track(struct xe_user_fence *ufence) { return false; }
+
 #endif /* CONFIG_DRM_XE_EUDEBUG */
 
 #endif /* _XE_EUDEBUG_H_ */
diff --git a/drivers/gpu/drm/xe/xe_eudebug_types.h b/drivers/gpu/drm/xe/xe_eudebug_types.h
index 80fcda87ac88..12a4921c8400 100644
--- a/drivers/gpu/drm/xe/xe_eudebug_types.h
+++ b/drivers/gpu/drm/xe/xe_eudebug_types.h
@@ -34,7 +34,7 @@ enum xe_eudebug_cap_state {
 	XE_EUDEBUG_CAP_ENABLED,
 };
 
-#define XE_EUDEBUG_MAX_EVENT_TYPE DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_DEBUG_DATA
+#define XE_EUDEBUG_MAX_EVENT_TYPE DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE
 
 /**
  * struct xe_eudebug_handle - eudebug resource handle
@@ -135,6 +135,15 @@ struct xe_eudebug {
 		/** @events.seqno: seqno counter to stamp events for fifo */
 		atomic_long_t seqno;
 	} events;
+
+	/** @acks: user fence acks tracked by this debugger */
+	struct {
+		/** @acks.lock: guards access to tree */
+		spinlock_t lock;
+
+		/** @acks.tree: pending acks by seqnos */
+		struct rb_root tree;
+	} acks;
 };
 
 #endif /* _XE_EUDEBUG_TYPES_H_ */
diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index 37866768d64c..3c6b241a1221 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -15,27 +15,20 @@
 #include <uapi/drm/xe_drm.h>
 
 #include "xe_device.h"
+#include "xe_eudebug.h"
 #include "xe_exec_queue.h"
 #include "xe_macros.h"
 #include "xe_sched_job_types.h"
 
-struct xe_user_fence {
-	struct xe_device *xe;
-	struct kref refcount;
-	struct dma_fence_cb cb;
-	struct work_struct worker;
-	struct mm_struct *mm;
-	u64 __user *addr;
-	u64 value;
-	int signalled;
-};
-
 static void user_fence_destroy(struct kref *kref)
 {
 	struct xe_user_fence *ufence = container_of(kref, struct xe_user_fence,
 						 refcount);
 
 	mmdrop(ufence->mm);
+
+	xe_eudebug_ufence_fini(ufence);
+
 	kfree(ufence);
 }
 
@@ -49,7 +42,8 @@ static void user_fence_put(struct xe_user_fence *ufence)
 	kref_put(&ufence->refcount, user_fence_destroy);
 }
 
-static struct xe_user_fence *user_fence_create(struct xe_device *xe, u64 addr,
+static struct xe_user_fence *user_fence_create(struct xe_device *xe,
+					       u64 addr,
 					       u64 value)
 {
 	struct xe_user_fence *ufence;
@@ -70,14 +64,21 @@ static struct xe_user_fence *user_fence_create(struct xe_device *xe, u64 addr,
 	ufence->mm = current->mm;
 	mmgrab(ufence->mm);
 
+	xe_eudebug_ufence_init(ufence);
+
 	return ufence;
 }
 
-static void user_fence_worker(struct work_struct *w)
+void xe_sync_ufence_signal(struct xe_user_fence *ufence)
 {
-	struct xe_user_fence *ufence = container_of(w, struct xe_user_fence, worker);
+	/*
+	 * Signal exactly once: both the eudebug ack path and user_fence_worker()
+	 * can reach here for a tracked ufence. Waiters are woken only after the
+	 * state update, so the UMD can reuse the ufence without hitting -EBUSY.
+	 */
+	if (xchg(&ufence->signalled, 1))
+		return;
 
-	WRITE_ONCE(ufence->signalled, 1);
 	if (mmget_not_zero(ufence->mm)) {
 		kthread_use_mm(ufence->mm);
 		if (copy_to_user(ufence->addr, &ufence->value, sizeof(ufence->value)))
@@ -88,11 +89,17 @@ static void user_fence_worker(struct work_struct *w)
 		drm_dbg(&ufence->xe->drm, "mmget_not_zero() failed, ufence wasn't signaled\n");
 	}
 
-	/*
-	 * Wake up waiters only after updating the ufence state, allowing the UMD
-	 * to safely reuse the same ufence without encountering -EBUSY errors.
-	 */
 	wake_up_all(&ufence->xe->ufence_wq);
+}
+
+static void user_fence_worker(struct work_struct *w)
+{
+	struct xe_user_fence *ufence = container_of(w, struct xe_user_fence, worker);
+
+	/* Lets see if debugger wants to track this */
+	if (!xe_eudebug_ufence_track(ufence))
+		xe_sync_ufence_signal(ufence);
+
 	user_fence_put(ufence);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_sync.h b/drivers/gpu/drm/xe/xe_sync.h
index 6b949194acff..768c0517f104 100644
--- a/drivers/gpu/drm/xe/xe_sync.h
+++ b/drivers/gpu/drm/xe/xe_sync.h
@@ -10,8 +10,12 @@
 
 struct drm_syncobj;
 struct xe_device;
-struct xe_exec_queue;
 struct xe_file;
+struct xe_exec_queue;
+struct drm_syncobj;
+struct dma_fence;
+struct dma_fence_chain;
+struct drm_xe_sync;
 struct xe_sched_job;
 struct xe_vm;
 
@@ -45,5 +49,6 @@ struct xe_user_fence *__xe_sync_ufence_get(struct xe_user_fence *ufence);
 struct xe_user_fence *xe_sync_ufence_get(struct xe_sync_entry *sync);
 void xe_sync_ufence_put(struct xe_user_fence *ufence);
 int xe_sync_ufence_get_status(struct xe_user_fence *ufence);
+void xe_sync_ufence_signal(struct xe_user_fence *ufence);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sync_types.h b/drivers/gpu/drm/xe/xe_sync_types.h
index b88f1833e28c..aa5fff7b89c2 100644
--- a/drivers/gpu/drm/xe/xe_sync_types.h
+++ b/drivers/gpu/drm/xe/xe_sync_types.h
@@ -6,13 +6,32 @@
 #ifndef _XE_SYNC_TYPES_H_
 #define _XE_SYNC_TYPES_H_
 
+#include <linux/dma-fence-array.h>
+#include <linux/kref.h>
+#include <linux/spinlock.h>
 #include <linux/types.h>
 
-struct drm_syncobj;
-struct dma_fence;
-struct dma_fence_chain;
-struct drm_xe_sync;
-struct user_fence;
+struct xe_user_fence {
+	struct xe_device *xe;
+	struct kref refcount;
+	struct dma_fence_cb cb;
+	struct work_struct worker;
+	struct mm_struct *mm;
+	u64 __user *addr;
+	u64 value;
+	int signalled;
+
+#if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
+	struct {
+		/** @lock: guards access to eudebug struct members */
+		spinlock_t lock;
+		struct xe_eudebug *debugger;
+		u64 bind_ref_seqno;
+		u64 signalled_seqno;
+		struct work_struct worker;
+	} eudebug;
+#endif
+};
 
 struct xe_sync_entry {
 	struct drm_syncobj *syncobj;
diff --git a/include/uapi/drm/xe_drm_eudebug.h b/include/uapi/drm/xe_drm_eudebug.h
index 69f568f7ef0b..b99ac815a7c3 100644
--- a/include/uapi/drm/xe_drm_eudebug.h
+++ b/include/uapi/drm/xe_drm_eudebug.h
@@ -32,6 +32,7 @@ extern "C" {
  * - -ENOTCONN if the debug target is gone and the queue has been drained.
  */
 #define DRM_XE_EUDEBUG_IOCTL_READ_EVENT		_IO('j', 0x0)
+#define DRM_XE_EUDEBUG_IOCTL_ACK_EVENT		_IOW('j', 0x1, struct drm_xe_eudebug_ack)
 
 /**
  * struct drm_xe_eudebug_event - Base type of event delivered by xe_eudebug.
@@ -69,6 +70,7 @@ struct drm_xe_eudebug_event {
 #define DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE		3
 #define DRM_XE_EUDEBUG_EVENT_VM_BIND		4
 #define DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_DEBUG_DATA	5
+#define DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE	6
 
 	/** @flags: Flags */
 	__u16 flags;
@@ -146,6 +148,24 @@ struct drm_xe_eudebug_event_exec_queue {
  *
  * All the events below VM_BIND will reference the VM_BIND
  * they associate with, by field .vm_bind_ref_seqno.
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
  */
 struct drm_xe_eudebug_event_vm_bind {
 	/** @base: Base event */
@@ -156,6 +176,7 @@ struct drm_xe_eudebug_event_vm_bind {
 
 	/** @flags: Bind specific flags */
 	__u32 flags;
+#define DRM_XE_EUDEBUG_EVENT_VM_BIND_FLAG_UFENCE (1 << 0)
 
 	/** @num_bind_ops: How many [ADD|REMOVE]_DEBUG_DATA operations this bind has */
 	__u32 num_bind_ops;
@@ -206,6 +227,46 @@ struct drm_xe_eudebug_event_vm_bind_op_debug_data {
 	};
 };
 
+/**
+ * struct drm_xe_eudebug_event_vm_bind_ufence - User Fence Event
+ *
+ * When target drm client does vm bind with associated user fence,
+ * this event will be delivered. This event will have
+ * DRM_XE_EUDEBUG_EVENT_NEED_ACK set in :c:member:`drm_xe_eudebug_event.flags`
+ * and upon receiving this event you need to ack it with
+ * DRM_XE_EUDEBUG_IOCTL_ACK_EVENT.
+ *
+ */
+struct drm_xe_eudebug_event_vm_bind_ufence {
+	/** @base: Base event */
+	struct drm_xe_eudebug_event base;
+
+	/** @vm_bind_ref_seqno: Parent :c:member:`drm_xe_eudebug_event_vm_bind.base.seqno` */
+	__u64 vm_bind_ref_seqno;
+};
+
+/**
+ * struct drm_xe_eudebug_ack - Deliver ack for an event
+ *
+ * If event base.flags has DRM_XE_EUDEBUG_EVENT_NEED_ACK set,
+ * then the associated resource processing is held for client and
+ * thus held for the debugger. In order to release the client,
+ * ack needs to be delivered with DRM_XE_EUDEBUG_IOCTL_ACK_EVENT.
+ */
+struct drm_xe_eudebug_ack {
+	/** @type: Type, must be zero */
+	__u32 type;
+
+	/** @flags: Flags, must be zero */
+	__u32 flags;
+
+	/** @seqno: Seqno of event that is to be acked */
+	__u64 seqno;
+
+	/** @reserved: Reserved field, must be zero. */
+	__u64 reserved;
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.53.0

