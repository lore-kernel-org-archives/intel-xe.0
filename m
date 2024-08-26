Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13425C5321E
	for <intel-xe@archiver.kernel.org>; Mon, 26 Aug 2024 16:49:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7C0210E24D;
	Mon, 26 Aug 2024 16:49:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZD3+0uqp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5052010E24D
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Aug 2024 16:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724690942; x=1756226942;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mpEmXql/aBzmu4Qt9ZWPGLtRzqeYdQf/eEHX8IbFcqU=;
 b=ZD3+0uqpjo/JqWcmx22Qmd0j5BPfJ9r52+FO/CPSWtEcpRekGzsGSSAn
 ODTb+oslruei7q6TTQ6Hqk1nOdgG+WwMlRfN+zyVaBBwVVs5xXX3F8Y/X
 tVDkPnMwQsDB5GXbdycz+8819JpLwJfoJtelX33UZnR7qLJcrkCQ83up6
 bIVml20AQplF+a6D8VIOo0PfwnQqztoNPB58C1wma5ifXUzGeoA1McSiu
 hsRCcaoiFp1WCPeviTV3Ivs3y+PbjE6OWWoqCd/LWUhqE+gn8IWxgrTr/
 OJSNhBkKQ9X9apotRd+8XdgE4BiYaq7MgjbiVRCsJhVuYwUfXjerVYRrR Q==;
X-CSE-ConnectionGUID: UBszhmz6RdOrtTmJaamhIw==
X-CSE-MsgGUID: 9qHPYfVqSq+ANNWg9i1jyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="22994218"
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; d="scan'208";a="22994218"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 09:49:02 -0700
X-CSE-ConnectionGUID: KQnZFkR4RRKZTTSsdjcFTA==
X-CSE-MsgGUID: xQWgMwItT9uQrivkRPF30A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; d="scan'208";a="66904252"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 09:49:02 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH v2] drm/xe: Fix memory leak on xe_alloc_pf_queue failure
Date: Mon, 26 Aug 2024 18:20:35 +0200
Message-ID: <20240826162035.20462-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

Simplify memory unwinding on error also fixing current memory
leak that can happen on error.

v2: use devm_kcalloc(Matt A)

Fixes: 3338e4f90c14 ("drm/xe: Use topology to determine page fault queue size")
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 0be4687bfc20..91810d0a9afc 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -388,7 +388,6 @@ static void pagefault_fini(void *arg)
 {
 	struct xe_gt *gt = arg;
 	struct xe_device *xe = gt_to_xe(gt);
-	int i;
 
 	if (!xe->info.has_usm)
 		return;
@@ -396,12 +395,11 @@ static void pagefault_fini(void *arg)
 	destroy_workqueue(gt->usm.acc_wq);
 	destroy_workqueue(gt->usm.pf_wq);
 
-	for (i = 0; i < NUM_PF_QUEUE; ++i)
-		kfree(gt->usm.pf_queue[i].data);
 }
 
 static int xe_alloc_pf_queue(struct xe_gt *gt, struct pf_queue *pf_queue)
 {
+	struct xe_device *xe = gt_to_xe(gt);
 	xe_dss_mask_t all_dss;
 	int num_dss, num_eus;
 
@@ -417,7 +415,8 @@ static int xe_alloc_pf_queue(struct xe_gt *gt, struct pf_queue *pf_queue)
 		(num_eus + XE_NUM_HW_ENGINES) * PF_MSG_LEN_DW;
 
 	pf_queue->gt = gt;
-	pf_queue->data = kcalloc(pf_queue->num_dw, sizeof(u32), GFP_KERNEL);
+	pf_queue->data = devm_kcalloc(xe->drm.dev, pf_queue->num_dw,
+				      sizeof(u32), GFP_KERNEL);
 	if (!pf_queue->data)
 		return -ENOMEM;
 
-- 
2.42.0

