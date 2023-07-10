Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31A7DEB64DA
	for <intel-xe@archiver.kernel.org>; Mon, 10 Jul 2023 09:42:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10A9110E258;
	Mon, 10 Jul 2023 09:42:15 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D9BC10E256
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Jul 2023 09:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688982132; x=1720518132;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9vGUjxhQNbLwu0pJDe03MsJZ7wRe6OEHxTUSGC7nj9I=;
 b=kZXPDITvWufoVwFsI2rk5MkqmGZJzcyIkBng2vBuUJhSJ9kJ1dQdNNZU
 p23Gz06wKsOaWuJPPphxOqL28oayxjrGjtrlgfPVnThW//G4bTTNKlhLh
 wXDTODiaJRfM5dgaZLJQ0PNjYQhwbNPsOBF4ASZspQoWRtCytzKozlyHz
 udwTRTHxygPcwDK6MFBV6fSZfE6BDT9FSfWhTFpsUAG5p/4r8/QcGpu9T
 5jiDp4hgmwleqanl7tM+vMntRBzXBzRpJ4hHwm8neLjk1t2e7ywDhVfPN
 HdqUy05D/rSsfHDUeHPU70gi8Kb8DTzcGNgV2hDLNSYRfPv5eRERBpJmP w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="395081121"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="395081121"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2023 02:42:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="755940725"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="755940725"
Received: from congsip-mobl2.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.28.16])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2023 02:42:10 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 10 Jul 2023 10:40:46 +0100
Message-ID: <20230710094037.28179-21-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230710094037.28179-13-matthew.auld@intel.com>
References: <20230710094037.28179-13-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v6 08/11] drm/xe/tlb: also update seqno_recv
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

v2:
  - We need to use seqno - 1 here. After acquiring ct->lock the seqno is
    actually the next users seqno and not the pending one.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 24 +++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index de65b0b69679..be2388cb7205 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -86,13 +86,33 @@ invalidation_fence_signal(struct xe_gt_tlb_invalidation_fence *fence)
  *
  * Signal any pending invalidation fences, should be called during a GT reset
  */
- void xe_gt_tlb_invalidation_reset(struct xe_gt *gt)
+void xe_gt_tlb_invalidation_reset(struct xe_gt *gt)
 {
 	struct xe_gt_tlb_invalidation_fence *fence, *next;
+	struct xe_guc *guc = &gt->uc.guc;
+	int pending_seqno;
 
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
+	if (gt->tlb_invalidation.seqno == 1)
+		pending_seqno = TLB_INVALIDATION_SEQNO_MAX - 1;
+	else
+		pending_seqno = gt->tlb_invalidation.seqno - 1;
+	WRITE_ONCE(gt->tlb_invalidation.seqno_recv, pending_seqno);
+	wake_up_all(&guc->ct.wq);
 
-	mutex_lock(&gt->uc.guc.ct.lock);
 	list_for_each_entry_safe(fence, next,
 				 &gt->tlb_invalidation.pending_fences, link)
 		invalidation_fence_signal(fence);
-- 
2.41.0

