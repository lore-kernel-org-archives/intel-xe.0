Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50849C54E67
	for <intel-xe@archiver.kernel.org>; Thu, 14 Mar 2024 17:32:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03F6810FC3C;
	Thu, 14 Mar 2024 17:32:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kR8ImxUl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6A6D10FC4D
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Mar 2024 17:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710437534; x=1741973534;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/iGFfiGnqQIzW8GEwe6MBFkQKl/WZ7PiIUfAKzOQMGw=;
 b=kR8ImxUlXgmjkqKNjDpgne2Bjh8+omL18r/nweACZSPsxJ78VVrFNxlE
 C5pFH9wh6Fx+AX0/vn7oAwJdYLBHRjo9uQS7xyBKjV+52i9ynOQZOJktL
 aUoC0wmG0/gE3k88qryg6M7K1P3OWlcUTkpUQG3CS7prOb5GHGtZRSuqa
 +63Has+YopTJP7TNpFXc7zxBb+Kfwl44/Fl+/CVwz6NZ6qbo3PfVWC170
 mcVIVHZgp0nkd3rEFlPDZQxoP8bccEXUMoqKQHC3GXQhltFCJLBSPsflY
 jpRAIhrUQIecyoVh4L2rI4brg6UZk5Ag7H+vF047x5zzDxkSwS5L7fhBE Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="22791724"
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; d="scan'208";a="22791724"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 10:31:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; d="scan'208";a="12388883"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.155.117])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 10:31:48 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v2 6/6] drm/xe: Make xe_mmio_read|write() functions non-inline
Date: Thu, 14 Mar 2024 18:31:30 +0100
Message-Id: <20240314173130.1177-7-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240314173130.1177-1-michal.wajdeczko@intel.com>
References: <20240314173130.1177-1-michal.wajdeczko@intel.com>
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

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c | 72 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_mmio.h | 81 ++++--------------------------------
 2 files changed, 79 insertions(+), 74 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 7ba2477452d7..1de9de4f94b6 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -420,6 +420,78 @@ int xe_mmio_root_tile_init(struct xe_device *xe)
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
2.43.0

