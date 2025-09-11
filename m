Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9903CA101F
	for <intel-xe@archiver.kernel.org>; Thu, 11 Sep 2025 03:16:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ED3D10E2F9;
	Thu, 11 Sep 2025 03:16:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n5ceFYLp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED95A10E2F9
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Sep 2025 03:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757560570; x=1789096570;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8rW2U9npYW785DSXejog0PWllObVbUrois2DtlSb06U=;
 b=n5ceFYLpp8UmD8KVIvrvETcSq67kEz+/wKnT0hK+KPudpXPKHK5901mK
 V9ihKVcrVt8pV00v6/PdUugoPSTkxyIGxOgv3vW7IHqjouaC+wj4D+znL
 +lYdQ+A5MeA+/QA88gdq05wZ4D0ROGaIPY4JKyAGXH5MNn2BRsriCUtYl
 ECsuU1OIMj2Y+Zk4YzbnwbGaqzXkK1qkG9BLSFI2d7WU+aNoLmo4VKWSe
 Ix++29jjCLZhU4lQm4+NhLqW4WCW42Ox1/yKbJsGs5pKvdb8qqShQ+rEl
 o68aEPH42v8zeWDE2Xrl9A4SpnEeU6j0/t2KOHxKkRik2rh2IOzFDc2PX A==;
X-CSE-ConnectionGUID: cmA4fab2QQeXzZG1PsbL9g==
X-CSE-MsgGUID: U53AViyTT7OTaeTekdYEHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="59576826"
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; d="scan'208";a="59576826"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 20:16:10 -0700
X-CSE-ConnectionGUID: Zhkh5t+5SumZ8sS2K1Jiqg==
X-CSE-MsgGUID: 2wqBaWI1QgSfC2rWIeZeNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; d="scan'208";a="173639545"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by orviesa008.jf.intel.com with ESMTP; 10 Sep 2025 20:16:09 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v4] drm/xe: Misc refine for svm
Date: Thu, 11 Sep 2025 03:14:06 +0000
Message-ID: <20250911031405.1371812-2-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250718212409.86516-2-shuicheng.lin@intel.com>
References: <20250718212409.86516-2-shuicheng.lin@intel.com>
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

These changes should have no functional impact.
1. Correct typo of "operation"in macro range_debug().
2. Combine 2 spin_lock() call in xe_svm_garbage_collector() into 1.
3. Drop redundant preferred_region_is_vram check in
   xe_svm_range_needs_migrate_to_vram().
4. Combine the devmem_possible check in xe_svm_handle_pagefault().
   need_vram includes the IS_DGFX() check, so there is no change for .devmem_only.

v2: revert !ctx.devmem_only change (Matt)
v3: rebase code and refine commit message.
v4: rebase code and refine commit message.

Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 8a0fa90a10c0..173aafb72f46 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -50,11 +50,11 @@ static struct xe_vm *range_to_vm(struct drm_gpusvm_range *r)
 	return gpusvm_to_vm(r->gpusvm);
 }
 
-#define range_debug(r__, operaton__)					\
+#define range_debug(r__, operation__)					\
 	vm_dbg(&range_to_vm(&(r__)->base)->xe->drm,			\
 	       "%s: asid=%u, gpusvm=%p, vram=%d,%d, seqno=%lu, " \
 	       "start=0x%014lx, end=0x%014lx, size=%lu",		\
-	       (operaton__), range_to_vm(&(r__)->base)->usm.asid,	\
+	       (operation__), range_to_vm(&(r__)->base)->usm.asid,	\
 	       (r__)->base.gpusvm,					\
 	       xe_svm_range_in_vram((r__)) ? 1 : 0,			\
 	       xe_svm_range_has_vram_binding((r__)) ? 1 : 0,		\
@@ -347,8 +347,8 @@ static int xe_svm_garbage_collector(struct xe_vm *vm)
 	if (xe_vm_is_closed_or_banned(vm))
 		return -ENOENT;
 
-	spin_lock(&vm->svm.garbage_collector.lock);
 	for (;;) {
+		spin_lock(&vm->svm.garbage_collector.lock);
 		range = list_first_entry_or_null(&vm->svm.garbage_collector.range_list,
 						 typeof(*range),
 						 garbage_collector_link);
@@ -377,8 +377,6 @@ static int xe_svm_garbage_collector(struct xe_vm *vm)
 			else
 				return err;
 		}
-
-		spin_lock(&vm->svm.garbage_collector.lock);
 	}
 	spin_unlock(&vm->svm.garbage_collector.lock);
 
@@ -944,12 +942,12 @@ bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vm
 
 	xe_assert(vm->xe, IS_DGFX(vm->xe));
 
-	if (preferred_region_is_vram && xe_svm_range_in_vram(range)) {
+	if (xe_svm_range_in_vram(range)) {
 		drm_info(&vm->xe->drm, "Range is already in VRAM\n");
 		return false;
 	}
 
-	if (preferred_region_is_vram && range_size < SZ_64K && !supports_4K_migration(vm->xe)) {
+	if (range_size < SZ_64K && !supports_4K_migration(vm->xe)) {
 		drm_dbg(&vm->xe->drm, "Platform doesn't support SZ_4K range migration\n");
 		return false;
 	}
@@ -1010,15 +1008,14 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 				     struct xe_gt *gt, u64 fault_addr,
 				     bool need_vram)
 {
+	int devmem_possible = IS_DGFX(vm->xe) &&
+		IS_ENABLED(CONFIG_DRM_XE_PAGEMAP);
 	struct drm_gpusvm_ctx ctx = {
 		.read_only = xe_vma_read_only(vma),
-		.devmem_possible = IS_DGFX(vm->xe) &&
-			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP),
-		.check_pages_threshold = IS_DGFX(vm->xe) &&
-			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP) ? SZ_64K : 0,
-		.devmem_only = need_vram && IS_ENABLED(CONFIG_DRM_XE_PAGEMAP),
-		.timeslice_ms = need_vram && IS_DGFX(vm->xe) &&
-			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP) ?
+		.devmem_possible = devmem_possible,
+		.check_pages_threshold = devmem_possible ? SZ_64K : 0,
+		.devmem_only = need_vram && devmem_possible,
+		.timeslice_ms = need_vram && devmem_possible ?
 			vm->xe->atomic_svm_timeslice_ms : 0,
 	};
 	struct xe_validation_ctx vctx;
-- 
2.49.0

