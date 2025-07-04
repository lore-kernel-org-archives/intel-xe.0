Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A599BC83F0A
	for <intel-xe@archiver.kernel.org>; Fri,  4 Jul 2025 21:02:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C7CD10E0E3;
	Fri,  4 Jul 2025 21:02:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c6oemCVz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B926410E0EA
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Jul 2025 21:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751662971; x=1783198971;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=73piAD3GwpEHvblhNA7NPmpgFMBWXh7lDZM6vZh2c5w=;
 b=c6oemCVzBDUNMjHmTG+scVR5MXREHGm3Ff3Jep0B4wYBZ5EfC2P0BaOK
 0bCzI4y/tkTRt+rKPZbOd9EvoZx2KOFyxIjFnNVQcTVo6mQUg5bmIoe/k
 06kVbMKp2Rvcnf6rwX8lJJRBT2RdukE0LzZvzKiz+kHzDJD1brFoDHL9f
 lRFHrNqXAbvvMG9w590ZSrOjtqQBF+xZX04ruMZCKmAK49Ye3OpbQ9vui
 IYjJLFcVch9dXrtu7CK3IwOXmsqO8DjzZEZi3/W/tJ7J2EH8UL/UT6kEG
 X3POQCxO7N2PvT6ny+gZnj3gemm+54dFUTZp2B6d0cx4V7JCaKoojuqUH g==;
X-CSE-ConnectionGUID: +VNYr5AySXeofmo3MjoxNQ==
X-CSE-MsgGUID: ENnNyKa+SRijn7FrlWulKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="54111454"
X-IronPort-AV: E=Sophos;i="6.16,288,1744095600"; d="scan'208";a="54111454"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 14:02:51 -0700
X-CSE-ConnectionGUID: ZS8N93E1TzaULu7caF6oVA==
X-CSE-MsgGUID: ROfvDlDKTJaBbXae221jjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,288,1744095600"; d="scan'208";a="154840069"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by orviesa007.jf.intel.com with ESMTP; 04 Jul 2025 14:02:49 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v6 9/9] drm/xe/vf: Rebase exec queue parallel commands during
 migration recovery
Date: Fri,  4 Jul 2025 23:02:28 +0200
Message-Id: <20250704210228.825843-10-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250704210228.825843-1-tomasz.lis@intel.com>
References: <20250704210228.825843-1-tomasz.lis@intel.com>
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

Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 37584a064574..96b94f7fcc31 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -693,6 +693,27 @@ static void wq_item_append(struct xe_exec_queue *q)
 	parallel_write(xe, map, wq_desc.tail, q->guc->wqi_tail);
 }
 
+static void wq_items_rebase(struct xe_exec_queue *q)
+{
+	struct xe_guc *guc = exec_queue_to_guc(q);
+	struct xe_device *xe = guc_to_xe(guc);
+	struct iosys_map map = xe_lrc_parallel_map(q->lrc[0]);
+	int i = q->guc->wqi_head;
+
+	/* the ring starts after a header struct */
+	iosys_map_incr(&map, offsetof(struct guc_submit_parallel_scratch, wq[0]));
+
+	while (i != q->guc->wqi_tail) {
+		u32 len_dw, val;
+
+		val = xe_map_rd_ring_u32(xe, &map, i / sizeof(u32) + 0, WQ_SIZE / sizeof(u32));
+		len_dw = FIELD_GET(WQ_LEN_MASK, val);
+		val = xe_lrc_descriptor(q->lrc[0]);
+		xe_map_wr_ring_u32(xe, &map, i / sizeof(u32) + 1, WQ_SIZE / sizeof(u32), val);
+		i += len_dw * sizeof(u32);
+	}
+}
+
 #define RESUME_PENDING	~0x0ull
 static void submit_exec_queue(struct xe_exec_queue *q)
 {
@@ -2511,7 +2532,10 @@ void xe_guc_contexts_hwsp_rebase(struct xe_guc *guc, void *scratch)
 	unsigned long index;
 
 	mutex_lock(&guc->submission_state.lock);
-	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
+	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
 		xe_exec_queue_contexts_hwsp_rebase(q, scratch);
+		if (xe_exec_queue_is_parallel(q))
+			wq_items_rebase(q);
+	}
 	mutex_unlock(&guc->submission_state.lock);
 }
-- 
2.25.1

