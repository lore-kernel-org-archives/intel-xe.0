Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F049C52CDC
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jul 2024 23:17:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20AC210E442;
	Mon, 29 Jul 2024 23:17:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fVEpW+Fx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D57910E3E3
 for <Intel-Xe@lists.freedesktop.org>; Mon, 29 Jul 2024 23:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722295075; x=1753831075;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7cM9qJgUD+yK+/1PtXAWMHfI2KUsce0D21mhso7P7So=;
 b=fVEpW+FxfJyFl+6MyRhblcztGz8AtSkSazGjbj/szzwaaSMlEdpck7Z7
 q0gPqeVRTF+YUODCfCfHENC3Kge+hcJzoCPPknPFjTyM/2DfRySQrLJds
 DPqtgvgnyPGo3MljawUEhGMuSH2PZVKirUkav6xI4SOMjepIfeDGlGAhc
 5rGNlBv1r/5dpJMYOnkCUeKBweJwlqIaYdniAyxOx1UF2qr1XyF2uK3+k
 tK5pXCxD5r8JkR1Z+DfABvavTNnQFwt6he5fuY3T//9xIGHLS9jDQO5I0
 gUvohoLyLNh39VGyvoYWM8zBegHZIM9Ih+s+MtaY61q98UpgZVdDW5Ocx g==;
X-CSE-ConnectionGUID: blm+FrhQStCR/fgmCXnJVw==
X-CSE-MsgGUID: iNfHk2zVScumEC3dxa0Bpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="19966925"
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; d="scan'208";a="19966925"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 16:17:54 -0700
X-CSE-ConnectionGUID: FNoNhJ77TI6FZr+gImzFGQ==
X-CSE-MsgGUID: kavaWzg6SOWJ7lmi68owhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; d="scan'208";a="54103548"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa009.jf.intel.com with ESMTP; 29 Jul 2024 16:17:54 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v5 6/8] drm/xe/guc: Dead CT helper
Date: Mon, 29 Jul 2024 16:17:50 -0700
Message-ID: <20240729231753.3101070-7-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240729231753.3101070-1-John.C.Harrison@Intel.com>
References: <20240729231753.3101070-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

Add a worker function helper for asynchronously dumping state when an
internal/fatal error is detected in CT processing. Being asynchronous
is required to avoid deadlocks and scheduling-while-atomic or
process-stalled-for-too-long issues. Also check for a bunch more error
conditions and improve the handling of some existing checks.

v2: Use compile time CONFIG check for new (but not directly CT_DEAD
related) checks and use unsigned int for a bitmask, rename
CT_DEAD_RESET to CT_DEAD_REARM and add some explaining comments,
rename 'hxg' macro parameter to 'ctb' - review feedback from Michal W.
Drop CT_DEAD_ALIVE as no need for a bitfield define to just set the
entire mask to zero.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 .../drm/xe/abi/guc_communication_ctb_abi.h    |   1 +
 drivers/gpu/drm/xe/xe_guc_ct.c                | 266 ++++++++++++++++--
 drivers/gpu/drm/xe/xe_guc_ct_types.h          |  22 ++
 3 files changed, 267 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h b/drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h
index 8f86a16dc577..f58198cf2cf6 100644
--- a/drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h
@@ -52,6 +52,7 @@ struct guc_ct_buffer_desc {
 #define GUC_CTB_STATUS_OVERFLOW				(1 << 0)
 #define GUC_CTB_STATUS_UNDERFLOW			(1 << 1)
 #define GUC_CTB_STATUS_MISMATCH				(1 << 2)
+#define GUC_CTB_STATUS_DISABLED				(1 << 3)
 	u32 reserved[13];
 } __packed;
 static_assert(sizeof(struct guc_ct_buffer_desc) == 64);
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 422c3f5c87d8..21c88a0cdfd3 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -25,12 +25,57 @@
 #include "xe_gt_sriov_pf_monitor.h"
 #include "xe_gt_tlb_invalidation.h"
 #include "xe_guc.h"
+#include "xe_guc_log.h"
 #include "xe_guc_relay.h"
 #include "xe_guc_submit.h"
 #include "xe_map.h"
 #include "xe_pm.h"
 #include "xe_trace_guc.h"
 
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
+enum {
+	CT_DEAD_REARM,				/* 0x0001 - not an error condition */
+	CT_DEAD_SETUP,				/* 0x0002 */
+	CT_DEAD_H2G_WRITE,			/* 0x0004 */
+	CT_DEAD_H2G_HAS_ROOM,			/* 0x0008 */
+	CT_DEAD_G2H_READ,			/* 0x0010 */
+	CT_DEAD_G2H_RECV,			/* 0x0020 */
+	CT_DEAD_G2H_RELEASE,			/* 0x0040 */
+	CT_DEAD_DEADLOCK,			/* 0x0080 */
+	CT_DEAD_PROCESS_FAILED,			/* 0x0100 */
+	CT_DEAD_FAST_G2H,			/* 0x0200 */
+	CT_DEAD_PARSE_G2H_RESPONSE,		/* 0x0400 */
+	CT_DEAD_PARSE_G2H_UNKNOWN,		/* 0x0800 */
+	CT_DEAD_PARSE_G2H_ORIGIN,		/* 0x1000 */
+	CT_DEAD_PARSE_G2H_TYPE,			/* 0x2000 */
+};
+
+static void ct_dead_worker_func(struct work_struct *w);
+
+#define CT_DEAD(ct, ctb, reason_code)								\
+	do {											\
+		struct guc_ctb *_ctb = (ctb);							\
+		if (_ctb)									\
+			_ctb->info.broken = true;						\
+		if (!(ct)->dead.reported) {							\
+			struct xe_guc *guc = ct_to_guc(ct);					\
+			spin_lock_irq(&ct->dead.lock);						\
+			(ct)->dead.reason |= 1 << CT_DEAD_##reason_code;			\
+			(ct)->dead.snapshot_log = xe_guc_log_snapshot_capture(&guc->log, true);	\
+			(ct)->dead.snapshot_ct = xe_guc_ct_snapshot_capture((ct), true);	\
+			spin_unlock_irq(&ct->dead.lock);					\
+			queue_work(system_unbound_wq, &(ct)->dead.worker);			\
+		}										\
+	} while (0)
+#else
+#define CT_DEAD(ct, ctb, reason)			\
+	do {						\
+		struct guc_ctb *_ctb = (ctb);		\
+		if (_ctb)				\
+			_ctb->info.broken = true;	\
+	} while (0)
+#endif
+
 /* Used when a CT send wants to block and / or receive data */
 struct g2h_fence {
 	u32 *response_buffer;
@@ -175,6 +220,10 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
 	xa_init(&ct->fence_lookup);
 	INIT_WORK(&ct->g2h_worker, g2h_worker_func);
 	INIT_DELAYED_WORK(&ct->safe_mode_worker,  safe_mode_worker_func);
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
+	spin_lock_init(&ct->dead.lock);
+	INIT_WORK(&ct->dead.worker, ct_dead_worker_func);
+#endif
 	init_waitqueue_head(&ct->wq);
 	init_waitqueue_head(&ct->g2h_fence_wq);
 
@@ -411,10 +460,22 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
 	if (ct_needs_safe_mode(ct))
 		ct_enter_safe_mode(ct);
 
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
+	/*
+	 * The CT has now been reset so the dumper can be re-armed
+	 * after any existing dead state has been dumped.
+	 */
+	spin_lock_irq(&ct->dead.lock);
+	if (ct->dead.reason)
+		ct->dead.reason |= CT_DEAD_REARM;
+	spin_unlock_irq(&ct->dead.lock);
+#endif
+
 	return 0;
 
 err_out:
 	xe_gt_err(gt, "Failed to enable GuC CT (%pe)\n", ERR_PTR(err));
+	CT_DEAD(ct, NULL, SETUP);
 
 	return err;
 }
@@ -458,6 +519,19 @@ static bool h2g_has_room(struct xe_guc_ct *ct, u32 cmd_len)
 
 	if (cmd_len > h2g->info.space) {
 		h2g->info.head = desc_read(ct_to_xe(ct), h2g, head);
+
+		if (h2g->info.head > h2g->info.size) {
+			struct xe_device *xe = ct_to_xe(ct);
+			u32 desc_status = desc_read(xe, h2g, status);
+
+			desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
+
+			xe_gt_err(ct_to_gt(ct), "CT: invalid head offset %u >= %u)\n",
+				  h2g->info.head, h2g->info.size);
+			CT_DEAD(ct, h2g, H2G_HAS_ROOM);
+			return false;
+		}
+
 		h2g->info.space = CIRC_SPACE(h2g->info.tail, h2g->info.head,
 					     h2g->info.size) -
 				  h2g->info.resv_space;
@@ -513,10 +587,24 @@ static void __g2h_reserve_space(struct xe_guc_ct *ct, u32 g2h_len, u32 num_g2h)
 
 static void __g2h_release_space(struct xe_guc_ct *ct, u32 g2h_len)
 {
+	bool bad = false;
+
 	lockdep_assert_held(&ct->fast_lock);
-	xe_gt_assert(ct_to_gt(ct), ct->ctbs.g2h.info.space + g2h_len <=
-		     ct->ctbs.g2h.info.size - ct->ctbs.g2h.info.resv_space);
-	xe_gt_assert(ct_to_gt(ct), ct->g2h_outstanding);
+
+	bad = ct->ctbs.g2h.info.space + g2h_len >
+		     ct->ctbs.g2h.info.size - ct->ctbs.g2h.info.resv_space;
+	bad |= !ct->g2h_outstanding;
+
+	if (bad) {
+		xe_gt_err(ct_to_gt(ct), "Invalid G2H release: %d + %d vs %d - %d -> %d vs %d, outstanding = %d!\n",
+			  ct->ctbs.g2h.info.space, g2h_len,
+			  ct->ctbs.g2h.info.size, ct->ctbs.g2h.info.resv_space,
+			  ct->ctbs.g2h.info.space + g2h_len,
+			  ct->ctbs.g2h.info.size - ct->ctbs.g2h.info.resv_space,
+			  ct->g2h_outstanding);
+		CT_DEAD(ct, &ct->ctbs.g2h, G2H_RELEASE);
+		return;
+	}
 
 	ct->ctbs.g2h.info.space += g2h_len;
 	if (!--ct->g2h_outstanding)
@@ -543,12 +631,43 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
 	u32 full_len;
 	struct iosys_map map = IOSYS_MAP_INIT_OFFSET(&h2g->cmds,
 							 tail * sizeof(u32));
+	u32 desc_status;
 
 	full_len = len + GUC_CTB_HDR_LEN;
 
 	lockdep_assert_held(&ct->lock);
 	xe_gt_assert(gt, full_len <= GUC_CTB_MSG_MAX_LEN);
-	xe_gt_assert(gt, tail <= h2g->info.size);
+
+	desc_status = desc_read(xe, h2g, status);
+	if (desc_status) {
+		xe_gt_err(gt, "CT write: non-zero status: %u\n", desc_status);
+		goto corrupted;
+	}
+
+	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
+		u32 desc_tail = desc_read(xe, h2g, tail);
+		u32 desc_head = desc_read(xe, h2g, head);
+
+		if (tail != desc_tail) {
+			desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_MISMATCH);
+			xe_gt_err(gt, "CT write: tail was modified %u != %u\n", desc_tail, tail);
+			goto corrupted;
+		}
+
+		if (tail > h2g->info.size) {
+			desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
+			xe_gt_err(gt, "CT write: tail out of range: %u vs %u\n",
+				  tail, h2g->info.size);
+			goto corrupted;
+		}
+
+		if (desc_head >= h2g->info.size) {
+			desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
+			xe_gt_err(gt, "CT write: invalid head offset %u >= %u)\n",
+				  desc_head, h2g->info.size);
+			goto corrupted;
+		}
+	}
 
 	/* Command will wrap, zero fill (NOPs), return and check credits again */
 	if (tail + full_len > h2g->info.size) {
@@ -601,6 +720,10 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
 			     desc_read(xe, h2g, head), h2g->info.tail);
 
 	return 0;
+
+corrupted:
+	CT_DEAD(ct, &ct->ctbs.h2g, H2G_WRITE);
+	return -EPIPE;
 }
 
 /*
@@ -712,7 +835,6 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
 {
 	struct xe_device *xe = ct_to_xe(ct);
 	struct xe_gt *gt = ct_to_gt(ct);
-	struct drm_printer p = xe_gt_info_printer(gt);
 	unsigned int sleep_period_ms = 1;
 	int ret;
 
@@ -765,8 +887,13 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
 			goto broken;
 #undef g2h_avail
 
-		if (dequeue_one_g2h(ct) < 0)
+		ret = dequeue_one_g2h(ct);
+		if (ret < 0) {
+			if (ret != -ECANCELED)
+				xe_gt_err(ct_to_gt(ct), "CTB receive failed (%pe)",
+					  ERR_PTR(ret));
 			goto broken;
+		}
 
 		goto try_again;
 	}
@@ -775,8 +902,7 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
 
 broken:
 	xe_gt_err(gt, "No forward process on H2G, reset required\n");
-	xe_guc_ct_print(ct, &p, true);
-	ct->ctbs.h2g.info.broken = true;
+	CT_DEAD(ct, &ct->ctbs.h2g, DEADLOCK);
 
 	return -EDEADLK;
 }
@@ -1003,6 +1129,7 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
 		else
 			xe_gt_err(gt, "unexpected response %u for FAST_REQ H2G fence 0x%x!\n",
 				  type, fence);
+		CT_DEAD(ct, NULL, PARSE_G2H_RESPONSE);
 
 		return -EPROTO;
 	}
@@ -1011,8 +1138,9 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
 	if (unlikely(!g2h_fence)) {
 		/* Don't tear down channel, as send could've timed out */
 		xe_gt_warn(gt, "G2H fence (%u) not found!\n", fence);
+		CT_DEAD(ct, NULL, PARSE_G2H_UNKNOWN);
 		g2h_release_space(ct, GUC_CTB_HXG_MSG_MAX_LEN);
-		return 0;
+		return -EPROTO;
 	}
 
 	xe_gt_assert(gt, fence == g2h_fence->seqno);
@@ -1054,7 +1182,7 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 	if (unlikely(origin != GUC_HXG_ORIGIN_GUC)) {
 		xe_gt_err(gt, "G2H channel broken on read, origin=%u, reset required\n",
 			  origin);
-		ct->ctbs.g2h.info.broken = true;
+		CT_DEAD(ct, &ct->ctbs.g2h, PARSE_G2H_ORIGIN);
 
 		return -EPROTO;
 	}
@@ -1072,7 +1200,7 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 	default:
 		xe_gt_err(gt, "G2H channel broken on read, type=%u, reset required\n",
 			  type);
-		ct->ctbs.g2h.info.broken = true;
+		CT_DEAD(ct, &ct->ctbs.g2h, PARSE_G2H_TYPE);
 
 		ret = -EOPNOTSUPP;
 	}
@@ -1149,9 +1277,11 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 		xe_gt_err(gt, "unexpected G2H action 0x%04x\n", action);
 	}
 
-	if (ret)
+	if (ret) {
 		xe_gt_err(gt, "G2H action 0x%04x failed (%pe)\n",
 			  action, ERR_PTR(ret));
+		CT_DEAD(ct, NULL, PROCESS_FAILED);
+	}
 
 	return 0;
 }
@@ -1161,7 +1291,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
 	struct xe_device *xe = ct_to_xe(ct);
 	struct xe_gt *gt = ct_to_gt(ct);
 	struct guc_ctb *g2h = &ct->ctbs.g2h;
-	u32 tail, head, len;
+	u32 tail, head, len, desc_status;
 	s32 avail;
 	u32 action;
 	u32 *hxg;
@@ -1180,6 +1310,50 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
 
 	xe_gt_assert(gt, xe_guc_ct_enabled(ct));
 
+	desc_status = desc_read(xe, g2h, status);
+	if (desc_status) {
+		if (desc_status & GUC_CTB_STATUS_DISABLED) {
+			/*
+			 * Potentially valid if a CLIENT_RESET request resulted in
+			 * contexts/engines being reset. But should never happen as
+			 * no contexts should be active when CLIENT_RESET is sent.
+			 */
+			xe_gt_err(gt, "CT read: unexpected G2H after GuC has stopped!\n");
+			desc_status &= ~GUC_CTB_STATUS_DISABLED;
+		}
+
+		if (desc_status) {
+			xe_gt_err(gt, "CT read: non-zero status: %u\n", desc_status);
+			goto corrupted;
+		}
+	}
+
+	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
+		u32 desc_tail = desc_read(xe, g2h, tail);
+		u32 desc_head = desc_read(xe, g2h, head);
+
+		if (g2h->info.head != desc_head) {
+			desc_write(xe, g2h, status, desc_status | GUC_CTB_STATUS_MISMATCH);
+			xe_gt_err(gt, "CT read: head was modified %u != %u\n",
+				  desc_head, g2h->info.head);
+			goto corrupted;
+		}
+
+		if (g2h->info.head > g2h->info.size) {
+			desc_write(xe, g2h, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
+			xe_gt_err(gt, "CT read: head out of range: %u vs %u\n",
+				  g2h->info.head, g2h->info.size);
+			goto corrupted;
+		}
+
+		if (desc_tail >= g2h->info.size) {
+			desc_write(xe, g2h, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
+			xe_gt_err(gt, "CT read: invalid tail offset %u >= %u)\n",
+				  desc_tail, g2h->info.size);
+			goto corrupted;
+		}
+	}
+
 	/* Calculate DW available to read */
 	tail = desc_read(xe, g2h, tail);
 	avail = tail - g2h->info.head;
@@ -1196,9 +1370,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
 	if (len > avail) {
 		xe_gt_err(gt, "G2H channel broken on read, avail=%d, len=%d, reset required\n",
 			  avail, len);
-		g2h->info.broken = true;
-
-		return -EPROTO;
+		goto corrupted;
 	}
 
 	head = (g2h->info.head + 1) % g2h->info.size;
@@ -1244,6 +1416,10 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
 			     action, len, g2h->info.head, tail);
 
 	return len;
+
+corrupted:
+	CT_DEAD(ct, &ct->ctbs.g2h, G2H_READ);
+	return -EPROTO;
 }
 
 static void g2h_fast_path(struct xe_guc_ct *ct, u32 *msg, u32 len)
@@ -1270,9 +1446,11 @@ static void g2h_fast_path(struct xe_guc_ct *ct, u32 *msg, u32 len)
 		xe_gt_warn(gt, "NOT_POSSIBLE");
 	}
 
-	if (ret)
+	if (ret) {
 		xe_gt_err(gt, "G2H action 0x%04x failed (%pe)\n",
 			  action, ERR_PTR(ret));
+		CT_DEAD(ct, NULL, FAST_G2H);
+	}
 }
 
 /**
@@ -1332,7 +1510,6 @@ static int dequeue_one_g2h(struct xe_guc_ct *ct)
 
 static void receive_g2h(struct xe_guc_ct *ct)
 {
-	struct xe_gt *gt = ct_to_gt(ct);
 	bool ongoing;
 	int ret;
 
@@ -1369,9 +1546,8 @@ static void receive_g2h(struct xe_guc_ct *ct)
 		mutex_unlock(&ct->lock);
 
 		if (unlikely(ret == -EPROTO || ret == -EOPNOTSUPP)) {
-			struct drm_printer p = xe_gt_info_printer(gt);
-
-			xe_guc_ct_print(ct, &p, false);
+			xe_gt_err(ct_to_gt(ct), "CT dequeue failed: %d", ret);
+			CT_DEAD(ct, NULL, G2H_RECV);
 			kick_reset(ct);
 		}
 	} while (ret == 1);
@@ -1401,7 +1577,7 @@ static void guc_ctb_snapshot_capture(struct xe_device *xe, struct guc_ctb *ctb,
 				       atomic ? GFP_ATOMIC : GFP_KERNEL);
 
 	if (!snapshot->cmds) {
-		drm_err(&xe->drm, "Skipping CTB commands snapshot. Only CTB info will be available.\n");
+		drm_err(&xe->drm, "Skipping CTB commands snapshot. Only CT info will be available.\n");
 		return;
 	}
 
@@ -1559,3 +1735,49 @@ void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool atomic)
 	xe_guc_ct_snapshot_print(snapshot, p);
 	xe_guc_ct_snapshot_free(snapshot);
 }
+
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
+static void ct_dead_print(struct xe_dead_ct *dead)
+{
+	struct xe_guc_ct *ct = container_of(dead, struct xe_guc_ct, dead);
+	struct xe_gt *gt = ct_to_gt(ct);
+	static int g_count;
+	struct drm_printer ip = xe_gt_info_printer(gt);
+	struct drm_printer lp = drm_line_printer(&ip, "Capture", ++g_count);
+
+	if (!dead->reason) {
+		xe_gt_err(gt, "CTB is dead for no reason!?\n");
+		return;
+	}
+
+	drm_printf(&lp, "CTB is dead - reason=0x%X\n", dead->reason);
+
+	xe_guc_log_snapshot_print(ct_to_xe(ct), dead->snapshot_log, &lp, false);
+	xe_guc_ct_snapshot_print(dead->snapshot_ct, &lp);
+
+	drm_printf(&lp, "Done.\n");
+}
+
+static void ct_dead_worker_func(struct work_struct *w)
+{
+	struct xe_guc_ct *ct = container_of(w, struct xe_guc_ct, dead.worker);
+
+	if (!ct->dead.reported) {
+		ct->dead.reported = true;
+		ct_dead_print(&ct->dead);
+	}
+
+	spin_lock_irq(&ct->dead.lock);
+
+	xe_guc_log_snapshot_free(ct->dead.snapshot_log);
+	xe_guc_ct_snapshot_free(ct->dead.snapshot_ct);
+
+	if (ct->dead.reason & CT_DEAD_REARM) {
+		/* A reset has occurred so re-arm the error reporting */
+		ct->dead.reason = 0;
+		ct->dead.reported = false;
+	}
+
+	spin_unlock_irq(&ct->dead.lock);
+}
+#endif
diff --git a/drivers/gpu/drm/xe/xe_guc_ct_types.h b/drivers/gpu/drm/xe/xe_guc_ct_types.h
index 761cb9031298..9eb2f1a6dcfe 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct_types.h
@@ -86,6 +86,24 @@ enum xe_guc_ct_state {
 	XE_GUC_CT_STATE_ENABLED,
 };
 
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
+/** struct xe_dead_ct - Information for debugging a dead CT */
+struct xe_dead_ct {
+	/** @lock: protects memory allocation/free operations, and @reason updates */
+	spinlock_t lock;
+	/** @reason: bit mask of CT_DEAD_* reason codes */
+	unsigned int reason;
+	/** @reported: for preventing multiple dumps per error sequence */
+	bool reported;
+	/** @worker: worker thread to get out of interrupt context before dumping */
+	struct work_struct worker;
+	/** snapshot_ct: copy of CT state and CTB content at point of error */
+	struct xe_guc_ct_snapshot *snapshot_ct;
+	/** snapshot_log: copy of GuC log at point of error */
+	struct xe_guc_log_snapshot *snapshot_log;
+};
+#endif
+
 /**
  * struct xe_guc_ct - GuC command transport (CT) layer
  *
@@ -128,6 +146,10 @@ struct xe_guc_ct {
 	u32 msg[GUC_CTB_MSG_MAX_LEN];
 	/** @fast_msg: Message buffer */
 	u32 fast_msg[GUC_CTB_MSG_MAX_LEN];
+
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
+	struct xe_dead_ct dead;
+#endif
 };
 
 #endif
-- 
2.43.2

