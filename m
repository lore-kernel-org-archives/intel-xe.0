Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A1E6C5AD4C
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 15:39:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA63810E624;
	Thu, 16 Nov 2023 15:39:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B7F310E622
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Nov 2023 15:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700149188; x=1731685188;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wEds32lhHYbbWnK3EiUaWzoyxMB/dMpdCPE00Ehzukg=;
 b=WU4Rz3qZq1gRtwmZElmrE+H0Wmc1X6vuJkHJUhzOWWXyeEr4mVjxdaN8
 Ndu5trB1w3G/S2iGy2ECsgmSD+ugXYyIUXcP1KAvHHz+Eyi5CoCu7S2rC
 tIvqSUVi44h4I0tnOOry8O/JUjz6aXn8FG2ucW0zUOUTVhW5SXPg7BKpG
 FS6oVEjv47cVNYWAx6i6iYqFUcrVujoPOMjh8YhMA8b/SIUaptPokuFIH
 BCVg0ntkUpO5HTnjXAsaFqfMWw3B5dWIBLgNtsMyMd3uFQ9VHDFUMXEP5
 cmHuvtPMR7+yzbtlZs+O4ZrTB6lC5AKPYSEhUXFDZXK0tuU0ZY3wDQEvP Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="393963168"
X-IronPort-AV: E=Sophos;i="6.04,204,1695711600"; d="scan'208";a="393963168"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 07:39:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,204,1695711600"; 
   d="scan'208";a="6745431"
Received: from tjlunife-mobl3.amr.corp.intel.com (HELO
 gjsousa-mobl2.intel.com) ([10.255.34.202])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 07:39:28 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 16 Nov 2023 12:39:01 -0300
Message-ID: <20231116153901.31941-3-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231116153901.31941-2-gustavo.sousa@intel.com>
References: <20231116153901.31941-2-gustavo.sousa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 1/2] drm/xe/mmio: Move xe_mmio_wait32() to
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This function is big enough, let's move it to a shared compilation unit.

While at it, document it.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c | 53 ++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_mmio.h | 39 ++------------------------
 2 files changed, 55 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index d8f9fabf715e..12df698f6764 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -488,3 +488,56 @@ u64 xe_mmio_read64_2x32(struct xe_gt *gt, struct xe_reg reg)
 	return (u64)udw << 32 | ldw;
 }
 
+/**
+ * xe_mmio_wait32() - Wait for a register to match the desired masked value
+ * @gt: MMIO target GT
+ * @reg: register to read value from
+ * @mask: mask to be applied to the value read from the register
+ * @val: desired value after applying the mask
+ * @timeout_us: time out after this period of time
+ * @out_val: if not NULL, points where to store the last unmasked value
+ * @atomic: needs to be true if calling from an atomic context
+ *
+ * This function polls for the desired masked value and returns zero on success
+ * or -ETIMEDOUT if timed out.
+ *
+ * Note that @timeout_us represents the minimum amount of time to wait before
+ * giving up. The actual time taken by this function can be a little more than
+ * @timeout_us for different reasons, specially in non-atomic contexts. Thus,
+ * it is possible that this function succeeds even after @timeout_us has passed.
+ */
+int xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 mask, u32 val, u32 timeout_us,
+		   u32 *out_val, bool atomic)
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
diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
index ae09f777d711..51905aff600c 100644
--- a/drivers/gpu/drm/xe/xe_mmio.h
+++ b/drivers/gpu/drm/xe/xe_mmio.h
@@ -87,43 +87,6 @@ static inline int xe_mmio_write32_and_verify(struct xe_gt *gt,
 	return (reg_val & mask) != eval ? -EINVAL : 0;
 }
 
-static inline int xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 mask,
-				 u32 val, u32 timeout_us, u32 *out_val,
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
 int xe_mmio_ioctl(struct drm_device *dev, void *data,
 		  struct drm_file *file);
 
@@ -140,5 +103,7 @@ static inline bool xe_mmio_in_range(const struct xe_gt *gt,
 int xe_mmio_probe_vram(struct xe_device *xe);
 int xe_mmio_tile_vram_size(struct xe_tile *tile, u64 *vram_size, u64 *tile_size, u64 *tile_base);
 u64 xe_mmio_read64_2x32(struct xe_gt *gt, struct xe_reg reg);
+int xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 mask, u32 val, u32 timeout_us,
+		   u32 *out_val, bool atomic);
 
 #endif
-- 
2.42.0

