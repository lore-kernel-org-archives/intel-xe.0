Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98525C001B1
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jul 2023 13:46:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C0CF10E19B;
	Tue,  4 Jul 2023 13:46:20 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBCC310E135
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Jul 2023 13:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688478378; x=1720014378;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d99pb4tdx2WWi31K+wJ9qZfWjFtoB7U16Gk3SpjMUWE=;
 b=CRbIEH+TkzAvopdfvP8bGFiUhIEZrdnu6kTfJWv7xROPwohXuaGvXZp0
 apcB6FKBzDq6x0MKifRfbnFGDuq/cFYpNwdV3VW1uyz3Yxh6tmnXzhLyZ
 FhGuP1/kRTPfFLc/a+cuF0U8z5HOLu88G8OZ3sgqosSTDUO3LjQo27Esb
 J10fFdLHdMZr4gtFlote3velxbtufVg2BNnQVCsj88JFko6VRsCu+hMDt
 tZpPAt4YDwAz14r7ZtuF7yXGKmbkAYoiI+zDQs0ng0ZCRLc0kUz/3mFWN
 Rd2xvzVhFwjx9w2llz3cLr3idRWGMv8dZH9L6dssFCqv087igWpNpedGD A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="361989288"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="361989288"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2023 06:46:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="712888723"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="712888723"
Received: from izharayx-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.26.56])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2023 06:46:17 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  4 Jul 2023 14:45:29 +0100
Message-ID: <20230704134524.138377-11-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230704134524.138377-7-matthew.auld@intel.com>
References: <20230704134524.138377-7-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 4/5] drm/xe/tlb: also update seqno_recv during
 reset
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
---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index 2fcb477604e2..a8f3b1b76fc5 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -89,10 +89,26 @@ invalidation_fence_signal(struct xe_gt_tlb_invalidation_fence *fence)
  void xe_gt_tlb_invalidation_reset(struct xe_gt *gt)
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
+	gt->tlb_invalidation.seqno_recv = gt->tlb_invalidation.seqno;
+	smp_wmb();
+	wake_up_all(&guc->ct.wq);
 
-	mutex_lock(&gt->uc.guc.ct.lock);
 	list_for_each_entry_safe(fence, next,
 				 &gt->tlb_invalidation.pending_fences, link)
 		invalidation_fence_signal(fence);
-- 
2.41.0

