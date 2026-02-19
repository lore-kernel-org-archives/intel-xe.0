Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E51E7E9A04C
	for <intel-xe@archiver.kernel.org>; Thu, 19 Feb 2026 09:13:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85E3610E280;
	Thu, 19 Feb 2026 09:13:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f07WKPZb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE5D610E1EC
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Feb 2026 09:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771492408; x=1803028408;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sE7cR3Z32cbw9T9VpO6E9uWHdJrUmhKAPm3zUGnunyA=;
 b=f07WKPZb1asbPYp2lkrjb6CPNNzPfPxI2GovGxbKW8CSBChMPHcbRoDK
 nSDVw7OnSWKChRZ9H5zTJ29GOaCxy9F6iuDBrHwpX3a82MAqkcAKAdHTo
 zf8IQZOiZ+XAoOH9jzrxkBe6BUOvxsCSqpUchIxxSJ66ws5uiIFkcmCxz
 By96aL73J09QWvXckTc6Q1RJV/FkYCHTEvff8MFnZQFgHwUUUohX12Mid
 +sEwfG6gNzsZ6SXqqhDX+mvYdLuB9npznh2hBa3od44kgOwUxb9Uzoeon
 y0lkm8ELwX7TN804WGIF3F3VWGIANmRd7/Drb9b3dOVjG/n0XJsyVIXSm A==;
X-CSE-ConnectionGUID: OgKux6vHT5WzN7RrzBujiQ==
X-CSE-MsgGUID: 9B0UpK+AQyqa7k4IVy+OMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="72637310"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="72637310"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 01:13:28 -0800
X-CSE-ConnectionGUID: kM6TSuVhTaa1sgyRZIs3CA==
X-CSE-MsgGUID: j/HaCQ3cRwW5AwPBY4Ju+A==
X-ExtLoop1: 1
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 01:13:27 -0800
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com
Subject: [RFC 2/7] drm/xe/vm: Preserve CPU_AUTORESET_ACTIVE across GPUVA
 operations
Date: Thu, 19 Feb 2026 14:43:07 +0530
Message-ID: <20260219091312.796749-3-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260219091312.796749-1-arvind.yadav@intel.com>
References: <20260219091312.796749-1-arvind.yadav@intel.com>
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

GPUVA split/merge operations rebuild VMA flags from XE_VMA_CREATE_MASK.
While this preserves XE_VMA_MADV_AUTORESET, it drops runtime-only state
such as XE_VMA_CPU_AUTORESET_ACTIVE.

Preserve CPU_AUTORESET_ACTIVE when creating new VMAs during MAP/REMAP
so the CPU-only vs GPU-touched state survives VMA transformations.

Without this, split VMAs would lose their CPU-only state and be
incorrectly treated as GPU-touched.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 28 +++++++++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 8fe54a998385..152ee355e5c3 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2350,8 +2350,10 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 				op->map.vma_flags |= XE_VMA_SYSTEM_ALLOCATOR;
 			if (flags & DRM_XE_VM_BIND_FLAG_DUMPABLE)
 				op->map.vma_flags |= XE_VMA_DUMPABLE;
-			if (flags & DRM_XE_VM_BIND_FLAG_MADVISE_AUTORESET)
+			if (flags & DRM_XE_VM_BIND_FLAG_MADVISE_AUTORESET) {
 				op->map.vma_flags |= XE_VMA_MADV_AUTORESET;
+				op->map.vma_flags |= XE_VMA_CPU_AUTORESET_ACTIVE;
+			}
 			op->map.pat_index = pat_index;
 			op->map.invalidate_on_bind =
 				__xe_vm_needs_clear_scratch_pages(vm, flags);
@@ -2668,6 +2670,9 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 			};
 
 			flags |= op->map.vma_flags & XE_VMA_CREATE_MASK;
+			/* Preserve CPU_AUTORESET_ACTIVE (runtime-only). */
+			if (op->map.vma_flags & XE_VMA_CPU_AUTORESET_ACTIVE)
+				flags |= XE_VMA_CPU_AUTORESET_ACTIVE;
 
 			vma = new_vma(vm, &op->base.map, &default_attr,
 				      flags);
@@ -2708,6 +2713,10 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 			op->remap.range = xe_vma_size(old);
 
 			flags |= op->base.remap.unmap->va->flags & XE_VMA_CREATE_MASK;
+			/* Preserve CPU_AUTORESET_ACTIVE (runtime-only). */
+			if (op->base.remap.unmap->va->flags & XE_VMA_CPU_AUTORESET_ACTIVE)
+				flags |= XE_VMA_CPU_AUTORESET_ACTIVE;
+
 			if (op->base.remap.prev) {
 				vma = new_vma(vm, op->base.remap.prev,
 					      &old->attr, flags);
@@ -4409,19 +4418,28 @@ static int xe_vm_alloc_vma(struct xe_vm *vm,
 		if (!is_madvise) {
 			if (__op->op == DRM_GPUVA_OP_UNMAP) {
 				vma = gpuva_to_vma(op->base.unmap.va);
-				XE_WARN_ON(!xe_vma_has_default_mem_attrs(vma));
+				/*
+				 * For CPU_AUTORESET_ACTIVE VMAs, attributes may be mid-reset and
+				 * thus temporarily non-default.
+				 */
+				XE_WARN_ON(!xe_vma_has_default_mem_attrs(vma) &&
+					   !(vma->gpuva.flags & XE_VMA_CPU_AUTORESET_ACTIVE));
 				default_pat = vma->attr.default_pat_index;
 				vma_flags = vma->gpuva.flags;
 			}
 
 			if (__op->op == DRM_GPUVA_OP_REMAP) {
 				vma = gpuva_to_vma(op->base.remap.unmap->va);
-				default_pat = vma->attr.default_pat_index;
+				/* Preserve current PAT index, not default, for remap */
+				default_pat = vma->attr.pat_index;
 				vma_flags = vma->gpuva.flags;
 			}
 
 			if (__op->op == DRM_GPUVA_OP_MAP) {
 				op->map.vma_flags |= vma_flags & XE_VMA_CREATE_MASK;
+				/* Preserve CPU_AUTORESET_ACTIVE (runtime-only). */
+				if (vma_flags & XE_VMA_CPU_AUTORESET_ACTIVE)
+					op->map.vma_flags |= XE_VMA_CPU_AUTORESET_ACTIVE;
 				op->map.pat_index = default_pat;
 			}
 		} else {
@@ -4434,6 +4452,7 @@ static int xe_vm_alloc_vma(struct xe_vm *vm,
 			}
 
 			if (__op->op == DRM_GPUVA_OP_MAP) {
+				/* Madvise MAP follows REMAP (split/merge). */
 				xe_assert(vm->xe, remap_op);
 				remap_op = false;
 				/*
@@ -4443,6 +4462,9 @@ static int xe_vm_alloc_vma(struct xe_vm *vm,
 				 * unmapping.
 				 */
 				op->map.vma_flags |= vma_flags & XE_VMA_CREATE_MASK;
+				/* Preserve CPU_AUTORESET_ACTIVE (not in CREATE_MASK). */
+				if (vma_flags & XE_VMA_CPU_AUTORESET_ACTIVE)
+					op->map.vma_flags |= XE_VMA_CPU_AUTORESET_ACTIVE;
 			}
 		}
 		print_op(vm->xe, __op);
-- 
2.43.0

