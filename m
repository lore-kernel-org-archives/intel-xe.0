Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 647CDC369BA
	for <intel-xe@archiver.kernel.org>; Wed, 16 Apr 2025 18:30:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13BD810E990;
	Wed, 16 Apr 2025 18:30:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g0SDC/FI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4782910E990
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Apr 2025 18:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744828242; x=1776364242;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7hPLZe3gMEgBy+yZ5xvj7cMWGo/4N02wYAXO5N7IHkU=;
 b=g0SDC/FIGvZGSCGI/Zy1a4pt++0drcyr9zzA0a2Wzh9QsNOuIeMcub2C
 33zZtw6NBc97cKhVxZwzkJqIQZeCbCDY+h4jYsb0PNyp/m0IeqfP566Cq
 1pQnyE9zUnw0UWUb7WPcXQ6Lv4GX2UrkXfNyyIvy9yB3GZYF/9FQ1fSjr
 GctL+7suxG2njasxnracdaSsqVqWXrgpTXBoIZV64qg/3a2LLkJSa8YaN
 EpE7vRx3+Hs/dU1KRqax6OXDlwD9MKhpb0scpyH/gi4yE1A3BxxEQ+YsM
 /cmtKNXDUyX8ISSrSPuBpzb1gnNKOfbHcgY4i3sCsBLwH3DK7QUjakAEc w==;
X-CSE-ConnectionGUID: KCM56Zp4TmuN9ioFJY22/A==
X-CSE-MsgGUID: uRwBhO0QTraFtKNGF75Aiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="46560373"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; d="scan'208";a="46560373"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 11:30:40 -0700
X-CSE-ConnectionGUID: +yJTZqTASKG2fkjdilz+UQ==
X-CSE-MsgGUID: APJ4xUY1RTiVqb+1N7ZpRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; d="scan'208";a="135374574"
Received: from dut136arlu.fm.intel.com ([10.105.23.68])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 11:30:39 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: stuart.summers@intel.com, matthew.brost@intel.com,
 lucas.demarchi@intel.com, nirmoy.das@linux.intel.com,
 intel-xe@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH 1/2] drm/xe:
 s/tlb_invalidation.lock/tlb_invalidation.fence_lock
Date: Wed, 16 Apr 2025 18:30:31 +0000
Message-Id: <20250416183032.70948-1-stuart.summers@intel.com>
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

From: Matthew Brost <matthew.brost@intel.com>

tlb_invalidation.lock is the lock for GT TLB invalidation fences, name
this accurately.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 8 ++++----
 drivers/gpu/drm/xe/xe_gt_types.h            | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index 084cbdeba8ea..031c4d43f36b 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -119,7 +119,7 @@ int xe_gt_tlb_invalidation_init_early(struct xe_gt *gt)
 	gt->tlb_invalidation.seqno = 1;
 	INIT_LIST_HEAD(&gt->tlb_invalidation.pending_fences);
 	spin_lock_init(&gt->tlb_invalidation.pending_lock);
-	spin_lock_init(&gt->tlb_invalidation.lock);
+	spin_lock_init(&gt->tlb_invalidation.fence_lock);
 	INIT_DELAYED_WORK(&gt->tlb_invalidation.fence_tdr,
 			  xe_gt_tlb_fence_timeout);
 
@@ -564,11 +564,11 @@ void xe_gt_tlb_invalidation_fence_init(struct xe_gt *gt,
 {
 	xe_pm_runtime_get_noresume(gt_to_xe(gt));
 
-	spin_lock_irq(&gt->tlb_invalidation.lock);
+	spin_lock_irq(&gt->tlb_invalidation.fence_lock);
 	dma_fence_init(&fence->base, &invalidation_fence_ops,
-		       &gt->tlb_invalidation.lock,
+		       &gt->tlb_invalidation.fence_lock,
 		       dma_fence_context_alloc(1), 1);
-	spin_unlock_irq(&gt->tlb_invalidation.lock);
+	spin_unlock_irq(&gt->tlb_invalidation.fence_lock);
 	INIT_LIST_HEAD(&fence->link);
 	if (stack)
 		set_bit(FENCE_STACK_BIT, &fence->base.flags);
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 7def0959da35..be81687cbe2b 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -210,8 +210,8 @@ struct xe_gt {
 		 * xe_gt_tlb_fence_timeout after the timeut interval is over.
 		 */
 		struct delayed_work fence_tdr;
-		/** @tlb_invalidation.lock: protects TLB invalidation fences */
-		spinlock_t lock;
+		/** @tlb_invalidation.fence_lock: protects TLB invalidation fences */
+		spinlock_t fence_lock;
 	} tlb_invalidation;
 
 	/**
-- 
2.34.1

