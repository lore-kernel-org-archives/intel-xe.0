Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23959CD11DD
	for <intel-xe@archiver.kernel.org>; Thu, 28 Mar 2024 18:21:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1D4311253B;
	Thu, 28 Mar 2024 18:21:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pm6NvucM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B01911253B
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Mar 2024 18:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711650089; x=1743186089;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jz808Q9cXVWgP96mOGGCoMt48bQPyhYDIGEZxdi8FTw=;
 b=Pm6NvucMpHuyhHbFwuY/euA5MmEAIHdXlitTUbbmhSp5rI7WVz/yK3Y9
 OLsZE0g4zdMT6IbxkQqXwoWQTZYCdwm9rOg1MZNcGWBOzN7BdLnhFAjql
 ziOC5Se4UUuK2/zXiHXGl8SKayTHONf7K3MH+t7ysMX3ROwsSofnQNe2E
 /aEMpAq41YwtMjwANIzX5HupzseKUXIDhU9imL1hGJdKAPJG2Y2sH+nDW
 hckCNam+Kjw1lbKZbN5luhY7CZSjM5tD9HjfQILg0d3kNanU8Rs1NKKIy
 EQOrfMNGiFl+ZzY14OzMQ+khFLA1W8o2tilnTrn6hyTvGs3X0021GWx9b g==;
X-CSE-ConnectionGUID: VbTiB2h9RWu6czSPE3epDg==
X-CSE-MsgGUID: WDvYspXPRGOHLalB1NOQbg==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="29307491"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="29307491"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 11:21:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="16784209"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 11:21:27 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: <thomas.hellstrom@linux.intel.com>, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 1/3] drm/xe: Use ordered wq for preempt fence waiting
Date: Thu, 28 Mar 2024 11:21:45 -0700
Message-Id: <20240328182147.4169656-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240328182147.4169656-1-matthew.brost@intel.com>
References: <20240328182147.4169656-1-matthew.brost@intel.com>
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

Preempt fences can sleep waiting for an exec quuee suspend operation to
complete. Use a device private work queue to avoid hogging system
resources. Even though suspend operations can complete out-of-order, all
suspend operations within a VM need to complete before the preempt
rebind worker can start. With that, use a device private ordered wq for
preempt fence waiting.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c        | 7 ++++++-
 drivers/gpu/drm/xe/xe_device_types.h  | 3 +++
 drivers/gpu/drm/xe/xe_preempt_fence.c | 2 +-
 3 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 01bd5ccf05ca..559bd72fde57 100644
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
 
@@ -291,9 +294,11 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 	INIT_LIST_HEAD(&xe->pinned.external_vram);
 	INIT_LIST_HEAD(&xe->pinned.evicted);
 
+	xe->preempt_fence_wq = alloc_ordered_workqueue("xe-preempt-fence-wq", 0);
 	xe->ordered_wq = alloc_ordered_workqueue("xe-ordered-wq", 0);
 	xe->unordered_wq = alloc_workqueue("xe-unordered-wq", 0, 0);
-	if (!xe->ordered_wq || !xe->unordered_wq) {
+	if (!xe->ordered_wq || !xe->unordered_wq ||
+	    !xe->preempt_fence_wq) {
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

