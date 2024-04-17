Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FFD0C4345F
	for <intel-xe@archiver.kernel.org>; Wed, 17 Apr 2024 18:56:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DE8011244E;
	Wed, 17 Apr 2024 18:56:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YKT5SX7K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F21D910F7BD
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Apr 2024 18:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713380171; x=1744916171;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SWLXfksncj9UxidIYl4KAsxsY0Q5XFfF6Jv30Z4o2kA=;
 b=YKT5SX7KoN2XmMU4/UVAYXnjjsOoy3HNaKRYDdlEZ6iqQ1qTgGE76s0o
 isrVdBJr23Lstgfy/EW2q6gLAPcYAntPm9IFfbtJOaMHeihxk7n7ouJjR
 qY5lAoxZuMq/uHo+5bQX90MhY7nbJfcvdNSLFBnauimzLYcJb2C0P43C0
 jOzo/n4JNYDxRsTpHFOpVJgGQ/KrtWChocxTVVLMk2iZLd666LCDqWI4Y
 1zcMqZUIPxnks/mMOJAg6n9cwHufk+r343BtLb5QxC5GLM80wyFjHyxJy
 XSzeRBd8U7pkN8B5tqxhv5qzvrNiovYoVk4U4gNxSQBiZdlGGBaO+V2sm w==;
X-CSE-ConnectionGUID: waHLJsq3RDmmK67TZzOxSg==
X-CSE-MsgGUID: 7/T+hqZiQieROmTe93tpiA==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="31372419"
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; d="scan'208";a="31372419"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 11:56:10 -0700
X-CSE-ConnectionGUID: dTrRHBUaSOqV9z3DN/q6qg==
X-CSE-MsgGUID: P/jzpPDERQSll1R/rA7E2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; d="scan'208";a="60131182"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 11:56:11 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>,
	Oak Zeng <oak.zeng@intel.com>
Subject: [PATCH] drm/xe: Refcount VMA
Date: Wed, 17 Apr 2024 11:56:35 -0700
Message-Id: <20240417185635.1004663-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

xe_vma is one of the few objects that doesn't currently have a refcount,
rather an internal scheme which figures out when the VMA can be freed.
Switch to refcount as this is the standard way to handle this and will
future-proof the code for cases where additional refs to VMAs are
needed.

One functional change in the patch is that the freeing of the VMA is
always done in a worker, as the final put can be done from an IRQ
context and the freeing of a VMA is not ever in a critical path.

Cc: Oak Zeng <oak.zeng@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c       | 16 ++++++++++++----
 drivers/gpu/drm/xe/xe_vm.h       | 12 ++++++++++++
 drivers/gpu/drm/xe/xe_vm_types.h |  3 +++
 3 files changed, 27 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 8a858b8588bd..a2d3aacbf29f 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -791,6 +791,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 			vma->gpuva.gem.obj = &bo->ttm.base;
 	}
 
+	kref_init(&vma->refcount);
 	INIT_LIST_HEAD(&vma->combined_links.rebind);
 
 	INIT_LIST_HEAD(&vma->gpuva.gem.entry);
@@ -899,13 +900,20 @@ static void vma_destroy_work_func(struct work_struct *w)
 	xe_vma_destroy_late(vma);
 }
 
+void __xe_vma_destroy_async(struct kref *ref)
+{
+	struct xe_vma *vma = container_of(ref, struct xe_vma, refcount);
+
+	INIT_WORK(&vma->destroy_work, vma_destroy_work_func);
+	queue_work(system_unbound_wq, &vma->destroy_work);
+}
+
 static void vma_destroy_cb(struct dma_fence *fence,
 			   struct dma_fence_cb *cb)
 {
 	struct xe_vma *vma = container_of(cb, struct xe_vma, destroy_cb);
 
-	INIT_WORK(&vma->destroy_work, vma_destroy_work_func);
-	queue_work(system_unbound_wq, &vma->destroy_work);
+	xe_vma_put(vma);
 }
 
 static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
@@ -934,10 +942,10 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
 
 		if (ret) {
 			XE_WARN_ON(ret != -ENOENT);
-			xe_vma_destroy_late(vma);
+			xe_vma_put(vma);
 		}
 	} else {
-		xe_vma_destroy_late(vma);
+		xe_vma_put(vma);
 	}
 }
 
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 306cd0934a19..1cfe175d99e0 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -39,6 +39,18 @@ static inline void xe_vm_put(struct xe_vm *vm)
 	drm_gpuvm_put(&vm->gpuvm);
 }
 
+static inline struct xe_vma *xe_vma_get(struct xe_vma *vma)
+{
+	kref_get(&vma->refcount);
+	return vma;
+}
+
+void __xe_vma_destroy_async(struct kref *ref);
+static inline void xe_vma_put(struct xe_vma *vma)
+{
+	kref_put(&vma->refcount, __xe_vma_destroy_async);
+}
+
 int xe_vm_lock(struct xe_vm *vm, bool intr);
 
 void xe_vm_unlock(struct xe_vm *vm);
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 7570c2c6c463..9fd4a8939386 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -65,6 +65,9 @@ struct xe_vma {
 	/** @gpuva: Base GPUVA object */
 	struct drm_gpuva gpuva;
 
+	/** @refcount: ref count of this vma */
+	struct kref refcount;
+
 	/**
 	 * @combined_links: links into lists which are mutually exclusive.
 	 * Locking: vm lock in write mode OR vm lock in read mode and the vm's
-- 
2.34.1

