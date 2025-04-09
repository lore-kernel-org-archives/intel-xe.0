Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D29DAC369A2
	for <intel-xe@archiver.kernel.org>; Wed,  9 Apr 2025 21:13:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98F4610E335;
	Wed,  9 Apr 2025 21:13:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eXWSPY8V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C067710E335
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Apr 2025 21:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744233232; x=1775769232;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gfjMxJloTiz+9M8MTroVLnJXiFCl/YLaytC5D4qGkdk=;
 b=eXWSPY8VW0pmnTMrRHhZgyeiJeMBqeDi47sb/RNbtYXtON0gDNrVDtRD
 K+QDDRrW8yJdYl453lGEIrxxH1BpfrGwDP9+VH877J/zGx6PlGK5A6tW+
 0XC8xjkiwXUyO77XLMGxTwnwZ5JcYPTnoehO0C6Sbc9MFNtKjzzAwaK+N
 F/1aIdTNBmy+dkJvCHz/RgNHQuibJtyES+idWpGKe2wBf6JzTlVTtIwPo
 5tVXflV61/qZfEnoCdHv6MIznVu6XJmxxaYN6h4UwmW29vj8Ml3j7uP/g
 jzXEDjZIUnH2Zos7d0op2E8XKiWn3/xW3eXfptzD4FvWOxzXISwJKU6UH w==;
X-CSE-ConnectionGUID: 5MOj3EqDQv6lhc9oUS6f/w==
X-CSE-MsgGUID: qX2cL/vTTee8gT7kIXWamA==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="49572500"
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; d="scan'208";a="49572500"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 14:13:52 -0700
X-CSE-ConnectionGUID: DIfsq0hCTbWJiT1vUgxtjQ==
X-CSE-MsgGUID: cFEMPzRRQXq20Pmqd8ChmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; d="scan'208";a="133677287"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by orviesa004.jf.intel.com with ESMTP; 09 Apr 2025 14:13:51 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v8 4/4] drm/xe/vf: Fixup CTB send buffer messages after
 migration
Date: Wed,  9 Apr 2025 23:13:40 +0200
Message-Id: <20250409211340.3046931-5-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250409211340.3046931-1-tomasz.lis@intel.com>
References: <20250409211340.3046931-1-tomasz.lis@intel.com>
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
v3: removed inline keywords, enums for offsets in CTB messages,
  less error messages, if return unused then made functs void (Michal)
v4: update the cached head before starting fixups
v5: removed/updated comments, wrapped lines, converted assert into
  error, enums for offsets to separate patch, reused xe_map_rd
v6: define xe_map_*_array() macros, support CTB wrap which divides
  a message, updated comments, moved one function to an earlier patch
v7: renamed few functions, wider use on previously introduced helper,
  separate cases in parsing messges, documented a static funct

Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c   | 161 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_ct.h   |   2 +
 drivers/gpu/drm/xe/xe_map.h      |  12 +++
 drivers/gpu/drm/xe/xe_sriov_vf.c |  18 ++++
 4 files changed, 193 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 0a4fef7d7225..66a1a14f45a5 100644
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
@@ -1623,6 +1625,165 @@ static void g2h_worker_func(struct work_struct *w)
 	receive_g2h(ct);
 }
 
+static void xe_ring_map_fixup_u64(struct xe_device *xe, struct iosys_map *cmds,
+				  u32 size, u32 head, u32 pos, s64 shift)
+{
+	u32 hi, lo;
+	u64 offset;
+
+	lo = xe_map_rd_array_u32(xe, cmds, (head + pos) % size);
+	hi = xe_map_rd_array_u32(xe, cmds, (head + pos + 1) % size);
+	offset = make_u64(hi, lo);
+	offset += shift;
+	lo = lower_32_bits(offset);
+	hi = upper_32_bits(offset);
+	xe_map_wr_array_u32(xe, cmds, (head + pos) % size, lo);
+	xe_map_wr_array_u32(xe, cmds, (head + pos + 1) % size, hi);
+}
+
+/*
+ * Shift any GGTT addresses within a single message left within CTB from
+ * before post-migration recovery.
+ * @ct: pointer to CT struct of the target GuC
+ * @cmds: iomap buffer containing CT messages
+ * @head: start of the target message within the buffer
+ * @len: length of the target message
+ * @size: size of the commands buffer
+ * @shift: the address shift to be added to each GGTT reference
+ */
+static void ct_fixup_ggtt_in_message(struct xe_guc_ct *ct,
+					   struct iosys_map *cmds, u32 head,
+					   u32 len, u32 size, s64 shift)
+{
+	struct xe_device *xe = ct_to_xe(ct);
+	u32 action, i, n;
+	u32 msg[GUC_HXG_MSG_MIN_LEN];
+
+	msg[0] = xe_map_rd_array_u32(xe, cmds, head);
+	action = FIELD_GET(GUC_HXG_REQUEST_MSG_0_ACTION, msg[0]);
+	switch (action) {
+	case XE_GUC_ACTION_REGISTER_CONTEXT:
+		xe_ring_map_fixup_u64(xe, cmds, size, head,
+				      XE_GUC_REGISTER_CONTEXT_DATA_5_WQ_DESC_ADDR_LOWER,
+				      shift);
+		xe_ring_map_fixup_u64(xe, cmds, size, head,
+				      XE_GUC_REGISTER_CONTEXT_DATA_7_WQ_BUF_BASE_LOWER,
+				      shift);
+		xe_ring_map_fixup_u64(xe, cmds, size, head,
+				      XE_GUC_REGISTER_CONTEXT_DATA_10_HW_LRC_ADDR, shift);
+		break;
+	case XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC:
+		xe_ring_map_fixup_u64(xe, cmds, size, head,
+				      XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_5_WQ_DESC_ADDR_LOWER,
+				      shift);
+		xe_ring_map_fixup_u64(xe, cmds, size, head,
+				      XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_7_WQ_BUF_BASE_LOWER,
+				      shift);
+		n = xe_map_rd_array_u32(xe, cmds, head +
+			       XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_10_NUM_CTXS);
+		for (i = 0; i < n; i++)
+			xe_ring_map_fixup_u64(xe, cmds, size, head,
+					      XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_11_HW_LRC_ADDR
+					      + 2 * i, shift);
+		break;
+	default:
+		break;
+	}
+}
+
+/** Apply fixups to a single outgoing CT message within given CTB
+ * @ct: the &xe_guc_ct struct instance representing the target GuC
+ * @h2g: the &guc_ctb struct instance of the target buffer
+ * @shift: shift to be added to all GGTT addresses within the CTB
+ * @mhead: pointer to an integer storing message start position; the
+ *   position is changed to next message before this function return
+ * @avail: size of the area available for parsing, that is length
+ *   of all remaining messages stored within the CTB
+ * Return: size of the area available for parsing after one message
+ *   has been parsed, that is length remaining from the updated mhead
+ */
+static int ct_fixup_ggtt_in_buffer(struct xe_guc_ct *ct, struct guc_ctb *h2g,
+					 s64 shift, u32 *mhead, s32 avail)
+{
+	struct xe_device *xe = ct_to_xe(ct);
+	u32 msg[GUC_HXG_MSG_MIN_LEN];
+	u32 size = h2g->info.size;
+	u32 head = *mhead;
+	u32 len;
+
+	xe_gt_assert(ct_to_gt(ct), avail >= (s32)GUC_CTB_MSG_MIN_LEN);
+
+	/* Read header */
+	msg[0] = xe_map_rd_array_u32(xe, &h2g->cmds, head);
+	len = FIELD_GET(GUC_CTB_MSG_0_NUM_DWORDS, msg[0]) + GUC_CTB_MSG_MIN_LEN;
+
+	if (unlikely(len > (u32)avail)) {
+		xe_gt_err(ct_to_gt(ct), "H2G channel broken on read, avail=%d, len=%d, fixups skipped\n",
+			  avail, len);
+		return 0;
+	}
+
+	head = (head + GUC_CTB_MSG_MIN_LEN) % size;
+	ct_fixup_ggtt_in_message(ct, &h2g->cmds, head, msg_len_to_hxg_len(len), size, shift);
+	*mhead = (head + msg_len_to_hxg_len(len)) % size;
+
+	return avail - len;
+}
+
+/**
+ * xe_guc_ct_fixup_messages_with_ggtt - Fixup any pending H2G CTB messages
+ * @ct: pointer to CT struct of the target GuC
+ * @ggtt_shift: shift to be added to all GGTT addresses within the CTB
+ *
+ * Messages in guc-to-host CTB are owned by GuC and any fixups in them
+ * are made by GuC. But content of the host-to-guc CTB is owned by the
+ * KMD, so fixups to GGTT references in any pending messages need to be
+ * applied here.
+ * This function updates GGTT offsets in payloads of pending H2G CTB
+ * messages (messages which were not consumed by GuC before the VF got
+ * paused).
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
+	if (unlikely(head > size))
+		goto corrupted;
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
+		avail = ct_fixup_ggtt_in_buffer(ct, h2g, ggtt_shift, &head, avail);
+
+	return;
+
+corrupted:
+	xe_gt_err(gt, "Corrupted H2G descriptor head=%u tail=%u size=%u, fixups not applied\n",
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
diff --git a/drivers/gpu/drm/xe/xe_map.h b/drivers/gpu/drm/xe/xe_map.h
index f62e0c8b67ab..db98c8fb121f 100644
--- a/drivers/gpu/drm/xe/xe_map.h
+++ b/drivers/gpu/drm/xe/xe_map.h
@@ -78,6 +78,18 @@ static inline void xe_map_write32(struct xe_device *xe, struct iosys_map *map,
 	iosys_map_wr(map__, offset__, type__, val__);			\
 })
 
+#define xe_map_rd_array(xe__, map__, index__, type__)			\
+	xe_map_rd(xe__, map__, (index__) * sizeof(type__), type__)
+
+#define xe_map_wr_array(xe__, map__, index__, type__, val__)		\
+	xe_map_wr(xe__, map__, (index__) * sizeof(type__), type__, val__)
+
+#define xe_map_rd_array_u32(xe__, map__, index__)			\
+	xe_map_rd_array(xe__, map__, index__, u32)
+
+#define xe_map_wr_array_u32(xe__, map__, index__, val__)		\
+	xe_map_wr_array(xe__, map__, index__, u32, val__)
+
 #define xe_map_rd_field(xe__, map__, struct_offset__, struct_type__, field__) ({	\
 	struct xe_device *__xe = xe__;					\
 	xe_device_assert_mem_access(__xe);				\
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index e70f1ceabbb3..2674fa948fda 100644
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
+		s32 shift = xe_gt_sriov_vf_ggtt_shift(gt);
+
+		xe_guc_ct_fixup_messages_with_ggtt(&gt->uc.guc.ct, shift);
+	}
+}
+
 /*
  * vf_post_migration_imminent - Check if post-restore recovery is coming.
  * @xe: the &xe_device struct instance
@@ -224,6 +239,9 @@ static void vf_post_migration_recovery(struct xe_device *xe)
 
 	need_fixups = vf_post_migration_fixup_ggtt_nodes(xe);
 	/* FIXME: add the recovery steps */
+	if (need_fixups)
+		vf_post_migration_fixup_ctb(xe);
+
 	vf_post_migration_notify_resfix_done(xe);
 	xe_pm_runtime_put(xe);
 	drm_notice(&xe->drm, "migration recovery ended\n");
-- 
2.25.1

