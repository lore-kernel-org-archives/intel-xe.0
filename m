Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCD9BC369C9
	for <intel-xe@archiver.kernel.org>; Thu, 17 Apr 2025 22:37:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8021B10E3CD;
	Thu, 17 Apr 2025 22:37:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nAGwp4Nl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 708DB10E3CD
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Apr 2025 22:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744929447; x=1776465447;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PE8DCkYx4IciE7Fb/ea6BC6RoBlI38pO9SMaJE44u5w=;
 b=nAGwp4Nl1jPrpq6j04Frdk1zyCWGo9pROJvnoSRE7eHA5/CIRl4nA7+V
 wwT2Zb0SfEV8XMlz8SIo0YZziOK0N12SjUpRYL+8/wS0WFmYFTP60A5HX
 g6HIOlS/PKCYUuLJnLKhOqaI4XR2SA3sMYW4aQrEkU9KYPfVRhC8pzslq
 knFadcC0jEtc7eVj7yH441/wV4I5YlmsOC73yNH/sFSoE3/BbYiNIbUKj
 HG8+MMIg22tL9GtF2imjeFgb4OaDL5i3F1FCL9jQbDqMD2lhVLjTK8Tvm
 Nrky/zhPd/L8CCTD99VH2u5MfrEaIa8fp6lvkSh5aTKyuMOXmzXEsyRr6 Q==;
X-CSE-ConnectionGUID: g9y8lTrgQoWslmLzCRxWfA==
X-CSE-MsgGUID: znl9RHbeT2OJ3iOu3+5fhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="57538549"
X-IronPort-AV: E=Sophos;i="6.15,220,1739865600"; d="scan'208";a="57538549"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 15:37:24 -0700
X-CSE-ConnectionGUID: hn0vUghFSqKbIWFq32Tldw==
X-CSE-MsgGUID: jrS/LNJEREysYPkz4Xu9Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,220,1739865600"; d="scan'208";a="130958395"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 15:37:23 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>, stable@vger.kernel.org
Subject: [PATCH] drm/xe/gsc: do not flush the GSC worker from the reset path
Date: Thu, 17 Apr 2025 15:37:13 -0700
Message-ID: <20250417223713.1377506-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
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

The workqueue used for the reset worker is marked as WQ_MEM_RECLAIM,
while the GSC one isn't (and can't be as we need to do memory
allocations in the gsc worker). Therefore, we can't flush the latter
from the former.

The reason why we had such a flush was to avoid interrupting either
the GSC FW load or in progress GSC proxy operations. GSC proxy
operations fall into 2 categories:

1) GSC proxy init: this only happen once immediately after GSC FW laod
   and does not support being interrupted. The only way to recover from
   an interruption of the proxy init is to do an FLR and re-load the GSC.

2) GSC proxy request: this can happen in response to a request that
   the driver sends to the GSC. If this is interrupted, the GSC FW will
   timeout and the driver request will be failed, but overall the GSC
   will keep working fine.

Flushing the work allowed us to avoid interruption in both cases (unless
the hang came from the GSC engine itself, in which case we're toast
anyway). However, a failure on a proxy request is tolerable if we're in
a scenario where we're triggering a GT reset (i.e., something is already
gone pretty wrong), so what we really need to avoid is interrupting
the init flow, which we can do by polling on the register that reports
when the proxy init is complete (as that ensure us that all the load and
init operations have been completed).

Note that during suspend we still want to do a flush of the worker to
make sure it completes any operations involving the HW before the power
is cut.

Fixes: dd0e89e5edc2 ("drm/xe/gsc: GSC FW load")
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: <stable@vger.kernel.org> # v6.8+
---
 drivers/gpu/drm/xe/xe_gsc.c       | 22 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gsc.h       |  1 +
 drivers/gpu/drm/xe/xe_gsc_proxy.c | 11 +++++++++++
 drivers/gpu/drm/xe/xe_gsc_proxy.h |  1 +
 drivers/gpu/drm/xe/xe_gt.c        |  2 +-
 drivers/gpu/drm/xe/xe_uc.c        |  8 +++++++-
 drivers/gpu/drm/xe/xe_uc.h        |  1 +
 7 files changed, 44 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
index fd41113f8572..64799358e51f 100644
--- a/drivers/gpu/drm/xe/xe_gsc.c
+++ b/drivers/gpu/drm/xe/xe_gsc.c
@@ -555,6 +555,28 @@ void xe_gsc_wait_for_worker_completion(struct xe_gsc *gsc)
 		flush_work(&gsc->work);
 }
 
+void xe_gsc_stop_prepare(struct xe_gsc *gsc)
+{
+	struct xe_gt *gt = gsc_to_gt(gsc);
+	int ret;
+
+	if (!xe_uc_fw_is_loadable(&gsc->fw) || xe_uc_fw_is_in_error_state(&gsc->fw))
+		return;
+
+	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GSC);
+
+	/*
+	 * If the GSC FW load or the proxy init are interrupted, the only way
+	 * to recover it is to do an FLR and reload the GSC from scratch.
+	 * Therefore, let's wait for the init to complete before stopping
+	 * operations. The proxy init is the last step, so we can just wait on
+	 * that
+	 */
+	ret = xe_gsc_wait_for_proxy_done(gsc);
+	if (ret)
+		xe_gt_err(gt, "failed to wait for GSC init completion before uc stop\n");
+}
+
 /*
  * wa_14015076503: if the GSC FW is loaded, we need to alert it before doing a
  * GSC engine reset by writing a notification bit in the GS1 register and then
diff --git a/drivers/gpu/drm/xe/xe_gsc.h b/drivers/gpu/drm/xe/xe_gsc.h
index d99f66c38075..b8b8e0810ad9 100644
--- a/drivers/gpu/drm/xe/xe_gsc.h
+++ b/drivers/gpu/drm/xe/xe_gsc.h
@@ -16,6 +16,7 @@ struct xe_hw_engine;
 int xe_gsc_init(struct xe_gsc *gsc);
 int xe_gsc_init_post_hwconfig(struct xe_gsc *gsc);
 void xe_gsc_wait_for_worker_completion(struct xe_gsc *gsc);
+void xe_gsc_stop_prepare(struct xe_gsc *gsc);
 void xe_gsc_load_start(struct xe_gsc *gsc);
 void xe_gsc_hwe_irq_handler(struct xe_hw_engine *hwe, u16 intr_vec);
 
diff --git a/drivers/gpu/drm/xe/xe_gsc_proxy.c b/drivers/gpu/drm/xe/xe_gsc_proxy.c
index 8cf70b228ff3..7ec81cb00b85 100644
--- a/drivers/gpu/drm/xe/xe_gsc_proxy.c
+++ b/drivers/gpu/drm/xe/xe_gsc_proxy.c
@@ -71,6 +71,17 @@ bool xe_gsc_proxy_init_done(struct xe_gsc *gsc)
 	       HECI1_FWSTS1_PROXY_STATE_NORMAL;
 }
 
+int xe_gsc_wait_for_proxy_done(struct xe_gsc *gsc)
+{
+	struct xe_gt *gt = gsc_to_gt(gsc);
+
+	/* Proxy init can take up to 500ms, so wait double that for safety */
+	return xe_mmio_wait32(&gt->mmio, HECI_FWSTS1(MTL_GSC_HECI1_BASE),
+			      HECI1_FWSTS1_CURRENT_STATE,
+			      HECI1_FWSTS1_PROXY_STATE_NORMAL,
+			      USEC_PER_SEC, NULL, false);
+}
+
 static void __gsc_proxy_irq_rmw(struct xe_gsc *gsc, u32 clr, u32 set)
 {
 	struct xe_gt *gt = gsc_to_gt(gsc);
diff --git a/drivers/gpu/drm/xe/xe_gsc_proxy.h b/drivers/gpu/drm/xe/xe_gsc_proxy.h
index fdef56995cd4..da8c60362a1c 100644
--- a/drivers/gpu/drm/xe/xe_gsc_proxy.h
+++ b/drivers/gpu/drm/xe/xe_gsc_proxy.h
@@ -12,6 +12,7 @@ struct xe_gsc;
 
 int xe_gsc_proxy_init(struct xe_gsc *gsc);
 bool xe_gsc_proxy_init_done(struct xe_gsc *gsc);
+int xe_gsc_wait_for_proxy_done(struct xe_gsc *gsc);
 int xe_gsc_proxy_start(struct xe_gsc *gsc);
 
 int xe_gsc_proxy_request_handler(struct xe_gsc *gsc);
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 8068b4bc0a09..0e5d243c9451 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -899,7 +899,7 @@ void xe_gt_suspend_prepare(struct xe_gt *gt)
 
 	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 
-	xe_uc_stop_prepare(&gt->uc);
+	xe_uc_suspend_prepare(&gt->uc);
 
 	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 }
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index c14bd2282044..3a8751a8b92d 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -244,7 +244,7 @@ void xe_uc_gucrc_disable(struct xe_uc *uc)
 
 void xe_uc_stop_prepare(struct xe_uc *uc)
 {
-	xe_gsc_wait_for_worker_completion(&uc->gsc);
+	xe_gsc_stop_prepare(&uc->gsc);
 	xe_guc_stop_prepare(&uc->guc);
 }
 
@@ -278,6 +278,12 @@ static void uc_reset_wait(struct xe_uc *uc)
 		goto again;
 }
 
+void xe_uc_suspend_prepare(struct xe_uc *uc)
+{
+	xe_gsc_wait_for_worker_completion(&uc->gsc);
+	xe_guc_stop_prepare(&uc->guc);
+}
+
 int xe_uc_suspend(struct xe_uc *uc)
 {
 	/* GuC submission not enabled, nothing to do */
diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
index 3813c1ede450..c23e6f5e2514 100644
--- a/drivers/gpu/drm/xe/xe_uc.h
+++ b/drivers/gpu/drm/xe/xe_uc.h
@@ -18,6 +18,7 @@ int xe_uc_reset_prepare(struct xe_uc *uc);
 void xe_uc_stop_prepare(struct xe_uc *uc);
 void xe_uc_stop(struct xe_uc *uc);
 int xe_uc_start(struct xe_uc *uc);
+void xe_uc_suspend_prepare(struct xe_uc *uc);
 int xe_uc_suspend(struct xe_uc *uc);
 int xe_uc_sanitize_reset(struct xe_uc *uc);
 void xe_uc_declare_wedged(struct xe_uc *uc);
-- 
2.43.0

