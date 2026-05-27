Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32FD3CD5BD0
	for <intel-xe@archiver.kernel.org>; Wed, 27 May 2026 11:35:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBCC110E795;
	Wed, 27 May 2026 11:35:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CXVyzLYZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B113F10E795
 for <intel-xe@lists.freedesktop.org>; Wed, 27 May 2026 11:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779881739; x=1811417739;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=s3dd2TXknPwONLOCFMk+sbjZR/fyNnGUe8zCGYtYYYk=;
 b=CXVyzLYZrJz0Z6khsObdzS6DfRptyVHjjHpFMOQDk/pW6KenAYwdFCEQ
 CcZf/A1U5onsn5SeQs4EzemPSkHDSV1tW2muXlx0bUOGHe+sL/nMkpefC
 EUQoyVBG8mh15pqzrgr5nrs3YCjd9ZfjPEt4g+KYE7eTmBJJ08gsIBYbK
 HEGE6KzCb+mMtXMxrZ1IBy5FMuiLyYUw2VGsEWc92XGwOEf4RFIt2+9/G
 vYBKadHHQEVzckk2augVMT3Yi3PYhtvbS47i/uxv03jFhmx5QJeKiPCxx
 O7Zy9fhh+c1IswND+o2iU09DtOu3eDHkaDbp7TghTG6hSGGkpk9kLrHDP A==;
X-CSE-ConnectionGUID: ekvsjVr3Tpe9NTMiOXI1Mg==
X-CSE-MsgGUID: uTiHn9hYS6SWCUVwOXS9gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="98285504"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="98285504"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 04:35:38 -0700
X-CSE-ConnectionGUID: 9JzVVtvpSGCc1FuiKeotdw==
X-CSE-MsgGUID: E+mCV6quQTyw4fskMgWx1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="247164509"
Received: from rkoppura-z790i-aorus-ultra.iind.intel.com ([10.190.239.17])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 04:35:36 -0700
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: sk.anirban@intel.com, riana.tauro@intel.com, anshuman.gupta@intel.com,
 mallesh.koujalagi@intel.com,
 Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Subject: [PATCH v3 1/1] drm/xe: Add fault-injection support for CRI throttle
 reasons
Date: Wed, 27 May 2026 17:05:13 +0530
Message-Id: <20260527113513.1650375-2-ravi.kishore.koppuravuri@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260527113513.1650375-1-ravi.kishore.koppuravuri@intel.com>
References: <20260527113513.1650375-1-ravi.kishore.koppuravuri@intel.com>
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

Introduce fault injection capability for
xe_gt_throttle_get_limit_reasons() to enable robust testing of throttle
reason reporting under failure scenarios. This patch incorporates error
injection hooks that allow checking the behavior of the frequency
throttling. It ensures that the error handling is properly implemented
and handled.

Cc: Tauro Riana <riana.tauro@intel.com>
Cc: Gupta Anshuman <anshuman.gupta@intel.com>
Cc: Sk Anirban <sk.anirban@intel.com>
Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_throttle.c | 34 ++++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_throttle.c b/drivers/gpu/drm/xe/xe_gt_throttle.c
index 1e7e3a31aa69..02bd01069ab7 100644
--- a/drivers/gpu/drm/xe/xe_gt_throttle.c
+++ b/drivers/gpu/drm/xe/xe_gt_throttle.c
@@ -5,6 +5,9 @@
 
 #include <drm/drm_managed.h>
 
+#include <linux/error-injection.h>
+#include <linux/limits.h>
+
 #include <regs/xe_gt_regs.h>
 #include "xe_device_types.h"
 #include "xe_gt.h"
@@ -81,11 +84,33 @@ static struct throttle_attribute *kobj_attribute_to_throttle(struct kobj_attribu
 	return container_of(attr, struct throttle_attribute, attr);
 }
 
+static noinline int xe_gt_throttle_inject_errno(void)
+{
+	return INT_MAX;
+}
+ALLOW_ERROR_INJECTION(xe_gt_throttle_inject_errno, ERRNO);
+
+static u32 xe_gt_throttle_injected_limit_reasons(int err, u32 mask)
+{
+	if (err == INT_MAX || err >= 0)
+		return 0;
+
+	err = -err;
+
+	if (err < 1 || err > 32)
+		return 0;
+
+	return BIT(err - 1) & mask;
+}
+
 u32 xe_gt_throttle_get_limit_reasons(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_reg reg;
+	int err;
+	u32 injected;
 	u32 mask;
+	u32 reasons_val;
 
 	if (xe_gt_is_media_type(gt))
 		reg = MTL_MEDIA_PERF_LIMIT_REASONS;
@@ -98,7 +123,14 @@ u32 xe_gt_throttle_get_limit_reasons(struct xe_gt *gt)
 		mask = GT0_PERF_LIMIT_REASONS_MASK;
 
 	guard(xe_pm_runtime)(xe);
-	return xe_mmio_read32(&gt->mmio, reg) & mask;
+	reasons_val = xe_mmio_read32(&gt->mmio, reg) & mask;
+
+	err = xe_gt_throttle_inject_errno();
+	injected = xe_gt_throttle_injected_limit_reasons(err, mask);
+	if (injected)
+		return injected;
+
+	return reasons_val;
 }
 
 static bool is_throttled_by(struct xe_gt *gt, u32 mask)
-- 
2.34.1

