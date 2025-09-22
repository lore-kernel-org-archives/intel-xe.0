Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28E91CAC5A7
	for <intel-xe@archiver.kernel.org>; Mon, 22 Sep 2025 10:15:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF67410E407;
	Mon, 22 Sep 2025 10:15:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DTin2Ykv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96FE310E407
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Sep 2025 10:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758536125; x=1790072125;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lNuuA+1AjRXBUYdEW1OaJYzos+PshDlgOJG52lejnCI=;
 b=DTin2Ykvkx46vsnUcRDmuIbO0kt51zFtpIokk2I4HCsYQ6S4xgs+KUET
 zo6g6N2hE5umkPoJOgJN3O+I/5aQ9nXXYQ6gN7rLbwtBFabNOe+DCQbex
 4OXch0S9XKpbxHbs4ooKO7tIQ48RZNs5aocd/nYQzKzT4jX7uRB7qxLno
 Kd+KYuYOOi40uJBS03VHt+FWYScjKqyJLwgSNV4MDe7ijUVxPOnmklc0x
 t5rQPuDAgZkyChZQW0fXaQe/RE61vzCOY9Nt9aOs8MwelkZvoSjN0ao2H
 QePAIuR3ZjlDFUK+LaG86kYxsB+NWnI61LdlVUUCQHcK+v2Gc4s29d8XU w==;
X-CSE-ConnectionGUID: m8eGhLnNR/i9PPen4hzDBQ==
X-CSE-MsgGUID: VpzbVVcrQsuI1WUwOAvZfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="64433381"
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; d="scan'208";a="64433381"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 03:15:25 -0700
X-CSE-ConnectionGUID: O1pia6whTJqjWtQvdtZOew==
X-CSE-MsgGUID: hUaHd02OSUqPA5qu+fTdPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; d="scan'208";a="176263378"
Received: from himal-super-server.iind.intel.com ([10.190.239.34])
 by orviesa007.jf.intel.com with ESMTP; 22 Sep 2025 03:15:23 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH 2/4] drm/xe: Merge adjacent default-attribute VMAs during
 garbage collection
Date: Mon, 22 Sep 2025 16:13:14 +0530
Message-Id: <20250922104316.263995-3-himal.prasad.ghimiray@intel.com>
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

While restoring default memory attributes for VMAs during garbage
collection, extend the target range by checking neighboring VMAs. If
adjacent VMAs are CPU-address-mirrored and have default attributes,
include them in the mergeable range to reduce fragmentation and improve
VMA reuse.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 62 +++++++++++++++++++++----------------
 drivers/gpu/drm/xe/xe_vm.c  |  4 ++-
 2 files changed, 39 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 7f2f1f041f1d..f67cd7b9d59b 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -291,41 +291,51 @@ static int __xe_svm_garbage_collector(struct xe_vm *vm,
 	return 0;
 }
 
-static int xe_svm_range_set_default_attr(struct xe_vm *vm, u64 range_start, u64 range_end)
+static void xe_vma_set_default_attributes(struct xe_vma *vma)
+{
+	vma->attr.preferred_loc.devmem_fd = DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE;
+	vma->attr.preferred_loc.migration_policy = DRM_XE_MIGRATE_ALL_PAGES;
+	vma->attr.pat_index = vma->attr.default_pat_index;
+	vma->attr.atomic_access = DRM_XE_ATOMIC_UNDEFINED;
+}
+
+static int xe_svm_range_set_default_attr(struct xe_vm *vm, u64 start, u64 end)
 {
 	struct xe_vma *vma;
-	struct xe_vma_mem_attr default_attr = {
-		.preferred_loc = {
-			.devmem_fd = DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE,
-			.migration_policy = DRM_XE_MIGRATE_ALL_PAGES,
-		},
-		.atomic_access = DRM_XE_ATOMIC_UNDEFINED,
-	};
-	int err = 0;
+	bool has_default_attr;
+	int err;
 
-	vma = xe_vm_find_vma_by_addr(vm, range_start);
+	vma = xe_vm_find_vma_by_addr(vm, start);
 	if (!vma)
 		return -EINVAL;
 
-	if (xe_vma_has_default_mem_attrs(vma))
-		return 0;
-
 	vm_dbg(&vm->xe->drm, "Existing VMA start=0x%016llx, vma_end=0x%016llx",
 	       xe_vma_start(vma), xe_vma_end(vma));
 
-	if (xe_vma_start(vma) == range_start && xe_vma_end(vma) == range_end) {
-		default_attr.pat_index = vma->attr.default_pat_index;
-		default_attr.default_pat_index  = vma->attr.default_pat_index;
-		vma->attr = default_attr;
-	} else {
-		vm_dbg(&vm->xe->drm, "Split VMA start=0x%016llx, vma_end=0x%016llx",
-		       range_start, range_end);
-		err = xe_vm_alloc_cpu_addr_mirror_vma(vm, range_start, range_end - range_start);
-		if (err) {
-			drm_warn(&vm->xe->drm, "VMA SPLIT failed: %pe\n", ERR_PTR(err));
-			xe_vm_kill(vm, true);
-			return err;
-		}
+	has_default_attr = xe_vma_has_default_mem_attrs(vma);
+
+	if (has_default_attr) {
+		if (xe_svm_has_mapping(vm, xe_vma_start(vma), xe_vma_end(vma)))
+			return 0;
+
+		start = xe_vma_start(vma);
+		end = xe_vma_end(vma);
+	} else if (xe_vma_start(vma) == start && xe_vma_end(vma) == end) {
+		xe_vma_set_default_attributes(vma);
+	}
+
+	xe_vm_find_cpu_addr_mirror_vma_range(vm, &start, &end);
+
+	if (xe_vma_start(vma) == start && xe_vma_end(vma) == end && has_default_attr)
+		return 0;
+
+	vm_dbg(&vm->xe->drm, "New VMA start=0x%016llx, vma_end=0x%016llx",  start, end);
+
+	err = xe_vm_alloc_cpu_addr_mirror_vma(vm, start, end - start);
+	if (err) {
+		drm_warn(&vm->xe->drm, "New VMA MAP failed: %pe\n", ERR_PTR(err));
+		xe_vm_kill(vm, true);
+		return err;
 	}
 
 	/*
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 4927f2fd9349..246bff91fa43 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -4345,7 +4345,9 @@ int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
 
 static bool is_cpu_addr_vma_with_default_attr(struct xe_vma *vma)
 {
-	return vma && xe_vma_is_cpu_addr_mirror(vma) && xe_vma_has_default_mem_attrs(vma);
+	return vma && xe_vma_is_cpu_addr_mirror(vma) &&
+	       !xe_svm_has_mapping(xe_vma_vm(vma), xe_vma_start(vma), xe_vma_end(vma)) &&
+	       xe_vma_has_default_mem_attrs(vma);
 }
 
 /**
-- 
2.34.1

