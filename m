Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCB93C3ABCB
	for <intel-xe@archiver.kernel.org>; Tue, 13 May 2025 03:37:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81C4F10E4E5;
	Tue, 13 May 2025 03:37:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mwQ1urmL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D3C610E4DE
 for <intel-xe@lists.freedesktop.org>; Tue, 13 May 2025 03:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747107447; x=1778643447;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6AqwEjQ6wbJhfmad+hChIPFT1awf7r2rk/3UbiWjGpk=;
 b=mwQ1urmLt2k1485nXDV6XZF8tuKwWdQPuf8jHV5zNz2mveOIWmSq0Nbs
 FJNWcT4Wvgog9ttbNPW+jMBzBMn/V8vh04+1HtjpC/Ak83sGB2ni2TYhy
 fKXbUZEYXW+6JYBujUo0fPCGV9OGnLWKt0vdtQZT2/AUD2FaGLD6sWy3e
 H1mSkHSCpjEz0Eila8WUH7izG381LAQ5bgPyK7PphmVdcpjZ/PYMQ2/z4
 crrSh2QZ1SuvOh5aVG0m110pYerUsNdp1uLT1GrKGKa1aBi/+qeKfnbU5
 Vqk8xadZ36ERQ5WzohmcGGghoOVlAaALuaoFAo5IhR4XmBi+9pIZgUZAm Q==;
X-CSE-ConnectionGUID: /mC3+Kr6ShG0GgPbJVAhew==
X-CSE-MsgGUID: xgBXSu9oQqSqTbVjiqx/Og==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="48858860"
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; d="scan'208";a="48858860"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 20:37:27 -0700
X-CSE-ConnectionGUID: uHExzALLTd+a1cQ4scvRlQ==
X-CSE-MsgGUID: 87Xam8Z3RuWrEjvSi2GgWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; d="scan'208";a="142690340"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by orviesa005.jf.intel.com with ESMTP; 12 May 2025 20:37:26 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v8 15/15] drm/xe/vm: Add debug prints for SVM range prefetch
Date: Tue, 13 May 2025 09:32:28 +0530
Message-Id: <20250513040228.470682-16-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250513040228.470682-1-himal.prasad.ghimiray@intel.com>
References: <20250513040228.470682-1-himal.prasad.ghimiray@intel.com>
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

Introduce debug logs for the prefetch operation of SVM ranges.

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 842af808c39b..5a978da411b0 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2399,8 +2399,10 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 				goto unwind_prefetch_ops;
 			}
 
-			if (xe_svm_range_validate(vm, svm_range, tile_mask, !!prefetch_region))
+			if (xe_svm_range_validate(vm, svm_range, tile_mask, !!prefetch_region)) {
+				xe_svm_range_debug(svm_range, "PREFETCH - RANGE IS VALID");
 				goto check_next_range;
+			}
 
 			err = xa_alloc(&op->prefetch_range.range,
 				       &i, svm_range, xa_limit_32b,
@@ -2411,6 +2413,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 
 			op->prefetch_range.ranges_count++;
 			vops->flags |= XE_VMA_OPS_FLAG_HAS_SVM_PREFETCH;
+			xe_svm_range_debug(svm_range, "PREFETCH - RANGE CREATED");
 check_next_range:
 			if (range_end > xe_svm_range_end(svm_range) &&
 			    xe_svm_range_end(svm_range) < xe_vma_end(vma)) {
@@ -2909,6 +2912,7 @@ static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
 					vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
 				return -ENODATA;
 			}
+			xe_svm_range_debug(svm_range, "PREFETCH - RANGE MIGRATED TO VRAM");
 		}
 
 		err = xe_svm_range_get_pages(vm, svm_range, &ctx);
@@ -2919,6 +2923,7 @@ static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
 				vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
 			return err;
 		}
+		xe_svm_range_debug(svm_range, "PREFETCH - RANGE GET PAGES DONE");
 	}
 
 	return err;
-- 
2.34.1

