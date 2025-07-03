Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39FD0C77B7C
	for <intel-xe@archiver.kernel.org>; Thu,  3 Jul 2025 14:18:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 036C58914B;
	Thu,  3 Jul 2025 14:18:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fmsI+uO5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9419B8914B
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Jul 2025 14:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751552324; x=1783088324;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oVTo4j/P8j8EiR6qBNTG6U55plHr5py/eb4GSZspJBE=;
 b=fmsI+uO5OYIb4WuNwPGZdxNRtTc1KbAlmAyNxRrKM8nHSQMQkFLdDOPc
 U07Izannfq74qAXFMf0iF4ACM7dcmzb2l+9FDFfWRbZ/p1kM1F5xxBhjE
 /upDzv3XqHYi/pJ0d5uPJQb1tyan5Vl1zhxL5TWAv17Tasy/oUoiAnB3X
 Io+mSSv1wao0m+3obvs2SyNt7NfNHZDxmTGJmf6IsxXPZXGtmhtB6bill
 InaAsf9gle+W4Zxi3jnBx+Lt8A+6wHzWJu28COwhXRTnsNPEOKliAOOaA
 XXEiRhV94iKz+svAVVWE1zZwcNuk6hxMYTgXzBNk5UW7BRgtkqQFklF69 w==;
X-CSE-ConnectionGUID: t1Z9MdT1SAO0p6v43jw8Gg==
X-CSE-MsgGUID: 5KEUgfQpTr6WP41dNt3bAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="57554012"
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; d="scan'208";a="57554012"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 07:18:31 -0700
X-CSE-ConnectionGUID: 3DohUY1PR5yW0d3DljOdMw==
X-CSE-MsgGUID: YDeIc1n5Rf6BGUAfXEpLVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; d="scan'208";a="154019163"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.112.168])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 07:18:29 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v3 2/3] drm/xe/pf: Invalidate LMTT during LMEM unprovisioning
Date: Thu,  3 Jul 2025 16:18:20 +0200
Message-Id: <20250703141820.1788-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20250702223041.1700-3-michal.wajdeczko@intel.com>
References: <20250702223041.1700-3-michal.wajdeczko@intel.com>
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

Invalidate LMTT immediately after removing VF's LMTT page tables
and clearing root PTE in the LMTT PD to avoid any invalid access
by the hardware (and VF) due to stale data.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
v2: drop unused num_fences (CI)
v3: rebase (drm-tip)
---
 drivers/gpu/drm/xe/xe_device.h              |  4 ++
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 35 +++++++++++++
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h |  2 +
 drivers/gpu/drm/xe/xe_lmtt.c                | 54 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_lmtt.h                |  1 +
 5 files changed, 96 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index f0eb8150f185..bc802e066a7d 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -131,6 +131,10 @@ static inline bool xe_device_uc_enabled(struct xe_device *xe)
 	for ((id__) = 0; (id__) < (xe__)->info.tile_count * (xe__)->info.max_gt_per_tile; (id__)++) \
 		for_each_if((gt__) = xe_device_get_gt((xe__), (id__)))
 
+#define for_each_gt_on_tile(gt__, tile__, id__) \
+	for_each_gt((gt__), (tile__)->xe, (id__)) \
+		for_each_if((gt__)->tile == (tile__))
+
 static inline struct xe_force_wake *gt_to_fw(struct xe_gt *gt)
 {
 	return &gt->pm.fw;
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index 6088df8e159c..4fdd5b300265 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -330,6 +330,41 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
 	return 0;
 }
 
+static int send_tlb_invalidation_all(struct xe_gt *gt,
+				     struct xe_gt_tlb_invalidation_fence *fence)
+{
+	u32 action[] = {
+		XE_GUC_ACTION_TLB_INVALIDATION_ALL,
+		0,  /* seqno, replaced in send_tlb_invalidation */
+		MAKE_INVAL_OP(XE_GUC_TLB_INVAL_FULL),
+	};
+
+	return send_tlb_invalidation(&gt->uc.guc, fence, action, ARRAY_SIZE(action));
+}
+
+/**
+ * xe_gt_tlb_invalidation_all_async - Invalidate all TLBs across PF and all VFs.
+ * @gt: the &xe_gt structure
+ * @fence: the &xe_gt_tlb_invalidation_fence to be signaled on completion
+ *
+ * Send a request to invalidate all TLBs across PF and all VFs.
+ *
+ * Return: 0 on success, negative error code on error
+ */
+int xe_gt_tlb_invalidation_all_async(struct xe_gt *gt,
+				     struct xe_gt_tlb_invalidation_fence *fence)
+{
+	int err;
+
+	xe_gt_assert(gt, gt == fence->gt);
+
+	err = send_tlb_invalidation_all(gt, fence);
+	if (err)
+		xe_gt_err(gt, "TLB invalidation request failed (%pe)", ERR_PTR(err));
+
+	return err;
+}
+
 /*
  * Ensure that roundup_pow_of_two(length) doesn't overflow.
  * Note that roundup_pow_of_two() operates on unsigned long,
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
index 31072dbcad8e..40648f952aee 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
@@ -20,6 +20,8 @@ int xe_gt_tlb_invalidation_init_early(struct xe_gt *gt);
 void xe_gt_tlb_invalidation_reset(struct xe_gt *gt);
 int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt);
 void xe_gt_tlb_invalidation_vm(struct xe_gt *gt, struct xe_vm *vm);
+int xe_gt_tlb_invalidation_all_async(struct xe_gt *gt,
+				     struct xe_gt_tlb_invalidation_fence *fence);
 int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
 				 struct xe_gt_tlb_invalidation_fence *fence,
 				 u64 start, u64 end, u32 asid);
diff --git a/drivers/gpu/drm/xe/xe_lmtt.c b/drivers/gpu/drm/xe/xe_lmtt.c
index b56437a816e4..0e842939b027 100644
--- a/drivers/gpu/drm/xe/xe_lmtt.c
+++ b/drivers/gpu/drm/xe/xe_lmtt.c
@@ -11,6 +11,7 @@
 
 #include "xe_assert.h"
 #include "xe_bo.h"
+#include "xe_gt_tlb_invalidation.h"
 #include "xe_lmtt.h"
 #include "xe_map.h"
 #include "xe_mmio.h"
@@ -216,6 +217,58 @@ void xe_lmtt_init_hw(struct xe_lmtt *lmtt)
 	lmtt_setup_dir_ptr(lmtt);
 }
 
+static int lmtt_invalidate_hw(struct xe_lmtt *lmtt)
+{
+	struct xe_gt_tlb_invalidation_fence fences[XE_MAX_GT_PER_TILE];
+	struct xe_gt_tlb_invalidation_fence *fence = fences;
+	struct xe_tile *tile = lmtt_to_tile(lmtt);
+	struct xe_gt *gt;
+	int result = 0;
+	int err;
+	u8 id;
+
+	for_each_gt_on_tile(gt, tile, id) {
+		xe_gt_tlb_invalidation_fence_init(gt, fence, true);
+		err = xe_gt_tlb_invalidation_all_async(gt, fence);
+		result = result ?: err;
+		fence++;
+	}
+
+	lmtt_debug(lmtt, "num_fences=%d err=%d\n", (int)(fence - fences), result);
+
+	/*
+	 * It is fine to wait for all fences, even for those which covers the
+	 * invalidation request that failed, as such fence should be already
+	 * marked as signaled.
+	 */
+	fence = fences;
+	for_each_gt_on_tile(gt, tile, id)
+		xe_gt_tlb_invalidation_fence_wait(fence++);
+
+	return result;
+}
+
+/**
+ * xe_lmtt_invalidate_hw - Invalidate LMTT hardware.
+ * @lmtt: the &xe_lmtt to invalidate
+ *
+ * Send requests to all GuCs on this tile to invalidate all TLBs.
+ *
+ * This function should be called only when running as a PF driver.
+ */
+void xe_lmtt_invalidate_hw(struct xe_lmtt *lmtt)
+{
+	struct xe_device *xe = lmtt_to_xe(lmtt);
+	int err;
+
+	lmtt_assert(lmtt, IS_SRIOV_PF(xe));
+
+	err = lmtt_invalidate_hw(lmtt);
+	if (err)
+		xe_sriov_warn(xe, "LMTT%u invalidation failed (%pe)",
+			      lmtt_to_tile(lmtt)->id, ERR_PTR(err));
+}
+
 static void lmtt_write_pte(struct xe_lmtt *lmtt, struct xe_lmtt_pt *pt,
 			   u64 pte, unsigned int idx)
 {
@@ -265,6 +318,7 @@ static void lmtt_drop_pages(struct xe_lmtt *lmtt, unsigned int vfid)
 		return;
 
 	lmtt_write_pte(lmtt, pd, LMTT_PTE_INVALID, vfid);
+	lmtt_invalidate_hw(lmtt);
 
 	lmtt_assert(lmtt, pd->level > 0);
 	lmtt_assert(lmtt, pt->level == pd->level - 1);
diff --git a/drivers/gpu/drm/xe/xe_lmtt.h b/drivers/gpu/drm/xe/xe_lmtt.h
index cb10ef994db6..75a234fbf367 100644
--- a/drivers/gpu/drm/xe/xe_lmtt.h
+++ b/drivers/gpu/drm/xe/xe_lmtt.h
@@ -15,6 +15,7 @@ struct xe_lmtt_ops;
 #ifdef CONFIG_PCI_IOV
 int xe_lmtt_init(struct xe_lmtt *lmtt);
 void xe_lmtt_init_hw(struct xe_lmtt *lmtt);
+void xe_lmtt_invalidate_hw(struct xe_lmtt *lmtt);
 int xe_lmtt_prepare_pages(struct xe_lmtt *lmtt, unsigned int vfid, u64 range);
 int xe_lmtt_populate_pages(struct xe_lmtt *lmtt, unsigned int vfid, struct xe_bo *bo, u64 offset);
 void xe_lmtt_drop_pages(struct xe_lmtt *lmtt, unsigned int vfid);
-- 
2.47.1

