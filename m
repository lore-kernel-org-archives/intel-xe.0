Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F4DCD37B2
	for <intel-xe@archiver.kernel.org>; Fri, 15 Sep 2023 23:34:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5241310E6B4;
	Fri, 15 Sep 2023 23:34:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A66DC10E09C
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Sep 2023 23:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694820874; x=1726356874;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YSaKmh31DPFEmVj8+Znm//IlINqR2Q4lj4YgQBXlGcQ=;
 b=h+421lArlAinci5CECTb596D+JAMnpLGJiy9r8PBxYg06oYMPJ7kNHbc
 5uToWuYRQ0Q1kWOQYNiXBmDDbNq4Fd2p6Khnp55nQ7bARSq9wkhS7LKF/
 CqWhNYrfMdLvfaVkQYEtY7aySvkqk8LKNXOYoN26QA2UkbdDGq+Y1eKdi
 EpXOTuWEz/Q/Dg9kaWhF0hWLQhEAorTvhkXqakLmbuGuvAyBeIO8G+2xK
 MF7Jxrfv668lT7ItSgJfvNNciu7OH2/EYsYjROsJwADZ4rh064ie5aIlO
 E/7Gz27C7AU2eg9Y1kkqZ8toXXcTzZ2zmahbsDI0ReHt/V/H4Dh/8zvdd A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="376694109"
X-IronPort-AV: E=Sophos;i="6.02,150,1688454000"; d="scan'208";a="376694109"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 16:34:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="992036142"
X-IronPort-AV: E=Sophos;i="6.02,150,1688454000"; d="scan'208";a="992036142"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 16:34:31 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 15 Sep 2023 16:34:44 -0700
Message-Id: <20230915233445.2241554-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230915233445.2241554-1-matthew.brost@intel.com>
References: <20230915233445.2241554-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 3/4] drm/xe: Rename exec_queue_kill_compute to
 xe_vm_remove_compute_exec_queue
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

Much better name and aligns with xe_vm_add_compute_exec_queue. As part
of the rename, move the implementation from xe_exec_queue.c to xe_vm.c.

Suggested-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 20 ++------------------
 drivers/gpu/drm/xe/xe_vm.c         | 21 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.h         |  1 +
 3 files changed, 24 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 93d2f0591c34..b95b62a2538f 100644
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
index 03ee6993e7c7..433bdfae6759 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -380,6 +380,27 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
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
index 5608e4e33169..813328ad3f7f 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -168,6 +168,7 @@ static inline bool xe_vm_no_dma_fences(struct xe_vm *vm)
 }
 
 int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q);
+void xe_vm_remove_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q);
 
 int xe_vm_userptr_pin(struct xe_vm *vm);
 
-- 
2.34.1

