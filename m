Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 932B4CAC592
	for <intel-xe@archiver.kernel.org>; Mon, 22 Sep 2025 10:15:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A13A10E406;
	Mon, 22 Sep 2025 10:15:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PoXz8wFp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE76510E406
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Sep 2025 10:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758536123; x=1790072123;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wssnbn8RuUGWzWAlbfqNekHMofSAMFP6DJz+gv6oyFU=;
 b=PoXz8wFp8tKtpK1oShGq3Xbg5lj75yzG+e0USIK7otgxTfeaghdg6O2z
 SlFK+41NFMCiTVqBhjndHDNzuNV+40EHC9HmVk5ZD1tdBU952yCU3JW/4
 sm/dMhB9Z4DyLwMjaZ0HMgxPd8J5Cnp20mlQKmfOosi9hHkrXMpCDD+7u
 arzxjab+F12qsdTvHIkRLNgIu8+33ofIZJ/QgliTWpTScUPa4thF0vsQZ
 MVln0IWqoPxb79sjt3503xwBvXR+eCz/uO5PDQYKZnB3QetFwWfi56MFN
 ccnfMF1QtAEcZNzHBDVB1RV8i7Pfy5Mc8br1cmJt2o/tmJAdQFSfVjTqD Q==;
X-CSE-ConnectionGUID: sfViGs2fTfONwhcBcbHoCQ==
X-CSE-MsgGUID: yhWXALdbT6SRpmLb4nNY9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="64433377"
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; d="scan'208";a="64433377"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 03:15:23 -0700
X-CSE-ConnectionGUID: rfzz93wdTmSVMPxSn4641A==
X-CSE-MsgGUID: +Z7HjiXQTVix5bSY/rqHHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; d="scan'208";a="176263374"
Received: from himal-super-server.iind.intel.com ([10.190.239.34])
 by orviesa007.jf.intel.com with ESMTP; 22 Sep 2025 03:15:21 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH 1/4] drm/xe: Add helper to extend CPU-mirrored VMA range for
 merge
Date: Mon, 22 Sep 2025 16:13:13 +0530
Message-Id: <20250922104316.263995-2-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250922104316.263995-1-himal.prasad.ghimiray@intel.com>
References: <20250922104316.263995-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Introduce xe_vm_find_cpu_addr_mirror_vma_range(), which computes an
extended range around a given range by including adjacent VMAs that are
CPU-address-mirrored and have default memory attributes. This helper is
useful for determining mergeable range without performing the actual merge.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 37 +++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.h |  3 +++
 2 files changed, 40 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 0cacab20ff85..4927f2fd9349 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -4343,6 +4343,43 @@ int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
 	return xe_vm_alloc_vma(vm, &map_req, true);
 }
 
+static bool is_cpu_addr_vma_with_default_attr(struct xe_vma *vma)
+{
+	return vma && xe_vma_is_cpu_addr_mirror(vma) && xe_vma_has_default_mem_attrs(vma);
+}
+
+/**
+ * xe_vm_find_cpu_addr_mirror_vma_range - Extend a VMA range to include adjacent CPU-mirrored VMAs
+ * @vm: VM to search within
+ * @start: Input/output pointer to the starting address of the range
+ * @end: Input/output pointer to the end address of the range
+ *
+ * Given a range defined by @start and @range, this function checks the VMAs
+ * immediately before and after the range. If those neighboring VMAs are
+ * CPU-address-mirrored and have default memory attributes, the function
+ * updates @start and @range to include them. This extended range can then
+ * be used for merging or other operations that require a unified VMA.
+ *
+ * The function does not perform the merge itself; it only computes the
+ * mergeable boundaries.
+ */
+void xe_vm_find_cpu_addr_mirror_vma_range(struct xe_vm *vm, u64 *start, u64 *end)
+{
+	struct xe_vma *prev, *next;
+
+	if (*start > 0) {
+		prev = xe_vm_find_vma_by_addr(vm, *start - 1);
+		if (is_cpu_addr_vma_with_default_attr(prev))
+			*start = xe_vma_start(prev);
+	}
+
+	if (*end < vm->size) {
+		next = xe_vm_find_vma_by_addr(vm, *end + 1);
+		if (is_cpu_addr_vma_with_default_attr(next))
+			*end = xe_vma_end(next);
+	}
+}
+
 /**
  * xe_vm_alloc_cpu_addr_mirror_vma - Allocate CPU addr mirror vma
  * @vm: Pointer to the xe_vm structure
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index ef8a5019574e..361f10b3c453 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -68,6 +68,9 @@ xe_vm_find_overlapping_vma(struct xe_vm *vm, u64 start, u64 range);
 
 bool xe_vma_has_default_mem_attrs(struct xe_vma *vma);
 
+void xe_vm_find_cpu_addr_mirror_vma_range(struct xe_vm *vm,
+					  u64 *start,
+					  u64 *end);
 /**
  * xe_vm_has_scratch() - Whether the vm is configured for scratch PTEs
  * @vm: The vm
-- 
2.34.1

