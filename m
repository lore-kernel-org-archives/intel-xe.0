Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C567EB64DD
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jul 2023 16:20:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 266AF10E480;
	Thu,  6 Jul 2023 16:20:59 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 092C810E480
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jul 2023 16:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688660458; x=1720196458;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1UZKK2X0jq/dGbDPLOWBex8Wip2xVXNX99R9kMCSjKE=;
 b=mOvtAlRzPfu9x3dGUElJEHPVaxCEPF5wxtiIP8hE6i4Ye6h7RlYqwWg8
 SM6FaqzRNZxUSJtmH6259ryV2J/vY/8lup+oGfheiANQjkMD/8OnFe9wk
 twCoofspHqhFWRpD1qm+qn8UebhWiezcVGkvGzk9BaZMe/+4xGhm4Hz1D
 2xHQDemeX+yyeykvCqMk42f/wuknLTcjYyiNHwrTR6KzG4xaIlOassTO0
 ewDJhVrzi2DG31ENz4Z7rPWdWJKh86embeC1Yiw0X/gIePJGsDUc2Ft7q
 TW5Uz+fRM69KMbXaz/NijBB2MgKUNFg8x1Bzo5GhsEHfxwgXh0b13pXAD g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="394409339"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="394409339"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2023 09:20:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="722849997"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="722849997"
Received: from fmahon-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.26.229])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2023 09:20:56 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  6 Jul 2023 17:20:12 +0100
Message-ID: <20230706162003.427026-20-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230706162003.427026-12-matthew.auld@intel.com>
References: <20230706162003.427026-12-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 08/10] drm/xe/tlb: also update seqno_recv
 during reset
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

We might have various kworkers waiting for TLB flushes to complete which
are not tracked with an explicit TLB fence, however at this stage that
will never happen since the CT is already disabled, so make sure we
signal them here under the assumption that we have completed a full GT
reset.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index de65b0b69679..e1906ec7c8be 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -86,13 +86,28 @@ invalidation_fence_signal(struct xe_gt_tlb_invalidation_fence *fence)
  *
  * Signal any pending invalidation fences, should be called during a GT reset
  */
- void xe_gt_tlb_invalidation_reset(struct xe_gt *gt)
+void xe_gt_tlb_invalidation_reset(struct xe_gt *gt)
 {
 	struct xe_gt_tlb_invalidation_fence *fence, *next;
+	struct xe_guc *guc = &gt->uc.guc;
 
+	/*
+	 * CT channel is already disabled at this point. No new TLB requests can
+	 * appear.
+	 */
+
+	mutex_lock(&gt->uc.guc.ct.lock);
 	cancel_delayed_work(&gt->tlb_invalidation.fence_tdr);
+	/*
+	 * We might have various kworkers waiting for TLB flushes to complete
+	 * which are not tracked with an explicit TLB fence, however at this
+	 * stage that will never happen since the CT is already disabled, so
+	 * make sure we signal them here under the assumption that we have
+	 * completed a full GT reset.
+	 */
+	WRITE_ONCE(gt->tlb_invalidation.seqno_recv, gt->tlb_invalidation.seqno);
+	wake_up_all(&guc->ct.wq);
 
-	mutex_lock(&gt->uc.guc.ct.lock);
 	list_for_each_entry_safe(fence, next,
 				 &gt->tlb_invalidation.pending_fences, link)
 		invalidation_fence_signal(fence);
-- 
2.41.0

