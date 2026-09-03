Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E997CC624DB
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 15:01:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A84E710F686;
	Thu,  3 Sep 2026 15:01:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aX9+Ft6a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34E1810F684
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 15:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788447714; x=1819983714;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WjfJEUoh136LuEaawzuC/tbm6tW8nDXIdZDteHSI+fM=;
 b=aX9+Ft6a0zJlXxbw/gYMMm0MpIK9fRklgKKSnEGm6W0J7pl989T0/0aT
 Ow0GpoDw6/7+no9Ot4BCzRjMDlwYkgauzZ/8r9e9dtBcYmg2L9Ckhwrc6
 uRCxoYBiNwQhsNr9m5oBZV5odsvDa1wZ+lzDoLflzruPYyqpTtVZMWqh4
 Kymfp4lQScb7tREfvMViTk3QAZiy7CpaihpNpfCV3snE++0QzdpVMGGZx
 g5HyZpmDL3hV9sHrfMr3JyM7hH6yR7D4ty42hFhTzQ97QNsIKuOiDJLge
 sy6eI0DVk7bT2A4DcH5/+SP2TB5YFhgaikVSqNnjCXr0n6WXRSmN8zoGM Q==;
X-CSE-ConnectionGUID: r+K201lOSiG2+bmWDnnhhQ==
X-CSE-MsgGUID: 85FzQtZFQeK1IuZOXG1E6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="76486916"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="76486916"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 08:01:48 -0700
X-CSE-ConnectionGUID: Ex/sEG8aTF+v1K+yi0nrwA==
X-CSE-MsgGUID: CeEvlAtXSXKFbAenNYNAPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="268441425"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 mkuoppal-desk.intel.com) ([10.245.246.233])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 08:01:42 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, matthew.brost@intel.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, joonas.lahtinen@linux.intel.com,
 gustavo.sousa@intel.com, jan.maslak@intel.com,
 dominik.karol.piatkowski@intel.com, rodrigo.vivi@intel.com,
 andrzej.hajda@intel.com, matthew.auld@intel.com,
 maciej.patelczyk@intel.com, gwan-gyeong.mun@intel.com,
 Oak Zeng <oak.zeng@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 Stuart Summers <stuart.summers@intel.com>,
 Bruce Chang <yu.bruce.chang@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH v10 22/27] drm/xe/vm: Support for adding null page VMA to VM
 on request
Date: Thu,  3 Sep 2026 17:59:46 +0300
Message-ID: <20260903145952.848051-23-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260903145952.848051-1-mika.kuoppala@linux.intel.com>
References: <20260903145952.848051-1-mika.kuoppala@linux.intel.com>
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

From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>

The XE2 (and PVC) HW has a limitation that the pagefault due to invalid
access will halt the corresponding EUs. So, in order to activate the
debugger, kmd needs to install the temporal page to unhalt the EUs.
Plan to be used for pagefault handling when the EU debugger is running.
The idea is to install a null page vma if the pagefault is from an invalid
access. After installing null page pte, the user debugger can continue to
run/inspect without causing a fatal failure or reset and stop.
Based on Bruce's implementation [1].

[1] https://lore.kernel.org/intel-xe/20230829231648.4438-1-yu.bruce.chang@intel.com/

v2: s/NULL_VMA/DRM_GPUVA_SPARSE (Mika)
v3: use ERR_CAST as we dont return null (Mika)
v4: export vma insert/remove/destroy for eudebug needs (Maciej)
Cc: Oak Zeng <oak.zeng@intel.com>
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Co-developed-by: Bruce Chang <yu.bruce.chang@intel.com>
Signed-off-by: Bruce Chang <yu.bruce.chang@intel.com>
Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 42 ++++++++++++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_vm.h |  5 +++++
 2 files changed, 45 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 3e6bee8d0708..1002d2f343b8 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1259,7 +1259,7 @@ static void xe_vm_assert_write_mode_or_garbage_collector(struct xe_vm *vm)
 			lockdep_is_held_type(&vm->svm.garbage_collector.lock, 0)));
 }
 
-static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
+void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
 {
 	struct xe_vm *vm = xe_vma_vm(vma);
 	struct xe_bo *bo = xe_vma_bo(vma);
@@ -1355,7 +1355,7 @@ xe_vm_find_overlapping_vma(struct xe_vm *vm, u64 start, u64 range)
 	return gpuva ? gpuva_to_vma(gpuva) : NULL;
 }
 
-static int xe_vm_insert_vma(struct xe_vm *vm, struct xe_vma *vma)
+int xe_vm_insert_vma(struct xe_vm *vm, struct xe_vma *vma)
 {
 	int err;
 
@@ -5312,3 +5312,41 @@ void xe_vm_remove_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
 	}
 	up_write(&vm->exec_queues.lock);
 }
+
+struct xe_vma *xe_vm_create_null_vma(struct xe_vm *vm, u64 addr)
+{
+	struct xe_vma_mem_attr default_attr = {
+		.preferred_loc = {
+			.devmem_fd = DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE,
+			.migration_policy = DRM_XE_MIGRATE_ALL_PAGES,
+		},
+		.atomic_access = DRM_XE_ATOMIC_UNDEFINED,
+		.default_pat_index = vm->xe->pat.idx[XE_CACHE_NONE],
+		.pat_index = vm->xe->pat.idx[XE_CACHE_NONE],
+	};
+	struct xe_vma *vma;
+	u32 page_size;
+	int err;
+
+	if (xe_vm_is_closed_or_banned(vm))
+		return ERR_PTR(-ENOENT);
+
+	page_size = vm->flags & XE_VM_FLAG_64K ? SZ_64K : SZ_4K;
+	vma = xe_vma_create(vm, NULL, 0, addr, addr + page_size - 1,
+			    &default_attr, DRM_GPUVA_SPARSE);
+	if (IS_ERR(vma))
+		return ERR_CAST(vma);
+
+	err = xe_vm_insert_vma(vm, vma);
+	if (err) {
+		xe_vma_destroy_late(vma);
+		return ERR_PTR(err);
+	}
+
+	return vma;
+}
+
+void xe_vm_destroy_vma(struct xe_vma *vma)
+{
+	xe_vma_destroy_late(vma);
+}
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index c5b900f38ded..07e8c576abc7 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -436,4 +436,9 @@ static inline struct drm_exec *xe_vm_validation_exec(struct xe_vm *vm)
 	((READ_ONCE(tile_present) & ~READ_ONCE(tile_invalidated)) & BIT((tile)->id))
 
 void xe_vma_mem_attr_copy(struct xe_vma_mem_attr *to, struct xe_vma_mem_attr *from);
+
+int xe_vm_insert_vma(struct xe_vm *vm, struct xe_vma *vma);
+struct xe_vma *xe_vm_create_null_vma(struct xe_vm *vm, u64 addr);
+void xe_vm_destroy_vma(struct xe_vma *vma);
+void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence);
 #endif
-- 
2.53.0

