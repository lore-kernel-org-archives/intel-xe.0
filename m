Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD099C624D6
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 15:01:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88C2410F66B;
	Thu,  3 Sep 2026 15:01:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZWKby9HO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B8C410F66B
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 15:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788447714; x=1819983714;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cc6fFxSpT2DyBXk+qdTAidOlcYvUAZIrolY+J3TZRJA=;
 b=ZWKby9HOU0T0tatDQGBy+5dz8O5lQeJgMRrCypfmVJKjGustPrL7/PHn
 7laXzoAPBjdLlpt/eH2dEvvQCq9Xdt9LQCtPE+Gw7TW+kUO6cfdfQfwuo
 ldfUjHtyIXX4Kaprw19drpC+DX6MZn+Qwciv4vYLF017jyPc2qm9dVFZM
 LM2bkdx7KZOJWmGR10UmMwZv+lHrgMFZ+an2auItMezTRKJ2xXqD2v6zh
 zXNP7J9osfpXx3PxKRDXeKz2aofvFasqWgvtSfokyrmbVlkIyaYDLbTAC
 3DSd+1vvEr3T9Maz5CiC1sVfKI1n50k2gzotiyQBp1e7HMpILCWWR4jK3 g==;
X-CSE-ConnectionGUID: ZYfTzxDaSf207XSbOH8Ojw==
X-CSE-MsgGUID: VamzUBP8Rn+E3twf7FXRJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="76486929"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="76486929"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 08:01:52 -0700
X-CSE-ConnectionGUID: S4rMJ4vbR/m1CxyQimHCHQ==
X-CSE-MsgGUID: tyjlVyGNRs+nc6oWZzBUMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="268441451"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 mkuoppal-desk.intel.com) ([10.245.246.233])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 08:01:47 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, matthew.brost@intel.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, joonas.lahtinen@linux.intel.com,
 gustavo.sousa@intel.com, jan.maslak@intel.com,
 dominik.karol.piatkowski@intel.com, rodrigo.vivi@intel.com,
 andrzej.hajda@intel.com, matthew.auld@intel.com,
 maciej.patelczyk@intel.com, gwan-gyeong.mun@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH v10 23/27] drm/xe/vm: Add xe_vm_svm_vma_subtract() to carve
 out a sub-range from an SVM VMA
Date: Thu,  3 Sep 2026 17:59:47 +0300
Message-ID: <20260903145952.848051-24-mika.kuoppala@linux.intel.com>
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

When the EU debugger page fault handler needs to install a NULL (sparse)
VMA at an address that is currently covered by a large SVM
cpu-addr-mirror VMA, the SVM VMA must first be trimmed to leave a hole
at the faulted address.  There was no helper to do this in a
semantically clean way, so add one.

xe_vm_svm_vma_subtract() removes the address range [sub_start, sub_end)
from an existing VMA according to three cases:

  1) No overlap: [sub_start, sub_end) lies entirely outside the VMA.
     Return -EINVAL; the caller's invariants are violated.

  2) Full coverage: [sub_start, sub_end) covers the entire VMA.
     Remove and destroy the VMA in one step.

  3) Partial overlap: [sub_start, sub_end) overlaps only part of the VMA.
     The original VMA is removed and destroyed, and the non-overlapping
     head region [vma_start, overlap_start) and/or tail region
     [overlap_end, vma_end) are re-created as new VMAs via
     xe_vma_create() + xe_vm_insert_vma().  The new VMAs inherit the
     original VMA's memory attributes  and its XE_VMA_CREATE_MASK
     creation flags, so properties such as XE_VMA_SYSTEM_ALLOCATOR is
     preserved.

Note on address conventions: xe_vma_end() returns an exclusive end
address, and sub_end is likewise exclusive, consistent with the rest of
the VM code.  xe_vma_create() however takes an inclusive end address, so
the head and tail VMAs are passed overlap_start - 1 and vma_end - 1
respectively.

The function requires vm->lock to be held for write by the caller, which
is already the case in all page-fault service paths.

xe_vm_svm_vma_subtract() is intended to be called from the EU debugger
page fault path (xe_pagefault.c) when xe_svm_handle_pagefault() returns
-ENOENT for a faulted address inside a cpu-addr-mirror VMA, indicating
that no CPU mm VMA backs that address.

The xe_vm_svm_vma_subtract() returns vma that represents subtracted
vma with attributes copied from original one. It shall be reinserted
then page fault is handled.

Assisted-by: GitHub Copilot:claude-opus-4.6
Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 139 +++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.h |   3 +
 2 files changed, 142 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 1002d2f343b8..73490a10bdc0 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -5350,3 +5350,142 @@ void xe_vm_destroy_vma(struct xe_vma *vma)
 {
 	xe_vma_destroy_late(vma);
 }
+
+/**
+ * xe_vm_svm_vma_subtract() - Subtract an address range from an existing SVM VMA
+ * @vm: The xe_vm the @vma belongs to
+ * @vma: Target SVM VMA from which a sub-range will be removed
+ * @sub_start: Start address of the range to subtract (inclusive)
+ * @sub_end:   End address of the range to subtract (exclusive)
+ *
+ * Behavior:
+ *   1) If [sub_start, sub_end) does not overlap @vma at all, return -EINVAL.
+ *   2) If [sub_start, sub_end) fully covers @vma, the entire VMA is removed.
+ *   3) If [sub_start, sub_end) partially overlaps @vma, only the overlapping
+ *      portion is removed. The remaining non-overlapping head and/or tail
+ *      regions are re-inserted as new VMAs that inherit the original VMA's
+ *      memory attributes and creation flags.
+ *
+ * Locking: Caller must hold vm->lock for write.
+ *
+ * Return: pointer to vma which is the subtracted hole in SVM mapping
+ *         or error on failure
+ */
+struct xe_vma *xe_vm_svm_vma_subtract(struct xe_vm *vm, struct xe_vma *vma,
+				      u64 sub_start, u64 sub_end)
+{
+	u64 vma_start = xe_vma_start(vma);
+	u64 vma_end   = xe_vma_end(vma); /* exclusive */
+	u64 overlap_start, overlap_end;  /* overlap range, end is exclusive */
+	u64 start, end;
+	struct xe_vma_mem_attr attr = {};
+	struct xe_vma *rvma = NULL;
+	struct xe_vma *prev_vma = NULL;
+	struct xe_vma *next_vma = NULL;
+	unsigned int flags;
+	int err = 0;
+
+	lockdep_assert_held_write(&vm->lock);
+
+	/* Reject obviously invalid input range. */
+	if (sub_start >= sub_end)
+		return ERR_PTR(-EINVAL);
+
+	/* 1) No overlap with the existing VMA. */
+	if (sub_end <= vma_start || sub_start >= vma_end)
+		return ERR_PTR(-EINVAL);
+
+	/* Compute the actual overlapping region clipped to the VMA. */
+	overlap_start = max(sub_start, vma_start);
+	overlap_end = min(sub_end, vma_end);
+
+	start = vma_start;
+	end = vma_end;
+	/*
+	 * Preserve the original VMA's memory attributes (with proper refcount
+	 * handling on dpagemap) and creation flags before destroying it, then
+	 * re-insert the non-overlapping head/tail regions as new VMAs.
+	 */
+	xe_vma_mem_attr_copy(&attr, &vma->attr);
+	flags = vma->gpuva.flags & XE_VMA_CREATE_MASK;
+
+	xe_vm_remove_vma(vm, vma);
+	/* 2) Subtract range fully covers the VMA -> remove it entirely. */
+	if (overlap_start == vma_start && overlap_end == vma_end)
+		goto out;
+
+	/*
+	 * 3) Partial overlap.
+	 *
+	 * Head region: [vma_start, overlap_start)
+	 */
+	if (vma_start < overlap_start) {
+		/* xe_vma_create() takes an inclusive end address. */
+		prev_vma = xe_vma_create(vm, NULL, 0, vma_start,
+					 overlap_start - 1, &attr, flags);
+		if (IS_ERR(prev_vma)) {
+			err = PTR_ERR(prev_vma);
+			prev_vma = NULL;
+			goto err;
+		}
+
+		err = xe_vm_insert_vma(vm, prev_vma);
+		if (err) {
+			xe_vma_destroy_late(prev_vma);
+			prev_vma = NULL;
+			goto err;
+		}
+		start = overlap_start;
+	}
+
+	/* Tail region: [overlap_end, vma_end) */
+	if (overlap_end < vma_end) {
+		next_vma = xe_vma_create(vm, NULL, 0, overlap_end, vma_end - 1,
+					 &attr, flags);
+		if (IS_ERR(next_vma)) {
+			err = PTR_ERR(next_vma);
+			next_vma = NULL;
+			goto err;
+		}
+
+		err = xe_vm_insert_vma(vm, next_vma);
+		if (err) {
+			xe_vma_destroy_late(next_vma);
+			next_vma = NULL;
+			goto err;
+		}
+		end = overlap_end;
+	}
+
+out:
+	rvma = xe_vma_create(vm, NULL, 0,
+			     start, end - 1,
+			     &attr,
+			     flags);
+	if (IS_ERR(rvma)) {
+		err = PTR_ERR(rvma);
+		goto err;
+	}
+	xe_vma_destroy_unlocked(vma);
+	xe_vma_mem_attr_fini(&attr);
+	return rvma;
+
+err:
+	xe_vma_mem_attr_fini(&attr);
+
+	if (prev_vma) {
+		xe_vm_remove_vma(vm, prev_vma);
+		xe_vma_destroy_unlocked(prev_vma);
+	}
+	if (next_vma) {
+		xe_vm_remove_vma(vm, next_vma);
+		xe_vma_destroy_unlocked(next_vma);
+	}
+
+	if (xe_vm_insert_vma(vm, vma)) {
+		xe_vma_destroy_unlocked(vma);
+		xe_vm_kill(vm, true);
+	}
+
+	return ERR_PTR(err);
+}
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 07e8c576abc7..6ff14fbce7a6 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -441,4 +441,7 @@ int xe_vm_insert_vma(struct xe_vm *vm, struct xe_vma *vma);
 struct xe_vma *xe_vm_create_null_vma(struct xe_vm *vm, u64 addr);
 void xe_vm_destroy_vma(struct xe_vma *vma);
 void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence);
+
+struct xe_vma *xe_vm_svm_vma_subtract(struct xe_vm *vm, struct xe_vma *vma, u64 sub_start,
+				      u64 sub_end);
 #endif
-- 
2.53.0

