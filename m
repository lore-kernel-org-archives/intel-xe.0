Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF189C3DA42
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jul 2024 18:41:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 688D710E5CC;
	Tue,  9 Jul 2024 18:41:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fmjNMNnY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE99A10E5CC
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jul 2024 18:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720550474; x=1752086474;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lB8jqWnvWUkoFVr+QMj0GpQnEAn4/PtQLPsi/3YB7a4=;
 b=fmjNMNnYXEnTaqLaXxNR10XRBT7LsM7Rw6hakCRNrwS/gjYi3zCyPo0S
 Nta04KvsCxHDmGi+xXEV0uoaSEFNxfEIzj1yXru8iJ5GbwF2c2k7pfntG
 j+iLL04QdlCYGWc2fs9lYPDiLO6vd15ZZ3KkfLJEdKvxKNMdOGka9E/Pi
 1wloTI9m3CIxRbZTZ3HXqrB87cEbvgRb9XOnfNpSHT86aYFJbM7JbNkVI
 dBitxafGyejPNnwAygUn1yncPv15VvSXNWbubI/5xs/EeIroQrFRoK+ns
 Jh3m6ZkEtIRn0U+49iUBilAF0f26XodZj3CrHiiLhoAZs7fkO8V1WvarO A==;
X-CSE-ConnectionGUID: b6GgMLMYT1C5EY9Y0VWuxQ==
X-CSE-MsgGUID: m3JSKyELRlW3N7vMqOZaMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="29224333"
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; d="scan'208";a="29224333"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 11:41:13 -0700
X-CSE-ConnectionGUID: WHcLT1W8QxKwG6T5hBBUyA==
X-CSE-MsgGUID: FgGjAhgXQq25LdjTN+aowg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; d="scan'208";a="48686532"
Received: from dut152iclu.fm.intel.com ([10.105.23.75])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 11:41:13 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: matthew.brost@intel.com, John.C.Harrison@Intel.com, brian.welty@intel.com,
 intel-xe@lists.freedesktop.org, Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 1/2] drm/xe: Fix missing workqueue destroy in xe_gt_pagefault
Date: Tue,  9 Jul 2024 18:40:59 +0000
Message-Id: <7c8bf0c59c0bd167c238dc5a65d0074a4ea4109d.1720550129.git.stuart.summers@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720550129.git.stuart.summers@intel.com>
References: <cover.1720550129.git.stuart.summers@intel.com>
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
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index e18659201208..ded8e3c33a82 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -398,6 +398,18 @@ static void pf_queue_work_func(struct work_struct *w)
 
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
@@ -428,7 +440,7 @@ int xe_gt_pagefault_init(struct xe_gt *gt)
 	if (!gt->usm.acc_wq)
 		return -ENOMEM;
 
-	return 0;
+	return devm_add_action_or_reset(xe->drm.dev, pagefault_fini, gt);
 }
 
 void xe_gt_pagefault_reset(struct xe_gt *gt)
-- 
2.34.1

