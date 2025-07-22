Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EE9DC83F27
	for <intel-xe@archiver.kernel.org>; Tue, 22 Jul 2025 13:09:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 623DF10E30C;
	Tue, 22 Jul 2025 13:09:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mx2hGF52";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7660610E30C
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Jul 2025 13:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753189759; x=1784725759;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uTnXP7Mb/cUg/BuBtYfz/Nilir+MZVR86cIxer9KGJI=;
 b=mx2hGF523HRu5pgcP1uFt1V32Qn557Thih9xI78lJxz2sdOl09odHX9G
 9NTguyBdIOC10TAlYLsNQu9pv8jyQXpUdoctUF5ycTm6Y/on9TxE3vYzU
 Fw6Gdj1Q0507S0x64Z1kd5QfVPN3Gwk3f1Q+VaXYDIm5grOxMkLsEDXIg
 0vyJvl7rF6NUWXuIBsA8rdUOhgAfMNiH2JcF1qQwzbgUdV9ziOCK3zwlJ
 bcn9qkBrgWRITvi99VltQzSZYagj/url15WQp1bbMnr2OXvKpC+hjASX4
 AGVx9cUOwPngAlOcPZXyz8hFbMT0xzK+ktjrzXWwQ1fo/k5BlIRiNqY/5 w==;
X-CSE-ConnectionGUID: JqDZXRISRMu1gFcxa0er3w==
X-CSE-MsgGUID: TTdAVnS9SPu9dr+sh/CqkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="55530409"
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="55530409"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 06:09:19 -0700
X-CSE-ConnectionGUID: wGjWiN2JTJGsbW0UU9iwGQ==
X-CSE-MsgGUID: pNkftoGWTBCoYf7N/n41sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="163420735"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa005.fm.intel.com with ESMTP; 22 Jul 2025 06:09:18 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v5 21/23] drm/xe/vm: Add a delayed worker to merge fragmented
 vmas
Date: Tue, 22 Jul 2025 19:05:24 +0530
Message-Id: <20250722133526.3550547-22-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250722133526.3550547-1-himal.prasad.ghimiray@intel.com>
References: <20250722133526.3550547-1-himal.prasad.ghimiray@intel.com>
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

During initial mirror bind initialize and start the delayed work item
responsible for merging adjacent CPU address mirror VMAs with default
memory attributes. This function sets the merge_active flag and schedules
the work to run after a delay, allowing batching of VMA updates.

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c       | 126 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm_types.h |  15 ++++
 2 files changed, 141 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 003c8209f8bd..bee849167c0d 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1160,6 +1160,127 @@ static void xe_vma_free(struct xe_vma *vma)
 		kfree(vma);
 }
 
+struct va_range {
+	u64 start;
+	u64 end;
+};
+
+static void add_merged_range(struct va_range **ranges, int *count, int *capacity,
+			     u64 start, u64 end)
+{
+	const int array_size  = 8;
+	struct va_range *new_ranges;
+	int new_capacity;
+
+	if (*count == *capacity) {
+		new_capacity = *capacity ? *capacity * 2 : array_size;
+		new_ranges = krealloc(*ranges, new_capacity * sizeof(**ranges), GFP_KERNEL);
+		if (!new_ranges)
+			return;
+
+		*ranges = new_ranges;
+		*capacity = new_capacity;
+	}
+	(*ranges)[(*count)++] = (struct va_range){ .start = start, .end = end };
+}
+
+static void xe_vm_vmas_merge_worker(struct work_struct *work)
+{
+	struct xe_vm *vm = container_of(to_delayed_work(work), struct xe_vm, merge_vmas_work);
+	struct drm_gpuva *gpuva, *next = NULL;
+	struct va_range *merged_ranges = NULL;
+	int merge_count = 0, merge_capacity = 0;
+	bool in_merge = false;
+	u64 merge_start = 0, merge_end = 0;
+	int merge_len = 0;
+
+	if (!vm->merge_active)
+		return;
+
+	down_write(&vm->lock);
+
+	drm_gpuvm_for_each_va_safe(gpuva, next, &vm->gpuvm) {
+		struct xe_vma *vma = gpuva_to_vma(gpuva);
+
+		if (!xe_vma_is_cpu_addr_mirror(vma) || !xe_vma_has_default_mem_attrs(vma)) {
+			if (in_merge && merge_len > 1)
+				add_merged_range(&merged_ranges, &merge_count, &merge_capacity,
+						 merge_start, merge_end);
+
+			in_merge = false;
+			merge_len = 0;
+			continue;
+		}
+
+		if (!in_merge) {
+			merge_start = xe_vma_start(vma);
+			merge_end = xe_vma_end(vma);
+			in_merge = true;
+			merge_len = 1;
+		} else if (xe_vma_start(vma) == merge_end && xe_vma_has_default_mem_attrs(vma)) {
+			merge_end = xe_vma_end(vma);
+			merge_len++;
+		} else {
+			if (merge_len > 1)
+				add_merged_range(&merged_ranges, &merge_count, &merge_capacity,
+						 merge_start, merge_end);
+			merge_start = xe_vma_start(vma);
+			merge_end = xe_vma_end(vma);
+			merge_len = 1;
+		}
+	}
+
+	if (in_merge && merge_len > 1) {
+		add_merged_range(&merged_ranges, &merge_count, &merge_capacity,
+				 merge_start, merge_end);
+	}
+
+	for (int i = 0; i < merge_count; i++) {
+		vm_dbg(&vm->xe->drm, "Merged VA range %d: start=0x%016llx, end=0x%016llx\n",
+		       i, merged_ranges[i].start, merged_ranges[i].end);
+
+		if (xe_vm_alloc_cpu_addr_mirror_vma(vm, merged_ranges[i].start,
+						    merged_ranges[i].end - merged_ranges[i].start))
+			break;
+	}
+
+	up_write(&vm->lock);
+	kfree(merged_ranges);
+	schedule_delayed_work(&vm->merge_vmas_work, msecs_to_jiffies(5000));
+}
+
+/*
+ * xe_vm_start_vmas_merge - Initialize and schedule VMA merge work
+ * @vm: Pointer to the xe_vm structure
+ *
+ * Initializes the delayed work item responsible for merging adjacent
+ * CPU address mirror VMAs with default memory attributes. This function
+ * sets the merge_active flag and schedules the work to run after a delay,
+ * allowing batching of VMA updates.
+ */
+static void xe_vm_start_vmas_merge(struct xe_vm *vm)
+{
+	if (vm->merge_active)
+		return;
+
+	vm->merge_active = true;
+	INIT_DELAYED_WORK(&vm->merge_vmas_work, xe_vm_vmas_merge_worker);
+	schedule_delayed_work(&vm->merge_vmas_work, msecs_to_jiffies(5000));
+}
+
+/*
+ * xe_vm_stop_vmas_merge - Cancel scheduled VMA merge work
+ * @vm: Pointer to the xe_vm structure
+ */
+static void xe_vm_stop_vmas_merge(struct xe_vm *vm)
+{
+	if (!vm->merge_active)
+		return;
+
+	vm->merge_active = false;
+	cancel_delayed_work_sync(&vm->merge_vmas_work);
+}
+
 #define VMA_CREATE_FLAG_READ_ONLY		BIT(0)
 #define VMA_CREATE_FLAG_IS_NULL			BIT(1)
 #define VMA_CREATE_FLAG_DUMPABLE		BIT(2)
@@ -1269,6 +1390,9 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 		xe_vm_get(vm);
 	}
 
+	if (xe_vma_is_cpu_addr_mirror(vma))
+		xe_vm_start_vmas_merge(vm);
+
 	return vma;
 }
 
@@ -1982,6 +2106,8 @@ static void vm_destroy_work_func(struct work_struct *w)
 	/* xe_vm_close_and_put was not called? */
 	xe_assert(xe, !vm->size);
 
+	xe_vm_stop_vmas_merge(vm);
+
 	if (xe_vm_in_preempt_fence_mode(vm))
 		flush_work(&vm->preempt.rebind_work);
 
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 351242c92c12..c4f3542eb464 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -374,6 +374,21 @@ struct xe_vm {
 	bool batch_invalidate_tlb;
 	/** @xef: XE file handle for tracking this VM's drm client */
 	struct xe_file *xef;
+
+	/**
+	 * @merge_vmas_work: Delayed work item used to merge CPU address mirror VMAs.
+	 * This work is scheduled to scan the GPU virtual memory space and
+	 * identify adjacent CPU address mirror VMAs that have default memory
+	 * attributes. When such VMAs are found, they are merged into a single
+	 * larger VMA to reduce fragmentation. The merging process is triggered
+	 * asynchronously via a delayed workqueue avoid blocking critical paths
+	 * and to batch updates when possible.
+	 */
+	struct delayed_work merge_vmas_work;
+
+	/** @merge_active: True if merge_vmas_work has been initialized */
+	bool merge_active;
+
 };
 
 /** struct xe_vma_op_map - VMA map operation */
-- 
2.34.1

