Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45358C021B6
	for <intel-xe@archiver.kernel.org>; Sat, 22 Feb 2025 00:11:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0944610EB49;
	Sat, 22 Feb 2025 00:11:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="misd7bQY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9FA910E10F
 for <intel-xe@lists.freedesktop.org>; Sat, 22 Feb 2025 00:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740183070; x=1771719070;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=bG5+Cu5YTv7WjAN7o+Zrn4lvqOokctbEPnHJXUudwqo=;
 b=misd7bQYyNh81zdPLcgKBGS9AZerrC7hbfRL7x97FL3O7YB3Qp2TuRVQ
 OL9d/Ppt0M4XY8lFu2A4R9WG+zIJ0w5hW17ly33ow0Vo/WQ9tVhNwhHxK
 aoQOMlqLWgHcPy7OUjEotNJu3U4n0wuaEYXP0x35vG50v6Cm/0Bqb1YSa
 wLGp1QQ7gnRtZg7D5izhf78mLiSoq8rD9jvXsV1BFeojD7MFrVi49q4XH
 fkouFzkzfJrMMK4aQv5CwghZANQX8vKRuKtC5V64QcovdtEvT5V/TBF1M
 TSw7lDQy7JEfGgb/6AQOHNmTDmoejP+GbzmdryjsxzE+rQuITx0nt1qr8 A==;
X-CSE-ConnectionGUID: UXEqc6kURt6HWBjZdLisrA==
X-CSE-MsgGUID: XooioNnXTn+T/x37EtANgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="44926397"
X-IronPort-AV: E=Sophos;i="6.13,306,1732608000"; d="scan'208";a="44926397"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 16:11:09 -0800
X-CSE-ConnectionGUID: PTxQmmvySFezwXBD4jMnFw==
X-CSE-MsgGUID: zpU80lpTS32fAO6W/eETQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,306,1732608000"; d="scan'208";a="115704956"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 16:11:09 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH v2 09/11] drm/xe: Stop ignoring errors from xe_heci_gsc_init()
Date: Fri, 21 Feb 2025 16:10:49 -0800
Message-ID: <20250222001051.3012936-10-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250222001051.3012936-1-lucas.demarchi@intel.com>
References: <20250222001051.3012936-1-lucas.demarchi@intel.com>
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

Do not ignore errors from xe_heci_gsc_init(). For example, it shouldn't
be fine to report successfully entering survivability mode when there's
no communication with gsc working. The driver should also not be
half-initialized in the normal case neither.

Cc: Riana Tauro <riana.tauro@intel.com>
Cc: Alexander Usyskin <alexander.usyskin@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c             |  6 ++--
 drivers/gpu/drm/xe/xe_heci_gsc.c           | 35 +++++++++-------------
 drivers/gpu/drm/xe/xe_heci_gsc.h           |  3 +-
 drivers/gpu/drm/xe/xe_survivability_mode.c |  5 ++--
 4 files changed, 21 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 0f780d6849e2f..1de611fc5240e 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -851,7 +851,9 @@ int xe_device_probe(struct xe_device *xe)
 			return err;
 	}
 
-	xe_heci_gsc_init(xe);
+	err = xe_heci_gsc_init(xe);
+	if (err)
+		return err;
 
 	err = xe_oa_init(xe);
 	if (err)
@@ -903,8 +905,6 @@ void xe_device_remove(struct xe_device *xe)
 	xe_display_unregister(xe);
 
 	drm_dev_unplug(&xe->drm);
-
-	xe_heci_gsc_fini(xe);
 }
 
 void xe_device_shutdown(struct xe_device *xe)
diff --git a/drivers/gpu/drm/xe/xe_heci_gsc.c b/drivers/gpu/drm/xe/xe_heci_gsc.c
index 992ee47abcdb7..3ea325d3db99d 100644
--- a/drivers/gpu/drm/xe/xe_heci_gsc.c
+++ b/drivers/gpu/drm/xe/xe_heci_gsc.c
@@ -89,12 +89,9 @@ static void heci_gsc_release_dev(struct device *dev)
 	kfree(adev);
 }
 
-void xe_heci_gsc_fini(struct xe_device *xe)
+static void xe_heci_gsc_fini(void *arg)
 {
-	struct xe_heci_gsc *heci_gsc = &xe->heci_gsc;
-
-	if (!xe->info.has_heci_gscfi && !xe->info.has_heci_cscfi)
-		return;
+	struct xe_heci_gsc *heci_gsc = arg;
 
 	if (heci_gsc->adev) {
 		struct auxiliary_device *aux_dev = &heci_gsc->adev->aux_dev;
@@ -106,6 +103,7 @@ void xe_heci_gsc_fini(struct xe_device *xe)
 
 	if (heci_gsc->irq >= 0)
 		irq_free_desc(heci_gsc->irq);
+
 	heci_gsc->irq = -1;
 }
 
@@ -172,14 +170,14 @@ static int heci_gsc_add_device(struct xe_device *xe, const struct heci_gsc_def *
 	return ret;
 }
 
-void xe_heci_gsc_init(struct xe_device *xe)
+int xe_heci_gsc_init(struct xe_device *xe)
 {
 	struct xe_heci_gsc *heci_gsc = &xe->heci_gsc;
 	const struct heci_gsc_def *def;
 	int ret;
 
 	if (!xe->info.has_heci_gscfi && !xe->info.has_heci_cscfi)
-		return;
+		return 0;
 
 	heci_gsc->irq = -1;
 
@@ -191,29 +189,24 @@ void xe_heci_gsc_init(struct xe_device *xe)
 		def = &heci_gsc_def_dg2;
 	} else if (xe->info.platform == XE_DG1) {
 		def = &heci_gsc_def_dg1;
-	} else {
-		drm_warn_once(&xe->drm, "Unknown platform\n");
-		return;
 	}
 
-	if (!def->name) {
-		drm_warn_once(&xe->drm, "HECI is not implemented!\n");
-		return;
+	if (!def || !def->name) {
+		drm_warn(&xe->drm, "HECI is not implemented!\n");
+		return 0;
 	}
 
+	ret = devm_add_action_or_reset(xe->drm.dev, xe_heci_gsc_fini, heci_gsc);
+	if (ret)
+		return ret;
+
 	if (!def->use_polling && !xe_survivability_mode_is_enabled(xe)) {
 		ret = heci_gsc_irq_setup(xe);
 		if (ret)
-			goto fail;
+			return ret;
 	}
 
-	ret = heci_gsc_add_device(xe, def);
-	if (ret)
-		goto fail;
-
-	return;
-fail:
-	xe_heci_gsc_fini(xe);
+	return heci_gsc_add_device(xe, def);
 }
 
 void xe_heci_gsc_irq_handler(struct xe_device *xe, u32 iir)
diff --git a/drivers/gpu/drm/xe/xe_heci_gsc.h b/drivers/gpu/drm/xe/xe_heci_gsc.h
index 48b3b18380453..745eb6783942d 100644
--- a/drivers/gpu/drm/xe/xe_heci_gsc.h
+++ b/drivers/gpu/drm/xe/xe_heci_gsc.h
@@ -33,8 +33,7 @@ struct xe_heci_gsc {
 	int irq;
 };
 
-void xe_heci_gsc_init(struct xe_device *xe);
-void xe_heci_gsc_fini(struct xe_device *xe);
+int xe_heci_gsc_init(struct xe_device *xe);
 void xe_heci_gsc_irq_handler(struct xe_device *xe, u32 iir);
 void xe_heci_csc_irq_handler(struct xe_device *xe, u32 iir);
 
diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
index 7ba02e085b5b1..d939ce70e6fa8 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
@@ -134,7 +134,6 @@ static void xe_survivability_mode_fini(void *arg)
 	struct device *dev = &pdev->dev;
 
 	sysfs_remove_file(&dev->kobj, &dev_attr_survivability_mode.attr);
-	xe_heci_gsc_fini(xe);
 }
 
 static int enable_survivability_mode(struct pci_dev *pdev)
@@ -156,7 +155,9 @@ static int enable_survivability_mode(struct pci_dev *pdev)
 	if (ret)
 		return ret;
 
-	xe_heci_gsc_init(xe);
+	ret = xe_heci_gsc_init(xe);
+	if (ret)
+		return ret;
 
 	xe_vsec_init(xe);
 
-- 
2.48.1

