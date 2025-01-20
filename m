Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5178CC02185
	for <intel-xe@archiver.kernel.org>; Mon, 20 Jan 2025 06:20:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D8A410E2F3;
	Mon, 20 Jan 2025 06:20:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jtaOMzP6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D990E10E304
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Jan 2025 06:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737354047; x=1768890047;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BCeXfMYGb3rTvzpC69jFlxC75M32r20i1KXQMqtiW9w=;
 b=jtaOMzP6yUq4YW1NbV7yOmv985rlwBvej0ExBz10xLNqCMjRys8oWEBt
 HUYmfWjEc9btlP7EYAJ6a6UCRAwngx2D8k2rjx9WtWiMCccUFT5b+BYJ7
 x7ZJK20RzGo5G+wkWkDS5I0vHy2D6zKQT7C01UWvnTSam8iSx1jorzO8t
 4daYD5irec9NQ6bmZ8MYA4apqFeFSTw0KzIjf02/oX/W3Foig4E+QaQE2
 L5hIgoCR5Al/fxmEeuGcLM7+9vijsTk/QusC7Svc9mdalFygpe75s4+u3
 f0tFK5J2kw9SvnkpMPva4kYPJiCfRTxn7on1s+0zjYZJMg2MajY4H83oG Q==;
X-CSE-ConnectionGUID: siA9i/B2QwG8SspP9dv93w==
X-CSE-MsgGUID: xPENj1UpSNawcfEF/Y5VrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="37953814"
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; d="scan'208";a="37953814"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2025 22:20:47 -0800
X-CSE-ConnectionGUID: BShI8iOVR0mmu0Yv6ZpLng==
X-CSE-MsgGUID: /f4HB9iYTte6/yLknbht7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; d="scan'208";a="111370354"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2025 22:20:46 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@intel.com, jani.nikula@linux.intel.com,
 alexander.usyskin@intel.com
Subject: [PATCH v3 3/3] drm/xe: Initialize mei-gsc and vsec in survivability
 mode
Date: Mon, 20 Jan 2025 12:10:42 +0530
Message-ID: <20250120064042.2596178-4-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250120064042.2596178-1-riana.tauro@intel.com>
References: <20250120064042.2596178-1-riana.tauro@intel.com>
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
index e1ce14d8dec2..16e805e32887 100644
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

