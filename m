Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC4E9D13C3C
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jan 2026 02:43:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4065910E0B8;
	Tue, 27 Jan 2026 02:43:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GMb6tpI3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F363710E0B8
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Jan 2026 02:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769481798; x=1801017798;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EMu3P3b3gQxwY9vFjH3bDHXOo1jA3zSxP26X/chHHEU=;
 b=GMb6tpI39rhZVCULt3Wmu5ySE3eXX8k8DhJTmT85KVTA//uZtS5cOJD2
 UAj9bT6EVldXeyEyZIEZPf0/GIJ8kX+lqdqeVBVvA8kUL+c5d5XJGtI5i
 OSLrwBmbHDHySQKN/sbriTtuEmaghojjYUiWCXPWFTDpU9KXJta4XIKOZ
 KAXC/9gwg7XFBBKeDoUDwzdYyk31epaL0H+84HEyUh81Ve8min+QqyRVM
 TiCbsqHqWm56za5fTeJeZHdVDZFvhbgGmKdE7Aj1Jn9upuVvt6bUZj/f4
 8QFiUWUedTNiN0t32A9j+7tjNXlisAmpmhjGZNfb8WgvQzwc8QxGNor4c A==;
X-CSE-ConnectionGUID: v0sZ2delQUuzufMJDU+NUw==
X-CSE-MsgGUID: zeQhvvm8RKyVnzOshpymMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="69688163"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="69688163"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2026 18:43:17 -0800
X-CSE-ConnectionGUID: v0vj4f5DRCi4OK1iI8sUiQ==
X-CSE-MsgGUID: 8QShK2SzRQuRsD96Sue/vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="239105710"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.24])
 by fmviesa001.fm.intel.com with ESMTP; 26 Jan 2026 18:43:17 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH v2 1/1] drm/xe/gsc: Fix GSC proxy cleanup on early
 initialization failure
Date: Mon, 26 Jan 2026 21:43:15 -0500
Message-Id: <20260127024315.359176-1-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
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

xe_gsc_proxy_remove undoes what is done in both xe_gsc_proxy_init and
xe_gsc_proxy_start; however, if we fail between those 2 calls, it is
possible that the HW forcewake access hasn't been initialized yet and so
we hit errors when the cleanup code tries to write GSC register. To
avoid that, split the cleanup in 2 functions so that the HW cleanup is
only called if the HW setup was completed successfully.

Additionally, fix error handling in xe_gsc_proxy_start to properly
disable interrupts on failure paths before returning, ensuring cleanup
is performed correctly when xe_gsc_proxy_request_handler() or
xe_gsc_proxy_init_done() fails.

Fixes: ff6cd29b690b ("drm/xe: Cleanup unwind of gt initialization")
Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
v2:
- Split cleanup into two functions: xe_gsc_proxy_remove() for SW cleanup
  and xe_gsc_proxy_stop() for HW cleanup that requires forcewake access.
- Add error handling in xe_gsc_proxy_start to disable interrupts on
  early error exits.
---
 drivers/gpu/drm/xe/xe_gsc_proxy.c | 42 ++++++++++++++++++++-----------
 1 file changed, 28 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gsc_proxy.c b/drivers/gpu/drm/xe/xe_gsc_proxy.c
index 42438b21f235..0f62ee7dab4a 100644
--- a/drivers/gpu/drm/xe/xe_gsc_proxy.c
+++ b/drivers/gpu/drm/xe/xe_gsc_proxy.c
@@ -444,16 +444,6 @@ static void xe_gsc_proxy_remove(void *arg)
 	if (!gsc->proxy.component_added)
 		return;
 
-	/* disable HECI2 IRQs */
-	scoped_guard(xe_pm_runtime, xe) {
-		CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GSC);
-		if (!fw_ref.domains)
-			xe_gt_err(gt, "failed to get forcewake to disable GSC interrupts\n");
-
-		/* try do disable irq even if forcewake failed */
-		gsc_proxy_irq_toggle(gsc, false);
-	}
-
 	xe_gsc_wait_for_worker_completion(gsc);
 
 	component_del(xe->drm.dev, &xe_gsc_proxy_component_ops);
@@ -502,6 +492,23 @@ int xe_gsc_proxy_init(struct xe_gsc *gsc)
 	return devm_add_action_or_reset(xe->drm.dev, xe_gsc_proxy_remove, gsc);
 }
 
+static void xe_gsc_proxy_stop(void *arg)
+{
+	struct xe_gsc *gsc = arg;
+	struct xe_gt *gt = gsc_to_gt(gsc);
+	struct xe_device *xe = gt_to_xe(gt);
+
+	/* disable HECI2 IRQs */
+	scoped_guard(xe_pm_runtime, xe) {
+		CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GSC);
+		if (!fw_ref.domains)
+			xe_gt_err(gt, "failed to get forcewake to disable GSC interrupts\n");
+
+		/* try do disable irq even if forcewake failed */
+		gsc_proxy_irq_toggle(gsc, false);
+	}
+}
+
 /**
  * xe_gsc_proxy_start() - start the proxy by submitting the first request
  * @gsc: the GSC uC
@@ -510,6 +517,8 @@ int xe_gsc_proxy_init(struct xe_gsc *gsc)
  */
 int xe_gsc_proxy_start(struct xe_gsc *gsc)
 {
+	struct xe_gt *gt = gsc_to_gt(gsc);
+	struct xe_device *xe = gt_to_xe(gt);
 	int err;
 
 	/* enable the proxy interrupt in the GSC shim layer */
@@ -521,12 +530,17 @@ int xe_gsc_proxy_start(struct xe_gsc *gsc)
 	 */
 	err = xe_gsc_proxy_request_handler(gsc);
 	if (err)
-		return err;
+		goto err_irq_disable;
 
 	if (!xe_gsc_proxy_init_done(gsc)) {
-		xe_gt_err(gsc_to_gt(gsc), "GSC FW reports proxy init not completed\n");
-		return -EIO;
+		xe_gt_err(gt, "GSC FW reports proxy init not completed\n");
+		err = -EIO;
+		goto err_irq_disable;
 	}
 
-	return 0;
+	return devm_add_action_or_reset(xe->drm.dev, xe_gsc_proxy_stop, gsc);
+
+err_irq_disable:
+	gsc_proxy_irq_toggle(gsc, false);
+	return err;
 }
-- 
2.34.1

