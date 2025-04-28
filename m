Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 942CAC36005
	for <intel-xe@archiver.kernel.org>; Mon, 28 Apr 2025 10:07:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 595BA10E3E0;
	Mon, 28 Apr 2025 10:07:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IVXKVz1z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3727610E3DE
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Apr 2025 10:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745834864; x=1777370864;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=haB4v7udLWp0erpaLIVPJkUnjdCrSgXz8WDOQvid5VQ=;
 b=IVXKVz1zeZeZ5cqQeErR6mtFvyFJIZ1TzGyNh9kp8MFDsljLU4XleCW0
 +Mfs4aWUq7jBPKtspVZfaLqBs7EouornMZx5xNnhzniPTxGwPSVV+0rDW
 BuEByFF1bn8EuVqik+SlUFD5NvFbQSIp3V17pPtSwe035mjm/Ed0TVlGq
 zVazkwoePYo/WeIljUA97tNc9ZN6HIeksC5BaWSgcAbS7bLZgNtH0w/zf
 RvSv27CdXyWJ3HNlJQeUuHVgN8yhiWqV75+cz61M1xhwV7Hgc+DSfb5Vx
 tvyXfalifLnV0zF/I3415m4ki8466dBQcvlpsIWleUnVpLa5tXWA8f3OK g==;
X-CSE-ConnectionGUID: KHXZit9DRiCxm1ThhtiX6g==
X-CSE-MsgGUID: rAbStbPVRJ66osVn5OZwEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11416"; a="58783985"
X-IronPort-AV: E=Sophos;i="6.15,246,1739865600"; d="scan'208";a="58783985"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 03:07:44 -0700
X-CSE-ConnectionGUID: jbSBP3J9RYmxl4r9VFXLmQ==
X-CSE-MsgGUID: Gub+oye/Tr69SUZrGJzIjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,246,1739865600"; d="scan'208";a="138291518"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by orviesa003.jf.intel.com with ESMTP; 28 Apr 2025 03:07:42 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v4 15/18] drm/xe/svm: Make
 xe_svm_range_needs_migrate_to_vram() public
Date: Mon, 28 Apr 2025 16:02:21 +0530
Message-Id: <20250428103224.69534-16-himal.prasad.ghimiray@intel.com>
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

xe_svm_range_needs_migrate_to_vram() determines whether range needs
migration to vram or not, modify it to accept region preference parameter
too, so we can use it in prefetch too.

v2
- add assert instead of warn (Matthew Brost)

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 26 ++++++++++++++++++--------
 drivers/gpu/drm/xe/xe_svm.h | 10 ++++++++++
 2 files changed, 28 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 72263df1d69d..90fae13b77ae 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -719,22 +719,32 @@ static bool supports_4K_migration(struct xe_device *xe)
 	return true;
 }
 
-static bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range,
-					       struct xe_vma *vma)
+/**
+ * xe_svm_range_needs_migrate_to_vram() - SVM range needs migrate to VRAM or not
+ * @range: SVM range for which migration needs to be decided
+ * @vma: vma which has range
+ * @preferred_region_is_vram: preferred region for range is vram
+ *
+ * Return: True for range needing migration and migration is supported else false
+ */
+bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vma *vma,
+					bool preferred_region_is_vram)
 {
 	struct xe_vm *vm = range_to_vm(&range->base);
 	u64 range_size = xe_svm_range_size(range);
 
-	if (!range->base.flags.migrate_devmem)
+	if (!range->base.flags.migrate_devmem || !preferred_region_is_vram)
 		return false;
 
-	if (xe_svm_range_in_vram(range)) {
-		drm_dbg(&vm->xe->drm, "Range is already in VRAM\n");
+	xe_assert(vm->xe, IS_DGFX(vm->xe));
+
+	if (preferred_region_is_vram && xe_svm_range_in_vram(range)) {
+		drm_info(&vm->xe->drm, "Range is already in VRAM\n");
 		return false;
 	}
 
-	if (range_size <= SZ_64K && !supports_4K_migration(vm->xe)) {
-		drm_dbg(&vm->xe->drm, "Platform doesn't support SZ_4K range migration\n");
+	if (preferred_region_is_vram && range_size <= SZ_64K && !supports_4K_migration(vm->xe)) {
+		drm_warn(&vm->xe->drm, "Platform doesn't support SZ_4K range migration\n");
 		return false;
 	}
 
@@ -800,7 +810,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	range_debug(range, "PAGE FAULT");
 
 	if (--migrate_try_count >= 0 &&
-	    xe_svm_range_needs_migrate_to_vram(range, vma)) {
+	    xe_svm_range_needs_migrate_to_vram(range, vma, IS_DGFX(vm->xe))) {
 		err = xe_svm_alloc_vram(vm, tile, range, &ctx);
 		ctx.timeslice_ms <<= 1;	/* Double timeslice if we have to retry */
 		if (err) {
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index cafca625bba9..9be7bb25725c 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -80,6 +80,9 @@ struct xe_svm_range *xe_svm_range_find_or_insert(struct xe_vm *vm, u64 addr,
 int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
 			   struct drm_gpusvm_ctx *ctx);
 
+bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vma *vma,
+					bool preferred_region_is_vram);
+
 /**
  * xe_svm_range_has_dma_mapping() - SVM range has DMA mapping
  * @range: SVM range
@@ -266,6 +269,13 @@ static inline unsigned long xe_svm_range_size(struct xe_svm_range *range)
 	return 0;
 }
 
+static inline
+bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vma *vma,
+					u32 region)
+{
+	return false;
+}
+
 #define xe_svm_assert_in_notifier(...) do {} while (0)
 #define xe_svm_range_has_dma_mapping(...) false
 
-- 
2.34.1

