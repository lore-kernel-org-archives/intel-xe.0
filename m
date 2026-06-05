Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E06ACD8C84
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jun 2026 16:04:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47C2B10E63A;
	Fri,  5 Jun 2026 16:04:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nB4DnGY/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADF4110E511;
 Fri,  5 Jun 2026 16:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780675495; x=1812211495;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=n+pmT9aLIgIWmdlRu6E2QHM/4DPYbUSAGm4f0ZJ4Hj4=;
 b=nB4DnGY/X9CkrmfGcvIuuwQsmja80D4m4G5JKqiqwuzfNXrSbGBgpijr
 q/hTBjW1DenCQIELbWyXDyGo+mYCjMJoJ7tjy6xso+j7A2TmllWGqodlI
 b4X6tAGzOkx0XFZYrYK4P/hvmm1DgML7Q5u+Z1lK3qVS2SvBmD7ZrNCEK
 HsJoZF2on6Mo80mXoJPTAVlKdW4VeQ+piZ0ji6sPefLyBBbXRus/ZXLwv
 0Qd3G/FFXWqvo5XGfB5MwzO0Edxl/cGyeqU5jAbnfMHkR12BN9uT06qIl
 glOUaMrgf64W5IUThqIRP2zdMum8pKtoR6WamZS/6+kyv4/Cu8hmmavgU Q==;
X-CSE-ConnectionGUID: z8RR3aBOSWeChff4oWZJgQ==
X-CSE-MsgGUID: rcEv99GRQ4WA6ZyuXjpjnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11808"; a="98928781"
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; d="scan'208";a="98928781"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 09:04:55 -0700
X-CSE-ConnectionGUID: cMIGcQ7XR1qKWLgnefdoRw==
X-CSE-MsgGUID: yiFR2VNHQTi0sttEtDRXRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; d="scan'208";a="268566314"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 09:04:53 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 raag.jadav@intel.com
Subject: [PATCH 3/5] drm/xe/i2c: Use xe print functions in xe_i2c.c
Date: Sat,  6 Jun 2026 00:04:42 +0800
Message-ID: <20260605160444.3833295-4-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260605160444.3833295-1-jonathan.cavitt@intel.com>
References: <20260605160444.3833295-1-jonathan.cavitt@intel.com>
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

Update xe_i2c.c to use the xe error reporting helper functions in
xe_printk.h instead of directly calling the associated drm print
functions from drm_print.h

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_i2c.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
index 706783863d07..148e82e01ae8 100644
--- a/drivers/gpu/drm/xe/xe_i2c.c
+++ b/drivers/gpu/drm/xe/xe_i2c.c
@@ -5,7 +5,6 @@
  * Copyright (C) 2025 Intel Corporation.
  */
 
-#include <drm/drm_print.h>
 #include <linux/array_size.h>
 #include <linux/container_of.h>
 #include <linux/device.h>
@@ -30,6 +29,7 @@
 #include "xe_device.h"
 #include "xe_i2c.h"
 #include "xe_mmio.h"
+#include "xe_printk.h"
 #include "xe_sriov.h"
 #include "xe_survivability_mode.h"
 
@@ -285,7 +285,7 @@ void xe_i2c_pm_suspend(struct xe_device *xe)
 		return;
 
 	xe_mmio_rmw32(mmio, I2C_CONFIG_PMCSR, PCI_PM_CTRL_STATE_MASK, (__force u32)PCI_D3hot);
-	drm_dbg(&xe->drm, "pmcsr: 0x%08x\n", xe_mmio_read32(mmio, I2C_CONFIG_PMCSR));
+	xe_dbg(xe, "pmcsr: 0x%08x\n", xe_mmio_read32(mmio, I2C_CONFIG_PMCSR));
 }
 
 void xe_i2c_pm_resume(struct xe_device *xe, bool d3cold)
@@ -299,7 +299,7 @@ void xe_i2c_pm_resume(struct xe_device *xe, bool d3cold)
 		xe_mmio_rmw32(mmio, I2C_CONFIG_CMD, 0, PCI_COMMAND_MEMORY | PCI_COMMAND_MASTER);
 
 	xe_mmio_rmw32(mmio, I2C_CONFIG_PMCSR, PCI_PM_CTRL_STATE_MASK, (__force u32)PCI_D0);
-	drm_dbg(&xe->drm, "pmcsr: 0x%08x\n", xe_mmio_read32(mmio, I2C_CONFIG_PMCSR));
+	xe_dbg(xe, "pmcsr: 0x%08x\n", xe_mmio_read32(mmio, I2C_CONFIG_PMCSR));
 }
 
 static void xe_i2c_remove(void *data)
-- 
2.53.0

