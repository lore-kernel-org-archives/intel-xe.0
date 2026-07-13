Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BDD6C44501
	for <intel-xe@archiver.kernel.org>; Mon, 13 Jul 2026 18:15:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FB0410E657;
	Mon, 13 Jul 2026 18:15:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i0UlwVB1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BC2610E64E
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Jul 2026 18:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783966548; x=1815502548;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eSA6Hj5akRaBdfs2G/qkk/hasDsBxCYeWjFvIj/SOaA=;
 b=i0UlwVB1WpAnCAEzMjdnuhVmVWw+alk0UHoGnNRyaCtmDzHpp+EcL9zK
 22femVSxTmdyU9CpP7hI+j2unKfUxtzPTKVC0OHRgd6k2hO69QB7qF9Aq
 1hOZeNLT99HScdx4UjJqqUulfQusF6pLz0vMF4Hj87QWscFGcAmU/MPbZ
 1LMKs6qzVoWzKJ3BeGYTyYt+ZFw+08JpiXyJ10gFzfEbDFSHnOWBbLhWb
 tQl7cuRb03/nRW6j5NKdzinJnb5mmbMwwXIqYiRIAXcENywZ3W4YmogE7
 1uXpgTpNJAHWBktdAoB4bh499fkz64d7c1x4yOXiTaWST0/HjkFNDNbHT A==;
X-CSE-ConnectionGUID: 99GNzuUwRraoqYdK1UT0Cw==
X-CSE-MsgGUID: ltGUSzOoQKqNnDbski8Z3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84460881"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="84460881"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 11:15:48 -0700
X-CSE-ConnectionGUID: Csp7rxWVQqS+XRgKe3KFWw==
X-CSE-MsgGUID: 80qB1FPgSvWOwYwLPIVpyg==
X-ExtLoop1: 1
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by fmviesa003.fm.intel.com with ESMTP; 13 Jul 2026 11:15:47 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com,
	naresh.kumar.g@intel.com
Subject: [PATCH v5 5/7] drm/xe/vm: propagate BO page-size requirements to VMA
 map flags
Date: Mon, 13 Jul 2026 23:46:03 +0530
Message-ID: <20260713181605.3127204-6-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713181605.3127204-1-naresh.kumar.g@intel.com>
References: <20260713181605.3127204-1-naresh.kumar.g@intel.com>
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

Propagate user BO page-size requirement flags into VM bind map
operations.

When a user BO carries a page-size requirement flag, set the
corresponding VMA PTE flag during bind-op construction. This covers
64K, 2M, and 1G page sizes and allows the debug page-size allocation
policy selected at BO creation time to be reflected in page-table
mapping behavior.

v3
- BO page-size requirement overrides prior map-state flags
- reword commit message
v4
- address review feedback on XE_VMA_CREATE_MASK dependency
- carry 2M/1G request state in target_leaf_level instead of vma_flags
- propagate target_leaf_level from bind op to VMA state
- avoid using accumulated gpuva.flags as future bind policy input
v5
- v5:
- Reword the commit message to match the target_leaf_level-based
  implementation
- Clarify that BO page-size requirements are propagated through
  bind-op and VMA state

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c       | 29 +++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm_types.h |  9 +++++++++
 2 files changed, 38 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 080c2fff0e95..dcca70ed9141 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2390,6 +2390,23 @@ static void xe_svm_prefetch_gpuva_ops_fini(struct drm_gpuva_ops *ops)
 	}
 }
 
+static void xe_vma_apply_debug_page_size_flag(struct xe_vma_op *op,
+					      struct xe_bo *bo)
+{
+	if (!bo)
+		return;
+
+	if (!(bo->flags & XE_BO_FLAG_USER))
+		return;
+
+	op->map.target_leaf_level = 0;
+
+	if (bo->flags & XE_BO_FLAG_NEEDS_1G)
+		op->map.target_leaf_level = 2;
+	else if (bo->flags & XE_BO_FLAG_NEEDS_2M)
+		op->map.target_leaf_level = 1;
+}
+
 /*
  * Create operations list from IOCTL arguments, setup operations fields so parse
  * and commit steps are decoupled from IOCTL arguments. This step can fail.
@@ -2485,6 +2502,12 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 			op->map.pat_index = pat_index;
 			op->map.invalidate_on_bind =
 				__xe_vm_needs_clear_scratch_pages(vm, flags);
+			/*
+			 * Propagate debug BO page-size requirement into the VMA bind operation
+			 * for user BO binds.
+			 */
+			if (xe_debug_page_size_supported(vm->xe))
+				xe_vma_apply_debug_page_size_flag(op, bo);
 		} else if (__op->op == DRM_GPUVA_OP_PREFETCH) {
 			struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
 			struct xe_tile *tile;
@@ -2848,6 +2871,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 				if (IS_ERR(vma))
 					return PTR_ERR(vma);
 
+				vma->target_leaf_level = old->target_leaf_level;
+
 				op->remap.prev = vma;
 
 				/*
@@ -2878,6 +2903,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 				if (IS_ERR(vma))
 					return PTR_ERR(vma);
 
+				vma->target_leaf_level = old->target_leaf_level;
+
 				op->remap.next = vma;
 
 				/*
@@ -4762,6 +4789,7 @@ static int xe_vm_alloc_vma(struct xe_vm *vm,
 				 * unmapping.
 				 */
 				op->map.vma_flags |= vma_flags & XE_VMA_CREATE_MASK;
+				op->map.target_leaf_level = vma->target_leaf_level;
 			}
 		}
 		print_op(vm->xe, __op);
@@ -4808,6 +4836,7 @@ static int xe_vm_alloc_vma(struct xe_vm *vm,
 			 */
 			if (is_madvise)
 				xe_vma_mem_attr_copy(&vma->attr, &tmp_attr);
+			vma->target_leaf_level = op->map.target_leaf_level;
 		}
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 635ed29b9a69..c94328662dfc 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -174,6 +174,13 @@ struct xe_vma {
 	 * and encoding of the PTEs for this vma.
 	 */
 	struct xe_vma_mem_attr attr;
+	/**
+	 * @target_leaf_level: requested PT leaf level for this VMA
+	 *
+	 * 0 for normal 4K/64K mappings, 1 for 2M huge-page mappings,
+	 * and 2 for 1G huge-page mappings.
+	 */
+	u8 target_leaf_level;
 };
 
 /**
@@ -422,6 +429,8 @@ struct xe_vma_op_map {
 	bool request_decompress;
 	/** @pat_index: The pat index to use for this operation. */
 	u16 pat_index;
+	/** @target_leaf_level: requested PT leaf level for this operation */
+	u8 target_leaf_level;
 };
 
 /** struct xe_vma_op_remap - VMA remap operation */
-- 
2.43.0

