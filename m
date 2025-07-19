Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3A64C83F27
	for <intel-xe@archiver.kernel.org>; Sat, 19 Jul 2025 07:37:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E75D10E1EA;
	Sat, 19 Jul 2025 07:37:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IYh6uuRm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17E5E10E1EA
 for <intel-xe@lists.freedesktop.org>; Sat, 19 Jul 2025 07:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752910676; x=1784446676;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sveTZm4PEacFbPR//EdJ8+zEV9JFE550dtFHO7ebzjg=;
 b=IYh6uuRm7iUOAeDtMpDdNAjRyuw6df6yBBP243T+mRZ23rji61PiAyHi
 35it84htbXyRh75h4M1zjj23mfuuVVWdO/71qw3S5O/xws4E3fwrHMdrq
 eBq3bgSH5T8eSiN1GuhQ9s5ix8q2xJg8UWyIJS/S2t0awW8Ky2KC/5IJl
 eB2/e4k9ORq30bFVlPaVxOM71wbAvzCJ6QziMZUNx5Ut+9RYrLLCaqIke
 CgFrY3CNfR2owbHY6DvHrCT0Dc9xhKbzNLePhUvOoCE2RyVicLk74muCq
 heKHDbv+N/ACSG8vZQBcXaWb6dNLidqqEbzBOfWCBHu4s/w3ziGTat8r7 Q==;
X-CSE-ConnectionGUID: LSpGxChaTtmtuT0cNzYmXQ==
X-CSE-MsgGUID: UMSejQ+JQraiKim+3J2oeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="55159712"
X-IronPort-AV: E=Sophos;i="6.16,323,1744095600"; d="scan'208";a="55159712"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2025 00:37:55 -0700
X-CSE-ConnectionGUID: p+RvIZjXRWmaAfr91z4H7Q==
X-CSE-MsgGUID: 0V/mTSRsQp6oIR8gzPkDmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,323,1744095600"; d="scan'208";a="158844457"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by orviesa008.jf.intel.com with ESMTP; 19 Jul 2025 00:37:53 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v7 9/9] drm/xe/vf: Rebase exec queue parallel commands during
 migration recovery
Date: Sat, 19 Jul 2025 09:37:45 +0200
Message-Id: <20250719073745.74251-10-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250719073745.74251-1-tomasz.lis@intel.com>
References: <20250719073745.74251-1-tomasz.lis@intel.com>
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

Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
Cc: Michal Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 43 +++++++++++++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 84bc352f6f12..9eb0fd863218 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -693,6 +693,44 @@ static void wq_item_append(struct xe_exec_queue *q)
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
+	while ((i % WQ_SIZE) != (q->guc->wqi_tail % WQ_SIZE)) {
+		u32 len_dw, type, val;
+
+		if (i < 0 || i > 2 * WQ_SIZE)
+			break;
+
+		val = xe_map_rd_ring_u32(xe, &map, i / sizeof(u32) + 0, WQ_SIZE / sizeof(u32));
+		len_dw = FIELD_GET(WQ_LEN_MASK, val);
+		type = FIELD_GET(WQ_TYPE_MASK, val);
+
+		if (len_dw >= WQ_SIZE / sizeof(u32))
+			break;
+
+		if (type == WQ_TYPE_MULTI_LRC) {
+			val = xe_lrc_descriptor(q->lrc[0]);
+			xe_map_wr_ring_u32(xe, &map, i / sizeof(u32) + 1,
+					   WQ_SIZE / sizeof(u32), val);
+		} else if (type != WQ_TYPE_NOOP) {
+			break;
+		}
+
+		i += (len_dw + 1) * sizeof(u32);
+	}
+
+	if (i != q->guc->wqi_tail)
+		xe_gt_err(q->gt, "Exec queue fixups incomplete - wqi parse failed\n");
+}
+
 #define RESUME_PENDING	~0x0ull
 static void submit_exec_queue(struct xe_exec_queue *q)
 {
@@ -2506,7 +2544,10 @@ void xe_guc_contexts_hwsp_rebase(struct xe_guc *guc, void *scratch)
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

