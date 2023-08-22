Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 100D7EE49AE
	for <intel-xe@archiver.kernel.org>; Tue, 22 Aug 2023 17:33:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C668010E3B9;
	Tue, 22 Aug 2023 17:33:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2270D10E3BD
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Aug 2023 17:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692725627; x=1724261627;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=86NcJX+XFjcL2YICi8vKXUVGQxyaEqgL1QM92n0xLbg=;
 b=QiceTDNdA25LVW6ZhgV7qnd8CpYi8XhEgIfeysDFGh1XaLJVP9BP6WjK
 9WsKglH3APkQI19FO/+yL464UFrZ5F7tIpRQXiHNR9TLFQa73MjDdKtbL
 VzwyVDvGLjriKhmNBQmHinxv7gsxOa/PavKGGbhF5pzYzqOYcU9I/jrBj
 sPNw352JeMZ/g0Q3WqSWGsytPMdJn/rasmmlC2S3DJoISok83k1J+8eJB
 q5wYo4pj7l+hIwdGvxFQbE2NBkyJKSuvjYbWVZEI07Fm9m0rJO/uzK7TE
 ybzGj+lSq9grOROAKa0IFWC4Dqkslil8w9fWVn2iS6+3WjWEyJxqIgGre w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="376685282"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; d="scan'208";a="376685282"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2023 10:33:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="860009029"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; d="scan'208";a="860009029"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2023 10:33:46 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 22 Aug 2023 10:33:33 -0700
Message-ID: <20230822173334.1664332-3-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230822173334.1664332-1-daniele.ceraolospurio@intel.com>
References: <20230822173334.1664332-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 2/3] drm/xe: split kernel vs permanent engine
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
v3: rebased

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c       |  3 +++
 drivers/gpu/drm/xe/xe_exec_queue_types.h | 24 ++++++++++++++++--------
 drivers/gpu/drm/xe/xe_guc_submit.c       |  6 +++---
 drivers/gpu/drm/xe/xe_migrate.c          |  7 +++++--
 4 files changed, 27 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index ae5730b2175c..25216ef93781 100644
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
index 4614605d937f..c6a9e17d6889 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -965,7 +965,7 @@ static void guc_exec_queue_fini_async(struct xe_exec_queue *q)
 	INIT_WORK(&q->guc->fini_async, __guc_exec_queue_fini_async);
 
 	/* We must block on kernel engines so slabs are empty on driver unload */
-	if (q->flags & EXEC_QUEUE_FLAG_KERNEL)
+	if (q->flags & EXEC_QUEUE_FLAG_PERMANENT)
 		__guc_exec_queue_fini_async(&q->guc->fini_async);
 	else
 		queue_work(system_wq, &q->guc->fini_async);
@@ -988,7 +988,7 @@ static void __guc_exec_queue_process_msg_cleanup(struct drm_sched_msg *msg)
 	struct xe_exec_queue *q = msg->private_data;
 	struct xe_guc *guc = exec_queue_to_guc(q);
 
-	XE_WARN_ON(q->flags & EXEC_QUEUE_FLAG_KERNEL);
+	XE_WARN_ON(q->flags & EXEC_QUEUE_FLAG_PERMANENT);
 	trace_xe_exec_queue_cleanup_entity(q);
 
 	if (exec_queue_registered(q))
@@ -1206,7 +1206,7 @@ static void guc_exec_queue_fini(struct xe_exec_queue *q)
 {
 	struct drm_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_CLEANUP;
 
-	if (!(q->flags & EXEC_QUEUE_FLAG_KERNEL))
+	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT))
 		guc_exec_queue_add_msg(q, msg, CLEANUP);
 	else
 		__guc_exec_queue_fini(exec_queue_to_guc(q), q);
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 956a96b38346..37358be426f1 100644
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

