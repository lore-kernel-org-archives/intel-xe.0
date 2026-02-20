Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52DF5C5CFF1
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 22:53:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6BF610E070;
	Fri, 20 Feb 2026 22:53:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ub08odKx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B497110E070
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Feb 2026 22:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771627990; x=1803163990;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=S7O/f16l1jSnGIQvFTStz4eVw7Vk5CmVW+RVPx4W//I=;
 b=Ub08odKx+CXwb7YbBxPt7CcwDbaxktABkwuY8WvGH0P8uQVTiAuguS2C
 DbWfpevhXciMRg86ua/pUWqLJ0KU3t3nrNZspWVKfAnSLOlAVsYXB50b+
 hvCFL8r65fGnFl5SBoR9emWVwXDZe2t0mpPRwSS0SEdpj8UtUaz2Sd82G
 /m3gkeulZk1dm/JkNwIg7CfsrrCuJaEYICWBGRwSvgd4mhAZe7okLPCJI
 WVlxM58o/JgQIwuLlCz+h+zKv/n/7CU7FLYEEyxknAT6WcSOVfmsrzMCi
 tYLcWmHeqw9SM4yns47PJXLRKgfdMDUJwtn+xY9eVb1CCGnhD+vpHr0is g==;
X-CSE-ConnectionGUID: 6zJp9HqjSfW9HgDNrm4N3A==
X-CSE-MsgGUID: /VTwZBfVSVut80vtrc6Tyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="72899815"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="72899815"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 14:53:10 -0800
X-CSE-ConnectionGUID: DBHpz0mUSCKw15wMznuyrg==
X-CSE-MsgGUID: yjI7vBvMSBaplWLnefndIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="219516414"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.24])
 by fmviesa005.fm.intel.com with ESMTP; 20 Feb 2026 14:53:09 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH v5 1/1] drm/xe/gsc: Fix GSC proxy cleanup on early
 initialization failure
Date: Fri, 20 Feb 2026 17:53:08 -0500
Message-Id: <20260220225308.101469-1-zhanjun.dong@intel.com>
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
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
v5:
- Update comments (Daniele)
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
 drivers/gpu/drm/xe/xe_gsc_proxy.c | 43 +++++++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_gsc_types.h |  2 ++
 2 files changed, 37 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gsc_proxy.c b/drivers/gpu/drm/xe/xe_gsc_proxy.c
index 42438b21f235..707db650a2ae 100644
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
@@ -455,6 +451,30 @@ static void xe_gsc_proxy_remove(void *arg)
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
+	 * GSC proxy start is an async process that can be ongoing during
+	 * Xe module load/unload. Using devm managed action to register
+	 * xe_gsc_proxy_stop could cause issues if Xe module unload has
+	 * already started when the action is registered, potentially leading
+	 * to the cleanup being called at the wrong time. Therefore, instead
+	 * of registering a separate devm action to undo what is done in
+	 * proxy start, we call it from here, but only if the start has
+	 * completed successfully (tracked with the 'started' flag).
+	 */
+	if (gsc->proxy.started)
+		xe_gsc_proxy_stop(gsc);
 
 	component_del(xe->drm.dev, &xe_gsc_proxy_component_ops);
 	gsc->proxy.component_added = false;
@@ -510,6 +530,7 @@ int xe_gsc_proxy_init(struct xe_gsc *gsc)
  */
 int xe_gsc_proxy_start(struct xe_gsc *gsc)
 {
+	struct xe_gt *gt = gsc_to_gt(gsc);
 	int err;
 
 	/* enable the proxy interrupt in the GSC shim layer */
@@ -521,12 +542,18 @@ int xe_gsc_proxy_start(struct xe_gsc *gsc)
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

