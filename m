Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E200C3ABB2
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 17:25:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5297810E066;
	Wed, 28 May 2025 17:25:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hRqpx7XP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B190010E632
 for <intel-xe@lists.freedesktop.org>; Wed, 28 May 2025 17:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748453158; x=1779989158;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uyeXN8iBPY9AMp56badokDz8ee10DfQci8ZL9Qw9NCY=;
 b=hRqpx7XP+aqUPTHTfMwF9lKCMsUZfJYeAcbfkKNui7TNpxb1urTJxkNS
 w3XN0lxxcOyXQm9ZsHIplbDUgkfn8MqvjQjy8LP37NDBggRyiNIj5bH3h
 0uw2Ixpz0q8+j9RuLyKedw7AEb96GS7OVSPxEVyIXpBj5NpEaay6Flzmo
 swrcq/iMgt4OcIo1x5IlbLV82vFDJU2gZ1M/d89YsLTxsOC96WyuSDLRJ
 Jx9TxIhaBgCNbmGbB26B3qNJFA47p9L7tcmvZ9/vxW+uoFYNzxO9e4Lfq
 GL/RlYLD46T7oCsW8xCgTxlS2D8jcv82MciwZVY7lI/+SLzn8rfZ43fc3 A==;
X-CSE-ConnectionGUID: NL4TJrOGTQu/aMSamr32ow==
X-CSE-MsgGUID: 8XyP2JZlRAyf5NFBO1ItNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="38116812"
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; d="scan'208";a="38116812"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 10:25:58 -0700
X-CSE-ConnectionGUID: qjIMJUCSSHm4YnTrz1oW+Q==
X-CSE-MsgGUID: V6mqMtz/QQyi0wU0DB/m1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; d="scan'208";a="166463126"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 10:25:57 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com,
	himal.prasad.ghimiray@intel.com
Subject: [PATCH] drm/xe: Thread prefetch of SVM ranges
Date: Wed, 28 May 2025 10:27:25 -0700
Message-Id: <20250528172725.1669802-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The migrate_vma_* functions are very CPU-intensive; thus, prefetching of
SVM ranges is limited by the CPU rather than the paging copy engine
bandwidth. In an effort to speed up the prefetching of SVM ranges, the
step that calls migrate_vma_* is now threaded. This utilizes the
existing page fault work queue for threading.

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 111 +++++++++++++++++++++++++++----------
 1 file changed, 83 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 5a978da411b0..18e5a36c6c21 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2878,53 +2878,108 @@ static int check_ufence(struct xe_vma *vma)
 	return 0;
 }
 
-static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
+struct prefetch_thread {
+	struct work_struct work;
+	struct drm_gpusvm_ctx *ctx;
+	struct xe_vma *vma;
+	struct xe_svm_range *svm_range;
+	u32 region;
+	int err;
+};
+
+static void prefetch_work_func(struct work_struct *w)
 {
-	bool devmem_possible = IS_DGFX(vm->xe) && IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR);
-	struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
+	struct prefetch_thread *thread =
+		container_of(w, struct prefetch_thread, work);
+	struct xe_vma *vma = thread->vma;
+	struct xe_vm *vm = xe_vma_vm(vma);
+	struct xe_svm_range *svm_range = thread->svm_range;
+	u32 region = thread->region;
+	struct xe_tile *tile =
+		&vm->xe->tiles[region_to_mem_type[region] - XE_PL_VRAM0];
 	int err = 0;
 
-	struct xe_svm_range *svm_range;
+	if (!region) {
+		xe_svm_range_migrate_to_smem(vm, svm_range);
+	} else if (xe_svm_range_needs_migrate_to_vram(svm_range, vma, region)) {
+		err = xe_svm_alloc_vram(vm, tile, svm_range, thread->ctx);
+		if (err) {
+			drm_dbg(&vm->xe->drm,
+				"VRAM allocation failed, retry from userspace, asid=%u, gpusvm=%p, errno=%pe\n",
+				vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
+			thread->err = -ENODATA;
+			return;
+		}
+		xe_svm_range_debug(svm_range, "PREFETCH - RANGE MIGRATED TO VRAM");
+	}
+
+	err = xe_svm_range_get_pages(vm, svm_range, thread->ctx);
+	if (err) {
+		if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM)
+			err = -ENODATA;
+		drm_dbg(&vm->xe->drm, "Get pages failed, asid=%u, gpusvm=%p, errno=%pe\n",
+			vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
+		thread->err = err;
+		return;
+	}
+
+	xe_svm_range_debug(svm_range, "PREFETCH - RANGE GET PAGES DONE");
+}
+
+static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
+{
+	struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
+	u32 j, region = op->prefetch_range.region;
 	struct drm_gpusvm_ctx ctx = {};
-	struct xe_tile *tile;
+	struct prefetch_thread *thread;
+	struct xe_svm_range *svm_range;
+	struct xarray prefetches;
+	struct xe_tile *tile =
+		&vm->xe->tiles[region_to_mem_type[region] - XE_PL_VRAM0];
 	unsigned long i;
-	u32 region;
+	bool devmem_possible = IS_DGFX(vm->xe) &&
+		IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR);
+	int err = 0;
 
 	if (!xe_vma_is_cpu_addr_mirror(vma))
 		return 0;
 
-	region = op->prefetch_range.region;
+	xa_init_flags(&prefetches, XA_FLAGS_ALLOC);
 
 	ctx.read_only = xe_vma_read_only(vma);
 	ctx.devmem_possible = devmem_possible;
 	ctx.check_pages_threshold = devmem_possible ? SZ_64K : 0;
 
-	/* TODO: Threading the migration */
 	xa_for_each(&op->prefetch_range.range, i, svm_range) {
-		if (!region)
-			xe_svm_range_migrate_to_smem(vm, svm_range);
+		thread = kmalloc(sizeof(*thread), GFP_KERNEL);
+		if (!thread)
+			goto wait_threads;
 
-		if (xe_svm_range_needs_migrate_to_vram(svm_range, vma, region)) {
-			tile = &vm->xe->tiles[region_to_mem_type[region] - XE_PL_VRAM0];
-			err = xe_svm_alloc_vram(vm, tile, svm_range, &ctx);
-			if (err) {
-				drm_dbg(&vm->xe->drm, "VRAM allocation failed, retry from userspace, asid=%u, gpusvm=%p, errno=%pe\n",
-					vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
-				return -ENODATA;
-			}
-			xe_svm_range_debug(svm_range, "PREFETCH - RANGE MIGRATED TO VRAM");
-		}
-
-		err = xe_svm_range_get_pages(vm, svm_range, &ctx);
+		err = xa_alloc(&prefetches, &j, thread, xa_limit_32b,
+			       GFP_KERNEL);
 		if (err) {
-			if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM)
-				err = -ENODATA;
-			drm_dbg(&vm->xe->drm, "Get pages failed, asid=%u, gpusvm=%p, errno=%pe\n",
-				vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
-			return err;
+			kfree(thread);
+			goto wait_threads;
 		}
-		xe_svm_range_debug(svm_range, "PREFETCH - RANGE GET PAGES DONE");
+
+		INIT_WORK(&thread->work, prefetch_work_func);
+		thread->ctx = &ctx;
+		thread->vma = vma;
+		thread->svm_range = svm_range;
+		thread->region = region;
+		thread->err = 0;
+
+		queue_work(tile->primary_gt->usm.pf_wq, &thread->work);
+	}
+
+wait_threads:
+	xa_for_each(&prefetches, i, thread) {
+		flush_work(&thread->work);
+		if (thread->err && (!err || err == -ENODATA))
+			err = thread->err;
+		kfree(thread);
 	}
+	xa_destroy(&prefetches);
 
 	return err;
 }
-- 
2.34.1

