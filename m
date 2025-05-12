Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3F1DC3ABCB
	for <intel-xe@archiver.kernel.org>; Mon, 12 May 2025 16:22:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8598910E43B;
	Mon, 12 May 2025 16:22:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q11EgReK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 021CC10E43B
 for <intel-xe@lists.freedesktop.org>; Mon, 12 May 2025 16:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747066971; x=1778602971;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Klx4ojp5zVCvRobU+IsLXjFP14h7/jmRgWcUPC/ck70=;
 b=Q11EgReKG9jBk5AgXa4snknK2HT/PQEBxGQtUpK3MtgedWv7KQIwjyDD
 H9ghWsDQ3VN2c3DRSrktRcICeN6r3ljqa0iGpbKY8htp2tQkzjnKymdRX
 3hW6KqLCtsEHFnowd7H2kDvPut5g8ijbcQ4AXxkEsFLY9l6hhg2kARG/J
 PCCBs3Le1ITTcQvvxC2mViunHEhWrj0WUhbDyYFt+F/cjmO8khLygyPNM
 qFQ1qMfJLsaR+9sKJpssjLww72O9j6CwV62jY2r7cMU8SYgbxFSh0ZaZX
 fWR4M9GXtqzR1BLf8at2lh2IHBGwMoYNoZ3mpsuFzNN8gTgsNmZx5OWQj g==;
X-CSE-ConnectionGUID: M+FTdkIwRQSSEg6A/ETYyw==
X-CSE-MsgGUID: ox7Ey5KOSMyaIKAGTWhuuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="59508134"
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="59508134"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 09:22:51 -0700
X-CSE-ConnectionGUID: 1gMRPWFURrmHjPtoL2Juxg==
X-CSE-MsgGUID: uReuFoIpSi+f5yV/ZtLhOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="142532828"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by orviesa005.jf.intel.com with ESMTP; 12 May 2025 09:22:49 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v7 18/20] drm/xe/svm: Add xe_svm_find_vma_start() helper
Date: Mon, 12 May 2025 22:17:38 +0530
Message-Id: <20250512164740.466852-19-himal.prasad.ghimiray@intel.com>
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

