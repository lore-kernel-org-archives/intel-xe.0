Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C668C4345F
	for <intel-xe@archiver.kernel.org>; Thu, 25 Apr 2024 05:47:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABB1211A159;
	Thu, 25 Apr 2024 05:47:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oi3L5b5x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68ACC11A158
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Apr 2024 05:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714024036; x=1745560036;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GsVxkfhG/q2N+B9JluMt8fgh//i7pzekGO9PBDEdLsU=;
 b=Oi3L5b5xaS9L23refDV59g9dlFToVDkDkYnYhrfQL4vw1kB7PylCAG4p
 igaMViFc9WQX+A7ztcu/Z2r5cS2x5gQMFrjsAr2Z9fyiTw0eZg934+pex
 dXrcwzx4CJwh+gtmzlq+rVFxPx49Y/gvqhhMNyqLTCKmBt363IZJrJYzL
 TSL/4FoBHNR9If0RKj0+qQwxzeQwLAxDczHGF/9U4Qrfvuw/ppdFm2jCl
 GqVrkgWcKuCPL3tRLcG6izvoQzmQWWP1S/rtXNyl7q3l47ypWyeGbsEWo
 g0cW7WrGkh+qbY5vF4hb9rJjPv0enPnBhPUrBKipLzXpyNu+2IqY3Y2RF g==;
X-CSE-ConnectionGUID: vtEebweJRDSS1RstknjYPQ==
X-CSE-MsgGUID: hL4cX147S/SyYakZo9N/Qg==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="9799089"
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; 
   d="scan'208";a="9799089"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 22:47:16 -0700
X-CSE-ConnectionGUID: IVOaNCZqRfOGHvzU77b79g==
X-CSE-MsgGUID: ZEidmrsDTTymh71N/KCiWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; d="scan'208";a="29741013"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 22:47:15 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe: Delete unused GuC submission_state.suspend
Date: Wed, 24 Apr 2024 22:47:47 -0700
Message-Id: <20240425054747.1918811-1-matthew.brost@intel.com>
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

GuC submission_state.suspend is unused, delete it.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 4 ----
 drivers/gpu/drm/xe/xe_guc_types.h  | 9 ---------
 2 files changed, 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index c7d38469fb46..4e78610d1591 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -250,7 +250,6 @@ static void primelockdep(struct xe_guc *guc)
 	fs_reclaim_acquire(GFP_KERNEL);
 
 	mutex_lock(&guc->submission_state.lock);
-	might_lock(&guc->submission_state.suspend.lock);
 	mutex_unlock(&guc->submission_state.lock);
 
 	fs_reclaim_release(GFP_KERNEL);
@@ -278,9 +277,6 @@ int xe_guc_submit_init(struct xe_guc *guc)
 
 	xa_init(&guc->submission_state.exec_queue_lookup);
 
-	spin_lock_init(&guc->submission_state.suspend.lock);
-	guc->submission_state.suspend.context = dma_fence_context_alloc(1);
-
 	primelockdep(guc);
 
 	return drmm_add_action_or_reset(&xe->drm, guc_submit_fini, guc);
diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
index 82bd93f7867d..546ac6350a31 100644
--- a/drivers/gpu/drm/xe/xe_guc_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_types.h
@@ -72,15 +72,6 @@ struct xe_guc {
 		atomic_t stopped;
 		/** @submission_state.lock: protects submission state */
 		struct mutex lock;
-		/** @submission_state.suspend: suspend fence state */
-		struct {
-			/** @submission_state.suspend.lock: suspend fences lock */
-			spinlock_t lock;
-			/** @submission_state.suspend.context: suspend fences context */
-			u64 context;
-			/** @submission_state.suspend.seqno: suspend fences seqno */
-			u32 seqno;
-		} suspend;
 #ifdef CONFIG_PROVE_LOCKING
 #define NUM_SUBMIT_WQ	256
 		/** @submission_state.submit_wq_pool: submission ordered workqueues pool */
-- 
2.34.1

