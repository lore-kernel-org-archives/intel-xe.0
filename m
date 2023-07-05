Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27383C0015E
	for <intel-xe@archiver.kernel.org>; Wed,  5 Jul 2023 16:08:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFBF710E3B3;
	Wed,  5 Jul 2023 16:08:29 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F51B10E3B1
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Jul 2023 16:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688573303; x=1720109303;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ie85PHAvWtfiYdsqkfy6/naSi6zlrfrsKCR8Gq6lrzo=;
 b=aG+3uRcVGJHICUEL09NN2YaLCV9i8MTECH6UcU3a2Mi8OHzqclT7QkXZ
 FDe004GlGksa1mNhVkrK4/Kkq39P52aj/PubvYKepFm9+5WdL4AcUMS4a
 +HR9UcxpCXf6ulnR103iWKUaudQ590phyKv6OtSxiH13ms2nraASR4q+o
 Slpm2c6SWff479htrfhiDOgHTxboAtJSPzAm0KkrusBbsWOLzsKVDuvbG
 owbWS2WaxFbyRgYp7c3UAA6UUgL3ONE50JGeX/tSqMoHTZv8HxnthPzAg
 2HS1pSwC9h53WMcRqclWxTTg8VBJBhbK65JleOXfljLksK8scRHeNPTyM w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="362248959"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; d="scan'208";a="362248959"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2023 09:06:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="965879899"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; d="scan'208";a="965879899"
Received: from peterhox-mobl2.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.10.156])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2023 09:06:47 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  5 Jul 2023 17:06:09 +0100
Message-ID: <20230705160602.237213-15-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230705160602.237213-9-matthew.auld@intel.com>
References: <20230705160602.237213-9-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 6/7] drm/xe/tlb: also update seqno_recv during
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
index b38da572d268..51789ec9ad57 100644
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

