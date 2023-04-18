Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC4BBC6FD18
	for <intel-xe@archiver.kernel.org>; Tue, 18 Apr 2023 13:27:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A159310E67A;
	Tue, 18 Apr 2023 13:27:57 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDE4810E67A
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Apr 2023 13:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681824476; x=1713360476;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WNItlsg1DiVlyIN/jBxuTtSfePrvGCqEiFKgmJAHIMg=;
 b=DQVCroLI0LRGsCJJBVn+NVvQ3NOkTZzKACR+zaFICxajTggsrb8Nzznt
 GyiATMRSDTlVNCSIXRybdn9l1EUf/EnC5Qx1S3+EpBd1DFm5vTtHWaNG2
 +k4O022BT613hASgvT7pqHCRNYb8YI/Nn1Z1O6HQaJaw7g/Xkuyc2b7GI
 NK8ECbmMQ1Zy/2e49ocq2aSbGOCvrYveL9WLvOmj3qD4asYhKHAOHeYNE
 lQHWDs1xnl76nADhW6kUh8JJYNifvZhTEaML1QXJRlspU6gDSUAsFeAMY
 +gxbfvlN6U1DL0pT0IClEcr4+3Lky1gpd7DRb0UhzpWzSvJa5m8ZgEHtl g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="347920797"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; d="scan'208";a="347920797"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2023 06:27:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="723628077"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; d="scan'208";a="723628077"
Received: from dsmit22x-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.8.147])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2023 06:27:54 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 18 Apr 2023 14:27:42 +0100
Message-Id: <20230418132742.141308-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/tlb: fix expected_seqno calculation
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

It looks like when tlb_invalidation.seqno overflows
TLB_INVALIDATION_SEQNO_MAX, we start counting again from one, as per
send_tlb_invalidation(). This is also inline with initial value we give
it in xe_gt_tlb_invalidation_init().  When calculating the
expected_seqno we should also take this into account.

While we are here also print out the values if we ever trigger the
warning.

References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/248
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index f279e21300aa..fdf092048287 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -319,7 +319,12 @@ int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	/* Sanity check on seqno */
 	expected_seqno = (gt->tlb_invalidation.seqno_recv + 1) %
 		TLB_INVALIDATION_SEQNO_MAX;
-	XE_WARN_ON(expected_seqno != msg[0]);
+	if (!expected_seqno)
+		expected_seqno = 1;
+	if (WARN_ON(expected_seqno != msg[0])) {
+		drm_err(&gt->xe->drm, "TLB expected_seqno(%d) != msg(%u)\n",
+			expected_seqno, msg[0]);
+	}
 
 	gt->tlb_invalidation.seqno_recv = msg[0];
 	smp_wmb();
-- 
2.39.2

