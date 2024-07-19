Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0721C3DA5D
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jul 2024 19:06:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DF9510E0DC;
	Fri, 19 Jul 2024 19:06:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EfxMhclS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A5B810E0DC
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jul 2024 19:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721415983; x=1752951983;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ze/lVVuJGF9YVI3Y/QUHzhNBNKIJThDI//J8NG3Q9lA=;
 b=EfxMhclSV5R54ODgYGxXcoNO0Z0cPhrra9Vcjp1ybdiPGYbOjyl+5280
 4iv7eQZ4xoB3AhwU36IuzTy4K7B0EB+30Av471/Ne3mleRcsE0CGPIAod
 gw8k2qnaJRuc+gXlc1/apS7gedTxehyRRQBOX1+fxOnW24fQsv4sKqaOK
 4IPK0KupP6LOMH+VMdmWoVDQmCeOuO15RonEuu8ACYogK6S1GrhuXm1JP
 qXQqNirS8fUNx3S8yy084vtTnQfSuwW3VrV9LmeDYRZbF0w7GW9Tsjeu9
 YVp9ys10HaLo4UysgCGD1DGhFkK7Rbdaa7ttPZ6F+n5LhXxO1lmP+vCRj g==;
X-CSE-ConnectionGUID: moTNd9N7RoKDGBy+59qDiw==
X-CSE-MsgGUID: 8PX4UEdaTrWqVvdA3n+q6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="29633403"
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; d="scan'208";a="29633403"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 12:06:23 -0700
X-CSE-ConnectionGUID: G9wUqU/PSLSPlHYviCWu3Q==
X-CSE-MsgGUID: /SVPQJL7Q5m4EWo1VlqNOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; d="scan'208";a="51286705"
Received: from dut152iclu.fm.intel.com ([10.105.23.86])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 12:06:22 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: matthew.brost@intel.com, John.C.Harrison@Intel.com, brian.welty@intel.com,
 rodrigo.vivi@intel.com, intel-xe@lists.freedesktop.org,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 1/3] drm/xe: Fix missing workqueue destroy in xe_gt_pagefault
Date: Fri, 19 Jul 2024 19:06:12 +0000
Message-Id: <906ede49ae9e8c3bd4131cd50430b00c91b56a14.1721415811.git.stuart.summers@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721415811.git.stuart.summers@intel.com>
References: <cover.1721415811.git.stuart.summers@intel.com>
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

