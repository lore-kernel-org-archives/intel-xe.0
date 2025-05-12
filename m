Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFD67C3ABCC
	for <intel-xe@archiver.kernel.org>; Mon, 12 May 2025 16:22:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7521610E466;
	Mon, 12 May 2025 16:22:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k02fYFEW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 827BF10E464
 for <intel-xe@lists.freedesktop.org>; Mon, 12 May 2025 16:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747066968; x=1778602968;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bJX6xRoyWBbPCdejSZNHXLuRg3avawQWMpBn2QHqE7M=;
 b=k02fYFEWHEIMXzS99T2LHTRFaDoiFxYFB7EuYjpg2pB/UQOF89fIBCzh
 aBY+wKWyLXOQ4qqBcd+opZjjBle4ZI73W4cJm4nuV2hjEIB2v/br3Hwwj
 cxUMbVl/6+ODN4+67EMVNjTYW5bYtBDT7Laobh8/GNN5cvEY4dnB42dLn
 UUxK4ivhcmlc2MvLmAKXAyZJ+NNqVTZjDdn6WnQ1at4ycxW3wZfiVUObW
 fDgwdGtQdceju9yJZph117nHFjQG5OJcZC4vS7VwQcj+h6nEjRhEiwP4j
 gee2MdGjhxW3FKh4QMKdTBPl7YECvAl8Rehh8kfxW3gOEJZTDZ1veVQ8j g==;
X-CSE-ConnectionGUID: AQVuwJ2kRLalWbvXst5ePg==
X-CSE-MsgGUID: FCiRXRTaSaCGR3Bbc61JFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="59508130"
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="59508130"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 09:22:48 -0700
X-CSE-ConnectionGUID: Wg5mMWFvSRq9zNLmCnrF4g==
X-CSE-MsgGUID: R8vULK11TNyKQkeLRfyuDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="142532805"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by orviesa005.jf.intel.com with ESMTP; 12 May 2025 09:22:46 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v7 16/20] drm/xe/svm: Add xe_svm_range_validate() and
 xe_svm_range_migrate_to_smem()
Date: Mon, 12 May 2025 22:17:36 +0530
Message-Id: <20250512164740.466852-17-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250512164740.466852-1-himal.prasad.ghimiray@intel.com>
References: <20250512164740.466852-1-himal.prasad.ghimiray@intel.com>
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

The xe_svm_range_validate() function checks if a range is
valid and located in the desired memory region.

xe_svm_range_migrate_to_smem() checks if range have pages in devmem and
migrate them to smem.

v2
- Fix function stub in xe_svm.h
- Fix doc

v3 (Matthew Brost)
- Remove extra new line
- s/range->base.flags.has_devmem_pages/xe_svm_range_in_vram

v4 (Matthew Brost)
- s/xe_svm_range_in_vram/range->base.flags.has_devmem_pages
- Move eviction logic to separate function

Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 41 +++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_svm.h | 19 +++++++++++++++++
 2 files changed, 60 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index c6505350c8ff..248f615a343e 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -651,6 +651,47 @@ static bool xe_svm_range_is_valid(struct xe_svm_range *range,
 		(!devmem_only || xe_svm_range_in_vram(range));
 }
 
+/** xe_svm_range_migrate_to_smem() - Move range pages from VRAM to SMEM
+ * @vm: xe_vm pointer
+ * @range: Pointer to the SVM range structure
+ *
+ * The xe_svm_range_migrate_to_smem() checks range has pages in VRAM
+ * and migrates them to SMEM
+ */
+void xe_svm_range_migrate_to_smem(struct xe_vm *vm, struct xe_svm_range *range)
+{
+	if (xe_svm_range_in_vram(range))
+		drm_gpusvm_range_evict(&vm->svm.gpusvm, &range->base);
+}
+
+/**
+ * xe_svm_range_validate() - Check if the SVM range is valid
+ * @vm: xe_vm pointer
+ * @range: Pointer to the SVM range structure
+ * @tile_mask: Mask representing the tiles to be checked
+ * @devmem_preferred : if true range needs to be in devmem
+ *
+ * The xe_svm_range_validate() function checks if a range is
+ * valid and located in the desired memory region.
+ *
+ * Return: true if the range is valid, false otherwise
+ */
+bool xe_svm_range_validate(struct xe_vm *vm,
+			   struct xe_svm_range *range,
+			   u8 tile_mask, bool devmem_preferred)
+{
+	bool ret;
+
+	xe_svm_notifier_lock(vm);
+
+	ret = (range->tile_present & ~range->tile_invalidated & tile_mask) == tile_mask &&
+	       (devmem_preferred == range->base.flags.has_devmem_pages);
+
+	xe_svm_notifier_unlock(vm);
+
+	return ret;
+}
+
 #if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
 static struct xe_vram_region *tile_to_vr(struct xe_tile *tile)
 {
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index 0ee845e35b3e..42be9e5d0444 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -83,6 +83,12 @@ int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
 bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vma *vma,
 					bool preferred_region_is_vram);
 
+void xe_svm_range_migrate_to_smem(struct xe_vm *vm, struct xe_svm_range *range);
+
+bool xe_svm_range_validate(struct xe_vm *vm,
+			   struct xe_svm_range *range,
+			   u8 tile_mask, bool devmem_preferred);
+
 /**
  * xe_svm_range_has_dma_mapping() - SVM range has DMA mapping
  * @range: SVM range
@@ -278,6 +284,19 @@ bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vm
 	return false;
 }
 
+static inline
+void xe_svm_range_migrate_to_smem(struct xe_vm *vm, struct xe_svm_range *range)
+{
+}
+
+static inline
+bool xe_svm_range_validate(struct xe_vm *vm,
+			   struct xe_svm_range *range,
+			   u8 tile_mask, bool devmem_preferred)
+{
+	return false;
+}
+
 #define xe_svm_assert_in_notifier(...) do {} while (0)
 #define xe_svm_range_has_dma_mapping(...) false
 
-- 
2.34.1

