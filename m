Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14BD1C8303C
	for <intel-xe@archiver.kernel.org>; Tue,  8 Jul 2025 09:02:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6A1210E5C9;
	Tue,  8 Jul 2025 09:02:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DdaRCmjV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EA8710E5C9
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Jul 2025 09:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751965334; x=1783501334;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HDmacmYOY7wL7XK1vFhJRBW2HfxhZ8Q3hXhMe6n9d+0=;
 b=DdaRCmjV39uIq0YWJbOb1a7o26A8tINBzcqW4hKqVwbQiCr2KrhqUBJa
 q1S4xeWbjJtJjT9wZ46xWugu8Kq/Mi/QP6jEEj9TxWR7iQnoVSbjEigjr
 igZ23bU+VR0TLRNVjFWgi1TOu0JWCE2lPl+v2QE6HXgqLKqwqho4c9rtI
 gzxA9780Q6IALVMIYSDxWfo4TdRkY51PUhdl7Z0mDKNJhvncosLsA4NA1
 ikfnWBVK8HIzv0Kb5Du8KkOACsy4XNTlgmCfMAmYBjAW1kPdRTHzOUbxl
 vUxM704h1lUXW8+EMscKp2+4RIIRv6uI33weKwfpwQI7bdu3ReHtvoVqz Q==;
X-CSE-ConnectionGUID: zWN49KvgSh2EJR1lN1orPw==
X-CSE-MsgGUID: 2zRhlE6UTMOrjxCGMDfTHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="54054697"
X-IronPort-AV: E=Sophos;i="6.16,296,1744095600"; d="scan'208";a="54054697"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 02:02:14 -0700
X-CSE-ConnectionGUID: EtKmUi79S6OPl5myBAMDXA==
X-CSE-MsgGUID: B8tsEyjcSPiK+aPDLQ7kBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,296,1744095600"; d="scan'208";a="159488431"
Received: from unknown (HELO tejasupa-desk..) ([10.190.239.37])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 02:02:12 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe: Dont skip TLB invalidations on VF
Date: Tue,  8 Jul 2025 14:31:56 +0530
Message-Id: <20250708090156.741440-1-tejas.upadhyay@intel.com>
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

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Fixes: 97515d0b3ed92 ("drm/xe/vf: Don't emit access to Global HWSP if VF")
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_ring_ops.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index bc1689db4cd7..ee0fa208e2f8 100644
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
@@ -398,22 +399,19 @@ static void emit_migration_job_gen12(struct xe_sched_job *job,
 				     struct xe_lrc *lrc, u32 seqno)
 {
 	u32 dw[MAX_JOB_SIZE_DW], i = 0;
+	u32 saddr = xe_lrc_start_seqno_ggtt_addr(lrc);
 
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

