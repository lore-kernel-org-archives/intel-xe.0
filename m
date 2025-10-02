Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 999E3CAC5B8
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 23:38:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C4F210E866;
	Thu,  2 Oct 2025 23:38:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EUR5m7Br";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3C0210E863
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Oct 2025 23:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759448320; x=1790984320;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8CD1dhteDZGAhNNIa+EhTUIbkaSQJRalxNw9BrJCVrY=;
 b=EUR5m7BrO/LlMgzVUwtIY0gQKGOonTXx5+An8SBEt9z5nmXKWTWH5QHu
 n0UrENMTxmZUvXsd6F+TnAJP4WLhdSLMaQzv/NNpkPGt4/w/twdsjb1Or
 fprxPlSGo2cnFeJEhKaaMT7AkI1ptctxPFs6+AoDxo53qlcqKfPw3HgGW
 TmZLVh6buf+1c4SIuamx4NG0Y+WeJCfyGiDskK9RhWOcUhVOVVNiwjP8B
 Mkqmrn8TnUpENuL3SJvLeW3ygpSLT02rhDwD+p38hxS0pyvro7Io6Gyvu
 Mdjh+iIp53idOtvL14cLKy3ZLpECsRuBAvkkPf/n1zYZ2EpLhY6FeKwRE Q==;
X-CSE-ConnectionGUID: YWScJy+vRlSphrIK0IoDaw==
X-CSE-MsgGUID: 7dWRIq7YQoyA142hXXZoVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="84360289"
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; d="scan'208";a="84360289"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 16:38:40 -0700
X-CSE-ConnectionGUID: Y4L83k4vQCWIfIZGs+XCzw==
X-CSE-MsgGUID: TwxLtpkqQoq7rjyVdNlHrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; d="scan'208";a="183180133"
Received: from sachowdh-mobl1.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.252.70])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 16:38:38 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [CI 3/3] Revert "drm/xe/vf: Fixup CTB send buffer messages after
 migration"
Date: Fri,  3 Oct 2025 01:38:24 +0200
Message-ID: <20251002233824.203417-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251002233824.203417-1-michal.wajdeczko@intel.com>
References: <20251002233824.203417-1-michal.wajdeczko@intel.com>
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

From: Matthew Brost <matthew.brost@intel.com>

This reverts commit cef88d1265cac7d415606af73ba58926fd3cd8b7.

Due to change in the VF migration recovery design this code
is not needed any more.

v3:
 - Add commit message (Michal / Lucas)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c   | 183 -------------------------------
 drivers/gpu/drm/xe/xe_guc_ct.h   |   2 -
 drivers/gpu/drm/xe/xe_map.h      |  18 ---
 drivers/gpu/drm/xe/xe_sriov_vf.c |   2 -
 4 files changed, 205 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 18f6327bf552..47079ab9922c 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -25,7 +25,6 @@
 #include "xe_gt_printk.h"
 #include "xe_gt_sriov_pf_control.h"
 #include "xe_gt_sriov_pf_monitor.h"
-#include "xe_gt_sriov_printk.h"
 #include "xe_guc.h"
 #include "xe_guc_log.h"
 #include "xe_guc_relay.h"
@@ -93,8 +92,6 @@ struct g2h_fence {
 	bool done;
 };
 
-#define make_u64(hi, lo) ((u64)((u64)(u32)(hi) << 32 | (u32)(lo)))
-
 static void g2h_fence_init(struct g2h_fence *g2h_fence, u32 *response_buffer)
 {
 	memset(g2h_fence, 0, sizeof(*g2h_fence));
@@ -1793,186 +1790,6 @@ static void g2h_worker_func(struct work_struct *w)
 	receive_g2h(ct);
 }
 
-static void xe_fixup_u64_in_cmds(struct xe_device *xe, struct iosys_map *cmds,
-				 u32 size, u32 idx, s64 shift)
-{
-	u32 hi, lo;
-	u64 offset;
-
-	lo = xe_map_rd_ring_u32(xe, cmds, idx, size);
-	hi = xe_map_rd_ring_u32(xe, cmds, idx + 1, size);
-	offset = make_u64(hi, lo);
-	offset += shift;
-	lo = lower_32_bits(offset);
-	hi = upper_32_bits(offset);
-	xe_map_wr_ring_u32(xe, cmds, idx, size, lo);
-	xe_map_wr_ring_u32(xe, cmds, idx + 1, size, hi);
-}
-
-/*
- * Shift any GGTT addresses within a single message left within CTB from
- * before post-migration recovery.
- * @ct: pointer to CT struct of the target GuC
- * @cmds: iomap buffer containing CT messages
- * @head: start of the target message within the buffer
- * @len: length of the target message
- * @size: size of the commands buffer
- * @shift: the address shift to be added to each GGTT reference
- * Return: true if the message was fixed or needed no fixups, false on failure
- */
-static bool ct_fixup_ggtt_in_message(struct xe_guc_ct *ct,
-				     struct iosys_map *cmds, u32 head,
-				     u32 len, u32 size, s64 shift)
-{
-	struct xe_gt *gt = ct_to_gt(ct);
-	struct xe_device *xe = ct_to_xe(ct);
-	u32 msg[GUC_HXG_MSG_MIN_LEN];
-	u32 action, i, n;
-
-	xe_gt_assert(gt, len >= GUC_HXG_MSG_MIN_LEN);
-
-	msg[0] = xe_map_rd_ring_u32(xe, cmds, head, size);
-	action = FIELD_GET(GUC_HXG_REQUEST_MSG_0_ACTION, msg[0]);
-
-	xe_gt_sriov_dbg_verbose(gt, "fixing H2G %#x\n", action);
-
-	switch (action) {
-	case XE_GUC_ACTION_REGISTER_CONTEXT:
-		if (len != XE_GUC_REGISTER_CONTEXT_MSG_LEN)
-			goto err_len;
-		xe_fixup_u64_in_cmds(xe, cmds, size, head +
-				     XE_GUC_REGISTER_CONTEXT_DATA_5_WQ_DESC_ADDR_LOWER,
-				     shift);
-		xe_fixup_u64_in_cmds(xe, cmds, size, head +
-				     XE_GUC_REGISTER_CONTEXT_DATA_7_WQ_BUF_BASE_LOWER,
-				     shift);
-		xe_fixup_u64_in_cmds(xe, cmds, size, head +
-				     XE_GUC_REGISTER_CONTEXT_DATA_10_HW_LRC_ADDR, shift);
-		break;
-	case XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC:
-		if (len < XE_GUC_REGISTER_CONTEXT_MULTI_LRC_MSG_MIN_LEN)
-			goto err_len;
-		n = xe_map_rd_ring_u32(xe, cmds, head +
-				       XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_10_NUM_CTXS, size);
-		if (len != XE_GUC_REGISTER_CONTEXT_MULTI_LRC_MSG_MIN_LEN + 2 * n)
-			goto err_len;
-		xe_fixup_u64_in_cmds(xe, cmds, size, head +
-				     XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_5_WQ_DESC_ADDR_LOWER,
-				     shift);
-		xe_fixup_u64_in_cmds(xe, cmds, size, head +
-				     XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_7_WQ_BUF_BASE_LOWER,
-				     shift);
-		for (i = 0; i < n; i++)
-			xe_fixup_u64_in_cmds(xe, cmds, size, head +
-					     XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_11_HW_LRC_ADDR
-					     + 2 * i, shift);
-		break;
-	default:
-		break;
-	}
-	return true;
-
-err_len:
-	xe_gt_err(gt, "Skipped G2G %#x message fixups, unexpected length (%u)\n", action, len);
-	return false;
-}
-
-/*
- * Apply fixups to the next outgoing CT message within given CTB
- * @ct: the &xe_guc_ct struct instance representing the target GuC
- * @h2g: the &guc_ctb struct instance of the target buffer
- * @shift: shift to be added to all GGTT addresses within the CTB
- * @mhead: pointer to an integer storing message start position; the
- *   position is changed to next message before this function return
- * @avail: size of the area available for parsing, that is length
- *   of all remaining messages stored within the CTB
- * Return: size of the area available for parsing after one message
- *   has been parsed, that is length remaining from the updated mhead
- */
-static int ct_fixup_ggtt_in_buffer(struct xe_guc_ct *ct, struct guc_ctb *h2g,
-				   s64 shift, u32 *mhead, s32 avail)
-{
-	struct xe_gt *gt = ct_to_gt(ct);
-	struct xe_device *xe = ct_to_xe(ct);
-	u32 msg[GUC_HXG_MSG_MIN_LEN];
-	u32 size = h2g->info.size;
-	u32 head = *mhead;
-	u32 len;
-
-	xe_gt_assert(gt, avail >= (s32)GUC_CTB_MSG_MIN_LEN);
-
-	/* Read header */
-	msg[0] = xe_map_rd_ring_u32(xe, &h2g->cmds, head, size);
-	len = FIELD_GET(GUC_CTB_MSG_0_NUM_DWORDS, msg[0]) + GUC_CTB_MSG_MIN_LEN;
-
-	if (unlikely(len > (u32)avail)) {
-		xe_gt_err(gt, "H2G channel broken on read, avail=%d, len=%d, fixups skipped\n",
-			  avail, len);
-		return 0;
-	}
-
-	head = (head + GUC_CTB_MSG_MIN_LEN) % size;
-	if (!ct_fixup_ggtt_in_message(ct, &h2g->cmds, head, msg_len_to_hxg_len(len), size, shift))
-		return 0;
-	*mhead = (head + msg_len_to_hxg_len(len)) % size;
-
-	return avail - len;
-}
-
-/**
- * xe_guc_ct_fixup_messages_with_ggtt - Fixup any pending H2G CTB messages
- * @ct: pointer to CT struct of the target GuC
- * @ggtt_shift: shift to be added to all GGTT addresses within the CTB
- *
- * Messages in GuC to Host CTB are owned by GuC and any fixups in them
- * are made by GuC. But content of the Host to GuC CTB is owned by the
- * KMD, so fixups to GGTT references in any pending messages need to be
- * applied here.
- * This function updates GGTT offsets in payloads of pending H2G CTB
- * messages (messages which were not consumed by GuC before the VF got
- * paused).
- */
-void xe_guc_ct_fixup_messages_with_ggtt(struct xe_guc_ct *ct, s64 ggtt_shift)
-{
-	struct guc_ctb *h2g = &ct->ctbs.h2g;
-	struct xe_guc *guc = ct_to_guc(ct);
-	struct xe_gt *gt = guc_to_gt(guc);
-	u32 head, tail, size;
-	s32 avail;
-
-	if (unlikely(h2g->info.broken))
-		return;
-
-	h2g->info.head = desc_read(ct_to_xe(ct), h2g, head);
-	head = h2g->info.head;
-	tail = READ_ONCE(h2g->info.tail);
-	size = h2g->info.size;
-
-	if (unlikely(head > size))
-		goto corrupted;
-
-	if (unlikely(tail >= size))
-		goto corrupted;
-
-	avail = tail - head;
-
-	/* beware of buffer wrap case */
-	if (unlikely(avail < 0))
-		avail += size;
-	xe_gt_dbg(gt, "available %d (%u:%u:%u)\n", avail, head, tail, size);
-	xe_gt_assert(gt, avail >= 0);
-
-	while (avail > 0)
-		avail = ct_fixup_ggtt_in_buffer(ct, h2g, ggtt_shift, &head, avail);
-
-	return;
-
-corrupted:
-	xe_gt_err(gt, "Corrupted H2G descriptor head=%u tail=%u size=%u, fixups not applied\n",
-		  head, tail, size);
-	h2g->info.broken = true;
-}
-
 static struct xe_guc_ct_snapshot *guc_ct_snapshot_alloc(struct xe_guc_ct *ct, bool atomic,
 							bool want_ctb)
 {
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
index cf41210ab30a..d6c81325a76c 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct.h
@@ -24,8 +24,6 @@ void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot, struct drm_pr
 void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot);
 void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool want_ctb);
 
-void xe_guc_ct_fixup_messages_with_ggtt(struct xe_guc_ct *ct, s64 ggtt_shift);
-
 static inline bool xe_guc_ct_initialized(struct xe_guc_ct *ct)
 {
 	return ct->state != XE_GUC_CT_STATE_NOT_INITIALIZED;
diff --git a/drivers/gpu/drm/xe/xe_map.h b/drivers/gpu/drm/xe/xe_map.h
index 8d67f6ba2d95..f62e0c8b67ab 100644
--- a/drivers/gpu/drm/xe/xe_map.h
+++ b/drivers/gpu/drm/xe/xe_map.h
@@ -78,24 +78,6 @@ static inline void xe_map_write32(struct xe_device *xe, struct iosys_map *map,
 	iosys_map_wr(map__, offset__, type__, val__);			\
 })
 
-#define xe_map_rd_array(xe__, map__, index__, type__) \
-	xe_map_rd(xe__, map__, (index__) * sizeof(type__), type__)
-
-#define xe_map_wr_array(xe__, map__, index__, type__, val__) \
-	xe_map_wr(xe__, map__, (index__) * sizeof(type__), type__, val__)
-
-#define xe_map_rd_array_u32(xe__, map__, index__) \
-	xe_map_rd_array(xe__, map__, index__, u32)
-
-#define xe_map_wr_array_u32(xe__, map__, index__, val__) \
-	xe_map_wr_array(xe__, map__, index__, u32, val__)
-
-#define xe_map_rd_ring_u32(xe__, map__, index__, size__) \
-	xe_map_rd_array_u32(xe__, map__, (index__) % (size__))
-
-#define xe_map_wr_ring_u32(xe__, map__, index__, size__, val__) \
-	xe_map_wr_array_u32(xe__, map__, (index__) % (size__), val__)
-
 #define xe_map_rd_field(xe__, map__, struct_offset__, struct_type__, field__) ({	\
 	struct xe_device *__xe = xe__;					\
 	xe_device_assert_mem_access(__xe);				\
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index d59e2b55cc95..c1830ec8f0fd 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -12,7 +12,6 @@
 #include "xe_gt_sriov_printk.h"
 #include "xe_gt_sriov_vf.h"
 #include "xe_guc.h"
-#include "xe_guc_ct.h"
 #include "xe_guc_submit.h"
 #include "xe_irq.h"
 #include "xe_lrc.h"
@@ -334,7 +333,6 @@ static int gt_vf_post_migration_fixups(struct xe_gt *gt)
 		err = xe_guc_contexts_hwsp_rebase(&gt->uc.guc, buf);
 		if (err)
 			goto out;
-		xe_guc_ct_fixup_messages_with_ggtt(&gt->uc.guc.ct, shift);
 	}
 
 out:
-- 
2.47.1

