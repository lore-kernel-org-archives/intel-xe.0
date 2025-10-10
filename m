Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1194BCCA476
	for <intel-xe@archiver.kernel.org>; Fri, 10 Oct 2025 17:29:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2A0C10E106;
	Fri, 10 Oct 2025 17:29:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NOSAU0jz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6D4310E106
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Oct 2025 17:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760117370; x=1791653370;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Au/iyKRlqHeL0jdUTjwTn/ekKEvphBu7CGAfQkyw8Vs=;
 b=NOSAU0jzV9YGcLHQ1UOxKYJt3KNHln/3BHO3mWzrVCBJnN5UzZk6CvuC
 76hpXyzhOYv1toir3r8V9X0vy5XGEC/XeDIJ49GZc0W/87IyzGDRLg2kQ
 +53HfqCLamgAoFytJFs3jJFlU2G/ztTdq//3nM76p5dSwXiZ2kOF6ESyP
 mfdxF535E2L5jM4hdWkl/Qvx0/ysoSKUelzxkVS3QzMiewTFnqEJxcVoP
 5eiQVjWnjcFxoXgmS9t2moo1zGv/fR+reciM5B2qGrTDu90iVD2MOnYdC
 86/gyif0ZakP0QiFE/RhH0sHor9XG7AgmdTruA63ZmVz5tC6f8zJhqV3h Q==;
X-CSE-ConnectionGUID: FqzDsoXCQDur+puSxS1jXg==
X-CSE-MsgGUID: mxiRJDkrQuy0mVkEsNWcRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11578"; a="62496029"
X-IronPort-AV: E=Sophos;i="6.19,219,1754982000"; d="scan'208";a="62496029"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 10:29:30 -0700
X-CSE-ConnectionGUID: QP/Oz3pYQm+6O9TPIDJWUQ==
X-CSE-MsgGUID: z0rzCT9rQMmOrtHo5fxebQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,219,1754982000"; d="scan'208";a="181454182"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by fmviesa008.fm.intel.com with ESMTP; 10 Oct 2025 10:29:18 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: lucas.demarchi@intel.com, matthew.auld@intel.com,
 michal.wajdeczko@intel.com, Shuicheng Lin <shuicheng.lin@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2] drm/xe/guc: Check GuC running state before deregistering
 exec queue
Date: Fri, 10 Oct 2025 17:25:29 +0000
Message-ID: <20251010172529.2967639-2-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251004173033.2511250-2-shuicheng.lin@intel.com>
References: <20251004173033.2511250-2-shuicheng.lin@intel.com>
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

In normal operation, a registered exec queue is disabled and
deregistered through the GuC, and freed only after the GuC confirms
completion. However, if the driver is forced to unbind while the exec
queue is still running, the user may call exec_destroy() after the GuC
has already been stopped and CT communication disabled.

In this case, the driver cannot receive a response from the GuC,
preventing proper cleanup of exec queue resources. Fix this by directly
releasing the resources when GuC is not running.

Here is the failure dmesg log:
"
[  468.089581] ---[ end trace 0000000000000000 ]---
[  468.089608] pci 0000:03:00.0: [drm] *ERROR* GT0: GUC ID manager unclean (1/65535)
[  468.090558] pci 0000:03:00.0: [drm] GT0:     total 65535
[  468.090562] pci 0000:03:00.0: [drm] GT0:     used 1
[  468.090564] pci 0000:03:00.0: [drm] GT0:     range 1..1 (1)
[  468.092716] ------------[ cut here ]------------
[  468.092719] WARNING: CPU: 14 PID: 4775 at drivers/gpu/drm/xe/xe_ttm_vram_mgr.c:298 ttm_vram_mgr_fini+0xf8/0x130 [xe]
"

v2: use xe_uc_fw_is_running() instead of xe_guc_ct_enabled().
    As CT may go down and come back during VF migration.

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index e9aa0625ce60..0ef67d3523a7 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -44,6 +44,7 @@
 #include "xe_ring_ops_types.h"
 #include "xe_sched_job.h"
 #include "xe_trace.h"
+#include "xe_uc_fw.h"
 #include "xe_vm.h"
 
 static struct xe_guc *
@@ -1501,7 +1502,17 @@ static void __guc_exec_queue_process_msg_cleanup(struct xe_sched_msg *msg)
 	xe_gt_assert(guc_to_gt(guc), !(q->flags & EXEC_QUEUE_FLAG_PERMANENT));
 	trace_xe_exec_queue_cleanup_entity(q);
 
-	if (exec_queue_registered(q))
+	/*
+	 * Expected state transitions for cleanup:
+	 * - If the exec queue is registered and GuC firmware is running, we must first
+	 *   disable scheduling and deregister the queue to ensure proper teardown and
+	 *   resource release in the GuC, then destroy the exec queue on driver side.
+	 * - If the GuC is already stopped (e.g., during driver unload or GPU reset),
+	 *   we cannot expect a response for the deregister request. In this case,
+	 *   it is safe to directly destroy the exec queue on driver side, as the GuC
+	 *   will not process further requests and all resources must be cleaned up locally.
+	 */
+	if (exec_queue_registered(q) && xe_uc_fw_is_running(&guc->fw))
 		disable_scheduling_deregister(guc, q);
 	else
 		__guc_exec_queue_destroy(guc, q);
-- 
2.49.0

