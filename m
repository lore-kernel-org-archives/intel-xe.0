Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36127C02198
	for <intel-xe@archiver.kernel.org>; Wed, 12 Feb 2025 19:36:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F076910E978;
	Wed, 12 Feb 2025 19:36:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Twmz/Wfa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B36010E21F
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Feb 2025 19:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739388995; x=1770924995;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=i/o+W+VT5UtW73Xvj9cutMFd2C+7LDcl3/Wlg8HIpQ0=;
 b=Twmz/WfaT73MzdBpIcnH8SIsIdrLKW+OQXqDq7ZWm+6+o12W+rxNx/9U
 yemTzSAoiQ66hLQdgez3z0BC3Stb78265mx/yt9tseC3T54viUgGd7D6E
 SXZy7Hk0zQVcjAybxpnB3oxYul/J6SRFWu7PaV1yktwZNKHA7ICqhoVsv
 6PimPy6hxDJmzWUjSReoVUQq1mA0M0AxpJ4i4p4TWOCWAZaYpn8Jns5bB
 ngzlOMcXUe7GyeWQKaHAvWxZcJwiDnVMmbWEpGE+orFfa1kpdaxYkSii1
 ic6vlf7DdRjbG+fxA+ExrvEfye1AaZA/u1TcL2dTkNNnXEDixMUgBebpo g==;
X-CSE-ConnectionGUID: VjfW/BPDTdObWMIdNuqb/w==
X-CSE-MsgGUID: +kBqkBP1RxeVra7nEpur7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40184244"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="40184244"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 11:36:35 -0800
X-CSE-ConnectionGUID: HkUt5YMZRiinua6gDi7M9w==
X-CSE-MsgGUID: gJV4DrnWSxC1vB41twaKHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="113437873"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 11:36:35 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v4 07/13] drm/xe: Cleanup unwind of gt initialization
Date: Wed, 12 Feb 2025 11:35:54 -0800
Message-ID: <20250212193600.475089-8-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250212193600.475089-1-lucas.demarchi@intel.com>
References: <20250212193600.475089-1-lucas.demarchi@intel.com>
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

The only thing in xe_gt_remove() that really needs to happen on the
device remove callback is the xe_uc_remove(). That's because of the
following call chain:

	xe_gt_remove()
	  xe_uc_remove()
	    xe_gsc_remove()
	      xe_gsc_proxy_remove()

Move xe_gsc_proxy_remove() to be handled as a xe_device_remove_action,
so it's recorded when it should run during device removal. The rest can
be handled normally by devm infra.

Besides removing the deep call chain above, xe_device_probe() doesn't
have to unwind the gt loop and it's also more in line with the
xe_device_probe() style.

Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c    | 21 +----------
 drivers/gpu/drm/xe/xe_gsc.c       |  9 -----
 drivers/gpu/drm/xe/xe_gsc.h       |  1 -
 drivers/gpu/drm/xe/xe_gsc_proxy.c | 63 ++++++++++++++-----------------
 drivers/gpu/drm/xe/xe_gsc_proxy.h |  1 -
 drivers/gpu/drm/xe/xe_gsc_types.h |  1 +
 drivers/gpu/drm/xe/xe_gt.c        | 35 ++++++++---------
 drivers/gpu/drm/xe/xe_gt.h        |  1 -
 drivers/gpu/drm/xe/xe_uc.c        | 13 -------
 drivers/gpu/drm/xe/xe_uc.h        |  1 -
 10 files changed, 47 insertions(+), 99 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 37bac39d74ba6..08dd8e9f8f6de 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -750,7 +750,6 @@ int xe_device_probe(struct xe_device *xe)
 	struct xe_tile *tile;
 	struct xe_gt *gt;
 	int err;
-	u8 last_gt;
 	u8 id;
 
 	xe->probing = true;
@@ -861,18 +860,16 @@ int xe_device_probe(struct xe_device *xe)
 		return err;
 
 	for_each_gt(gt, xe, id) {
-		last_gt = id;
-
 		err = xe_gt_init(gt);
 		if (err)
-			goto err_fini_gt;
+			return err;
 	}
 
 	xe_heci_gsc_init(xe);
 
 	err = xe_oa_init(xe);
 	if (err)
-		goto err_fini_gt;
+		return err;
 
 	err = xe_display_init(xe);
 	if (err)
@@ -911,14 +908,6 @@ int xe_device_probe(struct xe_device *xe)
 err_fini_oa:
 	xe_oa_fini(xe);
 
-err_fini_gt:
-	for_each_gt(gt, xe, id) {
-		if (id < last_gt)
-			xe_gt_remove(gt);
-		else
-			break;
-	}
-
 	return err;
 }
 
@@ -998,9 +987,6 @@ static void xe_device_remove_display(struct xe_device *xe)
 
 void xe_device_remove(struct xe_device *xe)
 {
-	struct xe_gt *gt;
-	u8 id;
-
 	xe_oa_unregister(xe);
 
 	xe_device_remove_display(xe);
@@ -1009,9 +995,6 @@ void xe_device_remove(struct xe_device *xe)
 
 	xe_heci_gsc_fini(xe);
 
-	for_each_gt(gt, xe, id)
-		xe_gt_remove(gt);
-
 	xe_device_call_remove_actions(xe);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
index 1eb791ddc375c..fd41113f85725 100644
--- a/drivers/gpu/drm/xe/xe_gsc.c
+++ b/drivers/gpu/drm/xe/xe_gsc.c
@@ -555,15 +555,6 @@ void xe_gsc_wait_for_worker_completion(struct xe_gsc *gsc)
 		flush_work(&gsc->work);
 }
 
-/**
- * xe_gsc_remove() - Clean up the GSC structures before driver removal
- * @gsc: the GSC uC
- */
-void xe_gsc_remove(struct xe_gsc *gsc)
-{
-	xe_gsc_proxy_remove(gsc);
-}
-
 /*
  * wa_14015076503: if the GSC FW is loaded, we need to alert it before doing a
  * GSC engine reset by writing a notification bit in the GS1 register and then
diff --git a/drivers/gpu/drm/xe/xe_gsc.h b/drivers/gpu/drm/xe/xe_gsc.h
index e282b9ef6ec4d..d99f66c38075c 100644
--- a/drivers/gpu/drm/xe/xe_gsc.h
+++ b/drivers/gpu/drm/xe/xe_gsc.h
@@ -17,7 +17,6 @@ int xe_gsc_init(struct xe_gsc *gsc);
 int xe_gsc_init_post_hwconfig(struct xe_gsc *gsc);
 void xe_gsc_wait_for_worker_completion(struct xe_gsc *gsc);
 void xe_gsc_load_start(struct xe_gsc *gsc);
-void xe_gsc_remove(struct xe_gsc *gsc);
 void xe_gsc_hwe_irq_handler(struct xe_hw_engine *hwe, u16 intr_vec);
 
 void xe_gsc_wa_14015076503(struct xe_gt *gt, bool prep);
diff --git a/drivers/gpu/drm/xe/xe_gsc_proxy.c b/drivers/gpu/drm/xe/xe_gsc_proxy.c
index 24cc6a4f9a96a..6aa76a7843cfa 100644
--- a/drivers/gpu/drm/xe/xe_gsc_proxy.c
+++ b/drivers/gpu/drm/xe/xe_gsc_proxy.c
@@ -423,6 +423,34 @@ static int proxy_channel_alloc(struct xe_gsc *gsc)
 	return 0;
 }
 
+static void xe_gsc_proxy_remove(struct xe_device *__xe, void *arg)
+{
+	struct xe_gsc *gsc = arg;
+	struct xe_gt *gt = gsc_to_gt(gsc);
+	struct xe_device *xe = gt_to_xe(gt);
+	unsigned int fw_ref = 0;
+
+	if (!gsc->proxy.component_added)
+		return;
+
+	/* disable HECI2 IRQs */
+	xe_pm_runtime_get(xe);
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC);
+	if (!fw_ref)
+		xe_gt_err(gt, "failed to get forcewake to disable GSC interrupts\n");
+
+	/* try do disable irq even if forcewake failed */
+	gsc_proxy_irq_toggle(gsc, false);
+
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	xe_pm_runtime_put(xe);
+
+	xe_gsc_wait_for_worker_completion(gsc);
+
+	component_del(xe->drm.dev, &xe_gsc_proxy_component_ops);
+	gsc->proxy.component_added = false;
+}
+
 /**
  * xe_gsc_proxy_init() - init objects and MEI component required by GSC proxy
  * @gsc: the GSC uC
@@ -462,40 +490,7 @@ int xe_gsc_proxy_init(struct xe_gsc *gsc)
 
 	gsc->proxy.component_added = true;
 
-	/* the component must be removed before unload, so can't use drmm for cleanup */
-
-	return 0;
-}
-
-/**
- * xe_gsc_proxy_remove() - remove the GSC proxy MEI component
- * @gsc: the GSC uC
- */
-void xe_gsc_proxy_remove(struct xe_gsc *gsc)
-{
-	struct xe_gt *gt = gsc_to_gt(gsc);
-	struct xe_device *xe = gt_to_xe(gt);
-	unsigned int fw_ref = 0;
-
-	if (!gsc->proxy.component_added)
-		return;
-
-	/* disable HECI2 IRQs */
-	xe_pm_runtime_get(xe);
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC);
-	if (!fw_ref)
-		xe_gt_err(gt, "failed to get forcewake to disable GSC interrupts\n");
-
-	/* try do disable irq even if forcewake failed */
-	gsc_proxy_irq_toggle(gsc, false);
-
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
-	xe_pm_runtime_put(xe);
-
-	xe_gsc_wait_for_worker_completion(gsc);
-
-	component_del(xe->drm.dev, &xe_gsc_proxy_component_ops);
-	gsc->proxy.component_added = false;
+	return xe_device_add_action_or_reset(xe, xe_gsc_proxy_remove, gsc);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_gsc_proxy.h b/drivers/gpu/drm/xe/xe_gsc_proxy.h
index c511ade6b8637..fdef56995cd43 100644
--- a/drivers/gpu/drm/xe/xe_gsc_proxy.h
+++ b/drivers/gpu/drm/xe/xe_gsc_proxy.h
@@ -12,7 +12,6 @@ struct xe_gsc;
 
 int xe_gsc_proxy_init(struct xe_gsc *gsc);
 bool xe_gsc_proxy_init_done(struct xe_gsc *gsc);
-void xe_gsc_proxy_remove(struct xe_gsc *gsc);
 int xe_gsc_proxy_start(struct xe_gsc *gsc);
 
 int xe_gsc_proxy_request_handler(struct xe_gsc *gsc);
diff --git a/drivers/gpu/drm/xe/xe_gsc_types.h b/drivers/gpu/drm/xe/xe_gsc_types.h
index 5926de20214c8..97c056656df05 100644
--- a/drivers/gpu/drm/xe/xe_gsc_types.h
+++ b/drivers/gpu/drm/xe/xe_gsc_types.h
@@ -13,6 +13,7 @@
 #include <linux/workqueue.h>
 
 #include "xe_uc_fw_types.h"
+#include "xe_device_types.h"
 
 struct xe_bo;
 struct xe_exec_queue;
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 9fb8f1e678dc8..c33040278e1aa 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -141,26 +141,6 @@ static void xe_gt_disable_host_l2_vram(struct xe_gt *gt)
 	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 }
 
-/**
- * xe_gt_remove() - Clean up the GT structures before driver removal
- * @gt: the GT object
- *
- * This function should only act on objects/structures that must be cleaned
- * before the driver removal callback is complete and therefore can't be
- * deferred to a drmm action.
- */
-void xe_gt_remove(struct xe_gt *gt)
-{
-	int i;
-
-	xe_uc_remove(&gt->uc);
-
-	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
-		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
-
-	xe_gt_disable_host_l2_vram(gt);
-}
-
 static void gt_reset_worker(struct work_struct *w);
 
 static int emit_nop_job(struct xe_gt *gt, struct xe_exec_queue *q)
@@ -583,6 +563,17 @@ int xe_gt_init_hwconfig(struct xe_gt *gt)
 	return err;
 }
 
+static void xe_gt_fini(void *arg)
+{
+	struct xe_gt *gt = arg;
+	int i;
+
+	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
+		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
+
+	xe_gt_disable_host_l2_vram(gt);
+}
+
 int xe_gt_init(struct xe_gt *gt)
 {
 	int err;
@@ -595,6 +586,10 @@ int xe_gt_init(struct xe_gt *gt)
 		xe_hw_fence_irq_init(&gt->fence_irq[i]);
 	}
 
+	err = devm_add_action_or_reset(gt_to_xe(gt)->drm.dev, xe_gt_fini, gt);
+	if (err)
+		return err;
+
 	err = xe_gt_pagefault_init(gt);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index e504cc33ade4f..187fa6490eafc 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -54,7 +54,6 @@ int xe_gt_resume(struct xe_gt *gt);
 void xe_gt_reset_async(struct xe_gt *gt);
 void xe_gt_sanitize(struct xe_gt *gt);
 int xe_gt_sanitize_freq(struct xe_gt *gt);
-void xe_gt_remove(struct xe_gt *gt);
 
 /**
  * xe_gt_wait_for_reset - wait for gt's async reset to finalize.
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 0d073a9987c2e..d8167e818280b 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -288,19 +288,6 @@ int xe_uc_suspend(struct xe_uc *uc)
 	return xe_guc_suspend(&uc->guc);
 }
 
-/**
- * xe_uc_remove() - Clean up the UC structures before driver removal
- * @uc: the UC object
- *
- * This function should only act on objects/structures that must be cleaned
- * before the driver removal callback is complete and therefore can't be
- * deferred to a drmm action.
- */
-void xe_uc_remove(struct xe_uc *uc)
-{
-	xe_gsc_remove(&uc->gsc);
-}
-
 /**
  * xe_uc_declare_wedged() - Declare UC wedged
  * @uc: the UC object
diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
index 506517c113339..3813c1ede450e 100644
--- a/drivers/gpu/drm/xe/xe_uc.h
+++ b/drivers/gpu/drm/xe/xe_uc.h
@@ -20,7 +20,6 @@ void xe_uc_stop(struct xe_uc *uc);
 int xe_uc_start(struct xe_uc *uc);
 int xe_uc_suspend(struct xe_uc *uc);
 int xe_uc_sanitize_reset(struct xe_uc *uc);
-void xe_uc_remove(struct xe_uc *uc);
 void xe_uc_declare_wedged(struct xe_uc *uc);
 
 #endif
-- 
2.48.1

