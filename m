Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D1B4C27C55
	for <intel-xe@archiver.kernel.org>; Mon, 10 Jun 2024 20:33:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E232010E3A7;
	Mon, 10 Jun 2024 20:33:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X3okKrNR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD6A010E3A7
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Jun 2024 20:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718051597; x=1749587597;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iKn6LXv0CtuNFl4hBruLZ0x3Hggk0ZdjKdJyf0y/IAo=;
 b=X3okKrNRyZoLIbGJv4MGzrQ2IfjfdGUNpwSe7H97uFazue2WJkyY9rPA
 VxLHh8zPM2SszQwQaSV/eR+ju78+tcPvKTgIOQMz4aXdYKtiSbgeV9GC7
 oxDDMZcd2Drq7kl2yTu1CwC8oFLJWRapleYb7/k/wbjxSbjcPJ8mVT/g/
 kb8hXJx44mi0I6uIQgZom61pBH6u2WuIw/3r+yBFzgQVfi5AkZ5ATljuM
 s4afuViWYAAndvmtI/MdoXDizeuASP325DjdDn//+xs0B9eFHvvIa704L
 BGYWtWMyLHFKMH+wZFXqMCs8WCCYPTAXnEO3Uvb/4uVkylZK9JzNJLf9c Q==;
X-CSE-ConnectionGUID: iU6zwl4YSnG6qXywKB5gqQ==
X-CSE-MsgGUID: uXS3CgOYTVm3Z6j3Hti6SA==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="14611179"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="14611179"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 13:33:16 -0700
X-CSE-ConnectionGUID: ImBaJ5/STx+rZjcWgVf4VQ==
X-CSE-MsgGUID: N3VXflSuQ8WTlWkFpHMygg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="39022139"
Received: from live-gta-imageloader.fm.intel.com (HELO
 DUT152ICLU.fm.intel.com) ([10.105.23.81])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 13:33:16 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: brian.welty@intel.com, intel-xe@lists.freedesktop.org,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 1/2] drm/xe: Fix missing workqueue destroy in xe_gt_pagefault
Date: Mon, 10 Jun 2024 20:32:59 +0000
Message-Id: <20240610203300.182615-1-stuart.summers@intel.com>
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

On driver reload we never free up the memory for the pagefault and
access counter workqueues. Add those destroy calls here.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Signed-off-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c           |  2 ++
 drivers/gpu/drm/xe/xe_gt_pagefault.c | 11 +++++++++++
 drivers/gpu/drm/xe/xe_gt_pagefault.h |  1 +
 3 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 57d84751e160..68dc6920112b 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -107,6 +107,8 @@ void xe_gt_remove(struct xe_gt *gt)
 
 	xe_uc_remove(&gt->uc);
 
+	xe_gt_pagefault_fini(gt);
+
 	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
 		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
 }
diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index eaf68f0135c1..3858c8e0b707 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -415,6 +415,17 @@ int xe_gt_pagefault_init(struct xe_gt *gt)
 	return 0;
 }
 
+void xe_gt_pagefault_fini(struct xe_gt *gt)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+
+	if (!xe->info.has_usm)
+		return;
+
+	destroy_workqueue(gt->usm.acc_wq);
+	destroy_workqueue(gt->usm.pf_wq);
+}
+
 void xe_gt_pagefault_reset(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.h b/drivers/gpu/drm/xe/xe_gt_pagefault.h
index 839c065a5e4c..d37b790ce8bb 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.h
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.h
@@ -12,6 +12,7 @@ struct xe_gt;
 struct xe_guc;
 
 int xe_gt_pagefault_init(struct xe_gt *gt);
+void xe_gt_pagefault_fini(struct xe_gt *gt);
 void xe_gt_pagefault_reset(struct xe_gt *gt);
 int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len);
 int xe_guc_access_counter_notify_handler(struct xe_guc *guc, u32 *msg, u32 len);
-- 
2.34.1

