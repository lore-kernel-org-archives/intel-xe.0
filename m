Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5485BC3601A
	for <intel-xe@archiver.kernel.org>; Mon,  7 Apr 2025 09:53:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1708A10E3FE;
	Mon,  7 Apr 2025 09:53:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A/7Qm9dp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 250DA10E3F3
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Apr 2025 09:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744019583; x=1775555583;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aADHP2N9UpqdoshpbuH2YYVFl8Aj2ciQRkKteVDOeXQ=;
 b=A/7Qm9dpYyBxJeZ4rtEqxx77ndh62JrikZ9IaPz9xaBqqpjk0PHM5Oa1
 YC2M/fVpnQzOrnFI+H7CxXQ5U2Twi9CJBWu5JeS3exU2PAFf7uuNfxfXk
 ZuoN8//n0BZaWGXy8SuIXC4/L4UjloSS/Wxe48whXk1nm6Y6Q73edTRdt
 XXKaaLIyIk9OP77BIkTivQV3aV65kFAP94bqlPAF0mKOyULV76OiwGzwW
 tmOTHT3a/ti02OttN7MWle8YSVs4Jt3DbPK+2jRU2YghvegptReVCctTt
 50lEl7YlNStAssK8FOXI75WLRsZO6pAMQkERK7ccjk8ezZj/+2zrxgQeB A==;
X-CSE-ConnectionGUID: qNHBBVvsSL6mXIBJyfEg5A==
X-CSE-MsgGUID: cVMBuq0zQLKM4Va2YrElPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="56029398"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="56029398"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 02:53:03 -0700
X-CSE-ConnectionGUID: q660Y85ZTQOK6hJTfGVrJg==
X-CSE-MsgGUID: U4zre5wrTueDRTuipPkFCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="128778692"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa009.fm.intel.com with ESMTP; 07 Apr 2025 02:53:01 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v2 11/32] drm/xe/svm: Add function to determine if range needs
 VRAM migration
Date: Mon,  7 Apr 2025 15:46:58 +0530
Message-Id: <20250407101719.3350996-12-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
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
migration to vram or not, for pagefault try at least once.

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 49 +++++++++++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_svm.h | 10 ++++++++
 2 files changed, 57 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 8cd35553a927..f4ae3feaf9d3 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -709,6 +709,51 @@ int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
 }
 #endif
 
+static bool supports_4K_migration(struct xe_device *xe)
+{
+	if (xe->info.platform == XE_BATTLEMAGE)
+		return true;
+
+	return false;
+}
+
+/**
+ * xe_svm_range_needs_migrate_to_vram() - SVM range needs migrate to VRAM or not
+ * @range: SVM range for which migration needs to be decided
+ * @vma: vma which has range
+ * @region: default placement for range
+ *
+ * Return: True for range needing migration and migration is supported else false
+ */
+bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vma *vma,
+					u32 region)
+{
+	struct xe_vm *vm = range_to_vm(&range->base);
+	u64 range_size = xe_svm_range_size(range);
+	bool needs_migrate = false;
+
+	if (!range->base.flags.migrate_devmem)
+		return false;
+
+	needs_migrate = region;
+
+	if (needs_migrate && !IS_DGFX(vm->xe)) {
+		drm_warn(&vm->xe->drm, "Platform doesn't support VRAM\n");
+		return false;
+	}
+
+	if (needs_migrate && xe_svm_range_in_vram(range)) {
+		drm_info(&vm->xe->drm, "Range is already in VRAM\n");
+		return false;
+	}
+
+	if (needs_migrate && range_size <= SZ_64K && !supports_4K_migration(vm->xe)) {
+		drm_warn(&vm->xe->drm, "Platform doesn't support SZ_4K range migration\n");
+		return false;
+	}
+
+	return needs_migrate;
+}
 
 /**
  * xe_svm_handle_pagefault() - SVM handle page fault
@@ -763,8 +808,8 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	range_debug(range, "PAGE FAULT");
 
 	/* XXX: Add migration policy, for now migrate range once */
-	if (!range->skip_migrate && range->base.flags.migrate_devmem &&
-	    xe_svm_range_size(range) >= SZ_64K) {
+	if (!range->skip_migrate &&
+	    xe_svm_range_needs_migrate_to_vram(range, vma, IS_DGFX(vm->xe))) {
 		range->skip_migrate = true;
 
 		err = xe_svm_alloc_vram(vm, tile, range, &ctx);
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index 9c4c3aeacc6c..d5be8229ca7e 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -95,6 +95,9 @@ struct xe_svm_range *xe_svm_range_find_or_insert(struct xe_vm *vm, u64 addr,
 int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
 			   struct drm_gpusvm_ctx *ctx);
 
+bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vma *vma,
+					u32 region);
+
 /**
  * xe_svm_range_has_dma_mapping() - SVM range has DMA mapping
  * @range: SVM range
@@ -281,6 +284,13 @@ static inline unsigned long xe_svm_range_size(struct xe_svm_range *range)
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

