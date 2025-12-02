Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B333CD116F6
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 13:53:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A2C910E64B;
	Tue,  2 Dec 2025 13:53:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PMBswd8U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5605F10E64B
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 13:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764683609; x=1796219609;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=x0xoyG8m36vj5G/VK9M+WBGQ6cKW7e/HeTGKN8cyurM=;
 b=PMBswd8U8C/DX/kpMkmNs4Sob38+frQ7Udhy1R3ohQxvVTcOIknQYYDy
 0owhuZnqt73aVuSiaz3HOr5lA9hQVDYnVwJxpLDrc/na8AwUPl5+OcPR8
 Vda/vu48iNHkJgA/mEEKfr9J30r1el0pI1NMToV3BtHvMDxXrD+8D0XZk
 1PsxtEQWEiiIDM9Rlpn9bs8LpHqO0ttgN0wRYkzmNGyCpo5UmPwCE1N9L
 9fF65nDKfacCoDAii18e9L9hBBQ+nr1Pz9LD++Ri10jyK8HHXCeaNT6GC
 EbMdaAp4MDq09EXTVrHDWGDtzP8enCfmj4r9smfnZuJYOrcynhm1r8IZ1 w==;
X-CSE-ConnectionGUID: Jlt/jLAnRz6cyfs4L4hxog==
X-CSE-MsgGUID: w9j+No3JTOOxSgkOB4g0KQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66537072"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="66537072"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 05:53:27 -0800
X-CSE-ConnectionGUID: zshvAWfVRkKSLhnvdcHSHQ==
X-CSE-MsgGUID: OAaxQWEHS9GHGvM3lQqh1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="199505659"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO mkuoppal-desk.lan)
 ([10.245.246.189])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 05:53:23 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, matthew.brost@intel.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, joonas.lahtinen@linux.intel.com,
 christoph.manszewski@intel.com, rodrigo.vivi@intel.com,
 andrzej.hajda@intel.com, matthew.auld@intel.com,
 maciej.patelczyk@intel.com, gwan-gyeong.mun@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH 08/20] drm/xe/eudebug: Add UFENCE events with acks
Date: Tue,  2 Dec 2025 15:52:27 +0200
Message-ID: <20251202135241.880267-9-mika.kuoppala@linux.intel.com>
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

When vma is in place, debugger needs to intercept before
userspace proceeds with the workload. For example to install
a breakpoint in an eu shader.

If ufence is part of bind sequence,aAttach debugger in
xe_user_fence. When ufence signal is about to be delivered,
check if this ufence needs to be tracked by debugger.
If so, stall the delivery of the ufence signal up until
debugger has acked the ufence (event), with the ack ioctl.

v2: - return err instead of 0 to guarantee signalling (Dominik)
    - checkpatch (Tilak)
    - Kconfig (Mika, Andrzej)
    - use lock instead of cmpxchg (Mika)
v4: - improve ref handling and no ufences nodebug binds
v5: - remove overzealous warn_on on bind_ref_seqno (Christoph)
    - remove superfluous signalled (Mika)
    - fix double free on bind sequence (Mika)
    - Dont fill op fields if no debugger (Maciej)
v6: - rework to align with xe_eudebug_bind_execute()

Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_eudebug.c       | 301 +++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_eudebug.h       |   9 +
 drivers/gpu/drm/xe/xe_eudebug_types.h |   9 +-
 drivers/gpu/drm/xe/xe_sync.c          |  39 ++--
 drivers/gpu/drm/xe/xe_sync.h          |   7 +-
 drivers/gpu/drm/xe/xe_sync_types.h    |  28 ++-
 include/uapi/drm/xe_drm_eudebug.h     |  35 ++-
 7 files changed, 402 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index 3f3654f4a700..d3a8ef2ea9e5 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -19,6 +19,7 @@
 #include "xe_exec_queue.h"
 #include "xe_hw_engine.h"
 #include "xe_macros.h"
+#include "xe_sync.h"
 #include "xe_vm.h"
 
 /*
@@ -217,6 +218,115 @@ static void remove_debugger(struct xe_file *xef)
 	}
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
+	if (READ_ONCE(ufence->signalled))
+		xe_sync_ufence_signal(ufence);
+
+	xe_sync_ufence_put(ufence);
+}
+
+static void kick_ufence_worker(struct xe_user_fence *f)
+{
+	queue_work(f->xe->eudebug.wq, &f->eudebug.worker);
+}
+
+static void handle_ack(struct xe_eudebug *d, struct xe_eudebug_ack *ack,
+		       bool on_disconnect)
+{
+	struct xe_user_fence *f = ack->ufence;
+	u64 signalled_by;
+	bool signal = false;
+
+	spin_lock(&f->eudebug.lock);
+	if (!f->eudebug.signalled_seqno) {
+		f->eudebug.signalled_seqno = ack->seqno;
+		f->eudebug.bind_ref_seqno = 0;
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
 static bool xe_eudebug_detach(struct xe_device *xe,
 			      struct xe_eudebug *d,
 			      const int err)
@@ -240,6 +350,8 @@ static bool xe_eudebug_detach(struct xe_device *xe,
 
 	eu_dbg(d, "session %lld detached with %d", d->session, err);
 
+	release_acks(d);
+
 	remove_debugger(target);
 	xe_file_put(target);
 
@@ -937,11 +1049,134 @@ static int vm_bind_op(struct xe_eudebug *d, struct xe_vm *vm,
 	return 0;
 }
 
+void xe_eudebug_ufence_init(struct xe_user_fence *ufence)
+{
+	spin_lock_init(&ufence->eudebug.lock);
+	INIT_WORK(&ufence->eudebug.worker, ufence_signal_worker);
+	ufence->eudebug.bind_ref_seqno = 0;
+	ufence->eudebug.signalled_seqno = 0;
+}
+
+void xe_eudebug_ufence_fini(struct xe_user_fence *ufence)
+{
+	XE_WARN_ON(READ_ONCE(ufence->eudebug.bind_ref_seqno));
+
+	if (!ufence->eudebug.debugger)
+		return;
+
+	xe_eudebug_put(ufence->eudebug.debugger);
+}
+
+static int xe_eudebug_track_ufence(struct xe_eudebug *d,
+				   struct xe_user_fence *f,
+				   u64 seqno)
+{
+	struct xe_eudebug_ack *ack;
+	struct rb_node *old;
+
+	ack = kzalloc(sizeof(*ack), GFP_KERNEL);
+	if (!ack)
+		return -ENOMEM;
+
+	ack->seqno = seqno;
+	ack->ts_insert = ktime_get();
+
+	__xe_sync_ufence_get(f);
+
+	spin_lock(&d->acks.lock);
+	old = rb_find_add(&ack->rb_node,
+			  &d->acks.tree, ack_insert_cmp);
+	if (!old)
+		ack->ufence = f;
+	spin_unlock(&d->acks.lock);
+
+	if (ack->ufence)
+		return 0;
+
+	xe_sync_ufence_put(f);
+	kfree(ack);
+
+	return -EEXIST;
+}
+
+static int track_ufence(struct xe_eudebug *d,
+			struct xe_user_fence *ufence)
+{
+	struct drm_xe_eudebug_event *event;
+	struct drm_xe_eudebug_event_vm_bind_ufence *e;
+	const u32 sz = sizeof(*e);
+	const u32 flags = DRM_XE_EUDEBUG_EVENT_CREATE |
+		DRM_XE_EUDEBUG_EVENT_NEED_ACK;
+	u64 seqno;
+	int ret;
+
+	if (XE_WARN_ON(!ufence->eudebug.bind_ref_seqno))
+		return -EINVAL;
+
+	seqno = atomic_long_inc_return(&d->events.seqno);
+
+	event = xe_eudebug_create_event(d, DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
+					seqno, flags, sz);
+	if (!event)
+		return -ENOMEM;
+
+	e = cast_event(e, event);
+	e->vm_bind_ref_seqno = ufence->eudebug.bind_ref_seqno;
+
+	ret = xe_eudebug_track_ufence(d, ufence, seqno);
+	if (ret) {
+		kfree(event);
+
+		eu_dbg(d, "tracking of ufence %llu failed with %d\n", seqno, ret);
+
+		return ret;
+	}
+
+	return xe_eudebug_queue_event(d, event);
+}
+
+/**
+ * xe_eudebug_track_ufence - Track the ufence for eudebug
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
+	int ret;
+
+	spin_lock(&ufence->eudebug.lock);
+	d = ufence->eudebug.debugger;
+	spin_unlock(&ufence->eudebug.lock);
+
+	if (!d)
+		return false;
+
+	if (xe_eudebug_detached(d))
+		return false;
+
+	ret = track_ufence(d, ufence);
+	if (ret) {
+		xe_eudebug_disconnect(d, ret);
+		return false;
+	}
+
+	return true;
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
@@ -953,6 +1188,15 @@ void xe_eudebug_vm_bind_execute(struct xe_vm *vm,
 	if (!d)
 		return;
 
+	for (i = 0; i < ops->num_syncs; i++) {
+		struct xe_sync_entry *se = &ops->syncs[i];
+
+		if (xe_sync_is_ufence(se)) {
+			xe_assert(vm->xe, ufence == NULL);
+			ufence = se->ufence;
+		}
+	}
+
 	num_ops = 0;
 	list_for_each_entry(op, &ops->list, link) {
 		if (op->base.op != DRM_GPUVA_OP_DRIVER)
@@ -965,7 +1209,8 @@ void xe_eudebug_vm_bind_execute(struct xe_vm *vm,
 
 	lockdep_assert_held_write(&vm->lock);
 
-	err = vm_bind_event(d, vm, 0,
+	err = vm_bind_event(d, vm,
+			    ufence ? DRM_XE_EUDEBUG_EVENT_VM_BIND_FLAG_UFENCE : 0,
 			    num_ops, &bind_seqno);
 	if (err)
 		goto out_err;
@@ -991,6 +1236,14 @@ void xe_eudebug_vm_bind_execute(struct xe_vm *vm,
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
@@ -1315,6 +1568,44 @@ static long xe_eudebug_read_event(struct xe_eudebug *d,
 	return ret;
 }
 
+static long
+xe_eudebug_ack_event_ioctl(struct xe_eudebug *d,
+			   const unsigned int cmd,
+			   const u64 arg)
+{
+	struct drm_xe_eudebug_ack_event __user * const user_ptr =
+		u64_to_user_ptr(arg);
+	struct drm_xe_eudebug_ack_event user_arg;
+	struct xe_eudebug_ack *ack;
+	struct xe_device *xe = d->xe;
+
+	if (XE_IOCTL_DBG(xe, _IOC_SIZE(cmd) < sizeof(user_arg)))
+		return -EINVAL;
+
+	/* Userland write */
+	if (XE_IOCTL_DBG(xe, !(_IOC_DIR(cmd) & _IOC_WRITE)))
+		return -EINVAL;
+
+	if (XE_IOCTL_DBG(xe, copy_from_user(&user_arg,
+					    user_ptr,
+					    sizeof(user_arg))))
+		return -EFAULT;
+
+	if (XE_IOCTL_DBG(xe, user_arg.flags))
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
 static long xe_eudebug_ioctl(struct file *file,
 			     unsigned int cmd,
 			     unsigned long arg)
@@ -1331,7 +1622,10 @@ static long xe_eudebug_ioctl(struct file *file,
 		ret = xe_eudebug_read_event(d, arg,
 					    !(file->f_flags & O_NONBLOCK));
 		break;
-
+	case DRM_XE_EUDEBUG_IOCTL_ACK_EVENT:
+		ret = xe_eudebug_ack_event_ioctl(d, cmd, arg);
+		eu_dbg(d, "ioctl cmd=EVENT_ACK ret=%ld\n", ret);
+		break;
 	default:
 		ret = -EINVAL;
 	}
@@ -1393,6 +1687,9 @@ xe_eudebug_connect(struct xe_device *xe,
 	INIT_KFIFO(d->events.fifo);
 	INIT_WORK(&d->discovery_work, discovery_work_fn);
 
+	spin_lock_init(&d->acks.lock);
+	d->acks.tree = RB_ROOT;
+
 	d->res = xe_eudebug_resources_alloc();
 	if (XE_IOCTL_DBG(xe, IS_ERR(d->res))) {
 		err = PTR_ERR(d->res);
diff --git a/drivers/gpu/drm/xe/xe_eudebug.h b/drivers/gpu/drm/xe/xe_eudebug.h
index 9c622362c0f7..d0f1b51564dc 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.h
+++ b/drivers/gpu/drm/xe/xe_eudebug.h
@@ -56,6 +56,10 @@ void xe_eudebug_exec_queue_destroy(struct xe_file *xef, struct xe_exec_queue *q)
 
 void xe_eudebug_vm_bind_execute(struct xe_vm *vm, struct xe_vma_ops *ops);
 
+void xe_eudebug_ufence_init(struct xe_user_fence *ufence);
+void xe_eudebug_ufence_fini(struct xe_user_fence *ufence);
+bool xe_eudebug_ufence_track(struct xe_user_fence *ufence);
+
 #else
 
 static inline int xe_eudebug_connect_ioctl(struct drm_device *dev,
@@ -74,6 +78,11 @@ static inline void xe_eudebug_exec_queue_create(struct xe_file *xef, struct xe_e
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
index 502b121114df..a294e2f4e7df 100644
--- a/drivers/gpu/drm/xe/xe_eudebug_types.h
+++ b/drivers/gpu/drm/xe/xe_eudebug_types.h
@@ -33,7 +33,7 @@ enum xe_eudebug_state {
 };
 
 #define CONFIG_DRM_XE_DEBUGGER_EVENT_QUEUE_SIZE 64
-#define XE_EUDEBUG_MAX_EVENT_TYPE DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_DEBUG_DATA
+#define XE_EUDEBUG_MAX_EVENT_TYPE DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE
 
 /**
  * struct xe_eudebug_handle - eudebug resource handle
@@ -132,6 +132,13 @@ struct xe_eudebug {
 		atomic_long_t seqno;
 	} events;
 
+	/* user fences tracked by this debugger */
+	struct {
+		/** @lock: guards access to tree */
+		spinlock_t lock;
+
+		struct rb_root tree;
+	} acks;
 };
 
 #endif /* _XE_EUDEBUG_TYPES_H_ */
diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index ff74528ca0c6..fd38be30fa67 100644
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
@@ -70,14 +64,15 @@ static struct xe_user_fence *user_fence_create(struct xe_device *xe, u64 addr,
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
+	XE_WARN_ON(!ufence->signalled);
 
-	WRITE_ONCE(ufence->signalled, 1);
 	if (mmget_not_zero(ufence->mm)) {
 		kthread_use_mm(ufence->mm);
 		if (copy_to_user(ufence->addr, &ufence->value, sizeof(ufence->value)))
@@ -88,11 +83,23 @@ static void user_fence_worker(struct work_struct *w)
 		drm_dbg(&ufence->xe->drm, "mmget_not_zero() failed, ufence wasn't signaled\n");
 	}
 
+	wake_up_all(&ufence->xe->ufence_wq);
+}
+
+static void user_fence_worker(struct work_struct *w)
+{
+	struct xe_user_fence *ufence = container_of(w, struct xe_user_fence, worker);
+
 	/*
 	 * Wake up waiters only after updating the ufence state, allowing the UMD
 	 * to safely reuse the same ufence without encountering -EBUSY errors.
 	 */
-	wake_up_all(&ufence->xe->ufence_wq);
+	WRITE_ONCE(ufence->signalled, 1);
+
+	/* Lets see if debugger wants to track this */
+	if (!xe_eudebug_ufence_track(ufence))
+		xe_sync_ufence_signal(ufence);
+
 	user_fence_put(ufence);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_sync.h b/drivers/gpu/drm/xe/xe_sync.h
index 51f2d803e977..62caaa6470af 100644
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
 
@@ -43,5 +47,6 @@ struct xe_user_fence *__xe_sync_ufence_get(struct xe_user_fence *ufence);
 struct xe_user_fence *xe_sync_ufence_get(struct xe_sync_entry *sync);
 void xe_sync_ufence_put(struct xe_user_fence *ufence);
 int xe_sync_ufence_get_status(struct xe_user_fence *ufence);
+void xe_sync_ufence_signal(struct xe_user_fence *ufence);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sync_types.h b/drivers/gpu/drm/xe/xe_sync_types.h
index b88f1833e28c..33a93a0faa72 100644
--- a/drivers/gpu/drm/xe/xe_sync_types.h
+++ b/drivers/gpu/drm/xe/xe_sync_types.h
@@ -6,13 +6,31 @@
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
index 5891f4d91358..b363583cb1d6 100644
--- a/include/uapi/drm/xe_drm_eudebug.h
+++ b/include/uapi/drm/xe_drm_eudebug.h
@@ -15,7 +15,8 @@ extern "C" {
  *
  * This ioctl is available in debug version 1.
  */
-#define DRM_XE_EUDEBUG_IOCTL_READ_EVENT _IO('j', 0x0)
+#define DRM_XE_EUDEBUG_IOCTL_READ_EVENT		_IO('j', 0x0)
+#define DRM_XE_EUDEBUG_IOCTL_ACK_EVENT		_IOW('j', 0x1, struct drm_xe_eudebug_ack_event)
 
 /**
  * struct drm_xe_eudebug_event - Base type of event delivered by xe_eudebug.
@@ -51,6 +52,7 @@ struct drm_xe_eudebug_event {
 #define DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE		3
 #define DRM_XE_EUDEBUG_EVENT_VM_BIND		4
 #define DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_DEBUG_DATA	5
+#define DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE	6
 
 	__u16 flags;
 #define DRM_XE_EUDEBUG_EVENT_CREATE		(1 << 0)
@@ -105,6 +107,24 @@ struct drm_xe_eudebug_event_exec_queue {
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
@@ -112,6 +132,8 @@ struct drm_xe_eudebug_event_vm_bind {
 
 	__u64 vm_handle;
 	__u32 flags;
+#define DRM_XE_EUDEBUG_EVENT_VM_BIND_FLAG_UFENCE (1 << 0)
+
 	__u32 num_bind_ops;
 };
 
@@ -131,6 +153,17 @@ struct drm_xe_eudebug_event_vm_bind_op_debug_data {
 	};
 };
 
+struct drm_xe_eudebug_event_vm_bind_ufence {
+	struct drm_xe_eudebug_event base;
+	__u64 vm_bind_ref_seqno; /* *_event_vm_bind.base.seqno */
+};
+
+struct drm_xe_eudebug_ack_event {
+	__u32 type;
+	__u32 flags; /* MBZ */
+	__u64 seqno;
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.43.0

