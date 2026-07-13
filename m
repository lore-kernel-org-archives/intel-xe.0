Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01D78C43458
	for <intel-xe@archiver.kernel.org>; Mon, 13 Jul 2026 02:27:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B115A10E52D;
	Mon, 13 Jul 2026 02:27:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CWZFDPOx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2E3710E52D
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Jul 2026 02:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783909668; x=1815445668;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=haw9xzXliuoqOTiXwGroE5/d0YajfY7f+FJNlSf3Sf0=;
 b=CWZFDPOxeYm8yUovp5UjMocab9YyQACk+GomJkMXwwS9vdHr/AaDazAN
 NTnzeAlh+nsX+XperitSH5VX/CLt7w470cjnma9Z2Ux5zsbgP8w96sJdV
 DaRZ7mjlped4qMjatDyRdB7dRqp9avsphFg24k61IPSFW1Tts5Oy1Ma4R
 wCaQuuZ0gR50ZUyYMCyi3k1PLuQzhUwWB/fpwiOUwObBFuhLXet1ehgUT
 Gjwfaugpi89+JSnzUcdGYnlHz6WFPmXxhaD7hjSKZ3CSKsI0G9BWEsB2s
 nXFYI18wC7ZleER4SXYsK4LlZof5CLh6dvCgkleldeLaDBP86G16CUn00 g==;
X-CSE-ConnectionGUID: HPHvbXQSSJWR0MgcZ06FMw==
X-CSE-MsgGUID: uZw2E0xcTa6ANXEL4C5TXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="88197455"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="88197455"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2026 19:27:48 -0700
X-CSE-ConnectionGUID: jq+u84sYSle9vdgHXly3ug==
X-CSE-MsgGUID: lEHwz5YAS8GWzex/DtZv7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="253680058"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by orviesa006.jf.intel.com with ESMTP; 12 Jul 2026 19:27:45 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com,
	naresh.kumar.g@intel.com
Subject: [PATCH v4 6/8] drm/xe/vm: propagate BO page-size requirements to VMA
 map flags
Date: Mon, 13 Jul 2026 07:55:39 +0530
Message-ID: <20260713022541.2581814-7-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713022541.2581814-1-naresh.kumar.g@intel.com>
References: <20260713022541.2581814-1-naresh.kumar.g@intel.com>
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

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c       | 23 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm_types.h |  9 +++++++++
 2 files changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 080c2fff0e95..503ed6984512 100644
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
@@ -2485,6 +2502,11 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 			op->map.pat_index = pat_index;
 			op->map.invalidate_on_bind =
 				__xe_vm_needs_clear_scratch_pages(vm, flags);
+			/*
+			 * Propagate debug BO page-size requirement into the VMA bind operation
+			 * for user BO binds.
+			 */
+			xe_vma_apply_debug_page_size_flag(op, bo);
 		} else if (__op->op == DRM_GPUVA_OP_PREFETCH) {
 			struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
 			struct xe_tile *tile;
@@ -4808,6 +4830,7 @@ static int xe_vm_alloc_vma(struct xe_vm *vm,
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

