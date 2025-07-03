Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D96C77B7C
	for <intel-xe@archiver.kernel.org>; Thu,  3 Jul 2025 09:11:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4351D10E7F3;
	Thu,  3 Jul 2025 09:11:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H7GzKHvr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F337510E7F3
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Jul 2025 09:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751533865; x=1783069865;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sxlFW5weDpVkSSJjs0jWZAdteAN8kvHOfuT2pMZjs2Y=;
 b=H7GzKHvr8Jcj/rpy59GTJX7nQ2s0Up+YIXR/jdPzRKiv6b3c5j55iFgs
 iyLvstozTwhjiVcyf6KuHpipaUjXF4Tt7kCyE5UEvbq136qMYsT2EtaGm
 Ka9tkfvWKQ3QHrDR6eemwSEBfxGigAzy4e8QwYpeBDlvzUqC4RsqEhaUD
 RpXfJXwqr1ZBE6pPcqSpapkspJIMulyTHYObXdYdPOqdWNwNl+lxTadTw
 wkbmxaCNnkuLm9gdjPaEAm6e6RqbZW/krRrtin6yqPukETuyEoo6mKAfI
 yu9On8CEKuDSleMFYCB0pglbZ2N5qPhWrU2meBE7+c1GL5qN3J0qlPfl8 w==;
X-CSE-ConnectionGUID: 8if7loW+RLWfd2OPgRoBxA==
X-CSE-MsgGUID: FYwjUYc3SaekTo4VRv+VRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="53777333"
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; d="scan'208";a="53777333"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 02:11:04 -0700
X-CSE-ConnectionGUID: mgZCzCmtTgWMybELtQiydQ==
X-CSE-MsgGUID: lGVxO7oYTkecazAEv1z+Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; d="scan'208";a="153733388"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.112.168])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 02:11:00 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v2 2/3] drm/xe/pf: Invalidate LMTT during LMEM unprovisioning
Date: Thu,  3 Jul 2025 11:10:46 +0200
Message-Id: <20250703091046.1744-1-michal.wajdeczko@intel.com>
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
---
 drivers/gpu/drm/xe/xe_device.h              |  4 ++
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 35 +++++++++++++
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h |  2 +
 drivers/gpu/drm/xe/xe_lmtt.c                | 54 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_lmtt.h                |  1 +
 5 files changed, 96 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index e4da797a984b..a7acd899aa76 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -130,6 +130,10 @@ static inline bool xe_device_uc_enabled(struct xe_device *xe)
 	for ((id__) = 1; (id__) < (xe__)->info.tile_count; (id__)++) \
 		for_each_if((tile__) = &(xe__)->tiles[(id__)])
 
+#define for_each_gt_on_tile(gt__, tile__, id__) \
+	for ((id__) = 0; (id__) < XE_MAX_GT_PER_TILE; (id__)++) \
+		for_each_if((gt__) = xe_tile_get_gt((tile__), (id__)))
+
 /*
  * FIXME: This only works for now since multi-tile and standalone media
  * happen to be mutually exclusive.  Future platforms may change this...
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

