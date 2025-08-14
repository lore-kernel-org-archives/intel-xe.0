Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9C09CA0EE4
	for <intel-xe@archiver.kernel.org>; Thu, 14 Aug 2025 10:33:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9999B10E846;
	Thu, 14 Aug 2025 10:33:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GW/RBxyD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4F0210E84C
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Aug 2025 10:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755167583; x=1786703583;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aM49pRMgswrShjdBMG2UHPgC9VVT2M543yQcr0+RJQ0=;
 b=GW/RBxyDwqH5sCb6I6Wog9Irv5MF1jh9OOgRZEUkE24lnbozrg3Sk9N3
 tTBZBtMBaY+yj/g+9RNHn08XwhOA+8rogN+R3nqn68DMu8q6cUYISAu+I
 50OhSdp1aQI4HeVP53EkOUaih3R4VDGcVdn6IMEBfdjTPqgLVNH/bV/gd
 ae8OZq++w+piOvSMHi5P3bYF6agc6mbsukjo9l9XJVMRKeMatztyXTQBF
 2oh20xlwr6BSwXQh1uGr2iuI5/ff4hnfl7ymAIdTiEDvhdAUeJl45xZ8O
 MKTu5WIcNjadYceMCeFvHdW8KaWSP3u3OIlypeHr0kHTtQw3qgjNv6FlW Q==;
X-CSE-ConnectionGUID: XW0Z6zRCQXSxx+YGRHVq7g==
X-CSE-MsgGUID: Hjs7kEmES6yVOI8IGdNErw==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="68083758"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="68083758"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 03:33:03 -0700
X-CSE-ConnectionGUID: 8xplihYUR0a7XzxQysP1Qg==
X-CSE-MsgGUID: TTAGMJALTre+o7EgOuSHTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="197579345"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa001.fm.intel.com with ESMTP; 14 Aug 2025 03:33:01 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v7 11/24] drm/xe/svm: Add xe_svm_ranges_zap_ptes_in_range()
 for PTE zapping
Date: Thu, 14 Aug 2025 16:29:37 +0530
Message-Id: <20250814105950.2177480-12-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250814105950.2177480-1-himal.prasad.ghimiray@intel.com>
References: <20250814105950.2177480-1-himal.prasad.ghimiray@intel.com>
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
index ba7a50bf3a2d..bf50a821853e 100644
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

