Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AA83C531DD
	for <intel-xe@archiver.kernel.org>; Mon, 12 Aug 2024 02:46:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10BF410E06D;
	Mon, 12 Aug 2024 02:46:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H0tTZLFT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 807ED10E064
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Aug 2024 02:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723430789; x=1754966789;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Yu7ce52JjIk32GGfOPnBRzJrVdK71ma72rKJyAwI/wg=;
 b=H0tTZLFTUC/0Op6lwJbDA/FQCtp8siefQUQvMJCKHkRyiom9B8reVQ9s
 Lbv7rStSl5f7GNyY/vGzbNRN58tcWuO6YTRG0vTHDrChBalcpJi+M8+Np
 Azfb1oaQAxXLBx9msPJhMQ4TJJNFYZRF72Ks8FKu2x01Mpt6ahZxlug8Y
 BXfyNpXfqKDKmlHq64FTT/eZdzt4e0JoU3B3o7T3+TFzVLAjP2Yaaogct
 7Elj+k8pubUjyd5F21615JKLIx1us73WHkUnYPV2GdjcSqxCk9MeGQy6M
 CuExZZVQhd3ooKy45RtQVZsg8VCgsDV5ICQw4Q6oBbYzc0LIOXtiSMBHF Q==;
X-CSE-ConnectionGUID: AC2m37RMR2SGUzOoGntA0w==
X-CSE-MsgGUID: 4QiKFlZJSd2QcOv4tA9Z/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="32099522"
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; d="scan'208";a="32099522"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2024 19:46:28 -0700
X-CSE-ConnectionGUID: 4SQ+5OFJQiSVp0GDPkTZyg==
X-CSE-MsgGUID: PN/ZphULTvKKtc0cGw1NkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; d="scan'208";a="62256304"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2024 19:46:28 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com
Subject: [RFC PATCH 6/8] drm/xe: Add ULLS migration job support to ring ops
Date: Sun, 11 Aug 2024 19:47:15 -0700
Message-Id: <20240812024717.3584636-7-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240812024717.3584636-1-matthew.brost@intel.com>
References: <20240812024717.3584636-1-matthew.brost@intel.com>
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

Add preamble and postamble for ULLS migrations jobs. Premable clears
current semaphore for reuse. Postamble waits on next semaphore which is
set upon next job submission. The last ULLS migration job skips BB
submission and postamble (clear current semaphore, write seqno, exit
ULLS).

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_ring_ops.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index 0be4f489d3e1..67e4439177f1 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -389,10 +389,38 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
 	xe_lrc_write_ring(lrc, dw, i * sizeof(*dw));
 }
 
+static int emit_ulls_preamble(struct xe_lrc *lrc, u32 *dw, int i, u32 seqno)
+{
+	u32 addr = xe_lrc_ulls_semaphore_ggtt_addr(lrc, seqno);
+
+	return emit_store_imm_ggtt(addr, 0, dw, i);
+}
+
+static int emit_ulls_postamble(struct xe_lrc *lrc, u32 *dw, int i, u32 seqno)
+{
+	dw[i++] = MI_SEMAPHORE_WAIT |
+		MI_SEMAPHORE_GLOBAL_GTT |
+		MI_SEMAPHORE_POLL |
+		MI_SEMAPHORE_SAD_EQ_SDD;
+	dw[i++] = 1;
+	dw[i++] = xe_lrc_ulls_semaphore_ggtt_addr(lrc, seqno + 1);
+	dw[i++] = 0;
+
+	return i;
+}
+
 static void emit_migration_job_gen12(struct xe_sched_job *job,
 				     struct xe_lrc *lrc, u32 seqno)
 {
 	u32 dw[MAX_JOB_SIZE_DW], i = 0;
+	bool ulls = test_bit(JOB_FLAG_ULLS, &job->fence->flags);
+	bool ulls_last = test_bit(JOB_FLAG_ULLS_LAST, &job->fence->flags);
+
+	if (ulls) {
+		i = emit_ulls_preamble(lrc, dw, i, seqno);
+		if (ulls_last)
+			goto seqno_write;
+	}
 
 	i = emit_copy_timestamp(lrc, dw, i);
 
@@ -412,6 +440,7 @@ static void emit_migration_job_gen12(struct xe_sched_job *job,
 
 	i = emit_bb_start(job->ptrs[1].batch_addr, BIT(8), dw, i);
 
+seqno_write:
 	dw[i++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | job->migrate_flush_flags |
 		MI_FLUSH_DW_OP_STOREDW | MI_FLUSH_IMM_DW;
 	dw[i++] = xe_lrc_seqno_ggtt_addr(lrc) | MI_FLUSH_DW_USE_GTT;
@@ -420,6 +449,9 @@ static void emit_migration_job_gen12(struct xe_sched_job *job,
 
 	i = emit_user_interrupt(dw, i);
 
+	if (ulls && !ulls_last)
+		i = emit_ulls_postamble(lrc, dw, i, seqno);
+
 	xe_gt_assert(job->q->gt, i <= MAX_JOB_SIZE_DW);
 
 	xe_lrc_write_ring(lrc, dw, i * sizeof(*dw));
-- 
2.34.1

