Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AED4606A320
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 13:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IJARunWN
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E2A2112A18;
	Fri, 20 Nov 2026 13:03:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 234B1112A14
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 13:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795179801; x=1826715801;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=oh02FbUm2IGtMgpXMw94bxcf19rHrCZpNFbu0mrbWdg=;
 b=IJARunWNokdIV4Athhxw1AtBwoWyoMcJfwnMOpcpV9ERkVh2wjg+e9RO
 Iosvl3IwA0zZ3YrMIHF1POR4+Gaw0SKPxNMIgwIbJUEz+3yfzKScwBovL
 so/1SY8uIyKoU2VC/mcv5ntGNE9hY3yDf9Itts+/gpJu8UNi65XUugaZk
 P5TQpUimJc40Pyd5ObBJaGEStmqksWUrGNPKMDt7TqMGqN2qQjYBF6DlA
 WwXCjris6h+ojFxAPfJ/DCf1r9kH6jBdKodZPFgd+ZGOZzmR9MSakETlj
 50Lzil4xEaaFVp1lzP5r2fah/Bdkuo28+6HtOp60xuZZsfgXGDPK4WqYS w==;
X-CSE-ConnectionGUID: FQ73eRXRTEGBRxmxYD5Agg==
X-CSE-MsgGUID: 0fBtlyHETwmTcm0Qq9gqxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4072678"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4072678"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 05:03:21 -0800
X-CSE-ConnectionGUID: RbKUac8pSl6dI+MpVPOWUw==
X-CSE-MsgGUID: WrfEwwTAQQy6/QiwXs6T8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; d="scan'208";a="10639236"
Received: from slindbla-desk.ger.corp.intel.com (HELO [192.168.0.182])
 ([10.245.244.23])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 05:03:20 -0800
From: Matthew Auld <matthew.auld@intel.com>
Date: Fri, 20 Nov 2026 13:02:16 +0000
Subject: [PATCH v2 1/6] drm/xe/vm: restore userptr invalidations on VMA op
 unwind
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261120-userptr-repin-v2-1-65e1f6e582ef@intel.com>
References: <20261120-userptr-repin-v2-0-65e1f6e582ef@intel.com>
In-Reply-To: <20261120-userptr-repin-v2-0-65e1f6e582ef@intel.com>
To: Matthew Brost <matthew.brost@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>, 
 Stuart Summers <stuart.summers@intel.com>
Cc: intel-xe@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
X-Mailer: b4 0.14.3
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When xe_vma_op_commit() commits DRM_GPUVA_OP_UNMAP or
DRM_GPUVA_OP_REMAP, prep_vma_destroy() sets XE_VMA_DESTROYED while the
old VMA's GPU page tables remain live. If a subsequent step fails and
unwinds (for example splitting a userptr VMA where new_vma() fails, or a
later op in an array of binds failing), a concurrent MMU notifier
invalidation is lost on non-fault-mode VMs:

  CPU0 (VM_BIND / MADVISE)            CPU1 (MMU notifier)
  ------------------------            -------------------
  down_write(&vm->lock)
  xe_vma_op_commit()
    prep_vma_destroy(vma)
      flags |= XE_VMA_DESTROYED
  ...
  /* later step fails */
                                      xe_vma_userptr_invalidate_start()
                                        down_write(&notifier_lock)
                                        mmu_interval_set_seq()
                                        /* XE_VMA_DESTROYED set: skips
                                         * vm->userptr.invalidated
                                         */
                                        drm_gpusvm_unmap_pages()
                                        up_write(&notifier_lock)
  xe_vma_op_unwind()
    flags &= ~XE_VMA_DESTROYED
    xe_vm_insert_vma(vm, vma)
  up_write(&vm->lock)

Once vm->lock is dropped, the VMA remains in the VM with live GPU PTEs
pointing at unmapped pages, while neither exec nor the rebind worker
knows to repin and rebind it.

Add unprep_vma_destroy() to check xe_vma_userptr_check_repin() while
clearing XE_VMA_DESTROYED under the notifier lock and queue invalidated
non-fault-mode userptr VMAs onto vm->userptr.invalidated.

Fixes: b06d47be7c83 ("drm/xe: Port Xe to GPUVA")
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: stable@vger.kernel.org # v6.12+
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 35 ++++++++++++++++++++++++-----------
 1 file changed, 24 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index dd855876f571..75be5e5329bd 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -44,6 +44,7 @@
 #include "xe_tile.h"
 #include "xe_tlb_inval.h"
 #include "xe_trace_bo.h"
+#include "xe_userptr.h"
 #include "xe_vm_madvise.h"
 #include "xe_wa.h"
 
@@ -2401,6 +2402,26 @@ static void prep_vma_destroy(struct xe_vm *vm, struct xe_vma *vma,
 		xe_vm_remove_vma(vm, vma);
 }
 
+static void unprep_vma_destroy(struct xe_vm *vm, struct xe_vma *vma,
+			       bool post_commit)
+{
+	xe_svm_notifier_lock(vm);
+	vma->gpuva.flags &= ~XE_VMA_DESTROYED;
+	if (IS_ENABLED(CONFIG_DRM_GPUSVM) && !xe_vm_in_fault_mode(vm) &&
+	    xe_vma_is_userptr(vma) &&
+	    xe_vma_userptr_check_repin(to_userptr_vma(vma))) {
+		struct xe_userptr_vma *uvma = to_userptr_vma(vma);
+
+		spin_lock(&vm->userptr.invalidated_lock);
+		list_move_tail(&uvma->userptr.invalidate_link,
+			       &vm->userptr.invalidated);
+		spin_unlock(&vm->userptr.invalidated_lock);
+	}
+	xe_svm_notifier_unlock(vm);
+	if (post_commit)
+		xe_vm_insert_vma(vm, vma);
+}
+
 #undef ULL
 #define ULL	unsigned long long
 
@@ -3093,13 +3114,8 @@ static void xe_vma_op_unwind(struct xe_vm *vm, struct xe_vma_op *op,
 
 		xe_vm_assert_write_mode_or_garbage_collector(vm);
 
-		if (vma) {
-			xe_svm_notifier_lock(vm);
-			vma->gpuva.flags &= ~XE_VMA_DESTROYED;
-			xe_svm_notifier_unlock(vm);
-			if (post_commit)
-				xe_vm_insert_vma(vm, vma);
-		}
+		if (vma)
+			unprep_vma_destroy(vm, vma, post_commit);
 		break;
 	}
 	case DRM_GPUVA_OP_REMAP:
@@ -3117,9 +3133,6 @@ static void xe_vma_op_unwind(struct xe_vm *vm, struct xe_vma_op *op,
 			xe_vma_destroy_unlocked(op->remap.next);
 		}
 		if (vma) {
-			xe_svm_notifier_lock(vm);
-			vma->gpuva.flags &= ~XE_VMA_DESTROYED;
-			xe_svm_notifier_unlock(vm);
 			if (post_commit) {
 				/*
 				 * Restore the old va range, in case of the
@@ -3131,8 +3144,8 @@ static void xe_vma_op_unwind(struct xe_vm *vm, struct xe_vma_op *op,
 					op->remap.old_start;
 				op->base.remap.unmap->va->va.range =
 					op->remap.old_range;
-				xe_vm_insert_vma(vm, vma);
 			}
+			unprep_vma_destroy(vm, vma, post_commit);
 		}
 		break;
 	}

-- 
2.56.1

