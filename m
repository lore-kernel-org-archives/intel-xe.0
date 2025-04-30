Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8332C3ABB6
	for <intel-xe@archiver.kernel.org>; Wed, 30 Apr 2025 11:54:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8946310E756;
	Wed, 30 Apr 2025 11:54:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NC8FJENY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86F0910E74B
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Apr 2025 11:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746014072; x=1777550072;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dnDu0VESbo0PeijBz3gK5ZQBP0w3kI8hz6We6/5qiiY=;
 b=NC8FJENYKBConikNLVuLUVo3BUqiAdgShkPzg75e5z7QhIeINQE3hPhC
 jqtIgEN7uJktunEhpQLhAJmKfiq09RqFLQv6I6LLorRe8zAJ7dJdp6ZnU
 et5ZbwF1B+faJ5tNM2bp9FysV2Uwl9j8DTFOqA4dbbmwCvqMZBA1ufwTd
 55pBjYuCJm78DwLacxzczuIOd5PXWXXAIPHLXo47cNtXJcXhd/8n8MGFo
 N7UALR7AfnWBDeeueBjggX81a2fOH5k4uPI2yIDDJ1H/d+DyLZBahu6Yp
 QPBLQSCgPwALXb+2lH4zhTLoP977tVzVYcMioQXZgAOs3D20qt9j8bvyS g==;
X-CSE-ConnectionGUID: tr8aNYXYS7OWNdzIb/NmiQ==
X-CSE-MsgGUID: lIHIwgEFR9KJoqs6TwWyag==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="47759964"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="47759964"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2025 04:54:32 -0700
X-CSE-ConnectionGUID: 0BuS5GwVTrmBKai5o3kwaA==
X-CSE-MsgGUID: eiNkFsHORiWGEF32TiMjiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="134050741"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa007.fm.intel.com with ESMTP; 30 Apr 2025 04:54:30 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v6 18/20] drm/xe/svm: Add xe_svm_find_vma_start() helper
Date: Wed, 30 Apr 2025 17:49:10 +0530
Message-Id: <20250430121912.337601-19-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250430121912.337601-1-himal.prasad.ghimiray@intel.com>
References: <20250430121912.337601-1-himal.prasad.ghimiray@intel.com>
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
---
 drivers/gpu/drm/xe/xe_svm.c | 22 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_svm.h |  8 ++++++++
 2 files changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index fff3a279e232..727c393d19b8 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -684,6 +684,28 @@ bool xe_svm_range_validate(struct xe_vm *vm,
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
index 3f8c82f9c363..fe9f6fcaeb3a 100644
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
@@ -295,6 +297,12 @@ bool xe_svm_range_validate(struct xe_vm *vm,
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

