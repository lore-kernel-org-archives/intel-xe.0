Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABDD3EB64DB
	for <intel-xe@archiver.kernel.org>; Tue, 20 Jun 2023 19:35:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4361310E37F;
	Tue, 20 Jun 2023 19:35:06 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4965310E37F
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Jun 2023 19:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687289704; x=1718825704;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iYQwiZL1VZUWZlT42mykjxR8VJfp9Lv1mCATuYNNhu4=;
 b=LGgXgAZnbk6BqPacZ3L5qe22luAbJJgFRR6jgtfsXixMwtx5iNGOWRY0
 EzKhJf/iqNH2sMov0claTZ/WFtNQ6wiW365RwwHg89DxtLq/PNUuCorBx
 0HZXyGxO99f5WxZoxNMJX9pKIIUL5F8ycWpIEjkSg1fpXzLySz4EZQdw5
 cf3UtMF0u3/uVKuRruDA1tg2IW69htxzHzi1AnJGqWlWqSudcptAlTUZR
 1+cen2sbI51G3WWvCZu7PbVJ3Ut0pIlYxb7wK1SWOj/37X737+hv2o6Lz
 zTpOZE3M4lswupxn6FpSa7G7y6che5tWelWJh6LiMqPmSCH0Ja8YGgz6m A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="339579528"
X-IronPort-AV: E=Sophos;i="6.00,258,1681196400"; d="scan'208";a="339579528"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2023 12:35:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="858706269"
X-IronPort-AV: E=Sophos;i="6.00,258,1681196400"; d="scan'208";a="858706269"
Received: from invictus.jf.intel.com ([10.165.21.201])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2023 12:35:02 -0700
From: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 20 Jun 2023 12:32:28 -0700
Message-Id: <20230620193229.1698372-2-radhakrishna.sripada@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230620193229.1698372-1-radhakrishna.sripada@intel.com>
References: <20230620193229.1698372-1-radhakrishna.sripada@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 1/2] drm/xe: Move mmio read/write functions to
 xe_mmio.c
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

Move the register read/write apis to xe_mmio.c to prepare for
adding tracing infrastructure for the same. Adding tracing support
in xe_mmio.h messes with the compilation of the display code.

v2: Let compiler choose to make the functions inline(MattR)

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c | 108 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_mmio.h | 124 +++--------------------------------
 2 files changed, 118 insertions(+), 114 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index f7a7f996b37f..78c7f839f783 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -429,6 +429,114 @@ static const struct xe_reg mmio_read_whitelist[] = {
 	RING_TIMESTAMP(RENDER_RING_BASE),
 };
 
+u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
+{
+	struct xe_tile *tile = gt_to_tile(gt);
+
+	if (reg.addr < gt->mmio.adj_limit)
+		reg.addr += gt->mmio.adj_offset;
+
+	return readb(tile->mmio.regs + reg.addr);
+}
+
+void xe_mmio_write32(struct xe_gt *gt, struct xe_reg reg, u32 val)
+{
+	struct xe_tile *tile = gt_to_tile(gt);
+
+	if (reg.addr < gt->mmio.adj_limit)
+		reg.addr += gt->mmio.adj_offset;
+
+	writel(val, tile->mmio.regs + reg.addr);
+}
+
+u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
+{
+	struct xe_tile *tile = gt_to_tile(gt);
+
+	if (reg.addr < gt->mmio.adj_limit)
+		reg.addr += gt->mmio.adj_offset;
+
+	return readl(tile->mmio.regs + reg.addr);
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
+void xe_mmio_write64(struct xe_gt *gt, struct xe_reg reg, u64 val)
+{
+	struct xe_tile *tile = gt_to_tile(gt);
+
+	if (reg.addr < gt->mmio.adj_limit)
+		reg.addr += gt->mmio.adj_offset;
+
+	writeq(val, tile->mmio.regs + reg.addr);
+}
+
+u64 xe_mmio_read64(struct xe_gt *gt, struct xe_reg reg)
+{
+	struct xe_tile *tile = gt_to_tile(gt);
+
+	if (reg.addr < gt->mmio.adj_limit)
+		reg.addr += gt->mmio.adj_offset;
+
+	return readq(tile->mmio.regs + reg.addr);
+}
+
+int xe_mmio_write32_and_verify(struct xe_gt *gt, struct xe_reg reg, u32 val,
+			       u32 mask, u32 eval)
+{
+	u32 reg_val;
+
+	xe_mmio_write32(gt, reg, val);
+	reg_val = xe_mmio_read32(gt, reg);
+
+	return (reg_val & mask) != eval ? -EINVAL : 0;
+}
+
+int xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 val, u32 mask,
+		   u32 timeout_us, u32 *out_val, bool atomic)
+{
+	ktime_t cur = ktime_get_raw();
+	const ktime_t end = ktime_add_us(cur, timeout_us);
+	int ret = -ETIMEDOUT;
+	s64 wait = 10;
+	u32 read;
+
+	for (;;) {
+		read = xe_mmio_read32(gt, reg);
+		if ((read & mask) == val) {
+			ret = 0;
+			break;
+		}
+
+		cur = ktime_get_raw();
+		if (!ktime_before(cur, end))
+			break;
+
+		if (ktime_after(ktime_add_us(cur, wait), end))
+			wait = ktime_us_delta(end, cur);
+
+		if (atomic)
+			udelay(wait);
+		else
+			usleep_range(wait, wait << 1);
+		wait <<= 1;
+	}
+
+	if (out_val)
+		*out_val = read;
+
+	return ret;
+}
+
 int xe_mmio_ioctl(struct drm_device *dev, void *data,
 		  struct drm_file *file)
 {
diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
index 3c547d78afba..c06fcac2cc5b 100644
--- a/drivers/gpu/drm/xe/xe_mmio.h
+++ b/drivers/gpu/drm/xe/xe_mmio.h
@@ -20,120 +20,16 @@ struct xe_device;
 #define GEN12_LMEM_BAR		2
 
 int xe_mmio_init(struct xe_device *xe);
-
-static inline u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
-{
-	struct xe_tile *tile = gt_to_tile(gt);
-
-	if (reg.addr < gt->mmio.adj_limit)
-		reg.addr += gt->mmio.adj_offset;
-
-	return readb(tile->mmio.regs + reg.addr);
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
-	writel(val, tile->mmio.regs + reg.addr);
-}
-
-static inline u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
-{
-	struct xe_tile *tile = gt_to_tile(gt);
-
-	if (reg.addr < gt->mmio.adj_limit)
-		reg.addr += gt->mmio.adj_offset;
-
-	return readl(tile->mmio.regs + reg.addr);
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
-static inline void xe_mmio_write64(struct xe_gt *gt,
-				   struct xe_reg reg, u64 val)
-{
-	struct xe_tile *tile = gt_to_tile(gt);
-
-	if (reg.addr < gt->mmio.adj_limit)
-		reg.addr += gt->mmio.adj_offset;
-
-	writeq(val, tile->mmio.regs + reg.addr);
-}
-
-static inline u64 xe_mmio_read64(struct xe_gt *gt, struct xe_reg reg)
-{
-	struct xe_tile *tile = gt_to_tile(gt);
-
-	if (reg.addr < gt->mmio.adj_limit)
-		reg.addr += gt->mmio.adj_offset;
-
-	return readq(tile->mmio.regs + reg.addr);
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
-static inline int xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 val,
-				 u32 mask, u32 timeout_us, u32 *out_val,
-				 bool atomic)
-{
-	ktime_t cur = ktime_get_raw();
-	const ktime_t end = ktime_add_us(cur, timeout_us);
-	int ret = -ETIMEDOUT;
-	s64 wait = 10;
-	u32 read;
-
-	for (;;) {
-		read = xe_mmio_read32(gt, reg);
-		if ((read & mask) == val) {
-			ret = 0;
-			break;
-		}
-
-		cur = ktime_get_raw();
-		if (!ktime_before(cur, end))
-			break;
-
-		if (ktime_after(ktime_add_us(cur, wait), end))
-			wait = ktime_us_delta(end, cur);
-
-		if (atomic)
-			udelay(wait);
-		else
-			usleep_range(wait, wait << 1);
-		wait <<= 1;
-	}
-
-	if (out_val)
-		*out_val = read;
-
-	return ret;
-}
-
+u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg);
+void xe_mmio_write32(struct xe_gt *gt, struct xe_reg reg, u32 val);
+u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg);
+u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg reg, u32 clr, u32 set);
+void xe_mmio_write64(struct xe_gt *gt, struct xe_reg reg, u64 val);
+u64 xe_mmio_read64(struct xe_gt *gt, struct xe_reg reg);
+int xe_mmio_write32_and_verify(struct xe_gt *gt, struct xe_reg reg, u32 val,
+			       u32 mask, u32 eval);
+int xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 val, u32 mask,
+		   u32 timeout_us, u32 *out_val, bool atomic);
 int xe_mmio_ioctl(struct drm_device *dev, void *data,
 		  struct drm_file *file);
 
-- 
2.34.1

