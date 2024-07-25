Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EA11C3DA5D
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jul 2024 10:22:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4708D10E32D;
	Thu, 25 Jul 2024 10:22:52 +0000 (UTC)
Received: from mail02.habana.ai (habanamailrelay.habana.ai [213.57.90.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0477E10E1DF
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jul 2024 10:22:48 +0000 (UTC)
Received: internal info suppressed
Received: from illevi-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by illevi-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP
 id 46PAMDbc2182929; Thu, 25 Jul 2024 13:22:34 +0300
From: Ilia Levi <ilia.levi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ilia.levi@intel.com, dliberman@habana.ai,
 niranjana.vishwanathapura@intel.com, michal.wajdeczko@intel.com
Subject: [PATCH v4 07/11] drm/xe: move the kernel lrc from hwe to execlist port
Date: Thu, 25 Jul 2024 13:22:09 +0300
Message-ID: <20240725102213.2182896-8-ilia.levi@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240725102213.2182896-1-ilia.levi@intel.com>
References: <20240725102213.2182896-1-ilia.levi@intel.com>
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
We move it to the execlist port struct and initialize it only when
execlists are used.

Signed-off-by: Ilia Levi <ilia.levi@intel.com>
---
 drivers/gpu/drm/xe/xe_execlist.c        | 10 ++++++++--
 drivers/gpu/drm/xe/xe_execlist_types.h  |  2 ++
 drivers/gpu/drm/xe/xe_hw_engine.c       | 15 ++-------------
 drivers/gpu/drm/xe/xe_hw_engine_types.h |  2 --
 4 files changed, 12 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index 7502e3486eaf..447c290cb02b 100644
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
 
@@ -262,6 +262,10 @@ struct xe_execlist_port *xe_execlist_port_create(struct xe_device *xe,
 
 	port->hwe = hwe;
 
+	port->lrc = xe_lrc_create(hwe, NULL, SZ_16K);
+	if (IS_ERR(port->lrc))
+		return ERR_PTR(PTR_ERR(port->lrc));
+
 	spin_lock_init(&port->lock);
 	for (i = 0; i < ARRAY_SIZE(port->active); i++)
 		INIT_LIST_HEAD(&port->active[i]);
@@ -287,6 +291,8 @@ void xe_execlist_port_destroy(struct xe_execlist_port *port)
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
index 4d1715ad25a1..c432e77b2e9e 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -296,7 +296,6 @@ static void hw_engine_fini(struct drm_device *drm, void *arg)
 
 	if (hwe->exl_port)
 		xe_execlist_port_destroy(hwe->exl_port);
-	xe_lrc_put(hwe->kernel_lrc);
 
 	hwe->gt = NULL;
 }
@@ -556,21 +555,13 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
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
@@ -585,8 +576,6 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
 
 	return drmm_add_action_or_reset(&xe->drm, hw_engine_fini, hwe);
 
-err_kernel_lrc:
-	xe_lrc_put(hwe->kernel_lrc);
 err_hwsp:
 	xe_bo_unpin_map_no_vm(hwe->hwsp);
 err_name:
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
index f6cb425ebab0..437d41bc932b 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
@@ -138,8 +138,6 @@ struct xe_hw_engine {
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

