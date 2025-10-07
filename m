Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CBAFCCA470
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 09:40:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 389B310E180;
	Tue,  7 Oct 2025 09:40:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kPfAJN6c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F37B910E180
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Oct 2025 09:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759830034; x=1791366034;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6lGMkQc+cemvkQ+p91Oft/t0cWjSiownOhsO7Ko+vK4=;
 b=kPfAJN6cizJvfrmnonf06K4MVCfERfVC96ZtRDwEJ7x0Tlp1K0kPenZM
 rKOh9PyxSQkurDw5HxgRl/xm20tyg/ORkKzhQ1GhUwD8wd21pGNXSmDM+
 cAVbG98gkQhBrBGaksVJE0bprSaGK9MEYDYd86G0hTmPyZtepTEBrybtV
 7cRxza0HMAI7MF6or3BBktpXmp+G68RolIl6dclkETrwCaxAvf4Cc/ThR
 aU4AD554MN+Wygp304Yq3PitBJh52SlAbKMl5Ekvc1NcSvgNQMa7MY4TK
 9f1Z9+rNyVRYCY3JNPTareh+q9ZrjgUC8FI/jpgWjcAsX98W8UdNwwXYy A==;
X-CSE-ConnectionGUID: yaclF9pcSIGZLbvNqH9IYw==
X-CSE-MsgGUID: C6dmfoABSAGHFKCvMlxrsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="65654064"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="65654064"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 02:40:33 -0700
X-CSE-ConnectionGUID: OE7jE5SuRI2CHWOu3pBULw==
X-CSE-MsgGUID: 715WhcYpSz23sNWHBOoM1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="210775888"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk..)
 ([10.190.239.37])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 02:40:31 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH] drm/xe: Fix include order alphabetically
Date: Tue,  7 Oct 2025 15:10:18 +0530
Message-Id: <20251007094018.1400399-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Sort the include lines alphabetically

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 386940323630..ccfbfd7fa858 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -3,20 +3,19 @@
  * Copyright © 2021 Intel Corporation
  */
 
-#include "xe_device.h"
-
-#include <linux/aperture.h>
-#include <linux/delay.h>
-#include <linux/fault-inject.h>
-#include <linux/iopoll.h>
-#include <linux/units.h>
-
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_client.h>
 #include <drm/drm_gem_ttm_helper.h>
 #include <drm/drm_ioctl.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_print.h>
+#include <generated/xe_device_wa_oob.h>
+#include <generated/xe_wa_oob.h>
+#include <linux/aperture.h>
+#include <linux/delay.h>
+#include <linux/fault-inject.h>
+#include <linux/iopoll.h>
+#include <linux/units.h>
 #include <uapi/drm/xe_drm.h>
 
 #include "display/xe_display.h"
@@ -27,6 +26,7 @@
 #include "xe_bo_evict.h"
 #include "xe_debugfs.h"
 #include "xe_devcoredump.h"
+#include "xe_device.h"
 #include "xe_device_sysfs.h"
 #include "xe_dma_buf.h"
 #include "xe_drm_client.h"
@@ -73,9 +73,6 @@
 #include "xe_wait_user_fence.h"
 #include "xe_wa.h"
 
-#include <generated/xe_device_wa_oob.h>
-#include <generated/xe_wa_oob.h>
-
 static int xe_file_open(struct drm_device *dev, struct drm_file *file)
 {
 	struct xe_device *xe = to_xe_device(dev);
-- 
2.34.1

