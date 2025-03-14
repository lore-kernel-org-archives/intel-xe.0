Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A90B2C35FF1
	for <intel-xe@archiver.kernel.org>; Fri, 14 Mar 2025 07:39:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D6E110E98C;
	Fri, 14 Mar 2025 07:39:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l5hcJ5HP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA66710E98C
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Mar 2025 07:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741937939; x=1773473939;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KgMz+l3JjWZiKcWDUl33gOKCH4tz7RbImRCbdR0L2FQ=;
 b=l5hcJ5HP4Ar/EzvGOnPRNUCW19E5b3dzBeyV3/RkWkvujue2Ghp2d5wP
 yLdv8cfvSmZF7/rMHaeJrfVmyr6vXaZxX7HBl8dpzdVWuhntvUpYoXUjj
 aZRGPSHx7vj5ooYWIv/UjTCVhwdd1uDfD5ikW9+vt7wfX4IUmpTtg14mf
 f0GDulegEKYtzmyiyfSNS4ZF3uHWS4Js58BaYIOF0ET89Iv9N/PCpd3A7
 o0WATu2SCMRwsozQweWwBllnSUaMdPmFH53QlTpdDu86sYRcuokGHKpgE
 mOpBx9QBiOblAjzr8mSsZ2MBLgGuplorf/lGZKEU6luXF37I1A4jeW6jb Q==;
X-CSE-ConnectionGUID: ZzWpkKbVTwiAOAXM8c8lcA==
X-CSE-MsgGUID: satTiqUISNqPOz4XgE7gDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="68446113"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="68446113"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 00:38:59 -0700
X-CSE-ConnectionGUID: LCekmjNrTUiSk+H4GtNtlg==
X-CSE-MsgGUID: LxTWAz8CRHCrQVqM9kYR+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="152043869"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by orviesa002.jf.intel.com with ESMTP; 14 Mar 2025 00:38:57 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 oak.zeng@intel.com, Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [RFC 23/29] drm/xe/madvise: Update migration policy based on
 preferred location
Date: Fri, 14 Mar 2025 13:32:20 +0530
Message-Id: <20250314080226.2059819-24-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250314080226.2059819-1-himal.prasad.ghimiray@intel.com>
References: <20250314080226.2059819-1-himal.prasad.ghimiray@intel.com>
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
 drivers/gpu/drm/xe/xe_svm.c        | 14 ++++++++++----
 drivers/gpu/drm/xe/xe_vm.h         |  3 +++
 drivers/gpu/drm/xe/xe_vm_madvise.c | 20 +++++++++++++++++++-
 3 files changed, 32 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index cb876000411f..ed7f0cfbb546 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -745,6 +745,12 @@ bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vm
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
@@ -796,13 +802,13 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 
 	range_debug(range, "PAGE FAULT");
 
-	/* for gpu pagefault always migrate to local vram unless
-	 * preferred location provided by madvise
-	 */
-	region = 1;
+	region = vma->attr.preferred_loc.devmem_fd;
 
 	if (xe_svm_range_needs_migrate_to_vram(range, vma, region)) {
 		migrate_try_count--;
+		region = region ? region : 1;
+		/* Need rework for multigpu */
+		tile = &vm->xe->tiles[region_to_mem_type[region] - XE_PL_VRAM0];
 
 		err = xe_svm_alloc_vram(vm, tile, range, &ctx);
 		if (err) {
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

