Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A53BEC6FD1F
	for <intel-xe@archiver.kernel.org>; Thu, 21 Mar 2024 21:37:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6752410FC65;
	Thu, 21 Mar 2024 21:37:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PKQ4vlYt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C55210FC65
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Mar 2024 21:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711057075; x=1742593075;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1ai9wRf4Kdz5gSRtBksutJgfIKDUT1AYpRVw4MABDeA=;
 b=PKQ4vlYtL/PyjyAVpPh4RycYoVJHK8dKqcy4o0ehspXHOWEYJN6BQ6cm
 J9dPGn/rGiuGYsJKgw5iftW5h7WYDvrxLrQMsvjDn3m/o98L+5Ed2/9vM
 FLb6ZNPlNG+zC2aAKpQ3OtCicYuWEUrkBEodUmbMl6oeIg9P6hup84j++
 UykSqWvQUeNj2xwGe0CzxkakbWQFgIcxK5WUkfmWQy9BRTkh1luGk9OLh
 R1ki4YluZzOu2LoSKkBCd1m1hleyD0ihVWhkzr2HHWz+K5Fcz3sbrVSIL
 wHn8VhUteotaIKYHmeKwuLMVROorOlJQrWIox+R2EBcHoCnpEvo1MAT+r A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="17521963"
X-IronPort-AV: E=Sophos;i="6.07,144,1708416000"; d="scan'208";a="17521963"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 14:37:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,144,1708416000"; d="scan'208";a="14690951"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 14:37:54 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH] drm/xe: Remove redundant functions to get xe
Date: Thu, 21 Mar 2024 14:38:18 -0700
Message-ID: <20240321213818.72311-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
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

xe_device.h implements these helpers, just use them.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
index c17cce53f19d..aba01edffacd 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
@@ -7,6 +7,7 @@
 #include <linux/kobject.h>
 #include <linux/sysfs.h>
 
+#include "xe_device.h"
 #include "xe_gt.h"
 #include "xe_hw_engine_class_sysfs.h"
 #include "xe_pm.h"
@@ -569,18 +570,6 @@ static void xe_hw_engine_sysfs_kobj_release(struct kobject *kobj)
 	kfree(kobj);
 }
 
-#include "xe_pm.h"
-
-static inline struct xe_device *pdev_to_xe_device(struct pci_dev *pdev)
-{
-	return pci_get_drvdata(pdev);
-}
-
-static inline struct xe_device *to_xe_device(const struct drm_device *dev)
-{
-	return container_of(dev, struct xe_device, drm);
-}
-
 static ssize_t xe_hw_engine_class_sysfs_attr_show(struct kobject *kobj,
 						  struct attribute *attr,
 						  char *buf)
-- 
2.43.0

