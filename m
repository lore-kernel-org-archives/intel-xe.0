Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A70DE7718B
	for <intel-xe@archiver.kernel.org>; Mon, 23 Dec 2024 18:29:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9F1310E0BD;
	Mon, 23 Dec 2024 18:29:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LRT8tb+j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3B8E10E0BD
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Dec 2024 18:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734978571; x=1766514571;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FlUtPeG0xZ6/cwG5FZ4cIuhdhBDN1hnjZblFFDcNcXo=;
 b=LRT8tb+j78SqYprEddpqJiIbkASHI1MtRgFrfQyxnpSQHPBD9LUsWyOa
 XJqtILB5Gcim7UfSw3Tz5onLcNYH9J3Qt6CFSW5+KWBkV+zYmuk9Y2d4T
 qXnlfumIAhbgXHbzfsZR5H6/WUnO1BE+fqCWZ2xkno/LFJ7HBDZqGhfbz
 tR/26QF3Q7ztrDC1Wu5A+G4f2dUHNNHWg2PPI/l2hUxIVp1sCCP6lIogf
 C/W2BZD+73B9rGgdRmaRXf9krvJRworvZ1oevYuQxY/If+a7Ob6gfjGCl
 qUSqMPQJjXPZuI97Cbc8Jh3iSnkc7lyUYbOWWPU/RuUDD9nuP/8g9+DDN g==;
X-CSE-ConnectionGUID: DN0me48ETW6vyz5/S0Ofvw==
X-CSE-MsgGUID: bJTq4eElTDCUJ6zTxCboCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="60830796"
X-IronPort-AV: E=Sophos;i="6.12,257,1728975600"; d="scan'208";a="60830796"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2024 10:29:30 -0800
X-CSE-ConnectionGUID: 5ZLpLbENR4y9Q7mvzOajNg==
X-CSE-MsgGUID: K0N/tnO1SCe8DuT5E3Pm0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="104337427"
Received: from vverma7-mobl3.amr.corp.intel.com (HELO josouza-mobl2.intel.com)
 ([10.124.222.108])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2024 10:29:27 -0800
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH] drm/xe: Remove 'Force write completion' from MI_STORE_DATA_IMM
Date: Mon, 23 Dec 2024 10:29:18 -0800
Message-ID: <20241223182918.126288-1-jose.souza@intel.com>
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

In all places the MI_STORE_DATA_IMM are not followed by a read of
the same memory address in the same batch buffer and the posted writes
are flushed with PIPE_CONTROL or MI_FLUSH_DW in xe_ring_ops.c functions
so there is no need to set this register.

This is not a revert because I think it is worthy keep the register
definition and the comment on top of it so future readers don't
get the same wrong conclusion as I did.

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Fixes: 1460bb1fef9c ("drm/xe: Force write completion of MI_STORE_DATA_IMM")
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/instructions/xe_mi_commands.h | 4 ++++
 drivers/gpu/drm/xe/xe_migrate.c                  | 9 ++-------
 drivers/gpu/drm/xe/xe_oa.c                       | 1 -
 drivers/gpu/drm/xe/xe_ring_ops.c                 | 6 ++----
 4 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
index f4ee910f09432..8e9884aaa4b8a 100644
--- a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
+++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
@@ -35,6 +35,10 @@
 
 #define MI_STORE_DATA_IMM			__MI_INSTR(0x20)
 #define   MI_SDI_GGTT				REG_BIT(22)
+/*
+ * PIPE_CONTROL and MI_FLUSH_DW flushes all posted writes, only needed if
+ * written value is read in batch buffer
+ */
 #define   MI_FORCE_WRITE_COMPLETION_CHECK	REG_BIT(10)
 #define   MI_SDI_LEN_DW				GENMASK(9, 0)
 #define   MI_SDI_NUM_DW(x)			REG_FIELD_PREP(MI_SDI_LEN_DW, (x) + 3 - 2)
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 8b32fad678782..9b3bcb789eee3 100644
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
@@ -1392,7 +1388,6 @@ __xe_migrate_update_pgtables(struct xe_migrate *m,
 			u32 idx = 0;
 
 			bb->cs[bb->len++] = MI_STORE_DATA_IMM |
-					    MI_FORCE_WRITE_COMPLETION_CHECK |
 					    MI_SDI_NUM_QW(chunk);
 			bb->cs[bb->len++] = ofs;
 			bb->cs[bb->len++] = 0; /* upper_32_bits */
diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index ae94490b0eac8..6b440a5470255 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -691,7 +691,6 @@ static void xe_oa_store_flex(struct xe_oa_stream *stream, struct xe_lrc *lrc,
 
 	do {
 		bb->cs[bb->len++] = MI_STORE_DATA_IMM | MI_SDI_GGTT |
-				    MI_FORCE_WRITE_COMPLETION_CHECK |
 				    MI_SDI_NUM_DW(1);
 		bb->cs[bb->len++] = offset + flex->offset * sizeof(u32);
 		bb->cs[bb->len++] = 0;
diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index 3a75a08b6be92..0be4f489d3e12 100644
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

