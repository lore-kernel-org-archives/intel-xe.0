Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BB77C27C6E
	for <intel-xe@archiver.kernel.org>; Fri,  7 Jun 2024 18:31:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F12A710ECEA;
	Fri,  7 Jun 2024 18:31:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OBETjSbJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8197E10ECEF
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Jun 2024 18:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717785069; x=1749321069;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vRiNC7Fn4J/+6CCDtN8qNG1mgWkJeClWGyR2flcksl8=;
 b=OBETjSbJVwjnVVncAlvJliUpziw1OpD+9FhBzmo8rbuICd5wYuebuFka
 u83drgzJ0F2S8mpT/pSqt0tQwWAbhZuEMNCN/gDv9YE44K3PqvFiWPJ5K
 OV7grG+eOPjFBU2dFw5zG2kw6zFR1lN+EwfxVH5N5DTI8800REp5BbFOZ
 wlYqUeBtVx+O6i2q10/cwoaQA9NwiZeImYs+EV2mqK/DfTBIfbhYAfUNK
 UdazlGsIC/680YRTmfbSTZ5ylSsJZmzW1dcAutoaUQyPCLaUpbUCfkAuk
 JXNzC8QVrzo0xUfM5dwHlV2iXZ/M1/61M/RcVOot4Rn0QAMv6KLADTkq8 A==;
X-CSE-ConnectionGUID: s6g09KgoR1S732GfkD7Mfg==
X-CSE-MsgGUID: HKRlr4VVT1SFa1lWGe5wEg==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="18314401"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="18314401"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 11:31:08 -0700
X-CSE-ConnectionGUID: XsltXx34Q0GAwdOeEug86A==
X-CSE-MsgGUID: cvz4mpPkQ8ihq8GBQ0IDZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="43342163"
Received: from invictus.jf.intel.com ([10.165.21.201])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 11:31:08 -0700
From: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH v6 6/6] drm/xe: Add reg read/write trace
Date: Fri,  7 Jun 2024 11:29:43 -0700
Message-Id: <20240607182943.3572524-7-radhakrishna.sripada@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240607182943.3572524-1-radhakrishna.sripada@intel.com>
References: <20240607182943.3572524-1-radhakrishna.sripada@intel.com>
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
v3: rebase and use variable sized variant to display
    dev name(Gustavo)
v4: Pass single argument to __asign_str to fix kunit error
v5: Remove unrelated include xe_tile.h and remove cast in trace

Reviewd-by: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c  | 23 +++++++++++++++++++----
 drivers/gpu/drm/xe/xe_trace.h | 28 ++++++++++++++++++++++++++++
 2 files changed, 47 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 7962eeb9adb7..f92faad4b96d 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -21,6 +21,7 @@
 #include "xe_gt_sriov_vf.h"
 #include "xe_macros.h"
 #include "xe_sriov.h"
+#include "xe_trace.h"
 
 static void tiles_fini(void *arg)
 {
@@ -124,16 +125,24 @@ u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
 {
 	struct xe_tile *tile = gt_to_tile(gt);
 	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
+	u8 val;
 
-	return readb((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
+	val = readb((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
+	trace_xe_reg_rw(gt, false, addr, val, sizeof(val));
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
+	trace_xe_reg_rw(gt, false, addr, val, sizeof(val));
 
-	return readw((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
+	return val;
 }
 
 void xe_mmio_write32(struct xe_gt *gt, struct xe_reg reg, u32 val)
@@ -141,6 +150,7 @@ void xe_mmio_write32(struct xe_gt *gt, struct xe_reg reg, u32 val)
 	struct xe_tile *tile = gt_to_tile(gt);
 	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
 
+	trace_xe_reg_rw(gt, true, addr, val, sizeof(val));
 	writel(val, (reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
 }
 
@@ -148,11 +158,16 @@ u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
 {
 	struct xe_tile *tile = gt_to_tile(gt);
 	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
+	u32 val;
 
 	if (!reg.vf && IS_SRIOV_VF(gt_to_xe(gt)))
-		return xe_gt_sriov_vf_read32(gt, reg);
+		val = xe_gt_sriov_vf_read32(gt, reg);
+	else
+		val = readl((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
+
+	trace_xe_reg_rw(gt, false, addr, val, sizeof(val));
 
-	return readl((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
+	return val;
 }
 
 u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg reg, u32 clr, u32 set)
diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index 27ba7c416405..09ca1ad057b0 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -346,6 +346,34 @@ DEFINE_EVENT(xe_hw_fence, xe_hw_fence_free,
 	     TP_ARGS(fence)
 );
 
+TRACE_EVENT(xe_reg_rw,
+	TP_PROTO(struct xe_gt *gt, bool write, u32 reg, u64 val, int len),
+
+	TP_ARGS(gt, write, reg, val, len),
+
+	TP_STRUCT__entry(
+		__string(dev, __dev_name_gt(gt))
+		__field(u64, val)
+		__field(u32, reg)
+		__field(u16, write)
+		__field(u16, len)
+		),
+
+	TP_fast_assign(
+		__assign_str(dev);
+		__entry->val = val;
+		__entry->reg = reg;
+		__entry->write = write;
+		__entry->len = len;
+		),
+
+	TP_printk("dev=%s, %s reg=0x%x, len=%d, val=(0x%x, 0x%x)",
+		  __get_str(dev), __entry->write ? "write" : "read",
+		  __entry->reg, __entry->len,
+		  (u32)(__entry->val & 0xffffffff),
+		  (u32)(__entry->val >> 32))
+);
+
 #endif
 
 /* This part must be outside protection */
-- 
2.34.1

