Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6820EC197A0
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 21:40:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D4BF10E61F;
	Thu, 16 Nov 2023 21:40:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96B1810E61F
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Nov 2023 21:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700170828; x=1731706828;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RkDf9VZ0SIg1JUW7nKJjqfwdzAXrumrnIhEpS8FUfG0=;
 b=PBWEnpCqZHOGC1X+FZ9XEztA6HWkerMs4OAiWOQczhzzpQZXztwJhOhw
 l4rNWsNEY0g+o2BxgJoeyImZ/0l1JevZ3n+vfeMIxvcVTyRScOcNfD1bD
 R16q3kVsV06OIy9xBf31YdlCRvqwfQIAHWTScChF66LMhcv2XoP7Qsa+W
 uYpgA9w6FP+F2e8i63bah5+KURaGqBbYvSFa6EpARyYi2TH+IlheMueIM
 y9soqa6pv+DRQHJdo77k6GTc0JEJfAs9pnYdp6c/RpTzqWJbneggllTz3
 3xrd3zgLEucNLe1XluG5pLz76vlskCVXnj8S9VZJkj8OcvAVyJ6w59UPI Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="4263187"
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; 
   d="scan'208";a="4263187"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 13:40:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; d="scan'208";a="13261079"
Received: from tjlunife-mobl3.amr.corp.intel.com (HELO
 gjsousa-mobl2.intel.com) ([10.255.34.202])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 13:40:13 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 16 Nov 2023 18:39:59 -0300
Message-ID: <20231116214000.70573-2-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231116214000.70573-1-gustavo.sousa@intel.com>
References: <20231116214000.70573-1-gustavo.sousa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 1/2] drm/xe/mmio: Move xe_mmio_wait32() to
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

Here is the output of running bloat-o-metter on the new and old module
(execution provided by Lucas):

    $ ./scripts/bloat-o-meter build64/drivers/gpu/drm/xe/xe.ko{.old,}
    add/remove: 2/0 grow/shrink: 0/58 up/down: 554/-15645 (-15091)
    (...) # Lines in between omitted
    Total: Before=2181322, After=2166231, chg -0.69%

The overall reduction in the size is not that significant. Nevertheless,
keeping the function as inline arguably does not bring too much benefit
as well.

As noted by Lucas, we would probably benefit from an inline
function that did the fast-path check: do an optimistic first check
before entering the wait-logic, which itself would go to a compilation
unit. We might come back to implement this in the future if we have data
to justify it.

v2:
  - Add note in documentation for @timeout_us regarding the exponential
    backoff strategy. (Lucas)
  - Share output of bloat-o-meter in the commit message. (Lucas)

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c | 54 ++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_mmio.h | 39 ++------------------------
 2 files changed, 56 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index d8f9fabf715e..46140425ee2e 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -488,3 +488,57 @@ u64 xe_mmio_read64_2x32(struct xe_gt *gt, struct xe_reg reg)
 	return (u64)udw << 32 | ldw;
 }
 
+/**
+ * xe_mmio_wait32() - Wait for a register to match the desired masked value
+ * @gt: MMIO target GT
+ * @reg: register to read value from
+ * @mask: mask to be applied to the value read from the register
+ * @val: desired value after applying the mask
+ * @timeout_us: time out after this period of time. Wait logic tries to be
+ * smart, applying an exponential backoff until @timeout_us is reached.
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

