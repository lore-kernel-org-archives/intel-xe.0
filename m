Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36137E9A03B
	for <intel-xe@archiver.kernel.org>; Thu, 19 Feb 2026 01:45:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB27F10E64B;
	Thu, 19 Feb 2026 01:45:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GCpwjARM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4491310E64B
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Feb 2026 01:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771465539; x=1803001539;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3n1e64On+OVCXKTpaVTbI9jYVaOqiPK9j8iihGVh6G4=;
 b=GCpwjARMj1ZlB1Qo5FHirhdyrLjG+cImAk4H+03Mb+SQjScBDiWKbU+Y
 9sdHz4sTCwd1OLXnl05wYMLd/huuejIlnyvnw+jQcm1avC+XfpQinrPoO
 Z6xRollUtiPdHDg7AcrlxOMCZtx0A37+uNFAcKFPswmy1SHxFCkBdzAsy
 8pREfC3CQ5iAKwm1r3x+vjbtwSdxrCbPiomklZdbJPla5plcctXGCAW30
 lq04CJLh6p9/0H/xwVYrHqism+L+1FVoQJuyqv5yAX5wAG9JdAm2JpOZT
 0gheyOC8Maq06znNjyIJtbh9QFUmxPjaKFwUXAxXVdpMg0/Q13M0ejwbE A==;
X-CSE-ConnectionGUID: l1jKxB2ZQHGl/S3YW2WKVQ==
X-CSE-MsgGUID: 7ToMl3XfSoKLTUWQjXS4YA==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="72592725"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="72592725"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 17:45:38 -0800
X-CSE-ConnectionGUID: qW3p2lBsTbuJm9sgdEC/Eg==
X-CSE-MsgGUID: n+N8kIqCTP20OiJ1+FpEsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="212660357"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by fmviesa006.fm.intel.com with ESMTP; 18 Feb 2026 17:45:37 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe/sync: Fix user fence leak on alloc failure
Date: Thu, 19 Feb 2026 01:42:17 +0000
Message-ID: <20260219014216.2893391-2-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.50.1
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

When dma_fence_chain_alloc() fails, properly release the user fence
reference to prevent a memory leak.

The error cleanup path in callers (xe_exec.c, xe_oa.c, xe_vm.c) uses a
while loop that cleans up syncs from index 0 to num_syncs-1. The failed
sync at the current index num_syncs is not covered by this loop, so the
local user_fence_put() is necessary to prevent a leak.
Set sync->ufence = NULL after the user_fence_put() call to avoid if the
caller later calls xe_sync_entry_cleanup() on the failed sync, it will
trigger another user_fence_put() on the already-freed memory, causing
a use-after-free bug.

Also remove extra whitespace in function call and comment.

Fixes: adda4e855ab6 ("drm/xe: Enforce correct user fence signaling order using")
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_sync.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index c8fdcdbd6ae7..c5f71067fcd2 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -200,8 +200,11 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
 			if (XE_IOCTL_DBG(xe, IS_ERR(sync->ufence)))
 				return PTR_ERR(sync->ufence);
 			sync->ufence_chain_fence = dma_fence_chain_alloc();
-			if (!sync->ufence_chain_fence)
+			if (!sync->ufence_chain_fence) {
+				user_fence_put(sync->ufence);
+				sync->ufence = NULL;
 				return -ENOMEM;
+			}
 			sync->ufence_syncobj = ufence_syncobj;
 		}
 
@@ -222,7 +225,7 @@ ALLOW_ERROR_INJECTION(xe_sync_entry_parse, ERRNO);
 int xe_sync_entry_add_deps(struct xe_sync_entry *sync, struct xe_sched_job *job)
 {
 	if (sync->fence)
-		return  drm_sched_job_add_dependency(&job->drm,
+		return drm_sched_job_add_dependency(&job->drm,
 						     dma_fence_get(sync->fence));
 
 	return 0;
@@ -311,7 +314,7 @@ void xe_sync_entry_cleanup(struct xe_sync_entry *sync)
  *
  * Get a fence from syncs, exec queue, and VM. If syncs contain in-fences create
  * and return a composite fence of all in-fences + last fence. If no in-fences
- * return last fence on  input exec queue. Caller must drop reference to
+ * return last fence on input exec queue. Caller must drop reference to
  * returned fence.
  *
  * Return: fence on success, ERR_PTR(-ENOMEM) on failure
-- 
2.50.1

