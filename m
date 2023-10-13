Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3DF4CDB47E
	for <intel-xe@archiver.kernel.org>; Fri, 13 Oct 2023 22:03:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F43C10E644;
	Fri, 13 Oct 2023 22:03:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BED3610E072
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Oct 2023 22:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697234579; x=1728770579;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TQbC4/kpxwYgvqbEhnUETYuvAReS8G3StK2eFoxK27c=;
 b=WSFXcRW3yQeXOvcmd9KUtIxgw6TgeQm3CB/Nb/FwhKughXF/0Rx525eF
 2h0K9bGwxEwdKHrTIVFYuxqzdLi1klEIZotpzzh7Rpo9ibnEDsSsx/5OA
 btIcRhAKdMNoF+URyrWAy9elljw7SwUep4/C+EiFwvvGfXD1r4lPxAPWZ
 jOFmxKsu+RbAM4IepYoTQyIL1S0fIR03vjKw1IaVOphV/jxxinF+XJ2ZI
 ffohkVJDX1CX8HcNmE6b7Q4ggYAYjqNDE9/0+Qwn7urU2WASKAg3qppH8
 wq0Nw6xAT6fLllqnN0CU93cc7UgXd8orbyuvTqjD1MhijNbSGWFGXF/9U w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="471505749"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; d="scan'208";a="471505749"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2023 15:02:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="825212665"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; d="scan'208";a="825212665"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.131])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2023 15:02:59 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 13 Oct 2023 15:02:52 -0700
Message-ID: <20231013220250.927876-9-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231013220250.927876-8-matthew.d.roper@intel.com>
References: <20231013220250.927876-8-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 1/6] drm/xe: Make MI_FLUSH_DW immediate size
 more explicit
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Despite its name, MI_FLUSH_DW instruction can write an immediate value
of either dword size or qword size, depending on the 'length' field of
the instruction.  Since "length" excludes the first two dwords of the
instruction, a value of 2 in the length field implies a dword write and
a value of 3 implies a qword write.  Even in cases where the flush
instruction's post-sync operation is set to "no write" we're still
expected to size the overall instruction as if we were doing a dword or
qword write (i.e., a length of 1 shouldn't be used on modern platforms).

Rather than baking a size of "1" into the #define and then adding
another unexplained "+ 1" at all the spots where the definition gets
used, lets just create MI_FLUSH_IMM_DW and MI_FLUSH_IMM_QW definitions
that should be OR'd into the instruction header to make it more explicit
what behavior we're requesting.

Bspec: 60229
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gpu_commands.h |  5 ++++-
 drivers/gpu/drm/xe/xe_ring_ops.c          | 10 +++++-----
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
index 21738281bdd0..9432a960346b 100644
--- a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
+++ b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
@@ -30,12 +30,15 @@
 #define   MI_LRI_MMIO_REMAP_EN		REG_BIT(17)
 #define   MI_LRI_FORCE_POSTED		(1<<12)
 
-#define MI_FLUSH_DW		MI_INSTR(0x26, 1)
+#define MI_FLUSH_DW		MI_INSTR(0x26, 0)
 #define   MI_FLUSH_DW_STORE_INDEX	(1<<21)
 #define   MI_INVALIDATE_TLB		(1<<18)
 #define   MI_FLUSH_DW_CCS		(1<<16)
 #define   MI_FLUSH_DW_OP_STOREDW	(1<<14)
 #define   MI_FLUSH_DW_USE_GTT		(1<<2)
+#define   MI_FLUSH_LENGTH		GENMASK(5, 0)
+#define   MI_FLUSH_IMM_DW		REG_FIELD_PREP(MI_FLUSH_LENGTH, 2)
+#define   MI_FLUSH_IMM_QW		REG_FIELD_PREP(MI_FLUSH_LENGTH, 3)
 
 #define MI_BATCH_BUFFER_START		MI_INSTR(0x31, 1)
 
diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index 6eec7c7e4bc5..b95cc7713ff9 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -80,7 +80,7 @@ static int emit_store_imm_ggtt(u32 addr, u32 value, u32 *dw, int i)
 static int emit_flush_imm_ggtt(u32 addr, u32 value, bool invalidate_tlb,
 			       u32 *dw, int i)
 {
-	dw[i++] = (MI_FLUSH_DW + 1) | MI_FLUSH_DW_OP_STOREDW |
+	dw[i++] = MI_FLUSH_DW | MI_FLUSH_DW_OP_STOREDW | MI_FLUSH_IMM_DW |
 		(invalidate_tlb ? MI_INVALIDATE_TLB : 0);
 	dw[i++] = addr | MI_FLUSH_DW_USE_GTT;
 	dw[i++] = 0;
@@ -100,9 +100,9 @@ static int emit_bb_start(u64 batch_addr, u32 ppgtt_flag, u32 *dw, int i)
 
 static int emit_flush_invalidate(u32 flag, u32 *dw, int i)
 {
-	dw[i] = MI_FLUSH_DW + 1;
+	dw[i] = MI_FLUSH_DW;
 	dw[i] |= flag;
-	dw[i++] |= MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
+	dw[i++] |= MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW | MI_FLUSH_IMM_DW |
 		MI_FLUSH_DW_STORE_INDEX;
 
 	dw[i++] = LRC_PPHWSP_SCRATCH_ADDR | MI_FLUSH_DW_USE_GTT;
@@ -365,8 +365,8 @@ static void emit_migration_job_gen12(struct xe_sched_job *job,
 
 	i = emit_bb_start(job->batch_addr[1], BIT(8), dw, i);
 
-	dw[i++] = (MI_FLUSH_DW | MI_INVALIDATE_TLB | job->migrate_flush_flags |
-		   MI_FLUSH_DW_OP_STOREDW) + 1;
+	dw[i++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | job->migrate_flush_flags |
+		MI_FLUSH_DW_OP_STOREDW | MI_FLUSH_IMM_DW;
 	dw[i++] = xe_lrc_seqno_ggtt_addr(lrc) | MI_FLUSH_DW_USE_GTT;
 	dw[i++] = 0;
 	dw[i++] = seqno; /* value */
-- 
2.41.0

