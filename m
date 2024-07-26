Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C946EC52D1D
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jul 2024 14:17:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F27110E9AA;
	Fri, 26 Jul 2024 14:17:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UJFtfKCy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A63110E9A4
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jul 2024 14:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722003451; x=1753539451;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XJkCP4ihW//LxVT6sfJT7kSuf+FprSlU48gBCsuM+54=;
 b=UJFtfKCyBOxilwn/swh03jEBM6Af3MdR3fcaTBCdHOCq/Im5KsIUpDqC
 sQCLnJA8UOcQfVTTRw3Z6wDMjgnYDi48ovpLK4mDMcqnNU1DhjjEFkxfu
 bgFOqErwRVir4/YSBjCtI1448hkYTN/kqI0NkhYDXeOZLqKkV2U8Lxxw/
 sch6Yp9945IXMAbkMSmSIJl4vBOoPeYWQ7bPkppnUYBZgnFWe4TQjjyjZ
 NXljpSrzFLLWyhnvO7mg9JQIMTkOj1ap51gc1bLO+XbMqqCkiJjWQAdg5
 BkY2zxoYLRuTnKYNWemduLbKhZWrjGUFaM+4Pwhkm6Zlr9aMuzCUIi+mE Q==;
X-CSE-ConnectionGUID: 9qftc8zvQ7ytQfIgK1YYdQ==
X-CSE-MsgGUID: nBo084wFRZ+YyNM7kNunHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="23598751"
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="23598751"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 07:17:24 -0700
X-CSE-ConnectionGUID: lDYMMxFlQt2BVQ8zZS6XJg==
X-CSE-MsgGUID: qGqF0i1NQsSeaEJuR11mLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="57861370"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 07:17:23 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>
Subject: [PATCH 06/21] drm/xe/eudebug: Introduce discovery for resources
Date: Fri, 26 Jul 2024 17:08:03 +0300
Message-Id: <20240726140818.54304-7-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240726140818.54304-1-mika.kuoppala@linux.intel.com>
References: <20240726140818.54304-1-mika.kuoppala@linux.intel.com>
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

Debugger connection can happen way after the client has
created and destroyed arbitrary number of resources.

We need to playback all currently existing resources for the
debugger. The client is held until this so called discovery
process, executed by workqueue, is complete.

This patch is based on discovery work by Maciej Patelczyk
for i915 driver.

Co-developed-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_device.c        |  6 +-
 drivers/gpu/drm/xe/xe_device_types.h  |  3 +
 drivers/gpu/drm/xe/xe_eudebug.c       | 91 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_eudebug_types.h |  7 +++
 4 files changed, 106 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 6c5eceaca4ab..90bb0a8b1881 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -312,6 +312,9 @@ static void xe_device_destroy(struct drm_device *dev, void *dummy)
 	if (xe->unordered_wq)
 		destroy_workqueue(xe->unordered_wq);
 
+	if (xe->eudebug.ordered_wq)
+		destroy_workqueue(xe->eudebug.ordered_wq);
+
 	ttm_device_fini(&xe->ttm);
 }
 
@@ -382,8 +385,9 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 	xe->preempt_fence_wq = alloc_ordered_workqueue("xe-preempt-fence-wq", 0);
 
 	xe->ordered_wq = alloc_ordered_workqueue("xe-ordered-wq", 0);
+	xe->eudebug.ordered_wq = alloc_ordered_workqueue("xe-eudebug-ordered-wq", 0);
 	xe->unordered_wq = alloc_workqueue("xe-unordered-wq", 0, 0);
-	if (!xe->ordered_wq || !xe->unordered_wq ||
+	if (!xe->ordered_wq || !xe->unordered_wq || !xe->eudebug.ordered_wq ||
 	    !xe->preempt_fence_wq) {
 		/*
 		 * Cleanup done in xe_device_destroy via
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index bef7c11bd668..4dcfd39cb909 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -513,6 +513,9 @@ struct xe_device {
 
 		/** @available: is the debugging functionality available */
 		bool available;
+
+		/** @ordered_wq: used to discovery */
+		struct workqueue_struct *ordered_wq;
 	} eudebug;
 
 	/* private: */
diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index c4bc66660218..d3051bbe9ec8 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -427,6 +427,12 @@ xe_eudebug_get(struct xe_file *xef)
 	if (!d)
 		return NULL;
 
+	if (!xe_eudebug_detached(d) &&
+	    !completion_done(&d->discovery) &&
+	    wait_for_completion_killable_timeout(&d->discovery,
+						 HZ * 40) <= 0)
+		xe_eudebug_disconnect(d, -ETIMEDOUT);
+
 	if (xe_eudebug_detached(d)) {
 		xe_eudebug_put(d);
 		return NULL;
@@ -830,6 +836,8 @@ static const struct file_operations fops = {
 	.unlocked_ioctl	= xe_eudebug_ioctl,
 };
 
+static void discovery_work_fn(struct work_struct *work);
+
 static int
 xe_eudebug_connect(struct xe_device *xe,
 		   struct drm_xe_eudebug_connect *param)
@@ -864,9 +872,11 @@ xe_eudebug_connect(struct xe_device *xe,
 	spin_lock_init(&d->connection.lock);
 	init_waitqueue_head(&d->events.write_done);
 	init_waitqueue_head(&d->events.read_done);
+	init_completion(&d->discovery);
 
 	spin_lock_init(&d->events.lock);
 	INIT_KFIFO(d->events.fifo);
+	INIT_WORK(&d->discovery_work, discovery_work_fn);
 
 	d->res = xe_eudebug_resources_alloc();
 	if (IS_ERR(d->res)) {
@@ -884,6 +894,9 @@ xe_eudebug_connect(struct xe_device *xe,
 		goto err_detach;
 	}
 
+	kref_get(&d->ref);
+	queue_work(xe->eudebug.ordered_wq, &d->discovery_work);
+
 	eu_dbg(d, "connected session %lld", d->session);
 
 	return fd;
@@ -1090,3 +1103,81 @@ void xe_eudebug_vm_destroy(struct xe_file *xef, struct xe_vm *vm)
 
 	xe_eudebug_event_put(d, vm_destroy_event(d, xef, vm));
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
+	struct xe_file *xef, *tmp;
+	int err;
+
+	mutex_lock(&xe->files.lock);
+	list_for_each_entry_safe(xef, tmp, &xe->files.list, link) {
+		if (xe_eudebug_detached(d))
+			break;
+
+		if (xe_eudebug_task_match(d, xef))
+			err = discover_client(d, xef);
+		else
+			err = 0;
+
+		if (err) {
+			eu_dbg(d, "discover client %p: %d\n", xef, err);
+			xe_eudebug_disconnect(d, err);
+			break;
+		}
+	}
+	mutex_unlock(&xe->files.lock);
+}
+
+static void discovery_work_fn(struct work_struct *work)
+{
+	struct xe_eudebug *d = container_of(work, typeof(*d),
+					    discovery_work);
+	struct xe_device *xe = d->xe;
+
+	eu_dbg(d, "Discovery start for %lld\n", d->session);
+
+	discover_clients(xe, d);
+
+	eu_dbg(d, "Discovery end for %lld\n", d->session);
+
+	complete_all(&d->discovery);
+
+	xe_eudebug_put(d);
+}
diff --git a/drivers/gpu/drm/xe/xe_eudebug_types.h b/drivers/gpu/drm/xe/xe_eudebug_types.h
index 093221a707df..202ddf41a325 100644
--- a/drivers/gpu/drm/xe/xe_eudebug_types.h
+++ b/drivers/gpu/drm/xe/xe_eudebug_types.h
@@ -19,6 +19,7 @@
 struct xe_device;
 struct task_struct;
 struct xe_eudebug_event;
+struct workqueue_struct;
 
 #define CONFIG_DRM_XE_DEBUGGER_EVENT_QUEUE_SIZE 64
 
@@ -96,6 +97,12 @@ struct xe_eudebug {
 	/** @session: session number for this connection (for logs) */
 	u64 session;
 
+	/** @discovery: completion to wait for discovery */
+	struct completion discovery;
+
+	/** @discovery_work: worker to discover resources for target_task */
+	struct work_struct discovery_work;
+
 	/** @events: kfifo queue of to-be-delivered events */
 	struct {
 		/** @lock: guards access to fifo */
-- 
2.34.1

