Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDB22C77B7E
	for <intel-xe@archiver.kernel.org>; Tue,  2 May 2023 10:38:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 929C010E514;
	Tue,  2 May 2023 10:38:21 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1A5710E4FD
 for <intel-xe@lists.freedesktop.org>; Tue,  2 May 2023 10:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683023900; x=1714559900;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kXPXn4feMNQ4iVAj0XTjlCf7STZ4PdyNVw/sRtcGBOs=;
 b=kHMC6XtZfbwYshhXP0K73zaflVSw1uPuqBK0w3dEwSwOpBTMXXc2YPW0
 ZkPQE/tzkft4aUcYqmDCmvp2FSgE3AuWRJHPXbZBFEZ5D/JN0yrq8G5NV
 yoBA9IET6dWb7/8Cj4AQmll0euafVDINMDE6CwDtEQ2BpTD+KspHwO/X8
 cb0UH9V3WlDc8VDsHRuXS23wzdIydwcCXqyLJ73VOWn3Yxlq01Sd2CuIp
 RD0vO6aI+DJK3AgCnbJ44Wy0ILBsuZTeWOsJ6h4igANu8RjnpBXrkqhSC
 EYyv6+qeFh6j6NAXx09D0t2ZlUSVOtqgdoXyxrRPPk4oJPJ9GXkDqfom0 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="345843618"
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200"; d="scan'208";a="345843618"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2023 03:38:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="870506429"
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200"; d="scan'208";a="870506429"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2023 03:38:19 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  2 May 2023 13:35:50 +0300
Message-Id: <20230502103550.1601556-3-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502103550.1601556-1-mika.kuoppala@linux.intel.com>
References: <20230502103550.1601556-1-mika.kuoppala@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC 2/2] drm/xe/eudebug: Introduce discovery for
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
 drivers/gpu/drm/xe/xe_eudebug.c       | 108 +++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_eudebug_types.h |  10 +++
 2 files changed, 117 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index fef56d8889be..7a60aa00cbbd 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -163,6 +163,8 @@ static void xe_eudebug_free(struct kref *ref)
 	struct xe_eudebug *d = container_of(ref, typeof(*d), ref);
 	struct xe_eudebug_event *event;
 
+	destroy_workqueue(d->discovery_wq);
+
 	while (kfifo_get(&d->events.fifo, &event))
 		kfree(event);
 
@@ -217,6 +219,7 @@ static void xe_eudebug_disconnect(struct xe_eudebug *d,
 		eu_dbg(d, "disconnected: %d (%d)", d->last_error, err);
 	}
 
+	complete_all(&d->discovery);
 	wake_up_all(&d->events.write_done);
 
 	if (detached)
@@ -311,6 +314,14 @@ xe_eudebug_get(struct xe_file *xef)
 		put_task_struct(task);
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
@@ -657,6 +668,7 @@ static struct task_struct *find_get_target(const pid_t nr)
 	return task;
 }
 
+static void discovery_work_fn(struct work_struct *work);
 
 static int
 xe_eudebug_connect(struct xe_device *xe,
@@ -696,9 +708,11 @@ xe_eudebug_connect(struct xe_device *xe,
 	kref_init(&d->ref);
 	mutex_init(&d->lock);
 	init_waitqueue_head(&d->events.write_done);
+	init_completion(&d->discovery);
 
 	spin_lock_init(&d->events.lock);
 	INIT_KFIFO(d->events.fifo);
+	INIT_WORK(&d->discovery_work, discovery_work_fn);
 
 	d->res = xe_eudebug_resources_alloc();
 	if (!d->res) {
@@ -706,10 +720,16 @@ xe_eudebug_connect(struct xe_device *xe,
 		goto err_free;
 	}
 
+	d->discovery_wq = create_workqueue("xe_eudebug_discovery");
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
@@ -748,6 +768,8 @@ xe_eudebug_connect(struct xe_device *xe,
 
 	eu_dbg(d, "connected session %lld", d->session);
 
+	queue_work(d->discovery_wq, &d->discovery_work);
+
 	return fd;
 
 err_put_task:
@@ -755,6 +777,8 @@ xe_eudebug_connect(struct xe_device *xe,
 		xe_eudebug_put(t);
 
 	put_task_struct(d->target_task);
+err_free_wq:
+	destroy_workqueue(d->discovery_wq);
 err_free_res:
 	xe_eudebug_resources_free(d);
 err_free:
@@ -997,3 +1021,85 @@ void xe_eudebug_vm_destroy(struct xe_file *xef, struct xe_vm *vm)
 
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
+	task = find_task_get(xef->drm->pid);
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
index 1086944966cb..b8afb6c06399 100644
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

