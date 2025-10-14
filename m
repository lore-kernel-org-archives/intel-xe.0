Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C383CCD184
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 03:39:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35A7D10E1A5;
	Tue, 14 Oct 2025 03:39:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TkzoIL1k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E4DE10E1A5
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 03:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760413146; x=1791949146;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=y2Gi1C/F+WFnMWsIdQWUP7A100PbJJznfI+UV7g5Tv8=;
 b=TkzoIL1kIGYnwJSz4tiDFk9hjD+iFC1/BnWSQAM8n3pwW4gwZq334GSs
 AiXU55IIoWONYToAdc3tzO0AUZn0NzNpxzohSkqvWe57xp/ldvAwtekqK
 GTHTnOBvakrXsVITeo18YS1EOdyIHGwHxXUmUlP0ywu1tykMTie9FTbd+
 No9wz8gbHsHbmJ5k63G/176s+1fGUkk8srz29kJgcUBYQxNL9h1wr3oDr
 i9+N0Z0sUwJvP6ObAeEq7h4NC8eOijKdBFKbCax4mp1cl9xux8bFjhBae
 CyQjOCaovEGuaOu7vBI2ai/8iUHsBXcLSzIPUGYvqXTAGfVi5NIHv4S+Y A==;
X-CSE-ConnectionGUID: BB++betYQGO96lrpjMtTSw==
X-CSE-MsgGUID: ezhTw2PiQYG5GoQPc6f8Qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="80004753"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="80004753"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 20:39:06 -0700
X-CSE-ConnectionGUID: JHXkHfa9T66xvF2d7EN+tA==
X-CSE-MsgGUID: A4Edb+WESAmA7Y3Hv4BPOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="180923170"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by orviesa006.jf.intel.com with ESMTP; 13 Oct 2025 20:39:05 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe/guc: Destroy LR exec queue directly if GuC is not
 running
Date: Tue, 14 Oct 2025 03:36:47 +0000
Message-ID: <20251014033646.1619865-2-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.49.0
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

During LR exec queue cleanup, if the GuC firmware is not running,
the driver cannot communicate with the GuC to properly deregister
the exec queue. In this case, directly destroy the exec queue
instead of attempting deregistration.

This prevents schedule disable failure and GuC ID resource leaks as
below dmesg log:
"
[   50.242564] pci 0000:03:00.0: [drm] GT0: Schedule disable failed to respond, guc_id=2
[   50.242568] ------------[ cut here ]------------
[   50.242584] pci 0000:03:00.0: [drm] Assertion `ret` failed!
...
[   50.244942] pci 0000:03:00.0: [drm] *ERROR* GT0: GUC ID manager unclean (1/65535)
[   50.244970] pci 0000:03:00.0: [drm] GT0:     total 65535
[   50.245002] pci 0000:03:00.0: [drm] GT0:     used 1
[   50.245032] pci 0000:03:00.0: [drm] GT0:     range 2..2 (1)
"

Fixes: 8ae8a2e8dd21 ("drm/xe: Long running job update")
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 0ef67d3523a7..d2dfbdc82920 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -47,6 +47,8 @@
 #include "xe_uc_fw.h"
 #include "xe_vm.h"
 
+static void __guc_exec_queue_destroy(struct xe_guc *guc, struct xe_exec_queue *q);
+
 static struct xe_guc *
 exec_queue_to_guc(struct xe_exec_queue *q)
 {
@@ -1060,10 +1062,15 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
 	 * state.
 	 */
 	if (!wedged && exec_queue_registered(q) && !exec_queue_destroyed(q)) {
-		struct xe_guc *guc = exec_queue_to_guc(q);
 		int ret;
 
 		set_exec_queue_banned(q);
+		/* If GuC is not running, just destroy the exec queue as we can't communicate with it */
+		if (!xe_uc_fw_is_running(&guc->fw)) {
+			__guc_exec_queue_destroy(guc, q);
+			goto skip_deregister;
+		}
+
 		disable_scheduling_deregister(guc, q);
 
 		/*
@@ -1088,6 +1095,7 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
 		}
 	}
 
+skip_deregister:
 	if (!exec_queue_killed(q) && !xe_lrc_ring_is_idle(q->lrc[0]))
 		xe_devcoredump(q, NULL, "LR job cleanup, guc_id=%d", q->guc->id);
 
-- 
2.49.0

