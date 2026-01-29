Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 860ADD73EA8
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 23:11:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3834310E8D2;
	Thu, 29 Jan 2026 23:11:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JHmE1vLm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E924910E8D2
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jan 2026 23:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769728304; x=1801264304;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mIr5gXzZ7ACqaDrISWRvoou+98cbS8pIPuJQiWTajxY=;
 b=JHmE1vLmdTo/KTRJDclnM2L6yfR+TkGc+HtFMOz1WPg9A2GD6xtVCBlA
 H8C67i4S2oQ2COzIFKhKMM5kEID5vRil95z6WDuOZN6lCe8W0HUfPzK6J
 dvS89cwh0SmJI9uB1iCRseizJuhpd7GhUjmwxLnhC3iXtq+GdHDuMW4Gf
 UML4qRO5uyWG3xedRtjFdm1dzjRc6420M+u539q7DeyzJ7i3bcD1YHbDa
 v7k3uCZKv3cYIf/Cw0CV95hkSd8x7zz+Hxqy6wyvy0BYN+AY+Y0GTuL0n
 MxDYWoHh0E+10TCbbiI1YMtdaokbYFd/vLo68DMv9vOSgJBsN+5aLUU7b A==;
X-CSE-ConnectionGUID: 8j+zl7R8RC+8dlYkAgUKBQ==
X-CSE-MsgGUID: SkOJkHdeTPSF+VHCmGeLxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="74832320"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="74832320"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 15:11:43 -0800
X-CSE-ConnectionGUID: ovzXhcj6T/aMBMab/HghMg==
X-CSE-MsgGUID: gBCVGMA+S7SEpR1XNDodkA==
X-ExtLoop1: 1
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.24])
 by fmviesa003.fm.intel.com with ESMTP; 29 Jan 2026 15:11:43 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH v3 1/1] drm/xe/gsc: Fix GSC proxy cleanup on early
 initialization failure
Date: Thu, 29 Jan 2026 18:11:41 -0500
Message-Id: <20260129231141.512831-1-zhanjun.dong@intel.com>
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

Since the HW cleanup (interrupt disabling) is now removed from
xe_gsc_proxy_remove, the cleanup on error paths in xe_gsc_proxy_start
must be updated to disable interrupts before returning.

Fixes: ff6cd29b690b ("drm/xe: Cleanup unwind of gt initialization")
Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
v3:
- Move xe_gsc_wait_for_worker_completion() to xe_gsc_proxy_stop() after
  disabling interrupts, since the worker shouldn't be queued anymore
  after interrupts are disabled.
- Update commit message to clarify that the error handling changes in
  xe_gsc_proxy_start() are necessary due to the cleanup refactoring,
  not a separate fix.

v2:
- Split cleanup into two functions: xe_gsc_proxy_remove() for SW cleanup
  and xe_gsc_proxy_stop() for HW cleanup that requires forcewake access.
- Add error handling in xe_gsc_proxy_start to disable interrupts on
  early error exits.
---
 drivers/gpu/drm/xe/xe_gsc_proxy.c | 46 ++++++++++++++++++++-----------
 1 file changed, 30 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gsc_proxy.c b/drivers/gpu/drm/xe/xe_gsc_proxy.c
index 42438b21f235..591baf98e445 100644
--- a/drivers/gpu/drm/xe/xe_gsc_proxy.c
+++ b/drivers/gpu/drm/xe/xe_gsc_proxy.c
@@ -444,18 +444,6 @@ static void xe_gsc_proxy_remove(void *arg)
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
-	xe_gsc_wait_for_worker_completion(gsc);
-
 	component_del(xe->drm.dev, &xe_gsc_proxy_component_ops);
 	gsc->proxy.component_added = false;
 }
@@ -502,6 +490,25 @@ int xe_gsc_proxy_init(struct xe_gsc *gsc)
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
+
+	xe_gsc_wait_for_worker_completion(gsc);
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

