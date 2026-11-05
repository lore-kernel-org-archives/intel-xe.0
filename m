Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28FA3606A31B
	for <intel-xe@archiver.kernel.org>; Thu,  5 Nov 2026 14:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XoAw7LmB
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4160112418;
	Thu,  5 Nov 2026 14:36:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5670112418
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Nov 2026 14:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793889365; x=1825425365;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=08A+2wksLXorACzO+/OC20vD+IWzI5RwkvJYDJ1nAOM=;
 b=XoAw7LmB2uJSsi/by0P6w6DmptmcEps0zrR0xEQRZumYCzK+mlD4oyKJ
 +Yiq3hBZPqrYtdJVIHDLUaRrBvZ1c6Q/UqmKUHAFdqm3YAPJFX8DM+ZU7
 JZXNlRJeIuQvCwzxXw0glI+3x//d40sx93Un5xBMe8cFvIqxFnIsy7v/E
 Riy5qEI5STt7i4UaIZQfC0SxXBj0Go6j+TUAH+1JuP4C5d4gPnIrImA7p
 UP1bHzq6hiWuuJ9HzTVapG1K2QrDXs2yn297XEigVgDXI5BU9/pg9w6cF
 HIrjXE0Z2hPdNj3i6boNV6jSwzDm2cFdwU7LABEWkmfjb+veCF3F8sHUl g==;
X-CSE-ConnectionGUID: Mk3Y/LBSQjOrOurTUv0/Jg==
X-CSE-MsgGUID: RnZt/JDSSuujhW6QkiVhuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2778577"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2778577"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 06:36:01 -0800
X-CSE-ConnectionGUID: BCqXzCDKQE+P5jpNKTJwOw==
X-CSE-MsgGUID: WmZyL3UtRjabnmHaRuqmhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7145134"
Received: from amilburn-desk.amilburn-desk (HELO mwauld-desk.intel.com)
 ([10.245.244.225])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 06:36:00 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 2/2] drm/xe/pm: skip BO eviction on iGPU for non-hibernation sleep
Date: Thu,  5 Nov 2026 14:35:49 +0000
Message-ID: <20261105143547.1089207-4-matthew.auld@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105143547.1089207-3-matthew.auld@intel.com>
References: <20261105143547.1089207-3-matthew.auld@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On iGPU platforms, system RAM and graphics stolen memory remain powered
during S2idle and S3 (< S4) suspend, so evicting user buffers or
preparing pinned BOs is unnecessary and needlessly purges DONTNEED
buffers in userspace caches.

Distinguish S4 hibernation (.freeze and PM_HIBERNATION_PREPARE) from
< S4 suspend (.suspend and PM_SUSPEND_PREPARE), and skip BO eviction on
iGPU when not creating a hibernation image.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 21 ++++++++++++++++++---
 drivers/gpu/drm/xe/xe_pm.c  | 25 +++++++++++++++++++------
 drivers/gpu/drm/xe/xe_pm.h  |  2 +-
 3 files changed, 38 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index ba23ec60477b..67be6e707361 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -1335,7 +1335,7 @@ static void d3cold_toggle(struct pci_dev *pdev, enum toggle_d3cold toggle)
 	}
 }
 
-static int xe_pci_suspend(struct device *dev)
+static int __xe_pci_suspend(struct device *dev, bool hibernate)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
 	struct xe_device *xe = pdev_to_xe_device(pdev);
@@ -1344,7 +1344,7 @@ static int xe_pci_suspend(struct device *dev)
 	if (xe_survivability_mode_is_boot_enabled(xe))
 		return -EBUSY;
 
-	err = xe_pm_suspend(xe);
+	err = xe_pm_suspend(xe, hibernate);
 	if (err)
 		return err;
 
@@ -1362,6 +1362,16 @@ static int xe_pci_suspend(struct device *dev)
 	return 0;
 }
 
+static int xe_pci_suspend(struct device *dev)
+{
+	return __xe_pci_suspend(dev, false);
+}
+
+static int xe_pci_freeze(struct device *dev)
+{
+	return __xe_pci_suspend(dev, true);
+}
+
 static int xe_pci_resume(struct device *dev)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
@@ -1491,7 +1501,12 @@ static int xe_pci_runtime_idle(struct device *dev)
 }
 
 static const struct dev_pm_ops xe_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(xe_pci_suspend, xe_pci_resume)
+	.suspend = pm_sleep_ptr(xe_pci_suspend),
+	.resume = pm_sleep_ptr(xe_pci_resume),
+	.freeze = pm_sleep_ptr(xe_pci_freeze),
+	.thaw = pm_sleep_ptr(xe_pci_resume),
+	.poweroff = pm_sleep_ptr(xe_pci_suspend),
+	.restore = pm_sleep_ptr(xe_pci_resume),
 	SET_RUNTIME_PM_OPS(xe_pci_runtime_suspend, xe_pci_runtime_resume, xe_pci_runtime_idle)
 };
 #endif
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index f483b565d323..a24424b0d1dd 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -166,13 +166,19 @@ static void xe_rpm_lockmap_release(const struct xe_device *xe)
 			 &xe_pm_runtime_d3cold_map);
 }
 
+static bool xe_pm_needs_bo_evict(struct xe_device *xe, bool hibernate)
+{
+	return IS_DGFX(xe) || hibernate;
+}
+
 /**
- * xe_pm_suspend - Helper for System suspend, i.e. S0->S3 / S0->S2idle
+ * xe_pm_suspend - Helper for System suspend, i.e. S0->S3 / S0->S2idle / S0->S4
  * @xe: xe device instance
+ * @hibernate: true if preparing for S4 hibernation, false for < S4 suspend
  *
  * Return: 0 on success
  */
-int xe_pm_suspend(struct xe_device *xe)
+int xe_pm_suspend(struct xe_device *xe, bool hibernate)
 {
 	struct xe_gt *gt;
 	u8 id;
@@ -193,10 +199,12 @@ int xe_pm_suspend(struct xe_device *xe)
 
 	xe_display_pm_suspend(xe);
 
-	/* FIXME: Super racey... */
-	err = xe_bo_evict_all(xe);
-	if (err)
-		goto err_display;
+	if (xe_pm_needs_bo_evict(xe, hibernate)) {
+		/* FIXME: Super racey... */
+		err = xe_bo_evict_all(xe);
+		if (err)
+			goto err_display;
+	}
 
 	for_each_gt(gt, xe, id) {
 		err = xe_gt_suspend(gt);
@@ -452,8 +460,13 @@ static int xe_pm_notifier_callback(struct notifier_block *nb,
 				   unsigned long action, void *data)
 {
 	struct xe_device *xe = container_of(nb, struct xe_device, pm_notifier);
+	bool hibernate = (action == PM_HIBERNATION_PREPARE ||
+			  action == PM_POST_HIBERNATION);
 	int err = 0;
 
+	if (!xe_pm_needs_bo_evict(xe, hibernate))
+		return NOTIFY_DONE;
+
 	switch (action) {
 	case PM_HIBERNATION_PREPARE:
 	case PM_SUSPEND_PREPARE:
diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
index 16d4e6c629f1..af81f2a2975f 100644
--- a/drivers/gpu/drm/xe/xe_pm.h
+++ b/drivers/gpu/drm/xe/xe_pm.h
@@ -13,7 +13,7 @@
 
 struct xe_device;
 
-int xe_pm_suspend(struct xe_device *xe);
+int xe_pm_suspend(struct xe_device *xe, bool hibernate);
 int xe_pm_resume(struct xe_device *xe);
 
 int xe_pm_init_early(struct xe_device *xe);
-- 
2.56.0

