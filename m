Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE53CC27C4F
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jun 2024 13:55:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1FC410EA9A;
	Thu, 13 Jun 2024 13:55:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ok7nBe9t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3E2710EA90
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jun 2024 13:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718286914; x=1749822914;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HoEFTJ9ujlclnZiKdGt5xtYneEx0ZYw3e1XrpFJnM/k=;
 b=Ok7nBe9tBv7tBNZRM5tWx8LsOTsHyoaax3NOA7zmnWHJ8xpvURjPoyhS
 eJwy1I/IbyRdk+LD+LIHoOQEByOU+nDxmhb/q0hJ+533bwFYvugfNtnD7
 ykRixgb77gy5UMoRbOA9DnNmUlDmZgLJQLHk3/AV87awCiuq8B7XsRSbs
 KZ0L2TaCwt+XMPPpTVKLmGeQw1md1AtzELWERUzRrykDxH2L2cmPW1meo
 po0a7CSGAKzoL2FmhkxeWo8wUvD0MoqjX2fnmFrnwBK8+V3fOqrzlNgl6
 k2GtOAeChN1FYrj5qcy6jYqmQXb3947z0HqCyhWGs9AlKTHSUW2eRPY1w w==;
X-CSE-ConnectionGUID: LnwU1D7VTuSJASfjyZ3X+g==
X-CSE-MsgGUID: ecvq2kTTRTaTNho4bIGS5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="14936901"
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; d="scan'208";a="14936901"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 06:54:53 -0700
X-CSE-ConnectionGUID: gwk2euRvTbCQhGMDNxbx+Q==
X-CSE-MsgGUID: Iwix2xShRny4jzn8u+a4DQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; d="scan'208";a="63330750"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.119.62])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 06:54:52 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Use fixed CCS mode when running in SR-IOV mode
Date: Thu, 13 Jun 2024 15:54:45 +0200
Message-Id: <20240613135445.2076-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

We don't support changing CCS mode when running in SR-IOV mode yet.
When running as a PF driver just apply default ccs_mode=1 that VF
drivers will assume as already applied and fixed.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_ccs_mode.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
index 5d4cdbd69bc3..aea49253d9c9 100644
--- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
@@ -12,6 +12,7 @@
 #include "xe_gt_printk.h"
 #include "xe_gt_sysfs.h"
 #include "xe_mmio.h"
+#include "xe_sriov.h"
 
 static void __xe_gt_apply_ccs_mode(struct xe_gt *gt, u32 num_engines)
 {
@@ -75,7 +76,7 @@ static void __xe_gt_apply_ccs_mode(struct xe_gt *gt, u32 num_engines)
 
 void xe_gt_apply_ccs_mode(struct xe_gt *gt)
 {
-	if (!gt->ccs_mode)
+	if (!gt->ccs_mode || IS_SRIOV_VF(gt_to_xe(gt)))
 		return;
 
 	__xe_gt_apply_ccs_mode(gt, gt->ccs_mode);
@@ -110,6 +111,12 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
 	u32 num_engines, num_slices;
 	int ret;
 
+	if (IS_SRIOV(xe)) {
+		xe_gt_dbg(gt, "Can't change compute mode when running as %s\n",
+			  xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
+		return -EPERM;
+	}
+
 	ret = kstrtou32(buff, 0, &num_engines);
 	if (ret)
 		return ret;
-- 
2.43.0

