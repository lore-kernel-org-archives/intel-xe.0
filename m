Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA86FCAC59A
	for <intel-xe@archiver.kernel.org>; Thu, 18 Sep 2025 07:32:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A99C710E664;
	Thu, 18 Sep 2025 07:32:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZHQi0FtX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6650F10E664
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Sep 2025 07:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758180734; x=1789716734;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6X5afintEaRsnWBIpr4RlHvAyWzclJL7IaeDjzWcwpo=;
 b=ZHQi0FtXbaaam562ncMmEU0kqBMPtJ1i01kM+6Lwhbv2deEXVHr5I/y8
 IIhVcR7gmaYhJ1DrAINEUHyootaax9Jg+1r1WL1oSx83byH1NEqM7injv
 gCowYt4smhXErj5FFZcktd6pc402f7624OGbZa/D0V81S1uY4pfIOuk3d
 3pe7s0lAkGTQfJBkuBN7ukhAxBoRdi/ktAqeENIo+Jnm2AMoy6wEQUsds
 CiRlfLwdPISwnmfyudK+rnA9NH8UahjIrRb57GS5ZYL+i4QZFKw40aaMD
 GEWMfwISTE64bua5MDtf1jJKzDmx+0twvoqZTnj7VY2jyFdRgD7DiQPnO A==;
X-CSE-ConnectionGUID: JjTnl6wKTAmgl6ITBVC5sA==
X-CSE-MsgGUID: uOm3cdiVSGCOSayx2U7VsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="71132719"
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; d="scan'208";a="71132719"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 00:32:14 -0700
X-CSE-ConnectionGUID: sp43MPSASI6S2AyM9zxgCA==
X-CSE-MsgGUID: ZezoxAWGTUeZJ+eDURqTYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; d="scan'208";a="174587631"
Received: from himal-super-server.iind.intel.com ([10.190.239.34])
 by orviesa006.jf.intel.com with ESMTP; 18 Sep 2025 00:32:13 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH 1/2] drm/xe/pat: Improve PAT index handling in xe_vma_mem_attr
Date: Thu, 18 Sep 2025 13:30:02 +0530
Message-Id: <20250918080003.153906-2-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250918080003.153906-1-himal.prasad.ghimiray@intel.com>
References: <20250918080003.153906-1-himal.prasad.ghimiray@intel.com>
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

Replaced flat PAT index fields with a structured format to support
separate indices for system memory, local VRAM, and remote GPU memory.

This allows KMD to handle multiple PAT indices passed via madvise, which
are used to encode PTEs based on memory location. Defaults to 'initial'
unless overridden.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c         |  3 ++-
 drivers/gpu/drm/xe/xe_svm.c        | 21 +++++++++---------
 drivers/gpu/drm/xe/xe_vm.c         | 25 ++++++++++++++++------
 drivers/gpu/drm/xe/xe_vm_madvise.c |  9 ++++++--
 drivers/gpu/drm/xe/xe_vm_types.h   | 34 ++++++++++++++++++++----------
 5 files changed, 61 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index a1c88f9a6c76..b984854d09a6 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -522,7 +522,6 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
 {
 	struct xe_pt_stage_bind_walk *xe_walk =
 		container_of(walk, typeof(*xe_walk), base);
-	u16 pat_index = xe_walk->vma->attr.pat_index;
 	struct xe_pt *xe_parent = container_of(parent, typeof(*xe_parent), base);
 	struct xe_vm *vm = xe_walk->vm;
 	struct xe_pt *xe_child;
@@ -535,6 +534,8 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
 		struct xe_res_cursor *curs = xe_walk->curs;
 		bool is_null = xe_vma_is_null(xe_walk->vma);
 		bool is_vram = is_null ? false : xe_res_is_vram(curs);
+		u16 pat_index = is_vram ? xe_walk->vma->attr.pat_index.devmem
+					: xe_walk->vma->attr.pat_index.smem;
 
 		XE_WARN_ON(xe_walk->va_curs_start != addr);
 
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 7f2f1f041f1d..90027eb27a1e 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -291,16 +291,19 @@ static int __xe_svm_garbage_collector(struct xe_vm *vm,
 	return 0;
 }
 
+static void xe_vma_set_default_attributes(struct xe_vma *vma)
+{
+	vma->attr.preferred_loc.devmem_fd = DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE;
+	vma->attr.preferred_loc.migration_policy = DRM_XE_MIGRATE_ALL_PAGES;
+	vma->attr.pat_index.smem = vma->attr.pat_index.initial;
+	vma->attr.pat_index.devmem = vma->attr.pat_index.initial;
+	vma->attr.pat_index.remote = vma->attr.pat_index.initial;
+	vma->attr.atomic_access = DRM_XE_ATOMIC_UNDEFINED;
+}
+
 static int xe_svm_range_set_default_attr(struct xe_vm *vm, u64 range_start, u64 range_end)
 {
 	struct xe_vma *vma;
-	struct xe_vma_mem_attr default_attr = {
-		.preferred_loc = {
-			.devmem_fd = DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE,
-			.migration_policy = DRM_XE_MIGRATE_ALL_PAGES,
-		},
-		.atomic_access = DRM_XE_ATOMIC_UNDEFINED,
-	};
 	int err = 0;
 
 	vma = xe_vm_find_vma_by_addr(vm, range_start);
@@ -314,9 +317,7 @@ static int xe_svm_range_set_default_attr(struct xe_vm *vm, u64 range_start, u64
 	       xe_vma_start(vma), xe_vma_end(vma));
 
 	if (xe_vma_start(vma) == range_start && xe_vma_end(vma) == range_end) {
-		default_attr.pat_index = vma->attr.default_pat_index;
-		default_attr.default_pat_index  = vma->attr.default_pat_index;
-		vma->attr = default_attr;
+		xe_vma_set_default_attributes(vma);
 	} else {
 		vm_dbg(&vm->xe->drm, "Split VMA start=0x%016llx, vma_end=0x%016llx",
 		       range_start, range_end);
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 0cacab20ff85..6122061786f6 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2003,7 +2003,10 @@ static int get_mem_attrs(struct xe_vm *vm, u32 *num_vmas, u64 start,
 		attrs[i].start = xe_vma_start(vma);
 		attrs[i].end = xe_vma_end(vma);
 		attrs[i].atomic.val = vma->attr.atomic_access;
-		attrs[i].pat_index.val = vma->attr.pat_index;
+
+		/* TODO: Modify drm_xe_mem_range_attr for all pats */
+		attrs[i].pat_index.val = vma->attr.pat_index.initial;
+
 		attrs[i].preferred_mem_loc.devmem_fd = vma->attr.preferred_loc.devmem_fd;
 		attrs[i].preferred_mem_loc.migration_policy =
 		vma->attr.preferred_loc.migration_policy;
@@ -2540,7 +2543,9 @@ static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
  * it checks the following conditions:
  *
  * - `atomic_access` is `DRM_XE_VMA_ATOMIC_UNDEFINED`
- * - `pat_index` is equal to `default_pat_index`
+ * - `pat_index.smem` is equal to `pat_index.initial`
+ * - `pat_index.devmem` is equal to `pat_index.initial`
+ * - `pat_index.remote` is equal to `pat_index.initial`
  * - `preferred_loc.devmem_fd` is `DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE`
  * - `preferred_loc.migration_policy` is `DRM_XE_MIGRATE_ALL_PAGES`
  *
@@ -2549,7 +2554,9 @@ static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
 bool xe_vma_has_default_mem_attrs(struct xe_vma *vma)
 {
 	return (vma->attr.atomic_access == DRM_XE_ATOMIC_UNDEFINED &&
-		vma->attr.pat_index ==  vma->attr.default_pat_index &&
+		vma->attr.pat_index.smem ==  vma->attr.pat_index.initial &&
+		vma->attr.pat_index.devmem ==  vma->attr.pat_index.initial &&
+		vma->attr.pat_index.remote ==  vma->attr.pat_index.initial &&
 		vma->attr.preferred_loc.devmem_fd == DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE &&
 		vma->attr.preferred_loc.migration_policy == DRM_XE_MIGRATE_ALL_PAGES);
 }
@@ -2585,9 +2592,13 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 					.devmem_fd = DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE,
 					.migration_policy = DRM_XE_MIGRATE_ALL_PAGES,
 				},
+				.pat_index = {
+					.initial = op->map.pat_index,
+					.smem = op->map.pat_index,
+					.devmem = op->map.pat_index,
+					.remote = op->map.pat_index,
+				},
 				.atomic_access = DRM_XE_ATOMIC_UNDEFINED,
-				.default_pat_index = op->map.pat_index,
-				.pat_index = op->map.pat_index,
 			};
 
 			flags |= op->map.read_only ?
@@ -4226,12 +4237,12 @@ static int xe_vm_alloc_vma(struct xe_vm *vm,
 			if (__op->op == DRM_GPUVA_OP_UNMAP) {
 				vma = gpuva_to_vma(op->base.unmap.va);
 				XE_WARN_ON(!xe_vma_has_default_mem_attrs(vma));
-				default_pat = vma->attr.default_pat_index;
+				default_pat = vma->attr.pat_index.initial;
 			}
 
 			if (__op->op == DRM_GPUVA_OP_REMAP) {
 				vma = gpuva_to_vma(op->base.remap.unmap->va);
-				default_pat = vma->attr.default_pat_index;
+				default_pat = vma->attr.pat_index.initial;
 			}
 
 			if (__op->op == DRM_GPUVA_OP_MAP) {
diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index cad3cf627c3f..e3f0cf23a3a9 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -149,11 +149,16 @@ static void madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
 	xe_assert(vm->xe, op->type == DRM_XE_MEM_RANGE_ATTR_PAT);
 
 	for (i = 0; i < num_vmas; i++) {
-		if (vmas[i]->attr.pat_index == op->pat_index.val) {
+		/*TODO : Pass different pat_indexes from ioctl */
+		if (vmas[i]->attr.pat_index.smem == op->pat_index.val &&
+		    vmas[i]->attr.pat_index.devmem == op->pat_index.val &&
+		    vmas[i]->attr.pat_index.remote == op->pat_index.val) {
 			vmas[i]->skip_invalidation = true;
 		} else {
 			vmas[i]->skip_invalidation = false;
-			vmas[i]->attr.pat_index = op->pat_index.val;
+			vmas[i]->attr.pat_index.smem = op->pat_index.val;
+			vmas[i]->attr.pat_index.devmem = op->pat_index.val;
+			vmas[i]->attr.pat_index.remote =  op->pat_index.val;
 		}
 	}
 }
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index da39940501d8..94dea8c263ed 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -65,6 +65,29 @@ struct xe_vma_mem_attr {
 		u32 devmem_fd;
 	} preferred_loc;
 
+	/** @pat_index: The pat index to encode the PTEs for this vma */
+	struct {
+		/** @initial: The pat index set during first bind by user. */
+		u16 initial;
+		/**
+		 * @smem: Used for encoding when pages are in system memory.
+		 * same as initial unless overwritten by madvise.
+		 */
+		u16 smem;
+
+		/**
+		 * @devmem: Used for encoding when pages are in local vram.
+		 * same as initial unless overwritten by madvise.
+		 */
+		u16 devmem;
+
+		/**
+		 * @remote: Used for encoding when pages are in remote gpu vram.
+		 * same as initial unless overwritten by madvise.
+		 */
+		u16 remote;
+	} pat_index;
+
 	/**
 	 * @atomic_access: The atomic access type for the vma
 	 * See %DRM_XE_VMA_ATOMIC_UNDEFINED, %DRM_XE_VMA_ATOMIC_DEVICE,
@@ -72,17 +95,6 @@ struct xe_vma_mem_attr {
 	 * values. These are defined in uapi/drm/xe_drm.h.
 	 */
 	u32 atomic_access;
-
-	/**
-	 * @default_pat_index: The pat index for VMA set during first bind by user.
-	 */
-	u16 default_pat_index;
-
-	/**
-	 * @pat_index: The pat index to use when encoding the PTEs for this vma.
-	 * same as default_pat_index unless overwritten by madvise.
-	 */
-	u16 pat_index;
 };
 
 struct xe_vma {
-- 
2.34.1

