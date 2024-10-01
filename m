Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F311CEACDB
	for <intel-xe@archiver.kernel.org>; Tue,  1 Oct 2024 14:53:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EF1D10E648;
	Tue,  1 Oct 2024 14:53:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RAOA7VxF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64B5310E648
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Oct 2024 14:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727794426; x=1759330426;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Osc9k+HHi0HRSKARwLUsOfP42rhOBt5vw9jiALpYnG8=;
 b=RAOA7VxF32yelZge8NZNeOUSQgTHbsWp6wCYoc8AHmQzY9BidD9iltoi
 Qwa6qi8vtpIe3AieykVn3PMYM8aBjkvu4Es862H9Et1UZD0f0jsj39n+R
 +BkOyF3q/L0lNYoQt+hFLykvyX/G2Fn42/MLm4fBkamUNSE/nAbLnBULg
 /z0HYNtU+RvfSmSKjVve/y/9nWOZAiP7jF9Qfzix0bjurfdxETrcQ75Al
 qkEsCP/sSI5ZlqG2GwDUGCiFp19H2nln8RzMmsIl2xRJnTI+Q4nKC/YQJ
 eV2aPXfJWepanCLxjwayduAjI4qzt9hX8x36tNbfOek1eYiK8AVXN9IfB w==;
X-CSE-ConnectionGUID: BRYV7QqWRAOFc5c07a8zNg==
X-CSE-MsgGUID: fFLnJQnpTa61337iHyW6Cg==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="27091405"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="27091405"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2024 07:53:46 -0700
X-CSE-ConnectionGUID: 9cN9jI7uQ0WLgqpdR0uBZA==
X-CSE-MsgGUID: 95js94I7SFO56z8C7sJfSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="97048696"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2024 07:53:45 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH 10/18] drm/xe/eudebug: Add UFENCE events with acks
Date: Tue,  1 Oct 2024 17:42:58 +0300
Message-Id: <20241001144306.1991001-11-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241001144306.1991001-1-mika.kuoppala@linux.intel.com>
References: <20241001144306.1991001-1-mika.kuoppala@linux.intel.com>
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

Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 drivers/gpu/drm/xe/xe_eudebug.c       | 277 +++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_eudebug.h       |  15 ++
 drivers/gpu/drm/xe/xe_eudebug_types.h |  13 ++
 drivers/gpu/drm/xe/xe_exec.c          |   2 +-
 drivers/gpu/drm/xe/xe_sync.c          |  45 +++--
 drivers/gpu/drm/xe/xe_sync.h          |   8 +-
 drivers/gpu/drm/xe/xe_sync_types.h    |  28 ++-
 drivers/gpu/drm/xe/xe_vm.c            |   4 +-
 include/uapi/drm/xe_drm_eudebug.h     |  13 ++
 9 files changed, 377 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index 785658b2e199..68c33d2e8e77 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -32,6 +32,7 @@
 #include "xe_reg_sr.h"
 #include "xe_rtp.h"
 #include "xe_sched_job.h"
+#include "xe_sync.h"
 #include "xe_vm.h"
 #include "xe_wa.h"
 
@@ -239,11 +240,119 @@ static void xe_eudebug_free(struct kref *ref)
 	kfree_rcu(d, rcu);
 }
 
-static void xe_eudebug_put(struct xe_eudebug *d)
+void xe_eudebug_put(struct xe_eudebug *d)
 {
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
+	if (READ_ONCE(ufence->signalled))
+		xe_sync_ufence_signal(ufence);
+
+	xe_sync_ufence_put(ufence);
+}
+
+static void kick_ufence_worker(struct xe_user_fence *f)
+{
+	queue_work(f->xe->eudebug.ordered_wq, &f->eudebug.worker);
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
 static struct task_struct *find_get_target(const pid_t nr)
 {
 	struct task_struct *task;
@@ -328,6 +437,8 @@ static bool xe_eudebug_detach(struct xe_device *xe,
 
 	eu_dbg(d, "session %lld detached with %d", d->session, err);
 
+	release_acks(d);
+
 	/* Our ref with the connection_link */
 	xe_eudebug_put(d);
 
@@ -453,7 +564,7 @@ _xe_eudebug_get(struct xe_file *xef)
 	return d;
 }
 
-static struct xe_eudebug *
+struct xe_eudebug *
 xe_eudebug_get(struct xe_file *xef)
 {
 	struct xe_eudebug *d;
@@ -824,7 +935,7 @@ static long xe_eudebug_read_event(struct xe_eudebug *d,
 		u64_to_user_ptr(arg);
 	struct drm_xe_eudebug_event user_event;
 	struct xe_eudebug_event *event;
-	const unsigned int max_event = DRM_XE_EUDEBUG_EVENT_VM_BIND_OP;
+	const unsigned int max_event = DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE;
 	long ret = 0;
 
 	if (XE_IOCTL_DBG(xe, copy_from_user(&user_event, user_orig, sizeof(user_event))))
@@ -899,6 +1010,44 @@ static long xe_eudebug_read_event(struct xe_eudebug *d,
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
 static int do_eu_control(struct xe_eudebug *d,
 			 const struct drm_xe_eudebug_eu_control * const arg,
 			 struct drm_xe_eudebug_eu_control __user * const user_ptr)
@@ -1090,7 +1239,10 @@ static long xe_eudebug_ioctl(struct file *file,
 		ret = xe_eudebug_eu_control(d, arg);
 		eu_dbg(d, "ioctl cmd=EU_CONTROL ret=%ld\n", ret);
 		break;
-
+	case DRM_XE_EUDEBUG_IOCTL_ACK_EVENT:
+		ret = xe_eudebug_ack_event_ioctl(d, cmd, arg);
+		eu_dbg(d, "ioctl cmd=EVENT_ACK ret=%ld\n", ret);
+		break;
 	default:
 		ret = -EINVAL;
 	}
@@ -1764,6 +1916,9 @@ xe_eudebug_connect(struct xe_device *xe,
 	INIT_KFIFO(d->events.fifo);
 	INIT_WORK(&d->discovery_work, discovery_work_fn);
 
+	spin_lock_init(&d->acks.lock);
+	d->acks.tree = RB_ROOT;
+
 	d->res = xe_eudebug_resources_alloc();
 	if (IS_ERR(d->res)) {
 		err = PTR_ERR(d->res);
@@ -2396,6 +2551,70 @@ static int vm_bind_op(struct xe_eudebug *d, struct xe_vm *vm,
 	return 0;
 }
 
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
+	spin_lock(&d->acks.lock);
+	old = rb_find_add(&ack->rb_node,
+			  &d->acks.tree, ack_insert_cmp);
+	if (!old) {
+		kref_get(&f->refcount);
+		ack->ufence = f;
+	}
+	spin_unlock(&d->acks.lock);
+
+	if (old) {
+		eu_dbg(d, "ACK: seqno=%llu: already exists", seqno);
+		kfree(ack);
+		return -EEXIST;
+	}
+
+	eu_dbg(d, "ACK: seqno=%llu: tracking started", seqno);
+
+	return 0;
+}
+
+static int vm_bind_ufence_event(struct xe_eudebug *d,
+				struct xe_user_fence *ufence)
+{
+	struct xe_eudebug_event *event;
+	struct xe_eudebug_event_vm_bind_ufence *e;
+	const u32 sz = sizeof(*e);
+	const u32 flags = DRM_XE_EUDEBUG_EVENT_CREATE |
+		DRM_XE_EUDEBUG_EVENT_NEED_ACK;
+	u64 seqno;
+	int ret;
+
+	seqno = atomic_long_inc_return(&d->events.seqno);
+
+	event = xe_eudebug_create_event(d, DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
+					seqno, flags, sz, GFP_KERNEL);
+	if (!event)
+		return -ENOMEM;
+
+	e = cast_event(e, event);
+
+	write_member(struct drm_xe_eudebug_event_vm_bind_ufence,
+		     e, vm_bind_ref_seqno, ufence->eudebug.bind_ref_seqno);
+
+	ret = xe_eudebug_track_ufence(d, ufence, seqno);
+	if (!ret)
+		ret = xe_eudebug_queue_event(d, event);
+
+	return ret;
+}
+
 void xe_eudebug_vm_init(struct xe_vm *vm)
 {
 	INIT_LIST_HEAD(&vm->eudebug.events);
@@ -2583,6 +2802,24 @@ void xe_eudebug_vm_bind_end(struct xe_vm *vm, bool has_ufence, int bind_err)
 		xe_eudebug_put(d);
 }
 
+int xe_eudebug_vm_bind_ufence(struct xe_user_fence *ufence)
+{
+	struct xe_eudebug *d;
+	int err;
+
+	d = ufence->eudebug.debugger;
+	if (!d || xe_eudebug_detached(d))
+		return -ENOTCONN;
+
+	err = vm_bind_ufence_event(d, ufence);
+	if (err) {
+		eu_err(d, "error %d on %s", err, __func__);
+		xe_eudebug_disconnect(d, err);
+	}
+
+	return err;
+}
+
 static int discover_client(struct xe_eudebug *d, struct xe_file *xef)
 {
 	struct xe_exec_queue *q;
@@ -2675,3 +2912,35 @@ static void discovery_work_fn(struct work_struct *work)
 
 	xe_eudebug_put(d);
 }
+
+void xe_eudebug_ufence_init(struct xe_user_fence *ufence,
+			    struct xe_file *xef,
+			    struct xe_vm *vm)
+{
+	u64 bind_ref;
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
+	if (!ufence->eudebug.debugger)
+		return;
+
+	xe_eudebug_put(ufence->eudebug.debugger);
+	ufence->eudebug.debugger = NULL;
+}
diff --git a/drivers/gpu/drm/xe/xe_eudebug.h b/drivers/gpu/drm/xe/xe_eudebug.h
index ccc7202b3308..ae720a1b05d9 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.h
+++ b/drivers/gpu/drm/xe/xe_eudebug.h
@@ -15,6 +15,7 @@ struct xe_vm;
 struct xe_vma;
 struct xe_exec_queue;
 struct xe_hw_engine;
+struct xe_user_fence;
 
 #if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
 
@@ -41,6 +42,13 @@ void xe_eudebug_vm_bind_start(struct xe_vm *vm);
 void xe_eudebug_vm_bind_op_add(struct xe_vm *vm, u32 op, u64 addr, u64 range);
 void xe_eudebug_vm_bind_end(struct xe_vm *vm, bool has_ufence, int err);
 
+int xe_eudebug_vm_bind_ufence(struct xe_user_fence *ufence);
+void xe_eudebug_ufence_init(struct xe_user_fence *ufence, struct xe_file *xef, struct xe_vm *vm);
+void xe_eudebug_ufence_fini(struct xe_user_fence *ufence);
+
+struct xe_eudebug *xe_eudebug_get(struct xe_file *xef);
+void xe_eudebug_put(struct xe_eudebug *d);
+
 #else
 
 static inline int xe_eudebug_connect_ioctl(struct drm_device *dev,
@@ -66,6 +74,13 @@ static inline void xe_eudebug_vm_bind_start(struct xe_vm *vm) { }
 static inline void xe_eudebug_vm_bind_op_add(struct xe_vm *vm, u32 op, u64 addr, u64 range) { }
 static inline void xe_eudebug_vm_bind_end(struct xe_vm *vm, bool has_ufence, int err) { }
 
+static inline int xe_eudebug_vm_bind_ufence(struct xe_user_fence *ufence) { return 0; }
+static inline void xe_eudebug_ufence_init(struct xe_user_fence *ufence, struct xe_file *xef, struct xe_vm *vm) { }
+static inline void xe_eudebug_ufence_fini(struct xe_user_fence *ufence) { }
+
+static inline struct xe_eudebug *xe_eudebug_get(struct xe_file *xef) { return NULL; }
+static inline void xe_eudebug_put(struct xe_eudebug *d) { }
+
 #endif /* CONFIG_DRM_XE_EUDEBUG */
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_eudebug_types.h b/drivers/gpu/drm/xe/xe_eudebug_types.h
index 78739954967b..aae7bc476c7e 100644
--- a/drivers/gpu/drm/xe/xe_eudebug_types.h
+++ b/drivers/gpu/drm/xe/xe_eudebug_types.h
@@ -150,6 +150,14 @@ struct xe_eudebug {
 		atomic_long_t seqno;
 	} events;
 
+	/* user fences tracked by this debugger */
+	struct {
+		/** @lock: guards access to tree */
+		spinlock_t lock;
+
+		struct rb_root tree;
+	} acks;
+
 	/** @ops operations for eu_control */
 	struct xe_eudebug_eu_control_ops *ops;
 };
@@ -287,4 +295,9 @@ struct xe_eudebug_event_vm_bind_op {
 	u64 range; /* Zero for unmap all ? */
 };
 
+struct xe_eudebug_event_vm_bind_ufence {
+	struct xe_eudebug_event base;
+	u64 vm_bind_ref_seqno;
+};
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 7b38485817dc..052edd41dc4e 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -160,7 +160,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	vm = q->vm;
 
 	for (num_syncs = 0; num_syncs < args->num_syncs; num_syncs++) {
-		err = xe_sync_entry_parse(xe, xef, &syncs[num_syncs],
+		err = xe_sync_entry_parse(xe, xef, vm, &syncs[num_syncs],
 					  &syncs_user[num_syncs], SYNC_PARSE_FLAG_EXEC |
 					  (xe_vm_in_lr_mode(vm) ?
 					   SYNC_PARSE_FLAG_LR_MODE : 0));
diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index bb3c2a830362..313437defc04 100644
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
@@ -58,7 +54,7 @@ static struct xe_user_fence *user_fence_create(struct xe_device *xe, u64 addr,
 	if (!access_ok(ptr, sizeof(*ptr)))
 		return ERR_PTR(-EFAULT);
 
-	ufence = kmalloc(sizeof(*ufence), GFP_KERNEL);
+	ufence = kzalloc(sizeof(*ufence), GFP_KERNEL);
 	if (!ufence)
 		return ERR_PTR(-ENOMEM);
 
@@ -69,12 +65,14 @@ static struct xe_user_fence *user_fence_create(struct xe_device *xe, u64 addr,
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
 
 	if (mmget_not_zero(ufence->mm)) {
 		kthread_use_mm(ufence->mm);
@@ -85,7 +83,20 @@ static void user_fence_worker(struct work_struct *w)
 	}
 
 	wake_up_all(&ufence->xe->ufence_wq);
+}
+
+static void user_fence_worker(struct work_struct *w)
+{
+	struct xe_user_fence *ufence = container_of(w, struct xe_user_fence, worker);
+	int ret;
+
 	WRITE_ONCE(ufence->signalled, 1);
+
+	/* Lets see if debugger wants to track this */
+	ret = xe_eudebug_vm_bind_ufence(ufence);
+	if (ret)
+		xe_sync_ufence_signal(ufence);
+
 	user_fence_put(ufence);
 }
 
@@ -104,6 +115,7 @@ static void user_fence_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
 }
 
 int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
+			struct xe_vm *vm,
 			struct xe_sync_entry *sync,
 			struct drm_xe_sync __user *sync_user,
 			unsigned int flags)
@@ -185,7 +197,8 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
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
index eb10085bb455..a836dfc5a86f 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3031,9 +3031,11 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
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
index 44cf1b699589..b2f6038ccc59 100644
--- a/include/uapi/drm/xe_drm_eudebug.h
+++ b/include/uapi/drm/xe_drm_eudebug.h
@@ -17,6 +17,7 @@ extern "C" {
  */
 #define DRM_XE_EUDEBUG_IOCTL_READ_EVENT		_IO('j', 0x0)
 #define DRM_XE_EUDEBUG_IOCTL_EU_CONTROL		_IOWR('j', 0x2, struct drm_xe_eudebug_eu_control)
+#define DRM_XE_EUDEBUG_IOCTL_ACK_EVENT		_IOW('j', 0x4, struct drm_xe_eudebug_ack_event)
 
 /* XXX: Document events to match their internal counterparts when moved to xe_drm.h */
 struct drm_xe_eudebug_event {
@@ -31,6 +32,7 @@ struct drm_xe_eudebug_event {
 #define DRM_XE_EUDEBUG_EVENT_EU_ATTENTION	5
 #define DRM_XE_EUDEBUG_EVENT_VM_BIND		6
 #define DRM_XE_EUDEBUG_EVENT_VM_BIND_OP		7
+#define DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE	8
 
 	__u16 flags;
 #define DRM_XE_EUDEBUG_EVENT_CREATE		(1 << 0)
@@ -157,6 +159,17 @@ struct drm_xe_eudebug_event_vm_bind_op {
 	__u64 range; /* XXX: Zero for unmap all? */
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
2.34.1

