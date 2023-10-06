Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4F33E92FFF
	for <intel-xe@archiver.kernel.org>; Fri,  6 Oct 2023 10:00:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77E7F10E06B;
	Fri,  6 Oct 2023 10:00:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B016B10E4DA
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Oct 2023 10:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696586406; x=1728122406;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8WsUdr03WcIMMX1ZCyiBxputbJUK4O6LvPC9luIu/2A=;
 b=ZSO4QWhMtVAGoNy3MzsIJsW/LnaJguSq36sX1SL8tzJk6CWr1jqBmi79
 H4YMllm+PImIde2sTn70WOGQbqXgoYMqewPkjCzQ6npd7FxQI1f+soNAl
 BnbLomTEF9fIUt/cXkw/0Q0r4C4dR2Oaph5XF92UL7axp610q6cK2Jjoa
 Z6jEULkI+I+tzzRRgCqZAaanFWp/raN+tvYtrkSsUU3jPHdwiqplA++Ma
 kHPdQxUOH44AJUr/7YF8kjdkijsuKHzMZl2Au5nIEM6SG7UwhvIaJLJCu
 KDn1ySkyEIAv5urDLuJ0UYyPZbrJQ9dvUJ1aJoJ+wkZcrJiafXH614tMq A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="447907163"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="447907163"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 03:00:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="745815871"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="745815871"
Received: from triebel-mobl.ger.corp.intel.com (HELO 8688cc0b8d51.intel.com)
 ([10.252.41.87])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 03:00:05 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  6 Oct 2023 09:59:32 +0000
Message-Id: <20231006095943.7-10-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231006095943.7-1-francois.dugast@intel.com>
References: <20231006095943.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 09/20] drm/xe: Rename exec_queue_kill_compute
 to xe_vm_remove_compute_exec_queue
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Matthew Brost <matthew.brost@intel.com>

Much better name and aligns with xe_vm_add_compute_exec_queue. As part
of the rename, move the implementation from xe_exec_queue.c to xe_vm.c.

Suggested-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 20 ++------------------
 drivers/gpu/drm/xe/xe_vm.c         | 21 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.h         |  1 +
 3 files changed, 24 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 68cd2234acf5..170d9d9c48d2 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -775,22 +775,6 @@ int xe_exec_queue_get_property_ioctl(struct drm_device *dev, void *data,
 	return ret;
 }
 
-static void exec_queue_kill_compute(struct xe_exec_queue *q)
-{
-	if (!xe_vm_in_compute_mode(q->vm))
-		return;
-
-	down_write(&q->vm->lock);
-	list_del(&q->compute.link);
-	--q->vm->preempt.num_exec_queues;
-	if (q->compute.pfence) {
-		dma_fence_enable_sw_signaling(q->compute.pfence);
-		dma_fence_put(q->compute.pfence);
-		q->compute.pfence = NULL;
-	}
-	up_write(&q->vm->lock);
-}
-
 /**
  * xe_exec_queue_is_lr() - Whether an exec_queue is long-running
  * @q: The exec_queue
@@ -861,11 +845,11 @@ void xe_exec_queue_kill(struct xe_exec_queue *q)
 	list_for_each_entry_safe(eq, next, &eq->multi_gt_list,
 				 multi_gt_link) {
 		q->ops->kill(eq);
-		exec_queue_kill_compute(eq);
+		xe_vm_remove_compute_exec_queue(q->vm, eq);
 	}
 
 	q->ops->kill(q);
-	exec_queue_kill_compute(q);
+	xe_vm_remove_compute_exec_queue(q->vm, q);
 }
 
 int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 756f20d891ae..061a43c9fb2c 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -381,6 +381,27 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
 	return err;
 }
 
+/**
+ * xe_vm_remove_compute_exec_queue() - Remove compute exec queue from VM
+ * @vm: The VM.
+ * @q: The exec_queue
+ */
+void xe_vm_remove_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
+{
+	if (!xe_vm_in_compute_mode(vm))
+		return;
+
+	down_write(&vm->lock);
+	list_del(&q->compute.link);
+	--vm->preempt.num_exec_queues;
+	if (q->compute.pfence) {
+		dma_fence_enable_sw_signaling(q->compute.pfence);
+		dma_fence_put(q->compute.pfence);
+		q->compute.pfence = NULL;
+	}
+	up_write(&vm->lock);
+}
+
 /**
  * __xe_vm_userptr_needs_repin() - Check whether the VM does have userptrs
  * that need repinning.
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 4b32ce9cf9b1..a698ff710a4f 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -168,6 +168,7 @@ static inline bool xe_vm_no_dma_fences(struct xe_vm *vm)
 }
 
 int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q);
+void xe_vm_remove_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q);
 
 int xe_vm_userptr_pin(struct xe_vm *vm);
 
-- 
2.34.1

