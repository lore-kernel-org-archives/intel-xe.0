Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FB91CCD18E
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 08:28:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5F0410E57C;
	Tue, 14 Oct 2025 08:28:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F8NhyBkU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0290E10E57A
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 08:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760430506; x=1791966506;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VBiNoBITHDoJjgDj2+1dedoAWBNVln/4IPcY5QCbdTc=;
 b=F8NhyBkUoYUA1UB3ZC0AcPsq7xeBJycfXFEXalE/TfGdcrUE7yDVgin8
 Aj0vGWAUvlE4iHpCtKOmPQUFIFVl/GIcA6O8c4w31dTex8dNw4bxrTlJ8
 7Vf+iGAGKJyJK9hgiTqd6SI4Y64NtIqKvjv+er9b9JJf6gzfuINElbbpX
 d0U8HQQu1wcGK7SlURP8TAcPczXGfD28n6pIsjvm/kAYqWQKl8NqAUVcc
 pevQINKY5A5MWxBeBxKFuvgNIZjbyy8Gje7UfNgO7DPGIzjZw6hJyYl9Z
 D821GmXkOxlG8uSiQTM02peO8uD0IsyggKu/V2AIiZzC6Fim60+ZrU/XD g==;
X-CSE-ConnectionGUID: wOlc9DWaTPKTEc6zwpJ04Q==
X-CSE-MsgGUID: F175y621RcqPQcL7A73Xsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="62619589"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="62619589"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 01:28:26 -0700
X-CSE-ConnectionGUID: PSNjAcP/R2CC/B+ZT8Zjsg==
X-CSE-MsgGUID: a67UUhUoRYihGZcXSXXxow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="218966751"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO fedora)
 ([10.245.244.172])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 01:28:24 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 "Falkowski, John" <john.falkowski@intel.com>,
 "Mrozek, Michal" <michal.mrozek@intel.com>
Subject: [PATCH 2/2] drm/xe/uapi: Hide the madvise autoreset behind a VM_BIND
 flag
Date: Tue, 14 Oct 2025 10:27:56 +0200
Message-ID: <20251014082756.6858-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251014082756.6858-1-thomas.hellstrom@linux.intel.com>
References: <20251014082756.6858-1-thomas.hellstrom@linux.intel.com>
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

The madvise implementation currently resets the SVM madvise if the
underlying CPU map is unmapped. This is in an attempt to mimic the
CPU madvice behaviour. However, it's not clear that this is a desired
behaviour since if the end app user relies on it for malloc()ed
objects or stack objects, it may not work as intended.

Instead of having the autoreset functionality being a direct
application-facing implicit UAPI, make the UMD explicitly choose
this behaviour if it wants to expose it by introducing
DRM_XE_VM_BIND_FLAG_MADVISE_AUTORESET, and add a semantics
description.

Fixes: a2eb8aec3ebe ("drm/xe: Reset VMA attributes to default in SVM garbage collector")
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: "Falkowski, John" <john.falkowski@intel.com>
Cc: "Mrozek, Michal" <michal.mrozek@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c      |  5 +++++
 drivers/gpu/drm/xe/xe_vm.c       | 12 +++++++++---
 drivers/gpu/drm/xe/xe_vm_types.h |  1 +
 include/uapi/drm/xe_drm.h        | 15 +++++++++++++++
 4 files changed, 30 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index b268ee0d2271..f8773cbc2025 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -302,6 +302,11 @@ static int xe_svm_range_set_default_attr(struct xe_vm *vm, u64 range_start, u64
 	if (!vma)
 		return -EINVAL;
 
+	if (!(vma->gpuva.flags & XE_VMA_MADV_AUTORESET)) {
+		drm_dbg(&vm->xe->drm, "Skipping madvise reset for vma.\n");
+		return 0;
+	}
+
 	if (xe_vma_has_default_mem_attrs(vma))
 		return 0;
 
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 9c29608aa3bc..d8a9d8090b37 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -646,7 +646,8 @@ static void xe_vma_ops_incr_pt_update_ops(struct xe_vma_ops *vops, u8 tile_mask,
 	XE_VMA_READ_ONLY |		    \
 	XE_VMA_DUMPABLE |		    \
 	XE_VMA_SYSTEM_ALLOCATOR |           \
-	DRM_GPUVA_SPARSE)
+	DRM_GPUVA_SPARSE |		    \
+	XE_VMA_MADV_AUTORESET)
 
 static void xe_vm_populate_rebind(struct xe_vma_op *op, struct xe_vma *vma,
 				  u8 tile_mask)
@@ -2296,6 +2297,8 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 				op->map.vma_flags |= XE_VMA_SYSTEM_ALLOCATOR;
 			if (flags & DRM_XE_VM_BIND_FLAG_DUMPABLE)
 				op->map.vma_flags |= XE_VMA_DUMPABLE;
+			if (flags & DRM_XE_VM_BIND_FLAG_MADVISE_AUTORESET)
+				op->map.vma_flags |= XE_VMA_MADV_AUTORESET;
 			op->map.pat_index = pat_index;
 			op->map.invalidate_on_bind =
 				__xe_vm_needs_clear_scratch_pages(vm, flags);
@@ -3279,7 +3282,8 @@ ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_execute, ERRNO);
 	 DRM_XE_VM_BIND_FLAG_NULL | \
 	 DRM_XE_VM_BIND_FLAG_DUMPABLE | \
 	 DRM_XE_VM_BIND_FLAG_CHECK_PXP | \
-	 DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR)
+	 DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR | \
+	 DRM_XE_VM_BIND_FLAG_MADVISE_AUTORESET)
 
 #ifdef TEST_VM_OPS_ERROR
 #define SUPPORTED_FLAGS	(SUPPORTED_FLAGS_STUB | FORCE_OP_ERROR)
@@ -3394,7 +3398,9 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
 		    XE_IOCTL_DBG(xe,  (prefetch_region != DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC &&
 				       !(BIT(prefetch_region) & xe->info.mem_region_mask))) ||
 		    XE_IOCTL_DBG(xe, obj &&
-				 op == DRM_XE_VM_BIND_OP_UNMAP)) {
+				 op == DRM_XE_VM_BIND_OP_UNMAP) ||
+		    XE_IOCTL_DBG(xe, (flags & DRM_XE_VM_BIND_FLAG_MADVISE_AUTORESET) &&
+				 (!is_cpu_addr_mirror || op != DRM_XE_VM_BIND_OP_MAP))) {
 			err = -EINVAL;
 			goto free_bind_ops;
 		}
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index a3b422b27ae8..d6e2a0fdd4b3 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -46,6 +46,7 @@ struct xe_vm_pgtable_update_op;
 #define XE_VMA_PTE_COMPACT	(DRM_GPUVA_USERBITS << 7)
 #define XE_VMA_DUMPABLE		(DRM_GPUVA_USERBITS << 8)
 #define XE_VMA_SYSTEM_ALLOCATOR	(DRM_GPUVA_USERBITS << 9)
+#define XE_VMA_MADV_AUTORESET	(DRM_GPUVA_USERBITS << 10)
 
 /**
  * struct xe_vma_mem_attr - memory attributes associated with vma
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 40ff19f52a8d..98bc8858e4bd 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1013,6 +1013,20 @@ struct drm_xe_vm_destroy {
  *    valid on VMs with DRM_XE_VM_CREATE_FLAG_FAULT_MODE set. The CPU address
  *    mirror flag are only valid for DRM_XE_VM_BIND_OP_MAP operations, the BO
  *    handle MBZ, and the BO offset MBZ.
+ *  - %DRM_XE_VM_BIND_FLAG_MADVISE_AUTORESET - Can be used in combination with
+ *    %DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR to reset madvises when the underlying
+ *    CPU address space range is unmapped (typically with munmap(2) or brk(2)).
+ *    The madvise values set with %DRM_IOCTL_XE_MADVISE are reset to the values
+ *    that were present immediately after the %DRM_IOCTL_XE_VM_BIND.
+ *    The reset GPU virtual address range is the intersection of the range bound
+ *    using %DRM_IOCTL_XE_VM_BIND and the virtual CPU address space range
+ *    unmapped.
+ *    This functionality is present to mimic the behaviour of CPU address space
+ *    madvises set using madvise(2), which are typically reset on unmap.
+ *    Note: free(3) may or may not call munmap(2) and/or brk(2), and may thus
+ *    not invoke autoreset. Neither will stack variables going out of scope.
+ *    Therefore it's recommended to always explicitly reset the madvises when
+ *    freeing the memory backing a region used in a %DRM_IOCTL_XE_MADVISE call.
  *
  * The @prefetch_mem_region_instance for %DRM_XE_VM_BIND_OP_PREFETCH can also be:
  *  - %DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC, which ensures prefetching occurs in
@@ -1119,6 +1133,7 @@ struct drm_xe_vm_bind_op {
 #define DRM_XE_VM_BIND_FLAG_DUMPABLE	(1 << 3)
 #define DRM_XE_VM_BIND_FLAG_CHECK_PXP	(1 << 4)
 #define DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR	(1 << 5)
+#define DRM_XE_VM_BIND_FLAG_MADVISE_AUTORESET	(1 << 6)
 	/** @flags: Bind flags */
 	__u32 flags;
 
-- 
2.51.0

