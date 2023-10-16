Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F203CDB483
	for <intel-xe@archiver.kernel.org>; Mon, 16 Oct 2023 16:35:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EA9F10E228;
	Mon, 16 Oct 2023 16:35:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EC1710E210
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Oct 2023 16:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697474102; x=1729010102;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=v1kY7V+gc1eqmCyCSrZr5awafk7eCwZqwi5sGim7lYU=;
 b=KODvKMZKTMpkFm/ri1SHkwMRtYd8WzHsCLJdzDWBk2UXu3q5Yd3ZnMq5
 jRZPgAEjPXZxV+bvpgK5Rx2oiBsI5rJNd3nayrKJhfo3LE3OPxGao+iJB
 aUA58MyClepp/FLHNaE7dbnX0TMj++1n0k0CHmNLgXRAjgj+AzDMfX5Rg
 J6mkliwJHU7b0a27a0sTIAxA7XYP2ArkCxN9M0jqUJXK1jasF86Qsdj6s
 UrdBZUjQd262TSl57mSnccQVjy+oeTHECjeDGM/x/iWl/Ad4srdbls0c/
 MOmH1Tcl2c6DZHBqH89ULnXUwEzQhOVaQq3iXAILN/hCc2Mey7PSf69UK A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="452051242"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; d="scan'208";a="452051242"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2023 09:35:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="790865601"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; d="scan'208";a="790865601"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.131])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2023 09:35:01 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 16 Oct 2023 09:34:53 -0700
Message-ID: <20231016163449.1300701-11-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231016163449.1300701-8-matthew.d.roper@intel.com>
References: <20231016163449.1300701-8-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 3/6] drm/xe: Clarify number of dwords/qwords
 stored by MI_STORE_DATA_IMM
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

MI_STORE_DATA_IMM can store either dword values or qword values, and can
store more than one value if the instruction's length field is large
enough.  Create explicit defines to specify the number of dwords/qwords
to be stored, which will set the instruction length correctly and, if
necessary, turn on the 'store qword' bit.

While we're here, also replace an open-coded version of
MI_STORE_DATA_IMM with the common macros.

Bspec: 60246
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gpu_commands.h | 3 +++
 drivers/gpu/drm/xe/xe_migrate.c           | 9 +++------
 drivers/gpu/drm/xe/xe_ring_ops.c          | 6 ++----
 3 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
index ad1e5466671b..8c2e0da694d8 100644
--- a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
+++ b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
@@ -24,6 +24,9 @@
 
 #define MI_BATCH_BUFFER_END	MI_INSTR(0x0a, 0)
 #define MI_STORE_DATA_IMM	MI_INSTR(0x20, 0)
+#define   MI_SDI_GGTT		REG_BIT(22)
+#define   MI_SDI_NUM_DW(x)	((x) + 1)
+#define   MI_SDI_NUM_QW(x)	(REG_BIT(21) | (2 * (x) + 1))
 
 #define MI_LOAD_REGISTER_IMM	MI_INSTR(0x22, 0)
 #define   MI_LRI_LRM_CS_MMIO		REG_BIT(19)
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 3049595e288a..716f72ba8cd6 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -482,8 +482,7 @@ static void emit_pte(struct xe_migrate *m,
 	while (ptes) {
 		u32 chunk = min(0x1ffU, ptes);
 
-		bb->cs[bb->len++] = MI_STORE_DATA_IMM | BIT(21) |
-			(chunk * 2 + 1);
+		bb->cs[bb->len++] = MI_STORE_DATA_IMM | MI_SDI_NUM_QW(chunk);
 		bb->cs[bb->len++] = ofs;
 		bb->cs[bb->len++] = 0;
 
@@ -1083,8 +1082,7 @@ static void write_pgtable(struct xe_tile *tile, struct xe_bb *bb, u64 ppgtt_ofs,
 		if (!(bb->len & 1))
 			bb->cs[bb->len++] = MI_NOOP;
 
-		bb->cs[bb->len++] = MI_STORE_DATA_IMM | BIT(21) |
-			(chunk * 2 + 1);
+		bb->cs[bb->len++] = MI_STORE_DATA_IMM | MI_SDI_NUM_QW(chunk);
 		bb->cs[bb->len++] = lower_32_bits(addr);
 		bb->cs[bb->len++] = upper_32_bits(addr);
 		ops->populate(pt_update, tile, NULL, bb->cs + bb->len, ofs, chunk,
@@ -1290,8 +1288,7 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
 		emit_arb_clear(bb);
 
 		/* Map our PT's to gtt */
-		bb->cs[bb->len++] = MI_STORE_DATA_IMM | BIT(21) |
-			(num_updates * 2 + 1);
+		bb->cs[bb->len++] = MI_STORE_DATA_IMM | MI_SDI_NUM_QW(num_updates);
 		bb->cs[bb->len++] = ppgtt_ofs * XE_PAGE_SIZE + page_ofs;
 		bb->cs[bb->len++] = 0; /* upper_32_bits */
 
diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index 1e36b07d3e01..da13cc7ba6af 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -69,7 +69,7 @@ static int emit_user_interrupt(u32 *dw, int i)
 
 static int emit_store_imm_ggtt(u32 addr, u32 value, u32 *dw, int i)
 {
-	dw[i++] = MI_STORE_DATA_IMM | BIT(22) /* GGTT */ | 2;
+	dw[i++] = MI_STORE_DATA_IMM | MI_SDI_GGTT | MI_SDI_NUM_DW(1);
 	dw[i++] = addr;
 	dw[i++] = 0;
 	dw[i++] = value;
@@ -140,12 +140,10 @@ static int emit_pipe_invalidate(u32 mask_flags, bool invalidate_tlb, u32 *dw,
 	return i;
 }
 
-#define MI_STORE_QWORD_IMM_GEN8_POSTED (MI_INSTR(0x20, 3) | (1 << 21))
-
 static int emit_store_imm_ppgtt_posted(u64 addr, u64 value,
 				       u32 *dw, int i)
 {
-	dw[i++] = MI_STORE_QWORD_IMM_GEN8_POSTED;
+	dw[i++] = MI_STORE_DATA_IMM | MI_SDI_NUM_QW(1);
 	dw[i++] = lower_32_bits(addr);
 	dw[i++] = upper_32_bits(addr);
 	dw[i++] = lower_32_bits(value);
-- 
2.41.0

