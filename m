Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A7F5CD11DF
	for <intel-xe@archiver.kernel.org>; Wed, 27 Mar 2024 09:12:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A338F10F984;
	Wed, 27 Mar 2024 09:12:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S4kkJzQu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04ADB10F97E
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Mar 2024 09:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711530719; x=1743066719;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KFFikPLf+TvuIa/9gFL391p1cP7wCIWqpENerP4ljqU=;
 b=S4kkJzQupaPKdww8U9jvep7CNNBTp44YoAjSeBrFszoiUaS72WTAwPHc
 vKnBZMInN26w76gwfPt1Hkrkx7H3AIxozlRkjptY+kbGg7QPFqIBo4lUG
 /Yf3o0DGFkdg5ilKFI66IUErIBnaV2m6mUhBv9VRMJ0WMeK3CvbcgdT37
 LcYkz0JBb+wdDGtNw0HKKFvHda8B5HZCyfg89rU5y2pf+Xa2oiazNp5q1
 N3rPoa8ryGNTB6GQsFZf5NVgxrcBpEbkmMc32bTFqy/GibYJ3cGc7eg/M
 olWnNFchfTz+FsEHZHaHq0lFN6+bCmGHaEtLQpK+BK47fU2lgaGqZE9Tl A==;
X-CSE-ConnectionGUID: MsmhMWG6TVyMxfF/G0bmIQ==
X-CSE-MsgGUID: V8xFrgkEQcKGqf7zTy/MkA==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="29097877"
X-IronPort-AV: E=Sophos;i="6.07,158,1708416000"; d="scan'208";a="29097877"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 02:11:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,158,1708416000"; d="scan'208";a="16615122"
Received: from ktonsber-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.184])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 02:11:57 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>, stable@vger.kernel.org
Subject: [PATCH v3 3/4] drm/xe: Make TLB invalidation fences unordered
Date: Wed, 27 Mar 2024 10:11:35 +0100
Message-ID: <20240327091136.3271-4-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240327091136.3271-1-thomas.hellstrom@linux.intel.com>
References: <20240327091136.3271-1-thomas.hellstrom@linux.intel.com>
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

They can actually complete out-of-order, so allocate a unique
fence context for each fence.

Fixes: 5387e865d90e ("drm/xe: Add TLB invalidation fence after rebinds issued from execs")
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: <stable@vger.kernel.org> # v6.8+
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 1 -
 drivers/gpu/drm/xe/xe_gt_types.h            | 7 -------
 drivers/gpu/drm/xe/xe_pt.c                  | 3 +--
 3 files changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index 25b4111097bc..93df2d7969b3 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -63,7 +63,6 @@ int xe_gt_tlb_invalidation_init(struct xe_gt *gt)
 	INIT_LIST_HEAD(&gt->tlb_invalidation.pending_fences);
 	spin_lock_init(&gt->tlb_invalidation.pending_lock);
 	spin_lock_init(&gt->tlb_invalidation.lock);
-	gt->tlb_invalidation.fence_context = dma_fence_context_alloc(1);
 	INIT_DELAYED_WORK(&gt->tlb_invalidation.fence_tdr,
 			  xe_gt_tlb_fence_timeout);
 
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index f6da2ad9719f..2143dffcaf11 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -179,13 +179,6 @@ struct xe_gt {
 		 * xe_gt_tlb_fence_timeout after the timeut interval is over.
 		 */
 		struct delayed_work fence_tdr;
-		/** @tlb_invalidation.fence_context: context for TLB invalidation fences */
-		u64 fence_context;
-		/**
-		 * @tlb_invalidation.fence_seqno: seqno to TLB invalidation fences, protected by
-		 * tlb_invalidation.lock
-		 */
-		u32 fence_seqno;
 		/** @tlb_invalidation.lock: protects TLB invalidation fences */
 		spinlock_t lock;
 	} tlb_invalidation;
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 632c1919471d..d1b999dbc906 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1135,8 +1135,7 @@ static int invalidation_fence_init(struct xe_gt *gt,
 	spin_lock_irq(&gt->tlb_invalidation.lock);
 	dma_fence_init(&ifence->base.base, &invalidation_fence_ops,
 		       &gt->tlb_invalidation.lock,
-		       gt->tlb_invalidation.fence_context,
-		       ++gt->tlb_invalidation.fence_seqno);
+		       dma_fence_context_alloc(1), 1);
 	spin_unlock_irq(&gt->tlb_invalidation.lock);
 
 	INIT_LIST_HEAD(&ifence->base.link);
-- 
2.44.0

