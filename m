Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94925C30659
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jun 2024 12:41:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DD3710E227;
	Thu, 27 Jun 2024 12:41:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="Uujpwns/";
	dkim-atps=neutral
Received: from mail02.habana.ai (habanamailrelay.habana.ai [213.57.90.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB83C10E029
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jun 2024 12:41:12 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1719492077; bh=FRCENVL8nL+SC2DY+LmZPRgLGp/JAzNc/9pk7wFyBSo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Uujpwns/RkhDqfXHjdoKqquPySwe1TejeGUkPQ9/WxYD0T1powNc9HYt59na7LNb4
 3ysAu++9KpI0jFHHCSReuY9aUAtvVWEY62r37RX4nL243peVmvvOICxH6zk5P4F5E3
 /yYx6dL4c8djzmIaj/vWBmcgPSek4h0jvObf40FKbkmVU+1SPhDYXQrjNTvkQuLifH
 hNOS12YTFK183iodZ6oKIVluXKg7vhYwdxCdMygaAKc0Eepc+LWQnWV+QTmCtQ0uLm
 Lg75MQ1sIsCsi2jTWeSO8KZYnYJgNDtBHjfwdKux/DmqJEWj6jqII9H6VXhuDiPwey
 Kn2g4+PhqqC8g==
Received: from dliberman-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by dliberman-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with
 ESMTPS id 45RCf0qc2923641
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 27 Jun 2024 15:41:00 +0300
Received: (from dliberman@localhost)
 by dliberman-vm-u22.habana-labs.com (8.15.2/8.15.2/Submit) id 45RCf0hb2923640; 
 Thu, 27 Jun 2024 15:41:00 +0300
From: Dani Liberman <dliberman@habana.ai>
To: intel-xe@lists.freedesktop.org
Cc: dliberman@habana.ai, illevi@habana.ai, rodrigo.vivi@intel.com
Subject: [PATCH v2 5/8] drm/xe: move the kernel lrc from hwe to execlist port
Date: Thu, 27 Jun 2024 15:40:40 +0300
Message-Id: <20240627124043.2923586-6-dliberman@habana.ai>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240627124043.2923586-1-dliberman@habana.ai>
References: <20240627124043.2923586-1-dliberman@habana.ai>
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

From: Ilia Levi <illevi@habana.ai>

The kernel lrc is used solely by the execlist infra.
We move it to the execlist port struct and initialize it only when
execlists are used.

Signed-off-by: Ilia Levi <illevi@habana.ai>
---
 drivers/gpu/drm/xe/xe_execlist.c        | 10 ++++++++--
 drivers/gpu/drm/xe/xe_execlist_types.h  |  2 ++
 drivers/gpu/drm/xe/xe_hw_engine.c       | 15 ++-------------
 drivers/gpu/drm/xe/xe_hw_engine_types.h |  2 --
 4 files changed, 12 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index db906117db6d..354f85b591b1 100644
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
index 78b50d3a6501..90660d9382a0 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -269,7 +269,6 @@ static void hw_engine_fini(struct drm_device *drm, void *arg)
 
 	if (hwe->exl_port)
 		xe_execlist_port_destroy(hwe->exl_port);
-	xe_lrc_put(hwe->kernel_lrc);
 
 	hwe->gt = NULL;
 }
@@ -528,21 +527,13 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
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
@@ -557,8 +548,6 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
 
 	return drmm_add_action_or_reset(&xe->drm, hw_engine_fini, hwe);
 
-err_kernel_lrc:
-	xe_lrc_put(hwe->kernel_lrc);
 err_hwsp:
 	xe_bo_unpin_map_no_vm(hwe->hwsp);
 err_name:
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
index 70e6434f150d..2b74dd1098a7 100644
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
2.34.1

