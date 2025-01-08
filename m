Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A19EE77199
	for <intel-xe@archiver.kernel.org>; Wed,  8 Jan 2025 10:20:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8C5410E84F;
	Wed,  8 Jan 2025 10:20:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RDKxZQad";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5D3110E858
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Jan 2025 10:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736331620; x=1767867620;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=E1jtsF1cwxqUUsO/hkT7gKZlQvEk7UPWpkRtnsJsS1A=;
 b=RDKxZQadEf0M9H7LmCW8yh2U1gWF/caBCvAr9eKGCeh5XgVc/HEfHlg3
 2/A2qL0G6VQ8n8BNa2emVgAwFHKkibKThDdP4eC9cflI5oH8qyG8y7n3T
 XaTywQIseMEi1WvLX6Eq8unYZn3poYirSgOWqN3aOZc1lqWopgdyRpxYL
 TG+ghzNt/2CgM+pdv/CWwpitARYt9Gmjxs6OCizD2cUzr0jyDWay24rrV
 GFTsuIVeIqvE7/NfnOm43g+EDMIq31lAZLlUDYnYioTVH/JmKnkofMApw
 D/xpwIlYkJ9BmzKvDyIeWeTlGB9GwYnAPp1GbTTMd3yFtX/SHwI4cn7Xb g==;
X-CSE-ConnectionGUID: DmudOfsoSB2afEfkOp1cqw==
X-CSE-MsgGUID: 182sg39LQ2CxoDcoDJ2Vmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="59014983"
X-IronPort-AV: E=Sophos;i="6.12,297,1728975600"; d="scan'208";a="59014983"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2025 02:20:20 -0800
X-CSE-ConnectionGUID: mdv+tRhaQBOOptUrUNchPg==
X-CSE-MsgGUID: PzT47CDUSeOUuX9fErtoKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="133950087"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2025 02:20:17 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@intel.com, jani.nikula@linux.intel.com,
 matthew.d.roper@intel.com, alexander.usyskin@intel.com
Subject: [PATCH v2 3/3] drm/xe: Initialize mei-gsc and vsec in survivability
 mode
Date: Wed,  8 Jan 2025 16:09:59 +0530
Message-ID: <20250108103959.1219312-4-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250108103959.1219312-1-riana.tauro@intel.com>
References: <20250108103959.1219312-1-riana.tauro@intel.com>
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
index 4a978c7018c9..39ab898193a1 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
@@ -13,8 +13,10 @@
 
 #include "xe_device.h"
 #include "xe_gt.h"
+#include "xe_heci_gsc.h"
 #include "xe_mmio.h"
 #include "xe_pcode_api.h"
+#include "xe_vsec.h"
 
 #define MAX_SCRATCH_MMIO 8
 
@@ -152,6 +154,10 @@ static void enable_survivability_mode(struct xe_device *xe)
 		drm_warn(&xe->drm, "Failed to create survivability sysfs files\n");
 		return;
 	}
+
+	xe_heci_gsc_init(xe);
+
+	xe_vsec_init(xe);
 }
 
 /**
@@ -203,6 +209,7 @@ void xe_survivability_mode_remove(struct xe_device *xe)
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 
 	sysfs_remove_file(&xe->drm.dev->kobj, &dev_attr_survivability_mode.attr);
+	xe_heci_gsc_fini(xe);
 	kfree(survivability->info);
 	pci_set_drvdata(pdev, NULL);
 }
-- 
2.47.1

