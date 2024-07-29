Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A9BCC3DA7E
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jul 2024 16:20:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BA0F10E43C;
	Mon, 29 Jul 2024 16:20:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oFUmYq+Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5E0510E42F
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jul 2024 16:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722270041; x=1753806041;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ze/lVVuJGF9YVI3Y/QUHzhNBNKIJThDI//J8NG3Q9lA=;
 b=oFUmYq+YV2gMJTp3KDoJAVygUVhfg2WWa1GCaf8ouGp86K0RgwAphFg5
 MEjcvmuELr0rRM2Xh+f7uldap3vCc8zG0j6k+wmvG5r/TzG4AZk3DzuXi
 dS6iaPJCTFhbV818Alj5gLVXRpX7y/wtp4elFgF/zmy2j7Gw86spMEz5U
 LwRUgVuFiC9qK0VVCP9vsMeiEcpT6+QOjTO2DaAoOoYJtrWE9Ygl3uaAP
 hiWrqZh9XdLBNxP5klcBKvaofZG8zGquXamOrqHYXqpzTsq+9D4j7ALDE
 ONjU7QFntA0cedG5A2HlmI6fAX6mlGJJqo6HCy27/s/x95GRAmqEkwUyh A==;
X-CSE-ConnectionGUID: LhDh92dbQyC+VqKQlyRT0Q==
X-CSE-MsgGUID: zqD5jftaS0CRXvpzBld97w==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="37514254"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="37514254"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:19:54 -0700
X-CSE-ConnectionGUID: G213PEFhRaeFo1wmQ6mVHQ==
X-CSE-MsgGUID: uEsF4GH/SY+nnWBNlqixaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="53680203"
Received: from unknown (HELO DUT152ICLU.fm.intel.com) ([10.105.23.75])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:19:53 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: matthew.brost@intel.com, John.C.Harrison@Intel.com, brian.welty@intel.com,
 rodrigo.vivi@intel.com, intel-xe@lists.freedesktop.org,
 Stuart Summers <stuart.summers@intel.com>
Subject: [CI 1/3] drm/xe: Fix missing workqueue destroy in xe_gt_pagefault
Date: Mon, 29 Jul 2024 16:19:45 +0000
Message-Id: <fa90c7b5d3813cd243a92794bce5c8d3ec48fdbf.1722269793.git.stuart.summers@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722269793.git.stuart.summers@intel.com>
References: <cover.1722269793.git.stuart.summers@intel.com>
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

