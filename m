Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6BEAC3DA42
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 11:45:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEE5510E2AE;
	Wed, 17 Jul 2024 11:45:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZPjRaxCl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C437910E570
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 11:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721216720; x=1752752720;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=f8u3tkRfDfxNGacem5zU6EHuB8qaS0n4ZvoZ7qAz7Dg=;
 b=ZPjRaxClK7xtkiQD8OK2Ov33ubdnPn+Tv7W9Yveq4DIICsn8/CHyfJyb
 XPRgatYk+3YrcFBwACP16Zp2Sv0/WqJ07Xaxjz0xODWO13f5k++l+ry9n
 ZQrRXmAzBVZC9/MyWZ9GriBrUczMTu6vdjnDf1E+UCdY5mgZwdUk+37QE
 OPcDnsg9u5+J8+q5hcET0oZaBV3bnG3Px88hHFE1amT3mLgjhm/2E9txd
 7HlWGRCFPMnM5P+KZrv9yeSu1PHm3kHbNj380pZ6XGZyxl9Cgy5Iuh9RI
 mwq9rSx7PFCXqPkiL0cZjK0J5OssA8uh5C9pUdfcI6Adb4aNb4COQj2aD A==;
X-CSE-ConnectionGUID: gd+PGvjJQEWYEKPdOmMLVQ==
X-CSE-MsgGUID: YeLK8BrZThKiU5r6HsYZ5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="36151230"
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="36151230"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 04:45:17 -0700
X-CSE-ConnectionGUID: yTbRaLCTQKKebBF9V6kxdQ==
X-CSE-MsgGUID: F9WsDBaHQeGZXB4L46saHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="81029103"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 04:45:16 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH] drm/xe/pm: Add trace for pm functions
Date: Wed, 17 Jul 2024 13:29:08 +0200
Message-ID: <20240717112908.14394-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

Add trace for xe pm function for better debuggability.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
Example Output: 
          <idle>-0       [004] d.h2.  3821.138392: xe_pm_runtime_put: dev=0000:00:02.0 caller_function=xe_guc_ct_fast_path+0x2e4/0x430 [xe]
   kworker/u32:0-53314   [001] .....  3821.138411: xe_pm_runtime_put: dev=0000:00:02.0 caller_function=receive_g2h+0x2cc/0x350 [xe]
          <idle>-0       [004] d.h2.  3821.138439: xe_pm_runtime_put: dev=0000:00:02.0 caller_function=xe_guc_ct_fast_path+0x2e4/0x430 [xe]
   kworker/u32:0-53314   [001] .....  3821.138443: xe_pm_runtime_put: dev=0000:00:02.0 caller_function=receive_g2h+0x2cc/0x350 [xe]
     kworker/0:1-9       [000] .....  3821.138474: xe_pm_runtime_put: dev=0000:00:02.0 caller_function=xe_ggtt_remove_node+0x1f6/0x280 [xe]
     kworker/0:1-9       [000] .....  3821.138495: xe_pm_runtime_put: dev=0000:00:02.0 caller_function=__guc_exec_queue_fini_async+0x1b3/0x350 [xe]
     kworker/0:0-21730   [000] .....  3821.138503: xe_pm_runtime_put: dev=0000:00:02.0 caller_function=xe_ggtt_remove_node+0x1f6/0x280 [xe]
     kworker/0:0-21730   [000] .....  3821.138540: xe_pm_runtime_put: dev=0000:00:02.0 caller_function=__guc_exec_queue_fini_async+0x1b3/0x350 [xe]
   kworker/u33:0-25711   [002] .....  3821.138601: xe_vm_free: dev=0000:00:02.0, vm=ffff88811185a000, asid=0x00004
     kworker/1:6-21907   [001] .....  3822.308942: xe_pm_runtime_suspend: dev=0000:00:02.0 caller_function=xe_pci_runtime_suspend+0x3f/0x120 [xe]
     kworker/1:6-21907   [001] .....  3822.309550: xe_exec_queue_stop: dev=0000:00:02.0, 3:0x2, gt=0, width=1, guc_id=0, guc_state=0x0, flags=0x13

 drivers/gpu/drm/xe/xe_pm.c    |  7 ++++++
 drivers/gpu/drm/xe/xe_trace.h | 47 +++++++++++++++++++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index de3b5df65e48..a38452ccf033 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -20,6 +20,7 @@
 #include "xe_guc.h"
 #include "xe_irq.h"
 #include "xe_pcode.h"
+#include "xe_trace.h"
 #include "xe_wa.h"
 
 /**
@@ -87,6 +88,7 @@ int xe_pm_suspend(struct xe_device *xe)
 	int err;
 
 	drm_dbg(&xe->drm, "Suspending device\n");
+	trace_xe_pm_suspend(xe, __builtin_return_address(0));
 
 	for_each_gt(gt, xe, id)
 		xe_gt_suspend_prepare(gt);
@@ -131,6 +133,7 @@ int xe_pm_resume(struct xe_device *xe)
 	int err;
 
 	drm_dbg(&xe->drm, "Resuming device\n");
+	trace_xe_pm_resume(xe, __builtin_return_address(0));
 
 	for_each_tile(tile, xe, id)
 		xe_wa_apply_tile_workarounds(tile);
@@ -326,6 +329,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 	u8 id;
 	int err = 0;
 
+	trace_xe_pm_runtime_suspend(xe, __builtin_return_address(0));
 	/* Disable access_ongoing asserts and prevent recursive pm calls */
 	xe_pm_write_callback_task(xe, current);
 
@@ -399,6 +403,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 	u8 id;
 	int err = 0;
 
+	trace_xe_pm_runtime_resume(xe, __builtin_return_address(0));
 	/* Disable access_ongoing asserts and prevent recursive pm calls */
 	xe_pm_write_callback_task(xe, current);
 
@@ -463,6 +468,7 @@ static void pm_runtime_lockdep_prime(void)
  */
 void xe_pm_runtime_get(struct xe_device *xe)
 {
+	trace_xe_pm_runtime_get(xe, __builtin_return_address(0));
 	pm_runtime_get_noresume(xe->drm.dev);
 
 	if (xe_pm_read_callback_task(xe) == current)
@@ -478,6 +484,7 @@ void xe_pm_runtime_get(struct xe_device *xe)
  */
 void xe_pm_runtime_put(struct xe_device *xe)
 {
+	trace_xe_pm_runtime_put(xe, __builtin_return_address(0));
 	if (xe_pm_read_callback_task(xe) == current) {
 		pm_runtime_put_noidle(xe->drm.dev);
 	} else {
diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index baba14fb1e32..73fe28f92d48 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -369,6 +369,53 @@ TRACE_EVENT(xe_reg_rw,
 		  (u32)(__entry->val >> 32))
 );
 
+DECLARE_EVENT_CLASS(xe_pm_runtime,
+		    TP_PROTO(struct xe_device *xe, void *caller),
+		    TP_ARGS(xe, caller),
+
+		    TP_STRUCT__entry(
+			     __string(dev, __dev_name_xe(xe))
+			     __field(void *, caller)
+			     ),
+
+		    TP_fast_assign(
+			   __assign_str(dev);
+			   __entry->caller = caller;
+			   ),
+
+		    TP_printk("dev=%s caller_function=%pS", __get_str(dev), __entry->caller)
+);
+
+DEFINE_EVENT(xe_pm_runtime, xe_pm_runtime_get,
+		TP_PROTO(struct xe_device *xe, void *caller),
+		TP_ARGS(xe, caller)
+);
+
+DEFINE_EVENT(xe_pm_runtime, xe_pm_runtime_put,
+	     TP_PROTO(struct xe_device *xe, void *caller),
+	     TP_ARGS(xe, caller)
+);
+
+DEFINE_EVENT(xe_pm_runtime, xe_pm_resume,
+		TP_PROTO(struct xe_device *xe, void *caller),
+		TP_ARGS(xe, caller)
+);
+
+DEFINE_EVENT(xe_pm_runtime, xe_pm_suspend,
+		TP_PROTO(struct xe_device *xe, void *caller),
+		TP_ARGS(xe, caller)
+);
+
+DEFINE_EVENT(xe_pm_runtime, xe_pm_runtime_resume,
+		TP_PROTO(struct xe_device *xe, void *caller),
+		TP_ARGS(xe, caller)
+);
+
+DEFINE_EVENT(xe_pm_runtime, xe_pm_runtime_suspend,
+	     TP_PROTO(struct xe_device *xe, void *caller),
+	     TP_ARGS(xe, caller)
+);
+
 #endif
 
 /* This part must be outside protection */
-- 
2.42.0

