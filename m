Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48D21CD5BC8
	for <intel-xe@archiver.kernel.org>; Tue, 26 May 2026 19:55:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AF9310E544;
	Tue, 26 May 2026 19:55:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZLuZWwGg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E0FA10E505
 for <intel-xe@lists.freedesktop.org>; Tue, 26 May 2026 19:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779825311; x=1811361311;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=qyhuHDkaO4+I8caOIazEXwUk2DzJyNzApvklAnKiB78=;
 b=ZLuZWwGg8SnUOx4iaLH5p32bAKet11mwOqAqKERAVfwi7+zccnIdlAB3
 A3Xek/KmHCr4EWgr22bDhsUnKQ7LD9Hh/X6ZQsWYDv1anBhckvI8T8Lj7
 k/GdhIIdzTW5sGXhHKGrRWu+7AglouRa9fxtBDYeomw7VK8SrH9Ejc3t4
 ADI+U51Z37VUfY6TbXrlAcn8kpKRsvBaX2WcGIuvu8ILGN1Iw8xlzfnCF
 SmrqhvWELloqrJU003+Q33YdCjEoZU/0otpQ27QQT+Sf9lKyabciOrZgV
 TcPT1CybK8kIJI0iwWudrgPIU3BEcCSm9hQck8WC0OXG9XCk67wQn2D19 Q==;
X-CSE-ConnectionGUID: YrNToglqTmOsdcPPMS218w==
X-CSE-MsgGUID: LGWZLmUfTVepoxwIniA53A==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="80498769"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="80498769"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 12:55:11 -0700
X-CSE-ConnectionGUID: sjA+SPccRU2TecKzWydVjw==
X-CSE-MsgGUID: cRRBuME/R7ytEF4dbFBERw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="239013297"
Received: from adobrzyn-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.17.151])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 12:55:10 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 5/7] drm/xe: Separate early xe_device initialization
Date: Tue, 26 May 2026 21:54:50 +0200
Message-ID: <20260526195452.20545-6-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260526195452.20545-1-michal.wajdeczko@intel.com>
References: <20260526195452.20545-1-michal.wajdeczko@intel.com>
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

We would like to initialize more of the xe_device struct also from
the kunit code, as it should be safe to use most of the generic drm
or xe components without doing any additional tweaks. Separate early
xe initialization code to a new function, so it can be reused.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Raag Jadav <raag.jadav@intel.com>
Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 39 ++++++++++++++++++++++++----------
 drivers/gpu/drm/xe/xe_device.h |  1 +
 2 files changed, 29 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index b498147dcf61..7ba407f73a02 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -506,27 +506,45 @@ struct xe_device *xe_device_create(struct pci_dev *pdev)
 	if (IS_ERR(xe))
 		return xe;
 
+	err = xe_device_init_early(xe);
+	if (err)
+		return ERR_PTR(err);
+
+	return xe;
+}
+ALLOW_ERROR_INJECTION(xe_device_create, ERRNO); /* See xe_pci_probe() */
+
+/**
+ * xe_device_init_early() - Initialize a new &xe_device instance
+ * @xe: the &xe_device to initialize
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_device_init_early(struct xe_device *xe)
+{
+	int err;
+
 	err = ttm_device_init(&xe->ttm, &xe_ttm_funcs, xe->drm.dev,
 			      xe->drm.anon_inode->i_mapping,
 			      xe->drm.vma_offset_manager, 0);
-	if (WARN_ON(err))
-		return ERR_PTR(err);
+	if (err)
+		return err;
 
 	xe_bo_dev_init(&xe->bo_device);
 	err = drmm_add_action_or_reset(&xe->drm, xe_device_destroy, NULL);
 	if (err)
-		return ERR_PTR(err);
+		return err;
 
 	err = xe_shrinker_create(xe);
 	if (err)
-		return ERR_PTR(err);
+		return err;
 
 	xe->atomic_svm_timeslice_ms = 5;
 	xe->min_run_period_lr_ms = 5;
 
 	err = xe_irq_init(xe);
 	if (err)
-		return ERR_PTR(err);
+		return err;
 
 	xe_validation_device_init(&xe->val);
 
@@ -536,7 +554,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev)
 
 	err = xe_pagemap_shrinker_create(xe);
 	if (err)
-		return ERR_PTR(err);
+		return err;
 
 	xa_init_flags(&xe->usm.asid_to_vm, XA_FLAGS_ALLOC);
 
@@ -555,7 +573,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev)
 
 	err = xe_bo_pinned_init(xe);
 	if (err)
-		return ERR_PTR(err);
+		return err;
 
 	xe->preempt_fence_wq = alloc_ordered_workqueue("xe-preempt-fence-wq",
 						       WQ_MEM_RECLAIM);
@@ -569,16 +587,15 @@ struct xe_device *xe_device_create(struct pci_dev *pdev)
 		 * drmm_add_action_or_reset register above
 		 */
 		drm_err(&xe->drm, "Failed to allocate xe workqueues\n");
-		return ERR_PTR(-ENOMEM);
+		return -ENOMEM;
 	}
 
 	err = drmm_mutex_init(&xe->drm, &xe->pmt.lock);
 	if (err)
-		return ERR_PTR(err);
+		return err;
 
-	return xe;
+	return 0;
 }
-ALLOW_ERROR_INJECTION(xe_device_create, ERRNO); /* See xe_pci_probe() */
 
 static bool xe_driver_flr_disabled(struct xe_device *xe)
 {
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 27cd2329b99f..975768a6a9c8 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -44,6 +44,7 @@ static inline struct xe_device *ttm_to_xe_device(struct ttm_device *ttm)
 }
 
 struct xe_device *xe_device_create(struct pci_dev *pdev);
+int xe_device_init_early(struct xe_device *xe);
 int xe_device_probe_early(struct xe_device *xe);
 int xe_device_probe(struct xe_device *xe);
 void xe_device_remove(struct xe_device *xe);
-- 
2.47.1

