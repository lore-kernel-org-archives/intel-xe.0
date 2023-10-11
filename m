Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 561C5CDB465
	for <intel-xe@archiver.kernel.org>; Wed, 11 Oct 2023 23:10:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62AF710E298;
	Wed, 11 Oct 2023 23:10:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65FE510E275
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Oct 2023 23:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697065817; x=1728601817;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HxPtK+l+adf2nMgcQZ4svzO2p5b/6HfiAZo6jt1jaZ4=;
 b=NfTdYapZb8KwHsURPPPRHb7jdxeacYRb7V+EDln3+3QdNAeMT5RPB/Fo
 6fIbZ52/bRfR6eu8rUUqM8jTTKYdpT/okEM7Icko/APBZ81jcdSvdX0wo
 H6zwvce0aw9rzstAwk2hDQDQExhZJymew2ck8opcOSIpTxmZDyPSQ9CCQ
 k3Rq0zAuKXwSRWxCJfo2/V8ZPnMmCuxpZeSJtyv4Qpu3hasBfyZDFodrO
 jfS4KZStt5wGgB4cRkV+65k/i+nWUxurNK+7xJWQY65p8b909ccy4OlE2
 k9VFHNy5JrXstSV4NPo1ZokjX7zGe3DTKZCAW7teryoNgK6xqpoegf5Un A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="451282088"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; d="scan'208";a="451282088"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 16:10:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="703919059"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; d="scan'208";a="703919059"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.131])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 16:10:16 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 11 Oct 2023 16:10:00 -0700
Message-ID: <20231011230957.463381-10-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231011230957.463381-8-matthew.d.roper@intel.com>
References: <20231011230957.463381-8-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/6] drm/xe: Separate number of registers from
 MI_LRI opcode
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

Keeping the number of registers to be loaded as a separate macro from
the instruction opcode will simplify some upcoming LRC parsing code.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gpu_commands.h | 4 +++-
 drivers/gpu/drm/xe/xe_gt.c                | 2 +-
 drivers/gpu/drm/xe/xe_lrc.c               | 2 +-
 drivers/gpu/drm/xe/xe_ring_ops.c          | 2 +-
 4 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
index 9432a960346b..ad1e5466671b 100644
--- a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
+++ b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
@@ -25,9 +25,11 @@
 #define MI_BATCH_BUFFER_END	MI_INSTR(0x0a, 0)
 #define MI_STORE_DATA_IMM	MI_INSTR(0x20, 0)
 
-#define MI_LOAD_REGISTER_IMM(x)	MI_INSTR(0x22, 2*(x)-1)
+#define MI_LOAD_REGISTER_IMM	MI_INSTR(0x22, 0)
 #define   MI_LRI_LRM_CS_MMIO		REG_BIT(19)
 #define   MI_LRI_MMIO_REMAP_EN		REG_BIT(17)
+#define   MI_LRI_LENGTH			GENMASK(5, 0)
+#define   MI_LRI_NUM_REGS(x)		REG_FIELD_PREP(MI_LRI_LENGTH, 2 * (x) - 1)
 #define   MI_LRI_FORCE_POSTED		(1<<12)
 
 #define MI_FLUSH_DW		MI_INSTR(0x26, 0)
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index c63e2e4750b1..a42ee3b9b8c7 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -145,7 +145,7 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
 	if (count) {
 		xe_gt_dbg(gt, "LRC WA %s save-restore batch\n", sr->name);
 
-		bb->cs[bb->len++] = MI_LOAD_REGISTER_IMM(count);
+		bb->cs[bb->len++] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(count);
 
 		xa_for_each(&sr->xa, idx, entry) {
 			struct xe_reg reg = entry->reg;
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 35ae6e531d8a..81463bd5e490 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -111,7 +111,7 @@ static void set_offsets(u32 *regs,
 		flags = *data >> 6;
 		data++;
 
-		*regs = MI_LOAD_REGISTER_IMM(count);
+		*regs = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(count);
 		if (flags & POSTED)
 			*regs |= MI_LRI_FORCE_POSTED;
 		*regs |= MI_LRI_LRM_CS_MMIO;
diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index b95cc7713ff9..1e36b07d3e01 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -50,7 +50,7 @@ static u32 preparser_disable(bool state)
 static int emit_aux_table_inv(struct xe_gt *gt, struct xe_reg reg,
 			      u32 *dw, int i)
 {
-	dw[i++] = MI_LOAD_REGISTER_IMM(1) | MI_LRI_MMIO_REMAP_EN;
+	dw[i++] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(1) | MI_LRI_MMIO_REMAP_EN;
 	dw[i++] = reg.addr + gt->mmio.adj_offset;
 	dw[i++] = AUX_INV;
 	dw[i++] = MI_NOOP;
-- 
2.41.0

