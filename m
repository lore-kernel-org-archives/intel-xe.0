Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8854AE7717F
	for <intel-xe@archiver.kernel.org>; Tue, 17 Dec 2024 16:07:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54B6F10EA0F;
	Tue, 17 Dec 2024 16:07:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T5xvhmhS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30DF410EA0F
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Dec 2024 16:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734451666; x=1765987666;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6LQD0Uy1WifEUqLxs3oGkU8S2pJyayGnh0BULru9Cl0=;
 b=T5xvhmhS66WhI+mDINysCQg7dxfGLUbcmypPsZo3644GRb/s4CrfUQHH
 rw8FcwoEuUW9Mowzt4UbcUbu4HmMNNXz6Z/gJteyqaeC4ogUW0t3f63S3
 j3seznSeeKWwg3p+C7vDWgKuF6e8ETA50Rof8THi14RIMW7U8PEK/hDf3
 88mXgn2y3DawQoRrqnoCiaAlb+zoyy3oCcKvyW3VRKUHJKP3nfzxamJ3w
 dvjbrNaV3p7q2IEM5eEEaGcai2NkdljIZZmnSXFZDtIb4hp+1U5q38vPS
 Zhzn457+XMQSTSJou1iCn6Wy7RrCie6ihNU/8ydG0Qi2q4JhYSCsMDEdk A==;
X-CSE-ConnectionGUID: riqWvEOlQharls0Bk+xO9A==
X-CSE-MsgGUID: 5PNlIuDyT56PCpmBVjRwAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="38823725"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="38823725"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 08:07:43 -0800
X-CSE-ConnectionGUID: NN2Ve0LMRSamz6dwMUcN+w==
X-CSE-MsgGUID: dWG0MnCgTT+swa8f8DAIew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="102657171"
Received: from unknown (HELO josouza-mobl2.fso.intel.com) ([10.230.19.152])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 08:07:42 -0800
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH] drm/xe: Force write completion of MI_STORE_DATA_IMM
Date: Tue, 17 Dec 2024 08:07:32 -0800
Message-ID: <20241217160732.46280-1-jose.souza@intel.com>
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

With Force write completion unset there is no guarantees of when the
write will be globally visible what is not the behavior wanted.

Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/instructions/xe_mi_commands.h | 13 +++++++------
 drivers/gpu/drm/xe/xe_migrate.c                  | 11 ++++++++---
 drivers/gpu/drm/xe/xe_oa.c                       |  4 +++-
 drivers/gpu/drm/xe/xe_ring_ops.c                 |  6 ++++--
 4 files changed, 22 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
index 10ec2920d31b3..f4ee910f09432 100644
--- a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
+++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
@@ -33,12 +33,13 @@
 #define MI_TOPOLOGY_FILTER		__MI_INSTR(0xD)
 #define MI_FORCE_WAKEUP			__MI_INSTR(0x1D)
 
-#define MI_STORE_DATA_IMM		__MI_INSTR(0x20)
-#define   MI_SDI_GGTT			REG_BIT(22)
-#define   MI_SDI_LEN_DW			GENMASK(9, 0)
-#define   MI_SDI_NUM_DW(x)		REG_FIELD_PREP(MI_SDI_LEN_DW, (x) + 3 - 2)
-#define   MI_SDI_NUM_QW(x)		(REG_FIELD_PREP(MI_SDI_LEN_DW, 2 * (x) + 3 - 2) | \
-					 REG_BIT(21))
+#define MI_STORE_DATA_IMM			__MI_INSTR(0x20)
+#define   MI_SDI_GGTT				REG_BIT(22)
+#define   MI_FORCE_WRITE_COMPLETION_CHECK	REG_BIT(10)
+#define   MI_SDI_LEN_DW				GENMASK(9, 0)
+#define   MI_SDI_NUM_DW(x)			REG_FIELD_PREP(MI_SDI_LEN_DW, (x) + 3 - 2)
+#define   MI_SDI_NUM_QW(x)			(REG_FIELD_PREP(MI_SDI_LEN_DW, 2 * (x) + 3 - 2) | \
+						 REG_BIT(21))
 
 #define MI_LOAD_REGISTER_IMM		__MI_INSTR(0x22)
 #define   MI_LRI_LRM_CS_MMIO		REG_BIT(19)
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 1b97d90aaddaf..8b32fad678782 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -581,7 +581,9 @@ static void emit_pte(struct xe_migrate *m,
 	while (ptes) {
 		u32 chunk = min(MAX_PTE_PER_SDI, ptes);
 
-		bb->cs[bb->len++] = MI_STORE_DATA_IMM | MI_SDI_NUM_QW(chunk);
+		bb->cs[bb->len++] = MI_STORE_DATA_IMM |
+				    MI_FORCE_WRITE_COMPLETION_CHECK |
+				    MI_SDI_NUM_QW(chunk);
 		bb->cs[bb->len++] = ofs;
 		bb->cs[bb->len++] = 0;
 
@@ -1223,7 +1225,9 @@ static void write_pgtable(struct xe_tile *tile, struct xe_bb *bb, u64 ppgtt_ofs,
 		if (!(bb->len & 1))
 			bb->cs[bb->len++] = MI_NOOP;
 
-		bb->cs[bb->len++] = MI_STORE_DATA_IMM | MI_SDI_NUM_QW(chunk);
+		bb->cs[bb->len++] = MI_STORE_DATA_IMM |
+				    MI_FORCE_WRITE_COMPLETION_CHECK |
+				    MI_SDI_NUM_QW(chunk);
 		bb->cs[bb->len++] = lower_32_bits(addr);
 		bb->cs[bb->len++] = upper_32_bits(addr);
 		if (pt_op->bind)
@@ -1388,7 +1392,8 @@ __xe_migrate_update_pgtables(struct xe_migrate *m,
 			u32 idx = 0;
 
 			bb->cs[bb->len++] = MI_STORE_DATA_IMM |
-				MI_SDI_NUM_QW(chunk);
+					    MI_FORCE_WRITE_COMPLETION_CHECK |
+					    MI_SDI_NUM_QW(chunk);
 			bb->cs[bb->len++] = ofs;
 			bb->cs[bb->len++] = 0; /* upper_32_bits */
 
diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 56bf375a9d4bc..ae94490b0eac8 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -690,7 +690,9 @@ static void xe_oa_store_flex(struct xe_oa_stream *stream, struct xe_lrc *lrc,
 	u32 offset = xe_bo_ggtt_addr(lrc->bo);
 
 	do {
-		bb->cs[bb->len++] = MI_STORE_DATA_IMM | MI_SDI_GGTT | MI_SDI_NUM_DW(1);
+		bb->cs[bb->len++] = MI_STORE_DATA_IMM | MI_SDI_GGTT |
+				    MI_FORCE_WRITE_COMPLETION_CHECK |
+				    MI_SDI_NUM_DW(1);
 		bb->cs[bb->len++] = offset + flex->offset * sizeof(u32);
 		bb->cs[bb->len++] = 0;
 		bb->cs[bb->len++] = flex->value;
diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index 0be4f489d3e12..3a75a08b6be92 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -72,7 +72,8 @@ static int emit_user_interrupt(u32 *dw, int i)
 
 static int emit_store_imm_ggtt(u32 addr, u32 value, u32 *dw, int i)
 {
-	dw[i++] = MI_STORE_DATA_IMM | MI_SDI_GGTT | MI_SDI_NUM_DW(1);
+	dw[i++] = MI_STORE_DATA_IMM | MI_SDI_GGTT |
+		  MI_FORCE_WRITE_COMPLETION_CHECK | MI_SDI_NUM_DW(1);
 	dw[i++] = addr;
 	dw[i++] = 0;
 	dw[i++] = value;
@@ -162,7 +163,8 @@ static int emit_pipe_invalidate(u32 mask_flags, bool invalidate_tlb, u32 *dw,
 static int emit_store_imm_ppgtt_posted(u64 addr, u64 value,
 				       u32 *dw, int i)
 {
-	dw[i++] = MI_STORE_DATA_IMM | MI_SDI_NUM_QW(1);
+	dw[i++] = MI_STORE_DATA_IMM | MI_FORCE_WRITE_COMPLETION_CHECK |
+		  MI_SDI_NUM_QW(1);
 	dw[i++] = lower_32_bits(addr);
 	dw[i++] = upper_32_bits(addr);
 	dw[i++] = lower_32_bits(value);
-- 
2.47.1

