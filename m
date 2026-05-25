Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FDB7CD5BDD
	for <intel-xe@archiver.kernel.org>; Mon, 25 May 2026 16:05:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57F6810E3B6;
	Mon, 25 May 2026 16:05:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RZ2qEkCd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF1B710E3B4
 for <intel-xe@lists.freedesktop.org>; Mon, 25 May 2026 16:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779725142; x=1811261142;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2rg8oGCmtlOVH+VdkbMukApdEKbSzgGKuBHRSRlyZNw=;
 b=RZ2qEkCdGdlMMkt5uQw5shLMkPg5SMq8r+t4jdAEnAtum2p8+COOY8Ql
 rdQ9JSAv1FcotwF/8kSzo5+EnsnD6MqN8VNgWNWNpq0qcilAKiC4Ll8VK
 l/01gIGQIMN4pdFLRwm5gHc3g3L2J2eFXS+v4I+Gncxad/f0f0jfvXb1/
 eXHFcmdvp9Ff+ROrPZbe/ESg7rbud96PKCcGwYMJb2mnrHkrekZZl4MYW
 h8CFq5TLtZ4WR1RdT3FCDT4kutqTmsxQJfZ1/VEm1W/l8dIMWScEs5Qnj
 COwcnG//u+IwsxuMja+DvXYFLdBqbC+eyomItXJgHuH/b/M41cX36YfuO Q==;
X-CSE-ConnectionGUID: rXGrw13sSVujx4kyNtFn/g==
X-CSE-MsgGUID: m3TEUP9gQL2GqcD07FOhrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80275438"
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; d="scan'208";a="80275438"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 09:05:42 -0700
X-CSE-ConnectionGUID: O1ZQEtZoQT2LKvZlotrycQ==
X-CSE-MsgGUID: iLHjvn4ISxe9yDEf7EItwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; d="scan'208";a="235275252"
Received: from gkearney-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.94.250.94])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 09:05:41 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 4/6] drm/xe: Separate early xe_device initialization
Date: Mon, 25 May 2026 18:05:27 +0200
Message-ID: <20260525160529.15890-5-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260525160529.15890-1-michal.wajdeczko@intel.com>
References: <20260525160529.15890-1-michal.wajdeczko@intel.com>
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

