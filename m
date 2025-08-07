Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E186EC87FCA
	for <intel-xe@archiver.kernel.org>; Thu,  7 Aug 2025 16:17:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9749410E87E;
	Thu,  7 Aug 2025 16:17:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C6q0c/QL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C615B10E87E
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Aug 2025 16:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754583421; x=1786119421;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gtIQHhP/p2VlwokCWuT+CuAzPuS48LyYQe7k8Ya5Ko8=;
 b=C6q0c/QLvw0LqT/rVFx1Hqaw+gEE54lwtELuA0CKxc13Dz9F5aHDbog3
 omRygcdOKgz5U749Jo6noZHJQPVzM8+dk6qRpiB3VDwjsPMMBLc8iSiLl
 W91GH0HYloPyYNTbPIt6ZQlo8q3NoqOOChtbiJ8np2+tteBcCPJO7pzsw
 W9fF7TJEPaBM2l5aiRhH2Yyam8pDKf1/X1WBRxUhWTiTqdcE4PWYnjvPE
 pcdV99THo/uTgUocFDpM0MscPqB4eaGMuC2eS/Mi0RgB0FdvQ5ldeJeGk
 kEL6ZBtFntgoEPyjR7BX05+2Qu9XrooMhjX2yqHf5r1gUa+sR6u74d7oZ w==;
X-CSE-ConnectionGUID: QAyT+IihTqioZP6nW27sfg==
X-CSE-MsgGUID: hyDpm+aJSI64/U4V9f37sQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56845579"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="56845579"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 09:17:01 -0700
X-CSE-ConnectionGUID: xNZXkd44SF2ATzIOhbwZUA==
X-CSE-MsgGUID: OKd2urScTf6R4GO6coyIBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="195937828"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa001.fm.intel.com with ESMTP; 07 Aug 2025 09:16:59 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v6 12/26] drm/xe/svm: Add xe_svm_ranges_zap_ptes_in_range()
 for PTE zapping
Date: Thu,  7 Aug 2025 22:13:24 +0530
Message-Id: <20250807164338.1832254-13-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250807164338.1832254-1-himal.prasad.ghimiray@intel.com>
References: <20250807164338.1832254-1-himal.prasad.ghimiray@intel.com>
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

Introduce xe_svm_ranges_zap_ptes_in_range(), a function to zap page table
entries (PTEs) for all SVM ranges within a user-specified address range.

-v2 (Matthew Brost)
Lock should be called even for tlb_invalidation

v3(Matthew Brost)
- Update comment
- s/notifier->itree.start/drm_gpusvm_notifier_start
- s/notifier->itree.last + 1/drm_gpusvm_notifier_end
- use WRITE_ONCE

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c  | 14 ++++++++++-
 drivers/gpu/drm/xe/xe_svm.c | 50 +++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_svm.h |  8 ++++++
 3 files changed, 71 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 9128b35ccb3b..593fef438cd8 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -950,7 +950,19 @@ bool xe_pt_zap_ptes_range(struct xe_tile *tile, struct xe_vm *vm,
 	struct xe_pt *pt = vm->pt_root[tile->id];
 	u8 pt_mask = (range->tile_present & ~range->tile_invalidated);
 
-	xe_svm_assert_in_notifier(vm);
+	/*
+	 * Locking rules:
+	 *
+	 * - notifier_lock (write): full protection against page table changes
+	 *   and MMU notifier invalidations.
+	 *
+	 * - notifier_lock (read) + vm_lock (write): combined protection against
+	 *   invalidations and concurrent page table modifications. (e.g., madvise)
+	 *
+	 */
+	lockdep_assert(lockdep_is_held_type(&vm->svm.gpusvm.notifier_lock, 0) ||
+		       (lockdep_is_held_type(&vm->svm.gpusvm.notifier_lock, 1) &&
+		       lockdep_is_held_type(&vm->lock, 0)));
 
 	if (!(pt_mask & BIT(tile->id)))
 		return false;
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index ce42100cb753..c2306000f15e 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -1031,6 +1031,56 @@ int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
 	return err;
 }
 
+/**
+ * xe_svm_ranges_zap_ptes_in_range - clear ptes of svm ranges in input range
+ * @vm: Pointer to the xe_vm structure
+ * @start: Start of the input range
+ * @end: End of the input range
+ *
+ * This function removes the page table entries (PTEs) associated
+ * with the svm ranges within the given input start and end
+ *
+ * Return: tile_mask for which gt's need to be tlb invalidated.
+ */
+u8 xe_svm_ranges_zap_ptes_in_range(struct xe_vm *vm, u64 start, u64 end)
+{
+	struct drm_gpusvm_notifier *notifier;
+	struct xe_svm_range *range;
+	u64 adj_start, adj_end;
+	struct xe_tile *tile;
+	u8 tile_mask = 0;
+	u8 id;
+
+	lockdep_assert(lockdep_is_held_type(&vm->svm.gpusvm.notifier_lock, 1) &&
+		       lockdep_is_held_type(&vm->lock, 0));
+
+	drm_gpusvm_for_each_notifier(notifier, &vm->svm.gpusvm, start, end) {
+		struct drm_gpusvm_range *r = NULL;
+
+		adj_start = max(start, drm_gpusvm_notifier_start(notifier));
+		adj_end = min(end, drm_gpusvm_notifier_end(notifier));
+		drm_gpusvm_for_each_range(r, notifier, adj_start, adj_end) {
+			range = to_xe_range(r);
+			for_each_tile(tile, vm->xe, id) {
+				if (xe_pt_zap_ptes_range(tile, vm, range)) {
+					tile_mask |= BIT(id);
+					/*
+					 * WRITE_ONCE pairs with READ_ONCE in
+					 * xe_vm_has_valid_gpu_mapping().
+					 * Must not fail after setting
+					 * tile_invalidated and before
+					 * TLB invalidation.
+					 */
+					WRITE_ONCE(range->tile_invalidated,
+						   range->tile_invalidated | BIT(id));
+				}
+			}
+		}
+	}
+
+	return tile_mask;
+}
+
 #if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
 
 static struct drm_pagemap *tile_local_pagemap(struct xe_tile *tile)
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index 184b3f4f0b2a..046a9c4e95c2 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -92,6 +92,8 @@ u64 xe_svm_find_vma_start(struct xe_vm *vm, u64 addr, u64 end,  struct xe_vma *v
 
 void xe_svm_unmap_address_range(struct xe_vm *vm, u64 start, u64 end);
 
+u8 xe_svm_ranges_zap_ptes_in_range(struct xe_vm *vm, u64 start, u64 end);
+
 /**
  * xe_svm_range_has_dma_mapping() - SVM range has DMA mapping
  * @range: SVM range
@@ -310,6 +312,12 @@ void xe_svm_unmap_address_range(struct xe_vm *vm, u64 start, u64 end)
 {
 }
 
+static inline
+u8 xe_svm_ranges_zap_ptes_in_range(struct xe_vm *vm, u64 start, u64 end)
+{
+	return 0;
+}
+
 #define xe_svm_assert_in_notifier(...) do {} while (0)
 #define xe_svm_range_has_dma_mapping(...) false
 
-- 
2.34.1

