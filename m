Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE005EDEBE2
	for <intel-xe@archiver.kernel.org>; Tue,  3 Mar 2026 18:17:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A449610E89F;
	Tue,  3 Mar 2026 18:17:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f2iZJn0y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AC4D10E89F
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Mar 2026 18:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772561874; x=1804097874;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EPJbU78e7DhtDtolMyeHIoyo0c3+SjqwwHOCqwVZwYk=;
 b=f2iZJn0y8Cu4DBQVivGRzeXWcKNL3C/3KK8HjaMeGBuuEUUr7j/PD9uk
 qeUBTO8KIPR5DEB13idre+mm7e2lgbthTQnZoyz3/fac2K+C63m0ncx/j
 UTgGgReXOSCrto4lN4ZElH9KU0uRKEtNkieQWR5WQqniZkJrMHDRqodaZ
 f5vKGMyy4G+YQNos2vLHsOOtidSI4W+bNVZyUS+hKQZTtwDacyGRinD/u
 pYp1zcLwo5VObyeuBXew6yUJsypEutHDGXlPmUCfXDm2oawMtVE05AP7d
 NMVuMIIB7THiHsCiAp8hMOMyVr5RbU5iq8muWTy4lVOWnhcF4pvuvT155 Q==;
X-CSE-ConnectionGUID: hCjdEpJbT5Wx3XNt4bnCFA==
X-CSE-MsgGUID: tB3yej/WQkuD+jV09xMOWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="84954026"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="84954026"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 10:17:54 -0800
X-CSE-ConnectionGUID: YJqcqnS3TKSVSQCbJZdsMg==
X-CSE-MsgGUID: dUoY/ayKQLi+NvLr0XD5rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="215126164"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.23])
 by fmviesa006.fm.intel.com with ESMTP; 03 Mar 2026 10:17:54 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Riana Tauro <riana.tauro@intel.com>
Subject: [PATCH] drm/xe: Don't disable GuCRC in suspend path
Date: Tue,  3 Mar 2026 10:14:16 -0800
Message-Id: <20260303181416.3880937-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
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

GuCRC should not be disabled in xe_guc_stop_prepare() as C6 is a
prerequisite for s0ix and s2idle. This is a regression caused by
the patch below.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/7510
Fixes: 40a684f91d26 ("drm/xe: Decouple GuC RC code from xe_guc_pc")
Cc: Riana Tauro <riana.tauro@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c  | 2 ++
 drivers/gpu/drm/xe/xe_guc.c | 1 -
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index b455af1e6072..f3bb856aad2a 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -38,6 +38,7 @@
 #include "xe_gt_topology.h"
 #include "xe_guc_exec_queue_types.h"
 #include "xe_guc_pc.h"
+#include "xe_guc_rc.h"
 #include "xe_guc_submit.h"
 #include "xe_hw_fence.h"
 #include "xe_hw_engine_class_sysfs.h"
@@ -896,6 +897,7 @@ static void gt_reset_worker(struct work_struct *w)
 	if (IS_SRIOV_PF(gt_to_xe(gt)))
 		xe_gt_sriov_pf_stop_prepare(gt);
 
+	xe_guc_rc_disable(&gt->uc.guc);
 	xe_uc_stop_prepare(&gt->uc);
 	xe_pagefault_reset(gt_to_xe(gt), gt);
 
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 54d2fc780127..e75653a5e797 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1671,7 +1671,6 @@ void xe_guc_stop_prepare(struct xe_guc *guc)
 	if (!IS_SRIOV_VF(guc_to_xe(guc))) {
 		int err;
 
-		xe_guc_rc_disable(guc);
 		err = xe_guc_pc_stop(&guc->pc);
 		xe_gt_WARN(guc_to_gt(guc), err, "Failed to stop GuC PC: %pe\n",
 			   ERR_PTR(err));
-- 
2.38.1

