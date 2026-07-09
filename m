Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 759C4C44501
	for <intel-xe@archiver.kernel.org>; Thu,  9 Jul 2026 00:51:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36BB010F345;
	Thu,  9 Jul 2026 00:51:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a0sx/AgY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8171110F345
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Jul 2026 00:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783558293; x=1815094293;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pmqok+XOeL+MErdZnWjFNjQBIrGmrRcPpYMDskIVaJ8=;
 b=a0sx/AgYz8Rm/UlJskQMU0HBMI7iYqRbq0tu8Tp7eZkV3AnMAV7RYwwK
 7AsXxGVORRcRrQOuApD3iKWC9xWocNaulnhHUFm6LC/nOKSXi5wNfbtVH
 l961suXBVy9r+Bu8EOvJjvfUTm2rWw06rG/w1g52MlqCpI03Vyk4PuSDr
 5rETJDX0z6wkrpUduZD/BKnA8IfRJF9qsTpDA77LPb652Hzpc3a1OAL1s
 4ja4dcdlqHSaQicbHPE/FuHfSWXeg9gu8vmvO4iKMe0g3l1DPpgFa/GYN
 lFOxekEQuq+0ewfnKRpUXEaohrjcsO1TaJYkeyU/r7/Q75xHGgrsCiqD+ A==;
X-CSE-ConnectionGUID: FBmjqGDyS9ieshdT+u0TNw==
X-CSE-MsgGUID: R+nW0FhaSXWEBjewx1sdCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="94880771"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="94880771"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 17:51:33 -0700
X-CSE-ConnectionGUID: o91wuhSxT6uiKOjDGrLIlg==
X-CSE-MsgGUID: Hx1ZYMuYTui87Fqoz4TSjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="254540839"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 17:51:33 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Destroy page tables after unlinking all VMAs on VM
 close
Date: Wed,  8 Jul 2026 17:51:25 -0700
Message-Id: <20260709005125.1666142-1-matthew.brost@intel.com>
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

xe_vm_close_and_put() freed the VM's page-table roots via
xe_vm_pt_destroy() before destroying the "contested" VMAs - those backed
by external (shared) BOs, which are deferred to xe_vma_destroy_unlocked()
because unlinking them requires taking the external BO's dma-resv lock
(via drm_exec), not vm->lock.

Until such a VMA is unlinked it remains reachable from its BO through
drm_gem_for_each_gpuvm_bo(). A concurrent BO move that only holds the
BO's dma-resv lock - TTM eviction, the shrinker, or the defrag worker -
calls xe_bo_move_notify() -> xe_bo_trigger_rebind() ->
xe_vm_invalidate_vma() -> xe_pt_zap_ptes(), which dereferences
vm->pt_root[tile->id]. With the page tables already freed this is a
use-after-free / NULL dereference, e.g.:

  Oops: general protection fault [...] kernel NULL pointer dereference
  RIP: xe_pt_zap_ptes+0x7c [xe]
  Call Trace:
   xe_vm_invalidate_vma_submit+0x64/0x130 [xe]
   xe_vm_invalidate_vma+0x27/0x60 [xe]
   xe_bo_move_notify+0x1e7/0x3d0 [xe]
   xe_bo_move+0x62d/0x1620 [xe]
   ttm_bo_handle_move_mem+0x243/0x330 [ttm]
   ttm_bo_validate+0xb4/0x1a0 [ttm]

The race is not closable with a flag or a NULL pt_root check in the
invalidate path: the freeing side holds only vm->lock while the walker
holds only the BO's resv, so there is no common lock to serialise on.

Fix the ordering instead: destroy the page tables only after every VMA -
including the contested external-BO VMAs - has been unlinked. Once the
contested loop completes no BO can reach a VMA of this VM, so freeing the
page tables (under vm->lock, to satisfy xe_vm_assert_held()) is safe.
xe_vm_free_scratch() still runs before the free as it reads
pt_root[]->level.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Assisted-by: GitHub_Copilot:claude-opus-4.8
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 73ac031ffb04..8c532130aa0c 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1933,15 +1933,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 		vma->gpuva.flags |= XE_VMA_DESTROYED;
 	}
 
-	/*
-	 * All vm operations will add shared fences to resv.
-	 * The only exception is eviction for a shared object,
-	 * but even so, the unbind when evicted would still
-	 * install a fence to resv. Hence it's safe to
-	 * destroy the pagetables immediately.
-	 */
 	xe_vm_free_scratch(vm);
-	xe_vm_pt_destroy(vm);
 	xe_vm_unlock(vm);
 
 	/*
@@ -1955,6 +1947,22 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 		xe_vma_destroy_unlocked(vma);
 	}
 
+	/*
+	 * Destroy the page tables only after every VMA has been unlinked. The
+	 * contested (external-BO) VMAs above are unlinked from their BO under
+	 * the BO's dma-resv lock, not vm->lock, so they can still be reached
+	 * via drm_gem_for_each_gpuvm_bo() by a concurrent BO move (eviction,
+	 * shrinker or the defrag worker) that only holds the BO's resv. Such a
+	 * move calls xe_vm_invalidate_vma() -> xe_pt_zap_ptes(), which
+	 * dereferences vm->pt_root[]; freeing the page tables while those VMAs
+	 * are still linked is a use-after-free. All vm operations add shared
+	 * fences to the resv (eviction of a shared object still installs an
+	 * unbind fence), so no GPU work outlives this point.
+	 */
+	xe_vm_lock(vm, false);
+	xe_vm_pt_destroy(vm);
+	xe_vm_unlock(vm);
+
 	xe_svm_fini(vm);
 
 	up_write(&vm->lock);
-- 
2.34.1

