Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 174FEC27C65
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jun 2024 00:19:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9422B10E5FF;
	Thu,  6 Jun 2024 00:19:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rc3C80rd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCD5B10E4D1
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jun 2024 00:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717633187; x=1749169187;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cHxYEbV1SXY2kWQn7SyO21AsXU35IX46uSPL8YjScXc=;
 b=Rc3C80rd05pXc702myNrcGUzjfjAFNw0mlYiX4INHt30X3MCaeFM27Mg
 7jNP9wZZlCN1KNLu8/UmGg+5vvUsMQ+lidldVdOtU7ZlgMvOaJCgEl3K0
 C/n5u+exB6nI8RNIkY2x0WTJuJohsgeNsWBvNvJ7THefB5IF0hv9rWjaF
 gR8X7PBXG7x4qUU3mlRUQzm1kcNsPBoTsLw+SFmqFHRmBtJf3dY4zLRFo
 e9r3En0+Taeo4akFyrvoHCzVSkcwTHJqrsDSezDYNI58Ild0VjNjQ55Cz
 ezrdg+bMXX19p6HjIVNd4GNocRj1njT44F86vcgBeTB47BRC89HQn7b86 Q==;
X-CSE-ConnectionGUID: SbZ6Mm19RBqM2/E4cZD4Qg==
X-CSE-MsgGUID: HC8R8YPATum3t1oz4Nn64Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="31820041"
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; d="scan'208";a="31820041"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 17:19:46 -0700
X-CSE-ConnectionGUID: /V+ed9BwRsOLpQ5JJ1qZSw==
X-CSE-MsgGUID: J+bz0ep9RLKpay0QKoA4GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; d="scan'208";a="38328640"
Received: from invictus.jf.intel.com ([10.165.21.201])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 17:19:45 -0700
From: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: gustavo.sousa@intel.com,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Subject: [PATCH v4 6/6] drm/xe: Add reg read/write trace
Date: Wed,  5 Jun 2024 17:18:14 -0700
Message-Id: <20240606001814.3460974-7-radhakrishna.sripada@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240606001814.3460974-1-radhakrishna.sripada@intel.com>
References: <20240606001814.3460974-1-radhakrishna.sripada@intel.com>
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

Cc: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c  | 24 ++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_trace.h | 28 ++++++++++++++++++++++++++++
 2 files changed, 48 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 7962eeb9adb7..feba35ad6a3e 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -21,6 +21,8 @@
 #include "xe_gt_sriov_vf.h"
 #include "xe_macros.h"
 #include "xe_sriov.h"
+#include "xe_tile.h"
+#include "xe_trace.h"
 
 static void tiles_fini(void *arg)
 {
@@ -124,16 +126,24 @@ u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
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
@@ -141,6 +151,7 @@ void xe_mmio_write32(struct xe_gt *gt, struct xe_reg reg, u32 val)
 	struct xe_tile *tile = gt_to_tile(gt);
 	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
 
+	trace_xe_reg_rw(gt, true, addr, val, sizeof(val));
 	writel(val, (reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
 }
 
@@ -148,11 +159,16 @@ u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
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
index a22db52e88e3..be0ba5104e58 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -347,6 +347,34 @@ DEFINE_EVENT(xe_hw_fence, xe_hw_fence_free,
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
+		__assign_str(dev, __dev_name_gt(gt));
+		__entry->val = (u64)val;
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

