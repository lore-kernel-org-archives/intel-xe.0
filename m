Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 083C2C3DA4B
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 13:16:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBAB310E0B7;
	Wed, 17 Jul 2024 13:16:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eskXRGCi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 438B210E0B7
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 13:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721222160; x=1752758160;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AhgSPCh/MNYGJjiiPJsHd8Diwei3DdUejr7obMShpgc=;
 b=eskXRGCi33hdpvcjX0vSq4qdjoXlB3eGz+RxOSp3U6LXbbxnxYJVPZH5
 KeVzgHz9jM1CG4+NA1GpyKOEl0N7e5HOBWR7YVHHwg85hj3IVq8JV4E0C
 mcwZnJOkr6rOATJtZVipG5uRzaCHMLXxDQetwLyWiewF6FnFlZydOY9Te
 ds+pv7eGKdXkRQqZwG5EtfZ+zpUPBowBy2r+5aJhR0Ugqjs+SHaRg5cAU
 vPVGwZ8zAvUbJ4TZcUpnvZ1pZsM6FHD8Z2RE5SjaZsZMAEiTlghkJrccu
 bpX0H+1MVIxccYEXL1vL+DStskW6fAXI7U/6uQNLrbvn5Ymt6yI2VWZfC w==;
X-CSE-ConnectionGUID: YGvdjClySKCJwqdbR9+zqQ==
X-CSE-MsgGUID: xXmPZZ+bSt6fFNe2CbzmIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18573901"
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="18573901"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 06:16:00 -0700
X-CSE-ConnectionGUID: U4ejE8M+S9edEK1REfsgiA==
X-CSE-MsgGUID: 1RRbnHHaT2iN8qzRdbtRiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="55228327"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 06:15:58 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v2] drm/xe/pm: Add trace for pm functions
Date: Wed, 17 Jul 2024 14:59:50 +0200
Message-ID: <20240717125950.9952-1-nirmoy.das@intel.com>
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

v2: Fix indentation and add trace for xe_pm_runtime_get_ioctl

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c    |  8 ++++++
 drivers/gpu/drm/xe/xe_trace.h | 52 +++++++++++++++++++++++++++++++++++
 2 files changed, 60 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index de3b5df65e48..9f3c14fd9f33 100644
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
@@ -495,6 +502,7 @@ void xe_pm_runtime_put(struct xe_device *xe)
  */
 int xe_pm_runtime_get_ioctl(struct xe_device *xe)
 {
+	trace_xe_pm_runtime_get_ioctl(xe, __builtin_return_address(0));
 	if (WARN_ON(xe_pm_read_callback_task(xe) == current))
 		return -ELOOP;
 
diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index baba14fb1e32..1abdb30cb7ad 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -369,6 +369,58 @@ TRACE_EVENT(xe_reg_rw,
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
+	     TP_PROTO(struct xe_device *xe, void *caller),
+	     TP_ARGS(xe, caller)
+);
+
+DEFINE_EVENT(xe_pm_runtime, xe_pm_runtime_put,
+	     TP_PROTO(struct xe_device *xe, void *caller),
+	     TP_ARGS(xe, caller)
+);
+
+DEFINE_EVENT(xe_pm_runtime, xe_pm_resume,
+	     TP_PROTO(struct xe_device *xe, void *caller),
+	     TP_ARGS(xe, caller)
+);
+
+DEFINE_EVENT(xe_pm_runtime, xe_pm_suspend,
+	     TP_PROTO(struct xe_device *xe, void *caller),
+	     TP_ARGS(xe, caller)
+);
+
+DEFINE_EVENT(xe_pm_runtime, xe_pm_runtime_resume,
+	     TP_PROTO(struct xe_device *xe, void *caller),
+	     TP_ARGS(xe, caller)
+);
+
+DEFINE_EVENT(xe_pm_runtime, xe_pm_runtime_suspend,
+	     TP_PROTO(struct xe_device *xe, void *caller),
+	     TP_ARGS(xe, caller)
+);
+
+DEFINE_EVENT(xe_pm_runtime, xe_pm_runtime_get_ioctl,
+	     TP_PROTO(struct xe_device *xe, void *caller),
+	     TP_ARGS(xe, caller)
+);
+
 #endif
 
 /* This part must be outside protection */
-- 
2.42.0

