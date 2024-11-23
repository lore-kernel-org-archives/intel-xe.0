Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48122E6ADDE
	for <intel-xe@archiver.kernel.org>; Sat, 23 Nov 2024 03:13:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11C5210E47B;
	Sat, 23 Nov 2024 03:13:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B3Fvff/Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBB7310E476
 for <intel-xe@lists.freedesktop.org>; Sat, 23 Nov 2024 03:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732331621; x=1763867621;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HH4NBk/9yqR0jaFybdISSvXOdo7HQFc+YM/b37S3MI8=;
 b=B3Fvff/ZqYJ8k4M70SGh0cCQV0EhS1d/c5TANf/XkNDy/ZdUUTSv0d03
 WasqQlJyHQUTPv1sdPtbmfe8wo2QlhBmwm+AcpZtYjL4TcPWNs299nMKL
 WiqfoLoksLJuc3m7h0wK2Bahi+g+2EIVZSy4h6uel/1MQxF0pGkHqrBuL
 mzsqFbSLJOtA4Nmpwk6C7z1rKS93U51r3x2I5oYNYD3/f/fJri0YsR/ga
 roPu8/9Om5dp8HDFLL0FbLTmJtlMK0GWoSIGGJOny20w8BO1o71iVk1B9
 kvMq1rLPwnW8kMje7o2RiRn3ilIi2GDVQ+WO/ErblogIudiFOGTOhF3pw w==;
X-CSE-ConnectionGUID: kOAr7oUZT02d/dsejx1fbg==
X-CSE-MsgGUID: MU8xxNibRSaBzgIMigKDHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="32363188"
X-IronPort-AV: E=Sophos;i="6.12,177,1728975600"; d="scan'208";a="32363188"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2024 19:13:41 -0800
X-CSE-ConnectionGUID: 5LNPwj9ES8ijNtT3hsbMHg==
X-CSE-MsgGUID: 0gEDgntBSemxLRmMj7nOGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,177,1728975600"; d="scan'208";a="94830356"
Received: from gkczarna.igk.intel.com ([10.102.139.130])
 by fmviesa003.fm.intel.com with ESMTP; 22 Nov 2024 19:13:39 -0800
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v3 3/3] drm/xe/vf: Fixup CTB send buffer messages after
 migration
Date: Sat, 23 Nov 2024 04:13:32 +0100
Message-Id: <20241123031333.3435414-4-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241123031333.3435414-1-tomasz.lis@intel.com>
References: <20241123031333.3435414-1-tomasz.lis@intel.com>
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

During post-migration recovery of a VF, it in necessary to update
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

v2: removed storing shif as that's now done in VMA nodes patch;
  macros to inlines; warns to asserts; log messages fixes (Michal)

Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c   | 148 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_ct.h   |   2 +
 drivers/gpu/drm/xe/xe_sriov_vf.c |  16 ++++
 3 files changed, 166 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 7eb175a0b874..212a6795ec8b 100644
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
@@ -1620,6 +1622,152 @@ static void g2h_worker_func(struct work_struct *w)
 	receive_g2h(ct);
 }
 
+static inline u32 ctb_read32(struct xe_device *xe, struct iosys_map *cmds,
+			     u32 head, u32 pos)
+{
+	u32 msg[1];
+
+	xe_map_memcpy_from(xe, msg, cmds, (head + pos) * sizeof(u32),
+			   1 * sizeof(u32));
+	return msg[0];
+}
+
+static inline void ctb_fixup64(struct xe_device *xe, struct iosys_map *cmds,
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
+		ctb_fixup64(xe, cmds, head, 5, shift);
+		/* field wq_base */
+		ctb_fixup64(xe, cmds, head, 7, shift);
+		if (action == XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC) {
+			/* field number_children */
+			n = ctb_read32(xe, cmds, head, 10);
+			/* field hwlrca and child lrcas */
+			for (i = 0; i < n; i++)
+				ctb_fixup64(xe, cmds, head, 11 + 2 * i, shift);
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
+ * xe_guc_ct_update_addresses - Fixup any pending H2G CTB messages by updating
+ * GGTT offsets in their payloads.
+ * @ct: pointer to CT struct of the target GuC
+ * @ggtt_shift: shift to be added to all GGTT adresses within the CTB
+ */
+int xe_guc_ct_update_addresses(struct xe_guc_ct *ct, s64 ggtt_shift)
+{
+	struct xe_guc *guc = ct_to_guc(ct);
+	struct xe_gt *gt = guc_to_gt(guc);
+	struct guc_ctb *h2g = &ct->ctbs.h2g;
+	u32 head = h2g->info.head;
+	u32 tail = READ_ONCE(h2g->info.tail);
+	u32 size = h2g->info.size;
+	s32 avail;
+
+	if (unlikely(h2g->info.broken))
+		return -EPIPE;
+
+	xe_gt_assert(gt, head > size);
+
+	if (unlikely(tail >= size)) {
+		xe_gt_err(gt, "H2G channel has invalid tail offset (%u >= %u)\n",
+			 tail, size);
+		goto corrupted;
+	}
+
+	avail = tail - head;
+
+	/* beware of buffer wrap case */
+	if (unlikely(avail < 0))
+		avail += size;
+	xe_gt_dbg(gt, "available %d (%u:%u:%u)\n", avail, head, tail, size);
+	XE_WARN_ON(avail < 0);
+
+	while (avail > 0)
+		avail = ct_update_addresses_in_buffer(ct, h2g, ggtt_shift, &head, avail);
+
+	return 0;
+
+corrupted:
+	xe_gt_err(gt, "Corrupted descriptor head=%u tail=%u\n",
+		 head, tail);
+	h2g->info.broken = true;
+	return -EPIPE;
+}
+
 static struct xe_guc_ct_snapshot *guc_ct_snapshot_alloc(struct xe_guc_ct *ct, bool atomic,
 							bool want_ctb)
 {
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
index 82c4ae458dda..25e5ee71d853 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct.h
@@ -22,6 +22,8 @@ void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot, struct drm_pr
 void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot);
 void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool want_ctb);
 
+int xe_guc_ct_update_addresses(struct xe_guc_ct *ct, s64 ggtt_shift);
+
 static inline bool xe_guc_ct_enabled(struct xe_guc_ct *ct)
 {
 	return ct->state == XE_GUC_CT_STATE_ENABLED;
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index 4ee8fc70a744..1cb8878e6fad 100644
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
@@ -158,6 +159,18 @@ static int vf_post_migration_requery_guc(struct xe_device *xe)
 	return ret;
 }
 
+static void vf_post_migration_fixup_ctb(struct xe_device *xe)
+{
+	struct xe_gt *gt;
+	unsigned int id;
+
+	for_each_gt(gt, xe, id) {
+		struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
+
+		xe_guc_ct_update_addresses(&gt->uc.guc.ct, config->ggtt_shift);
+	}
+}
+
 /*
  * vf_post_migration_imminent - Check if post-restore recovery is coming.
  * @xe: the &xe_device struct instance
@@ -224,6 +237,9 @@ static void vf_post_migration_recovery(struct xe_device *xe)
 
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

