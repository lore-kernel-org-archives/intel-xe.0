Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A90C87FCA
	for <intel-xe@archiver.kernel.org>; Sat,  2 Aug 2025 03:10:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0A6010E32F;
	Sat,  2 Aug 2025 03:10:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E9k9DyvR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B994A10E32F
 for <intel-xe@lists.freedesktop.org>; Sat,  2 Aug 2025 03:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754104242; x=1785640242;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Vugq1bvB6A9X1rV387XqTaZIxmotS7uZcAb9fzGFoT0=;
 b=E9k9DyvRoS1zeq1KGZHyIVqDbwKAHHpeNDbjMIKzwK4kC4CmFpRZafWI
 FIV4cIahYx1213U/OmCzYRWEh6JETrdfalYWvK5RTlAyWnFq15JQSYqIE
 hCkcW7gojtE/vl4PM3weq8rmx/k+GtxSkrs1Yq6zqyrwgqX+HcNlDaSd9
 YpKEhjNeVO0BaLPPi0lLDoIChzj/Hrhx25qy2ASuaMNA42LOHCUwaiOXY
 tr3d1bKNzdtBcLG6D6C2iXtRU00rAgbswhfLu2WlFRPg26YuuXRxnqP9n
 lwXI4kJUm+lHbU348Zp6gLR70wMnoywNEAqimybC8R0wWFY6ZpN9W5EAE Q==;
X-CSE-ConnectionGUID: pCZ7uoEgShGNb3kTGz7SRQ==
X-CSE-MsgGUID: zoZ8cij6QjyfYOKl7XEiHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="73910614"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; d="scan'208";a="73910614"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 20:10:42 -0700
X-CSE-ConnectionGUID: r+ji49jkRoCHMlAhIEprgw==
X-CSE-MsgGUID: AwSCLd1hQxG5G7ipxKItiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; d="scan'208";a="169093914"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by orviesa005.jf.intel.com with ESMTP; 01 Aug 2025 20:10:40 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v9 8/8] drm/xe/vf: Rebase exec queue parallel commands during
 migration recovery
Date: Sat,  2 Aug 2025 05:10:45 +0200
Message-Id: <20250802031045.1127138-9-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250802031045.1127138-1-tomasz.lis@intel.com>
References: <20250802031045.1127138-1-tomasz.lis@intel.com>
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
Reviewed-by: Michal Winiarski <michal.winiarski@intel.com>
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
index 2414e8308f97..1185b23b1384 100644
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

