Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BBA9C2BA1A
	for <intel-xe@archiver.kernel.org>; Wed, 19 Jun 2024 21:46:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C1D910E29B;
	Wed, 19 Jun 2024 21:46:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P5aFCpy+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E15010E2A2
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Jun 2024 21:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718833594; x=1750369594;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=8s5/VhOHheFtRgt1vhgfEpMCgqkpyls+bHa8e43yo8E=;
 b=P5aFCpy+EevyXorls/EEW52Ji0QNf41M6VU/0HJYQ0L4qYBIUnJQfXlM
 MKmjjPzpIFeOD7bMuwMhCgcd3S3+yarQ1YHPG3FyDyEvk+F4vIHvFdCPz
 MnBMEWsXOgJEI8uiUlFyL4Ni2mT+LZsQW7jmbVzH/T4IZ4dNxES6dzv8j
 6hnfU/SdsX7wLIaHOtdVlVEP+weE6Uev4uOG4C3CDC1QOvLcLCaIX15W8
 0Swk2f3wk2QPQhlz5HbSkOoObMoERXyxKVbsA07Q4ZlVXpfr0Q0GIkG3Q
 v599jW+WKDznci93MjMLSOO0TRnUUQ7KPTSwDsWyUWjK5R7N1qDu9KXBN A==;
X-CSE-ConnectionGUID: k6U4iGF3Si2T7AS1tcBMcQ==
X-CSE-MsgGUID: XOb2OfFdQ4e/EIdi4xsXVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="15662982"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="15662982"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 14:46:33 -0700
X-CSE-ConnectionGUID: mBctcbMUTSuOQPOH34FwRA==
X-CSE-MsgGUID: /Vom/KmYR0GWvDR++eAYGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="42157813"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.119.62])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 14:46:33 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 6/9] drm/xe/vf: Don't support gtidle if VF
Date: Wed, 19 Jun 2024 23:45:54 +0200
Message-Id: <20240619214557.905-7-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240619214557.905-1-michal.wajdeczko@intel.com>
References: <20240619214557.905-1-michal.wajdeczko@intel.com>
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

VF drivers can't access any of gtidle control registers as this
functionality is owned by the PF driver.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_idle.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
index 5d6181117ab2..67aba4140510 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle.c
+++ b/drivers/gpu/drm/xe/xe_gt_idle.c
@@ -15,6 +15,7 @@
 #include "xe_macros.h"
 #include "xe_mmio.h"
 #include "xe_pm.h"
+#include "xe_sriov.h"
 
 /**
  * DOC: Xe GT Idle
@@ -100,6 +101,9 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt)
 	u32 pg_enable;
 	int i, j;
 
+	if (IS_SRIOV_VF(xe))
+		return;
+
 	/* Disable CPG for PVC */
 	if (xe->info.platform == XE_PVC)
 		return;
@@ -130,6 +134,9 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt)
 
 void xe_gt_idle_disable_pg(struct xe_gt *gt)
 {
+	if (IS_SRIOV_VF(gt_to_xe(gt)))
+		return;
+
 	xe_device_assert_mem_access(gt_to_xe(gt));
 	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
 
@@ -214,6 +221,9 @@ int xe_gt_idle_init(struct xe_gt_idle *gtidle)
 	struct kobject *kobj;
 	int err;
 
+	if (IS_SRIOV_VF(xe))
+		return 0;
+
 	kobj = kobject_create_and_add("gtidle", gt->sysfs);
 	if (!kobj)
 		return -ENOMEM;
@@ -246,6 +256,9 @@ void xe_gt_idle_enable_c6(struct xe_gt *gt)
 	xe_device_assert_mem_access(gt_to_xe(gt));
 	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
 
+	if (IS_SRIOV_VF(gt_to_xe(gt)))
+		return;
+
 	/* Units of 1280 ns for a total of 5s */
 	xe_mmio_write32(gt, RC_IDLE_HYSTERSIS, 0x3B9ACA);
 	/* Enable RC6 */
@@ -258,6 +271,9 @@ void xe_gt_idle_disable_c6(struct xe_gt *gt)
 	xe_device_assert_mem_access(gt_to_xe(gt));
 	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
 
+	if (IS_SRIOV_VF(gt_to_xe(gt)))
+		return;
+
 	xe_mmio_write32(gt, RC_CONTROL, 0);
 	xe_mmio_write32(gt, RC_STATE, 0);
 }
-- 
2.43.0

