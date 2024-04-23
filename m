Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B890FC18E72
	for <intel-xe@archiver.kernel.org>; Tue, 23 Apr 2024 18:04:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 790BA113562;
	Tue, 23 Apr 2024 18:04:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dUBKBLYd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2213B113560
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Apr 2024 18:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713895492; x=1745431492;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SeLuBehbIZjLRizDwabw+CT9vf4zsDvrKZHzKsDhG1A=;
 b=dUBKBLYd5AbKqh3blYfMiwt0Z6j40hqBjffMYs/aQjVXxGxjqlkZcVOy
 CkbecZRXah8UNU1UL/lFGcNMmgM6Rmqywf29hSVuoi1y8kGQkhi+H+Abf
 E+BBWMVpx0gsKiXYrokAA2dty4A1qn3u/zGvxOAoklS8n1ZG2p1323hAL
 sBx2f7t3bbbGnF+h0/1rqCfTTQ6Te+6yjANBm5+AvzmSs8VhwyU1SIwrR
 AjUObdQIG4juRiV8rBQLvh0uz4TRH9l/7JFEFA7sq08Ia2W49oP5bYFxb
 L3bKiGNISM17CL8umM2r0uHJf6UC0YM/9twAfpn1q/5ogE7f1R8vQLHDs A==;
X-CSE-ConnectionGUID: 29rwg1RkQmSwRXQjPklnyA==
X-CSE-MsgGUID: 88y62OIIR+OovVGistTVHA==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9363497"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9363497"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 11:04:52 -0700
X-CSE-ConnectionGUID: QhtKiVKNT8uX04Y5As/aFg==
X-CSE-MsgGUID: 71BO5/epTB6N7lbQG+7bGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="29105547"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.252.48.128])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 11:04:51 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v2 2/5] drm/xe: Add helper to calculate adjusted register
 offset
Date: Tue, 23 Apr 2024 20:04:33 +0200
Message-Id: <20240423180436.2089-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240423180436.2089-1-michal.wajdeczko@intel.com>
References: <20240423180436.2089-1-michal.wajdeczko@intel.com>
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

Our MMIO accessing functions automatically adjust addresses for the
media registers based on mmio.adj_limit and mmio.adj_offset logic.
Move it to the separate helper to avoid code duplication and to
allow using it by the upcoming changes to PF driver code.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
v2: start using helper (Piotr)
    make gt param const to allow use in xe_mmio_in_range()
    assert that we adjust both or none addr in xe_mmio_read64_2x32()
---
 drivers/gpu/drm/xe/xe_mmio.c | 38 ++++++++++++++----------------------
 drivers/gpu/drm/xe/xe_mmio.h |  7 +++++++
 2 files changed, 22 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 334637511e75..2b18e8149ec3 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -423,41 +423,33 @@ int xe_mmio_init(struct xe_device *xe)
 u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
 {
 	struct xe_tile *tile = gt_to_tile(gt);
+	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
 
-	if (reg.addr < gt->mmio.adj_limit)
-		reg.addr += gt->mmio.adj_offset;
-
-	return readb((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + reg.addr);
+	return readb((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
 }
 
 u16 xe_mmio_read16(struct xe_gt *gt, struct xe_reg reg)
 {
 	struct xe_tile *tile = gt_to_tile(gt);
+	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
 
-	if (reg.addr < gt->mmio.adj_limit)
-		reg.addr += gt->mmio.adj_offset;
-
-	return readw((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + reg.addr);
+	return readw((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
 }
 
 void xe_mmio_write32(struct xe_gt *gt, struct xe_reg reg, u32 val)
 {
 	struct xe_tile *tile = gt_to_tile(gt);
+	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
 
-	if (reg.addr < gt->mmio.adj_limit)
-		reg.addr += gt->mmio.adj_offset;
-
-	writel(val, (reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + reg.addr);
+	writel(val, (reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
 }
 
 u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
 {
 	struct xe_tile *tile = gt_to_tile(gt);
+	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
 
-	if (reg.addr < gt->mmio.adj_limit)
-		reg.addr += gt->mmio.adj_offset;
-
-	return readl((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + reg.addr);
+	return readl((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
 }
 
 u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg reg, u32 clr, u32 set)
@@ -486,10 +478,9 @@ bool xe_mmio_in_range(const struct xe_gt *gt,
 		      const struct xe_mmio_range *range,
 		      struct xe_reg reg)
 {
-	if (reg.addr < gt->mmio.adj_limit)
-		reg.addr += gt->mmio.adj_offset;
+	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
 
-	return range && reg.addr >= range->start && reg.addr <= range->end;
+	return range && addr >= range->start && addr <= range->end;
 }
 
 /**
@@ -519,10 +510,11 @@ u64 xe_mmio_read64_2x32(struct xe_gt *gt, struct xe_reg reg)
 	struct xe_reg reg_udw = { .addr = reg.addr + 0x4 };
 	u32 ldw, udw, oldudw, retries;
 
-	if (reg.addr < gt->mmio.adj_limit) {
-		reg.addr += gt->mmio.adj_offset;
-		reg_udw.addr += gt->mmio.adj_offset;
-	}
+	reg.addr = xe_mmio_adjusted_addr(gt, reg.addr);
+	reg_udw.addr = xe_mmio_adjusted_addr(gt, reg_udw.addr);
+
+	/* we shouldn't adjust just one register address */
+	xe_gt_assert(gt, reg_udw.addr == reg.addr + 0x4);
 
 	oldudw = xe_mmio_read32(gt, reg_udw);
 	for (retries = 5; retries; --retries) {
diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
index a3cd7b3036c7..445ec6a0753e 100644
--- a/drivers/gpu/drm/xe/xe_mmio.h
+++ b/drivers/gpu/drm/xe/xe_mmio.h
@@ -36,4 +36,11 @@ u64 xe_mmio_read64_2x32(struct xe_gt *gt, struct xe_reg reg);
 int xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 mask, u32 val, u32 timeout_us,
 		   u32 *out_val, bool atomic);
 
+static inline u32 xe_mmio_adjusted_addr(const struct xe_gt *gt, u32 addr)
+{
+	if (addr < gt->mmio.adj_limit)
+		addr += gt->mmio.adj_offset;
+	return addr;
+}
+
 #endif
-- 
2.43.0

