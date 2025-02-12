Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A71BC02198
	for <intel-xe@archiver.kernel.org>; Wed, 12 Feb 2025 19:36:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6958F10E26A;
	Wed, 12 Feb 2025 19:36:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GWaPukTL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4612910E978
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Feb 2025 19:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739388996; x=1770924996;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iZLFZxlOESocNvFCt3sJ6x/BELwbkAX7c/i3qdWErnI=;
 b=GWaPukTLmMbN73q077KeTcrspUPzoZHXfeiFtI8z9nekrzqY46qKrZMO
 RNo1ktNEOU1gWN5/naamTDhv1OO5NyLHjwZKLQSzluHwsoG2UycXsTB18
 hwzpGkjL19tIhCoPo4mS1gnDvdu0+/QpTW3WbmX/T/XrDpC6/jEPYc5pp
 Oyaaq8ZqG0PwNVu7YE27DVZbCMxEvDqRnU/CudSNG3UTvBRjW/Mv5+byw
 lEbqgts3naSlhajvWiAmenN12Ywsc+TdDRZCvTChFF0YHIU5fz0gF5m/s
 MP8tf2ZiV4W0uechis+p6TYs2U1usq/fitpVuvgU+fEK7Ume6Yho0IYrT g==;
X-CSE-ConnectionGUID: XlrM3F+vThW0tjn2wSZUgQ==
X-CSE-MsgGUID: 5Wi+11QQRdaZ87vox13xHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40184252"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="40184252"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 11:36:36 -0800
X-CSE-ConnectionGUID: dG3c/PrsSJ+IPU56hWqmmQ==
X-CSE-MsgGUID: FtA2Ga4fQ7iohScdxnSVRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="113437886"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 11:36:36 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH v4 11/13] drm/xe/oa: Handle errors in xe_oa_register()
Date: Wed, 12 Feb 2025 11:35:58 -0800
Message-ID: <20250212193600.475089-12-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250212193600.475089-1-lucas.demarchi@intel.com>
References: <20250212193600.475089-1-lucas.demarchi@intel.com>
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
index 2e1b7be7f60ab..22c9de08b927c 100644
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
@@ -982,8 +986,6 @@ void xe_device_remove(struct xe_device *xe)
 
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

