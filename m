Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0271EC36005
	for <intel-xe@archiver.kernel.org>; Mon, 28 Apr 2025 10:07:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE49210E3DE;
	Mon, 28 Apr 2025 10:07:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YDFGip/2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 398AE10E3DE
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Apr 2025 10:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745834866; x=1777370866;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qqKuF+aB30qPu4RyF+nLXnl7G9Z6KdBmuavLXBMekjQ=;
 b=YDFGip/2nwit7tSzRyXqTtA6K/Cwqm2b5FPUsrd4Nt964IRfvPHnyupt
 kWaXIagrFJ9OtyRRscYLWOX5c7r7rLuRQcaB3Az0x2UB0RgDw+eqUQAAR
 NXxt70auwomn8943cP5sl4iu6R7prX8n0/1jTMaGu6weRJ97nr1h+S94Z
 yRp0JgEyfTeRqsi9wjmrXzJ6ysd1Mpau5K5KKEImx9nJgyQxrkLcuvkWp
 hliePBQtd6p+p3uQVrVFvlgFShqOPHxs6ORHBXg4dWchZTzAoKf6wCw85
 I+PtfDE0hc/WXTtvYhCiSZvmdwGmBTC8FhZadFBxGCvPcLyugsX17ZBEX Q==;
X-CSE-ConnectionGUID: iND6UA6tTnWKe6vesDpszg==
X-CSE-MsgGUID: MTHX6SycQ4O1BaKV/kPdBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11416"; a="58783986"
X-IronPort-AV: E=Sophos;i="6.15,246,1739865600"; d="scan'208";a="58783986"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 03:07:46 -0700
X-CSE-ConnectionGUID: Kdez2kIESiCij7qMGPjCVw==
X-CSE-MsgGUID: axvTABntQU2b4UIlR2H3Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,246,1739865600"; d="scan'208";a="138291521"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by orviesa003.jf.intel.com with ESMTP; 28 Apr 2025 03:07:44 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v4 16/18] drm/xe/svm: Add xe_svm_range_validate_and_evict()
 function
Date: Mon, 28 Apr 2025 16:02:22 +0530
Message-Id: <20250428103224.69534-17-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250428103224.69534-1-himal.prasad.ghimiray@intel.com>
References: <20250428103224.69534-1-himal.prasad.ghimiray@intel.com>
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

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 37 +++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_svm.h | 12 ++++++++++++
 2 files changed, 49 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 90fae13b77ae..0e672e1e68c3 100644
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
+
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
+	       (devmem_only == range->base.flags.has_devmem_pages);
+
+	if (!ret && !devmem_only && range->base.flags.has_devmem_pages)
+		range_evict = true;
+
+	xe_svm_notifier_unlock(vm);
+
+	if (range_evict)
+		drm_gpusvm_range_evict(&vm->svm.gpusvm, &range->base);
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

