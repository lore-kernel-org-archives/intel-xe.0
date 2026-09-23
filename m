Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A157FC9830B
	for <intel-xe@archiver.kernel.org>; Wed, 23 Sep 2026 18:21:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DE7E10E15E;
	Wed, 23 Sep 2026 18:21:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EQ7JhzpP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E869A10E15E
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Sep 2026 18:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790187665; x=1821723665;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OCuQpbjho+jiFq5nqLO8FnGwiF1zW5JL9bHxcQwHz6Y=;
 b=EQ7JhzpPBG0YJxtI/3gtEoJFz0xFTH4cHlXvgLg324x2QGU1m5Rlk44n
 +x1VUVgjqZWwKD1w2X8FV8nIAKdOFgfnYrCCiZ32wnsxgHsyDVWHHIc2N
 q/63PI53A2mtRQRjeEqg9DO65DMrXQL/SQK7fLyiejZRoxBoD6yaqAyjL
 i1EMXJAkz+xQHQQfOjH40nwmPj+euJJKXHRZ7qnMNa//zUPAL6thotMgu
 AX6La/n88EATxoWLQbkwiAbWREuVqIFbxtSnmhRMM9DZ1MCKMqC9xZaYX
 XLg2pKLixubzSmNm14TSnd5cowCDi1PPJSjmjIQ42/n/L2Qs70uWRgYk0 Q==;
X-CSE-ConnectionGUID: 3AogBAiMRZudkL0sn9BN/w==
X-CSE-MsgGUID: smWjAWTlRRCAZHiXS/aQMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="90783959"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; d="scan'208";a="90783959"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 11:21:05 -0700
X-CSE-ConnectionGUID: M8ewi28TRr6beAoD9wWvnw==
X-CSE-MsgGUID: oIbIXWtJSxSOk3iu3oHSVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; d="scan'208";a="272911924"
Received: from osgcshtiger.sh.intel.com ([10.239.81.49])
 by fmviesa010.fm.intel.com with ESMTP; 23 Sep 2026 11:21:03 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH] drm/xe: Skip empty preparser window in video ring ops
Date: Wed, 23 Sep 2026 18:20:01 +0000
Message-Id: <20260923182001.669076-1-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

__emit_job_gen12_video() brackets the aux table invalidation and the
optional TLB flush with a preparser disable/enable pair. On platforms
without AuxCCS emit_aux_table_inv() emits nothing, so a job that does
not need a TLB flush wraps an empty region and burns two dwords of
ring space on every submission.

Add has_aux_table_inv() to expose the condition emit_aux_table_inv()
already tests internally, and enter the preparser window only when
something will be emitted inside it. The command stream is unchanged
whenever the window is non-empty.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Assisted-by: LLM
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
has_aux_table_inv(job->q->hwe) is equivalent to has_aux_ccs(xe) here:
emit_job_gen12_video() is only installed on the VIDEO_DECODE/VIDEO_ENHANCE
ring ops, and emit_aux_table_inv is only set on the auxccs_* variants,
which xe_ring_ops_get() picks based on has_aux_ccs() alone.

I went with the former because it tests exactly what emit_aux_table_inv()
tests, so the window cannot go unbalanced if a hook is ever added for some
other reason. Happy to switch to has_aux_ccs(xe) if consistency with
__emit_job_gen12_render_compute() is preferred.
---

 drivers/gpu/drm/xe/xe_ring_ops.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index 3dd8cf4e2131..f1260fb6e894 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -80,6 +80,11 @@ static u32 *emit_aux_table_inv_video_enhance(struct xe_gt *gt, u32 *cmd)
 	return __emit_aux_table_inv(cmd, VE0_AUX_INV, gt->mmio.adj_offset);
 }
 
+static bool has_aux_table_inv(struct xe_hw_engine *hwe)
+{
+	return hwe->gt->ring_ops[hwe->class]->emit_aux_table_inv;
+}
+
 static int emit_aux_table_inv(struct xe_hw_engine *hwe, u32 *dw, int i)
 {
 	struct xe_gt *gt = hwe->gt;
@@ -404,16 +409,18 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
 
 	i = emit_copy_timestamp(xe, lrc, dw, i);
 
-	dw[i++] = preparser_disable(true);
+	if (has_aux_table_inv(job->q->hwe) || job->ring_ops_flush_tlb) {
+		dw[i++] = preparser_disable(true);
 
-	/* hsdes: 1809175790 */
-	i = emit_aux_table_inv(job->q->hwe, dw, i);
+		/* hsdes: 1809175790 */
+		i = emit_aux_table_inv(job->q->hwe, dw, i);
 
-	if (job->ring_ops_flush_tlb)
-		i = emit_flush_imm_ggtt(xe_lrc_start_seqno_ggtt_addr(lrc),
-					seqno, MI_INVALIDATE_TLB, dw, i);
+		if (job->ring_ops_flush_tlb)
+			i = emit_flush_imm_ggtt(xe_lrc_start_seqno_ggtt_addr(lrc),
+						seqno, MI_INVALIDATE_TLB, dw, i);
 
-	dw[i++] = preparser_disable(false);
+		dw[i++] = preparser_disable(false);
+	}
 
 	if (!job->ring_ops_flush_tlb)
 		i = emit_store_imm_ggtt(xe_lrc_start_seqno_ggtt_addr(lrc),
-- 
2.43.0

