Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73FDCC54E5D
	for <intel-xe@archiver.kernel.org>; Tue, 12 Mar 2024 18:38:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ED6B10EB6F;
	Tue, 12 Mar 2024 18:38:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ERd0jTcv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BE1010EB6F
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Mar 2024 18:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710268732; x=1741804732;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rLvhuXqylE/yPw4YjF2/Y5a33BPrvq9QelYOYLGe+5s=;
 b=ERd0jTcvjGrB3BVdsCbbDjpPhyKYAoRIRnTNzi+dkdnq/xh52V0XZAdb
 p+Q0jyeVVwTmwgqFPQaww2Kq/jM6JCuyDapn7HSBVcw1/Lf4k5JQRn7Sx
 j8Qla00COnJWStH8DxoqhQwj7Zzvaklr1/m2aVdrpmZTR2chCUBHHB2VQ
 o1KnG3J4VPcKMs0MKKTQrM0kTE3VBmAKdAJlydORBkpQvrH1rJzaLJNkI
 Uf6PzTWUHoXA4AQEZ/a4KSlEob/fhEkroFKGSrbeEH7mAp+pB/AE9QMa7
 poD2xaeSBAny+B/8toJ2W1zU8FRpBKJx+nnFSRIvM0j0dwDWoBQt2s6kC Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="8813038"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="8813038"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 11:38:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="16234373"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 11:38:52 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe: Invalidate userptr VMA on page pin fault
Date: Tue, 12 Mar 2024 11:39:07 -0700
Message-Id: <20240312183907.933835-1-matthew.brost@intel.com>
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

Rather than return an error to the user or ban the VM when userptr VMA
page pin fails with -EFAULT, invalidate VMA mappings. This supports the
UMD use case of freeing userptr while still having bindings.

Now that non-faulting VMs can invalidate VMAs, drop the usm prefix for
the tile_invalidated member.

v2:
 - Fix build error (CI)
v3:
 - Don't invalidate VMA if in fault mode, rather kill VM (Thomas)
 - Update commit message with tile_invalidated name chagne (Thomas)
 - Wait VM bookkeep slots with VM resv lock (Thomas)
v4:
 - Move list_del_init(&userptr.repin_link) after error check (Thomas)
 - Assert not in fault mode (Matthew)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c |  4 ++--
 drivers/gpu/drm/xe/xe_trace.h        |  2 +-
 drivers/gpu/drm/xe/xe_vm.c           | 32 +++++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_vm_types.h     |  7 ++----
 4 files changed, 29 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 73c535193a98..241c294270d9 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -69,7 +69,7 @@ static bool access_is_atomic(enum access_type access_type)
 static bool vma_is_valid(struct xe_tile *tile, struct xe_vma *vma)
 {
 	return BIT(tile->id) & vma->tile_present &&
-		!(BIT(tile->id) & vma->usm.tile_invalidated);
+		!(BIT(tile->id) & vma->tile_invalidated);
 }
 
 static bool vma_matches(struct xe_vma *vma, u64 page_addr)
@@ -226,7 +226,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 
 	if (xe_vma_is_userptr(vma))
 		ret = xe_vma_userptr_check_repin(to_userptr_vma(vma));
-	vma->usm.tile_invalidated &= ~BIT(tile->id);
+	vma->tile_invalidated &= ~BIT(tile->id);
 
 unlock_dma_resv:
 	drm_exec_fini(&exec);
diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index 4ddc55527f9a..846f14507d5f 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -468,7 +468,7 @@ DEFINE_EVENT(xe_vma, xe_vma_userptr_invalidate,
 	     TP_ARGS(vma)
 );
 
-DEFINE_EVENT(xe_vma, xe_vma_usm_invalidate,
+DEFINE_EVENT(xe_vma, xe_vma_invalidate,
 	     TP_PROTO(struct xe_vma *vma),
 	     TP_ARGS(vma)
 );
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 643b3701a738..cbb9b8935c90 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -708,6 +708,7 @@ int xe_vm_userptr_pin(struct xe_vm *vm)
 	int err = 0;
 	LIST_HEAD(tmp_evict);
 
+	xe_assert(vm->xe, !xe_vm_in_fault_mode(vm));
 	lockdep_assert_held_write(&vm->lock);
 
 	/* Collect invalidated userptrs */
@@ -724,11 +725,27 @@ int xe_vm_userptr_pin(struct xe_vm *vm)
 	list_for_each_entry_safe(uvma, next, &vm->userptr.repin_list,
 				 userptr.repin_link) {
 		err = xe_vma_userptr_pin_pages(uvma);
-		if (err < 0)
-			return err;
+		if (err == -EFAULT) {
+			list_del_init(&uvma->userptr.repin_link);
 
-		list_del_init(&uvma->userptr.repin_link);
-		list_move_tail(&uvma->vma.combined_links.rebind, &vm->rebind_list);
+			/* Wait for pending binds */
+			xe_vm_lock(vm, false);
+			dma_resv_wait_timeout(xe_vm_resv(vm),
+					      DMA_RESV_USAGE_BOOKKEEP,
+					      false, MAX_SCHEDULE_TIMEOUT);
+
+			err = xe_vm_invalidate_vma(&uvma->vma);
+			xe_vm_unlock(vm);
+			if (err)
+				return err;
+		} else {
+			if (err < 0)
+				return err;
+
+			list_del_init(&uvma->userptr.repin_link);
+			list_move_tail(&uvma->vma.combined_links.rebind,
+				       &vm->rebind_list);
+		}
 	}
 
 	return 0;
@@ -2024,7 +2041,7 @@ static int xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
 			return err;
 	}
 
-	if (vma->tile_mask != (vma->tile_present & ~vma->usm.tile_invalidated)) {
+	if (vma->tile_mask != (vma->tile_present & ~vma->tile_invalidated)) {
 		return xe_vm_bind(vm, vma, q, xe_vma_bo(vma), syncs, num_syncs,
 				  true, first_op, last_op);
 	} else {
@@ -3214,9 +3231,8 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
 	u8 id;
 	int ret;
 
-	xe_assert(xe, xe_vm_in_fault_mode(xe_vma_vm(vma)));
 	xe_assert(xe, !xe_vma_is_null(vma));
-	trace_xe_vma_usm_invalidate(vma);
+	trace_xe_vma_invalidate(vma);
 
 	/* Check that we don't race with page-table updates */
 	if (IS_ENABLED(CONFIG_PROVE_LOCKING)) {
@@ -3254,7 +3270,7 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
 		}
 	}
 
-	vma->usm.tile_invalidated = vma->tile_mask;
+	vma->tile_invalidated = vma->tile_mask;
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 79b5cab57711..ae5fb565f6bf 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -84,11 +84,8 @@ struct xe_vma {
 		struct work_struct destroy_work;
 	};
 
-	/** @usm: unified shared memory state */
-	struct {
-		/** @tile_invalidated: VMA has been invalidated */
-		u8 tile_invalidated;
-	} usm;
+	/** @tile_invalidated: VMA has been invalidated */
+	u8 tile_invalidated;
 
 	/** @tile_mask: Tile mask of where to create binding for this VMA */
 	u8 tile_mask;
-- 
2.34.1

