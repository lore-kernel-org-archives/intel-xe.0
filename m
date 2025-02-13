Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4CB5C021A6
	for <intel-xe@archiver.kernel.org>; Thu, 13 Feb 2025 19:29:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A612110EB8A;
	Thu, 13 Feb 2025 19:29:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JT5QFsjN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBAE810EB8A
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Feb 2025 19:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739474976; x=1771010976;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=A36UshyOZdViyHNEUAWXUF1V0SuXw72dzFDpQREk0VA=;
 b=JT5QFsjNePoSd0H/q0ZcSBRAGnOzSIUGAzOXPIVYwSudFyYUP42INkRM
 rMmf2ndhzqeL1M+FgMwC24ctKTM39nfjt9coaqbsws/Q1iW52sZ9Vh/gh
 raJL/XCZWulUEoGVyjv2Dzn7WoMHrK0nj3F0Fp1PjSJZhWKo3zyhEAJ++
 bRT2yjJ7Y0kzVvG2BOoTjwTp1k6nfLawGmBe1H+w9V7RqON2beRWaxTsi
 UzDhs7vWfI+C6zGLc6msQSLjVHQu6PrKrq6TCx1732m6xVRt53l7kbMf6
 IET6j82OVuSYDY1vdAfMHNY3jftzWcm9Iz667RwjbWaAcvr/SaBl0XWwu Q==;
X-CSE-ConnectionGUID: blX+zT15S/K09RTwesNWVg==
X-CSE-MsgGUID: I9b3DLLnRkytQo+e1gQ7Vg==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40127932"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="40127932"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 11:29:35 -0800
X-CSE-ConnectionGUID: OxUKkiBPSOOE9FGKJTvcMA==
X-CSE-MsgGUID: yhFg95NqRFSb0rcuES69ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="150416887"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 11:29:35 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [CI 11/13] drm/xe/oa: Handle errors in xe_oa_register()
Date: Thu, 13 Feb 2025 11:29:07 -0800
Message-ID: <20250213192909.996148-11-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250213192909.996148-1-lucas.demarchi@intel.com>
References: <20250213192909.996148-1-lucas.demarchi@intel.com>
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

Let xe_oa_unregister() be handled by devm infra since it's only putting
the kobject. Also, since kobject_create_and_add may fail, handle the
error accordingly.

Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 14 ++++++++------
 drivers/gpu/drm/xe/xe_oa.c     | 30 +++++++++++++++---------------
 drivers/gpu/drm/xe/xe_oa.h     |  3 +--
 3 files changed, 24 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index db9545b29a356..86f3fd399f9ba 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -877,15 +877,17 @@ int xe_device_probe(struct xe_device *xe)
 
 	err = xe_pxp_init(xe);
 	if (err)
-		goto err_fini_display;
+		goto err_remove_display;
 
 	err = drm_dev_register(&xe->drm, 0);
 	if (err)
-		goto err_fini_display;
+		goto err_remove_display;
 
 	xe_display_register(xe);
 
-	xe_oa_register(xe);
+	err = xe_oa_register(xe);
+	if (err)
+		goto err_unregister_display;
 
 	xe_pmu_register(&xe->pmu);
 
@@ -902,7 +904,9 @@ int xe_device_probe(struct xe_device *xe)
 
 	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
 
-err_fini_display:
+err_unregister_display:
+	xe_display_unregister(xe);
+err_remove_display:
 	xe_display_driver_remove(xe);
 
 	return err;
@@ -971,8 +975,6 @@ void xe_device_remove(struct xe_device *xe)
 
 	xe_display_driver_remove(xe);
 
-	xe_oa_unregister(xe);
-
 	xe_heci_gsc_fini(xe);
 
 	xe_device_call_remove_actions(xe);
diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 2c640185bdeca..d89e6cabf5a56 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -2423,36 +2423,36 @@ int xe_oa_remove_config_ioctl(struct drm_device *dev, u64 data, struct drm_file
 	return ret;
 }
 
+static void xe_oa_unregister(void *arg)
+{
+	struct xe_oa *oa = arg;
+
+	if (!oa->metrics_kobj)
+		return;
+
+	kobject_put(oa->metrics_kobj);
+	oa->metrics_kobj = NULL;
+}
+
 /**
  * xe_oa_register - Xe OA registration
  * @xe: @xe_device
  *
  * Exposes the metrics sysfs directory upon completion of module initialization
  */
-void xe_oa_register(struct xe_device *xe)
+int xe_oa_register(struct xe_device *xe)
 {
 	struct xe_oa *oa = &xe->oa;
 
 	if (!oa->xe)
-		return;
+		return 0;
 
 	oa->metrics_kobj = kobject_create_and_add("metrics",
 						  &xe->drm.primary->kdev->kobj);
-}
-
-/**
- * xe_oa_unregister - Xe OA de-registration
- * @xe: @xe_device
- */
-void xe_oa_unregister(struct xe_device *xe)
-{
-	struct xe_oa *oa = &xe->oa;
-
 	if (!oa->metrics_kobj)
-		return;
+		return -ENOMEM;
 
-	kobject_put(oa->metrics_kobj);
-	oa->metrics_kobj = NULL;
+	return devm_add_action_or_reset(xe->drm.dev, xe_oa_unregister, oa);
 }
 
 static u32 num_oa_units_per_gt(struct xe_gt *gt)
diff --git a/drivers/gpu/drm/xe/xe_oa.h b/drivers/gpu/drm/xe/xe_oa.h
index eb36ce250c615..e510826f9efc6 100644
--- a/drivers/gpu/drm/xe/xe_oa.h
+++ b/drivers/gpu/drm/xe/xe_oa.h
@@ -15,8 +15,7 @@ struct xe_gt;
 struct xe_hw_engine;
 
 int xe_oa_init(struct xe_device *xe);
-void xe_oa_register(struct xe_device *xe);
-void xe_oa_unregister(struct xe_device *xe);
+int xe_oa_register(struct xe_device *xe);
 int xe_oa_stream_open_ioctl(struct drm_device *dev, u64 data, struct drm_file *file);
 int xe_oa_add_config_ioctl(struct drm_device *dev, u64 data, struct drm_file *file);
 int xe_oa_remove_config_ioctl(struct drm_device *dev, u64 data, struct drm_file *file);
-- 
2.48.1

