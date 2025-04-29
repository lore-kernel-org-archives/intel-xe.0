Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C07E5C369DC
	for <intel-xe@archiver.kernel.org>; Tue, 29 Apr 2025 10:18:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8462B10E41B;
	Tue, 29 Apr 2025 10:18:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fk3ukynf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2193810E42B
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Apr 2025 10:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745921880; x=1777457880;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BnqBTAELaHygNtMmH2nL4NNk6JejSIQ39gX7KZeCP9k=;
 b=fk3ukynfrDohP0mbuMTgsh1yM/GjHtu3cIDILbcUV1D9Xf8JrioJ//iV
 ZR62lQwpLu3QCtoXu05pvocmUWTmWwAxD00/MkdcQZcWYsaIc2PJiDbCQ
 AI59aSGGd+/TerRwgak9E80TQ0ZS4MAzPPoHkOfxexQrk6QJd5yD7zhnI
 v+C1HHQgxDbvUTFHsuBef580TbRRrPCp6/ig0kj0mz9Pn2tFVmIFprG8f
 wW11reXscOKtvi1rZrzugoUKJDRJ4/9eg4dTgQ2/gzOXrEBhXp1gdWE5K
 DDJOzWJIw6ttXRwAxUv0NX+YqM5d//28rFpFH9483qxQjifX2YqtMyIyV Q==;
X-CSE-ConnectionGUID: 4M+NielQTxqyy2ruxv6gcQ==
X-CSE-MsgGUID: 0q3wxVi4RZiuteC/WTDuMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="47243210"
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; d="scan'208";a="47243210"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 03:18:00 -0700
X-CSE-ConnectionGUID: HYa0Zcc6R+irEEdb/1l6gA==
X-CSE-MsgGUID: ddLEWpQQSgil5xjwKVzYBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; d="scan'208";a="134287616"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by orviesa007.jf.intel.com with ESMTP; 29 Apr 2025 03:17:58 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v5 18/20] drm/xe/svm: Add xe_svm_range_find_or_insert_start()
Date: Tue, 29 Apr 2025 16:12:31 +0530
Message-Id: <20250429104233.215602-19-himal.prasad.ghimiray@intel.com>
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

xe_svm_range_find_or_insert_start() is wrapper function
for drm_gpusvm_range_find_or_insert_start() in xe_svm.c

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 24 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_svm.h |  8 ++++++++
 2 files changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 55c5373b7989..8334733b49a6 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -674,6 +674,30 @@ bool xe_svm_range_validate_and_evict(struct xe_vm *vm,
 	return ret;
 }
 
+/**
+ * xe_svm_range_find_or_insert_start - Find an address for range find/allocate
+ * @vm: xe_vm pointer
+ * @start: start address
+ * @end: end address
+ * @vma: Pointer to struct xe_vma
+ *
+ *
+ * This function searches for a cpu vma, within the specified
+ * range [start, end] in the given VM. It adjusts the range based on the
+ * xe_vma start and end addresses. If no cpu VMA is found, it returns 0.
+ *
+ * Return: The starting address of the VMA within the range, or 0 if no VMA is found
+ */
+u64 xe_svm_range_find_or_insert_start(struct xe_vm *vm, u64 start, u64 end, struct xe_vma *vma)
+{
+	u64 ret;
+
+	ret =  drm_gpusvm_range_find_or_insert_start(&vm->svm.gpusvm,
+						     max(start, xe_vma_start(vma)),
+						     min(end, xe_vma_end(vma)));
+	return ret == ULONG_MAX ? 0 : ret;
+}
+
 #if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
 static struct xe_vram_region *tile_to_vr(struct xe_tile *tile)
 {
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index e6f71ad0b17b..b23b394d3fd5 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -87,6 +87,8 @@ bool xe_svm_range_validate_and_evict(struct xe_vm *vm,
 				     struct xe_svm_range *range,
 				     u8 tile_mask, bool devmem_only);
 
+u64 xe_svm_range_find_or_insert_start(struct xe_vm *vm, u64 addr, u64 end,  struct xe_vma *vma);
+
 /**
  * xe_svm_range_has_dma_mapping() - SVM range has DMA mapping
  * @range: SVM range
@@ -288,6 +290,12 @@ bool xe_svm_range_validate_and_evict(struct xe_vm *vm,
 	return false;
 }
 
+static inline
+u64 xe_svm_range_find_or_insert_start(struct xe_vm *vm, u64 addr, u64 end, struct xe_vma *vma)
+{
+	return 0;
+}
+
 #define xe_svm_assert_in_notifier(...) do {} while (0)
 #define xe_svm_range_has_dma_mapping(...) false
 
-- 
2.34.1

