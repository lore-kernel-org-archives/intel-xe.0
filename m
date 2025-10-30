Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CC88CCF9F0
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 14:24:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B85B10E9B7;
	Thu, 30 Oct 2025 14:24:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cj+gVASV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 020D910E9BD
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Oct 2025 14:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761834256; x=1793370256;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=noXJ3xZfTNa7kYEsDVidoHb99vtN24SwnWsrwwlxJos=;
 b=cj+gVASV7Jbl13NCRvPzMkQ7MTVNV5AbEKRk9ENg+EZW63y3MgMvA4Xq
 AWM77Z+YluESEPHAHMuyFFwBMDq+g2ZFQGW0SsG7DqzVMFNLX4Kh+gAOk
 YHx042Mka/QKC+Oi83xBl4MJ70JY5MPSTfietwraFglRCOJs73ruW8M+B
 Pwskx9GOLJOWKbnG43wfqFqDlp/wpIPWSq5H8+M/k13H5cU+TmwXwz223
 F6exKRQwC0P4VUIynyxKIu041WF2veUCkAf35xJXOa6loe8WU2Guetw/i
 KmjX5BvOobZ7lwFrtMjmwqfGCbwALtY+rG417u1xT4sPvwCYDT0xDC8sG w==;
X-CSE-ConnectionGUID: gn86KgKjT26/vgSCLicJlQ==
X-CSE-MsgGUID: 7Eu65QknRWmNd0KKMGLiNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="63181329"
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="63181329"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 07:24:16 -0700
X-CSE-ConnectionGUID: ceTrUywvRjSPK1isSDQlFw==
X-CSE-MsgGUID: DKW5/+c7QtmGQY+9XNeclQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="216625313"
Received: from himal-super-server.iind.intel.com (HELO
 hghimira.iind.intel.com) ([10.190.239.34])
 by orviesa002.jf.intel.com with ESMTP; 30 Oct 2025 07:24:15 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v3 1/5] drm/xe: Add helper to extend CPU-mirrored VMA range
 for merge
Date: Thu, 30 Oct 2025 20:22:49 +0530
Message-Id: <20251030145253.867189-2-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251030145253.867189-1-himal.prasad.ghimiray@intel.com>
References: <20251030145253.867189-1-himal.prasad.ghimiray@intel.com>
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

v2
- Add assert
- Move unmap check to this patch

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 41 ++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.h |  3 +++
 2 files changed, 44 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 00f3520dec38..5037fd246547 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -4363,6 +4363,47 @@ int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
 	return xe_vm_alloc_vma(vm, &map_req, true);
 }
 
+static bool is_cpu_addr_vma_with_default_attr(struct xe_vma *vma)
+{
+	return vma && xe_vma_is_cpu_addr_mirror(vma) &&
+	       !xe_svm_has_mapping(xe_vma_vm(vma), xe_vma_start(vma), xe_vma_end(vma)) &&
+	       xe_vma_has_default_mem_attrs(vma);
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
+	lockdep_assert_held(&vm->lock);
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

