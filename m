Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25BCCC04E69
	for <intel-xe@archiver.kernel.org>; Mon,  7 Aug 2023 23:40:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F38B910E074;
	Mon,  7 Aug 2023 23:40:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A42A10E06E
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Aug 2023 23:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691451629; x=1722987629;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lmL5jyufhZ1YR15Kx0gWshhlyhT8uiS89k/kQW4XPlI=;
 b=hHIotCPQtbtsFDzaxtR/Cs2gxU3GvGGAp0INkY1SePGBy8I12VpHUIfX
 wTNiqlQGFbOyz/T1mmgNSFl4zuqoAmXvI7X2zfLl56hUS/4wZuMxAypDT
 jEmkc1m9R0Tbu+7yZZY9tLtb79OimyT21ONeC/1ukL9kvHe7vg6c9cAc1
 WDqiAtOAU9zUEpsHV2tOOfc++F5dkyaIBFC51eCjGZUN7I7ZBUfjgpD9E
 C60U2ZwQehIaa7uU6IYzS7I2fUtk2lGUWRSkvzR2nK2ar+8CMBSbRLdrK
 IQZY0ijsgMgr9sNrce3cZo4TahDsFKlyhn4uvD7uQz6sgPaT/cW7GR+Ev Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="401637470"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; d="scan'208";a="401637470"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 16:40:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="680998744"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; d="scan'208";a="680998744"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 16:40:28 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  7 Aug 2023 16:40:13 -0700
Message-ID: <20230807234014.960795-3-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230807234014.960795-1-daniele.ceraolospurio@intel.com>
References: <20230807234014.960795-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 2/3] drm/xe: split kernel vs permanent engine
 flags
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

If an engine is only destroyed on driver unload, we can skip its
clean-up steps with the GuC because the GuC is going to be tuned off as
well, so it doesn't matter if we're in sync with it or not. Currently,
we apply this optimization to all engines marked as kernel, but this
stops us to supporting kernel engines that don't stick around until
unload. To remove this limitation, add a separate flag to indicate if
the engine is expected to only be destryed on driver unload and use that
to trigger the optimzation.

While at it, add a small comment to explain what each engine flag
represents.

v2: s/XE_BUG_ON/XE_WARN_ON, s/ENGINE/EXEC_QUEUE

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c       |  3 +++
 drivers/gpu/drm/xe/xe_exec_queue_types.h | 24 ++++++++++++++++--------
 drivers/gpu/drm/xe/xe_guc_submit.c       | 13 +++++++------
 drivers/gpu/drm/xe/xe_migrate.c          |  7 +++++--
 4 files changed, 31 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 382a572746ad..a01777451a5d 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -41,6 +41,9 @@ static struct xe_exec_queue *__xe_exec_queue_create(struct xe_device *xe,
 	int err;
 	int i;
 
+	/* only kernel queues can be permanent */
+	XE_WARN_ON((flags & EXEC_QUEUE_FLAG_PERMANENT) && !(flags & EXEC_QUEUE_FLAG_KERNEL));
+
 	q = kzalloc(sizeof(*q) + sizeof(struct xe_lrc) * width, GFP_KERNEL);
 	if (!q)
 		return ERR_PTR(-ENOMEM);
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index e3ae11b63e4a..75a180b7192c 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -52,14 +52,22 @@ struct xe_exec_queue {
 	/** @fence_irq: fence IRQ used to signal job completion */
 	struct xe_hw_fence_irq *fence_irq;
 
-#define EXEC_QUEUE_FLAG_BANNED		BIT(0)
-#define EXEC_QUEUE_FLAG_KERNEL		BIT(1)
-#define EXEC_QUEUE_FLAG_PERSISTENT		BIT(2)
-#define EXEC_QUEUE_FLAG_COMPUTE_MODE	BIT(3)
-/* Caller needs to hold rpm ref when creating engine with EXEC_QUEUE_FLAG_VM */
-#define EXEC_QUEUE_FLAG_VM			BIT(4)
-#define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD	BIT(5)
-#define EXEC_QUEUE_FLAG_WA			BIT(6)
+/* queue no longer allowed to submit */
+#define EXEC_QUEUE_FLAG_BANNED			BIT(0)
+/* queue used for kernel submission only */
+#define EXEC_QUEUE_FLAG_KERNEL			BIT(1)
+/* kernel engine only destroyed at driver unload */
+#define EXEC_QUEUE_FLAG_PERMANENT		BIT(2)
+/* queue keeps running pending jobs after destroy ioctl */
+#define EXEC_QUEUE_FLAG_PERSISTENT		BIT(3)
+/* queue for use with compute VMs */
+#define EXEC_QUEUE_FLAG_COMPUTE_MODE		BIT(4)
+/* for VM jobs. Caller needs to hold rpm ref when creating queue with this flag */
+#define EXEC_QUEUE_FLAG_VM			BIT(5)
+/* child of VM queue for multi-tile VM jobs */
+#define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD	BIT(6)
+/* queue used for WA setup */
+#define EXEC_QUEUE_FLAG_WA			BIT(7)
 
 	/**
 	 * @flags: flags for this exec queue, should statically setup aside from ban
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 7e57e414edf6..c3c4cfeac834 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -954,7 +954,7 @@ static void __guc_exec_queue_fini_async(struct work_struct *w)
 	drm_sched_entity_fini(&ge->entity);
 	drm_sched_fini(&ge->sched);
 
-	if (!(q->flags & EXEC_QUEUE_FLAG_KERNEL)) {
+	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT)) {
 		kfree(ge);
 		xe_exec_queue_fini(q);
 	}
@@ -962,13 +962,14 @@ static void __guc_exec_queue_fini_async(struct work_struct *w)
 
 static void guc_exec_queue_fini_async(struct xe_exec_queue *q)
 {
-	bool kernel = q->flags & EXEC_QUEUE_FLAG_KERNEL;
+	bool permanent = q->flags & EXEC_QUEUE_FLAG_PERMANENT;
 
 	INIT_WORK(&q->guc->fini_async, __guc_exec_queue_fini_async);
 	queue_work(system_wq, &q->guc->fini_async);
 
-	/* We must block on kernel engines so slabs are empty on driver unload */
-	if (kernel) {
+
+	/* We must block on permanent kernel queues so slabs are empty on driver unload */
+	if (permanent) {
 		struct xe_guc_exec_queue *ge = q->guc;
 
 		flush_work(&ge->fini_async);
@@ -994,7 +995,7 @@ static void __guc_exec_queue_process_msg_cleanup(struct drm_sched_msg *msg)
 	struct xe_exec_queue *q = msg->private_data;
 	struct xe_guc *guc = exec_queue_to_guc(q);
 
-	XE_WARN_ON(q->flags & EXEC_QUEUE_FLAG_KERNEL);
+	XE_WARN_ON(q->flags & EXEC_QUEUE_FLAG_PERMANENT);
 	trace_xe_exec_queue_cleanup_entity(q);
 
 	if (exec_queue_registered(q))
@@ -1230,7 +1231,7 @@ static void guc_exec_queue_fini(struct xe_exec_queue *q)
 {
 	struct drm_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_CLEANUP;
 
-	if (!(q->flags & EXEC_QUEUE_FLAG_KERNEL))
+	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT))
 		guc_exec_queue_add_msg(q, msg, CLEANUP);
 	else
 		__guc_exec_queue_fini(exec_queue_to_guc(q), q);
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 18c94022930f..1504e9b9c515 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -343,11 +343,14 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
 
 		m->q = xe_exec_queue_create(xe, vm,
 					    BIT(hwe->logical_instance), 1,
-					    hwe, EXEC_QUEUE_FLAG_KERNEL);
+					    hwe,
+					    EXEC_QUEUE_FLAG_KERNEL |
+					    EXEC_QUEUE_FLAG_PERMANENT);
 	} else {
 		m->q = xe_exec_queue_create_class(xe, primary_gt, vm,
 						  XE_ENGINE_CLASS_COPY,
-						  EXEC_QUEUE_FLAG_KERNEL);
+						  EXEC_QUEUE_FLAG_KERNEL |
+						  EXEC_QUEUE_FLAG_PERMANENT);
 	}
 	if (IS_ERR(m->q)) {
 		xe_vm_close_and_put(vm);
-- 
2.41.0

