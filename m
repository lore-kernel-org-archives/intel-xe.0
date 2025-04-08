Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2832FC369A2
	for <intel-xe@archiver.kernel.org>; Tue,  8 Apr 2025 15:58:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1421210E247;
	Tue,  8 Apr 2025 15:58:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HQ5XqBYz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16C1A10E259
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Apr 2025 15:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744127883; x=1775663883;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yem9ZInABXuMIzCKAsBnmIaj98NT3dS1F4hH1f9CwfE=;
 b=HQ5XqBYzLvidkzgR22OZIxYdMbBXrB8Hrrj4sF9WXtfowk28fh/Fy8y3
 J1vbTqYvNMwOnn2LgbBOjoLoV9dPRcOz3g10hdI3kvC4oGdrjZVCH0ZWs
 QgsoR5vqF0Q1yHG79si5qig03ActI80fEF7ulXzB7WJ3fMgjT+nhIXFUB
 ZmEt2XvIGvYumr+CvO4w4kORuSdG5Kyy8TqevjN4W9y6Pl7VPvnXP0gV8
 OOv+3rVV1F7fqLkDTnYmfFPXjQJn4rH15NUP5qbuqNG4Wws42zO4Ru+96
 3GKvpohZyJ6ZX/2wb6h0rdPr5B0vpWCdLaiV7cHcctO2lyzs83AeWh2n+ A==;
X-CSE-ConnectionGUID: RirlGKciRsyENJS5ypmgxQ==
X-CSE-MsgGUID: xn0clx2mR8+3uoiSOFsFxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56235817"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="56235817"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 08:58:02 -0700
X-CSE-ConnectionGUID: +wE+CIoFTbCphSctaimgoQ==
X-CSE-MsgGUID: S9HjAEBsQAOQy3Rpcr0aTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="133281559"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 08:58:01 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Add page queue multiplier
Date: Tue,  8 Apr 2025 08:59:15 -0700
Message-Id: <20250408155915.78770-1-matthew.brost@intel.com>
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

For an unknown reason the math to determine the PF queue size does is
not correct - compute UMD applications are overflowing the PF queue
which is fatal. A multipplier of 8 fixes the problem.

Fixes: 3338e4f90c14 ("drm/xe: Use topology to determine page fault queue size")
Cc: stable@vger.kernel.org
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 9fa11e837dd1..10622ca471a2 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -435,9 +435,16 @@ static int xe_alloc_pf_queue(struct xe_gt *gt, struct pf_queue *pf_queue)
 	num_eus = bitmap_weight(gt->fuse_topo.eu_mask_per_dss,
 				XE_MAX_EU_FUSE_BITS) * num_dss;
 
-	/* user can issue separate page faults per EU and per CS */
+	/*
+	 * user can issue separate page faults per EU and per CS
+	 *
+	 * XXX: Multiplier required as compute UMD are getting PF queue errors
+	 * without it. Follow on why this multiplier is required.
+	 */
+#define PF_MULTIPLIER	8
 	pf_queue->num_dw =
-		(num_eus + XE_NUM_HW_ENGINES) * PF_MSG_LEN_DW;
+		(num_eus + XE_NUM_HW_ENGINES) * PF_MSG_LEN_DW * PF_MULTIPLIER;
+#undef PF_MULTIPLIER
 
 	pf_queue->gt = gt;
 	pf_queue->data = devm_kcalloc(xe->drm.dev, pf_queue->num_dw,
-- 
2.34.1

