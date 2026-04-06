Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D0C4EF4EA4
	for <intel-xe@archiver.kernel.org>; Mon,  6 Apr 2026 08:58:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AEE510E218;
	Mon,  6 Apr 2026 08:58:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j2PH5Oiq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7794910E218
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Apr 2026 08:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775465926; x=1807001926;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=O/nmYLsQvYJiHhTRHrxYkjnTh0Q7jlUXYNXDAXXJuKM=;
 b=j2PH5OiqitHgdDvQ3tpjwh5a0tUPYpSQJnrzghYJh04GPOCX5kYdh3v6
 uIzvTlQ2tYP7GRqYwkJAYLo/7UyMLkTaIp8Io+MRZ8mwwBu8vS+0isNd2
 aeij+FhsFy5d///nKiGXy64btSJJ6m2wwxRL4Bl+kJi6e3PRqlCOeSXYV
 eTNZBkMF8Lap7sXz1VO6bsiB/kXiyM/tq3vBKqT1y48r+O+F4K2rvqyQJ
 H0hmB13uofu6sVMB5ONBqLKcDo666lo8vjelPca2P3QwPdlTiAqu8OFjB
 QtH+TJweaGKNFhCuBBrs8nYR5xYgcgo8spw9dGPa40lV6YVz4lY2ujRWE w==;
X-CSE-ConnectionGUID: Ucwkc3mgSS6qXuoxtvfEgw==
X-CSE-MsgGUID: 0FaT8MaoRtydfU5Y/24tew==
X-IronPort-AV: E=McAfee;i="6800,10657,11750"; a="80012885"
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="80012885"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 01:58:46 -0700
X-CSE-ConnectionGUID: Bd6TvKf2SaWB2+ZqE53oyw==
X-CSE-MsgGUID: GqUHld/yS6u37H9jz8h7Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="227775176"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 01:58:44 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com
Subject: [RFC v2 2/7] drm/xe/vm: Preserve cpu_autoreset_active across GPUVA
 operations
Date: Mon,  6 Apr 2026 14:28:25 +0530
Message-ID: <20260406085830.1118431-3-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260406085830.1118431-1-arvind.yadav@intel.com>
References: <20260406085830.1118431-1-arvind.yadav@intel.com>
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

GPUVA split and remap rebuild VMAs using XE_VMA_CREATE_MASK, which does
not carry runtime-only state. Forward XE_VMA_CPU_AUTORESET_ACTIVE through
the pipeline so xe_vma_create() restores cpu_autoreset_active in the new
VMA.

Also preserve the effective PAT index on REMAP so madvise-applied
overrides survive splits.

Relax XE_WARN_ON in the UNMAP path to allow non-default attributes on
cpu_autoreset_active VMAs.

Add xe_vma_effective_create_flags() to centralise flag propagation.

v2:
  - Move runtime state to xe_vma bool and keep
    XE_VMA_CPU_AUTORESET_ACTIVE as pipeline-only. (Matt)
  - Add xe_vma_effective_create_flags() to centralise flag handling.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 52 +++++++++++++++++++++++++++++++++-----
 1 file changed, 45 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 2408b547ca3d..65425f2f1bf1 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1106,7 +1106,9 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 	vma->gpuva.vm = &vm->gpuvm;
 	vma->gpuva.va.addr = start;
 	vma->gpuva.va.range = end - start + 1;
-	vma->gpuva.flags = flags;
+	/* Pipeline-only; runtime state lives in vma->cpu_autoreset_active. */
+	vma->gpuva.flags = flags & ~XE_VMA_CPU_AUTORESET_ACTIVE;
+	vma->cpu_autoreset_active = !!(flags & XE_VMA_CPU_AUTORESET_ACTIVE);
 
 	for_each_tile(tile, vm->xe, id)
 		vma->tile_mask |= 0x1 << id;
@@ -2454,8 +2456,10 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 				op->map.vma_flags |= XE_VMA_SYSTEM_ALLOCATOR;
 			if (flags & DRM_XE_VM_BIND_FLAG_DUMPABLE)
 				op->map.vma_flags |= XE_VMA_DUMPABLE;
-			if (flags & DRM_XE_VM_BIND_FLAG_MADVISE_AUTORESET)
+			if (flags & DRM_XE_VM_BIND_FLAG_MADVISE_AUTORESET) {
 				op->map.vma_flags |= XE_VMA_MADV_AUTORESET;
+				op->map.vma_flags |= XE_VMA_CPU_AUTORESET_ACTIVE;
+			}
 			op->map.request_decompress = flags & DRM_XE_VM_BIND_FLAG_DECOMPRESS;
 			op->map.pat_index = pat_index;
 			op->map.invalidate_on_bind =
@@ -2775,6 +2779,12 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 			};
 
 			flags |= op->map.vma_flags & XE_VMA_CREATE_MASK;
+			/*
+			 * Pipeline-only flag; forward explicitly so xe_vma_create()
+			 * restores state.
+			 */
+			if (op->map.vma_flags & XE_VMA_CPU_AUTORESET_ACTIVE)
+				flags |= XE_VMA_CPU_AUTORESET_ACTIVE;
 
 			vma = new_vma(vm, &op->base.map, &default_attr,
 				      flags);
@@ -2817,6 +2827,10 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 			op->remap.old_range = op->remap.range;
 
 			flags |= op->base.remap.unmap->va->flags & XE_VMA_CREATE_MASK;
+			/* Pipeline-only; forward explicitly. */
+			if (xe_vma_has_cpu_autoreset_active(old))
+				flags |= XE_VMA_CPU_AUTORESET_ACTIVE;
+
 			if (op->base.remap.prev) {
 				vma = new_vma(vm, op->base.remap.prev,
 					      &old->attr, flags);
@@ -4659,6 +4673,20 @@ int xe_vma_need_vram_for_atomic(struct xe_device *xe, struct xe_vma *vma, bool i
 	}
 }
 
+/*
+ * Returns vma->gpuva.flags with XE_VMA_CPU_AUTORESET_ACTIVE injected if
+ * the runtime state is set, for passing through MAP/REMAP pipelines.
+ */
+static unsigned int xe_vma_effective_create_flags(struct xe_vma *vma)
+{
+	unsigned int flags = vma->gpuva.flags;
+
+	if (xe_vma_has_cpu_autoreset_active(vma))
+		flags |= XE_VMA_CPU_AUTORESET_ACTIVE;
+
+	return flags;
+}
+
 static int xe_vm_alloc_vma(struct xe_vm *vm,
 			   struct drm_gpuvm_map_req *map_req,
 			   bool is_madvise)
@@ -4694,19 +4722,25 @@ static int xe_vm_alloc_vma(struct xe_vm *vm,
 		if (!is_madvise) {
 			if (__op->op == DRM_GPUVA_OP_UNMAP) {
 				vma = gpuva_to_vma(op->base.unmap.va);
-				XE_WARN_ON(!xe_vma_has_default_mem_attrs(vma));
+				/* Attributes must be default on UNMAP; CPU-only VMAs are exempt. */
+				XE_WARN_ON(!xe_vma_has_default_mem_attrs(vma) &&
+					   !xe_vma_has_cpu_autoreset_active(vma));
 				default_pat = vma->attr.default_pat_index;
-				vma_flags = vma->gpuva.flags;
+				vma_flags = xe_vma_effective_create_flags(vma);
 			}
 
 			if (__op->op == DRM_GPUVA_OP_REMAP) {
 				vma = gpuva_to_vma(op->base.remap.unmap->va);
-				default_pat = vma->attr.default_pat_index;
-				vma_flags = vma->gpuva.flags;
+				/* Preserve current PAT index, not default, for remap */
+				default_pat = vma->attr.pat_index;
+				vma_flags = xe_vma_effective_create_flags(vma);
 			}
 
 			if (__op->op == DRM_GPUVA_OP_MAP) {
 				op->map.vma_flags |= vma_flags & XE_VMA_CREATE_MASK;
+				/* Pipeline-only; forward explicitly. */
+				if (vma_flags & XE_VMA_CPU_AUTORESET_ACTIVE)
+					op->map.vma_flags |= XE_VMA_CPU_AUTORESET_ACTIVE;
 				op->map.pat_index = default_pat;
 			}
 		} else {
@@ -4715,10 +4749,11 @@ static int xe_vm_alloc_vma(struct xe_vm *vm,
 				xe_assert(vm->xe, !remap_op);
 				xe_assert(vm->xe, xe_vma_has_no_bo(vma));
 				remap_op = true;
-				vma_flags = vma->gpuva.flags;
+				vma_flags = xe_vma_effective_create_flags(vma);
 			}
 
 			if (__op->op == DRM_GPUVA_OP_MAP) {
+				/* Madvise MAP follows REMAP (split/merge). */
 				xe_assert(vm->xe, remap_op);
 				remap_op = false;
 				/*
@@ -4728,6 +4763,9 @@ static int xe_vm_alloc_vma(struct xe_vm *vm,
 				 * unmapping.
 				 */
 				op->map.vma_flags |= vma_flags & XE_VMA_CREATE_MASK;
+				/* Pipeline-only; forward explicitly. */
+				if (vma_flags & XE_VMA_CPU_AUTORESET_ACTIVE)
+					op->map.vma_flags |= XE_VMA_CPU_AUTORESET_ACTIVE;
 			}
 		}
 		print_op(vm->xe, __op);
-- 
2.43.0

