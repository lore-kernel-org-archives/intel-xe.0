Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37F97CCA471
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 11:17:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0330310E42C;
	Mon,  6 Oct 2025 11:17:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IhL+CQ93";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E869F10E425
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 11:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759749476; x=1791285476;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2+9daTpnndbWCv7HHpXUhjY9y2S7ptexDCBtmhCBKBM=;
 b=IhL+CQ93ALL7mvMThqNxv+al5PHCa4a5lltDkPu7pOVozGdImYKsTIIo
 ClD41YZwMtadw+ZkiEGPpd3OmAxxDPmD1mmL/qemhhcyjTwYz45JHYMFw
 jqZYF9+klIJTx8nPCNshZyFm0co1ff5b2qaAyvI0DR9QIRiEscI2Lo3zz
 dU8GqaTxsajKQ7j7ao1pJ7Os1Fuws3i8wBzOFjcZvoA9nyVsvjAe2oOWO
 mJx/Nk+U7hVjovUw/w1EYTL/3WZEplzA0vPDzH+W3FprW4dnk/mFV0Q1i
 sVak3Wd4TD49uQKSZ810vlDPENXKV+VQ8tu/yy7OUQWItuLt/ZnoCIjgV g==;
X-CSE-ConnectionGUID: peRn/qpiRgyjPSxYzNAfRg==
X-CSE-MsgGUID: zsHxsfv8Q5CBVPdSFIZFsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11573"; a="61825423"
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="61825423"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 04:17:56 -0700
X-CSE-ConnectionGUID: /jR28oopSreVVq8TcxRIQg==
X-CSE-MsgGUID: EFVFJk14ShqCb+FN+i3TzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="216946972"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO
 mkuoppal-desk.intel.com) ([10.245.245.44])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 04:17:52 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, matthew.brost@intel.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, joonas.lahtinen@linux.intel.com,
 christoph.manszewski@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, andrzej.hajda@intel.com, matthew.auld@intel.com,
 maciej.patelczyk@intel.com, gwan-gyeong.mun@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH 07/20] drm/xe/eudebug: Add UFENCE events with acks
Date: Mon,  6 Oct 2025 14:16:57 +0300
Message-ID: <20251006111711.201906-8-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251006111711.201906-1-mika.kuoppala@linux.intel.com>
References: <20251006111711.201906-1-mika.kuoppala@linux.intel.com>
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
a breakpoint in a eu shader.

Attach debugger in xe_user_fence, send UFENCE event
and stall normal user fence signal path to yield if
there is debugger attached to ufence.

When ack (ioctl) is received for the corresponding seqno,
signal ufence.

v2: - return err instead of 0 to guarantee signalling (Dominik)
    - checkpatch (Tilak)
    - Kconfig (Mika, Andrzej)
    - use lock instead of cmpxchg (Mika)
v4: - improve ref handling and no ufences nodebug binds
v5: - remove overzealous warn_on on bind_ref_seqno (Christoph)
    - remove superfluous signalled (Mika)
    - fix double free on bind sequence (Mika)
    - Dont fill op fields if no debugger (Maciej)

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_eudebug.c       | 302 +++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_eudebug.h       |  15 ++
 drivers/gpu/drm/xe/xe_eudebug_types.h |   9 +-
 drivers/gpu/drm/xe/xe_exec.c          |   2 +-
 drivers/gpu/drm/xe/xe_oa.c            |   3 +-
 drivers/gpu/drm/xe/xe_sync.c          |  47 ++--
 drivers/gpu/drm/xe/xe_sync.h          |   8 +-
 drivers/gpu/drm/xe/xe_sync_types.h    |  28 ++-
 drivers/gpu/drm/xe/xe_vm.c            |   4 +-
 include/uapi/drm/xe_drm_eudebug.h     |  15 +-
 10 files changed, 402 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index 0255f35924d8..85ffe417e492 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -19,6 +19,7 @@
 #include "xe_exec_queue.h"
 #include "xe_hw_engine.h"
 #include "xe_macros.h"
+#include "xe_sync.h"
 #include "xe_vm.h"
 
 /*
@@ -186,7 +187,7 @@ static void xe_eudebug_free(struct kref *ref)
 	kfree(d);
 }
 
-static void xe_eudebug_put(struct xe_eudebug *d)
+void xe_eudebug_put(struct xe_eudebug *d)
 {
 	kref_put(&d->ref, xe_eudebug_free);
 }
@@ -217,6 +218,114 @@ static void remove_debugger(struct xe_file *xef)
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
@@ -240,6 +349,8 @@ static bool xe_eudebug_detach(struct xe_device *xe,
 
 	eu_dbg(d, "session %lld detached with %d", d->session, err);
 
+	release_acks(d);
+
 	remove_debugger(target);
 	xe_file_put(target);
 
@@ -284,7 +395,7 @@ _xe_eudebug_get(struct xe_file *xef)
 	return d;
 }
 
-static struct xe_eudebug *
+struct xe_eudebug *
 xe_eudebug_get(struct xe_file *xef)
 {
 	struct xe_eudebug *d;
@@ -983,6 +1094,141 @@ static int vm_bind_op(struct xe_eudebug *d, struct xe_vm *vm,
 	return 0;
 }
 
+
+void xe_eudebug_ufence_init(struct xe_user_fence *ufence,
+			    struct xe_file *xef,
+			    struct xe_vm *vm)
+{
+	u64 bind_ref;
+
+	/* Drop if OA */
+	if (!vm)
+		return;
+
+	spin_lock(&vm->eudebug.lock);
+	bind_ref = vm->eudebug.ref_seqno;
+	spin_unlock(&vm->eudebug.lock);
+
+	spin_lock_init(&ufence->eudebug.lock);
+	INIT_WORK(&ufence->eudebug.worker, ufence_signal_worker);
+
+	ufence->eudebug.signalled_seqno = 0;
+
+	if (bind_ref) {
+		ufence->eudebug.debugger = xe_eudebug_get(xef);
+
+		if (ufence->eudebug.debugger)
+			ufence->eudebug.bind_ref_seqno = bind_ref;
+	}
+}
+
+void xe_eudebug_ufence_fini(struct xe_user_fence *ufence)
+{
+	XE_WARN_ON(ufence->eudebug.bind_ref_seqno);
+
+	if (!ufence->eudebug.debugger)
+		return;
+
+	xe_eudebug_put(ufence->eudebug.debugger);
+	ufence->eudebug.debugger = NULL;
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
+static int vm_bind_ufence_event(struct xe_eudebug *d,
+				struct xe_user_fence *ufence,
+				u64 bind_ref_seqno)
+{
+	struct drm_xe_eudebug_event *event;
+	struct drm_xe_eudebug_event_vm_bind_ufence *e;
+	const u32 sz = sizeof(*e);
+	const u32 flags = DRM_XE_EUDEBUG_EVENT_CREATE |
+		DRM_XE_EUDEBUG_EVENT_NEED_ACK;
+	u64 seqno;
+	int ret;
+
+	seqno = atomic_long_inc_return(&d->events.seqno);
+
+	event = xe_eudebug_create_event(d, DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
+					seqno, flags, sz);
+	if (!event)
+		return -ENOMEM;
+
+	e = cast_event(e, event);
+	e->vm_bind_ref_seqno = bind_ref_seqno;
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
+int xe_eudebug_vm_bind_ufence(struct xe_user_fence *ufence)
+{
+	struct xe_eudebug *d;
+	u64 bind_ref_seqno;
+	int err;
+
+	spin_lock(&ufence->eudebug.lock);
+	d = ufence->eudebug.debugger;
+	bind_ref_seqno = ufence->eudebug.bind_ref_seqno;
+	ufence->eudebug.bind_ref_seqno = 0;
+	spin_unlock(&ufence->eudebug.lock);
+
+	if (!d || xe_eudebug_detached(d))
+		return -ENOTCONN;
+
+	/* If there is no bind ref, no need to track */
+	if (!bind_ref_seqno) {
+		eu_dbg(d, "ufence without bind_ref_seqno, omitting send");
+		return -ENOENT;
+	}
+
+	err = vm_bind_ufence_event(d, ufence, bind_ref_seqno);
+	if (err) {
+		eu_err(d, "error %d on %s", err, __func__);
+		xe_eudebug_disconnect(d, err);
+	}
+
+	return err;
+}
+
 void xe_eudebug_vm_init(struct xe_vm *vm)
 {
 	INIT_LIST_HEAD(&vm->eudebug.events);
@@ -1123,6 +1369,12 @@ void xe_eudebug_vm_bind_end(struct xe_vm *vm,
 
 	XE_WARN_ON(ufence && bind_err);
 
+	if (ufence && !bind_ops) {
+		spin_lock(&ufence->eudebug.lock);
+		ufence->eudebug.bind_ref_seqno = 0;
+		spin_unlock(&ufence->eudebug.lock);
+	}
+
 	e = fetch_bind_event(vm);
 	if (!e)
 		return;
@@ -1484,6 +1736,44 @@ static long xe_eudebug_read_event(struct xe_eudebug *d,
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
@@ -1500,7 +1790,10 @@ static long xe_eudebug_ioctl(struct file *file,
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
@@ -1562,6 +1855,9 @@ xe_eudebug_connect(struct xe_device *xe,
 	INIT_KFIFO(d->events.fifo);
 	INIT_WORK(&d->discovery_work, discovery_work_fn);
 
+	spin_lock_init(&d->acks.lock);
+	d->acks.tree = RB_ROOT;
+
 	d->res = xe_eudebug_resources_alloc();
 	if (XE_IOCTL_DBG(xe, IS_ERR(d->res))) {
 		err = PTR_ERR(d->res);
diff --git a/drivers/gpu/drm/xe/xe_eudebug.h b/drivers/gpu/drm/xe/xe_eudebug.h
index 6eb8a683a8b9..6be20140d5d4 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.h
+++ b/drivers/gpu/drm/xe/xe_eudebug.h
@@ -59,6 +59,13 @@ void xe_eudebug_vm_bind_end(struct xe_vm *vm,
 			    struct xe_user_fence *ufence,
 			    int bind_err);
 
+int xe_eudebug_vm_bind_ufence(struct xe_user_fence *ufence);
+void xe_eudebug_ufence_init(struct xe_user_fence *ufence, struct xe_file *xef, struct xe_vm *vm);
+void xe_eudebug_ufence_fini(struct xe_user_fence *ufence);
+
+struct xe_eudebug *xe_eudebug_get(struct xe_file *xef);
+void xe_eudebug_put(struct xe_eudebug *d);
+
 #else
 
 static inline int xe_eudebug_connect_ioctl(struct drm_device *dev,
@@ -85,6 +92,14 @@ static inline void xe_eudebug_vm_bind_end(struct xe_vm *vm,
 					  struct xe_user_fence *ufence,
 					  int bind_err) { }
 
+static inline int xe_eudebug_vm_bind_ufence(struct xe_user_fence *ufence) { return 0; }
+static inline void xe_eudebug_ufence_init(struct xe_user_fence *ufence,
+					  struct xe_file *xef, struct xe_vm *vm) { }
+static inline void xe_eudebug_ufence_fini(struct xe_user_fence *ufence) { }
+
+static inline struct xe_eudebug *xe_eudebug_get(struct xe_file *xef) { return NULL; }
+static inline void xe_eudebug_put(struct xe_eudebug *d) { }
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
diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 83897950f0da..b1e69daf4c3c 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -165,7 +165,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	vm = q->vm;
 
 	for (num_syncs = 0; num_syncs < args->num_syncs; num_syncs++) {
-		err = xe_sync_entry_parse(xe, xef, &syncs[num_syncs],
+		err = xe_sync_entry_parse(xe, xef, vm, &syncs[num_syncs],
 					  &syncs_user[num_syncs], SYNC_PARSE_FLAG_EXEC |
 					  (xe_vm_in_lr_mode(vm) ?
 					   SYNC_PARSE_FLAG_LR_MODE : 0));
diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index a4894eb0d7f3..4ce0959c2858 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -1408,7 +1408,8 @@ static int xe_oa_parse_syncs(struct xe_oa *oa, struct xe_oa_open_param *param)
 	}
 
 	for (num_syncs = 0; num_syncs < param->num_syncs; num_syncs++) {
-		ret = xe_sync_entry_parse(oa->xe, param->xef, &param->syncs[num_syncs],
+		ret = xe_sync_entry_parse(oa->xe, param->xef, NULL,
+					  &param->syncs[num_syncs],
 					  &param->syncs_user[num_syncs], 0);
 		if (ret)
 			goto err_syncs;
diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index 82872a51f098..166c205352eb 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -15,27 +15,20 @@
 #include <uapi/drm/xe_drm.h>
 
 #include "xe_device_types.h"
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
 
@@ -49,7 +42,10 @@ static void user_fence_put(struct xe_user_fence *ufence)
 	kref_put(&ufence->refcount, user_fence_destroy);
 }
 
-static struct xe_user_fence *user_fence_create(struct xe_device *xe, u64 addr,
+static struct xe_user_fence *user_fence_create(struct xe_device *xe,
+					       struct xe_file *xef,
+					       struct xe_vm *vm,
+					       u64 addr,
 					       u64 value)
 {
 	struct xe_user_fence *ufence;
@@ -70,14 +66,15 @@ static struct xe_user_fence *user_fence_create(struct xe_device *xe, u64 addr,
 	ufence->mm = current->mm;
 	mmgrab(ufence->mm);
 
+	xe_eudebug_ufence_init(ufence, xef, vm);
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
@@ -88,11 +85,25 @@ static void user_fence_worker(struct work_struct *w)
 		drm_dbg(&ufence->xe->drm, "mmget_not_zero() failed, ufence wasn't signaled\n");
 	}
 
+	wake_up_all(&ufence->xe->ufence_wq);
+}
+
+static void user_fence_worker(struct work_struct *w)
+{
+	struct xe_user_fence *ufence = container_of(w, struct xe_user_fence, worker);
+	int ret;
+
 	/*
 	 * Wake up waiters only after updating the ufence state, allowing the UMD
 	 * to safely reuse the same ufence without encountering -EBUSY errors.
 	 */
-	wake_up_all(&ufence->xe->ufence_wq);
+	WRITE_ONCE(ufence->signalled, 1);
+
+	/* Lets see if debugger wants to track this */
+	ret = xe_eudebug_vm_bind_ufence(ufence);
+	if (ret)
+		xe_sync_ufence_signal(ufence);
+
 	user_fence_put(ufence);
 }
 
@@ -111,6 +122,7 @@ static void user_fence_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
 }
 
 int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
+			struct xe_vm *vm,
 			struct xe_sync_entry *sync,
 			struct drm_xe_sync __user *sync_user,
 			unsigned int flags)
@@ -192,7 +204,8 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
 		if (exec) {
 			sync->addr = sync_in.addr;
 		} else {
-			sync->ufence = user_fence_create(xe, sync_in.addr,
+			sync->ufence = user_fence_create(xe, xef, vm,
+							 sync_in.addr,
 							 sync_in.timeline_value);
 			if (XE_IOCTL_DBG(xe, IS_ERR(sync->ufence)))
 				return PTR_ERR(sync->ufence);
diff --git a/drivers/gpu/drm/xe/xe_sync.h b/drivers/gpu/drm/xe/xe_sync.h
index 256ffc1e54dc..f5bec2b1b4f6 100644
--- a/drivers/gpu/drm/xe/xe_sync.h
+++ b/drivers/gpu/drm/xe/xe_sync.h
@@ -9,8 +9,12 @@
 #include "xe_sync_types.h"
 
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
 
@@ -19,6 +23,7 @@ struct xe_vm;
 #define SYNC_PARSE_FLAG_DISALLOW_USER_FENCE	BIT(2)
 
 int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
+			struct xe_vm *vm,
 			struct xe_sync_entry *sync,
 			struct drm_xe_sync __user *sync_user,
 			unsigned int flags);
@@ -40,5 +45,6 @@ struct xe_user_fence *__xe_sync_ufence_get(struct xe_user_fence *ufence);
 struct xe_user_fence *xe_sync_ufence_get(struct xe_sync_entry *sync);
 void xe_sync_ufence_put(struct xe_user_fence *ufence);
 int xe_sync_ufence_get_status(struct xe_user_fence *ufence);
+void xe_sync_ufence_signal(struct xe_user_fence *ufence);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sync_types.h b/drivers/gpu/drm/xe/xe_sync_types.h
index 30ac3f51993b..dcd3165e66a7 100644
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
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index de2d1e0c8def..5f86e87d8458 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3765,9 +3765,11 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		}
 	}
 
+	xe_eudebug_vm_bind_start(vm);
+
 	syncs_user = u64_to_user_ptr(args->syncs);
 	for (num_syncs = 0; num_syncs < args->num_syncs; num_syncs++) {
-		err = xe_sync_entry_parse(xe, xef, &syncs[num_syncs],
+		err = xe_sync_entry_parse(xe, xef, vm, &syncs[num_syncs],
 					  &syncs_user[num_syncs],
 					  (xe_vm_in_lr_mode(vm) ?
 					   SYNC_PARSE_FLAG_LR_MODE : 0) |
diff --git a/include/uapi/drm/xe_drm_eudebug.h b/include/uapi/drm/xe_drm_eudebug.h
index b2b2b90bb3a7..e55fa52c2973 100644
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
@@ -152,6 +154,17 @@ struct drm_xe_eudebug_event_vm_bind_op_debug_data {
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

