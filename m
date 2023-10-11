Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FE6BCDB47E
	for <intel-xe@archiver.kernel.org>; Wed, 11 Oct 2023 23:10:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46B5E10E275;
	Wed, 11 Oct 2023 23:10:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4524810E260
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Oct 2023 23:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697065817; x=1728601817;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qLlAc7aY2qk3J5R2Kn0gLn0ew9fis6gAuXCsoltzqQI=;
 b=aGWe5bUUKO3cVztEL2YrqMHmQMZK2N/ansZTJ562Nj3GAYt4kC0GP5i7
 L0MaFbuXHbuzV9i2lrwdePbQnov5wXI7s9kgxp2UnhIO5XQkao8BnoKug
 nEhcui0C555qFhk5zSm5YFQy39x8ARo2hsd4rVvV28aSU4WvLdfoqxGUo
 l8LkdSNZWsiPvd+kzFjVEvaenGoi3aWfFWPwT50RSdWKVoUKNkXdBJr1J
 ezo/YW7Coisws/KJEhctTPCgcGkYayC8IDA+Tw477xvtQMvEjGbHyFUC8
 jcW8thwAfaGWKe2L23dwCWomeT7IHgaOjAXJ2tBb9c/nR30SbQhrNN7TJ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="451282087"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; d="scan'208";a="451282087"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 16:10:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="703919056"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; d="scan'208";a="703919056"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.131])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 16:10:16 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 11 Oct 2023 16:09:59 -0700
Message-ID: <20231011230957.463381-9-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231011230957.463381-8-matthew.d.roper@intel.com>
References: <20231011230957.463381-8-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/6] drm/xe: Make MI_FLUSH_DW immediate size more
 explicit
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
Cc: matthew.d.roper@intel.com
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

