Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A68DEB64D9
	for <intel-xe@archiver.kernel.org>; Mon, 10 Jul 2023 09:42:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF44110E251;
	Mon, 10 Jul 2023 09:42:09 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6F1D10E251
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Jul 2023 09:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688982127; x=1720518127;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hjrEL6gPZ3WoBAVn33RogJ3+KgCtFGDUEh1y5XzMjfY=;
 b=KIhlruV4swxgFugTF0XOe9lrBWEtNxN50FKmKvOzB3Csk5p1fenpthgY
 3cgpovG0aL7jCkpaH6vGhoQcZR92Vh+Z0Dj+oWrme092sL8wlfGENuHlB
 HV6dFI/g/geXi8AKi/nDQ/gjAWAu+5TdIby5LA2GJRqpA/268G0BEsptk
 Keuls9rbc4O19XslirANjElLgqlm00vjYnQlnD0kVLc8BNe7QZVEZfAfK
 /gPQJDdjXSNw05Cp77v4uF1E5pmAdECejtBZuQ2Ll78yIEk6/nyomXp8n
 0gld75eIS7l6wG4aQsYyZsNgAWyvhQRdb9dpQtMWr/kY6aRsSOKkDzkM6 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="395081112"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="395081112"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2023 02:42:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="755940699"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="755940699"
Received: from congsip-mobl2.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.28.16])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2023 02:42:06 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 10 Jul 2023 10:40:43 +0100
Message-ID: <20230710094037.28179-18-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230710094037.28179-13-matthew.auld@intel.com>
References: <20230710094037.28179-13-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v6 05/11] drm/xe/tlb: increment next seqno after
 successful CT send
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

If we are in the middle of a GT reset or similar the CT might be
disabled, such that the CT send fails. However we already incremented
gt->tlb_invalidation.seqno which might lead to warnings, since we
effectively just skipped a seqno:

    0000:00:02.0: drm_WARN_ON(expected_seqno != msg[0])

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index c67abc67d9fc..de65b0b69679 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -124,10 +124,6 @@ static int send_tlb_invalidation(struct xe_guc *guc,
 		trace_xe_gt_tlb_invalidation_fence_send(fence);
 	}
 	action[1] = seqno;
-	gt->tlb_invalidation.seqno = (gt->tlb_invalidation.seqno + 1) %
-		TLB_INVALIDATION_SEQNO_MAX;
-	if (!gt->tlb_invalidation.seqno)
-		gt->tlb_invalidation.seqno = 1;
 	ret = xe_guc_ct_send_locked(&guc->ct, action, len,
 				    G2H_LEN_DW_TLB_INVALIDATE, 1);
 	if (!ret && fence) {
@@ -137,8 +133,13 @@ static int send_tlb_invalidation(struct xe_guc *guc,
 					   &gt->tlb_invalidation.fence_tdr,
 					   TLB_TIMEOUT);
 	}
-	if (!ret)
+	if (!ret) {
+		gt->tlb_invalidation.seqno = (gt->tlb_invalidation.seqno + 1) %
+			TLB_INVALIDATION_SEQNO_MAX;
+		if (!gt->tlb_invalidation.seqno)
+			gt->tlb_invalidation.seqno = 1;
 		ret = seqno;
+	}
 	if (ret < 0 && fence)
 		invalidation_fence_signal(fence);
 	mutex_unlock(&guc->ct.lock);
-- 
2.41.0

