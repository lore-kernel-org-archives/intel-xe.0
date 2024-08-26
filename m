Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB83BC5321D
	for <intel-xe@archiver.kernel.org>; Mon, 26 Aug 2024 10:07:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74CC510E178;
	Mon, 26 Aug 2024 10:07:30 +0000 (UTC)
Received: from mail02.habana.ai (habanamailrelay02.habana.ai [62.90.112.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8CD410E178
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Aug 2024 10:07:28 +0000 (UTC)
Received: internal info suppressed
Received: from illevi-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by illevi-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP
 id 47QA7FYA1719075; Mon, 26 Aug 2024 13:07:15 +0300
From: Ilia Levi <ilia.levi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ilia.levi@intel.com, jonathan.cavitt@intel.com,
 niranjana.vishwanathapura@intel.com, matthew.brost@intel.com,
 koby.elbaz@intel.com, yaron.avizrat@intel.com
Subject: [PATCH v2] drm/xe: move the kernel lrc from hwe to execlist port
Date: Mon, 26 Aug 2024 13:06:55 +0300
Message-ID: <20240826100655.1719060-1-ilia.levi@intel.com>
X-Mailer: git-send-email 2.43.2
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

The kernel lrc is used solely by the execlist infra.
Move it to the execlist port struct and initialize it only when
execlists are used.

v2: Rebase, improve error handling readability (Jonathan)

Signed-off-by: Ilia Levi <ilia.levi@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_execlist.c        | 23 ++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_execlist_types.h  |  2 ++
 drivers/gpu/drm/xe/xe_hw_engine.c       | 15 ++-------------
 drivers/gpu/drm/xe/xe_hw_engine_types.h |  2 --
 4 files changed, 22 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index 7502e3486eaf..6a59165b9569 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -123,8 +123,8 @@ static void __xe_execlist_port_idle(struct xe_execlist_port *port)
 	if (!port->running_exl)
 		return;
 
-	xe_lrc_write_ring(port->hwe->kernel_lrc, noop, sizeof(noop));
-	__start_lrc(port->hwe, port->hwe->kernel_lrc, 0);
+	xe_lrc_write_ring(port->lrc, noop, sizeof(noop));
+	__start_lrc(port->hwe, port->lrc, 0);
 	port->running_exl = NULL;
 }
 
@@ -254,14 +254,22 @@ struct xe_execlist_port *xe_execlist_port_create(struct xe_device *xe,
 {
 	struct drm_device *drm = &xe->drm;
 	struct xe_execlist_port *port;
-	int i;
+	int i, err;
 
 	port = drmm_kzalloc(drm, sizeof(*port), GFP_KERNEL);
-	if (!port)
-		return ERR_PTR(-ENOMEM);
+	if (!port) {
+		err = -ENOMEM;
+		goto err;
+	}
 
 	port->hwe = hwe;
 
+	port->lrc = xe_lrc_create(hwe, NULL, SZ_16K);
+	if (IS_ERR(port->lrc)) {
+		err = PTR_ERR(port->lrc);
+		goto err;
+	}
+
 	spin_lock_init(&port->lock);
 	for (i = 0; i < ARRAY_SIZE(port->active); i++)
 		INIT_LIST_HEAD(&port->active[i]);
@@ -277,6 +285,9 @@ struct xe_execlist_port *xe_execlist_port_create(struct xe_device *xe,
 	add_timer(&port->irq_fail);
 
 	return port;
+
+err:
+	return ERR_PTR(err);
 }
 
 void xe_execlist_port_destroy(struct xe_execlist_port *port)
@@ -287,6 +298,8 @@ void xe_execlist_port_destroy(struct xe_execlist_port *port)
 	spin_lock_irq(&gt_to_xe(port->hwe->gt)->irq.lock);
 	port->hwe->irq_handler = NULL;
 	spin_unlock_irq(&gt_to_xe(port->hwe->gt)->irq.lock);
+
+	xe_lrc_put(port->lrc);
 }
 
 static struct dma_fence *
diff --git a/drivers/gpu/drm/xe/xe_execlist_types.h b/drivers/gpu/drm/xe/xe_execlist_types.h
index f94bbf4c53e4..415140936f11 100644
--- a/drivers/gpu/drm/xe/xe_execlist_types.h
+++ b/drivers/gpu/drm/xe/xe_execlist_types.h
@@ -27,6 +27,8 @@ struct xe_execlist_port {
 	struct xe_execlist_exec_queue *running_exl;
 
 	struct timer_list irq_fail;
+
+	struct xe_lrc *lrc;
 };
 
 struct xe_execlist_exec_queue {
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 18980238a2ea..a094bc71a563 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -273,7 +273,6 @@ static void hw_engine_fini(void *arg)
 
 	if (hwe->exl_port)
 		xe_execlist_port_destroy(hwe->exl_port);
-	xe_lrc_put(hwe->kernel_lrc);
 
 	hwe->gt = NULL;
 }
@@ -558,21 +557,13 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
 		goto err_name;
 	}
 
-	hwe->kernel_lrc = xe_lrc_create(hwe, NULL, SZ_16K);
-	if (IS_ERR(hwe->kernel_lrc)) {
-		err = PTR_ERR(hwe->kernel_lrc);
-		goto err_hwsp;
-	}
-
 	if (!xe_device_uc_enabled(xe)) {
 		hwe->exl_port = xe_execlist_port_create(xe, hwe);
 		if (IS_ERR(hwe->exl_port)) {
 			err = PTR_ERR(hwe->exl_port);
-			goto err_kernel_lrc;
+			goto err_hwsp;
 		}
-	}
-
-	if (xe_device_uc_enabled(xe)) {
+	} else {
 		/* GSCCS has a special interrupt for reset */
 		if (hwe->class == XE_ENGINE_CLASS_OTHER)
 			hwe->irq_handler = xe_gsc_hwe_irq_handler;
@@ -587,8 +578,6 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
 
 	return devm_add_action_or_reset(xe->drm.dev, hw_engine_fini, hwe);
 
-err_kernel_lrc:
-	xe_lrc_put(hwe->kernel_lrc);
 err_hwsp:
 	xe_bo_unpin_map_no_vm(hwe->hwsp);
 err_name:
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
index 39f24012d0f4..8be6d420ece4 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
@@ -136,8 +136,6 @@ struct xe_hw_engine {
 	enum xe_force_wake_domains domain;
 	/** @hwsp: hardware status page buffer object */
 	struct xe_bo *hwsp;
-	/** @kernel_lrc: Kernel LRC (should be replaced /w an xe_engine) */
-	struct xe_lrc *kernel_lrc;
 	/** @exl_port: execlists port */
 	struct xe_execlist_port *exl_port;
 	/** @fence_irq: fence IRQ to run when a hw engine IRQ is received */
-- 
2.43.2

