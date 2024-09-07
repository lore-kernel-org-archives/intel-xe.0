Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A345E6FE4D
	for <intel-xe@archiver.kernel.org>; Sat,  7 Sep 2024 00:08:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E762610EB2B;
	Sat,  7 Sep 2024 00:08:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y5nUpahg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7B7910EB3D
 for <intel-xe@lists.freedesktop.org>; Sat,  7 Sep 2024 00:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725667679; x=1757203679;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=e61VtFrMXSnn2m9bVAuf8t2plyJg6ccEbyAtRwNxx+k=;
 b=Y5nUpahgVUSnuaFXmjLM2hmwiTgCATaQ0NthwRHprBBmGM5SFGfWyOu5
 JZ82CVXooKeufNwiPiscSYVe8CBgcEachxYWtfFKqbhRrmp4Ub1wCdTD9
 jzX19ib5/rucOoWmo/Lkeo/lfxUFEP9cpScyTcYREDbUR6e7l3XPNn6oy
 wNueqtUlFuRph+BnBrd2PHDmu+1wu9m3JS6qCu0AB0bIiRGETbA+UhuJX
 gaAK3wq3ntO35w6NmUBXku9f4HXCBp2NPIgd8jggV6bVLvTdS0wtFmd8u
 cvzShfjJ/hJvRYRrW4dogx6isd2i5Ck4uGwH4C7mWcI7Z69xmZEyGa5R1 g==;
X-CSE-ConnectionGUID: fw3iVfjrT6uDdiKFo56/wQ==
X-CSE-MsgGUID: uOZl1BUaR4qBMAFfEIx+xQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="49855333"
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="49855333"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 17:07:55 -0700
X-CSE-ConnectionGUID: HgDUqB/9Sg2CqfLVBaUVcw==
X-CSE-MsgGUID: jUd4VrOBSWOk5eNDLQZlQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="65792748"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 17:07:55 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH v2 43/43] drm/xe/mmio: Drop compatibility macros
Date: Fri,  6 Sep 2024 17:08:32 -0700
Message-ID: <20240907000748.2614020-88-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240907000748.2614020-45-matthew.d.roper@intel.com>
References: <20240907000748.2614020-45-matthew.d.roper@intel.com>
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

Now that all parts of the driver have switched over to using xe_mmio for
direct register access, we can drop the compatibility macros that allow
continued xe_gt usage.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c | 30 ++++++++++-----------
 drivers/gpu/drm/xe/xe_mmio.h | 52 +++++++-----------------------------
 2 files changed, 25 insertions(+), 57 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index ccf53a7840d9..160307e3a2a4 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -228,7 +228,7 @@ u16 xe_mmio_read16(struct xe_mmio *mmio, struct xe_reg reg)
 	return val;
 }
 
-void __xe_mmio_write32(struct xe_mmio *mmio, struct xe_reg reg, u32 val)
+void xe_mmio_write32(struct xe_mmio *mmio, struct xe_reg reg, u32 val)
 {
 	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
 
@@ -240,7 +240,7 @@ void __xe_mmio_write32(struct xe_mmio *mmio, struct xe_reg reg, u32 val)
 		writel(val, mmio->regs + addr);
 }
 
-u32 __xe_mmio_read32(struct xe_mmio *mmio, struct xe_reg reg)
+u32 xe_mmio_read32(struct xe_mmio *mmio, struct xe_reg reg)
 {
 	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
 	u32 val;
@@ -258,7 +258,7 @@ u32 __xe_mmio_read32(struct xe_mmio *mmio, struct xe_reg reg)
 	return val;
 }
 
-u32 __xe_mmio_rmw32(struct xe_mmio *mmio, struct xe_reg reg, u32 clr, u32 set)
+u32 xe_mmio_rmw32(struct xe_mmio *mmio, struct xe_reg reg, u32 clr, u32 set)
 {
 	u32 old, reg_val;
 
@@ -269,8 +269,8 @@ u32 __xe_mmio_rmw32(struct xe_mmio *mmio, struct xe_reg reg, u32 clr, u32 set)
 	return old;
 }
 
-int __xe_mmio_write32_and_verify(struct xe_mmio *mmio,
-				 struct xe_reg reg, u32 val, u32 mask, u32 eval)
+int xe_mmio_write32_and_verify(struct xe_mmio *mmio,
+			       struct xe_reg reg, u32 val, u32 mask, u32 eval)
 {
 	u32 reg_val;
 
@@ -280,9 +280,9 @@ int __xe_mmio_write32_and_verify(struct xe_mmio *mmio,
 	return (reg_val & mask) != eval ? -EINVAL : 0;
 }
 
-bool __xe_mmio_in_range(const struct xe_mmio *mmio,
-			const struct xe_mmio_range *range,
-			struct xe_reg reg)
+bool xe_mmio_in_range(const struct xe_mmio *mmio,
+		      const struct xe_mmio_range *range,
+		      struct xe_reg reg)
 {
 	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
 
@@ -311,7 +311,7 @@ bool __xe_mmio_in_range(const struct xe_mmio *mmio,
  *
  * Returns the value of the 64-bit register.
  */
-u64 __xe_mmio_read64_2x32(struct xe_mmio *mmio, struct xe_reg reg)
+u64 xe_mmio_read64_2x32(struct xe_mmio *mmio, struct xe_reg reg)
 {
 	struct xe_reg reg_udw = { .addr = reg.addr + 0x4 };
 	u32 ldw, udw, oldudw, retries;
@@ -339,8 +339,8 @@ u64 __xe_mmio_read64_2x32(struct xe_mmio *mmio, struct xe_reg reg)
 	return (u64)udw << 32 | ldw;
 }
 
-static int ____xe_mmio_wait32(struct xe_mmio *mmio, struct xe_reg reg, u32 mask, u32 val, u32 timeout_us,
-			      u32 *out_val, bool atomic, bool expect_match)
+static int __xe_mmio_wait32(struct xe_mmio *mmio, struct xe_reg reg, u32 mask, u32 val, u32 timeout_us,
+			    u32 *out_val, bool atomic, bool expect_match)
 {
 	ktime_t cur = ktime_get_raw();
 	const ktime_t end = ktime_add_us(cur, timeout_us);
@@ -411,10 +411,10 @@ static int ____xe_mmio_wait32(struct xe_mmio *mmio, struct xe_reg reg, u32 mask,
  * @timeout_us for different reasons, specially in non-atomic contexts. Thus,
  * it is possible that this function succeeds even after @timeout_us has passed.
  */
-int __xe_mmio_wait32(struct xe_mmio *mmio, struct xe_reg reg, u32 mask, u32 val, u32 timeout_us,
-		     u32 *out_val, bool atomic)
+int xe_mmio_wait32(struct xe_mmio *mmio, struct xe_reg reg, u32 mask, u32 val, u32 timeout_us,
+		   u32 *out_val, bool atomic)
 {
-	return ____xe_mmio_wait32(mmio, reg, mask, val, timeout_us, out_val, atomic, true);
+	return __xe_mmio_wait32(mmio, reg, mask, val, timeout_us, out_val, atomic, true);
 }
 
 /**
@@ -433,5 +433,5 @@ int __xe_mmio_wait32(struct xe_mmio *mmio, struct xe_reg reg, u32 mask, u32 val,
 int xe_mmio_wait32_not(struct xe_mmio *mmio, struct xe_reg reg, u32 mask, u32 val, u32 timeout_us,
 		       u32 *out_val, bool atomic)
 {
-	return ____xe_mmio_wait32(mmio, reg, mask, val, timeout_us, out_val, atomic, false);
+	return __xe_mmio_wait32(mmio, reg, mask, val, timeout_us, out_val, atomic, false);
 }
diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
index 2e97dc811d82..8a46f4006a84 100644
--- a/drivers/gpu/drm/xe/xe_mmio.h
+++ b/drivers/gpu/drm/xe/xe_mmio.h
@@ -14,58 +14,26 @@ struct xe_reg;
 int xe_mmio_init(struct xe_device *xe);
 int xe_mmio_probe_tiles(struct xe_device *xe);
 
-/*
- * Temporary transition helper for xe_gt -> xe_mmio conversion.  Allows
- * continued usage of xe_gt as a parameter to MMIO operations which now
- * take an xe_mmio structure instead.  Will be removed once the driver-wide
- * conversion is complete.
- */
-#define __to_xe_mmio(ptr) \
-	_Generic(ptr, \
-		 const struct xe_gt *: (&((const struct xe_gt *)(ptr))->mmio), \
-		 struct xe_gt *: (&((struct xe_gt *)(ptr))->mmio), \
-		 const struct xe_mmio *: (ptr), \
-		 struct xe_mmio *: (ptr))
-
 u8 xe_mmio_read8(struct xe_mmio *mmio, struct xe_reg reg);
 u16 xe_mmio_read16(struct xe_mmio *mmio, struct xe_reg reg);
-
-void __xe_mmio_write32(struct xe_mmio *mmio, struct xe_reg reg, u32 val);
-#define xe_mmio_write32(p, reg, val) __xe_mmio_write32(__to_xe_mmio(p), reg, val)
-
-u32 __xe_mmio_read32(struct xe_mmio *mmio, struct xe_reg reg);
-#define xe_mmio_read32(p, reg) __xe_mmio_read32(__to_xe_mmio(p), reg)
-
-u32 __xe_mmio_rmw32(struct xe_mmio *mmio, struct xe_reg reg, u32 clr, u32 set);
-#define xe_mmio_rmw32(p, reg, clr, set) __xe_mmio_rmw32(__to_xe_mmio(p), reg, clr, set)
-
-int __xe_mmio_write32_and_verify(struct xe_mmio *mmio, struct xe_reg reg,
-				 u32 val, u32 mask, u32 eval);
-#define xe_mmio_write32_and_verify(p, reg, val, mask, eval) \
-	__xe_mmio_write32_and_verify(__to_xe_mmio(p), reg, val, mask, eval)
-
-bool __xe_mmio_in_range(const struct xe_mmio *mmio,
-			const struct xe_mmio_range *range, struct xe_reg reg);
-#define xe_mmio_in_range(p, range, reg) __xe_mmio_in_range(__to_xe_mmio(p), range, reg)
-
-u64 __xe_mmio_read64_2x32(struct xe_mmio *mmio, struct xe_reg reg);
-#define xe_mmio_read64_2x32(p, reg) __xe_mmio_read64_2x32(__to_xe_mmio(p), reg)
-
-int __xe_mmio_wait32(struct xe_mmio *mmio, struct xe_reg reg, u32 mask, u32 val,
-		     u32 timeout_us, u32 *out_val, bool atomic);
-#define xe_mmio_wait32(p, reg, mask, val, timeout_us, out_val, atomic) \
-	__xe_mmio_wait32(__to_xe_mmio(p), reg, mask, val, timeout_us, out_val, atomic)
-
+void xe_mmio_write32(struct xe_mmio *mmio, struct xe_reg reg, u32 val);
+u32 xe_mmio_read32(struct xe_mmio *mmio, struct xe_reg reg);
+u32 xe_mmio_rmw32(struct xe_mmio *mmio, struct xe_reg reg, u32 clr, u32 set);
+int xe_mmio_write32_and_verify(struct xe_mmio *mmio, struct xe_reg reg, u32 val, u32 mask, u32 eval);
+bool xe_mmio_in_range(const struct xe_mmio *mmio, const struct xe_mmio_range *range, struct xe_reg reg);
+
+u64 xe_mmio_read64_2x32(struct xe_mmio *mmio, struct xe_reg reg);
+int xe_mmio_wait32(struct xe_mmio *mmio, struct xe_reg reg, u32 mask, u32 val,
+		   u32 timeout_us, u32 *out_val, bool atomic);
 int xe_mmio_wait32_not(struct xe_mmio *mmio, struct xe_reg reg, u32 mask,
 		       u32 val, u32 timeout_us, u32 *out_val, bool atomic);
 
-static inline u32 __xe_mmio_adjusted_addr(const struct xe_mmio *mmio, u32 addr)
+static inline u32 xe_mmio_adjusted_addr(const struct xe_mmio *mmio, u32 addr)
 {
 	if (addr < mmio->adj_limit)
 		addr += mmio->adj_offset;
 	return addr;
 }
-#define xe_mmio_adjusted_addr(p, addr) __xe_mmio_adjusted_addr(__to_xe_mmio(p), addr)
 
 static inline struct xe_mmio *xe_root_tile_mmio(struct xe_device *xe)
 {
-- 
2.45.2

