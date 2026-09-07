Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86F31C79F89
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 05:00:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3076D10E634;
	Mon,  7 Sep 2026 05:00:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WQSxH5Af";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B80F10E634
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Sep 2026 05:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788757221; x=1820293221;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+XMEPwG0kbWLtS/xhwbN+h3cJ+Bp3iAkwMSEBltN1A0=;
 b=WQSxH5AflD17CzILYR5ZwbGndvVeHD+IvDamiHcCfuXULjNvpAxZmHEb
 KFr6oRhTwasHkLhcYgNXtXKZ6jbbc2hfY8aOgDLzaNQIowOo3plohJ5pk
 1SffAJfg55bVcBlkHA/TYmuG4N6RyjFQswF2yL3fn+IY+pns6a8SLRQep
 hmVMNDfyMsguSAYpZBY+EHd8iW2UGGNJISFuAVAhYJlCX2k0wpR5vXLx0
 0Fr9szOqQ7iArCXreM3r5qRoJpKIcmLpedrMuFTTcw2IYDJWkdXP0e6/h
 PsgDHU4njDzdDKL+EFtAXu/+7BEfE9E34uM1Tue0CS30rAIVu+MJ6Qc4S w==;
X-CSE-ConnectionGUID: +qAXxk+HRBuLG0rWiK2RQA==
X-CSE-MsgGUID: iuqQ8jZ1QcWTtBZCS/Xfgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="89206740"
X-IronPort-AV: E=Sophos;i="6.25,266,1779174000"; d="scan'208";a="89206740"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2026 22:00:20 -0700
X-CSE-ConnectionGUID: JE48cy7RRNaGsquFIZu7sg==
X-CSE-MsgGUID: nIVz0QFGTOer3djnPZhr7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,266,1779174000"; d="scan'208";a="264412384"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2026 22:00:19 -0700
From: Varun Gupta <varun.gupta@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3] drm/xe: Guard page-fault worker with runtime PM check
Date: Mon,  7 Sep 2026 10:30:12 +0530
Message-ID: <20260907050011.497181-2-varun.gupta@intel.com>
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

Take a runtime PM reference across the entire pagefault
queue worker to safely deliver acks for torn-down VMs.

v3:
 - Move PM ref to the generic xe_pagefault_queue_work using
   guard(xe_pm_runtime)(xe) instead of tracking it in the GuC
   backend(Matt Brost).

v2:
 - Hold PM ref across the entire batch (begin/end) instead of per-ack.
   This prevents the device from autosuspending mid-batch, which would
   leave write_only acks written but the end flush skipped, and skip
   counter++, desyncing the cadence check.(Himal)
 - Add a comment explaining stale faults.(Himal)

Fixes: f289f7807119 ("drm/xe: Add xe_guc_pagefault layer")
Reported-by: Szymon Markiewicz <szymon.markiewicz@intel.com>
Signed-off-by: Varun Gupta <varun.gupta@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pagefault.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index 2e415995f067..3e8e8f7f5f40 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -17,6 +17,7 @@
 #include "xe_log.h"
 #include "xe_pagefault.h"
 #include "xe_pagefault_types.h"
+#include "xe_pm.h"
 #include "xe_svm.h"
 #include "xe_trace_bo.h"
 #include "xe_vm.h"
@@ -604,6 +605,13 @@ static void xe_pagefault_queue_work(struct work_struct *w)
 	u64 cache_start = XE_PAGEFAULT_CACHE_START_INVALID, cache_end = 0;
 	u32 cache_asid = 0;
 
+	/*
+	 * A live VM holds a PM reference, but a torn-down VM does not.
+	 * Guard the entire worker loop to safely drain stale faults and
+	 * prevent autosuspends from desyncing batched CT flushes.
+	 */
+	guard(xe_pm_runtime)(xe);
+
 #define USM_QUEUE_MAX_RUNTIME_MS      20
 	threshold = jiffies + msecs_to_jiffies(USM_QUEUE_MAX_RUNTIME_MS);
 
-- 
2.43.0

