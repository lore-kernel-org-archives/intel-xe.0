Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEE9CC3ABA9
	for <intel-xe@archiver.kernel.org>; Wed, 30 Apr 2025 11:54:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A247E10E747;
	Wed, 30 Apr 2025 11:54:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LD646Iwa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC38510E746
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Apr 2025 11:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746014067; x=1777550067;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Y1AI29piarVFTB8b3LcqjzRS3qrqf6pJMn/GhJzgX3w=;
 b=LD646Iway98AmBdv4Rgf8Miqg2T3jzoRe97iBf013d5O342h7JYDaGnC
 nM1lwIyFkO9kCzhf34lBDy0NoOtmLdGJgp6jE/Yn/+G9MiSVzq6/7Otqm
 yVi/dXJsttQexmCSoOlLvA8CMmNdjmAiXEz+311ltMLXzMqvnp+OsJKxo
 +jbFdy9OGnqCIegh43W18RQ6FpefYiRc5ZggN0K1/bamTmAWvzbMAdjvr
 Z7H5h1S+cOWrlJfGzt+LULJbTKrChe+OByOVb1C1sa9d/xeBb7aCW2yrJ
 0uz9p/I3v6+3tZQkvFKJRn7zrOU7dJfdC+/Enr98cAx8ghWxj2I4vpTeh g==;
X-CSE-ConnectionGUID: ScZy0M+YSfSg7sMyMIHb6A==
X-CSE-MsgGUID: zu8dvC+yQFidlzjrgTXx4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="47759958"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="47759958"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2025 04:54:27 -0700
X-CSE-ConnectionGUID: OInv9cp3R5K+3ovfhHANrA==
X-CSE-MsgGUID: 8sJ/mFTyTFuy6FR75BLEyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="134050721"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa007.fm.intel.com with ESMTP; 30 Apr 2025 04:54:25 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v6 15/20] drm/xe/svm: Make
 xe_svm_range_needs_migrate_to_vram() public
Date: Wed, 30 Apr 2025 17:49:07 +0530
Message-Id: <20250430121912.337601-16-himal.prasad.ghimiray@intel.com>
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

xe_svm_range_needs_migrate_to_vram() determines whether range needs
migration to vram or not, modify it to accept region preference parameter
too, so we can use it in prefetch too.

v2
- add assert instead of warn (Matthew Brost)

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 26 ++++++++++++++++++--------
 drivers/gpu/drm/xe/xe_svm.h | 10 ++++++++++
 2 files changed, 28 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index bdbd0495b1a4..cb4a849c018b 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -725,23 +725,33 @@ static bool supports_4K_migration(struct xe_device *xe)
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
 
+	xe_assert(vm->xe, IS_DGFX(vm->xe));
+
 	/* Not reliable without notifier lock, opportunistic only */
-	if (xe_svm_range_in_vram(range)) {
-		drm_dbg(&vm->xe->drm, "Range is already in VRAM\n");
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
 
@@ -810,7 +820,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
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

