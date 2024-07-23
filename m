Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32D32C3DA49
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jul 2024 12:02:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6DA910E595;
	Tue, 23 Jul 2024 12:02:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hsb0oqNK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 531C610E595
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Jul 2024 12:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721736136; x=1753272136;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RHcZyi4qX/cuxRZ0ji/hK3DyK1i9powCTairNo4KdY0=;
 b=hsb0oqNKdqF4NUaTFIpPYr3KsyYgf6edfsRK16+BBO4oxpScRu1/4Le0
 3uyCQOQyXOihSobh2AwZiaNmcSaXViJ2PnkC3iILJY4+iEMvFw19LTmgV
 OHlZCR6MbcOf0l44ZuGanx9HfzwqbPuSXUD5XJwyWwfqGP0qfnAbaupOJ
 0uDN0tDluIh2aCUiZWxycT++Qa8V4hpx8Hcv9J1gn7hixUkFCldF0OBx+
 n8hKdKP8rq2YzwPM1ddOVeYN1PHTxxabe7FOV2h4/arf9qa5cvyCx7ou1
 IraVUSwBPDg2VXh8mlc8Ft/lBqLu6V1Ls55yJoz724k6hUTESZN76IG4T A==;
X-CSE-ConnectionGUID: CetBh44SQEyFpBtSgoD5mg==
X-CSE-MsgGUID: Sz70MTf0TMKhYcnqluxXGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="41883176"
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; d="scan'208";a="41883176"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2024 05:01:56 -0700
X-CSE-ConnectionGUID: MO99cLrLTO2Wyr1jYnOWOg==
X-CSE-MsgGUID: WRZEO8DXRB64ZJT/YfrP7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; d="scan'208";a="51879471"
Received: from kinlongk-mobl1.amr.corp.intel.com (HELO
 gjsousa-mobl2.intel.com) ([10.125.110.29])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2024 05:01:55 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe/mmio: Use single logic for waiting functions
Date: Tue, 23 Jul 2024 09:01:21 -0300
Message-ID: <20240723120120.5443-2-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.45.2
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

The implementations for xe_mmio_wait32() and xe_mmio_wait32_not() are
almost identical. Let is avoid duplication of logic by having them
calling a common __xe_mmio_wait32() function.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c | 103 +++++++++++++----------------------
 1 file changed, 39 insertions(+), 64 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index ea3c37d3e13f..955ca6940161 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -278,37 +278,24 @@ u64 xe_mmio_read64_2x32(struct xe_gt *gt, struct xe_reg reg)
 	return (u64)udw << 32 | ldw;
 }
 
-/**
- * xe_mmio_wait32() - Wait for a register to match the desired masked value
- * @gt: MMIO target GT
- * @reg: register to read value from
- * @mask: mask to be applied to the value read from the register
- * @val: desired value after applying the mask
- * @timeout_us: time out after this period of time. Wait logic tries to be
- * smart, applying an exponential backoff until @timeout_us is reached.
- * @out_val: if not NULL, points where to store the last unmasked value
- * @atomic: needs to be true if calling from an atomic context
- *
- * This function polls for the desired masked value and returns zero on success
- * or -ETIMEDOUT if timed out.
- *
- * Note that @timeout_us represents the minimum amount of time to wait before
- * giving up. The actual time taken by this function can be a little more than
- * @timeout_us for different reasons, specially in non-atomic contexts. Thus,
- * it is possible that this function succeeds even after @timeout_us has passed.
- */
-int xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 mask, u32 val, u32 timeout_us,
-		   u32 *out_val, bool atomic)
+static int __xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 mask, u32 val, u32 timeout_us,
+			    u32 *out_val, bool atomic, bool expect_match)
 {
 	ktime_t cur = ktime_get_raw();
 	const ktime_t end = ktime_add_us(cur, timeout_us);
 	int ret = -ETIMEDOUT;
 	s64 wait = 10;
 	u32 read;
+	bool check;
 
 	for (;;) {
 		read = xe_mmio_read32(gt, reg);
-		if ((read & mask) == val) {
+
+		check = (read & mask) == val;
+		if (!expect_match)
+			check = !check;
+
+		if (check) {
 			ret = 0;
 			break;
 		}
@@ -329,7 +316,12 @@ int xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 mask, u32 val, u32 t
 
 	if (ret != 0) {
 		read = xe_mmio_read32(gt, reg);
-		if ((read & mask) == val)
+
+		check = (read & mask) == val;
+		if (!expect_match)
+			check = !check;
+
+		if (check)
 			ret = 0;
 	}
 
@@ -340,62 +332,45 @@ int xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 mask, u32 val, u32 t
 }
 
 /**
- * xe_mmio_wait32_not() - Wait for a register to return anything other than the given masked value
+ * xe_mmio_wait32() - Wait for a register to match the desired masked value
  * @gt: MMIO target GT
  * @reg: register to read value from
  * @mask: mask to be applied to the value read from the register
- * @val: value to match after applying the mask
+ * @val: desired value after applying the mask
  * @timeout_us: time out after this period of time. Wait logic tries to be
  * smart, applying an exponential backoff until @timeout_us is reached.
  * @out_val: if not NULL, points where to store the last unmasked value
  * @atomic: needs to be true if calling from an atomic context
  *
- * This function polls for a masked value to change from a given value and
- * returns zero on success or -ETIMEDOUT if timed out.
+ * This function polls for the desired masked value and returns zero on success
+ * or -ETIMEDOUT if timed out.
  *
  * Note that @timeout_us represents the minimum amount of time to wait before
  * giving up. The actual time taken by this function can be a little more than
  * @timeout_us for different reasons, specially in non-atomic contexts. Thus,
  * it is possible that this function succeeds even after @timeout_us has passed.
  */
+int xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 mask, u32 val, u32 timeout_us,
+		   u32 *out_val, bool atomic)
+{
+	return __xe_mmio_wait32(gt, reg, mask, val, timeout_us, out_val, atomic, true);
+}
+
+/**
+ * xe_mmio_wait32_not() - Wait for a register to return anything other than the given masked value
+ * @gt: MMIO target GT
+ * @reg: register to read value from
+ * @mask: mask to be applied to the value read from the register
+ * @val: value to not to be matched after applying the mask
+ * @timeout_us: time out after this period of time
+ * @out_val: if not NULL, points where to store the last unmasked value
+ * @atomic: needs to be true if calling from an atomic context
+ *
+ * This function works exactly like xe_mmio_wait32() with the exception that
+ * @val is expected not to be matched.
+ */
 int xe_mmio_wait32_not(struct xe_gt *gt, struct xe_reg reg, u32 mask, u32 val, u32 timeout_us,
 		       u32 *out_val, bool atomic)
 {
-	ktime_t cur = ktime_get_raw();
-	const ktime_t end = ktime_add_us(cur, timeout_us);
-	int ret = -ETIMEDOUT;
-	s64 wait = 10;
-	u32 read;
-
-	for (;;) {
-		read = xe_mmio_read32(gt, reg);
-		if ((read & mask) != val) {
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
-	if (ret != 0) {
-		read = xe_mmio_read32(gt, reg);
-		if ((read & mask) != val)
-			ret = 0;
-	}
-
-	if (out_val)
-		*out_val = read;
-
-	return ret;
+	return __xe_mmio_wait32(gt, reg, mask, val, timeout_us, out_val, atomic, false);
 }
-- 
2.45.2

