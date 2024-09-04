Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61357CD4842
	for <intel-xe@archiver.kernel.org>; Wed,  4 Sep 2024 00:21:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 464E810E64B;
	Wed,  4 Sep 2024 00:21:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l2jRdLg+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E6D210E63A
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Sep 2024 00:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725409275; x=1756945275;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=a8ZSiMScRF4ZvMIOC493Wv0OpDgoENGFE+4EYRl62Kw=;
 b=l2jRdLg+rXwNisV1NzxH0LT9AslSnMJmYeNRSzYvQdiqBU1fnnpPSGeD
 4s8BGkhmT/YcfIHguQ1EM3qrF+/6aWxROJi8+AV1n/BlZi3C15u+S4hni
 UnbMg/8E738EAhsfB6B/qwTJyqGymeGGUaiQgdbPtH07gTyd3featll/v
 vuGuthTdmQya1CPpv6OrhjGX4c6iGmP+E/aip3bijYRcLN94JWPVZ5yqk
 hqm/PYCYQnPJtBmAMIk9boMjxrwnjhASTACm/ozRy85Zo2bX30pVjXsT7
 8+cxsOdq87okMXQj2D62SGiihO72XSQEi69uDPEkVXsf/7Npx5K28URBM Q==;
X-CSE-ConnectionGUID: l7vY1A3JQcKy+yXYfJZgyA==
X-CSE-MsgGUID: XyKoiSmwSQ6lSunsWW6asA==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="23904796"
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; d="scan'208";a="23904796"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 17:21:15 -0700
X-CSE-ConnectionGUID: mLflW2U2SferbXOW4thjug==
X-CSE-MsgGUID: qA+D5MoyRQmfiQ0Oke3bJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; d="scan'208";a="69944221"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 17:21:14 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 09/43] drm/xe: Switch MMIO interface to take xe_mmio instead
 of xe_gt
Date: Tue,  3 Sep 2024 17:21:10 -0700
Message-ID: <20240904002100.2023834-54-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240904002100.2023834-45-matthew.d.roper@intel.com>
References: <20240904002100.2023834-45-matthew.d.roper@intel.com>
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

Since much of the MMIO register access done by the driver is to non-GT
registers, use of 'xe_gt' in these interfaces has been a long-standing
design flaw that's been hard to disentangle.

To avoid a flag day across the whole driver, munge the function names
and add temporary compatibility macros with the original function names
that can accept either the new xe_mmio or the old xe_gt structure as a
parameter.  This will allow us to slowly convert parts of the driver
over to the new interface independently.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c  | 131 ++++++++++++++++------------------
 drivers/gpu/drm/xe/xe_mmio.h  |  76 +++++++++++++++-----
 drivers/gpu/drm/xe/xe_trace.h |   6 +-
 3 files changed, 125 insertions(+), 88 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 8068663e7d28..92f0bda0ae30 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -67,16 +67,16 @@ static void mmio_multi_tile_setup(struct xe_device *xe, size_t tile_mmio_size)
 
 	/* Possibly override number of tile based on configuration register */
 	if (!xe->info.skip_mtcfg) {
-		struct xe_gt *gt = xe_root_mmio_gt(xe);
+		struct xe_mmio *mmio = xe_root_tile_mmio(xe);
 		u8 tile_count;
 		u32 mtcfg;
 
 		/*
 		 * Although the per-tile mmio regs are not yet initialized, this
-		 * is fine as it's going to the root gt, that's guaranteed to be
-		 * initialized earlier in xe_mmio_init()
+		 * is fine as it's going to the root tile's mmio, that's
+		 * guaranteed to be initialized earlier in xe_mmio_init()
 		 */
-		mtcfg = xe_mmio_read64_2x32(gt, XEHP_MTCFG_ADDR);
+		mtcfg = xe_mmio_read64_2x32(mmio, XEHP_MTCFG_ADDR);
 		tile_count = REG_FIELD_GET(TILE_COUNT, mtcfg) + 1;
 
 		if (tile_count < xe->info.tile_count) {
@@ -187,116 +187,111 @@ int xe_mmio_init(struct xe_device *xe)
 	return devm_add_action_or_reset(xe->drm.dev, mmio_fini, xe);
 }
 
-static void mmio_flush_pending_writes(struct xe_gt *gt)
+static void mmio_flush_pending_writes(struct xe_mmio *mmio)
 {
 #define DUMMY_REG_OFFSET	0x130030
-	struct xe_tile *tile = gt_to_tile(gt);
 	int i;
 
-	if (tile->xe->info.platform != XE_LUNARLAKE)
+	if (mmio->xe->info.platform != XE_LUNARLAKE)
 		return;
 
 	/* 4 dummy writes */
 	for (i = 0; i < 4; i++)
-		writel(0, tile->mmio.regs + DUMMY_REG_OFFSET);
+		writel(0, mmio->regs + DUMMY_REG_OFFSET);
 }
 
-u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
+u8 __xe_mmio_read8(struct xe_mmio *mmio, struct xe_reg reg)
 {
-	struct xe_tile *tile = gt_to_tile(gt);
-	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
+	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
 	u8 val;
 
 	/* Wa_15015404425 */
-	mmio_flush_pending_writes(gt);
+	mmio_flush_pending_writes(mmio);
 
-	val = readb((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
-	trace_xe_reg_rw(gt, false, addr, val, sizeof(val));
+	val = readb(mmio->regs + addr);
+	trace_xe_reg_rw(mmio, false, addr, val, sizeof(val));
 
 	return val;
 }
 
-u16 xe_mmio_read16(struct xe_gt *gt, struct xe_reg reg)
+u16 __xe_mmio_read16(struct xe_mmio *mmio, struct xe_reg reg)
 {
-	struct xe_tile *tile = gt_to_tile(gt);
-	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
+	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
 	u16 val;
 
 	/* Wa_15015404425 */
-	mmio_flush_pending_writes(gt);
+	mmio_flush_pending_writes(mmio);
 
-	val = readw((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
-	trace_xe_reg_rw(gt, false, addr, val, sizeof(val));
+	val = readw(mmio->regs + addr);
+	trace_xe_reg_rw(mmio, false, addr, val, sizeof(val));
 
 	return val;
 }
 
-void xe_mmio_write32(struct xe_gt *gt, struct xe_reg reg, u32 val)
+void __xe_mmio_write32(struct xe_mmio *mmio, struct xe_reg reg, u32 val)
 {
-	struct xe_tile *tile = gt_to_tile(gt);
-	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
+	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
 
-	trace_xe_reg_rw(gt, true, addr, val, sizeof(val));
+	trace_xe_reg_rw(mmio, true, addr, val, sizeof(val));
 
-	if (!reg.vf && IS_SRIOV_VF(gt_to_xe(gt)))
-		xe_gt_sriov_vf_write32(gt->mmio.sriov_vf, reg, val);
+	if (!reg.vf && mmio->sriov_vf)
+		xe_gt_sriov_vf_write32(mmio->sriov_vf, reg, val);
 	else
-		writel(val, (reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
+		writel(val, mmio->regs + addr);
 }
 
-u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
+u32 __xe_mmio_read32(struct xe_mmio *mmio, struct xe_reg reg)
 {
-	struct xe_tile *tile = gt_to_tile(gt);
-	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
+	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
 	u32 val;
 
 	/* Wa_15015404425 */
-	mmio_flush_pending_writes(gt);
+	mmio_flush_pending_writes(mmio);
 
-	if (!reg.vf && IS_SRIOV_VF(gt_to_xe(gt)))
-		val = xe_gt_sriov_vf_read32(gt->mmio.sriov_vf, reg);
+	if (!reg.vf && mmio->sriov_vf)
+		val = xe_gt_sriov_vf_read32(mmio->sriov_vf, reg);
 	else
-		val = readl((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
+		val = readl(mmio->regs + addr);
 
-	trace_xe_reg_rw(gt, false, addr, val, sizeof(val));
+	trace_xe_reg_rw(mmio, false, addr, val, sizeof(val));
 
 	return val;
 }
 
-u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg reg, u32 clr, u32 set)
+u32 __xe_mmio_rmw32(struct xe_mmio *mmio, struct xe_reg reg, u32 clr, u32 set)
 {
 	u32 old, reg_val;
 
-	old = xe_mmio_read32(gt, reg);
+	old = xe_mmio_read32(mmio, reg);
 	reg_val = (old & ~clr) | set;
-	xe_mmio_write32(gt, reg, reg_val);
+	xe_mmio_write32(mmio, reg, reg_val);
 
 	return old;
 }
 
-int xe_mmio_write32_and_verify(struct xe_gt *gt,
-			       struct xe_reg reg, u32 val, u32 mask, u32 eval)
+int __xe_mmio_write32_and_verify(struct xe_mmio *mmio,
+				 struct xe_reg reg, u32 val, u32 mask, u32 eval)
 {
 	u32 reg_val;
 
-	xe_mmio_write32(gt, reg, val);
-	reg_val = xe_mmio_read32(gt, reg);
+	xe_mmio_write32(mmio, reg, val);
+	reg_val = xe_mmio_read32(mmio, reg);
 
 	return (reg_val & mask) != eval ? -EINVAL : 0;
 }
 
-bool xe_mmio_in_range(const struct xe_gt *gt,
-		      const struct xe_mmio_range *range,
-		      struct xe_reg reg)
+bool __xe_mmio_in_range(const struct xe_mmio *mmio,
+			const struct xe_mmio_range *range,
+			struct xe_reg reg)
 {
-	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
+	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
 
 	return range && addr >= range->start && addr <= range->end;
 }
 
 /**
  * xe_mmio_read64_2x32() - Read a 64-bit register as two 32-bit reads
- * @gt: MMIO target GT
+ * @mmio: MMIO target
  * @reg: register to read value from
  *
  * Although Intel GPUs have some 64-bit registers, the hardware officially
@@ -316,21 +311,21 @@ bool xe_mmio_in_range(const struct xe_gt *gt,
  *
  * Returns the value of the 64-bit register.
  */
-u64 xe_mmio_read64_2x32(struct xe_gt *gt, struct xe_reg reg)
+u64 __xe_mmio_read64_2x32(struct xe_mmio *mmio, struct xe_reg reg)
 {
 	struct xe_reg reg_udw = { .addr = reg.addr + 0x4 };
 	u32 ldw, udw, oldudw, retries;
 
-	reg.addr = xe_mmio_adjusted_addr(gt, reg.addr);
-	reg_udw.addr = xe_mmio_adjusted_addr(gt, reg_udw.addr);
+	reg.addr = xe_mmio_adjusted_addr(mmio, reg.addr);
+	reg_udw.addr = xe_mmio_adjusted_addr(mmio, reg_udw.addr);
 
 	/* we shouldn't adjust just one register address */
-	xe_gt_assert(gt, reg_udw.addr == reg.addr + 0x4);
+	xe_assert(mmio->xe, reg_udw.addr == reg.addr + 0x4);
 
-	oldudw = xe_mmio_read32(gt, reg_udw);
+	oldudw = xe_mmio_read32(mmio, reg_udw);
 	for (retries = 5; retries; --retries) {
-		ldw = xe_mmio_read32(gt, reg);
-		udw = xe_mmio_read32(gt, reg_udw);
+		ldw = xe_mmio_read32(mmio, reg);
+		udw = xe_mmio_read32(mmio, reg_udw);
 
 		if (udw == oldudw)
 			break;
@@ -338,14 +333,14 @@ u64 xe_mmio_read64_2x32(struct xe_gt *gt, struct xe_reg reg)
 		oldudw = udw;
 	}
 
-	xe_gt_WARN(gt, retries == 0,
-		   "64-bit read of %#x did not stabilize\n", reg.addr);
+	drm_WARN(&mmio->xe->drm, retries == 0,
+		 "64-bit read of %#x did not stabilize\n", reg.addr);
 
 	return (u64)udw << 32 | ldw;
 }
 
-static int __xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 mask, u32 val, u32 timeout_us,
-			    u32 *out_val, bool atomic, bool expect_match)
+static int ____xe_mmio_wait32(struct xe_mmio *mmio, struct xe_reg reg, u32 mask, u32 val, u32 timeout_us,
+			      u32 *out_val, bool atomic, bool expect_match)
 {
 	ktime_t cur = ktime_get_raw();
 	const ktime_t end = ktime_add_us(cur, timeout_us);
@@ -355,7 +350,7 @@ static int __xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 mask, u32 v
 	bool check;
 
 	for (;;) {
-		read = xe_mmio_read32(gt, reg);
+		read = xe_mmio_read32(mmio, reg);
 
 		check = (read & mask) == val;
 		if (!expect_match)
@@ -381,7 +376,7 @@ static int __xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 mask, u32 v
 	}
 
 	if (ret != 0) {
-		read = xe_mmio_read32(gt, reg);
+		read = xe_mmio_read32(mmio, reg);
 
 		check = (read & mask) == val;
 		if (!expect_match)
@@ -399,7 +394,7 @@ static int __xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 mask, u32 v
 
 /**
  * xe_mmio_wait32() - Wait for a register to match the desired masked value
- * @gt: MMIO target GT
+ * @mmio: MMIO target
  * @reg: register to read value from
  * @mask: mask to be applied to the value read from the register
  * @val: desired value after applying the mask
@@ -416,15 +411,15 @@ static int __xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 mask, u32 v
  * @timeout_us for different reasons, specially in non-atomic contexts. Thus,
  * it is possible that this function succeeds even after @timeout_us has passed.
  */
-int xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 mask, u32 val, u32 timeout_us,
-		   u32 *out_val, bool atomic)
+int __xe_mmio_wait32(struct xe_mmio *mmio, struct xe_reg reg, u32 mask, u32 val, u32 timeout_us,
+		     u32 *out_val, bool atomic)
 {
-	return __xe_mmio_wait32(gt, reg, mask, val, timeout_us, out_val, atomic, true);
+	return ____xe_mmio_wait32(mmio, reg, mask, val, timeout_us, out_val, atomic, true);
 }
 
 /**
  * xe_mmio_wait32_not() - Wait for a register to return anything other than the given masked value
- * @gt: MMIO target GT
+ * @mmio: MMIO target
  * @reg: register to read value from
  * @mask: mask to be applied to the value read from the register
  * @val: value not to be matched after applying the mask
@@ -435,8 +430,8 @@ int xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 mask, u32 val, u32 t
  * This function works exactly like xe_mmio_wait32() with the exception that
  * @val is expected not to be matched.
  */
-int xe_mmio_wait32_not(struct xe_gt *gt, struct xe_reg reg, u32 mask, u32 val, u32 timeout_us,
-		       u32 *out_val, bool atomic)
+int __xe_mmio_wait32_not(struct xe_mmio *mmio, struct xe_reg reg, u32 mask, u32 val, u32 timeout_us,
+			 u32 *out_val, bool atomic)
 {
-	return __xe_mmio_wait32(gt, reg, mask, val, timeout_us, out_val, atomic, false);
+	return ____xe_mmio_wait32(mmio, reg, mask, val, timeout_us, out_val, atomic, false);
 }
diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
index 26551410ecc8..ac6846447c52 100644
--- a/drivers/gpu/drm/xe/xe_mmio.h
+++ b/drivers/gpu/drm/xe/xe_mmio.h
@@ -14,25 +14,67 @@ struct xe_reg;
 int xe_mmio_init(struct xe_device *xe);
 int xe_mmio_probe_tiles(struct xe_device *xe);
 
-u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg);
-u16 xe_mmio_read16(struct xe_gt *gt, struct xe_reg reg);
-void xe_mmio_write32(struct xe_gt *gt, struct xe_reg reg, u32 val);
-u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg);
-u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg reg, u32 clr, u32 set);
-int xe_mmio_write32_and_verify(struct xe_gt *gt, struct xe_reg reg, u32 val, u32 mask, u32 eval);
-bool xe_mmio_in_range(const struct xe_gt *gt, const struct xe_mmio_range *range, struct xe_reg reg);
-
-u64 xe_mmio_read64_2x32(struct xe_gt *gt, struct xe_reg reg);
-int xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 mask, u32 val, u32 timeout_us,
-		   u32 *out_val, bool atomic);
-int xe_mmio_wait32_not(struct xe_gt *gt, struct xe_reg reg, u32 mask, u32 val, u32 timeout_us,
-		       u32 *out_val, bool atomic);
-
-static inline u32 xe_mmio_adjusted_addr(const struct xe_gt *gt, u32 addr)
+/*
+ * Temporary transition helper for xe_gt -> xe_mmio conversion.  Allows
+ * continued usage of xe_gt as a parameter to MMIO operations which now
+ * take an xe_mmio structure instead.  Will be removed once the driver-wide
+ * conversion is complete.
+ */
+#define __to_xe_mmio(ptr) \
+	_Generic(ptr, \
+		 const struct xe_gt *: (&((const struct xe_gt *)(ptr))->mmio), \
+		 struct xe_gt *: (&((struct xe_gt *)(ptr))->mmio), \
+		 const struct xe_mmio *: (ptr), \
+		 struct xe_mmio *: (ptr))
+
+u8 __xe_mmio_read8(struct xe_mmio *mmio, struct xe_reg reg);
+#define xe_mmio_read8(p, reg) __xe_mmio_read8(__to_xe_mmio(p), reg)
+
+u16 __xe_mmio_read16(struct xe_mmio *mmio, struct xe_reg reg);
+#define xe_mmio_read16(p, reg) __xe_mmio_read16(__to_xe_mmio(p), reg)
+
+void __xe_mmio_write32(struct xe_mmio *mmio, struct xe_reg reg, u32 val);
+#define xe_mmio_write32(p, reg, val) __xe_mmio_write32(__to_xe_mmio(p), reg, val)
+
+u32 __xe_mmio_read32(struct xe_mmio *mmio, struct xe_reg reg);
+#define xe_mmio_read32(p, reg) __xe_mmio_read32(__to_xe_mmio(p), reg)
+
+u32 __xe_mmio_rmw32(struct xe_mmio *mmio, struct xe_reg reg, u32 clr, u32 set);
+#define xe_mmio_rmw32(p, reg, clr, set) __xe_mmio_rmw32(__to_xe_mmio(p), reg, clr, set)
+
+int __xe_mmio_write32_and_verify(struct xe_mmio *mmio, struct xe_reg reg,
+				 u32 val, u32 mask, u32 eval);
+#define xe_mmio_write32_and_verify(p, reg, val, mask, eval) \
+	__xe_mmio_write32_and_verify(__to_xe_mmio(p), reg, val, mask, eval)
+
+bool __xe_mmio_in_range(const struct xe_mmio *mmio,
+			const struct xe_mmio_range *range, struct xe_reg reg);
+#define xe_mmio_in_range(p, range, reg) __xe_mmio_in_range(__to_xe_mmio(p), range, reg)
+
+u64 __xe_mmio_read64_2x32(struct xe_mmio *mmio, struct xe_reg reg);
+#define xe_mmio_read64_2x32(p, reg) __xe_mmio_read64_2x32(__to_xe_mmio(p), reg)
+
+int __xe_mmio_wait32(struct xe_mmio *mmio, struct xe_reg reg, u32 mask, u32 val,
+		     u32 timeout_us, u32 *out_val, bool atomic);
+#define xe_mmio_wait32(p, reg, mask, val, timeout_us, out_val, atomic) \
+	__xe_mmio_wait32(__to_xe_mmio(p), reg, mask, val, timeout_us, out_val, atomic)
+
+int __xe_mmio_wait32_not(struct xe_mmio *mmio, struct xe_reg reg, u32 mask,
+			 u32 val, u32 timeout_us, u32 *out_val, bool atomic);
+#define xe_mmio_wait32_not(p, reg, mask, val, timeout_us, out_val, atomic) \
+	__xe_mmio_wait32_not(__to_xe_mmio(p), reg, mask, val, timeout_us, out_val, atomic)
+
+static inline u32 __xe_mmio_adjusted_addr(const struct xe_mmio *mmio, u32 addr)
 {
-	if (addr < gt->mmio.adj_limit)
-		addr += gt->mmio.adj_offset;
+	if (addr < mmio->adj_limit)
+		addr += mmio->adj_offset;
 	return addr;
 }
+#define xe_mmio_adjusted_addr(p, addr) __xe_mmio_adjusted_addr(__to_xe_mmio(p), addr)
+
+static inline struct xe_mmio *xe_root_tile_mmio(struct xe_device *xe)
+{
+	return &xe->tiles[0].mmio;
+}
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index 8573d7a87d84..d323873dda20 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -342,12 +342,12 @@ DEFINE_EVENT(xe_hw_fence, xe_hw_fence_try_signal,
 );
 
 TRACE_EVENT(xe_reg_rw,
-	TP_PROTO(struct xe_gt *gt, bool write, u32 reg, u64 val, int len),
+	TP_PROTO(struct xe_mmio *mmio, bool write, u32 reg, u64 val, int len),
 
-	TP_ARGS(gt, write, reg, val, len),
+	TP_ARGS(mmio, write, reg, val, len),
 
 	TP_STRUCT__entry(
-		__string(dev, __dev_name_gt(gt))
+		__string(dev, __dev_name_xe(mmio->xe))
 		__field(u64, val)
 		__field(u32, reg)
 		__field(u16, write)
-- 
2.45.2

