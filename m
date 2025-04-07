Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AF88C36010
	for <intel-xe@archiver.kernel.org>; Mon,  7 Apr 2025 09:53:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 017E710E3F5;
	Mon,  7 Apr 2025 09:53:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fxqhwafr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7980910E3F5
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Apr 2025 09:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744019586; x=1775555586;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7I3CWTCyRxw6K0GbU1iGEJo98wRHwZOrRXQRTCTJlWM=;
 b=fxqhwafr4swyIxkRrhNJ0hWGIvDBzR7J3mRRI3LFm83/+vMRFnvmm5Kq
 FCNr9z4QOgTVl3gejloNGVtPh9m7OqyXu/CU2FiNbqf3NajauOcYUL8Uc
 QuYTPWkAwlLc9Urpupd0HAcdco0hxu83mQpDn8RstQ4Rf0AYrPh2sb2hH
 p+HdDD7rMIx93bJyb+xT/Zl6aqa7/pwZx3qr35TqRUC5T8+LhDtszU0f/
 qaW2ezq51C98QoZhxpV502TLfYldJOFLMRi7HZHp0E1UYn2iN1pnuKFD5
 UGVB//kOVf5zmPFaGZhDiw2lQZiR+4nfhlVWY63lsQhLoV9AQ0NaBJWeB A==;
X-CSE-ConnectionGUID: xnM7ImjOS/+6bVxyj7EFaA==
X-CSE-MsgGUID: gS4DBBweT66TRcGeUe4hjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="56029405"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="56029405"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 02:53:06 -0700
X-CSE-ConnectionGUID: oVrucy8tTQmFV0Ymn3dH+Q==
X-CSE-MsgGUID: iM+65+FgQvyisFc0e61QCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="128778718"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa009.fm.intel.com with ESMTP; 07 Apr 2025 02:53:05 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v2 13/32] drm/xe/svm: Incase of atomic access ensure get_pages
 happens from vram
Date: Mon,  7 Apr 2025 15:47:00 +0530
Message-Id: <20250407101719.3350996-14-himal.prasad.ghimiray@intel.com>
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

Ranges can be invalidated in between vram allocation and get_pages,
ensure the dma mapping is happening from vram only incase of atomic
access. Retry 3 times before calling out fault in case of concurrent
cpu/gpu access.

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 43 ++++++++++++++++++++++++-------------
 1 file changed, 28 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index f4ae3feaf9d3..7ec7ecd7eb1f 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -778,11 +778,13 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
 		.check_pages_threshold = IS_DGFX(vm->xe) &&
 			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ? SZ_64K : 0,
+		.vram_only = 0,
 	};
 	struct xe_svm_range *range;
 	struct drm_exec exec;
 	struct dma_fence *fence;
 	struct xe_tile *tile = gt_to_tile(gt);
+	int retry_count = 3;
 	ktime_t end = 0;
 	int err;
 
@@ -792,6 +794,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_PAGEFAULT_COUNT, 1);
 
 retry:
+	retry_count--;
 	/* Always process UNMAPs first so view SVM ranges is current */
 	err = xe_svm_garbage_collector(vm);
 	if (err)
@@ -807,30 +810,40 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 
 	range_debug(range, "PAGE FAULT");
 
-	/* XXX: Add migration policy, for now migrate range once */
-	if (!range->skip_migrate &&
-	    xe_svm_range_needs_migrate_to_vram(range, vma, IS_DGFX(vm->xe))) {
-		range->skip_migrate = true;
-
+	if (xe_svm_range_needs_migrate_to_vram(range, vma, IS_DGFX(vm->xe))) {
 		err = xe_svm_alloc_vram(vm, tile, range, &ctx);
 		if (err) {
-			drm_dbg(&vm->xe->drm,
-				"VRAM allocation failed, falling back to "
-				"retrying fault, asid=%u, errno=%pe\n",
-				vm->usm.asid, ERR_PTR(err));
-			goto retry;
+			if (retry_count) {
+				drm_dbg(&vm->xe->drm,
+					"VRAM allocation failed, falling back to retrying fault, asid=%u, errno=%pe\n",
+					vm->usm.asid, ERR_PTR(err));
+				goto retry;
+			} else {
+				drm_err(&vm->xe->drm,
+					"VRAM allocation failed, retry count exceeded, asid=%u, errno=%pe\n",
+					vm->usm.asid, ERR_PTR(err));
+				return err;
+			}
 		}
+
 	}
 
+	if (atomic)
+		ctx.vram_only = 1;
+
 	range_debug(range, "GET PAGES");
 	err = xe_svm_range_get_pages(vm, range, &ctx);
 	/* Corner where CPU mappings have changed */
 	if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM) {
-		drm_dbg(&vm->xe->drm,
-			"Get pages failed, falling back to retrying, asid=%u, gpusvm=%p, errno=%pe\n",
-			vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
-		range_debug(range, "PAGE FAULT - RETRY PAGES");
-		goto retry;
+		if (retry_count) {
+			drm_dbg(&vm->xe->drm, "Get pages failed, falling back to retrying, asid=%u, gpusvm=%p, errno=%pe\n",
+				vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
+			range_debug(range, "PAGE FAULT - RETRY PAGES");
+			goto retry;
+		} else {
+			drm_err(&vm->xe->drm, "Get pages failed,, retry count exceeded, asid=%u,, errno=%pe\n",
+				vm->usm.asid, ERR_PTR(err));
+		}
 	}
 	if (err) {
 		range_debug(range, "PAGE FAULT - FAIL PAGE COLLECT");
-- 
2.34.1

