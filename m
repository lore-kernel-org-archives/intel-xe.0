Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04CF1C3ABD9
	for <intel-xe@archiver.kernel.org>; Tue, 13 May 2025 03:37:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB96D10E4E1;
	Tue, 13 May 2025 03:37:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GCHlYNO1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4186610E4DF
 for <intel-xe@lists.freedesktop.org>; Tue, 13 May 2025 03:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747107443; x=1778643443;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Klx4ojp5zVCvRobU+IsLXjFP14h7/jmRgWcUPC/ck70=;
 b=GCHlYNO1q9S1C2WLUCvyqAqME3xXMrf6JWqByD5zspgF1ByJ7ZqJTWg6
 R2SCorbws4HlY/XzzML6DVhnKWWcmfdRqi0dwEgvcXUVA1xF4FemyPOzA
 Xzbbkesh4wlt/jc4ak3bZF52wzTquFEVamgwHhjY0EQNsVfrUfI7h8SRB
 ArMsBabnJZ7W9e4Po+7ynHbLgK90V7yxseo1WTOwbPfX6z/dkgiIgoXLl
 FRR0PBP1cGacN1CleIPu/gbmkiKC+f5aGxpUgbKFHIxURxH7hE2gQKGw4
 xf+b2isGBe9XeDUWvNi849Bs/KpctBmbzX0fX0DEWi2Da7h4Ax3eC3rm6 A==;
X-CSE-ConnectionGUID: sLqnWwaEReyW8dn02blBcA==
X-CSE-MsgGUID: n4WOeT8lT2moeooVBsaM8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="48858856"
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; d="scan'208";a="48858856"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 20:37:23 -0700
X-CSE-ConnectionGUID: yBBEz/tZRrqGdRAIIH/IwQ==
X-CSE-MsgGUID: 9P+aVLakTCmH9/n+QEBk1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; d="scan'208";a="142690309"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by orviesa005.jf.intel.com with ESMTP; 12 May 2025 20:37:22 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v8 13/15] drm/xe/svm: Add xe_svm_find_vma_start() helper
Date: Tue, 13 May 2025 09:32:26 +0530
Message-Id: <20250513040228.470682-14-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250513040228.470682-1-himal.prasad.ghimiray@intel.com>
References: <20250513040228.470682-1-himal.prasad.ghimiray@intel.com>
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

Add helper xe_svm_find_vma_start() function to determine start of cpu
vma in input range.

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 22 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_svm.h |  8 ++++++++
 2 files changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 248f615a343e..4432685936ed 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -692,6 +692,28 @@ bool xe_svm_range_validate(struct xe_vm *vm,
 	return ret;
 }
 
+/**
+ * xe_svm_find_vma_start - Find start of CPU VMA
+ * @vm: xe_vm pointer
+ * @start: start address
+ * @end: end address
+ * @vma: Pointer to struct xe_vma
+ *
+ *
+ * This function searches for a cpu vma, within the specified
+ * range [start, end] in the given VM. It adjusts the range based on the
+ * xe_vma start and end addresses. If no cpu VMA is found, it returns ULONG_MAX.
+ *
+ * Return: The starting address of the VMA within the range,
+ * or ULONG_MAX if no VMA is found
+ */
+u64 xe_svm_find_vma_start(struct xe_vm *vm, u64 start, u64 end, struct xe_vma *vma)
+{
+	return drm_gpusvm_find_vma_start(&vm->svm.gpusvm,
+					 max(start, xe_vma_start(vma)),
+					 min(end, xe_vma_end(vma)));
+}
+
 #if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
 static struct xe_vram_region *tile_to_vr(struct xe_tile *tile)
 {
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index 42be9e5d0444..19ce4f2754a7 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -89,6 +89,8 @@ bool xe_svm_range_validate(struct xe_vm *vm,
 			   struct xe_svm_range *range,
 			   u8 tile_mask, bool devmem_preferred);
 
+u64 xe_svm_find_vma_start(struct xe_vm *vm, u64 addr, u64 end,  struct xe_vma *vma);
+
 /**
  * xe_svm_range_has_dma_mapping() - SVM range has DMA mapping
  * @range: SVM range
@@ -297,6 +299,12 @@ bool xe_svm_range_validate(struct xe_vm *vm,
 	return false;
 }
 
+static inline
+u64 xe_svm_find_vma_start(struct xe_vm *vm, u64 addr, u64 end, struct xe_vma *vma)
+{
+	return ULONG_MAX;
+}
+
 #define xe_svm_assert_in_notifier(...) do {} while (0)
 #define xe_svm_range_has_dma_mapping(...) false
 
-- 
2.34.1

