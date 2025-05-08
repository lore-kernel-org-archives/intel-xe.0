Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CB98C3ABBE
	for <intel-xe@archiver.kernel.org>; Thu,  8 May 2025 11:30:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C71FF10E0A3;
	Thu,  8 May 2025 11:30:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OaM4rsU1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D6D610E1F7
 for <intel-xe@lists.freedesktop.org>; Thu,  8 May 2025 11:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746703841; x=1778239841;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=igS9AJ/EgbRrIoY/mf4JmIGrzq7RgcuLAF9AWAkrNWY=;
 b=OaM4rsU1SM1qsyOvEw6BfMu3OqYhNm9jqn9DDB0X4RJkn4AUUOORlJpR
 PJ0nVmLRz+ucVtGFeQvts9qRA8bpHeFvZMHJUgiZGXLSv1et9PP7jB4hS
 SaW/AuiwgogScn0uBIljqy8eq1N9UClbgV3p013IFhPsuqrZ11bCHUJZz
 nt5rvtLe+pDEBb92fhIYPLKYVFlPcJZdQjs2l3loeg1GNKZwJXMIykw+M
 KLMDt7X/bQ9IC4ncsNEAQQ8UZ6WRHtABotRslDdJsihvrUl9izlsE1p+B
 9aeRvd/zB9k0yKbXGjLijD09gDLV2CyjZqmYP7LAm6Kg7vS9Pj4+n8xEd A==;
X-CSE-ConnectionGUID: nwoOiGudQU2Ulod9lXTyIw==
X-CSE-MsgGUID: hmyj5WviTB6b+u4b0g2DTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="59831388"
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; d="scan'208";a="59831388"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 04:30:30 -0700
X-CSE-ConnectionGUID: OP6ACwGPQ66owJQYZ3A/fg==
X-CSE-MsgGUID: 1lgRhENUSDGy1GexAD3rHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; d="scan'208";a="140306346"
Received: from uaeoff-desk2.amr.corp.intel.com (HELO fedora..)
 ([10.124.222.207])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 04:30:27 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH] drm/xe: Make the gem shrinker drm managed
Date: Thu,  8 May 2025 13:30:15 +0200
Message-ID: <20250508113015.3374-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.49.0
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

Make the xe drm shrinker drm managed like many other resources
created at device creation time.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_device.c   |  9 +++-----
 drivers/gpu/drm/xe/xe_shrinker.c | 37 ++++++++++++++++----------------
 drivers/gpu/drm/xe/xe_shrinker.h |  4 +---
 3 files changed, 22 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index c02c4c4e9412..399ae5f40321 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -402,9 +402,6 @@ static void xe_device_destroy(struct drm_device *dev, void *dummy)
 	if (xe->unordered_wq)
 		destroy_workqueue(xe->unordered_wq);
 
-	if (!IS_ERR_OR_NULL(xe->mem.shrinker))
-		xe_shrinker_destroy(xe->mem.shrinker);
-
 	if (xe->destroy_wq)
 		destroy_workqueue(xe->destroy_wq);
 
@@ -438,9 +435,9 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 	if (err)
 		goto err;
 
-	xe->mem.shrinker = xe_shrinker_create(xe);
-	if (IS_ERR(xe->mem.shrinker))
-		return ERR_CAST(xe->mem.shrinker);
+	err = xe_shrinker_create(xe);
+	if (err)
+		goto err;
 
 	xe->info.devid = pdev->device;
 	xe->info.revid = pdev->revision;
diff --git a/drivers/gpu/drm/xe/xe_shrinker.c b/drivers/gpu/drm/xe/xe_shrinker.c
index 86d47aaf0358..125c836e0ee4 100644
--- a/drivers/gpu/drm/xe/xe_shrinker.c
+++ b/drivers/gpu/drm/xe/xe_shrinker.c
@@ -5,6 +5,7 @@
 
 #include <linux/shrinker.h>
 
+#include <drm/drm_managed.h>
 #include <drm/ttm/ttm_backup.h>
 #include <drm/ttm/ttm_bo.h>
 #include <drm/ttm/ttm_tt.h>
@@ -213,24 +214,34 @@ static void xe_shrinker_pm(struct work_struct *work)
 	xe_pm_runtime_put(shrinker->xe);
 }
 
+static void xe_shrinker_fini(struct drm_device *drm, void *arg)
+{
+	struct xe_shrinker *shrinker = arg;
+
+	xe_assert(shrinker->xe, !shrinker->shrinkable_pages);
+	xe_assert(shrinker->xe, !shrinker->purgeable_pages);
+	shrinker_free(shrinker->shrink);
+	flush_work(&shrinker->pm_worker);
+	kfree(shrinker);
+}
+
 /**
  * xe_shrinker_create() - Create an xe per-device shrinker
  * @xe: Pointer to the xe device.
  *
- * Returns: A pointer to the created shrinker on success,
- * Negative error code on failure.
+ * Return: %0 on success. Negative error code on failure.
  */
-struct xe_shrinker *xe_shrinker_create(struct xe_device *xe)
+int xe_shrinker_create(struct xe_device *xe)
 {
 	struct xe_shrinker *shrinker = kzalloc(sizeof(*shrinker), GFP_KERNEL);
 
 	if (!shrinker)
-		return ERR_PTR(-ENOMEM);
+		return -ENOMEM;
 
 	shrinker->shrink = shrinker_alloc(0, "drm-xe_gem:%s", xe->drm.unique);
 	if (!shrinker->shrink) {
 		kfree(shrinker);
-		return ERR_PTR(-ENOMEM);
+		return -ENOMEM;
 	}
 
 	INIT_WORK(&shrinker->pm_worker, xe_shrinker_pm);
@@ -240,19 +251,7 @@ struct xe_shrinker *xe_shrinker_create(struct xe_device *xe)
 	shrinker->shrink->scan_objects = xe_shrinker_scan;
 	shrinker->shrink->private_data = shrinker;
 	shrinker_register(shrinker->shrink);
+	xe->mem.shrinker = shrinker;
 
-	return shrinker;
-}
-
-/**
- * xe_shrinker_destroy() - Destroy an xe per-device shrinker
- * @shrinker: Pointer to the shrinker to destroy.
- */
-void xe_shrinker_destroy(struct xe_shrinker *shrinker)
-{
-	xe_assert(shrinker->xe, !shrinker->shrinkable_pages);
-	xe_assert(shrinker->xe, !shrinker->purgeable_pages);
-	shrinker_free(shrinker->shrink);
-	flush_work(&shrinker->pm_worker);
-	kfree(shrinker);
+	return drmm_add_action_or_reset(&xe->drm, xe_shrinker_fini, shrinker);
 }
diff --git a/drivers/gpu/drm/xe/xe_shrinker.h b/drivers/gpu/drm/xe/xe_shrinker.h
index 28a038f4fcbf..5132ae5192e1 100644
--- a/drivers/gpu/drm/xe/xe_shrinker.h
+++ b/drivers/gpu/drm/xe/xe_shrinker.h
@@ -11,8 +11,6 @@ struct xe_device;
 
 void xe_shrinker_mod_pages(struct xe_shrinker *shrinker, long shrinkable, long purgeable);
 
-struct xe_shrinker *xe_shrinker_create(struct xe_device *xe);
-
-void xe_shrinker_destroy(struct xe_shrinker *shrinker);
+int xe_shrinker_create(struct xe_device *xe);
 
 #endif
-- 
2.49.0

