Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6820C41535
	for <intel-xe@archiver.kernel.org>; Sun, 17 Dec 2023 00:50:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9202D10E0CD;
	Sun, 17 Dec 2023 00:50:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5779310E3C7
 for <intel-xe@lists.freedesktop.org>; Sun, 17 Dec 2023 00:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702774254; x=1734310254;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NzFp3DblM57pj24x5SzGyfTYGHytqHziuEOixBQDuco=;
 b=dMqwko7Sbp1LbsekEQDSFcL/QetSYjLKoDd03CkHpFapbn8uEjKdsQR2
 O8dcFZJ4bHWiEdG6uOpSycvHDHAPqGnLGm95S+TSYpkavoYitPObwq/Fr
 G12LCbaI7Ip8048X3+ze0wV45TCg5WPKh70GiWZkMPRxdUVsllEAe1lKr
 Hzp/Zl+TNiNgKAg+TRb7p4fet6phWCev0rWY749OT8zwWB5ZxU/a2MpP/
 Iy/6wqW6i3EVRGpa/4yzANO5jq9Pr1cWBhzDiAZXIeo7EwsszFtjfHPTx
 ZJAuKAPgAfvA0hpJTjBHLgT+Irgs0diaw4+J7QJQPX6/W6Q4SvkdIWOVo A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="14074772"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; d="scan'208";a="14074772"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2023 13:41:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="768387063"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; d="scan'208";a="768387063"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2023 13:41:24 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/3] drm/xe: Rename num_slices to num_cslices
Date: Sat, 16 Dec 2023 13:41:17 -0800
Message-ID: <20231216214120.7394-3-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231216214120.7394-1-niranjana.vishwanathapura@intel.com>
References: <20231216214120.7394-1-niranjana.vishwanathapura@intel.com>
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
Cc: lucas.demarchi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

'cslice' indicates compute slice and removes any
ambiguity with 'gslice' used elsewhere in the driver.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_ccs_mode.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
index ee1065c44da7f..173b119a21c00 100644
--- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
@@ -21,10 +21,10 @@
 /* Get CCS mode mask to disable all compute slices */
 static u32 xe_gt_ccs_mode_disabled(struct xe_gt *gt)
 {
-	int i, num_slices = hweight32(gt->info.__engine_mask & XE_HW_ENGINE_CCS_MASK);
+	int i, num_cslices = hweight32(gt->info.__engine_mask & XE_HW_ENGINE_CCS_MASK);
 	u32 mode = 0;
 
-	for (i = 0; i < num_slices; i++)
+	for (i = 0; i < num_cslices; i++)
 		mode |= CCS_MODE_CSLICE(i, CCS_MODE_CSLICE_ASSIGNMENT);
 
 	return mode;
@@ -33,7 +33,7 @@ static u32 xe_gt_ccs_mode_disabled(struct xe_gt *gt)
 void xe_gt_ccs_mode_apply(struct xe_gt *gt)
 {
 	u32 mode = xe_gt_ccs_mode_disabled(gt); /* disable all by default */
-	int num_slices = hweight32(CCS_MASK(gt));
+	int num_cslices = hweight32(CCS_MASK(gt));
 	struct xe_device *xe = gt_to_xe(gt);
 	u32 num_engines = gt->ccs_mode;
 	int width, cslice = 0;
@@ -43,8 +43,8 @@ void xe_gt_ccs_mode_apply(struct xe_gt *gt)
 		return;
 
 	xe_assert(xe, xe_gt_ccs_mode_enabled(gt));
-	xe_assert(xe, num_engines <= num_slices);
-	xe_assert(xe, !(num_slices % num_engines));
+	xe_assert(xe, num_engines <= num_cslices);
+	xe_assert(xe, !(num_cslices % num_engines));
 
 	/*
 	 * Loop over all available slices and assign each a user engine.
@@ -64,7 +64,7 @@ void xe_gt_ccs_mode_apply(struct xe_gt *gt)
 	 *   slice 2: ccs2
 	 *   slice 3: ccs3
 	 */
-	for (width = num_slices / num_engines; width; width--) {
+	for (width = num_cslices / num_engines; width; width--) {
 		struct xe_hw_engine *hwe;
 		enum xe_hw_engine_id id;
 
@@ -89,8 +89,8 @@ void xe_gt_ccs_mode_apply(struct xe_gt *gt)
 
 	xe_mmio_write32(gt, CCS_MODE, mode);
 
-	xe_gt_info(gt, "CCS_MODE=%x config:%08x, num_engines:%d, num_slices:%d\n",
-		   mode, config, num_engines, num_slices);
+	xe_gt_info(gt, "CCS_MODE=%x config:%08x, num_engines:%d, num_cslices:%d\n",
+		   mode, config, num_engines, num_cslices);
 }
 
 static ssize_t
@@ -119,7 +119,7 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
 {
 	struct xe_gt *gt = kobj_to_gt(&kdev->kobj);
 	struct xe_device *xe = gt_to_xe(gt);
-	u32 num_engines, num_slices;
+	u32 num_engines, num_cslices;
 	int ret;
 
 	ret = kstrtou32(buff, 0, &num_engines);
@@ -130,10 +130,10 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
 	 * Ensure number of engines specified is valid and there is an
 	 * exact multiple of engines for slices.
 	 */
-	num_slices = hweight32(CCS_MASK(gt));
-	if (!num_engines || num_engines > num_slices || num_slices % num_engines) {
+	num_cslices = hweight32(CCS_MASK(gt));
+	if (!num_engines || num_engines > num_cslices || num_cslices % num_engines) {
 		xe_gt_dbg(gt, "Invalid compute config, %d engines %d slices\n",
-			  num_engines, num_slices);
+			  num_engines, num_cslices);
 		return -EINVAL;
 	}
 
-- 
2.43.0

