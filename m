Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A823C25B10
	for <intel-xe@archiver.kernel.org>; Sun, 28 Apr 2024 21:34:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B21C10F307;
	Sun, 28 Apr 2024 21:34:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="uaICe6wK";
	dkim-atps=neutral
Received: from mail02.habana.ai (habanamailrelay02.habana.ai [62.90.112.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 874EC112141
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Apr 2024 09:43:15 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1713951788; bh=qLpuQd0vYM0RPfQ7canD3KzMcV9OIAhm32WReB3USP4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uaICe6wKs9xqoemrFnY+i06RzPCo4EHUri3uAjSGD6jHlPNL4dZ9j4lccrWyllEkY
 QEPBoD3ZlmT2n2PKd4Ej5eyKH3JXI2mfkP0weThmimL/W28BLy9l6bEXkgA/wVdQSf
 6BvHl10n1p5e+5IH2H99CElvvB11LAC6XVa7QxRjfyG5mK2Z4XvmxKf0ftKWwid+b2
 QyVZUsuoXkts14TZ2K1ORJJ/PzQ3FktbacbL9fdqEGi6bv9xzqS3bN1WWqw4bs2G68
 WlvudrsWvFPhjPZ/SpEAHmKugYEUnQw2RGVquo7nzKIkChyPbH1qD/KznfKaGVlNBX
 HZINN5DFj29pw==
Received: from fkassabri-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by fkassabri-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with
 ESMTPS id 43O9h2ws231070
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 24 Apr 2024 12:43:02 +0300
Received: (from fkassabri@localhost)
 by fkassabri-vm-u22.habana-labs.com (8.15.2/8.15.2/Submit) id 43O9h2C5231069; 
 Wed, 24 Apr 2024 12:43:02 +0300
From: Farah Kassabri <fkassabri@habana.ai>
To: intel-xe@lists.freedesktop.org
Cc: ofir1.bitton@intel.com, Farah Kassabri <fkassabri@habana.ai>
Subject: [PATCH 2/2] drm/xe: preparations for multi instance TLB invalidations
Date: Wed, 24 Apr 2024 12:42:44 +0300
Message-Id: <20240424094244.231035-3-fkassabri@habana.ai>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240424094244.231035-1-fkassabri@habana.ai>
References: <20240424094244.231035-1-fkassabri@habana.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 28 Apr 2024 21:33:52 +0000
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

This patch prepares the xe driver for supporting multi instance TLB
invalidations.
Currently xe driver support one invalidation flow for the compute
engines which passes through the Guc submission flow.
In the near future this driver should invalidate other TLB instances,
each has its own flow for performing the invalidation.
This patch will allow the engine to register its own functions
for invalidation and wait, keeping the invalidation calls from the
common code generic.

Signed-off-by: Farah Kassabri <fkassabri@habana.ai>
---
 drivers/gpu/drm/xe/Makefile                   |   1 +
 drivers/gpu/drm/xe/xe_device.c                |   7 +
 drivers/gpu/drm/xe/xe_ggtt.c                  |   8 +-
 drivers/gpu/drm/xe/xe_gt.c                    |   5 +-
 .../gpu/drm/xe/xe_gt_guc_tlb_invalidation.c   |  72 ++++----
 .../gpu/drm/xe/xe_gt_guc_tlb_invalidation.h   |   2 +-
 drivers/gpu/drm/xe/xe_gt_pagefault.c          |   4 +-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c   | 167 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h   |  66 +++++--
 drivers/gpu/drm/xe/xe_gt_types.h              |   4 +
 drivers/gpu/drm/xe/xe_vm.c                    |  12 +-
 11 files changed, 281 insertions(+), 67 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 63e757406595..d279cec7bb1d 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -91,6 +91,7 @@ xe-y += xe_bb.o \
 	xe_gt_sysfs.o \
 	xe_gt_throttle_sysfs.o \
 	xe_gt_guc_tlb_invalidation.o \
+	xe_gt_tlb_invalidation.o \
 	xe_gt_topology.o \
 	xe_guc.o \
 	xe_guc_ads.o \
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 55bbc8b8df15..5b438f0e8a7d 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -45,6 +45,7 @@
 #include "xe_ttm_sys_mgr.h"
 #include "xe_vm.h"
 #include "xe_wait_user_fence.h"
+#include "xe_gt_tlb_invalidation.h"
 
 static int xe_file_open(struct drm_device *dev, struct drm_file *file)
 {
@@ -568,6 +569,12 @@ int xe_device_probe(struct xe_device *xe)
 		}
 	}
 
+	for_each_gt(gt, xe, id) {
+		err = xe_gt_tlb_invalidation_init(gt);
+		if (err)
+			return err;
+	}
+
 	for_each_gt(gt, xe, id) {
 		err = xe_gt_init_hwconfig(gt);
 		if (err)
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index e0c1bfa92730..3031a45957e9 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -19,7 +19,7 @@
 #include "xe_device.h"
 #include "xe_gt.h"
 #include "xe_gt_printk.h"
-#include "xe_gt_guc_tlb_invalidation.h"
+#include "xe_gt_tlb_invalidation.h"
 #include "xe_map.h"
 #include "xe_pm.h"
 #include "xe_sriov.h"
@@ -247,14 +247,14 @@ int xe_ggtt_init(struct xe_ggtt *ggtt)
 
 static void ggtt_invalidate_gt_tlb(struct xe_gt *gt)
 {
-	int err;
+	int seqno[TLB_INV_MAX_INS] = {0}, err;
 
 	if (!gt)
 		return;
 
-	err = xe_gt_guc_tlb_invalidation_ggtt(gt);
+	err = xe_gt_tlb_invalidation_all(gt, seqno);
 	if (err)
-		drm_warn(&gt_to_xe(gt)->drm, "xe_gt_guc_tlb_invalidation_ggtt error=%d", err);
+		drm_warn(&gt_to_xe(gt)->drm, "xe_gt_tlb_invalidation_all error=%d", err);
 }
 
 static void xe_ggtt_invalidate(struct xe_ggtt *ggtt)
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index b162f10902ea..7554da5c7e19 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -504,6 +504,7 @@ int xe_gt_init_hwconfig(struct xe_gt *gt)
 		goto out;
 
 	xe_gt_topology_init(gt);
+
 	xe_gt_mcr_init(gt);
 	xe_pat_init(gt);
 
@@ -536,10 +537,6 @@ int xe_gt_init(struct xe_gt *gt)
 		xe_hw_fence_irq_init(&gt->fence_irq[i]);
 	}
 
-	err = xe_gt_guc_tlb_invalidation_init(gt);
-	if (err)
-		return err;
-
 	err = xe_gt_pagefault_init(gt);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_gt_guc_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_guc_tlb_invalidation.c
index f994c64c95f4..469e57426a60 100644
--- a/drivers/gpu/drm/xe/xe_gt_guc_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_guc_tlb_invalidation.c
@@ -4,6 +4,7 @@
  */
 
 #include "xe_gt_guc_tlb_invalidation.h"
+#include "xe_gt_tlb_invalidation.h"
 
 #include "abi/guc_actions_abi.h"
 #include "xe_device.h"
@@ -17,6 +18,8 @@
 
 #define TLB_TIMEOUT	(HZ / 4)
 
+static void xe_gt_guc_init_tlb_inv_funcs(struct xe_gt *gt);
+
 static void xe_gt_guc_tlb_fence_timeout(struct work_struct *work)
 {
 	struct xe_gt *gt = container_of(work, struct xe_gt,
@@ -66,6 +69,8 @@ int xe_gt_guc_tlb_invalidation_init(struct xe_gt *gt)
 	INIT_DELAYED_WORK(&gt->tlb_invalidation.fence_tdr,
 			  xe_gt_guc_tlb_fence_timeout);
 
+	xe_gt_guc_init_tlb_inv_funcs(gt);
+
 	return 0;
 }
 
@@ -224,7 +229,7 @@ static int xe_gt_guc_tlb_invalidation(struct xe_gt *gt)
 }
 
 /**
- * xe_gt_guc_tlb_invalidation_ggtt - Issue a TLB invalidation on this GT for the GGTT
+ * xe_gt_guc_tlb_invalidation_all - Issue a TLB invalidation on this GT for the GGTT
  * @gt: graphics tile
  *
  * Issue a TLB invalidation for the GGTT. Completion of TLB invalidation is
@@ -232,7 +237,7 @@ static int xe_gt_guc_tlb_invalidation(struct xe_gt *gt)
  *
  * Return: 0 on success, negative error code on error
  */
-int xe_gt_guc_tlb_invalidation_ggtt(struct xe_gt *gt)
+int xe_gt_guc_tlb_invalidation_all(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 
@@ -301,41 +306,9 @@ int xe_gt_guc_tlb_invalidation_vma(struct xe_gt *gt,
 	if (!xe->info.has_range_tlb_invalidation) {
 		action[len++] = MAKE_INVAL_OP(XE_GUC_TLB_INVAL_FULL);
 	} else {
-		u64 start = xe_vma_start(vma);
-		u64 length = xe_vma_size(vma);
-		u64 align, end;
+		u64 start, length;
 
-		if (length < SZ_4K)
-			length = SZ_4K;
-
-		/*
-		 * We need to invalidate a higher granularity if start address
-		 * is not aligned to length. When start is not aligned with
-		 * length we need to find the length large enough to create an
-		 * address mask covering the required range.
-		 */
-		align = roundup_pow_of_two(length);
-		start = ALIGN_DOWN(xe_vma_start(vma), align);
-		end = ALIGN(xe_vma_end(vma), align);
-		length = align;
-		while (start + length < end) {
-			length <<= 1;
-			start = ALIGN_DOWN(xe_vma_start(vma), length);
-		}
-
-		/*
-		 * Minimum invalidation size for a 2MB page that the hardware
-		 * expects is 16MB
-		 */
-		if (length >= SZ_2M) {
-			length = max_t(u64, SZ_16M, length);
-			start = ALIGN_DOWN(xe_vma_start(vma), length);
-		}
-
-		xe_gt_assert(gt, length >= SZ_4K);
-		xe_gt_assert(gt, is_power_of_2(length));
-		xe_gt_assert(gt, !(length & GENMASK(ilog2(SZ_16M) - 1, ilog2(SZ_2M) + 1)));
-		xe_gt_assert(gt, IS_ALIGNED(start, length));
+		xe_gt_tlb_invalidation_vma_alignments(gt, vma, &start, &length);
 
 		action[len++] = MAKE_INVAL_OP(XE_GUC_TLB_INVAL_PAGE_SELECTIVE);
 		action[len++] = xe_vma_vm(vma)->usm.asid;
@@ -457,3 +430,30 @@ int xe_gt_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 le
 
 	return 0;
 }
+
+/**
+ * xe_gt_guc_tlb_invalidation_vma_wrapper - wrapper for gt guc tlb range invalidation.
+ * @gt: graphics technology the invalidation was initiated on.
+ * @vma: VMA to invalidate
+ * @data: data used for the invalidation.
+ *
+ * Issue a range based TLB invalidation.
+ *
+ * Return: Seqno which can be passed to xe_gt_guc_tlb_invalidation_wait on success,
+ * negative error code on error.
+ */
+static int xe_gt_guc_tlb_invalidation_vma_wrapper(struct xe_gt *gt, struct xe_vma *vma, void *data)
+{
+	struct xe_gt_guc_tlb_invalidation_fence *fence = data;
+
+	return xe_gt_guc_tlb_invalidation_vma(gt, fence, vma);
+}
+
+static void xe_gt_guc_init_tlb_inv_funcs(struct xe_gt *gt)
+{
+	struct xe_gt_tlb_ins_invalidation_funcs *guc_ins = &gt->tlb_invalidation.inv_funcs[GUC_TLB];
+
+	guc_ins->inv_range = xe_gt_guc_tlb_invalidation_vma_wrapper;
+	guc_ins->inv_all = xe_gt_guc_tlb_invalidation_all;
+	guc_ins->inv_wait = xe_gt_guc_tlb_invalidation_wait;
+}
diff --git a/drivers/gpu/drm/xe/xe_gt_guc_tlb_invalidation.h b/drivers/gpu/drm/xe/xe_gt_guc_tlb_invalidation.h
index f7402dd0bec3..a02ee007c642 100644
--- a/drivers/gpu/drm/xe/xe_gt_guc_tlb_invalidation.h
+++ b/drivers/gpu/drm/xe/xe_gt_guc_tlb_invalidation.h
@@ -16,7 +16,7 @@ struct xe_vma;
 
 int xe_gt_guc_tlb_invalidation_init(struct xe_gt *gt);
 void xe_gt_guc_tlb_invalidation_reset(struct xe_gt *gt);
-int xe_gt_guc_tlb_invalidation_ggtt(struct xe_gt *gt);
+int xe_gt_guc_tlb_invalidation_all(struct xe_gt *gt);
 int xe_gt_guc_tlb_invalidation_vma(struct xe_gt *gt,
 				   struct xe_gt_guc_tlb_invalidation_fence *fence,
 				   struct xe_vma *vma);
diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 8c47c60f3cd3..dba49f3ae933 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -15,7 +15,7 @@
 #include "abi/guc_actions_abi.h"
 #include "xe_bo.h"
 #include "xe_gt.h"
-#include "xe_gt_guc_tlb_invalidation.h"
+#include "xe_gt_tlb_invalidation.h"
 #include "xe_guc.h"
 #include "xe_guc_ct.h"
 #include "xe_migrate.h"
@@ -240,7 +240,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 		goto retry_userptr;
 
 	if (!ret) {
-		ret = xe_gt_guc_tlb_invalidation_vma(gt, NULL, vma);
+		ret = xe_gt_tlb_invalidation_vma(gt, vma, NULL, NULL);
 		if (ret >= 0)
 			ret = 0;
 	}
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
new file mode 100644
index 000000000000..84dec631aeb1
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -0,0 +1,167 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#include "xe_gt_tlb_invalidation.h"
+#include "xe_gt_guc_tlb_invalidation.h"
+#include "xe_gt.h"
+#include "xe_gt_printk.h"
+#include "xe_vm.h"
+
+/**
+ * xe_gt_tlb_invalidation_init - TLB invalidation init generic function.
+ * @gt: graphics technology the invalidation was initiated on.
+ *
+ * Initialize all TLBs in the system, including setting the invalidation
+ * proprietary function pointer.
+ *
+ * Return: 0 on success, negative error code on error.
+ */
+int xe_gt_tlb_invalidation_init(struct xe_gt *gt)
+{
+	int ret;
+
+	gt->tlb_invalidation.inv_funcs = kcalloc(TLB_INV_MAX_INS,
+						 sizeof(struct xe_gt_tlb_ins_invalidation_funcs),
+						 GFP_KERNEL);
+	if (!gt->tlb_invalidation.inv_funcs)
+		return -ENOMEM;
+
+	/* Initialize gt Guc TLB */
+	ret = xe_gt_guc_tlb_invalidation_init(gt);
+	if (ret) {
+		kfree(gt->tlb_invalidation.inv_funcs);
+		return ret;
+	}
+
+	return 0;
+}
+
+/**
+ * xe_gt_tlb_invalidation_all - TLB invalidation all generic function.
+ * @gt: graphics technology the invalidation was initiated on.
+ * @seq: sequence numbers of the TLB invalidations.
+ * This is the output of the invalidation functions, can be used when calling
+ * xe_gt_tlb_invalidation_wait.
+ *
+ * Issue a TLB invalidation when the GGTT is changed.
+ * This will make invalidation for all TLBs in the system, for mappings in GGTT and all
+ * PPGTT tables.
+ *
+ * Return: 0 on success, negative error code on error.
+ */
+int xe_gt_tlb_invalidation_all(struct xe_gt *gt, int *seq)
+{
+	for (int ins = 0 ; ins < TLB_INV_MAX_INS ; ins++) {
+		seq[ins] = gt->tlb_invalidation.inv_funcs[ins].inv_all(gt);
+		if (seq[ins] < 0)
+			return seq[ins];
+	}
+
+	return 0;
+}
+
+/**
+ * xe_gt_tlb_invalidation_vma - TLB range invalidation generic function.
+ * @gt: graphics technology the invalidation was initiated on.
+ * @vma: VMA to invalidate
+ * @data: private data if needed for some TLB instances.
+ * @seq_out: sequence numbers of the TLB invalidations.
+ * This is the output of the invalidation functions, can be used when calling
+ * xe_gt_tlb_invalidation_wait, in case it's NULL then the caller doesn't need to wait for the
+ * invalidation.
+ *
+ * Issue a PPGTT related TLB invalidation, which will invalidate a range defined in the vma.
+ *
+ * Return: 0 on success, negative error code on error.
+ */
+int xe_gt_tlb_invalidation_vma(struct xe_gt *gt, struct xe_vma *vma, void *data, int *seq_out)
+{
+	int seq[TLB_INV_MAX_INS] = {0};
+
+	for (int ins = 0 ; ins < TLB_INV_MAX_INS ; ins++) {
+		seq[ins] = gt->tlb_invalidation.inv_funcs[ins].inv_range(gt, vma, data);
+		if (seq[ins] < 0)
+			return seq[ins];
+	}
+
+	if (seq_out)
+		memcpy(seq_out, seq, sizeof(seq));
+
+	return 0;
+}
+
+/**
+ * xe_gt_tlb_invalidation_wait - TLB invalidation wait generic function.
+ * @gt: graphics technology the invalidation was initiated on.
+ * @seq: sequence numbers which was returned from the TLB invalidation functions.
+ *
+ * Wait for a TLB invalidation to complete.
+ *
+ * Return: 0 on success, negative value on timeout/failure.
+ */
+int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int *seq)
+{
+	int ret;
+
+	for (int ins = 0 ; ins < TLB_INV_MAX_INS ; ins++) {
+		ret = gt->tlb_invalidation.inv_funcs[ins].inv_wait(gt, seq[ins]);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
+/**
+ * xe_gt_tlb_invalidation_vma_alignments - Make alignments on vma.
+ * @gt: graphics technology the invalidation was initiated on.
+ * @vma: VMA to invalidate
+ * @start_aligned: aligned start address (output).
+ * @length_aligned: aligned length (output).
+ *
+ * Return: 0 on success, negative value on timeout/failure.
+ */
+void xe_gt_tlb_invalidation_vma_alignments(struct xe_gt *gt, struct xe_vma *vma,
+					u64 *start_aligned, u64 *length_aligned)
+{
+	u64 start = xe_vma_start(vma);
+	u64 length = xe_vma_size(vma);
+	u64 align, end;
+
+	if (length < SZ_4K)
+		length = SZ_4K;
+
+	/*
+	 * We need to invalidate a higher granularity if start address
+	 * is not aligned to length. When start is not aligned with
+	 * length we need to find the length large enough to create an
+	 * address mask covering the required range.
+	 */
+	align = roundup_pow_of_two(length);
+	start = ALIGN_DOWN(xe_vma_start(vma), align);
+	end = ALIGN(xe_vma_end(vma), align);
+	length = align;
+	while (start + length < end) {
+		length <<= 1;
+		start = ALIGN_DOWN(xe_vma_start(vma), length);
+	}
+
+	/*
+	 * Minimum invalidation size for a 2MB page that the hardware
+	 * expects is 16MB
+	 */
+	if (length >= SZ_2M) {
+		length = max_t(u64, SZ_16M, length);
+		start = ALIGN_DOWN(xe_vma_start(vma), length);
+	}
+
+	xe_gt_assert(gt, length >= SZ_4K);
+	xe_gt_assert(gt, is_power_of_2(length));
+	xe_gt_assert(gt, !(length & GENMASK(ilog2(SZ_16M) - 1, ilog2(SZ_2M) + 1)));
+	xe_gt_assert(gt, IS_ALIGNED(start, length));
+
+	*start_aligned = start;
+	*length_aligned = length;
+}
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
index fab65b53cb24..406e2820e8c1 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: MIT */
 /*
- * Copyright © 2023 Intel Corporation
+ * Copyright © 2024 Intel Corporation
  */
 
 #ifndef _XE_GT_TLB_INVALIDATION_H_
@@ -8,19 +8,57 @@
 
 #include <linux/types.h>
 
-#include "xe_gt_guc_tlb_invalidation_types.h"
-
-struct xe_gt;
-struct xe_guc;
 struct xe_vma;
+struct xe_device;
+struct xe_gt;
+
+enum xe_gt_tlb_instances {
+	GUC_TLB = 0,
+	TLB_INV_MAX_INS
+};
+
+struct xe_gt_tlb_ins_invalidation_funcs {
+	/**
+	 * struct xe_gt_tlb_invalidation_funcs member inv_range
+	 *
+	 * @gt: graphics technology the invalidation was initiated on.
+	 * @vma: Pointer to vma data.
+	 * @data: private data of the specific invalidation.
+	 *
+	 * This function should invalidate range of virtual addresses.
+	 * The function return sequence number > 0 in case we need to wait for the invalidation,
+	 * otherwise 0 which indicate success and no wait is needed, negative number upon failure.
+	 */
+	int  (*inv_range)(struct xe_gt *gt, struct xe_vma *vma, void *data);
+
+	/**
+	 * struct xe_gt_tlb_invalidation_funcs member inv_all
+	 *
+	 * @gt: graphics technology the invalidation was initiated on.
+	 *
+	 * This function should invalidate the TLB instance when GGTT table is changed.
+	 * When GGTT is changed driver must invalidate all mappings for both GGTT/PPGTT in the TLB
+	 * instance.
+	 * The function return sequence number > 0 in case we need to wait for the invalidation,
+	 * otherwise 0 which indicate success and no wait is needed, negative number upon failure.
+	 */
+	int  (*inv_all)(struct xe_gt *gt);
+
+	/**
+	 * struct xe_gt_tlb_invalidation_funcs member inv_wait
+	 *
+	 * @gt: graphics technology the invalidation was initiated on.
+	 * @seq: the sequence number returned from the invalidation function.
+	 *
+	 * This function should wait till the invalidation is done.
+	 */
+	int  (*inv_wait)(struct xe_gt *gt, int seq);
+};
 
 int xe_gt_tlb_invalidation_init(struct xe_gt *gt);
-void xe_gt_tlb_invalidation_reset(struct xe_gt *gt);
-int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt);
-int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
-			       struct xe_gt_guc_tlb_invalidation_fence *fence,
-			       struct xe_vma *vma);
-int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int seqno);
-int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len);
-
-#endif	/* _XE_GT_TLB_INVALIDATION_ */
+int xe_gt_tlb_invalidation_vma(struct xe_gt *gt, struct xe_vma *vma, void *data, int *seq_out);
+int xe_gt_tlb_invalidation_all(struct xe_gt *gt, int *seq_out);
+int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int *seq);
+void xe_gt_tlb_invalidation_vma_alignments(struct xe_gt *gt, struct xe_vma *vma,
+					   u64 *start_aligned, u64 *length_aligned);
+#endif /* _XE_GT_TLB_INVALIDATION_H_ */
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index c38e48c039e6..49a88b0d0d25 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -190,6 +190,10 @@ struct xe_gt {
 		struct delayed_work fence_tdr;
 		/** @tlb_invalidation.lock: protects TLB invalidation fences */
 		spinlock_t lock;
+		/**
+		 * @tlb_invalidation.inv_funcs: invalidation functions for TLB instances
+		 */
+		struct xe_gt_tlb_ins_invalidation_funcs *inv_funcs;
 	} tlb_invalidation;
 
 	/**
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 965e17c640c9..b2825ed0f1fa 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -28,7 +28,7 @@
 #include "xe_drm_client.h"
 #include "xe_exec_queue.h"
 #include "xe_gt_pagefault.h"
-#include "xe_gt_guc_tlb_invalidation.h"
+#include "xe_gt_tlb_invalidation.h"
 #include "xe_migrate.h"
 #include "xe_pat.h"
 #include "xe_pm.h"
@@ -3146,7 +3146,7 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
 	struct xe_device *xe = xe_vma_vm(vma)->xe;
 	struct xe_tile *tile;
 	u32 tile_needs_invalidate = 0;
-	int seqno[XE_MAX_TILES_PER_DEVICE];
+	int seqno[XE_MAX_TILES_PER_DEVICE][TLB_INV_MAX_INS] = {{0}};
 	u8 id;
 	int ret;
 
@@ -3179,15 +3179,15 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
 			 * FIXME: We potentially need to invalidate multiple
 			 * GTs within the tile
 			 */
-			seqno[id] = xe_gt_guc_tlb_invalidation_vma(tile->primary_gt, NULL, vma);
-			if (seqno[id] < 0)
-				return seqno[id];
+			ret = xe_gt_tlb_invalidation_vma(tile->primary_gt, vma, NULL, seqno[id]);
+			if (ret < 0)
+				return ret;
 		}
 	}
 
 	for_each_tile(tile, xe, id) {
 		if (tile_needs_invalidate & BIT(id)) {
-			ret = xe_gt_guc_tlb_invalidation_wait(tile->primary_gt, seqno[id]);
+			ret = xe_gt_tlb_invalidation_wait(tile->primary_gt, seqno[id]);
 			if (ret < 0)
 				return ret;
 		}
-- 
2.34.1

