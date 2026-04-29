Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 172FBFF8864
	for <intel-xe@archiver.kernel.org>; Wed, 29 Apr 2026 05:19:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C93B710EE56;
	Wed, 29 Apr 2026 05:19:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fzgOgIE9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DDB010E566
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Apr 2026 05:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777439939; x=1808975939;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/Z5voM0kgpvVsZ3MFiUK/iv1OOPmQ8wBIK3y59j3Vx0=;
 b=fzgOgIE9SGrYZXKFhApKTWgc8FikZN9ZjoMQCFc+/9dY4ULeVPyfJWfU
 kscxqieYDVA7IOcCWM3bqQGGIJ5zRucQwcmXfU2X4/24x7QBY5FPl+IZH
 yrdaWq6oQIi2JJVTvrIhF60PsDz7Y4xBTeVW3tFpYJqxNvwWmSIRgyukB
 QA8cEelj9GyHQfvjjHUoLGrBQBNqjmr5O8gjWuYIoDaunFYh3IFapBC/0
 iKNJ4mn2liWlu5BnbXp0dr3jcxKkKaWCjJm3GmAVbRbbVKjs1WyjSAOwg
 O7jyJRhDAM8OP+ny+zh0h4orKo3FmQlAA/pTjzcSqcwjUj2D3mePuy8Jb A==;
X-CSE-ConnectionGUID: fYJMA1+eTIKhCHRfI63NoA==
X-CSE-MsgGUID: J3mIMefnS32enS8ZJ3VdwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="82217526"
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; d="scan'208";a="82217526"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 22:18:59 -0700
X-CSE-ConnectionGUID: Jh6ijZMaT82Xod3OPJfv/g==
X-CSE-MsgGUID: yo9HC9ayQsea5DBLVS61kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; d="scan'208";a="239153881"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 22:18:56 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: [PATCH v4 5/6] drm/xe/xe_ras: Move xe drm_ras registration
Date: Wed, 29 Apr 2026 11:21:49 +0530
Message-ID: <20260429055147.1579576-13-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260429055147.1579576-8-riana.tauro@intel.com>
References: <20260429055147.1579576-8-riana.tauro@intel.com>
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

Move xe drm_ras registration to RAS initialization flow and keep
hardware error initialization for processing errors reported
via irq.

Also reorder soc remapper and system controller initialization to
early probe as ras init is dependent on both.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c   | 19 +++++++++++--------
 drivers/gpu/drm/xe/xe_hw_error.c | 13 -------------
 drivers/gpu/drm/xe/xe_ras.c      | 19 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras.h      |  1 +
 4 files changed, 31 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 4b45b617a039..041af7ffc8bb 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -62,6 +62,7 @@
 #include "xe_psmi.h"
 #include "xe_pxp.h"
 #include "xe_query.h"
+#include "xe_ras.h"
 #include "xe_shrinker.h"
 #include "xe_soc_remapper.h"
 #include "xe_survivability_mode.h"
@@ -962,6 +963,16 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
+	err = xe_soc_remapper_init(xe);
+	if (err)
+		return err;
+
+	err = xe_sysctrl_init(xe);
+	if (err)
+		return err;
+
+	xe_ras_init(xe);
+
 	/*
 	 * Now that GT is initialized (TTM in particular),
 	 * we can try to init display, and inherit the initial fb.
@@ -1002,10 +1013,6 @@ int xe_device_probe(struct xe_device *xe)
 
 	xe_nvm_init(xe);
 
-	err = xe_soc_remapper_init(xe);
-	if (err)
-		return err;
-
 	err = xe_heci_gsc_init(xe);
 	if (err)
 		return err;
@@ -1044,10 +1051,6 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		goto err_unregister_display;
 
-	err = xe_sysctrl_init(xe);
-	if (err)
-		goto err_unregister_display;
-
 	err = xe_device_sysfs_init(xe);
 	if (err)
 		goto err_unregister_display;
diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
index 2a31b430570e..c6836957dca7 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.c
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -518,14 +518,6 @@ void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl)
 	}
 }
 
-static int hw_error_info_init(struct xe_device *xe)
-{
-	if (xe->info.platform != XE_PVC)
-		return 0;
-
-	return xe_drm_ras_init(xe);
-}
-
 /*
  * Process hardware errors during boot
  */
@@ -552,16 +544,11 @@ static void process_hw_errors(struct xe_device *xe)
 void xe_hw_error_init(struct xe_device *xe)
 {
 	struct xe_tile *tile = xe_device_get_root_tile(xe);
-	int ret;
 
 	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
 		return;
 
 	INIT_WORK(&tile->csc_hw_error_work, csc_hw_error_work);
 
-	ret = hw_error_info_init(xe);
-	if (ret)
-		drm_err(&xe->drm, "Failed to initialize XE DRM RAS (%pe)\n", ERR_PTR(ret));
-
 	process_hw_errors(xe);
 }
diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index bb01c4c2f688..626ec342218d 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -4,6 +4,7 @@
  */
 
 #include "xe_device_types.h"
+#include "xe_drm_ras.h"
 #include "xe_pm.h"
 #include "xe_printk.h"
 #include "xe_ras.h"
@@ -200,3 +201,21 @@ int xe_ras_clear_counter(struct xe_device *xe, enum drm_xe_ras_error_severity se
 	return 0;
 }
 
+/**
+ * xe_ras_init - Initialize Xe RAS
+ * @xe: xe device instance
+ *
+ * Initialize Xe RAS
+ */
+void xe_ras_init(struct xe_device *xe)
+{
+	int ret;
+
+	if (xe->info.platform != XE_PVC)
+		return;
+
+	ret = xe_drm_ras_init(xe);
+	if (ret)
+		drm_err(&xe->drm, "Failed to initialize xe_drm_ras %d\n", ret);
+}
+
diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
index 5b46d586be19..c2742e1ce553 100644
--- a/drivers/gpu/drm/xe/xe_ras.h
+++ b/drivers/gpu/drm/xe/xe_ras.h
@@ -14,5 +14,6 @@ int xe_ras_get_counter(struct xe_device *xe, enum drm_xe_ras_error_severity seve
 		       u32 error_id, u32 *value);
 int xe_ras_clear_counter(struct xe_device *xe, enum drm_xe_ras_error_severity severity,
 			 u32 error_id);
+void xe_ras_init(struct xe_device *xe);
 
 #endif
-- 
2.47.1

