Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CD2FE7718B
	for <intel-xe@archiver.kernel.org>; Fri, 27 Dec 2024 18:33:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFE1310E405;
	Fri, 27 Dec 2024 18:33:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="enBQ2pSP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65EDB10E405
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Dec 2024 18:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735324401; x=1766860401;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ymHGRV2DMOfhRnHmU7GNsPlph47JJ7w0NvgzkG85f7Y=;
 b=enBQ2pSPd9OtD7Bo1G1Cp+4TVc0/D4sNQJnGTTQBk/50/N83AueIk8ef
 cCQrq73WsOSTZ5sfxguFp9W4a9QUbx482+JUQRw9vuwxAsByk+3Y1Mudw
 qxYVfpFctHqN0lU7OIqYVlLHqHybspDUGtGgX7EXlKihBVjvDtAgGC0vO
 6IT0AKDwVGhyTsuLQcmjC9RVCB43S+O2YBZPknV8T7zz6/fESkDLpa+3M
 /l6Vq7mhtyXHFUwnhe5TvBmGIturdh8Onk6UMEEje9kplLi4XjsDi6QuW
 Jw2Lr/7Ik7qVagz/9ucpN19Ck+vf84WP3COGOGExie6mTG/K7CSfHnt9b Q==;
X-CSE-ConnectionGUID: SeydV+orQ0iggFjaiyh1ZA==
X-CSE-MsgGUID: sN4csgS6QZuo37iGe1Sezw==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="46722265"
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; d="scan'208";a="46722265"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2024 10:33:20 -0800
X-CSE-ConnectionGUID: y/hGCQuzQcCBKZ4FFgGomg==
X-CSE-MsgGUID: wMgH5YzOQkOC/nfuf2RKIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="123495555"
Received: from unknown (HELO josouza-mobl2.fso.intel.com) ([10.230.19.152])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2024 10:32:41 -0800
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH CI] Revert "drm/xe: Force write completion of
 MI_STORE_DATA_IMM"
Date: Fri, 27 Dec 2024 10:32:19 -0800
Message-ID: <20241227183230.101334-1-jose.souza@intel.com>
X-Mailer: git-send-email 2.47.1
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

This reverts commit 1460bb1fef9ccf7390af0d74a15252442fd6effd.

In all places the MI_STORE_DATA_IMM are not followed by a read of
the same memory address in the same batch buffer and the posted writes
are flushed with PIPE_CONTROL or MI_FLUSH_DW in xe_ring_ops.c functions
so there is no need to set this register.

Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Fixes: 1460bb1fef9c ("drm/xe: Force write completion of MI_STORE_DATA_IMM")
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/instructions/xe_mi_commands.h | 13 ++++++-------
 drivers/gpu/drm/xe/xe_migrate.c                  | 11 +++--------
 drivers/gpu/drm/xe/xe_ring_ops.c                 |  6 ++----
 3 files changed, 11 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
index f4ee910f09432..10ec2920d31b3 100644
--- a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
+++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
@@ -33,13 +33,12 @@
 #define MI_TOPOLOGY_FILTER		__MI_INSTR(0xD)
 #define MI_FORCE_WAKEUP			__MI_INSTR(0x1D)
 
-#define MI_STORE_DATA_IMM			__MI_INSTR(0x20)
-#define   MI_SDI_GGTT				REG_BIT(22)
-#define   MI_FORCE_WRITE_COMPLETION_CHECK	REG_BIT(10)
-#define   MI_SDI_LEN_DW				GENMASK(9, 0)
-#define   MI_SDI_NUM_DW(x)			REG_FIELD_PREP(MI_SDI_LEN_DW, (x) + 3 - 2)
-#define   MI_SDI_NUM_QW(x)			(REG_FIELD_PREP(MI_SDI_LEN_DW, 2 * (x) + 3 - 2) | \
-						 REG_BIT(21))
+#define MI_STORE_DATA_IMM		__MI_INSTR(0x20)
+#define   MI_SDI_GGTT			REG_BIT(22)
+#define   MI_SDI_LEN_DW			GENMASK(9, 0)
+#define   MI_SDI_NUM_DW(x)		REG_FIELD_PREP(MI_SDI_LEN_DW, (x) + 3 - 2)
+#define   MI_SDI_NUM_QW(x)		(REG_FIELD_PREP(MI_SDI_LEN_DW, 2 * (x) + 3 - 2) | \
+					 REG_BIT(21))
 
 #define MI_LOAD_REGISTER_IMM		__MI_INSTR(0x22)
 #define   MI_LRI_LRM_CS_MMIO		REG_BIT(19)
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 8b32fad678782..1b97d90aaddaf 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -581,9 +581,7 @@ static void emit_pte(struct xe_migrate *m,
 	while (ptes) {
 		u32 chunk = min(MAX_PTE_PER_SDI, ptes);
 
-		bb->cs[bb->len++] = MI_STORE_DATA_IMM |
-				    MI_FORCE_WRITE_COMPLETION_CHECK |
-				    MI_SDI_NUM_QW(chunk);
+		bb->cs[bb->len++] = MI_STORE_DATA_IMM | MI_SDI_NUM_QW(chunk);
 		bb->cs[bb->len++] = ofs;
 		bb->cs[bb->len++] = 0;
 
@@ -1225,9 +1223,7 @@ static void write_pgtable(struct xe_tile *tile, struct xe_bb *bb, u64 ppgtt_ofs,
 		if (!(bb->len & 1))
 			bb->cs[bb->len++] = MI_NOOP;
 
-		bb->cs[bb->len++] = MI_STORE_DATA_IMM |
-				    MI_FORCE_WRITE_COMPLETION_CHECK |
-				    MI_SDI_NUM_QW(chunk);
+		bb->cs[bb->len++] = MI_STORE_DATA_IMM | MI_SDI_NUM_QW(chunk);
 		bb->cs[bb->len++] = lower_32_bits(addr);
 		bb->cs[bb->len++] = upper_32_bits(addr);
 		if (pt_op->bind)
@@ -1392,8 +1388,7 @@ __xe_migrate_update_pgtables(struct xe_migrate *m,
 			u32 idx = 0;
 
 			bb->cs[bb->len++] = MI_STORE_DATA_IMM |
-					    MI_FORCE_WRITE_COMPLETION_CHECK |
-					    MI_SDI_NUM_QW(chunk);
+				MI_SDI_NUM_QW(chunk);
 			bb->cs[bb->len++] = ofs;
 			bb->cs[bb->len++] = 0; /* upper_32_bits */
 
diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index c8ab37fa0d198..9f327f27c0726 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -72,8 +72,7 @@ static int emit_user_interrupt(u32 *dw, int i)
 
 static int emit_store_imm_ggtt(u32 addr, u32 value, u32 *dw, int i)
 {
-	dw[i++] = MI_STORE_DATA_IMM | MI_SDI_GGTT |
-		  MI_FORCE_WRITE_COMPLETION_CHECK | MI_SDI_NUM_DW(1);
+	dw[i++] = MI_STORE_DATA_IMM | MI_SDI_GGTT | MI_SDI_NUM_DW(1);
 	dw[i++] = addr;
 	dw[i++] = 0;
 	dw[i++] = value;
@@ -163,8 +162,7 @@ static int emit_pipe_invalidate(u32 mask_flags, bool invalidate_tlb, u32 *dw,
 static int emit_store_imm_ppgtt_posted(u64 addr, u64 value,
 				       u32 *dw, int i)
 {
-	dw[i++] = MI_STORE_DATA_IMM | MI_FORCE_WRITE_COMPLETION_CHECK |
-		  MI_SDI_NUM_QW(1);
+	dw[i++] = MI_STORE_DATA_IMM | MI_SDI_NUM_QW(1);
 	dw[i++] = lower_32_bits(addr);
 	dw[i++] = upper_32_bits(addr);
 	dw[i++] = lower_32_bits(value);
-- 
2.47.1

