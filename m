Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16F69D58B36
	for <intel-xe@archiver.kernel.org>; Mon, 16 Mar 2026 05:30:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B877C10E213;
	Mon, 16 Mar 2026 05:30:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lN97XJV+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D511110E213
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Mar 2026 05:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773639001; x=1805175001;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=n4yK5ZVrj3RxmeytC9qrutGYv/1qI68GVgUh7q9D6ec=;
 b=lN97XJV+RUs6JzikIWIYAw1DkaR4oNnQbK9ZItp32+niGvvqRA9F6ofh
 1CV6/6qqGepMZya07xEiOMaGTz65sGgMITMr/9UYv2f+0WnmJhngh6r2R
 rXDxOwe9RB0T5fXUQYpBrpt1BGXFdoEj3CdJKisaLmQU2IUpadDqqv4WI
 aIWXgaXTnv1WWMf0ziMQoOnE0qB6hJrp2esEtj6AsjbTNfdxtqsV49rwY
 dbxClxFRwmVYqo4H29hdqYDRXCKIWR9Rzv5gKBjI0er0adpBzYA2a99VB
 /JoAkDgXYPscXYOGGo/E5DO1OfQNDMgZx86/2HojqJ9cYmzWoaggTRuIZ Q==;
X-CSE-ConnectionGUID: 5NPPC6/KSoG8MvVB0oZX/g==
X-CSE-MsgGUID: wyl68GDnQWqlw4ccjleodA==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="73664444"
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="73664444"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2026 22:30:00 -0700
X-CSE-ConnectionGUID: 5C8XS5YZQ42apdmPbgk/KQ==
X-CSE-MsgGUID: iDN6n2bMQUWAgrRvhTvc/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="244839809"
Received: from rkoppura-z790i-aorus-ultra.iind.intel.com ([10.190.239.17])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2026 22:29:58 -0700
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>,
 Tauro Riana <riana.tauro@intel.com>,
 Gupta Anshuman <anshuman.gupta@intel.com>,
 Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH] drm/xe: Add fault-injection support for CRI throttle reasons
Date: Mon, 16 Mar 2026 10:59:29 +0530
Message-Id: <20260316052929.2069009-1-ravi.kishore.koppuravuri@intel.com>
X-Mailer: git-send-email 2.34.1
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

Required kernel configuration:
CONFIG_KUNIT=m
CONFIG_KUNIT_DEBUGFS=y
CONFIG_FAIL_FUNCTION=y
CONFIG_FAULT_INJECTION=y
CONFIG_FAULT_INJECTION_DEBUG_FS=y
CONFIG_FUNCTION_ERROR_INJECTION=y

Usage example:
Setup fault injection for throttle function

FAILTYPE=fail_function
FAILFUNC=xe_gt_throttle_inject_errno

echo > /sys/kernel/debug/$FAILTYPE/inject
echo $FAILFUNC > /sys/kernel/debug/$FAILTYPE/inject
printf %#x -1 > /sys/kernel/debug/$FAILTYPE/$FAILFUNC/retval

echo N > /sys/kernel/debug/$FAILTYPE/task-filter
echo 10 > /sys/kernel/debug/$FAILTYPE/probability
echo 0 > /sys/kernel/debug/$FAILTYPE/interval
echo -1 > /sys/kernel/debug/$FAILTYPE/times
echo 0 > /sys/kernel/debug/$FAILTYPE/space
echo 1 > /sys/kernel/debug/$FAILTYPE/verbose

Sample result of verifying throttle reasons on Battlemage platform
```
root@DUT2107BMGFRD:/home/gta# cat /sys/devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:01.0/0000:03:00.0/tile0/gt0/freq0/throttle/reasons
thermal
```
This enables comprehensive testing of error paths in fetching the
frequency throttle reason.

Cc: Tauro Riana <riana.tauro@intel.com>
Cc: Gupta Anshuman <anshuman.gupta@intel.com>
Cc: Sk Anirban <sk.anirban@intel.com>
Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_throttle.c | 37 ++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_throttle.c b/drivers/gpu/drm/xe/xe_gt_throttle.c
index 1e7e3a31aa69..07b3ca5eaa9a 100644
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
@@ -81,11 +84,36 @@ static struct throttle_attribute *kobj_attribute_to_throttle(struct kobj_attribu
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
+	if (err == INT_MAX)
+		return 0;
+
+	if (err >= 0)
+		return 0;
+
+	err = -err;
+
+	if (err > 31)
+		return 0;
+
+	return BIT(err) & mask;
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
@@ -98,7 +126,14 @@ u32 xe_gt_throttle_get_limit_reasons(struct xe_gt *gt)
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

