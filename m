Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDBCCC982C4
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 11:25:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83DEF10E90A;
	Wed, 16 Sep 2026 11:25:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EpIzfKpY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE0C410E90A
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Sep 2026 11:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789557914; x=1821093914;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vn5FzonUsmXrsJhg3kg4UvToLYoUuhkYA0F9RTrp0xc=;
 b=EpIzfKpYCq1uabJ2tsAXdprB9HAehuFWUKRKzc4+5mQ395naVmtartX5
 v/ddKLCjPftBVyb8f5hluPdAhOHXM5lOimEIOc6THJkggOaUB9lROAgEr
 yeSbZX6m50SFllCOG5HVt+uSguGXgs3IPefn5dSqBC0/mvpX6bwxGWuai
 VfbgdZGuUH9Iuqn27PANk/WuYdCKVL6oSikhJ4bdfaHeO0X5SNkNqxN9X
 vJqEYPVYYTQdLD4TdcjmamUHyeeiAAK1boKLlossUf36oi2/TdAZXJ78L
 H8il5RAWxeWDsnYGLnTRadPUp3rQCf30GSk0s+Eh7Lcep+RRit4N2h58L w==;
X-CSE-ConnectionGUID: bXBE9LTjTNaC44WzeEEg7g==
X-CSE-MsgGUID: QoDB9BYIQI6sLkhhpBUzcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89067452"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="89067452"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 04:25:14 -0700
X-CSE-ConnectionGUID: nQqWKXNAS8a2bq8neY4ezw==
X-CSE-MsgGUID: fRQ0pujuRFaZR+bD6nMSgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="275276321"
Received: from hghimira.iind.intel.com ([10.190.239.34])
 by fmviesa004.fm.intel.com with ESMTP; 16 Sep 2026 04:25:12 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [RFC 4/4] drm/xe: Bump prefetch BO LRU for already-valid ranges
Date: Wed, 16 Sep 2026 16:58:33 +0530
Message-ID: <20260916112828.2528881-10-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916112828.2528881-6-himal.prasad.ghimiray@intel.com>
References: <20260916112828.2528881-6-himal.prasad.ghimiray@intel.com>
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

A valid prefetch range skips migration and binding, so nothing refreshes
its backing BOs on the LRU. Add xe_svm_range_prefetch_lru_bump(), which
re-faults with no_dma_map and bumps each backing BO, and call it on the
valid path.

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 33 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_svm.h |  4 ++++
 drivers/gpu/drm/xe/xe_vm.c  |  9 +++++++++
 3 files changed, 46 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 7de6ed818d45..8997e619874b 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -1632,6 +1632,39 @@ void xe_svm_devmem_lru_bump(struct drm_pagemap_devmem *devmem_allocation)
 	dma_resv_unlock(bo->ttm.base.resv);
 }
 
+/**
+ * xe_svm_range_prefetch_lru_bump() - Bump the TTM LRU for an already-valid range
+ * @vm: Pointer to the struct xe_vm
+ * @vma: Pointer to the VMA covering the range
+ * @range: Pointer to the xe SVM range structure
+ * @dpagemap: Target pagemap of the prefetch, or %NULL for system memory
+ *
+ * A valid range skips migration and binding, so nothing else refreshes its
+ * backing BOs on the LRU. Re-fault the CPU pages without touching the DMA
+ * mappings (@no_dma_map) and move each backing BO to the LRU tail.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int xe_svm_range_prefetch_lru_bump(struct xe_vm *vm, struct xe_vma *vma,
+				   struct xe_svm_range *range,
+				   struct drm_pagemap *dpagemap)
+{
+	struct drm_gpusvm_ctx ctx = {
+		.read_only = xe_vma_read_only(vma),
+		.device_private_page_owner =
+			xe_svm_private_page_owner(vm, !dpagemap),
+		.no_dma_map = 1,
+		.devmem_fn = xe_svm_devmem_lru_bump,
+	};
+
+	guard(mutex)(&range->lock);
+
+	if (xe_svm_range_is_removed(range))
+		return 0;
+
+	return xe_svm_range_get_pages(vm, range, &ctx);
+}
+
 /**
  * xe_svm_ranges_zap_ptes_in_range - clear ptes of svm ranges in input range
  * @vm: Pointer to the xe_vm structure
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index 74566094b026..53d31feae907 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -130,6 +130,10 @@ int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
 
 void xe_svm_devmem_lru_bump(struct drm_pagemap_devmem *devmem_allocation);
 
+int xe_svm_range_prefetch_lru_bump(struct xe_vm *vm, struct xe_vma *vma,
+				   struct xe_svm_range *range,
+				   struct drm_pagemap *dpagemap);
+
 bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vma *vma,
 					const struct drm_pagemap *dpagemap);
 
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 4243825228d9..41eebdabe1c2 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2583,6 +2583,15 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 						  dpagemap, &valid_pages)) {
 				xe_svm_range_debug(svm_range, "PREFETCH - RANGE IS VALID");
 				xe_assert(vm->xe, valid_pages);
+
+				if (dpagemap) {
+					err = xe_svm_range_prefetch_lru_bump(vm, vma,
+									     svm_range,
+									     dpagemap);
+					if (err)
+						goto unwind_prefetch_ops;
+				}
+
 				need_put = true;
 				goto check_next_range;
 			}
-- 
2.43.0

