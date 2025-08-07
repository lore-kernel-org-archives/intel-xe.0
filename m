Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4E20C87FCF
	for <intel-xe@archiver.kernel.org>; Thu,  7 Aug 2025 21:42:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 672D210E8AD;
	Thu,  7 Aug 2025 21:42:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WqzDvkzc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59E0D10E8B0
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Aug 2025 21:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754602949; x=1786138949;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+IKsv3Cmjmse4tdIXrGMANdTtZElVc62qcez+OSTMmI=;
 b=WqzDvkzcXgbYjLVXwr6HKyM6OObpVRYASilJqlAmA3dJ7h5Qb7xtSCBw
 4TLGpBXGhCwdVvL42WRhWFZGYCcdchkfOWv0c5ncEq0hcCrVCW6qrmuTL
 GpkSMwX492basppP/9SjlV2ZJDZ3V3gIYsWWY0JAgq9iLfFaz1a5GXgoB
 RBx928eiGGmTeCrci3yBfd0PQlwJwpO2sJV6RkZTjaArfvhFmQm5asTPp
 5KOaB9ldnowYCDnlmgbUioLqfnjrDURIPegZVpFMuxLTJDcS1L4JesDDb
 zWQd+MyWLVIg3JULiNmj1CA1rJOBwAifWhqLPnMSlqwYFFLkJsgAOucyY g==;
X-CSE-ConnectionGUID: jYMkKYIYTAK7IaGp8fQPXg==
X-CSE-MsgGUID: TjcJjh7jTk+HaHF4XusdXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="57092826"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="57092826"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 14:42:29 -0700
X-CSE-ConnectionGUID: LQzRJ2kfRsO0UU67rqD/8w==
X-CSE-MsgGUID: CbKexXG6Q1eV3jLUr1Qi4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="169394609"
Received: from msatwood-mobl.jf.intel.com ([10.24.13.181])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 14:42:29 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Atwood <matthew.s.atwood@intel.com>
Subject: [PATCH v2 2/2] drm/xe: Update function names for GT specific
 workarounds
Date: Thu,  7 Aug 2025 14:42:24 -0700
Message-ID: <20250807214224.32728-2-matthew.s.atwood@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250807214224.32728-1-matthew.s.atwood@intel.com>
References: <20250807214224.32728-1-matthew.s.atwood@intel.com>
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

Now that there distinctly different OOB functions, update the names to
reflect the IPs they interact with.

Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c |  4 ++--
 drivers/gpu/drm/xe/xe_wa.c | 10 +++++-----
 drivers/gpu/drm/xe/xe_wa.h |  4 ++--
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 43f2da27d9d9..a3397f04abcc 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -400,7 +400,7 @@ int xe_gt_init_early(struct xe_gt *gt)
 
 	xe_reg_sr_init(&gt->reg_sr, "GT", gt_to_xe(gt));
 
-	err = xe_wa_init(gt);
+	err = xe_wa_gt_init(gt);
 	if (err)
 		return err;
 
@@ -408,7 +408,7 @@ int xe_gt_init_early(struct xe_gt *gt)
 	if (err)
 		return err;
 
-	xe_wa_process_oob(gt);
+	xe_wa_process_gt_oob(gt);
 
 	xe_force_wake_init_gt(gt, gt_to_fw(gt));
 	spin_lock_init(&gt->global_invl_lock);
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 0fc73af1bb4c..52c7df4c3afd 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -916,13 +916,13 @@ void xe_wa_process_device_oob(struct xe_device *xe)
 }
 
 /**
- * xe_wa_process_oob - process OOB workaround table
+ * xe_wa_process_gt_oob - process GT OOB workaround table
  * @gt: GT instance to process workarounds for
  *
  * Process OOB workaround table for this platform, marking in @gt the
  * workarounds that are active.
  */
-void xe_wa_process_oob(struct xe_gt *gt)
+void xe_wa_process_gt_oob(struct xe_gt *gt)
 {
 	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(gt);
 
@@ -1006,12 +1006,12 @@ int xe_wa_device_init(struct xe_device *xe)
 }
 
 /**
- * xe_wa_init - initialize gt with workaround bookkeeping
+ * xe_wa_gt_init - initialize gt with workaround bookkeeping
  * @gt: GT instance to initialize
  *
  * Returns 0 for success, negative error code otherwise.
  */
-int xe_wa_init(struct xe_gt *gt)
+int xe_wa_gt_init(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 	size_t n_oob, n_lrc, n_engine, n_gt, total;
@@ -1037,7 +1037,7 @@ int xe_wa_init(struct xe_gt *gt)
 
 	return 0;
 }
-ALLOW_ERROR_INJECTION(xe_wa_init, ERRNO); /* See xe_pci_probe() */
+ALLOW_ERROR_INJECTION(xe_wa_gt_init, ERRNO); /* See xe_pci_probe() */
 
 void xe_wa_device_dump(struct xe_device *xe, struct drm_printer *p)
 {
diff --git a/drivers/gpu/drm/xe/xe_wa.h b/drivers/gpu/drm/xe/xe_wa.h
index 105497c1d7d7..6a869b2de643 100644
--- a/drivers/gpu/drm/xe/xe_wa.h
+++ b/drivers/gpu/drm/xe/xe_wa.h
@@ -14,9 +14,9 @@ struct xe_hw_engine;
 struct xe_tile;
 
 int xe_wa_device_init(struct xe_device *xe);
-int xe_wa_init(struct xe_gt *gt);
+int xe_wa_gt_init(struct xe_gt *gt);
 void xe_wa_process_device_oob(struct xe_device *xe);
-void xe_wa_process_oob(struct xe_gt *gt);
+void xe_wa_process_gt_oob(struct xe_gt *gt);
 void xe_wa_process_gt(struct xe_gt *gt);
 void xe_wa_process_engine(struct xe_hw_engine *hwe);
 void xe_wa_process_lrc(struct xe_hw_engine *hwe);
-- 
2.49.0

