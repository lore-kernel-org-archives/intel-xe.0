Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51108C4345F
	for <intel-xe@archiver.kernel.org>; Thu, 18 Apr 2024 22:24:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E715D11A053;
	Thu, 18 Apr 2024 22:24:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H9Et5WjE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 998E011A053
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Apr 2024 22:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713479056; x=1745015056;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+aZt3txILBah0rGUdGbtc6ATFxMpySmstD+2bYigLyQ=;
 b=H9Et5WjE2qV7Pjr9bpSS72CGv/Bqzn4Ru37Pwwi7VFfgEFlEakUfAVqW
 bdQi4X47f8o+ufIJEyt6ai6tNyA2JB6KVOZi0i2x3Lmgt/TfeSWPhGeFA
 ioEwwsVgrO3BcY063GBCP/Gln1LIoBwDeCOvd6BaZPx8Fh3uOEfmTGBN3
 IgnyB7326B4JYRFs80QT0ZUhdcusmO4zFjVAND6kTgQVz1PlW4T2Z4XOb
 axr36cZ7eQPCeP/7QhEsFM2iEmf4DQMsPKgIZPzSMQFJJkowQs147f715
 VLKU+tc1dM/nhe1J90jb9L0SkZFE1P2Bu0EbQYIePHXDaA/aiBWkLHRtB w==;
X-CSE-ConnectionGUID: jRvE3beHS3+VW3yuHgAK8w==
X-CSE-MsgGUID: mF3vMv9GS4uv9Okf9SsbKQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="26572327"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="26572327"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 15:24:15 -0700
X-CSE-ConnectionGUID: kVIBljKXRG2zU3MvzaYUEA==
X-CSE-MsgGUID: DQFbfHcZSAyNRTaBXBnNew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="54344568"
Received: from invictus.jf.intel.com ([10.165.21.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 15:24:15 -0700
From: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Subject: [PATCH] drm/xe: Add reg read/write trace
Date: Thu, 18 Apr 2024 15:22:43 -0700
Message-Id: <20240418222243.3285041-1-radhakrishna.sripada@intel.com>
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

This will help debug register read/writes and provides
a way to trace all the mmio transactions.

Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c  | 20 +++++++++++++++++---
 drivers/gpu/drm/xe/xe_trace.h | 28 ++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 334637511e75..659c19d4f0a6 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -22,6 +22,7 @@
 #include "xe_module.h"
 #include "xe_sriov.h"
 #include "xe_tile.h"
+#include "xe_trace.h"
 
 #define XEHP_MTCFG_ADDR		XE_REG(0x101800)
 #define TILE_COUNT		REG_GENMASK(15, 8)
@@ -423,21 +424,29 @@ int xe_mmio_init(struct xe_device *xe)
 u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
 {
 	struct xe_tile *tile = gt_to_tile(gt);
+	u8 val;
 
 	if (reg.addr < gt->mmio.adj_limit)
 		reg.addr += gt->mmio.adj_offset;
 
-	return readb((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + reg.addr);
+	val = readb((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + reg.addr);
+	trace_xe_reg_rw(false, reg, val, sizeof(val), true);
+
+	return val;
 }
 
 u16 xe_mmio_read16(struct xe_gt *gt, struct xe_reg reg)
 {
 	struct xe_tile *tile = gt_to_tile(gt);
+	u16 val;
 
 	if (reg.addr < gt->mmio.adj_limit)
 		reg.addr += gt->mmio.adj_offset;
 
-	return readw((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + reg.addr);
+	val = readw((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + reg.addr);
+	trace_xe_reg_rw(false, reg, val, sizeof(val), true);
+
+	return val;
 }
 
 void xe_mmio_write32(struct xe_gt *gt, struct xe_reg reg, u32 val)
@@ -447,17 +456,22 @@ void xe_mmio_write32(struct xe_gt *gt, struct xe_reg reg, u32 val)
 	if (reg.addr < gt->mmio.adj_limit)
 		reg.addr += gt->mmio.adj_offset;
 
+	trace_xe_reg_rw(true, reg, val, sizeof(val), true);
 	writel(val, (reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + reg.addr);
 }
 
 u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
 {
 	struct xe_tile *tile = gt_to_tile(gt);
+	u32 val;
 
 	if (reg.addr < gt->mmio.adj_limit)
 		reg.addr += gt->mmio.adj_offset;
 
-	return readl((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + reg.addr);
+	val = readl((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + reg.addr);
+	trace_xe_reg_rw(false, reg, val, sizeof(val), true);
+
+	return val;
 }
 
 u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg reg, u32 clr, u32 set)
diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index 2d56cfc09e42..41d778dd43c6 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -621,6 +621,34 @@ DEFINE_EVENT_PRINT(xe_guc_ctb, xe_guc_ctb_g2h,
 
 );
 
+TRACE_EVENT_CONDITION(xe_reg_rw,
+	TP_PROTO(bool write, u32 reg, u64 val, int len, bool trace),
+
+	TP_ARGS(write, reg, val, len, trace),
+
+	TP_CONDITION(trace),
+
+	TP_STRUCT__entry(
+		__field(u64, val)
+		__field(u32, reg)
+		__field(u16, write)
+		__field(u16, len)
+		),
+
+	TP_fast_assign(
+		__entry->val = (u64)val;
+		__entry->reg = reg;
+		__entry->write = write;
+		__entry->len = len;
+		),
+
+	TP_printk("%s reg=0x%x, len=%d, val=(0x%x, 0x%x)",
+		__entry->write ? "write" : "read",
+		__entry->reg, __entry->len,
+		(u32)(__entry->val & 0xffffffff),
+		(u32)(__entry->val >> 32))
+);
+
 #endif
 
 /* This part must be outside protection */
-- 
2.34.1

