Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42787C36010
	for <intel-xe@archiver.kernel.org>; Mon,  7 Apr 2025 09:53:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02F5910E405;
	Mon,  7 Apr 2025 09:53:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LCmO/Z7J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE07E10E405
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Apr 2025 09:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744019611; x=1775555611;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+CJUxIS9h5X0EkxLx78ZCLOfBLwzbIDWBsaREx2jIII=;
 b=LCmO/Z7JrBDjNaiqAsIZEdiU4G06aNHTAD42qTKDO3ByBishPzFrqGxd
 U194C5lrcaiPnKvJppzlzy/o0Wbqso0OvfTUL/YbXTQxrWE+rxFQ+6wRF
 m18n2mpdpShtCqn+IwVp9Fv7o9cbwbHuXu94qPDBxA9++rXXVMF3ck7+a
 axwJTnpjgKp7/WgW/Lz5hBSsK1Xs8BlOC2TLEizaoKbzJviflz4uiO1J9
 FT+dOka01THnsEih7IsLsCBbFX0JfbAkkJFN/Czr3KLugKgzPJYLM2Gid
 vyA0iZ14+Deh6g6ym3168ZKMbjONyteTkS66hbmrfZ+cwedJGVgDNlSxq Q==;
X-CSE-ConnectionGUID: Zop6rPSATw6boq3WxfdMrw==
X-CSE-MsgGUID: BI8h6KrvTx2GW11sZOQ/yw==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="56029458"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="56029458"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 02:53:31 -0700
X-CSE-ConnectionGUID: l3JLfHN0TfG8CpwsbRI74w==
X-CSE-MsgGUID: YfPqpOebTUq8n0QJtZb7OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="128778897"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa009.fm.intel.com with ESMTP; 07 Apr 2025 02:53:29 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v2 26/32] drm/xe/madvise: Update migration policy based on
 preferred location
Date: Mon,  7 Apr 2025 15:47:13 +0530
Message-Id: <20250407101719.3350996-27-himal.prasad.ghimiray@intel.com>
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

When the user sets the valid devmem_fd as a preferred location, GPU fault
will trigger migration to tile of device associated with devmem_fd.

If the user sets an invalid devmem_fd the preferred location is current
placement only.

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c        | 15 ++++++++++++++-
 drivers/gpu/drm/xe/xe_vm.h         |  3 +++
 drivers/gpu/drm/xe/xe_vm_madvise.c | 20 +++++++++++++++++++-
 3 files changed, 36 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index d40111e29bfe..60dfb1bf12ca 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -765,6 +765,12 @@ bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vm
 	return needs_migrate;
 }
 
+static const u32 region_to_mem_type[] = {
+	XE_PL_TT,
+	XE_PL_VRAM0,
+	XE_PL_VRAM1,
+};
+
 /**
  * xe_svm_handle_pagefault() - SVM handle page fault
  * @vm: The VM.
@@ -796,6 +802,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	struct xe_tile *tile = gt_to_tile(gt);
 	int retry_count = 3;
 	ktime_t end = 0;
+	u32 region;
 	int err;
 
 	lockdep_assert_held_write(&vm->lock);
@@ -820,7 +827,13 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 
 	range_debug(range, "PAGE FAULT");
 
-	if (xe_svm_range_needs_migrate_to_vram(range, vma, IS_DGFX(vm->xe))) {
+	region = vma->attr.preferred_loc.devmem_fd;
+
+	if (xe_svm_range_needs_migrate_to_vram(range, vma, region)) {
+		region = region ? region : 1;
+		/* Need rework for multigpu */
+		tile = &vm->xe->tiles[region_to_mem_type[region] - XE_PL_VRAM0];
+
 		err = xe_svm_alloc_vram(vm, tile, range, &ctx);
 		if (err) {
 			if (retry_count) {
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 4e45230b7205..377f62f859b7 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -220,6 +220,9 @@ int __xe_vm_userptr_needs_repin(struct xe_vm *vm);
 
 int xe_vm_userptr_check_repin(struct xe_vm *vm);
 
+bool xe_vma_has_preferred_mem_loc(struct xe_vma *vma,
+				  u32 *mem_region, u32 *devmem_fd);
+
 int xe_vm_rebind(struct xe_vm *vm, bool rebind_worker);
 struct dma_fence *xe_vma_rebind(struct xe_vm *vm, struct xe_vma *vma,
 				u8 tile_mask);
diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index 7e1a95106cb9..f870e8642190 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -61,7 +61,25 @@ static int madvise_preferred_mem_loc(struct xe_device *xe, struct xe_vm *vm,
 				     struct xe_vma **vmas, int num_vmas,
 				     struct drm_xe_madvise_ops ops)
 {
-	/* Implementation pending */
+	s32 devmem_fd;
+	u32 migration_policy;
+	int i;
+
+	xe_assert(vm->xe, ops.type == DRM_XE_VMA_ATTR_PREFERRED_LOC);
+	vm_dbg(&xe->drm, "migration policy = %d, devmem_fd = %d\n",
+	       ops.preferred_mem_loc.migration_policy,
+	       ops.preferred_mem_loc.devmem_fd);
+
+	devmem_fd = (s32)ops.preferred_mem_loc.devmem_fd;
+	devmem_fd = (devmem_fd < 0) ? 0 : devmem_fd;
+
+	migration_policy = ops.preferred_mem_loc.migration_policy;
+
+	for (i = 0; i < num_vmas; i++) {
+		vmas[i]->attr.preferred_loc.devmem_fd = devmem_fd;
+		vmas[i]->attr.preferred_loc.migration_policy = migration_policy;
+	}
+
 	return 0;
 }
 
-- 
2.34.1

