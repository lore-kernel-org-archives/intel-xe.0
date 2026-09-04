Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC82BC624DE
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 08:05:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C67910E135;
	Fri,  4 Sep 2026 08:05:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uzsw/Mc5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E07B10E135
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 08:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788509125; x=1820045125;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=D1AzrfGgSXuS5ocOuSVeVpvq1ti6s3R+Te8LUPgpDIw=;
 b=Uzsw/Mc53xpQ8JHDQF/8ZvGXzkGlmHEaTNOwtPuip43H34HSBZzg3+aM
 2gClr7nClKjcs+kt5lpSVL52/n1dGa153tOH9juqiGWI3cNlSrav5DLv5
 oBny6JLkiVuScZYfhRilmizOQK7rBRLbw9iFlW5KyqIbb+ZxoKCEkomRF
 /DTpf8PSzPHOVG2NexmvUBSkm3oIaWHSadLwZkyIBoEXg06ZG8jNmw8/B
 g1M2z9msodgU2kKwetStTZUaJo2Ef15nyvdh6c0ClM/8x8K82IFCGguzf
 v+wMRWyDr+EXKDz/PuQt8C3cmpSYvHmtodp+gjZa06Qv3wBBs/S3UPKcw A==;
X-CSE-ConnectionGUID: O2N5cegURoiIsuoxKvAWkA==
X-CSE-MsgGUID: fUaGyokNT1m/Eb4NXYvQcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="92876892"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="92876892"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 01:05:22 -0700
X-CSE-ConnectionGUID: W3I90oaFT8iVpTTKh7g3ig==
X-CSE-MsgGUID: vzUxaqEeT/a0roI2O8X37Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="308192358"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 01:05:15 -0700
From: Varun Gupta <varun.gupta@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com, matthew.brost@intel.com,
 himal.prasad.ghimiray@intel.com, szymon.markiewicz@intel.com
Subject: [PATCH v2] drm/xe/guc: Guard page-fault ack with runtime PM check
Date: Fri,  4 Sep 2026 13:35:06 +0530
Message-ID: <20260904080505.4159219-2-varun.gupta@intel.com>
X-Mailer: git-send-email 2.43.0
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

During VM teardown, the VM's runtime PM reference is dropped
asynchronously, allowing the device to autosuspend while stale page
faults belonging to the now-dead VM are still queued. When the
page-fault worker later tries to ack one of these, it calls into
guc_ct_send_locked() on an already-suspended device, tripping:

  Assertion `!xe_pm_runtime_suspended(xe)` failed!
  WARNING at xe_device.c:1267 xe_device_assert_mem_access+0x11c/0x140 [xe]

A live VM/exec queue always holds a PM reference while it has
outstanding work, so if the device is suspended at ack time, the
owning context is already gone and the fault is stale.

Take a runtime PM reference across the entire page-fault ack batch
preventing mid-batch suspends.

v2:
 - Hold PM ref across the entire batch (begin/end) instead of per-ack.
   This prevents the device from autosuspending mid-batch, which would
   leave write_only acks written but the end flush skipped, and skip
   counter++, desyncing the cadence check.(Himal)
 - Add a comment explaining stale faults.(Himal)

Fixes: f289f7807119 ("drm/xe: Add xe_guc_pagefault layer")
Reported-by: Szymon Markiewicz <szymon.markiewicz@intel.com>
Signed-off-by: Varun Gupta <varun.gupta@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pagefault.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_pagefault.c b/drivers/gpu/drm/xe/xe_guc_pagefault.c
index 8f8210a732e9..9c9cd6e056fb 100644
--- a/drivers/gpu/drm/xe/xe_guc_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_guc_pagefault.c
@@ -9,12 +9,21 @@
 #include "xe_guc_pagefault.h"
 #include "xe_pagefault.h"
 #include "xe_pagefault_types.h"
+#include "xe_pm.h"
 
 #define XE_GUC_PAGEFAULT_FLUSH_PERIOD	BIT(4)	/* Sixteen */
 
 static void guc_ack_fault_begin(void *private)
 {
 	struct xe_guc *guc = private;
+	struct xe_device *xe = guc_to_xe(guc);
+
+	/*
+	 * Live VMs hold a PM ref, so faults during suspend are stale.
+	 * Hold a PM ref across the entire batch to safely drain them
+	 * and prevent mid-batch autosuspend from desyncing CT flushes.
+	 */
+	xe_pm_runtime_get(xe);
 
 	xe_guc_ct_lock(&guc->ct);
 
@@ -62,10 +71,13 @@ static void guc_ack_fault(struct xe_pagefault *pf, int err)
 static void guc_ack_fault_end(void *private)
 {
 	struct xe_guc *guc = private;
+	struct xe_device *xe = guc_to_xe(guc);
 
 	if ((guc->pagefault_ack_counter & (XE_GUC_PAGEFAULT_FLUSH_PERIOD - 1)) != 1)
 		xe_guc_ct_send_flush(&guc->ct);
 	xe_guc_ct_unlock(&guc->ct);
+
+	xe_pm_runtime_put(xe);
 }
 
 static const struct xe_pagefault_ops guc_pagefault_ops = {
-- 
2.43.0

