Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8789BC3ABAC
	for <intel-xe@archiver.kernel.org>; Tue, 29 Apr 2025 10:18:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4408F10E42F;
	Tue, 29 Apr 2025 10:18:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="doNrHXLf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 590C510E42B
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Apr 2025 10:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745921877; x=1777457877;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LiwW2Qj0+dYQFy1Ey8xgigN2VRBLfpgA4CZAGiTnrTU=;
 b=doNrHXLfPnxstwWWVlwLj5ae7aHO3ywQ1+xxl3XwGoKSNeaEGdnSnkzi
 rSvaEvF+AOH/QOPKjv60V/BDsZC9aj3MylQpb0Koko8pQs8jQkNoTk0FK
 59lksgLM/mjjz0M6WgQiXOnc/RBZjoerxRgt+r07Pu0rnpjqbTHqChyMx
 wQGlRUG5JzvDJANJW3eYxAfoiNV4EDRsSVmw9To0IxG1OJT76Y2qRTMa0
 ftBkzsJOJCcgXNJUCnelztK67k3IETYgKFAn5KjIfv0KUPaEy3ZrPuMy9
 vOGm5+s+CsGw0G2zchvMXhO6hXiOLqb8UX6MjTqFVdFXzmyS6QK0u1IKc Q==;
X-CSE-ConnectionGUID: apO5oXcGRgOEWtp02ZcSuw==
X-CSE-MsgGUID: j0B9Mum0T1SE0Iv5BdYkRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="47243204"
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; d="scan'208";a="47243204"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 03:17:57 -0700
X-CSE-ConnectionGUID: ujZXMV5ISdOBcyLXLnd7EQ==
X-CSE-MsgGUID: it8VtgmuTuuyGIzGO0cA/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; d="scan'208";a="134287607"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by orviesa007.jf.intel.com with ESMTP; 29 Apr 2025 03:17:54 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v5 16/20] drm/xe/svm: Add xe_svm_range_validate_and_evict()
 function
Date: Tue, 29 Apr 2025 16:12:29 +0530
Message-Id: <20250429104233.215602-17-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250429104233.215602-1-himal.prasad.ghimiray@intel.com>
References: <20250429104233.215602-1-himal.prasad.ghimiray@intel.com>
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

The xe_svm_range_validate_and_evict() function checks if a range is
valid and located in the desired memory region. Additionally, if the
range is valid in VRAM but the desired region is SMEM, it evicts the
ranges to SMEM.

v2
- Fix function stub in xe_svm.h
- Fix doc

v3 (Matthew Brost)
- Remove extra new line
- s/range->base.flags.has_devmem_pages/xe_svm_range_in_vram

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 37 +++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_svm.h | 12 ++++++++++++
 2 files changed, 49 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 90fae13b77ae..55c5373b7989 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -637,6 +637,43 @@ static bool xe_svm_range_is_valid(struct xe_svm_range *range,
 		&& (!devmem_only || range->base.flags.migrate_devmem);
 }
 
+/**
+ * xe_svm_range_validate_and_evict() - Check if the SVM range is valid
+ * @vm: xe_vm pointer
+ * @range: Pointer to the SVM range structure
+ * @tile_mask: Mask representing the tiles to be checked
+ * @devmem_only: if true range needs to be in devmem
+ *
+ * The xe_svm_range_validate_and_evict() function checks if a range is
+ * valid and located in the desired memory region. Additionally, if the
+ * range is valid in VRAM but the desired region is SMEM, it evicts the
+ * ranges to SMEM.
+ *
+ * Return: true if the range is valid, false otherwise
+ */
+bool xe_svm_range_validate_and_evict(struct xe_vm *vm,
+				     struct xe_svm_range *range,
+				     u8 tile_mask, bool devmem_only)
+{
+	bool range_evict = false;
+	bool ret;
+
+	xe_svm_notifier_lock(vm);
+
+	ret = (range->tile_present & ~range->tile_invalidated & tile_mask) == tile_mask &&
+	       (devmem_only == xe_svm_range_in_vram(range));
+
+	if (!ret && !devmem_only && xe_svm_range_in_vram(range))
+		range_evict = true;
+
+	xe_svm_notifier_unlock(vm);
+
+	if (range_evict)
+		drm_gpusvm_range_evict(&vm->svm.gpusvm, &range->base);
+
+	return ret;
+}
+
 #if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
 static struct xe_vram_region *tile_to_vr(struct xe_tile *tile)
 {
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index 9be7bb25725c..e6f71ad0b17b 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -83,6 +83,10 @@ int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
 bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vma *vma,
 					bool preferred_region_is_vram);
 
+bool xe_svm_range_validate_and_evict(struct xe_vm *vm,
+				     struct xe_svm_range *range,
+				     u8 tile_mask, bool devmem_only);
+
 /**
  * xe_svm_range_has_dma_mapping() - SVM range has DMA mapping
  * @range: SVM range
@@ -276,6 +280,14 @@ bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vm
 	return false;
 }
 
+static inline
+bool xe_svm_range_validate_and_evict(struct xe_vm *vm,
+				     struct xe_svm_range *range,
+				     u8 tile_mask, bool devmem_only)
+{
+	return false;
+}
+
 #define xe_svm_assert_in_notifier(...) do {} while (0)
 #define xe_svm_range_has_dma_mapping(...) false
 
-- 
2.34.1

