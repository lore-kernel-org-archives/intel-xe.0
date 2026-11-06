Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB408606A326
	for <intel-xe@archiver.kernel.org>; Fri,  6 Nov 2026 15:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TX9JUbQ6
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61CE7112E85;
	Fri,  6 Nov 2026 15:54:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 841EB112E82
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Nov 2026 15:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793980441; x=1825516441;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mjMR9pTVr5afbUzIhS4l+SjXYxsZhgKfOX+dJCQvgf8=;
 b=TX9JUbQ6WCUmcddSQKUN1+SAeBhlZ8w+tM6N5ZE8QdfSLmejmOKG7prO
 DZ8H4AzJCHZpLe5U8rJUPjOq6xY9zWAijs7GFsvWjOuR2N0qjp1PIjKQo
 zrxcROrqt43EP5xo4ZbSkRkwVpCSlT1c4Flih+lvnI/md5IO/DBUGvAMp
 6Sv8YWpZ/pbRby/40KyVDDx2ngKMaoYmI/n7+Gw6YWmvZ519CRoDTKICL
 CxvZSeb99G/M7GKB0C9iMIfwtQnpjeKyou77hBYbUs863Yj8TAlNhrjqA
 0C0/m7fnIUyxpPDILUHulpRtioiuwtHH2/m/c47hH2tU8SIOKt/avZO/u Q==;
X-CSE-ConnectionGUID: PFhafdJeTHq4tPFkx80oYw==
X-CSE-MsgGUID: 5kveDqOCQ3qzeZoGo/8w0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2895848"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2895848"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 07:54:01 -0800
X-CSE-ConnectionGUID: f1SQolD3Q5u69b1q45gkmQ==
X-CSE-MsgGUID: MjJ4MsMGRaqOEY/sF6Oziw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7650154"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.124])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 07:54:01 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Carlos Santa <carlos.santa@intel.com>
Subject: [PATCH v2 2/2] drm/xe/pm: skip BO eviction on iGPU for
 non-hibernation sleep
Date: Fri,  6 Nov 2026 15:53:44 +0000
Message-ID: <20261106-s4-opti-v2-2-a3cdae711a3b@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106-s4-opti-v2-0-a3cdae711a3b@intel.com>
References: <20261106-s4-opti-v2-0-a3cdae711a3b@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Carlos Santa <carlos.santa@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 21 ++++++++++++++++++---
 drivers/gpu/drm/xe/xe_pm.c  | 26 ++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_pm.h  |  2 +-
 3 files changed, 39 insertions(+), 10 deletions(-)

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
index 61d68c09189f..e73192b03074 100644
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
@@ -461,6 +469,9 @@ static int xe_pm_notifier_callback(struct notifier_block *nb,
 		struct xe_validation_ctx ctx;
 
 		reinit_completion(&xe->pm_block);
+		if (!xe_pm_needs_bo_evict(xe, action == PM_HIBERNATION_PREPARE))
+			break;
+
 		xe_pm_block_begin_signalling();
 		xe_pm_runtime_get(xe);
 		(void)xe_validation_ctx_init(&ctx, &xe->val, NULL,
@@ -485,6 +496,9 @@ static int xe_pm_notifier_callback(struct notifier_block *nb,
 	case PM_POST_SUSPEND:
 		complete_all(&xe->pm_block);
 		xe_pm_wake_rebind_workers(xe);
+		if (!xe_pm_needs_bo_evict(xe, action == PM_POST_HIBERNATION))
+			break;
+
 		xe_bo_notifier_unprepare_all_pinned(xe);
 		xe_pm_runtime_put(xe);
 		break;
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
