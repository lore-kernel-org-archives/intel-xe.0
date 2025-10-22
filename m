Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25063CCD1AB
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 03:48:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF2D510E69A;
	Wed, 22 Oct 2025 03:48:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rq2pB2Jd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0B2F10E69A
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Oct 2025 03:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761104905; x=1792640905;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DoZ3W3wIbkvnqSfjfUZo/SljSmM5FKitmIoJNKva4Mo=;
 b=Rq2pB2Jd88k9IPk4MiPReFCHGs+/oQntzR+/CF2MgJloa5IDQwvqfJg3
 zpdlWjSpGvUiB6jHPXolg8JbHALaMQUPBVkOVWp6JYlH/M3rSwAsZlJwQ
 B9Dl2WOsz1grjb30xm2WQhd4X9DHrILApoK//zJ/KYdwTWbTdid0iIx7I
 v6JR+X1xKYY/9vmimv/g/X/U1w4eLkOOY4fWAFV2zViCsDGttuhucaGJr
 PyAirS945cuxpb+YQU3lPg5K/nNrjmTi7no1QqEpoK4+gAoTrIep8edwy
 pzSA8OAqpk+jlYUkR3/ekfR/aVqskoX076Ghnvondsds60oatJCJbEXvU g==;
X-CSE-ConnectionGUID: dEg3BlDdTLGTCSmjPaEtXg==
X-CSE-MsgGUID: 1Ga1xmyzTgWLJECjKkTJUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67107099"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="67107099"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 20:48:25 -0700
X-CSE-ConnectionGUID: b5Tfas9gTMeIbHq5yfmIHQ==
X-CSE-MsgGUID: d0mVcK8GRpKWzhQbqOBQLA==
X-ExtLoop1: 1
Received: from himal-super-server.iind.intel.com ([10.190.239.34])
 by fmviesa003.fm.intel.com with ESMTP; 21 Oct 2025 20:48:23 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v2 2/4] drm/xe: Merge adjacent default-attribute VMAs during
 garbage collection
Date: Wed, 22 Oct 2025 09:46:47 +0530
Message-Id: <20251022041649.626645-3-himal.prasad.ghimiray@intel.com>
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

While restoring default memory attributes for VMAs during garbage
collection, extend the target range by checking neighboring VMAs. If
adjacent VMAs are CPU-address-mirrored and have default attributes,
include them in the mergeable range to reduce fragmentation and improve
VMA reuse.

v2
-Rebase

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 62 +++++++++++++++++++++----------------
 1 file changed, 36 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 129e7818565c..d742a084ab53 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -286,19 +286,21 @@ static int __xe_svm_garbage_collector(struct xe_vm *vm,
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
 
@@ -307,25 +309,33 @@ static int xe_svm_range_set_default_attr(struct xe_vm *vm, u64 range_start, u64
 		return 0;
 	}
 
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
-- 
2.34.1

