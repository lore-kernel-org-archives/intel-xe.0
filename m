Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0B39E9A053
	for <intel-xe@archiver.kernel.org>; Thu, 19 Feb 2026 17:31:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8112710E131;
	Thu, 19 Feb 2026 17:31:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N80pj5HZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76B3410E131
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Feb 2026 17:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771522299; x=1803058299;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pBehpOJwO9imSsN4TF+7THS5Xcy79dUK2oqH6FjzJ+s=;
 b=N80pj5HZ2kxZTyMTSAYvfVLNNhaXKj+QQKFO5HCCCc857KNq7VdXK/C+
 r/bdPyF09EiKlEAhESOYFw6t/7m8vteHMuLHAVEoGuAPZ9/w1n3U6/JT3
 RzEHaBfIr3ouBDeQyA4jLvvCfjEmSt6zamveftMDmoyngVYb1Tn6uxA5t
 MkBk/sPDhEdmQk0SrFSqQI33yAI6rTa9YwtjAbv2wftJQtLew96BVQxmq
 0YniO5KRK0Juiv64rAWqnHMrSszi/XoxBQ6ceDeuOtRhNntxrIftxfWdf
 LmetVtc0g9+N3pnsiQjfGZOYidh0ANCn/CDf/g8hEQvAu3dOZXc2l9jHB Q==;
X-CSE-ConnectionGUID: mB+kpncOQzWYUFi0u7bOUg==
X-CSE-MsgGUID: dGwxkD+JTDS6KHzMR6cx0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="82940295"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="82940295"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 09:31:30 -0800
X-CSE-ConnectionGUID: Xu8TUCcxR6OFhKeMD7p1yQ==
X-CSE-MsgGUID: AQjNGb8HRViwZ7v3IwucPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="213196278"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.24])
 by fmviesa007.fm.intel.com with ESMTP; 19 Feb 2026 09:31:30 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH v4 1/1] drm/xe/gsc: Fix GSC proxy cleanup on early
 initialization failure
Date: Thu, 19 Feb 2026 12:31:28 -0500
Message-Id: <20260219173128.2414504-1-zhanjun.dong@intel.com>
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
v4:
- Replace devm-managed cleanup action for xe_gsc_proxy_stop() with a
  manual flag-based approach using a 'started' flag. This avoids a race
  condition where module unload could start while the async GSC proxy
  initialization is still in progress, potentially causing the devm
  cleanup to be called at the wrong time.
- Set gsc->proxy.started = true at the end of xe_gsc_proxy_start() when
  initialization completes successfully.
- Check gsc->proxy.started in xe_gsc_proxy_remove() to conditionally
  call xe_gsc_proxy_stop() only if the proxy was actually started.

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
 drivers/gpu/drm/xe/xe_gsc_proxy.c | 42 +++++++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_gsc_types.h |  2 ++
 2 files changed, 36 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gsc_proxy.c b/drivers/gpu/drm/xe/xe_gsc_proxy.c
index 42438b21f235..afafe8b41e65 100644
--- a/drivers/gpu/drm/xe/xe_gsc_proxy.c
+++ b/drivers/gpu/drm/xe/xe_gsc_proxy.c
@@ -435,15 +435,11 @@ static int proxy_channel_alloc(struct xe_gsc *gsc)
 	return 0;
 }
 
-static void xe_gsc_proxy_remove(void *arg)
+static void xe_gsc_proxy_stop(struct xe_gsc *gsc)
 {
-	struct xe_gsc *gsc = arg;
 	struct xe_gt *gt = gsc_to_gt(gsc);
 	struct xe_device *xe = gt_to_xe(gt);
 
-	if (!gsc->proxy.component_added)
-		return;
-
 	/* disable HECI2 IRQs */
 	scoped_guard(xe_pm_runtime, xe) {
 		CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GSC);
@@ -455,6 +451,29 @@ static void xe_gsc_proxy_remove(void *arg)
 	}
 
 	xe_gsc_wait_for_worker_completion(gsc);
+	gsc->proxy.started = false;
+}
+
+static void xe_gsc_proxy_remove(void *arg)
+{
+	struct xe_gsc *gsc = arg;
+	struct xe_gt *gt = gsc_to_gt(gsc);
+	struct xe_device *xe = gt_to_xe(gt);
+
+	if (!gsc->proxy.component_added)
+		return;
+
+	/*
+	 * GSC proxy init is an async process that can be ongoing during
+	 * Xe module load/unload. Using devm managed action to register
+	 * xe_gsc_proxy_stop could cause issues if Xe module unload has
+	 * already started when the action is registered, potentially leading
+	 * to the cleanup being called at the wrong time. The 'started' flag
+	 * is used to avoid this race condition by ensuring we only stop the
+	 * proxy if it was actually started.
+	 */
+	if (gsc->proxy.started)
+		xe_gsc_proxy_stop(gsc);
 
 	component_del(xe->drm.dev, &xe_gsc_proxy_component_ops);
 	gsc->proxy.component_added = false;
@@ -510,6 +529,7 @@ int xe_gsc_proxy_init(struct xe_gsc *gsc)
  */
 int xe_gsc_proxy_start(struct xe_gsc *gsc)
 {
+	struct xe_gt *gt = gsc_to_gt(gsc);
 	int err;
 
 	/* enable the proxy interrupt in the GSC shim layer */
@@ -521,12 +541,18 @@ int xe_gsc_proxy_start(struct xe_gsc *gsc)
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
 
+	gsc->proxy.started = true;
 	return 0;
+
+err_irq_disable:
+	gsc_proxy_irq_toggle(gsc, false);
+	return err;
 }
diff --git a/drivers/gpu/drm/xe/xe_gsc_types.h b/drivers/gpu/drm/xe/xe_gsc_types.h
index 97c056656df0..5aaa2a75861f 100644
--- a/drivers/gpu/drm/xe/xe_gsc_types.h
+++ b/drivers/gpu/drm/xe/xe_gsc_types.h
@@ -58,6 +58,8 @@ struct xe_gsc {
 		struct mutex mutex;
 		/** @proxy.component_added: whether the component has been added */
 		bool component_added;
+		/** @proxy.started: whether the proxy has been started */
+		bool started;
 		/** @proxy.bo: object to store message to and from the GSC */
 		struct xe_bo *bo;
 		/** @proxy.to_gsc: map of the memory used to send messages to the GSC */
-- 
2.34.1

