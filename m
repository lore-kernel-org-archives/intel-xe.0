Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B09DC35FF1
	for <intel-xe@archiver.kernel.org>; Fri, 14 Mar 2025 07:38:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30B2710E97B;
	Fri, 14 Mar 2025 07:38:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fNnI8xBb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8884810E978
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Mar 2025 07:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741937907; x=1773473907;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=a6xzFUEpcQL0DD0q8SVrNz9Tq4fmDNYdyP2eSg+26Qk=;
 b=fNnI8xBbYtGhsWJYkDkkmviHPE2e4xHEZDCX0BdYSVBQcCGgRIlPgQSs
 aM2qNsl71Uix3Fl5PqJI86lHH4HRpN6n3yDpkXfjuhwCrzC5WIDTiYujG
 yopms6xUwf1IzIb6c6qwWZBEVT3PiUUBGS8N5IeDUgfRjPltEZeFX6qfd
 6PfuwNoSYaHzywiNTV2YfCupBABnwwLdNUdz4ci7dI/QwneYTPUoHCowe
 5F00VjspbnarL+wb4oORNAzzWuHoZGj3pf1/9/CSIbkyW7MCxSPAk2cKG
 6QSOtzR5a1KLu8L0HWANj7YCaUI4eioJiJMdMUX2S4snwZw9ajn6SgQQO g==;
X-CSE-ConnectionGUID: wWkzscMpSAWy+odWkH3Xkg==
X-CSE-MsgGUID: /IDB7u+KSgi58aliz/U4lA==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="68445995"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="68445995"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 00:38:26 -0700
X-CSE-ConnectionGUID: ktOv1YpvT+uYqSr6QyeMRg==
X-CSE-MsgGUID: PGnnSr25RWeQg0iB8gaTmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="152043732"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by orviesa002.jf.intel.com with ESMTP; 14 Mar 2025 00:38:24 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 oak.zeng@intel.com, Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [RFC 08/29] drm/xe: Rename lookup_vma function to xe_find_vma_by_addr
Date: Fri, 14 Mar 2025 13:32:05 +0530
Message-Id: <20250314080226.2059819-9-himal.prasad.ghimiray@intel.com>
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

This update renames the lookup_vma function to xe_vm_find_vma_by_addr and
makes it accessible externally. The function, which looks up a VMA by
its address within a specified VM, will be utilized in upcoming patches.

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c | 24 +----------------------
 drivers/gpu/drm/xe/xe_vm.c           | 29 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.h           |  2 ++
 3 files changed, 32 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index c5ad9a0a89c2..3aaf4090fcfe 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -72,28 +72,6 @@ static bool vma_is_valid(struct xe_tile *tile, struct xe_vma *vma)
 		!(BIT(tile->id) & vma->tile_invalidated);
 }
 
-static bool vma_matches(struct xe_vma *vma, u64 page_addr)
-{
-	if (page_addr > xe_vma_end(vma) - 1 ||
-	    page_addr + SZ_4K - 1 < xe_vma_start(vma))
-		return false;
-
-	return true;
-}
-
-static struct xe_vma *lookup_vma(struct xe_vm *vm, u64 page_addr)
-{
-	struct xe_vma *vma = NULL;
-
-	if (vm->usm.last_fault_vma) {   /* Fast lookup */
-		if (vma_matches(vm->usm.last_fault_vma, page_addr))
-			vma = vm->usm.last_fault_vma;
-	}
-	if (!vma)
-		vma = xe_vm_find_overlapping_vma(vm, page_addr, SZ_4K);
-
-	return vma;
-}
 
 static int xe_pf_begin(struct drm_exec *exec, struct xe_vma *vma,
 		       bool atomic, unsigned int id)
@@ -231,7 +209,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 		goto unlock_vm;
 	}
 
-	vma = lookup_vma(vm, pf->page_addr);
+	vma = xe_vm_find_vma_by_addr(vm, pf->page_addr);
 	if (!vma) {
 		err = -EINVAL;
 		goto unlock_vm;
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index b83154d338c7..07cad2804b14 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2135,6 +2135,35 @@ int xe_vm_destroy_ioctl(struct drm_device *dev, void *data,
 	return err;
 }
 
+static bool vma_matches(struct xe_vma *vma, u64 page_addr)
+{
+	if (page_addr > xe_vma_end(vma) - 1 ||
+	    page_addr + SZ_4K - 1 < xe_vma_start(vma))
+		return false;
+
+	return true;
+}
+
+/**
+ * xe_vm_find_vma_by_addr() - Find a VMA by its address
+ *
+ * @vm: the xe_vm the vma belongs to
+ * @page_address: address to look up
+ */
+struct xe_vma *xe_vm_find_vma_by_addr(struct xe_vm *vm, u64 page_addr)
+{
+	struct xe_vma *vma = NULL;
+
+	if (vm->usm.last_fault_vma) {   /* Fast lookup */
+		if (vma_matches(vm->usm.last_fault_vma, page_addr))
+			vma = vm->usm.last_fault_vma;
+	}
+	if (!vma)
+		vma = xe_vm_find_overlapping_vma(vm, page_addr, SZ_4K);
+
+	return vma;
+}
+
 static const u32 region_to_mem_type[] = {
 	XE_PL_TT,
 	XE_PL_VRAM0,
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 0ef811fc2bde..99e164852f63 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -169,6 +169,8 @@ static inline bool xe_vma_is_userptr(struct xe_vma *vma)
 		!xe_vma_is_cpu_addr_mirror(vma);
 }
 
+struct xe_vma *xe_vm_find_vma_by_addr(struct xe_vm *vm, u64 page_addr);
+
 /**
  * to_userptr_vma() - Return a pointer to an embedding userptr vma
  * @vma: Pointer to the embedded struct xe_vma
-- 
2.34.1

