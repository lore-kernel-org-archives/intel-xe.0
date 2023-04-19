Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4A92C6FD18
	for <intel-xe@archiver.kernel.org>; Wed, 19 Apr 2023 08:35:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7701410E15B;
	Wed, 19 Apr 2023 08:35:50 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 817AE10E15B
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Apr 2023 08:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681893347; x=1713429347;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=s7I5frZCKEnbSyP1qWMoij1oY00Hcgt5NgaMsennpdw=;
 b=KIYrny819QxSXfU3hnKRVnR8w3XfVld6qbVswASPvmeI0YAiVQr6EKWo
 jtpJl04bBw/I/wLi0xZXh0yqmWb9QEVrKhZ9ZATO69THgA+jXtkPXzF88
 LlHDocj39y+6yGHCaqEc/qKqMsCNz3VFd9LFyqKs2P8jd5L3ygoBF72Fp
 NbVBvVA+gPk1fTMIZkbY18krcuKdSO4rY2BEA+U5CRnpOoqWQv5IgtJvd
 f4EenewNBmxwkGBvCa3EsJclASouBihZsWN9r6adnuRlRciYR+SZ3qYte
 JXffIO3WB56KlHfa2HUkmrzwMZN+oWktJvSJsJtiiBRFppEPmlMHk8qc1 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="325006498"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="325006498"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 01:35:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="723969000"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="723969000"
Received: from cbellini-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.8.207])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 01:35:45 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 19 Apr 2023 09:35:34 +0100
Message-Id: <20230419083534.221869-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2] drm/xe/tlb: fix expected_seqno calculation
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

v2 (José):
  - drm_WARN_ON() is preferred over plain WARN_ON(), since it gives
    information on the originating device.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/248
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
Reviewed-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index f279e21300aa..604f189dbd70 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -319,7 +319,12 @@ int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	/* Sanity check on seqno */
 	expected_seqno = (gt->tlb_invalidation.seqno_recv + 1) %
 		TLB_INVALIDATION_SEQNO_MAX;
-	XE_WARN_ON(expected_seqno != msg[0]);
+	if (!expected_seqno)
+		expected_seqno = 1;
+	if (drm_WARN_ON(&gt->xe->drm, expected_seqno != msg[0])) {
+		drm_err(&gt->xe->drm, "TLB expected_seqno(%d) != msg(%u)\n",
+			expected_seqno, msg[0]);
+	}
 
 	gt->tlb_invalidation.seqno_recv = msg[0];
 	smp_wmb();
-- 
2.39.2

