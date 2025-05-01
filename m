Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCB44C369DC
	for <intel-xe@archiver.kernel.org>; Thu,  1 May 2025 18:32:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8014F10E263;
	Thu,  1 May 2025 18:32:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P68cPswg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35C3D10E263
 for <intel-xe@lists.freedesktop.org>; Thu,  1 May 2025 18:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746124348; x=1777660348;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KCmCLpjrU6R5dy2wJlLs01Y9yOtYuCoGX4SXQk8vkpo=;
 b=P68cPswgs/3+m3K0Ra6nJ1vUZSJl27Aw9eyULmH5wnbFPvdOn4uId6br
 Lu1+fW+UiVW0nXxb6dCdA3zxJFh5wA91tlAwHQc1U2Nn90JFiJAdlwgbX
 If2HFq5xK7ljjrKOfT/CVXp0JuA3c4wNm3SER/VSNU1ObYbWpEkNkcDLJ
 YS8Ur/aCHyyRoT91j31iPy0qTopHSHT4sWznbZu1avnt/pGX9N3CYwfcM
 iUEkMYqvVkef06BwcSy+bbW+LqjE/XkyA/9RaR8oEk2EYHkU5PU3TsaOA
 P1B5m14BQIUYdcCS48+WJIKkkI8Iej9NFTbi7G+ZdFxPWIZ7HC/kRWzEm A==;
X-CSE-ConnectionGUID: RYgpV5DhS/qS/hEqozE+3Q==
X-CSE-MsgGUID: qbERlNDoTEGR10UpPiPiZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="59192137"
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; d="scan'208";a="59192137"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2025 11:32:27 -0700
X-CSE-ConnectionGUID: 9t18ox4OTKKF3UGwqgcsiQ==
X-CSE-MsgGUID: xtLoGiKOQn+tUZ8HBP3tYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; d="scan'208";a="134949632"
Received: from unknown (HELO DUT137ARLU.fm.intel.com) ([10.105.23.70])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2025 11:32:27 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 lucas.demarchi@intel.com, Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH] drm/xe: Fix page fault queue calculation
Date: Thu,  1 May 2025 18:32:20 +0000
Message-Id: <20250501183220.72097-1-stuart.summers@intel.com>
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

We followed up with the design architects to have a more
precise calculation for a theoretical maximum number of
page faults we might expect based on the number of TLBs
available in the system. Fix the original calculation which
did not take the number of TLBs into consideration.

Fixes: 29582e0ea75c ("drm/xe: Add page queue multiplier")
Fixes: 3338e4f90c14 ("drm/xe: Use topology to determine page fault queue size")

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 10622ca471a2..80a816c3837b 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -436,15 +436,20 @@ static int xe_alloc_pf_queue(struct xe_gt *gt, struct pf_queue *pf_queue)
 				XE_MAX_EU_FUSE_BITS) * num_dss;
 
 	/*
-	 * user can issue separate page faults per EU and per CS
+	 * Each TLB can report up to 32 faults. The number of TLBs is
+	 * equal to the number of render/compute/media engines plus twice
+	 * the number of copy engines plus the number of EUs.
 	 *
-	 * XXX: Multiplier required as compute UMD are getting PF queue errors
-	 * without it. Follow on why this multiplier is required.
+	 * Reserve enough space here to ensure we are able to cover that
+	 * theoretical maximum.
 	 */
-#define PF_MULTIPLIER	8
+#define MAX_FAULTS_PER_TLB	32
 	pf_queue->num_dw =
-		(num_eus + XE_NUM_HW_ENGINES) * PF_MSG_LEN_DW * PF_MULTIPLIER;
-#undef PF_MULTIPLIER
+		PF_MSG_LEN_DW * MAX_FAULTS_PER_TLB *
+		(num_eus +
+		 hweight64(gt->info.engine_mask) +
+		 hweight32(xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_COPY)));
+#undef MAX_FAULTS_PER_TLB
 
 	pf_queue->gt = gt;
 	pf_queue->data = devm_kcalloc(xe->drm.dev, pf_queue->num_dw,
-- 
2.34.1

