Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E310C04FDF
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jul 2023 19:00:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3934A10E5E7;
	Thu, 27 Jul 2023 19:00:15 +0000 (UTC)
Received: from mgamail.intel.com (unknown [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E06E10E5DE
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jul 2023 19:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690484411; x=1722020411;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=J3HWmQ+W9InpFHj0+rxRXy5diT4dDrnW0dhLP9nA5bA=;
 b=m4Y5/jWyeITrjFNxTl/7S2SbWzldON2IMBIxuHyQixcehVk26laYFOzY
 vGOventPEyHBnHVjIyOcuSW8ZiGVo0J9GI92F04kkLMACcerBIJWvJe+A
 fhA6+g0dr0PklBriUCMDKXQX0KBtJ6GoP0BdEDywcckiDWLMrFKbQ9o4g
 tNGY3IQnOQmiZ0zog0N9uj7a6hTV6mKsbDYX3AvDoYq5WcmmbjU1J0Qkj
 sgZ+vqcOzxw9rBcoYPT4GWV3ZDQTLsw8hqS1ZXpbT0JtiWrQdMcFGpnwR
 dpH77qSDT6osDI3xgDzeP8qvGlPJa63ydrtRPqEDT4ASuWtxJV1tiM6lv w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="348681582"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; d="scan'208";a="348681582"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 12:00:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="727127094"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; d="scan'208";a="727127094"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 12:00:10 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 27 Jul 2023 11:59:44 -0700
Message-ID: <20230727185945.401047-3-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230727185945.401047-1-daniele.ceraolospurio@intel.com>
References: <20230727185945.401047-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/3] drm/xe: split kernel vs permanent engine
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
to trigger the optimization.

While at it, add a small comment to explain what each engine flag
represents.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_engine.c       |  3 +++
 drivers/gpu/drm/xe/xe_engine_types.h | 20 ++++++++++++++------
 drivers/gpu/drm/xe/xe_guc_submit.c   | 12 ++++++------
 drivers/gpu/drm/xe/xe_migrate.c      |  4 ++--
 4 files changed, 25 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
index c30810a687b1..a08001f85e39 100644
--- a/drivers/gpu/drm/xe/xe_engine.c
+++ b/drivers/gpu/drm/xe/xe_engine.c
@@ -33,6 +33,9 @@ static struct xe_engine *__xe_engine_create(struct xe_device *xe,
 	int err;
 	int i;
 
+	/* only kernel engines can be permanent */
+	XE_BUG_ON((flags & ENGINE_FLAG_PERMANENT) && !(flags & ENGINE_FLAG_KERNEL));
+
 	e = kzalloc(sizeof(*e) + sizeof(struct xe_lrc) * width, GFP_KERNEL);
 	if (!e)
 		return ERR_PTR(-ENOMEM);
diff --git a/drivers/gpu/drm/xe/xe_engine_types.h b/drivers/gpu/drm/xe/xe_engine_types.h
index 7aa5d9ef7896..6802fdc10ec8 100644
--- a/drivers/gpu/drm/xe/xe_engine_types.h
+++ b/drivers/gpu/drm/xe/xe_engine_types.h
@@ -52,14 +52,22 @@ struct xe_engine {
 	/** @fence_irq: fence IRQ used to signal job completion */
 	struct xe_hw_fence_irq *fence_irq;
 
+/* engine no longer allowed to submit */
 #define ENGINE_FLAG_BANNED		BIT(0)
+/* engine used for kernel submission only */
 #define ENGINE_FLAG_KERNEL		BIT(1)
-#define ENGINE_FLAG_PERSISTENT		BIT(2)
-#define ENGINE_FLAG_COMPUTE_MODE	BIT(3)
-/* Caller needs to hold rpm ref when creating engine with ENGINE_FLAG_VM */
-#define ENGINE_FLAG_VM			BIT(4)
-#define ENGINE_FLAG_BIND_ENGINE_CHILD	BIT(5)
-#define ENGINE_FLAG_WA			BIT(6)
+/* kernel engine only destroyed at driver unload */
+#define ENGINE_FLAG_PERMANENT		BIT(2)
+/* engine keeps running pending jobs after destroy ioctl */
+#define ENGINE_FLAG_PERSISTENT		BIT(3)
+/* engine for use with compute VMs */
+#define ENGINE_FLAG_COMPUTE_MODE	BIT(4)
+/* for VM jobs. Caller needs to hold rpm ref when creating engine with this flag */
+#define ENGINE_FLAG_VM			BIT(5)
+/* child of VM engine for multi-tile VM jobs */
+#define ENGINE_FLAG_BIND_ENGINE_CHILD	BIT(6)
+/* engine used for WA setup */
+#define ENGINE_FLAG_WA			BIT(7)
 
 	/**
 	 * @flags: flags for this engine, should statically setup aside from ban
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index c5b265624344..6893a19e6676 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -943,7 +943,7 @@ static void __guc_engine_fini_async(struct work_struct *w)
 	drm_sched_entity_fini(&ge->entity);
 	drm_sched_fini(&ge->sched);
 
-	if (!(e->flags & ENGINE_FLAG_KERNEL)) {
+	if (!(e->flags & ENGINE_FLAG_PERMANENT)) {
 		kfree(ge);
 		xe_engine_fini(e);
 	}
@@ -951,13 +951,13 @@ static void __guc_engine_fini_async(struct work_struct *w)
 
 static void guc_engine_fini_async(struct xe_engine *e)
 {
-	bool kernel = e->flags & ENGINE_FLAG_KERNEL;
+	bool permanent = e->flags & ENGINE_FLAG_PERMANENT;
 
 	INIT_WORK(&e->guc->fini_async, __guc_engine_fini_async);
 	queue_work(system_wq, &e->guc->fini_async);
 
-	/* We must block on kernel engines so slabs are empty on driver unload */
-	if (kernel) {
+	/* We must block on permanent kernel engines so slabs are empty on driver unload */
+	if (permanent) {
 		struct xe_guc_engine *ge = e->guc;
 
 		flush_work(&ge->fini_async);
@@ -983,7 +983,7 @@ static void __guc_engine_process_msg_cleanup(struct drm_sched_msg *msg)
 	struct xe_engine *e = msg->private_data;
 	struct xe_guc *guc = engine_to_guc(e);
 
-	XE_BUG_ON(e->flags & ENGINE_FLAG_KERNEL);
+	XE_BUG_ON(e->flags & ENGINE_FLAG_PERMANENT);
 	trace_xe_engine_cleanup_entity(e);
 
 	if (engine_registered(e))
@@ -1218,7 +1218,7 @@ static void guc_engine_fini(struct xe_engine *e)
 {
 	struct drm_sched_msg *msg = e->guc->static_msgs + STATIC_MSG_CLEANUP;
 
-	if (!(e->flags & ENGINE_FLAG_KERNEL))
+	if (!(e->flags & ENGINE_FLAG_PERMANENT))
 		guc_engine_add_msg(e, msg, CLEANUP);
 	else
 		__guc_engine_fini(engine_to_guc(e), e);
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index aad76a6a8094..efaf35cd8963 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -343,11 +343,11 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
 
 		m->eng = xe_engine_create(xe, vm,
 					  BIT(hwe->logical_instance), 1,
-					  hwe, ENGINE_FLAG_KERNEL);
+					  hwe, ENGINE_FLAG_KERNEL | ENGINE_FLAG_PERMANENT);
 	} else {
 		m->eng = xe_engine_create_class(xe, primary_gt, vm,
 						XE_ENGINE_CLASS_COPY,
-						ENGINE_FLAG_KERNEL);
+						ENGINE_FLAG_KERNEL | ENGINE_FLAG_PERMANENT);
 	}
 	if (IS_ERR(m->eng)) {
 		xe_vm_close_and_put(vm);
-- 
2.41.0

