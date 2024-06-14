Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B22C27C6E
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jun 2024 10:14:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70C8910ECD5;
	Fri, 14 Jun 2024 10:14:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ipcd0bRa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBC7710ECD5
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jun 2024 10:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718360067; x=1749896067;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=riMKdmyd9wqWjGIlcTzewb1RZmEkxyIQj7uHM32mccc=;
 b=Ipcd0bRaILyPxTC9QuURmi9EHqOnX5GZCdB+wQj3LSVmyMz5u7WnExKm
 mDZbJeyp3qXMj4a7yBltUobnO1kjkedKCroylu26sUi8a9EmI3z4iucAk
 kT2JvgPDB9IHPK0Y4Nm3DWdVo48gzfCWkMu2JgpmdbCQzUVhCHAOU8wGH
 i3TSy+COp1LuJpBj49S1Kf/QMhrkAxTm4sQzdevAnNwpODdlexHgmZ6TO
 DZiy0BtB2DSQA6CEy3+yBL5HwrCa3gzMuq5LVwsb1CTHJLYqO5XJR9y3y
 klSr8MkJu13GuMx6KbOpf/NhlURGEN5HvE1TV/Ed4aYPcnUZ5MES70Hr6 Q==;
X-CSE-ConnectionGUID: LcYuSA/IQuO56Od9D3nWBQ==
X-CSE-MsgGUID: XFfvoCemRKSxWF9B346+sA==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="25813966"
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; d="scan'208";a="25813966"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 03:14:26 -0700
X-CSE-ConnectionGUID: F03u43LuRQW03P/ejPYjtg==
X-CSE-MsgGUID: r9P9N591Ql+3w4V3Fd65Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; d="scan'208";a="45412710"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.19.248])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 03:14:24 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2] drm/xe: Use fixed CCS mode when running in SR-IOV mode
Date: Fri, 14 Jun 2024 12:14:15 +0200
Message-Id: <20240614101415.2208-1-michal.wajdeczko@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
v2: use ENOTSUPP instead of EPERM (Lucas)
    actually use EOPNOTSUPP (Michal)
---
 drivers/gpu/drm/xe/xe_gt_ccs_mode.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
index 5d4cdbd69bc3..d2e4dc3aaf61 100644
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
+		return -EOPNOTSUPP;
+	}
+
 	ret = kstrtou32(buff, 0, &num_engines);
 	if (ret)
 		return ret;
-- 
2.43.0

