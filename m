Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 232FFC83F09
	for <intel-xe@archiver.kernel.org>; Thu, 10 Jul 2025 04:59:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B315010E164;
	Thu, 10 Jul 2025 04:59:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GojshRcx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51F5310E164
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Jul 2025 04:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752123595; x=1783659595;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dKiDi6mrQolcRmtBdt1Kl5i+pVurY13XoE8pA7W5vbg=;
 b=GojshRcxiZzyGUKCcvNa6qkbK8B7E5yA+dQwT1v2LQ1ZrBBauLri9M0k
 YEbTBwL0Bsz/DfEWg8IoPjCc19SjVfai9vxnRg1i9KR5UuSi/DmXgf1SD
 Zil3JvCB/KU20dSGcWx7mscuhhU5qQXoi83njLXaGT5oOuO7x6m60++7X
 GRRPuRmt2G8fLKZqFbq5xdUi7iJZHzMx0Sp4vaKPmzks7ecd/z/VZcnsE
 p8MLZCKyR7ORYC2f9hEPhRejRtyKmttrlA3MOtg20InGaxhsMvM6i3/b5
 uc2pqYd94fDvVlrQcZoL7PED1tigtcDqVN5ymo8CfJlom/LZ+D0Z6lgAW w==;
X-CSE-ConnectionGUID: yWA3iTtfRSKG2UFkoKcynA==
X-CSE-MsgGUID: OTHNfJqcS9SWKo9uPEY2SQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54112706"
X-IronPort-AV: E=Sophos;i="6.16,299,1744095600"; d="scan'208";a="54112706"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 21:59:55 -0700
X-CSE-ConnectionGUID: YcOzy/pWRiCf3ek6t1Q3yA==
X-CSE-MsgGUID: w3rH5+ZMSeGLxVJxtH1iOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,299,1744095600"; d="scan'208";a="155742132"
Received: from unknown (HELO tejasupa-desk..) ([10.190.239.37])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 21:59:54 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH V2] drm/xe: Dont skip TLB invalidations on VF
Date: Thu, 10 Jul 2025 10:29:45 +0530
Message-Id: <20250710045945.1023840-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.34.1
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

Skipping TLB invalidations on VF causing unrecoverable
faults. Probable reason for skipping TLB invalidations
on SRIOV could be lack of support for instruction
MI_FLUSH_DW_STORE_INDEX. Add back TLB flush with some
additional handling.

Helps in resolving,
[  704.913454] xe 0000:00:02.1: [drm:pf_queue_work_func [xe]]
                ASID: 0
                VFID: 0
                PDATA: 0x0d92
                Faulted Address: 0x0000000002fa0000
                FaultType: 0
                AccessType: 1
                FaultLevel: 0
                EngineClass: 3 bcs
                EngineInstance: 8
[  704.913551] xe 0000:00:02.1: [drm:pf_queue_work_func [xe]] Fault response: Unsuccessful -22

V2:
 - Use Xmas tree (MichalW)

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Fixes: 97515d0b3ed92 ("drm/xe/vf: Don't emit access to Global HWSP if VF")
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_ring_ops.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index bc1689db4cd7..7b50c7c1ee21 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -110,13 +110,14 @@ static int emit_bb_start(u64 batch_addr, u32 ppgtt_flag, u32 *dw, int i)
 	return i;
 }
 
-static int emit_flush_invalidate(u32 *dw, int i)
+static int emit_flush_invalidate(u32 addr, u32 val, u32 *dw, int i)
 {
 	dw[i++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
-		  MI_FLUSH_IMM_DW | MI_FLUSH_DW_STORE_INDEX;
-	dw[i++] = LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR;
-	dw[i++] = 0;
+		  MI_FLUSH_IMM_DW;
+
+	dw[i++] = addr | MI_FLUSH_DW_USE_GTT;
 	dw[i++] = 0;
+	dw[i++] = val;
 
 	return i;
 }
@@ -397,23 +398,20 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
 static void emit_migration_job_gen12(struct xe_sched_job *job,
 				     struct xe_lrc *lrc, u32 seqno)
 {
+	u32 saddr = xe_lrc_start_seqno_ggtt_addr(lrc);
 	u32 dw[MAX_JOB_SIZE_DW], i = 0;
 
 	i = emit_copy_timestamp(lrc, dw, i);
 
-	i = emit_store_imm_ggtt(xe_lrc_start_seqno_ggtt_addr(lrc),
-				seqno, dw, i);
+	i = emit_store_imm_ggtt(saddr, seqno, dw, i);
 
 	dw[i++] = MI_ARB_ON_OFF | MI_ARB_DISABLE; /* Enabled again below */
 
 	i = emit_bb_start(job->ptrs[0].batch_addr, BIT(8), dw, i);
 
-	if (!IS_SRIOV_VF(gt_to_xe(job->q->gt))) {
-		/* XXX: Do we need this? Leaving for now. */
-		dw[i++] = preparser_disable(true);
-		i = emit_flush_invalidate(dw, i);
-		dw[i++] = preparser_disable(false);
-	}
+	dw[i++] = preparser_disable(true);
+	i = emit_flush_invalidate(saddr, seqno, dw, i);
+	dw[i++] = preparser_disable(false);
 
 	i = emit_bb_start(job->ptrs[1].batch_addr, BIT(8), dw, i);
 
-- 
2.34.1

