Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 022E3C87FD4
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 12:34:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCB9A10E6A1;
	Wed, 30 Jul 2025 12:34:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WD4cIdta";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B1B310E695
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Jul 2025 12:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753878876; x=1785414876;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4aY2+gP3I2gOY8XXBt3xK26RgG0wcqqRyu644u+35ko=;
 b=WD4cIdtaa7KLNTrsj9kGjfkhV8FORoyh+z/nBij3AQrZ4g33Awzn2fag
 6UK5HFUtjmpFH2r8mxIwbi58/GQDaaBtwzJi8QpS2+1Q84mBckC3ByOhI
 XeyxQRt9Y6r3X2Q9boG+3rphc9MjlHa51IKIGLd96ZOIyYMfuhunXcQ0z
 oFtKMPJ8YmDxmU/CNUWIdaW4DvOXJCT65tamqcgoyXSHMIuNhL/WvD61u
 Wc+j5bXh+WazwI8x8IQNHzplfM+fdDirPWLaSblRRtv5NPBTAejIY+Zq6
 bLBuR7UsE7WhUapgaTEl0Ohh3yfML797/bgwxtLOn8xTXOzYjiEv/HjYE w==;
X-CSE-ConnectionGUID: nod/BJkXRNCxlrh4zGNDNg==
X-CSE-MsgGUID: 813Ib30VRK24yTj4IA1QOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="66450189"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="66450189"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 05:34:36 -0700
X-CSE-ConnectionGUID: SeNc8rgvTVO9nxn3Gvy8pQ==
X-CSE-MsgGUID: B5DKfvhHR4G0Eq6ZrhpJtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="186649512"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa002.fm.intel.com with ESMTP; 30 Jul 2025 05:34:35 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v5 21/25] drm/xe/madvise: Skip vma invalidation if mem attr
 are unchanged
Date: Wed, 30 Jul 2025 18:30:46 +0530
Message-Id: <20250730130050.1001648-22-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250730130050.1001648-1-himal.prasad.ghimiray@intel.com>
References: <20250730130050.1001648-1-himal.prasad.ghimiray@intel.com>
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

If a VMA within the madvise input range already has the same memory
attribute as the one requested by the user, skip PTE zapping for that
VMA to avoid unnecessary invalidation.

v2 (Matthew Brost)
- fix skip_invalidation for new attributes
- s/u32/bool
- Remove unnecessary assignment  for kzalloc'ed

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm_madvise.c | 60 +++++++++++++++++++++---------
 drivers/gpu/drm/xe/xe_vm_types.h   |  6 +++
 2 files changed, 49 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index 16ab1267ad21..99fec6793e41 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -85,16 +85,24 @@ static void madvise_preferred_mem_loc(struct xe_device *xe, struct xe_vm *vm,
 
 	for (i = 0; i < num_vmas; i++) {
 		/*TODO: Extend attributes to bo based vmas */
-		if (!xe_vma_is_cpu_addr_mirror(vmas[i]))
+		if (!xe_vma_is_cpu_addr_mirror(vmas[i])) {
+			vmas[i]->skip_invalidation = true;
 			continue;
+		}
 
-		vmas[i]->attr.preferred_loc.devmem_fd = op->preferred_mem_loc.devmem_fd;
-
-		/* Till multi-device support is not added migration_policy
-		 * is of no use and can be ignored.
-		 */
-		vmas[i]->attr.preferred_loc.migration_policy =
+		if (vmas[i]->attr.preferred_loc.devmem_fd == op->preferred_mem_loc.devmem_fd &&
+		    vmas[i]->attr.preferred_loc.migration_policy ==
+		    op->preferred_mem_loc.migration_policy) {
+			vmas[i]->skip_invalidation = true;
+		} else {
+			vmas[i]->skip_invalidation = false;
+			vmas[i]->attr.preferred_loc.devmem_fd = op->preferred_mem_loc.devmem_fd;
+			/* Till multi-device support is not added migration_policy
+			 * is of no use and can be ignored.
+			 */
+			vmas[i]->attr.preferred_loc.migration_policy =
 						op->preferred_mem_loc.migration_policy;
+		}
 	}
 }
 
@@ -111,8 +119,17 @@ static void madvise_atomic(struct xe_device *xe, struct xe_vm *vm,
 	for (i = 0; i < num_vmas; i++) {
 		if (xe_vma_is_userptr(vmas[i])) {
 			if (!(op->atomic.val == DRM_XE_ATOMIC_DEVICE &&
-			      xe->info.has_device_atomics_on_smem))
+			    xe->info.has_device_atomics_on_smem)) {
+				vmas[i]->skip_invalidation = true;
 				continue;
+			}
+		}
+
+		if (vmas[i]->attr.atomic_access == op->atomic.val) {
+			vmas[i]->skip_invalidation = true;
+		} else {
+			vmas[i]->skip_invalidation = false;
+			vmas[i]->attr.atomic_access = op->atomic.val;
 		}
 
 		vmas[i]->attr.atomic_access = op->atomic.val;
@@ -140,9 +157,14 @@ static void madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
 
 	xe_assert(vm->xe, op->type == DRM_XE_MEM_RANGE_ATTR_PAT);
 
-	for (i = 0; i < num_vmas; i++)
-		vmas[i]->attr.pat_index = op->pat_index.val;
-
+	for (i = 0; i < num_vmas; i++) {
+		if (vmas[i]->attr.pat_index == op->pat_index.val) {
+			vmas[i]->skip_invalidation = true;
+		} else {
+			vmas[i]->skip_invalidation = false;
+			vmas[i]->attr.pat_index = op->pat_index.val;
+		}
+	}
 }
 
 typedef void (*madvise_func)(struct xe_device *xe, struct xe_vm *vm,
@@ -168,17 +190,20 @@ static u8 xe_zap_ptes_in_madvise_range(struct xe_vm *vm, u64 start, u64 end)
 				  false, MAX_SCHEDULE_TIMEOUT) <= 0)
 		XE_WARN_ON(1);
 
-	tile_mask = xe_svm_ranges_zap_ptes_in_range(vm, start, end);
-
 	drm_gpuvm_for_each_va_range(gpuva, &vm->gpuvm, start, end) {
 		struct xe_vma *vma = gpuva_to_vma(gpuva);
 
-		if (xe_vma_is_cpu_addr_mirror(vma) || xe_vma_is_null(vma))
+		if (vma->skip_invalidation || xe_vma_is_null(vma))
 			continue;
 
-		for_each_tile(tile, vm->xe, id) {
-			if (xe_pt_zap_ptes(tile, vma)) {
-				tile_mask |= BIT(id);
+		if (xe_vma_is_cpu_addr_mirror(vma)) {
+			tile_mask |= xe_svm_ranges_zap_ptes_in_range(vm,
+								      xe_vma_start(vma),
+								      xe_vma_end(vma));
+		} else {
+			for_each_tile(tile, vm->xe, id) {
+				if (xe_pt_zap_ptes(tile, vma)) {
+					tile_mask |= BIT(id);
 
 				/*
 				 * WRITE_ONCE pairs with READ_ONCE
@@ -186,6 +211,7 @@ static u8 xe_zap_ptes_in_madvise_range(struct xe_vm *vm, u64 start, u64 end)
 				 */
 				WRITE_ONCE(vma->tile_invalidated,
 					   vma->tile_invalidated | BIT(id));
+				}
 			}
 		}
 	}
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index cd94d8b5819d..81d92d886578 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -157,6 +157,12 @@ struct xe_vma {
 	/** @tile_staged: bind is staged for this VMA */
 	u8 tile_staged;
 
+	/**
+	 * @skip_invalidation: Used in madvise to avoid invalidation
+	 * if mem attributes doesn't change
+	 */
+	bool skip_invalidation;
+
 	/**
 	 * @ufence: The user fence that was provided with MAP.
 	 * Needs to be signalled before UNMAP can be processed.
-- 
2.34.1

