Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E77B9C47DA2
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jan 2024 14:56:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E77210E5A3;
	Tue, 16 Jan 2024 14:56:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9468D10E584
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jan 2024 14:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705416994; x=1736952994;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=k3N2zsJ3ezmeHFpfrytGzZIzkgxLDfDp5EOIj2gmWOg=;
 b=k1PRtMe3XJdLDAZpDqheR0FXqbX7dNlHB7M37pYeBbYx9UM6LO3FsJ82
 zOaxA1Z4Lr/KvGNelCp6oOgelEHFFyN5qdjv5fstxVGfj67Q1qh7xsFuh
 ZFmDbTwBKhmgo90FMPfedM+cCTkTUS9cFKo04RO3Xfp4vegkh0Y/+xxB9
 GifNWQu67YaJH6vsCjAntY9G6n/QXn1VTD2ua/qVNzlyC35+v0hcpVK86
 17TzEBrRdHovBjzEbB34cn+ihXTTtTSDwdOWdQ+7BW+ofZflTQ+S/WSKQ
 k+dW2DZOEKUYW9x2QIiTnvOoOn1xv7e0gkDxlhIDno/Wc5LXrT8UlEy4k g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="466262496"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="466262496"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 06:56:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="854374890"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="854374890"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.50.177])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 06:56:33 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 6/6] drm/xe: Make xe_mmio_read|write() functions non-inline
Date: Tue, 16 Jan 2024 15:56:17 +0100
Message-Id: <20240116145617.1177-7-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240116145617.1177-1-michal.wajdeczko@intel.com>
References: <20240116145617.1177-1-michal.wajdeczko@intel.com>
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

Shortly we will updating xe_mmio_read|write() functions with SR-IOV
specific features making those functions less suitable for inline.
Convert now those functions into regular ones, lowering driver
footprint, according to scripts/bloat-o-meter, by 6%

add/remove: 18/18 grow/shrink: 31/603 up/down: 2719/-79663 (-76944)
Function                                     old     new   delta
Total: Before=1276633, After=1199689, chg -6.03%
add/remove: 0/0 grow/shrink: 0/0 up/down: 0/0 (0)
Data                                         old     new   delta
Total: Before=48990, After=48990, chg +0.00%
add/remove: 0/0 grow/shrink: 0/0 up/down: 0/0 (0)
RO Data                                      old     new   delta
Total: Before=115680, After=115680, chg +0.00%

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c | 72 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_mmio.h | 81 ++++--------------------------------
 2 files changed, 79 insertions(+), 74 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index c8c5d74b6e90..5a7f9a9d4624 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -413,6 +413,78 @@ int xe_mmio_root_tile_init(struct xe_device *xe)
 	return 0;
 }
 
+u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
+{
+	struct xe_tile *tile = gt_to_tile(gt);
+
+	if (reg.addr < gt->mmio.adj_limit)
+		reg.addr += gt->mmio.adj_offset;
+
+	return readb((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + reg.addr);
+}
+
+u16 xe_mmio_read16(struct xe_gt *gt, struct xe_reg reg)
+{
+	struct xe_tile *tile = gt_to_tile(gt);
+
+	if (reg.addr < gt->mmio.adj_limit)
+		reg.addr += gt->mmio.adj_offset;
+
+	return readw((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + reg.addr);
+}
+
+void xe_mmio_write32(struct xe_gt *gt, struct xe_reg reg, u32 val)
+{
+	struct xe_tile *tile = gt_to_tile(gt);
+
+	if (reg.addr < gt->mmio.adj_limit)
+		reg.addr += gt->mmio.adj_offset;
+
+	writel(val, (reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + reg.addr);
+}
+
+u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
+{
+	struct xe_tile *tile = gt_to_tile(gt);
+
+	if (reg.addr < gt->mmio.adj_limit)
+		reg.addr += gt->mmio.adj_offset;
+
+	return readl((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + reg.addr);
+}
+
+u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg reg, u32 clr, u32 set)
+{
+	u32 old, reg_val;
+
+	old = xe_mmio_read32(gt, reg);
+	reg_val = (old & ~clr) | set;
+	xe_mmio_write32(gt, reg, reg_val);
+
+	return old;
+}
+
+int xe_mmio_write32_and_verify(struct xe_gt *gt,
+			       struct xe_reg reg, u32 val, u32 mask, u32 eval)
+{
+	u32 reg_val;
+
+	xe_mmio_write32(gt, reg, val);
+	reg_val = xe_mmio_read32(gt, reg);
+
+	return (reg_val & mask) != eval ? -EINVAL : 0;
+}
+
+bool xe_mmio_in_range(const struct xe_gt *gt,
+		      const struct xe_mmio_range *range,
+		      struct xe_reg reg)
+{
+	if (reg.addr < gt->mmio.adj_limit)
+		reg.addr += gt->mmio.adj_offset;
+
+	return range && reg.addr >= range->start && reg.addr <= range->end;
+}
+
 /**
  * xe_mmio_read64_2x32() - Read a 64-bit register as two 32-bit reads
  * @gt: MMIO target GT
diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
index 98de5c13c89b..67ead99f321b 100644
--- a/drivers/gpu/drm/xe/xe_mmio.h
+++ b/drivers/gpu/drm/xe/xe_mmio.h
@@ -24,80 +24,13 @@ int xe_mmio_init(struct xe_device *xe);
 int xe_mmio_root_tile_init(struct xe_device *xe);
 void xe_mmio_probe_tiles(struct xe_device *xe);
 
-static inline u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
-{
-	struct xe_tile *tile = gt_to_tile(gt);
-
-	if (reg.addr < gt->mmio.adj_limit)
-		reg.addr += gt->mmio.adj_offset;
-
-	return readb((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + reg.addr);
-}
-
-static inline u16 xe_mmio_read16(struct xe_gt *gt, struct xe_reg reg)
-{
-	struct xe_tile *tile = gt_to_tile(gt);
-
-	if (reg.addr < gt->mmio.adj_limit)
-		reg.addr += gt->mmio.adj_offset;
-
-	return readw((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + reg.addr);
-}
-
-static inline void xe_mmio_write32(struct xe_gt *gt,
-				   struct xe_reg reg, u32 val)
-{
-	struct xe_tile *tile = gt_to_tile(gt);
-
-	if (reg.addr < gt->mmio.adj_limit)
-		reg.addr += gt->mmio.adj_offset;
-
-	writel(val, (reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + reg.addr);
-}
-
-static inline u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
-{
-	struct xe_tile *tile = gt_to_tile(gt);
-
-	if (reg.addr < gt->mmio.adj_limit)
-		reg.addr += gt->mmio.adj_offset;
-
-	return readl((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + reg.addr);
-}
-
-static inline u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg reg, u32 clr,
-				u32 set)
-{
-	u32 old, reg_val;
-
-	old = xe_mmio_read32(gt, reg);
-	reg_val = (old & ~clr) | set;
-	xe_mmio_write32(gt, reg, reg_val);
-
-	return old;
-}
-
-static inline int xe_mmio_write32_and_verify(struct xe_gt *gt,
-					     struct xe_reg reg, u32 val,
-					     u32 mask, u32 eval)
-{
-	u32 reg_val;
-
-	xe_mmio_write32(gt, reg, val);
-	reg_val = xe_mmio_read32(gt, reg);
-
-	return (reg_val & mask) != eval ? -EINVAL : 0;
-}
-
-static inline bool xe_mmio_in_range(const struct xe_gt *gt,
-				    const struct xe_mmio_range *range,
-				    struct xe_reg reg)
-{
-	if (reg.addr < gt->mmio.adj_limit)
-		reg.addr += gt->mmio.adj_offset;
-
-	return range && reg.addr >= range->start && reg.addr <= range->end;
-}
+u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg);
+u16 xe_mmio_read16(struct xe_gt *gt, struct xe_reg reg);
+void xe_mmio_write32(struct xe_gt *gt, struct xe_reg reg, u32 val);
+u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg);
+u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg reg, u32 clr, u32 set);
+int xe_mmio_write32_and_verify(struct xe_gt *gt, struct xe_reg reg, u32 val, u32 mask, u32 eval);
+bool xe_mmio_in_range(const struct xe_gt *gt, const struct xe_mmio_range *range, struct xe_reg reg);
 
 int xe_mmio_probe_vram(struct xe_device *xe);
 u64 xe_mmio_read64_2x32(struct xe_gt *gt, struct xe_reg reg);
-- 
2.25.1

