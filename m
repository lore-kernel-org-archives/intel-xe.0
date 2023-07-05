Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71AD8C0015E
	for <intel-xe@archiver.kernel.org>; Wed,  5 Jul 2023 16:08:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4477310E3AB;
	Wed,  5 Jul 2023 16:08:26 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC86210E3AD
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Jul 2023 16:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688573302; x=1720109302;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=N8ezVIUynRmINQKguFzwjMAG4w4yiY0VARSikZpbVUM=;
 b=E/7yW5A40TVThZqXRqmB1Ld4yJP/SMNlvFTkuSWo2+J5AEnpms3D9XzX
 +lfbEDCp0Xqv9fCsUdQVIjvaYwePp5Yp8waEgXPwJrWJ97j2JP3xZgIxQ
 B8MtY5rI8/l8LnK4HodWEox4MFmWGBKe6Zc9meqd4Hndj0Jh/froK/AYN
 fDKscrx1LE2k2uRaHG9AddsARyWUA2gcRmTAOmXcY1dR+3sZkzZhfHe7D
 1Upey/Fa0oNGFB2QfVoUcKqtfYy8i50H7O2C5lT9Fn1luSR2CQH9RaHvV
 ntJAtGy/lUv+MBth12gpWHwmPvw3fiVI0xfiXNU0G+XGjdLwvOgPVPgIY A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="362248948"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; d="scan'208";a="362248948"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2023 09:06:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="965879880"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; d="scan'208";a="965879880"
Received: from peterhox-mobl2.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.10.156])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2023 09:06:43 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  5 Jul 2023 17:06:06 +0100
Message-ID: <20230705160602.237213-12-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230705160602.237213-9-matthew.auld@intel.com>
References: <20230705160602.237213-9-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 3/7] drm/xe/tlb: increment next seqno after
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
---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index 2fcb477604e2..b38da572d268 100644
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

