Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47F83CCD195
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 03:48:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4A3210E69D;
	Wed, 22 Oct 2025 03:48:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gyhx2O5j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05B9D10E69A
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Oct 2025 03:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761104903; x=1792640903;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yijr+w5BCFGKp8yAaK9frwGgJllFKnHuF3JKfBf2zHo=;
 b=Gyhx2O5jCsfUpeCCDuKURlnOm3amx0FQu2yZ8J/upiN4XZ8j9HRrw2ot
 pHakt49N56GeCrc3odOd7ckKQdPY8Q/8sKU6XptUY3VhS8I5xzajKuyuv
 cns8tcAcicmyhVGwcByiQiBmKMkcN7vt2nKbQRLJ8lej33naj1DsGyzPg
 C0Gzh6KSGvan33C3nzxmD6Ow/by5vSM29IoAJBreG/+GABZULzaw+Arnp
 zguy9VHl5xsFRulu6zR3dafWRNcfZGJgIPege9x3TLTBa8GUXtzd9rYw9
 GoEr3JTH4/dxkd6x5SjPcKhX+/Gqzn3lTqm/NPHnu1RouB1dcPsK9SvVz A==;
X-CSE-ConnectionGUID: 1M1vlwOWTxO6GEr/EVSgsg==
X-CSE-MsgGUID: KFTMm7ZFQyCXhsDV6/plrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67107097"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="67107097"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 20:48:23 -0700
X-CSE-ConnectionGUID: 1lgAhkonQROw7uNiI+sBMQ==
X-CSE-MsgGUID: ZWY7p0AFSaq9Am4M95N+vQ==
X-ExtLoop1: 1
Received: from himal-super-server.iind.intel.com ([10.190.239.34])
 by fmviesa003.fm.intel.com with ESMTP; 21 Oct 2025 20:48:21 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v2 1/4] drm/xe: Add helper to extend CPU-mirrored VMA range
 for merge
Date: Wed, 22 Oct 2025 09:46:46 +0530
Message-Id: <20251022041649.626645-2-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251022041649.626645-1-himal.prasad.ghimiray@intel.com>
References: <20251022041649.626645-1-himal.prasad.ghimiray@intel.com>
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
index 10d77666a425..cf0dd121a474 100644
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

