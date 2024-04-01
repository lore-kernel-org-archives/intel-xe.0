Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1BB6CD1288
	for <intel-xe@archiver.kernel.org>; Mon,  1 Apr 2024 22:18:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69E4B10EBC3;
	Mon,  1 Apr 2024 22:18:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dX6LvTOe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB71D10F604
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Apr 2024 22:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712009933; x=1743545933;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hQqz7QcGsg/EJVXTbTT2wgc57rOjBOxaH/FOSeR2Lxc=;
 b=dX6LvTOehrdS2HEjOys63g+w4zjqJJ+0/S3sTQE+DDN0QpoIqMUzcvkg
 39B4KtmfAIU2FjIIJ+8AkoCCTF8x8odSJx1ylmXYjhXCK9vJdd8ys2xac
 N3TvYwID95Gz+r3EVlSdW07PKicKgxzo5EtEj+dY1PwogKH4ZiJ7QYCCI
 XL1UF8Iloiz96M963/fraKcdYtcGfbnlZgn45+9PfvVd+Z5YJLFpwrVaV
 Hs6uf5+sn2G4fntkaVzCYxPXIdpJ/WDdgOOZ4lpaWjvTZykO9Omy76e4F
 HIe76jGNimdUR2i4+rIlNA+GbWTaZFllAzNuuRYcw228dxlYV9lcg4sWO Q==;
X-CSE-ConnectionGUID: NM8MZ+c0Rh+azh3gRaR61Q==
X-CSE-MsgGUID: Opsz8rpiRR6MbTNDOUQ28w==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="7022994"
X-IronPort-AV: E=Sophos;i="6.07,173,1708416000"; 
   d="scan'208";a="7022994"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2024 15:18:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,173,1708416000"; d="scan'208";a="17805019"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2024 15:18:52 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: lucas.demarchi@intel.com,
	Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 1/3] drm/xe: Use ordered wq for preempt fence waiting
Date: Mon,  1 Apr 2024 15:19:11 -0700
Message-Id: <20240401221913.139672-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240401221913.139672-1-matthew.brost@intel.com>
References: <20240401221913.139672-1-matthew.brost@intel.com>
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

Preempt fences can sleep waiting for an exec queue suspend operation to
complete. If the system_unbound_wq is used for waiting and the number of
waiters exceeds max_active this will result in other users of the
system_unbound_wq getting starved. Use a device private work queue for
preempt fences to avoid starvation of the system_unbound_wq.

Even though suspend operations can complete out-of-order, all suspend
operations within a VM need to complete before the preempt rebind worker
can start. With that, use a device private ordered wq for preempt fence
waiting.

v2:
 - Add comment about cleanup on failure (Matt R)
 - Update commit message (Lucas)

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c        | 11 ++++++++++-
 drivers/gpu/drm/xe/xe_device_types.h  |  3 +++
 drivers/gpu/drm/xe/xe_preempt_fence.c |  2 +-
 3 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 01bd5ccf05ca..9083f5e02dd9 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -226,6 +226,9 @@ static void xe_device_destroy(struct drm_device *dev, void *dummy)
 {
 	struct xe_device *xe = to_xe_device(dev);
 
+	if (xe->preempt_fence_wq)
+		destroy_workqueue(xe->preempt_fence_wq);
+
 	if (xe->ordered_wq)
 		destroy_workqueue(xe->ordered_wq);
 
@@ -291,9 +294,15 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 	INIT_LIST_HEAD(&xe->pinned.external_vram);
 	INIT_LIST_HEAD(&xe->pinned.evicted);
 
+	xe->preempt_fence_wq = alloc_ordered_workqueue("xe-preempt-fence-wq", 0);
 	xe->ordered_wq = alloc_ordered_workqueue("xe-ordered-wq", 0);
 	xe->unordered_wq = alloc_workqueue("xe-unordered-wq", 0, 0);
-	if (!xe->ordered_wq || !xe->unordered_wq) {
+	if (!xe->ordered_wq || !xe->unordered_wq ||
+	    !xe->preempt_fence_wq) {
+		/*
+		 * Cleanup done in xe_device_destroy via
+		 * drmm_add_action_or_reset register above
+		 */
 		drm_err(&xe->drm, "Failed to allocate xe workqueues\n");
 		err = -ENOMEM;
 		goto err;
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 1df3dcc17d75..c710cec835a7 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -363,6 +363,9 @@ struct xe_device {
 	/** @ufence_wq: user fence wait queue */
 	wait_queue_head_t ufence_wq;
 
+	/** @preempt_fence_wq: used to serialize preempt fences */
+	struct workqueue_struct *preempt_fence_wq;
+
 	/** @ordered_wq: used to serialize compute mode resume */
 	struct workqueue_struct *ordered_wq;
 
diff --git a/drivers/gpu/drm/xe/xe_preempt_fence.c b/drivers/gpu/drm/xe/xe_preempt_fence.c
index 7bce2a332603..7d50c6e89d8e 100644
--- a/drivers/gpu/drm/xe/xe_preempt_fence.c
+++ b/drivers/gpu/drm/xe/xe_preempt_fence.c
@@ -49,7 +49,7 @@ static bool preempt_fence_enable_signaling(struct dma_fence *fence)
 	struct xe_exec_queue *q = pfence->q;
 
 	pfence->error = q->ops->suspend(q);
-	queue_work(system_unbound_wq, &pfence->preempt_work);
+	queue_work(q->vm->xe->preempt_fence_wq, &pfence->preempt_work);
 	return true;
 }
 
-- 
2.34.1

