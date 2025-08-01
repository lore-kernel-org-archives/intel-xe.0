Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04CE1C87FD2
	for <intel-xe@archiver.kernel.org>; Fri,  1 Aug 2025 01:50:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBBE010E2D7;
	Fri,  1 Aug 2025 01:50:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CUAFLOSV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71F1B10E2D7
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Aug 2025 01:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754013043; x=1785549043;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=t0r4e4Kd6/HW8sup+ILnw8iWrDFcT8YgJdAzXM6WXxg=;
 b=CUAFLOSVSn83mjEK/d87BMKamZsJg46QKfQxowoEhS5Qvi6Vsk0MLjaP
 U2los++qgBs1qZA6jFsv1Cfe600a8+3ktkr0X26yMXEIwjxYEkgr/YEkt
 OygvQZ576BNUwTxWZ958hUntDtzgxJ/J3N7gqKZKyt2ZGzT8Bhq5uYcHt
 6HSqg9i2aHrh4lgg0eCYvfFjvizJ5d9SLro+t48QqfJRAWb1HDUsHObdV
 MYfIBvGRKi0RWgRIsRtpAl7HAeCZSF+S5Uj0nJ287smmVL9Dh/4apSsID
 8ek8cg38KvjOGbFHEXP525wHBzHqHW2Sc+wEGNN4yLAWrHRqTTQJUbFeq Q==;
X-CSE-ConnectionGUID: HyWXMbWwScyidpOoJFo/kw==
X-CSE-MsgGUID: hiXhUcVyT6iybQHDuPC0cA==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="43953689"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="43953689"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 18:50:43 -0700
X-CSE-ConnectionGUID: fBQ2W85VQHKH21TVCid4nw==
X-CSE-MsgGUID: HcNp0lNzSHm8onb1xtYPhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="194401400"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by orviesa002.jf.intel.com with ESMTP; 31 Jul 2025 18:50:41 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v8 8/8] drm/xe/vf: Rebase exec queue parallel commands during
 migration recovery
Date: Fri,  1 Aug 2025 03:50:45 +0200
Message-Id: <20250801015045.957609-9-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250801015045.957609-1-tomasz.lis@intel.com>
References: <20250801015045.957609-1-tomasz.lis@intel.com>
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

Parallel exec queues have an additional command streamer buffer which holds
a GGTT reference to data within context status. The GGTT references have to
be fixed after VF migration.

v2: Properly handle nop entry, verify if parsing goes ok
v3: Improve error/warn logging, add propagation of errors,
 give names to magic offsets

Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
Cc: Michal Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_actions_abi.h |  8 ++++
 drivers/gpu/drm/xe/xe_guc_submit.c       | 54 ++++++++++++++++++++++++
 2 files changed, 62 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
index 81eb046aeebf..d8cf68a0516d 100644
--- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
@@ -193,6 +193,14 @@ enum xe_guc_register_context_multi_lrc_param_offsets {
 	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_MSG_MIN_LEN = 11,
 };
 
+enum xe_guc_context_wq_item_offsets {
+	XE_GUC_CONTEXT_WQ_HEADER_DATA_0_TYPE_LEN = 0,
+	XE_GUC_CONTEXT_WQ_EL_INFO_DATA_1_CTX_DESC_LOW,
+	XE_GUC_CONTEXT_WQ_EL_INFO_DATA_2_GUCCTX_RINGTAIL_FREEZEPOCS,
+	XE_GUC_CONTEXT_WQ_EL_INFO_DATA_3_WI_FENCE_ID,
+	XE_GUC_CONTEXT_WQ_EL_CHILD_LIST_DATA_4_RINGTAIL,
+};
+
 enum xe_guc_report_status {
 	XE_GUC_REPORT_STATUS_UNKNOWN = 0x0,
 	XE_GUC_REPORT_STATUS_ACKED = 0x1,
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index f59fecc58fa8..427694afe0cc 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -671,12 +671,18 @@ static void wq_item_append(struct xe_exec_queue *q)
 	if (wq_wait_for_space(q, wqi_size))
 		return;
 
+	xe_gt_assert(guc_to_gt(guc), i == XE_GUC_CONTEXT_WQ_HEADER_DATA_0_TYPE_LEN);
 	wqi[i++] = FIELD_PREP(WQ_TYPE_MASK, WQ_TYPE_MULTI_LRC) |
 		FIELD_PREP(WQ_LEN_MASK, len_dw);
+	xe_gt_assert(guc_to_gt(guc), i == XE_GUC_CONTEXT_WQ_EL_INFO_DATA_1_CTX_DESC_LOW);
 	wqi[i++] = xe_lrc_descriptor(q->lrc[0]);
+	xe_gt_assert(guc_to_gt(guc), i ==
+		     XE_GUC_CONTEXT_WQ_EL_INFO_DATA_2_GUCCTX_RINGTAIL_FREEZEPOCS);
 	wqi[i++] = FIELD_PREP(WQ_GUC_ID_MASK, q->guc->id) |
 		FIELD_PREP(WQ_RING_TAIL_MASK, q->lrc[0]->ring.tail / sizeof(u64));
+	xe_gt_assert(guc_to_gt(guc), i == XE_GUC_CONTEXT_WQ_EL_INFO_DATA_3_WI_FENCE_ID);
 	wqi[i++] = 0;
+	xe_gt_assert(guc_to_gt(guc), i == XE_GUC_CONTEXT_WQ_EL_CHILD_LIST_DATA_4_RINGTAIL);
 	for (j = 1; j < q->width; ++j) {
 		struct xe_lrc *lrc = q->lrc[j];
 
@@ -697,6 +703,50 @@ static void wq_item_append(struct xe_exec_queue *q)
 	parallel_write(xe, map, wq_desc.tail, q->guc->wqi_tail);
 }
 
+static int wq_items_rebase(struct xe_exec_queue *q)
+{
+	struct xe_guc *guc = exec_queue_to_guc(q);
+	struct xe_device *xe = guc_to_xe(guc);
+	struct iosys_map map = xe_lrc_parallel_map(q->lrc[0]);
+	int i = q->guc->wqi_head;
+
+	/* the ring starts after a header struct */
+	iosys_map_incr(&map, offsetof(struct guc_submit_parallel_scratch, wq[0]));
+
+	while ((i % WQ_SIZE) != (q->guc->wqi_tail % WQ_SIZE)) {
+		u32 len_dw, type, val;
+
+		if (drm_WARN_ON_ONCE(&xe->drm, i < 0 || i > 2 * WQ_SIZE))
+			break;
+
+		val = xe_map_rd_ring_u32(xe, &map, i / sizeof(u32) +
+					 XE_GUC_CONTEXT_WQ_HEADER_DATA_0_TYPE_LEN,
+					 WQ_SIZE / sizeof(u32));
+		len_dw = FIELD_GET(WQ_LEN_MASK, val);
+		type = FIELD_GET(WQ_TYPE_MASK, val);
+
+		if (drm_WARN_ON_ONCE(&xe->drm, len_dw >= WQ_SIZE / sizeof(u32)))
+			break;
+
+		if (type == WQ_TYPE_MULTI_LRC) {
+			val = xe_lrc_descriptor(q->lrc[0]);
+			xe_map_wr_ring_u32(xe, &map, i / sizeof(u32) +
+					   XE_GUC_CONTEXT_WQ_EL_INFO_DATA_1_CTX_DESC_LOW,
+					   WQ_SIZE / sizeof(u32), val);
+		} else if (drm_WARN_ON_ONCE(&xe->drm, type != WQ_TYPE_NOOP)) {
+			break;
+		}
+
+		i += (len_dw + 1) * sizeof(u32);
+	}
+
+	if ((i % WQ_SIZE) != (q->guc->wqi_tail % WQ_SIZE)) {
+		xe_gt_err(q->gt, "Exec queue fixups incomplete - wqi parse failed\n");
+		return -EBADMSG;
+	}
+	return 0;
+}
+
 #define RESUME_PENDING	~0x0ull
 static void submit_exec_queue(struct xe_exec_queue *q)
 {
@@ -2543,6 +2593,10 @@ int xe_guc_contexts_hwsp_rebase(struct xe_guc *guc, void *scratch)
 		err = xe_exec_queue_contexts_hwsp_rebase(q, scratch);
 		if (err)
 			break;
+		if (xe_exec_queue_is_parallel(q))
+			err = wq_items_rebase(q);
+		if (err)
+			break;
 	}
 	mutex_unlock(&guc->submission_state.lock);
 
-- 
2.25.1

