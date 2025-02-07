Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13552C021A4
	for <intel-xe@archiver.kernel.org>; Fri,  7 Feb 2025 22:22:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7D0F10EBC5;
	Fri,  7 Feb 2025 22:22:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HNH8t+SN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 842D610EBB7
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Feb 2025 22:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738966803; x=1770502803;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UtgTQx45HcBrabmvrZlwqXENaRz3nYoxRDQqgBy2GeU=;
 b=HNH8t+SN4W12GNASTHLPJQX9DhE2uW4y41FjJq5Yl6JeiHy+t4E2OEgN
 88gEDMfTjLLJey4itU1rg/ab6CPB5Xz4v5sxMt2R4t1AylRlDOgO61w5g
 BHrDFJwfJy9vmlruoQtf+MvYrX1jlTAZABkJ6KijwIeT9E1IAzUErdAAd
 1PZBCffhIlDEnGQwjba/K9pAkQgOlNs9BmdGvtCfDKSG/CyTyBB+ExzTF
 lISRZlFxXkFG6CuoRMy92o5WRxU5sZ9ogm7Z7COzNCDWWV1ictMZJQEeR
 SJff3Zn6+uZExz1ZDsit3+/BazQIVmOqCPr/kpVyMvrohbVYQTk+VqVYI A==;
X-CSE-ConnectionGUID: hnoe2ge9Q6G4CJpAPDkYyA==
X-CSE-MsgGUID: rgeAqdOqSEKlc8i5SzcRRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="51050692"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="51050692"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 14:20:03 -0800
X-CSE-ConnectionGUID: qYIOgh1vTuy6hME9feSa5w==
X-CSE-MsgGUID: JVPIOKmKSoejoMw6EGbHig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; d="scan'208";a="112158432"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 14:20:03 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH v3 11/13] drm/xe/oa: Handle errors in xe_oa_register()
Date: Fri,  7 Feb 2025 14:19:43 -0800
Message-ID: <20250207221945.2878241-12-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250207221945.2878241-1-lucas.demarchi@intel.com>
References: <20250207221945.2878241-1-lucas.demarchi@intel.com>
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
index 5e4c50a70df35..6f90d74330524 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -871,15 +871,17 @@ int xe_device_probe(struct xe_device *xe)
 
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
 
@@ -896,7 +898,9 @@ int xe_device_probe(struct xe_device *xe)
 
 	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
 
-err_fini_display:
+err_unregister_display:
+	xe_display_unregister(xe);
+err_remove_display:
 	xe_display_driver_remove(xe);
 
 	return err;
@@ -962,8 +966,6 @@ void xe_device_remove(struct xe_device *xe)
 
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

