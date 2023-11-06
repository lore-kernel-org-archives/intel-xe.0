Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71D21C0018A
	for <intel-xe@archiver.kernel.org>; Mon,  6 Nov 2023 11:22:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0844C10E2D0;
	Mon,  6 Nov 2023 11:22:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4876210E2CE
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Nov 2023 11:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699269751; x=1730805751;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=i/6N1ydf7pXovKF0LYYyiEWPwsh4tx9n18wq2utmQqQ=;
 b=TcEAiueAgvvCz/H2657Q9ceWYe9gP7QLR1Z2mkrCYYa04kOhvZ2qXUoy
 Y64hSkprNQMkt526quC6cYkhISDrsjkzXKQ8fT7x2HQ7C6yvUG5N/48Kp
 bsgscza/BzTLaJhu2LgVU4Y0tOuTCKUzSLqMLo4pjED/g2CXSOEl9e5+Z
 SOdGPLZ2JV+/PzZVN0pTPs/Gbh+UEqwmc9+DgdiCT6BDwEMJ1z/XPjYs5
 Be9a6lO6txtLBR2ftbyHaIWhFZkOQ4kMRtOxstn5hWCQKAYPcnViZY77b
 4cdD07elxIzxB7lQ+BwilqbcSIgnaMZi4PXSCBl7KjMT4yOZJwRhXoMRp A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="379646765"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; d="scan'208";a="379646765"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 03:22:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="879411533"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; d="scan'208";a="879411533"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 03:22:15 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  6 Nov 2023 13:18:22 +0200
Message-Id: <20231106111845.2333093-3-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231106111845.2333093-1-mika.kuoppala@linux.intel.com>
References: <20231106111845.2333093-1-mika.kuoppala@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC 02/25] drm/xe/eudebug: Introduce discovery for
 resources
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

Debugger connection can happen way after the client has
created and destroyed arbitrary number of resources.

We need to playback all currently existing resources for the
debugger. The client is held until this so called discovery
process, executed by workqueue, is complete.

This patch is based on discovery work by Maciej Patelczyk
for i915 driver.

Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_eudebug.c       | 109 +++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_eudebug_types.h |  10 +++
 2 files changed, 118 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index 2f4b5f79d052..91d1a323e2ac 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -181,6 +181,8 @@ static void xe_eudebug_free(struct kref *ref)
 	struct xe_eudebug *d = container_of(ref, typeof(*d), ref);
 	struct xe_eudebug_event *event;
 
+	destroy_workqueue(d->discovery_wq);
+
 	while (kfifo_get(&d->events.fifo, &event))
 		kfree(event);
 
@@ -235,6 +237,7 @@ static void xe_eudebug_disconnect(struct xe_eudebug *d,
 		eu_dbg(d, "disconnected: %d (%d)", d->last_error, err);
 	}
 
+	complete_all(&d->discovery);
 	wake_up_all(&d->events.write_done);
 
 	if (detached)
@@ -331,6 +334,14 @@ xe_eudebug_get(struct xe_file *xef)
 		d = NULL;
 	}
 
+	if (d) {
+		int err;
+
+		err = wait_for_completion_interruptible(&d->discovery);
+		if (err)
+			xe_eudebug_disconnect(d, err);
+	}
+
 	if (d && xe_eudebug_detached(d)) {
 		xe_eudebug_put(d);
 		d = NULL;
@@ -682,6 +693,7 @@ static struct task_struct *find_get_target(const pid_t nr)
 	return task;
 }
 
+static void discovery_work_fn(struct work_struct *work);
 
 static int
 xe_eudebug_connect(struct xe_device *xe,
@@ -717,9 +729,11 @@ xe_eudebug_connect(struct xe_device *xe,
 	kref_init(&d->ref);
 	mutex_init(&d->lock);
 	init_waitqueue_head(&d->events.write_done);
+	init_completion(&d->discovery);
 
 	spin_lock_init(&d->events.lock);
 	INIT_KFIFO(d->events.fifo);
+	INIT_WORK(&d->discovery_work, discovery_work_fn);
 
 	d->res = xe_eudebug_resources_alloc();
 	if (IS_ERR(d->res)) {
@@ -727,10 +741,17 @@ xe_eudebug_connect(struct xe_device *xe,
 		goto err_free;
 	}
 
+	d->discovery_wq = alloc_workqueue("xe_eudebug_discovery",
+					  WQ_UNBOUND, 0);
+	if (!d->discovery_wq) {
+		err = -ENOMEM;
+		goto err_free_res;
+	}
+
 	d->target_task = find_get_target(param->pid);
 	if (!d->target_task) {
 		err = -ENOENT;
-		goto err_free_res;
+		goto err_free_wq;
 	}
 
 	/* XXX: Proper access tracking with ptrace_may_access */
@@ -769,6 +790,8 @@ xe_eudebug_connect(struct xe_device *xe,
 
 	eu_dbg(d, "connected session %lld", d->session);
 
+	queue_work(d->discovery_wq, &d->discovery_work);
+
 	return fd;
 
 err_put_task:
@@ -776,6 +799,8 @@ xe_eudebug_connect(struct xe_device *xe,
 		xe_eudebug_put(t);
 
 	put_task_struct(d->target_task);
+err_free_wq:
+	destroy_workqueue(d->discovery_wq);
 err_free_res:
 	xe_eudebug_resources_free(d);
 err_free:
@@ -1008,3 +1033,85 @@ void xe_eudebug_vm_destroy(struct xe_file *xef, struct xe_vm *vm)
 
 	xe_eudebug_put(d);
 }
+
+static int discover_client(struct xe_eudebug *d, struct xe_file *xef)
+{
+	struct xe_vm *vm;
+	unsigned long i;
+	int err;
+
+	err = client_create_event(d, xef);
+	if (err)
+		return err;
+
+	mutex_lock(&xef->vm.lock);
+	xa_for_each(&xef->vm.xa, i, vm) {
+		err = vm_create_event(d, xef, vm);
+		if (err)
+			break;
+	}
+	mutex_unlock(&xef->vm.lock);
+
+	return err;
+}
+
+static bool xe_eudebug_task_match(struct xe_eudebug *d, struct xe_file *xef)
+{
+	struct task_struct *task;
+	bool match;
+
+	task = find_task_get(xef);
+	if (!task)
+		return false;
+
+	match = same_thread_group(d->target_task, task);
+
+	put_task_struct(task);
+
+	return match;
+}
+
+static void discover_clients(struct xe_device *xe, struct xe_eudebug *d)
+{
+	unsigned long index = 0;
+	int err;
+
+	mutex_lock(&xe->clients.lock);
+
+	do {
+		struct xe_file *xef;
+
+		if (xe_eudebug_detached(d))
+			break;
+
+		err = 0;
+		xef = xa_find_after(&xe->clients.xa, &index, ULONG_MAX, XA_PRESENT);
+		if (!xef)
+			break;
+
+		if (xe_eudebug_task_match(d, xef)) {
+			err = discover_client(d, xef);
+			eu_dbg(d, "discover client %p: %d\n", xef, err);
+		}
+
+		if (err)
+			xe_eudebug_disconnect(d, err);
+	} while (!err);
+
+	mutex_unlock(&xe->clients.lock);
+}
+
+static void discovery_work_fn(struct work_struct *work)
+{
+	struct xe_eudebug *d = container_of(work, typeof(*d),
+					    discovery_work);
+	struct xe_device *xe = d->xe;
+
+	eu_dbg(d, "Discovery start\n");
+
+	discover_clients(xe, d);
+
+	eu_dbg(d, "Discovery end\n");
+
+	complete_all(&d->discovery);
+}
diff --git a/drivers/gpu/drm/xe/xe_eudebug_types.h b/drivers/gpu/drm/xe/xe_eudebug_types.h
index 9a6f62872ec3..a0ab551bc102 100644
--- a/drivers/gpu/drm/xe/xe_eudebug_types.h
+++ b/drivers/gpu/drm/xe/xe_eudebug_types.h
@@ -19,6 +19,7 @@
 struct xe_device;
 struct task_struct;
 struct xe_eudebug_event;
+struct workqueue_struct;
 
 #define CONFIG_DRM_XE_DEBUGGER_EVENT_QUEUE_SIZE 32
 
@@ -144,6 +145,15 @@ struct xe_eudebug {
 	/** @session: session number for this connection (for logs) */
 	u64 session;
 
+	/** @discovery: completion to wait for discovery */
+	struct completion discovery;
+
+	/** @discovery_work: worker to discover resources for target_task */
+	struct work_struct discovery_work;
+
+	/** @discovery_wq: workqueue for discovery worker */
+	struct workqueue_struct *discovery_wq;
+
 	/** @events: kfifo queue of to-be-delivered events */
 	struct {
 		/** @lock: guards access to fifo */
-- 
2.34.1

