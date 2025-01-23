Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF837C0218B
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jan 2025 07:03:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88F5010E779;
	Thu, 23 Jan 2025 07:03:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dsWpoHxr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A78810E779
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jan 2025 07:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737615809; x=1769151809;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=z4rDaLsRXT0CdEA11F+puGk7pcueAxlchBSYdQU2ad8=;
 b=dsWpoHxrMh+gNEk0yNgivHRk+AI8mibxb0vpSfEZvsHrQ1hq+9xI1Ofz
 JOy0UIcCunLNnGf4bnEOKHV+zC9i7voN87Q+zuT3YgFSZEwUf/g1kf/3e
 bKuNhuTaSl4JsuKGOnodEHCshhpkK/xycn4e7w+tySbKDfVF2aZ5b1QwI
 9doCw1gBXuYcz458+cff9zv93MbutiLEjHYrVqVE5hi0VopS7uNtj3VlQ
 egLoIEcmx/MwpQjLTSeVLDEgXta8f0AGeOAJP9rd8qtEG4SEQ9+xcV+3C
 7PKXOoGVtBBYjqV5OqpOXlnasZkkNFpFrQRZdxgNVNZHsueebvNY6aYUD Q==;
X-CSE-ConnectionGUID: lKfu3mlwSIOeE024HB8/YA==
X-CSE-MsgGUID: COKJZKN7TlW/U3P1gyWbCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="40927287"
X-IronPort-AV: E=Sophos;i="6.13,227,1732608000"; d="scan'208";a="40927287"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 23:03:29 -0800
X-CSE-ConnectionGUID: d1Q/0evmS/WAAuuhtwSozQ==
X-CSE-MsgGUID: PR5wFiGnRduwi8l+iFD3YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,227,1732608000"; d="scan'208";a="107183470"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 23:03:27 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@intel.com
Subject: [PATCH v4 3/3] drm/xe: Initialize mei-gsc and vsec in survivability
 mode
Date: Thu, 23 Jan 2025 12:53:43 +0530
Message-ID: <20250123072343.326919-4-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250123072343.326919-1-riana.tauro@intel.com>
References: <20250123072343.326919-1-riana.tauro@intel.com>
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

Initialize mei-gsc in survivability mode and disable HECI
interrupts. Also initialize vsec in survivability mode

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/gpu/drm/xe/xe_heci_gsc.c           | 3 ++-
 drivers/gpu/drm/xe/xe_survivability_mode.c | 7 +++++++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_heci_gsc.c b/drivers/gpu/drm/xe/xe_heci_gsc.c
index d765bfd3636b..06dc78d3a812 100644
--- a/drivers/gpu/drm/xe/xe_heci_gsc.c
+++ b/drivers/gpu/drm/xe/xe_heci_gsc.c
@@ -12,6 +12,7 @@
 #include "xe_drv.h"
 #include "xe_heci_gsc.h"
 #include "xe_platform_types.h"
+#include "xe_survivability_mode.h"
 
 #define GSC_BAR_LENGTH  0x00000FFC
 
@@ -200,7 +201,7 @@ void xe_heci_gsc_init(struct xe_device *xe)
 		return;
 	}
 
-	if (!def->use_polling) {
+	if (!def->use_polling && !xe_survivability_mode_enabled(xe)) {
 		ret = heci_gsc_irq_setup(xe);
 		if (ret)
 			goto fail;
diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
index 14d0ab7b75e5..19225ea44318 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
@@ -12,8 +12,10 @@
 
 #include "xe_device.h"
 #include "xe_gt.h"
+#include "xe_heci_gsc.h"
 #include "xe_mmio.h"
 #include "xe_pcode_api.h"
+#include "xe_vsec.h"
 
 #define MAX_SCRATCH_MMIO 8
 
@@ -142,6 +144,10 @@ static void enable_survivability_mode(struct pci_dev *pdev)
 		dev_warn(dev, "Failed to create survivability sysfs files\n");
 		return;
 	}
+
+	xe_heci_gsc_init(xe);
+
+	xe_vsec_init(xe);
 }
 
 /**
@@ -194,6 +200,7 @@ void xe_survivability_mode_remove(struct xe_device *xe)
 	struct device *dev = &pdev->dev;
 
 	sysfs_remove_file(&dev->kobj, &dev_attr_survivability_mode.attr);
+	xe_heci_gsc_fini(xe);
 	kfree(survivability->info);
 	pci_set_drvdata(pdev, NULL);
 }
-- 
2.47.1

