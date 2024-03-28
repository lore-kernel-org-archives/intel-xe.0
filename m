Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A224ACD11DD
	for <intel-xe@archiver.kernel.org>; Thu, 28 Mar 2024 18:21:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 706A011253C;
	Thu, 28 Mar 2024 18:21:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kuHH7ytR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BABF11253C
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Mar 2024 18:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711650089; x=1743186089;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aYSa6OUzAnA6LYKKQptSTmhsxFkv414NGC9FaX2Qde0=;
 b=kuHH7ytR55Zw+k2YLM+pg3dAZcZYEWriR1O04sIM04ts0JMrF2kYHiY5
 ewkICAE8fc7/Vav6r1tbk1HGViSKbWOyP56WHYbF7vvzjn5EIoYmdHkJN
 ZR0TIQqykTsId51HaAj5KzSHdKFtsIC5LgVmKJvOc1CGvwYeaeFXSFZD7
 ruTyOHT8VYvU0va2hRFITFrqM36ugYqeJmidjwaO/Fm4x1Qu2OD4eKUlQ
 WROeHNAaP9pJZd/54P+9/+XuAAMTK6/i0Ktpgg8STQNOoi0QZy7o3JDN/
 6TMIf7yrbHxZReTlJ2ACDZv56Xm1CrbFicIkiUygo+l9qqnTH+tiYZ955 g==;
X-CSE-ConnectionGUID: Ds9ZahllTFCrUGgv8AKwjg==
X-CSE-MsgGUID: gn2Z9CQuQDSWFOU0MHM8JQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="29307492"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="29307492"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 11:21:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="16784212"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 11:21:27 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: <thomas.hellstrom@linux.intel.com>, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 2/3] drm/xe: Use device,
 gt ordered work queues for resource cleanup
Date: Thu, 28 Mar 2024 11:21:46 -0700
Message-Id: <20240328182147.4169656-3-matthew.brost@intel.com>
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

Resource cleanup is a device private operations with no expectation of
performance. Use device, gt ordered work queues to cleanup resources to
avoid grabbing locks on shared work queues.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 5 ++++-
 drivers/gpu/drm/xe/xe_execlist.c     | 2 +-
 drivers/gpu/drm/xe/xe_gt_types.h     | 5 ++++-
 drivers/gpu/drm/xe/xe_guc_submit.c   | 2 +-
 drivers/gpu/drm/xe/xe_vm.c           | 4 ++--
 5 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index c710cec835a7..d696aa2de8cc 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -366,7 +366,10 @@ struct xe_device {
 	/** @preempt_fence_wq: used to serialize preempt fences */
 	struct workqueue_struct *preempt_fence_wq;
 
-	/** @ordered_wq: used to serialize compute mode resume */
+	/**
+	 * @ordered_wq: used to serialize compute mode resume, cleanup
+	 * resources
+	 */
 	struct workqueue_struct *ordered_wq;
 
 	/** @unordered_wq: used to serialize unordered work, mostly display */
diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index dece2785933c..1ae922509f05 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -393,7 +393,7 @@ static void execlist_exec_queue_kill(struct xe_exec_queue *q)
 static void execlist_exec_queue_fini(struct xe_exec_queue *q)
 {
 	INIT_WORK(&q->execlist->fini_async, execlist_exec_queue_fini_async);
-	queue_work(system_unbound_wq, &q->execlist->fini_async);
+	queue_work(q->gt->ordered_wq, &q->execlist->fini_async);
 }
 
 static int execlist_exec_queue_set_priority(struct xe_exec_queue *q,
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 2143dffcaf11..cd22ad6e881a 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -268,7 +268,10 @@ struct xe_gt {
 		} acc_queue[NUM_ACC_QUEUE];
 	} usm;
 
-	/** @ordered_wq: used to serialize GT resets and TDRs */
+	/**
+	 * @ordered_wq: used to serialize GT resets and TDRs, clean up
+	 * resources
+	 */
 	struct workqueue_struct *ordered_wq;
 
 	/** @uc: micro controllers on the GT */
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 13b7e195c7b5..e30ad9fccf6c 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1033,7 +1033,7 @@ static void guc_exec_queue_fini_async(struct xe_exec_queue *q)
 	if (q->flags & EXEC_QUEUE_FLAG_PERMANENT)
 		__guc_exec_queue_fini_async(&q->guc->fini_async);
 	else
-		queue_work(system_wq, &q->guc->fini_async);
+		queue_work(q->gt->ordered_wq, &q->guc->fini_async);
 }
 
 static void __guc_exec_queue_fini(struct xe_guc *guc, struct xe_exec_queue *q)
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 8b32aa5003df..7808b540c013 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1005,7 +1005,7 @@ static void vma_destroy_cb(struct dma_fence *fence,
 	struct xe_vma *vma = container_of(cb, struct xe_vma, destroy_cb);
 
 	INIT_WORK(&vma->destroy_work, vma_destroy_work_func);
-	queue_work(system_unbound_wq, &vma->destroy_work);
+	queue_work(xe_vma_vm(vma)->xe->ordered_wq, &vma->destroy_work);
 }
 
 static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
@@ -1625,7 +1625,7 @@ static void xe_vm_free(struct drm_gpuvm *gpuvm)
 	struct xe_vm *vm = container_of(gpuvm, struct xe_vm, gpuvm);
 
 	/* To destroy the VM we need to be able to sleep */
-	queue_work(system_unbound_wq, &vm->destroy_work);
+	queue_work(vm->xe->ordered_wq, &vm->destroy_work);
 }
 
 struct xe_vm *xe_vm_lookup(struct xe_file *xef, u32 id)
-- 
2.34.1

