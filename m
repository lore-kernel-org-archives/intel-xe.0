Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E1AC27C44
	for <intel-xe@archiver.kernel.org>; Thu, 30 May 2024 15:14:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4962B10EA8E;
	Thu, 30 May 2024 15:14:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mBoeO8H8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DD5D10E8DB
 for <intel-xe@lists.freedesktop.org>; Thu, 30 May 2024 15:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717082087; x=1748618087;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TiTXIA3jSkFOsyRt/vn7pp8lblNpMN5m1oh/KOrjDYI=;
 b=mBoeO8H834sX4K8JcizMdZcJjqtj07NVIpwf9jrjiqS3UwBJ5Z+hDgjo
 3+txa7lFEF2k6UI1TNgvw/qiiWjfRNdOaATBel7xlh9Lfrf5pYQmiGvNe
 PJQG8Z3knp6w30PidJr1WXiXPFjDZYk3bunQMJy93xpJ8081fBGaobl/Y
 HoNlgajQVx7rO/eJfhFrsB7msO/yQaGPpcKM+F2F053CR90eDnLzs7CZD
 uQ7yMCqPuv29KUn1OrACiLhYGYrULTCN64TuoVAK4m2UdYY/U2evxx3mo
 +BKlMgfbCWl7UjGCkwiCS3htQTD2nTWa4VirWa8s+ggNtLwLilT58NQ4P g==;
X-CSE-ConnectionGUID: +tRJDttARRuQvBqqD6B4Wg==
X-CSE-MsgGUID: oxdhWVqxTOGedAr3YRvL8g==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="24695864"
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="24695864"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 08:14:42 -0700
X-CSE-ConnectionGUID: EEauUgc2SaG8BUgt7MsVUQ==
X-CSE-MsgGUID: fV5OApg4TMi43Nsgpo9i8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="36326452"
Received: from invictus.jf.intel.com ([10.165.21.201])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 08:14:42 -0700
From: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: lucas.demarchi@intel.com,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Subject: [PATCH v3 6/6] drm/xe: Add reg read/write trace
Date: Thu, 30 May 2024 08:13:13 -0700
Message-Id: <20240530151313.2284182-7-radhakrishna.sripada@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240530151313.2284182-1-radhakrishna.sripada@intel.com>
References: <20240530151313.2284182-1-radhakrishna.sripada@intel.com>
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

v2: Fix kunit error
v3: Print devid to help in multi-gpu setup

Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c  | 22 ++++++++++++++++++----
 drivers/gpu/drm/xe/xe_trace.h | 30 ++++++++++++++++++++++++++++++
 2 files changed, 48 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 248e93ec6df7..a44baa349109 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -27,6 +27,7 @@
 #include "xe_module.h"
 #include "xe_sriov.h"
 #include "xe_tile.h"
+#include "xe_trace.h"
 
 #define XEHP_MTCFG_ADDR		XE_REG(0x101800)
 #define TILE_COUNT		REG_GENMASK(15, 8)
@@ -455,16 +456,24 @@ u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
 {
 	struct xe_tile *tile = gt_to_tile(gt);
 	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
+	u8 val;
 
-	return readb((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
+	val = readb((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
+	trace_xe_reg_rw(dev_name(gt_to_xe(gt)->drm.dev), false, addr, val, sizeof(val), true);
+
+	return val;
 }
 
 u16 xe_mmio_read16(struct xe_gt *gt, struct xe_reg reg)
 {
 	struct xe_tile *tile = gt_to_tile(gt);
 	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
+	u16 val;
+
+	val = readw((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
+	trace_xe_reg_rw(dev_name(gt_to_xe(gt)->drm.dev), false, addr, val, sizeof(val), true);
 
-	return readw((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
+	return val;
 }
 
 void xe_mmio_write32(struct xe_gt *gt, struct xe_reg reg, u32 val)
@@ -472,6 +481,7 @@ void xe_mmio_write32(struct xe_gt *gt, struct xe_reg reg, u32 val)
 	struct xe_tile *tile = gt_to_tile(gt);
 	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
 
+	trace_xe_reg_rw(dev_name(gt_to_xe(gt)->drm.dev), true, addr, val, sizeof(val), true);
 	writel(val, (reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
 }
 
@@ -479,11 +489,15 @@ u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
 {
 	struct xe_tile *tile = gt_to_tile(gt);
 	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
+	u32 val;
 
 	if (!reg.vf && IS_SRIOV_VF(gt_to_xe(gt)))
-		return xe_gt_sriov_vf_read32(gt, reg);
+		val = xe_gt_sriov_vf_read32(gt, reg);
+
+	val = readl((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
+	trace_xe_reg_rw(dev_name(gt_to_xe(gt)->drm.dev), false, addr, val, sizeof(val), true);
 
-	return readl((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
+	return val;
 }
 
 u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg reg, u32 clr, u32 set)
diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index 41e0b3365876..d56e073560ee 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -342,6 +342,36 @@ DEFINE_EVENT(xe_hw_fence, xe_hw_fence_free,
 	     TP_ARGS(fence)
 );
 
+TRACE_EVENT_CONDITION(xe_reg_rw,
+	TP_PROTO(const char *devid, bool write, u32 reg, u64 val, int len, bool trace),
+
+	TP_ARGS(devid, write, reg, val, len, trace),
+
+	TP_CONDITION(trace),
+
+	TP_STRUCT__entry(
+		__array(char, devid, 12)
+		__field(u64, val)
+		__field(u32, reg)
+		__field(u16, write)
+		__field(u16, len)
+		),
+
+	TP_fast_assign(
+		memcpy(__entry->devid, devid, 12);
+		__entry->val = (u64)val;
+		__entry->reg = reg;
+		__entry->write = write;
+		__entry->len = len;
+		),
+
+	TP_printk("dev: %s: %s reg=0x%x, len=%d, val=(0x%x, 0x%x)",
+		  __entry->devid, __entry->write ? "write" : "read",
+		  __entry->reg, __entry->len,
+		  (u32)(__entry->val & 0xffffffff),
+		  (u32)(__entry->val >> 32))
+);
+
 #endif
 
 /* This part must be outside protection */
-- 
2.34.1

