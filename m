Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17BA1C282D1
	for <intel-xe@archiver.kernel.org>; Thu,  6 Mar 2025 22:21:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D26CE10E7F3;
	Thu,  6 Mar 2025 22:21:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UQapNh6Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F8E810E112
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Mar 2025 22:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741299694; x=1772835694;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CsQdEhq44cjk1E8936U9qd41EK7vOvLHbCETctDxYHQ=;
 b=UQapNh6YsNtPufGbc4BZ9flgZhwQPU/jM98qor1/mWp0TOVVmwD5uBlE
 +WKhvf3DAE1oWE7mJsx5iuvMAZQyK8aGPjjVf1H9sCiN0hHONV/aJCxgd
 T0403bvhbdAvWPGZ5DTAa70M1aiS0NTj8CNN+cT8fnEh5cWY6F80/Bu53
 xrNrUelyxwxkw92PcCMR1mbztaL3pL3S9fUiIbTRihcn6xI4eku0vty6j
 z5xcPsvceE0/sp+NOQ5UiQ+KRygsF5OkfbcT3ivSxozS4cKZibLA2K0RQ
 nz+CHSV9NwiCKgIKvzgbG3cb9Rscp4a9X/eD/WS0ZLlip5eUAHoqVXOqc Q==;
X-CSE-ConnectionGUID: 3vnKWdUlSmSRMZaVwwLOPA==
X-CSE-MsgGUID: ohYik27PSWKsu/GiRkW5Ug==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="53736312"
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; d="scan'208";a="53736312"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 14:21:34 -0800
X-CSE-ConnectionGUID: 4Fm7frukT1eYucSII5cYtw==
X-CSE-MsgGUID: eU3CavutQV+Uzb+5uMVaXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; d="scan'208";a="119662880"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by fmviesa010.fm.intel.com with ESMTP; 06 Mar 2025 14:21:32 -0800
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v4 3/3] drm/xe/vf: Fixup CTB send buffer messages after
 migration
Date: Thu,  6 Mar 2025 23:21:26 +0100
Message-Id: <20250306222126.3382322-4-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250306222126.3382322-1-tomasz.lis@intel.com>
References: <20250306222126.3382322-1-tomasz.lis@intel.com>
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

During post-migration recovery of a VF, it is necessary to update
GGTT references included in messages which are going to be sent
to GuC. GuC will start consuming messages after VF KMD will inform
it about fixups being done; before that, the VF KMD is expected
to update any H2G messages which are already in send buffer but
were not consumed by GuC.

Only a small subset of messages allowed for VFs have GGTT references
in them. This patch adds the functionality to parse the CTB send
ring buffer and shift addresses contained within.

While fixing the CTB content, ct->lock is not taken. This means
the only barrier taken remains GGTT address lock - which is ok,
because only requests with GGTT addresses matter, but it also means
tail changes can happen during the CTB fixups execution (which may
be ignored as any new messages will not have anything to fix).

The GGTT address locking will be introduced in a future series.

v2: removed storing shift as that's now done in VMA nodes patch;
  macros to inlines; warns to asserts; log messages fixes (Michal)
v3: Removed inline keywords, enums for offsets in CTB messages,
 less error messages, if return unused then made functs void (Michal)
v4: Update the cached head before starting fixups

Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_actions_abi.h |   7 ++
 drivers/gpu/drm/xe/xe_guc_ct.c           | 147 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_ct.h           |   2 +
 drivers/gpu/drm/xe/xe_guc_submit.c       |   4 +
 drivers/gpu/drm/xe/xe_sriov_vf.c         |  18 +++
 5 files changed, 178 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
index ec516e838ee8..dde6cb5a6be9 100644
--- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
@@ -160,6 +160,13 @@ enum xe_guc_preempt_options {
 	XE_GUC_PREEMPT_OPTION_DROP_SUBMIT_Q = 0x8,
 };
 
+enum xe_guc_register_context_multi_lrc_param_offsets {
+	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_WQ_DESC = 5,
+	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_WQ_BASE = 7,
+	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_N_CHILDREN = 10,
+	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_HWLRCA = 11
+};
+
 enum xe_guc_report_status {
 	XE_GUC_REPORT_STATUS_UNKNOWN = 0x0,
 	XE_GUC_REPORT_STATUS_ACKED = 0x1,
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 72ad576fc18e..6f19bf9565ba 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -84,6 +84,8 @@ struct g2h_fence {
 	bool done;
 };
 
+#define make_u64(hi, lo) ((u64)((u64)(u32)(hi) << 32 | (u32)(lo)))
+
 static void g2h_fence_init(struct g2h_fence *g2h_fence, u32 *response_buffer)
 {
 	g2h_fence->response_buffer = response_buffer;
@@ -1622,6 +1624,151 @@ static void g2h_worker_func(struct work_struct *w)
 	receive_g2h(ct);
 }
 
+static u32 ctb_read32(struct xe_device *xe, struct iosys_map *cmds,
+			     u32 head, u32 pos)
+{
+	u32 msg[1];
+
+	xe_map_memcpy_from(xe, msg, cmds, (head + pos) * sizeof(u32),
+			   1 * sizeof(u32));
+	return msg[0];
+}
+
+static void ctb_fixup64(struct xe_device *xe, struct iosys_map *cmds,
+			       u32 head, u32 pos, s64 shift)
+{
+	u32 msg[2];
+	u64 offset;
+
+	xe_map_memcpy_from(xe, msg, cmds, (head + pos) * sizeof(u32),
+			   2 * sizeof(u32));
+	offset = make_u64(msg[1], msg[0]);
+	offset += shift;
+	msg[0] = lower_32_bits(offset);
+	msg[1] = upper_32_bits(offset);
+	xe_map_memcpy_to(xe, cmds, (head + pos) * sizeof(u32), msg, 2 * sizeof(u32));
+}
+
+/*
+ * ct_update_addresses_in_message - Shift any GGTT addresses within
+ * a single message left within CTB from before post-migration recovery.
+ * @ct: pointer to CT struct of the target GuC
+ * @cmds: iomap buffer containing CT messages
+ * @head: start of the target message within the buffer
+ * @len: length of the target message
+ * @size: size of the commands buffer
+ * @shift: the address shift to be added to each GGTT reference
+ */
+static void ct_update_addresses_in_message(struct xe_guc_ct *ct,
+					   struct iosys_map *cmds, u32 head,
+					   u32 len, u32 size, s64 shift)
+{
+	struct xe_device *xe = ct_to_xe(ct);
+	u32 action, i, n;
+	u32 msg[1];
+
+	xe_map_memcpy_from(xe, msg, cmds, head * sizeof(u32),
+			   1 * sizeof(u32));
+	action = FIELD_GET(GUC_HXG_REQUEST_MSG_0_ACTION, msg[0]);
+	switch (action) {
+	case XE_GUC_ACTION_REGISTER_CONTEXT:
+	case XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC:
+		/* field wq_desc */
+		ctb_fixup64(xe, cmds, head, XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_WQ_DESC, shift);
+		/* field wq_base */
+		ctb_fixup64(xe, cmds, head, XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_WQ_BASE, shift);
+		if (action == XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC) {
+			/* field number_children */
+			n = ctb_read32(xe, cmds, head, XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_N_CHILDREN);
+			/* field hwlrca and child lrcas */
+			for (i = 0; i < n; i++)
+				ctb_fixup64(xe, cmds, head, XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_HWLRCA + 2 * i, shift);
+		} else {
+			/* field hwlrca */
+			ctb_fixup64(xe, cmds, head, 10, shift);
+		}
+		break;
+	default:
+		break;
+	}
+}
+
+static int ct_update_addresses_in_buffer(struct xe_guc_ct *ct,
+					 struct guc_ctb *h2g,
+					 s64 shift, u32 *mhead, s32 avail)
+{
+	struct xe_device *xe = ct_to_xe(ct);
+	u32 head = *mhead;
+	u32 size = h2g->info.size;
+	u32 msg[1];
+	u32 len;
+
+	/* Read header */
+	xe_map_memcpy_from(xe, msg, &h2g->cmds, sizeof(u32) * head,
+			   sizeof(u32));
+	len = FIELD_GET(GUC_CTB_MSG_0_NUM_DWORDS, msg[0]) + GUC_CTB_MSG_MIN_LEN;
+
+	if (unlikely(len > (u32)avail)) {
+		struct xe_gt *gt = ct_to_gt(ct);
+
+		xe_gt_err(gt, "H2G channel broken on read, avail=%d, len=%d, fixups skipped\n",
+			  avail, len);
+		return 0;
+	}
+
+	head = (head + 1) % size;
+	ct_update_addresses_in_message(ct, &h2g->cmds, head, len - 1, size, shift);
+	*mhead = (head + len - 1) % size;
+
+	return avail - len;
+}
+
+/**
+ * xe_guc_ct_fixup_messages_with_ggtt - Fixup any pending H2G CTB messages by updating
+ * GGTT offsets in their payloads.
+ * @ct: pointer to CT struct of the target GuC
+ * @ggtt_shift: shift to be added to all GGTT addresses within the CTB
+ */
+void xe_guc_ct_fixup_messages_with_ggtt(struct xe_guc_ct *ct, s64 ggtt_shift)
+{
+	struct xe_guc *guc = ct_to_guc(ct);
+	struct xe_gt *gt = guc_to_gt(guc);
+	struct guc_ctb *h2g = &ct->ctbs.h2g;
+	u32 head, tail, size;
+	s32 avail;
+
+	if (unlikely(h2g->info.broken))
+		return;
+
+	h2g->info.head = desc_read(ct_to_xe(ct), h2g, head);
+	head = h2g->info.head;
+	tail = READ_ONCE(h2g->info.tail);
+	size = h2g->info.size;
+
+	xe_gt_assert(gt, head <= size);
+
+	if (unlikely(tail >= size))
+		goto corrupted;
+
+	avail = tail - head;
+
+	/* beware of buffer wrap case */
+	if (unlikely(avail < 0))
+		avail += size;
+	xe_gt_dbg(gt, "available %d (%u:%u:%u)\n", avail, head, tail, size);
+	xe_gt_assert(gt, avail >= 0);
+
+	while (avail > 0)
+		avail = ct_update_addresses_in_buffer(ct, h2g, ggtt_shift, &head, avail);
+
+	return;
+
+corrupted:
+	xe_gt_err(gt, "Corrupted H2G descriptor head=%u tail=%u size=%u\n",
+		 head, tail, size);
+	h2g->info.broken = true;
+}
+
 static struct xe_guc_ct_snapshot *guc_ct_snapshot_alloc(struct xe_guc_ct *ct, bool atomic,
 							bool want_ctb)
 {
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
index 82c4ae458dda..5649bda82823 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct.h
@@ -22,6 +22,8 @@ void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot, struct drm_pr
 void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot);
 void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool want_ctb);
 
+void xe_guc_ct_fixup_messages_with_ggtt(struct xe_guc_ct *ct, s64 ggtt_shift);
+
 static inline bool xe_guc_ct_enabled(struct xe_guc_ct *ct)
 {
 	return ct->state == XE_GUC_CT_STATE_ENABLED;
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index b95934055f72..4442fb00d0aa 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -469,12 +469,16 @@ static void __register_mlrc_exec_queue(struct xe_guc *guc,
 	action[len++] = info->context_idx;
 	action[len++] = info->engine_class;
 	action[len++] = info->engine_submit_mask;
+	xe_gt_assert(guc_to_gt(guc), len == XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_WQ_DESC);
 	action[len++] = info->wq_desc_lo;
 	action[len++] = info->wq_desc_hi;
+	xe_gt_assert(guc_to_gt(guc), len == XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_WQ_BASE);
 	action[len++] = info->wq_base_lo;
 	action[len++] = info->wq_base_hi;
 	action[len++] = info->wq_size;
+	xe_gt_assert(guc_to_gt(guc), len == XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_N_CHILDREN);
 	action[len++] = q->width;
+	xe_gt_assert(guc_to_gt(guc), len == XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_HWLRCA);
 	action[len++] = info->hwlrca_lo;
 	action[len++] = info->hwlrca_hi;
 
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index 4ee8fc70a744..cd759579b9b4 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -10,6 +10,7 @@
 #include "xe_gt.h"
 #include "xe_gt_sriov_printk.h"
 #include "xe_gt_sriov_vf.h"
+#include "xe_guc_ct.h"
 #include "xe_pm.h"
 #include "xe_sriov.h"
 #include "xe_sriov_printk.h"
@@ -158,6 +159,20 @@ static int vf_post_migration_requery_guc(struct xe_device *xe)
 	return ret;
 }
 
+static void vf_post_migration_fixup_ctb(struct xe_device *xe)
+{
+	struct xe_gt *gt;
+	unsigned int id;
+
+	xe_assert(xe, IS_SRIOV_VF(xe));
+
+	for_each_gt(gt, xe, id) {
+		struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
+
+		xe_guc_ct_fixup_messages_with_ggtt(&gt->uc.guc.ct, config->ggtt_shift);
+	}
+}
+
 /*
  * vf_post_migration_imminent - Check if post-restore recovery is coming.
  * @xe: the &xe_device struct instance
@@ -224,6 +239,9 @@ static void vf_post_migration_recovery(struct xe_device *xe)
 
 	err = vf_post_migration_fixup_ggtt_nodes(xe);
 	/* FIXME: add the recovery steps */
+	if (err != ENODATA)
+		vf_post_migration_fixup_ctb(xe);
+
 	vf_post_migration_notify_resfix_done(xe);
 	xe_pm_runtime_put(xe);
 	drm_notice(&xe->drm, "migration recovery ended\n");
-- 
2.25.1

