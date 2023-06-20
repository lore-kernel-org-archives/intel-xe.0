Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FCDBEB64D7
	for <intel-xe@archiver.kernel.org>; Tue, 20 Jun 2023 19:35:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24DDD10E383;
	Tue, 20 Jun 2023 19:35:10 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8BF610E37F
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Jun 2023 19:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687289705; x=1718825705;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1BoWcT9pM6nwBb8cIPdIG0IWnDt3oibA9haEHG08K24=;
 b=nERD9V1GNyzYEmd8CQ6jGUZIS2HW/Q0UKImlkc723UHCBoWhOeo2iTbv
 YNiurrj36nJRfpw06bHO31cgqhj8xGa6vWQxmX8oivFEIo/euPtwl9bpT
 5D88UhJ7WqjwPs0tzYIC+UADe6kkV4riGnc/dmUHtgsjdib+APFU17Rak
 YdYIiPH1QWCnL6pQYKFyGzc+SjUApUUjK/D4qzYOLfcYegy5nOgQlThrC
 Ggy3PAJUVIZNzAHn7ggBSDQH6fFHQSOnkWGAKXifmm7yBLa7CGIQVyZuE
 8L3mUCTVDpQhvHcBjkwxnGOcF5yGm3kTO9Zs5Tb3MDl/YeM0XnKEe0pgZ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="339579531"
X-IronPort-AV: E=Sophos;i="6.00,258,1681196400"; d="scan'208";a="339579531"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2023 12:35:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="858706277"
X-IronPort-AV: E=Sophos;i="6.00,258,1681196400"; d="scan'208";a="858706277"
Received: from invictus.jf.intel.com ([10.165.21.201])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2023 12:35:04 -0700
From: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 20 Jun 2023 12:32:29 -0700
Message-Id: <20230620193229.1698372-3-radhakrishna.sripada@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230620193229.1698372-1-radhakrishna.sripada@intel.com>
References: <20230620193229.1698372-1-radhakrishna.sripada@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 2/2] drm/xe: Add reg read/write trace
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This will help debug register read/writes and provide
a way to trace all the mmio transactions.

In order to avoid spam from xe_mmio_wait32,
xe_mmio_read32_notrace is introduced and used.

v2: Do not use inline for the function declarations.(MattR)

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
---
 .../drm/xe/compat-i915-headers/intel_uncore.h |  8 +-
 drivers/gpu/drm/xe/xe_mmio.c                  | 80 ++++++++++++++++++-
 drivers/gpu/drm/xe/xe_mmio.h                  |  5 ++
 drivers/gpu/drm/xe/xe_trace.h                 | 26 ++++++
 4 files changed, 111 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
index fae6213d26f1..036f3b963a84 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
@@ -113,7 +113,7 @@ static inline u32 intel_uncore_read_fw(struct fake_uncore *uncore,
 {
 	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
 
-	return xe_mmio_read32(__fake_uncore_to_gt(uncore), reg);
+	return xe_mmio_read32_notrace(__fake_uncore_to_gt(uncore), reg);
 }
 
 static inline void intel_uncore_write_fw(struct fake_uncore *uncore,
@@ -121,7 +121,7 @@ static inline void intel_uncore_write_fw(struct fake_uncore *uncore,
 {
 	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
 
-	xe_mmio_write32(__fake_uncore_to_gt(uncore), reg, val);
+	xe_mmio_write32_notrace(__fake_uncore_to_gt(uncore), reg, val);
 }
 
 static inline u32 intel_uncore_read_notrace(struct fake_uncore *uncore,
@@ -129,7 +129,7 @@ static inline u32 intel_uncore_read_notrace(struct fake_uncore *uncore,
 {
 	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
 
-	return xe_mmio_read32(__fake_uncore_to_gt(uncore), reg);
+	return xe_mmio_read32_notrace(__fake_uncore_to_gt(uncore), reg);
 }
 
 static inline void intel_uncore_write_notrace(struct fake_uncore *uncore,
@@ -137,7 +137,7 @@ static inline void intel_uncore_write_notrace(struct fake_uncore *uncore,
 {
 	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
 
-	xe_mmio_write32(__fake_uncore_to_gt(uncore), reg, val);
+	xe_mmio_write32_notrace(__fake_uncore_to_gt(uncore), reg, val);
 }
 
 #endif /* __INTEL_UNCORE_H__ */
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 78c7f839f783..ef2192a2d060 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -19,6 +19,7 @@
 #include "xe_gt_mcr.h"
 #include "xe_macros.h"
 #include "xe_module.h"
+#include "xe_trace.h"
 
 #define XEHP_MTCFG_ADDR		XE_REG(0x101800)
 #define TILE_COUNT		REG_GENMASK(15, 8)
@@ -429,7 +430,7 @@ static const struct xe_reg mmio_read_whitelist[] = {
 	RING_TIMESTAMP(RENDER_RING_BASE),
 };
 
-u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
+u8 xe_mmio_read8_notrace(struct xe_gt *gt, struct xe_reg reg)
 {
 	struct xe_tile *tile = gt_to_tile(gt);
 
@@ -439,6 +440,31 @@ u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
 	return readb(tile->mmio.regs + reg.addr);
 }
 
+u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
+{
+	struct xe_tile *tile = gt_to_tile(gt);
+	u8 val;
+
+	if (reg.addr < gt->mmio.adj_limit)
+		reg.addr += gt->mmio.adj_offset;
+
+	val = readb(tile->mmio.regs + reg.addr);
+
+	trace_xe_reg_rw(false, &reg, val, sizeof(val));
+
+	return val;
+}
+
+void xe_mmio_write32_notrace(struct xe_gt *gt, struct xe_reg reg, u32 val)
+{
+	struct xe_tile *tile = gt_to_tile(gt);
+
+	if (reg.addr < gt->mmio.adj_limit)
+		reg.addr += gt->mmio.adj_offset;
+
+	writel(val, tile->mmio.regs + reg.addr);
+}
+
 void xe_mmio_write32(struct xe_gt *gt, struct xe_reg reg, u32 val)
 {
 	struct xe_tile *tile = gt_to_tile(gt);
@@ -446,10 +472,12 @@ void xe_mmio_write32(struct xe_gt *gt, struct xe_reg reg, u32 val)
 	if (reg.addr < gt->mmio.adj_limit)
 		reg.addr += gt->mmio.adj_offset;
 
+	trace_xe_reg_rw(true, &reg, val, sizeof(val));
+
 	writel(val, tile->mmio.regs + reg.addr);
 }
 
-u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
+u32 xe_mmio_read32_notrace(struct xe_gt *gt, struct xe_reg reg)
 {
 	struct xe_tile *tile = gt_to_tile(gt);
 
@@ -459,6 +487,21 @@ u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
 	return readl(tile->mmio.regs + reg.addr);
 }
 
+u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
+{
+	struct xe_tile *tile = gt_to_tile(gt);
+	u32 val;
+
+	if (reg.addr < gt->mmio.adj_limit)
+		reg.addr += gt->mmio.adj_offset;
+
+	val = readl(tile->mmio.regs + reg.addr);
+
+	trace_xe_reg_rw(false, &reg, val, sizeof(val));
+
+	return val;
+}
+
 u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg reg, u32 clr, u32 set)
 {
 	u32 old, reg_val;
@@ -470,6 +513,16 @@ u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg reg, u32 clr, u32 set)
 	return old;
 }
 
+void xe_mmio_write64_notrace(struct xe_gt *gt, struct xe_reg reg, u64 val)
+{
+	struct xe_tile *tile = gt_to_tile(gt);
+
+	if (reg.addr < gt->mmio.adj_limit)
+		reg.addr += gt->mmio.adj_offset;
+
+	writeq(val, tile->mmio.regs + reg.addr);
+}
+
 void xe_mmio_write64(struct xe_gt *gt, struct xe_reg reg, u64 val)
 {
 	struct xe_tile *tile = gt_to_tile(gt);
@@ -477,10 +530,12 @@ void xe_mmio_write64(struct xe_gt *gt, struct xe_reg reg, u64 val)
 	if (reg.addr < gt->mmio.adj_limit)
 		reg.addr += gt->mmio.adj_offset;
 
+	trace_xe_reg_rw(true, &reg, val, sizeof(val));
+
 	writeq(val, tile->mmio.regs + reg.addr);
 }
 
-u64 xe_mmio_read64(struct xe_gt *gt, struct xe_reg reg)
+u64 xe_mmio_read64_notrace(struct xe_gt *gt, struct xe_reg reg)
 {
 	struct xe_tile *tile = gt_to_tile(gt);
 
@@ -490,6 +545,21 @@ u64 xe_mmio_read64(struct xe_gt *gt, struct xe_reg reg)
 	return readq(tile->mmio.regs + reg.addr);
 }
 
+u64 xe_mmio_read64(struct xe_gt *gt, struct xe_reg reg)
+{
+	struct xe_tile *tile = gt_to_tile(gt);
+	u64 val;
+
+	if (reg.addr < gt->mmio.adj_limit)
+		reg.addr += gt->mmio.adj_offset;
+
+	val = readq(tile->mmio.regs + reg.addr);
+
+	trace_xe_reg_rw(false, &reg, val, sizeof(val));
+
+	return val;
+}
+
 int xe_mmio_write32_and_verify(struct xe_gt *gt, struct xe_reg reg, u32 val,
 			       u32 mask, u32 eval)
 {
@@ -511,7 +581,7 @@ int xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 val, u32 mask,
 	u32 read;
 
 	for (;;) {
-		read = xe_mmio_read32(gt, reg);
+		read = xe_mmio_read32_notrace(gt, reg);
 		if ((read & mask) == val) {
 			ret = 0;
 			break;
@@ -531,6 +601,8 @@ int xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 val, u32 mask,
 		wait <<= 1;
 	}
 
+	trace_xe_reg_rw(false, &reg, read, sizeof(read));
+
 	if (out_val)
 		*out_val = read;
 
diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
index c06fcac2cc5b..02364ba9dda2 100644
--- a/drivers/gpu/drm/xe/xe_mmio.h
+++ b/drivers/gpu/drm/xe/xe_mmio.h
@@ -20,11 +20,16 @@ struct xe_device;
 #define GEN12_LMEM_BAR		2
 
 int xe_mmio_init(struct xe_device *xe);
+u8 xe_mmio_read8_notrace(struct xe_gt *gt, struct xe_reg reg);
 u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg);
+void xe_mmio_write32_notrace(struct xe_gt *gt, struct xe_reg reg, u32 val);
 void xe_mmio_write32(struct xe_gt *gt, struct xe_reg reg, u32 val);
+u32 xe_mmio_read32_notrace(struct xe_gt *gt, struct xe_reg reg);
 u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg);
 u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg reg, u32 clr, u32 set);
+void xe_mmio_write64_notrace(struct xe_gt *gt, struct xe_reg reg, u64 val);
 void xe_mmio_write64(struct xe_gt *gt, struct xe_reg reg, u64 val);
+u64 xe_mmio_read64_notrace(struct xe_gt *gt, struct xe_reg reg);
 u64 xe_mmio_read64(struct xe_gt *gt, struct xe_reg reg);
 int xe_mmio_write32_and_verify(struct xe_gt *gt, struct xe_reg reg, u32 val,
 			       u32 mask, u32 eval);
diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index 2f8eb7ebe9a7..a5d514c190a2 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -12,6 +12,7 @@
 #include <linux/tracepoint.h>
 #include <linux/types.h>
 
+#include "regs/xe_reg_defs.h"
 #include "xe_bo_types.h"
 #include "xe_engine_types.h"
 #include "xe_gt_tlb_invalidation_types.h"
@@ -507,6 +508,31 @@ DEFINE_EVENT(xe_vm, xe_vm_rebind_worker_exit,
 	     TP_ARGS(vm)
 );
 
+TRACE_EVENT(xe_reg_rw,
+	    TP_PROTO(bool write, struct xe_reg *reg, u64 val, int len),
+	    TP_ARGS(write, reg, val, len),
+
+	    TP_STRUCT__entry(
+		    __field(u64, val)
+		    __field(struct xe_reg *, reg)
+		    __field(u16, write)
+		    __field(u16, len)
+		    ),
+
+	    TP_fast_assign(
+		   __entry->val = (u64)val;
+		   __entry->reg = reg;
+		   __entry->write = write;
+		   __entry->len = len;
+		),
+
+	    TP_printk("%s reg=0x%x, len=%d, val=(0x%x, 0x%x)",
+		      __entry->write ? "write" : "read",
+		      __entry->reg->addr, __entry->len,
+		      (u32)(__entry->val & 0xffffffff),
+		      (u32)(__entry->val >> 32))
+);
+
 TRACE_EVENT(xe_guc_ct_h2g_flow_control,
 	    TP_PROTO(u32 _head, u32 _tail, u32 size, u32 space, u32 len),
 	    TP_ARGS(_head, _tail, size, space, len),
-- 
2.34.1

