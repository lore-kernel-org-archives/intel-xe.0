Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EECC9C77B6E
	for <intel-xe@archiver.kernel.org>; Thu, 13 Apr 2023 14:30:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2B1510E36A;
	Thu, 13 Apr 2023 14:30:02 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C9BF10EACF
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Apr 2023 14:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681396200; x=1712932200;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AayAb6vspRxA14OunVFLW4Fm4ji5Syu61/CcgRWqh7I=;
 b=mhjbTaN9MJrV3Pnl2q1kzZfCNLKsIVvaMyiJU2QSAbHARpwfOQwi3oFm
 gmWZZ3MU24Am4dZZu6ubrHTWa6CbVuEH91VLM1EHUyB5b4+2doqSDvaZz
 2zQe1F+DusYoTPjfLbcb/mBVV2Egg+tjrW//XkU6k34OkrxX4BhvHwV1x
 pgbzrD2ZZEO8lielsbJmuuyXrumzLTMh46F5Wl3mXHJjl41TuEzMFGYeK
 ogfXFt/yMho0T394wLrgfUCRg3vyCVaVUCjjgwumgpxsRmaOjI7xuAoaj
 uZrWvGKHpnnMN1NIwk+tmgLms8LaimSsNzhSrtpcxE9/kMOx0D9c3fILF w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="342941807"
X-IronPort-AV: E=Sophos;i="5.99,193,1677571200"; d="scan'208";a="342941807"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2023 07:30:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="689370421"
X-IronPort-AV: E=Sophos;i="5.99,193,1677571200"; d="scan'208";a="689370421"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2023 07:29:58 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 13 Apr 2023 17:27:49 +0300
Message-Id: <20230413142749.1097229-4-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230413142749.1097229-1-mika.kuoppala@linux.intel.com>
References: <20230413142749.1097229-1-mika.kuoppala@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC 3/3] drm/xe/eudebug: Introduce discovery for
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
index 72e1962b1731..4d7818ebfb52 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -283,6 +283,8 @@ static void xe_eudebug_free(struct kref *ref)
 {
 	struct xe_eudebug *d = container_of(ref, typeof(*d), ref);
 
+	destroy_workqueue(d->discovery_wq);
+
 	event_fifo_drain(d);
 
 	xe_eudebug_resources_free(d);
@@ -336,6 +338,7 @@ static void xe_eudebug_disconnect(struct xe_eudebug *d,
 		eu_dbg(d, "disconnected: %d (%d)", d->last_error, err);
 	}
 
+	complete_all(&d->discovery);
 	wake_up_all(&d->events.write_done);
 
 	if (detached)
@@ -430,6 +433,14 @@ xe_eudebug_get(struct xe_file *xef)
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
@@ -778,6 +789,7 @@ static struct task_struct *find_get_target(const pid_t nr)
 	return task;
 }
 
+static void discovery_work_fn(struct work_struct *work);
 
 static int
 xe_eudebug_connect(struct xe_device *xe,
@@ -818,9 +830,11 @@ xe_eudebug_connect(struct xe_device *xe,
 	kref_init(&d->ref);
 	mutex_init(&d->lock);
 	init_waitqueue_head(&d->events.write_done);
+	init_completion(&d->discovery);
 
 	spin_lock_init(&d->events.lock);
 	INIT_KFIFO(d->events.fifo);
+	INIT_WORK(&d->discovery_work, discovery_work_fn);
 
 	d->res = xe_eudebug_resources_alloc();
 	if (!d->res) {
@@ -828,10 +842,16 @@ xe_eudebug_connect(struct xe_device *xe,
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
 
 	allowed = ptrace_may_access(d->target_task,
@@ -871,6 +891,8 @@ xe_eudebug_connect(struct xe_device *xe,
 
 	eu_dbg(d, "connected session %lld", d->session);
 
+	queue_work(d->discovery_wq, &d->discovery_work);
+
 	return fd;
 
 err_put_task:
@@ -878,6 +900,8 @@ xe_eudebug_connect(struct xe_device *xe,
 		xe_eudebug_put(t);
 
 	put_task_struct(d->target_task);
+err_free_wq:
+	destroy_workqueue(d->discovery_wq);
 err_free_res:
 	xe_eudebug_resources_free(d);
 err_free:
@@ -1120,3 +1144,85 @@ void xe_eudebug_vm_destroy(struct xe_file *xef, struct xe_vm *vm)
 
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
index 45dcb82a4cf0..c315fb5bb81a 100644
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

