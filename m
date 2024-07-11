Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22012C3DA49
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jul 2024 17:36:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D95C410E2AD;
	Thu, 11 Jul 2024 17:36:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GL7j4OvZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC55010E031
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jul 2024 17:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720719397; x=1752255397;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ze/lVVuJGF9YVI3Y/QUHzhNBNKIJThDI//J8NG3Q9lA=;
 b=GL7j4OvZ03qDp7VAxfpWJKUhnII1O/8j0s8sVjv0cqumK6BG2CWTstD6
 PRFVxiQGWHlGtabLTo6s8KzNgpEcUqOe7iLaXAbBUE/rUi7BtsZfWa+z+
 g7HWeTjgSs1iizNyOMl/IzbE5Mk4jxZhENoNNU025yGD0mBwpsUiZR3Dq
 51xysRd5CNlbajp4g/6gqksvGnvU2YVE01DwoVZ7eXus6Va6Z25UB0RgG
 iDy939tiPqzcyFDVOND/wWsnd74r0nlLHx9F9EZMs6TH/guV14GLpyLfv
 xGvrWe3pszM2vK8CdwwloTH38UakZfsAJ0hzcE9r7/pvZQdvD0dbUf+7g A==;
X-CSE-ConnectionGUID: jxIC/YLCQ9qF95QjUk9R2Q==
X-CSE-MsgGUID: eSXkUfz5TdyQGmDpwQn2UA==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="29534485"
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="29534485"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 10:36:37 -0700
X-CSE-ConnectionGUID: VrUyx86ZSNi/JhW+AXEMlQ==
X-CSE-MsgGUID: /Xoq+/BnQvq55znNZfWAlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="79768371"
Received: from live-gta-imageloader.fm.intel.com (HELO
 DUT152ICLU.fm.intel.com) ([10.105.23.81])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 10:36:36 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: matthew.brost@intel.com, John.C.Harrison@Intel.com, brian.welty@intel.com,
 intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 1/2] drm/xe: Fix missing workqueue destroy in xe_gt_pagefault
Date: Thu, 11 Jul 2024 17:36:28 +0000
Message-Id: <f3055416b5941fa5da1ab7ec1419a1248602fb9a.1720718987.git.stuart.summers@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720718987.git.stuart.summers@intel.com>
References: <cover.1720718987.git.stuart.summers@intel.com>
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

On driver reload we never free up the memory for the pagefault and
access counter workqueues. Add those destroy calls here.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Signed-off-by: Stuart Summers <stuart.summers@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 9292d5468868..b2a7fa55bd18 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -382,6 +382,18 @@ static void pf_queue_work_func(struct work_struct *w)
 
 static void acc_queue_work_func(struct work_struct *w);
 
+static void pagefault_fini(void *arg)
+{
+	struct xe_gt *gt = arg;
+	struct xe_device *xe = gt_to_xe(gt);
+
+	if (!xe->info.has_usm)
+		return;
+
+	destroy_workqueue(gt->usm.acc_wq);
+	destroy_workqueue(gt->usm.pf_wq);
+}
+
 int xe_gt_pagefault_init(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
@@ -409,10 +421,12 @@ int xe_gt_pagefault_init(struct xe_gt *gt)
 	gt->usm.acc_wq = alloc_workqueue("xe_gt_access_counter_work_queue",
 					 WQ_UNBOUND | WQ_HIGHPRI,
 					 NUM_ACC_QUEUE);
-	if (!gt->usm.acc_wq)
+	if (!gt->usm.acc_wq) {
+		destroy_workqueue(gt->usm.pf_wq);
 		return -ENOMEM;
+	}
 
-	return 0;
+	return devm_add_action_or_reset(xe->drm.dev, pagefault_fini, gt);
 }
 
 void xe_gt_pagefault_reset(struct xe_gt *gt)
-- 
2.34.1

