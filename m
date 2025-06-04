Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4496DC5B543
	for <intel-xe@archiver.kernel.org>; Wed,  4 Jun 2025 23:45:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3DC010E0A2;
	Wed,  4 Jun 2025 23:45:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KZfvLxOv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B47E710E0A2
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Jun 2025 23:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749080735; x=1780616735;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=axV+UsbdseteeV/3413LqVnSi/yPfKIJwy1lJPD3d4o=;
 b=KZfvLxOvcU/mC0O6YGbvily2ubzt+oWVZvMROJJYSerRQQBmTTracM10
 UeFLvbQZSrxoS9GvR+rsGcTKi+lYLa1r6pcINhsCrLiZYGdx5Sbh9aB4c
 J3pMMmp6Hc3rbgNRzBu5YH5c9Ec7SvBZ4hWRemZraZ9ES1pfiffVFcde/
 jQek03wym42WaA5q73kNCLBimXkRIMn0JC89/unpZLM5TSUeuYNerZFjU
 Vc5/2HUl+W2moYzHZQxz87PDU4+pvdCM1I2k+g3XaA9dWrwed3zJwkOvJ
 3eBbmTXBwS4bMn25YvsN7Ga9BNePBENsITiUAMG5eOrKHV/rDejsmb2lI Q==;
X-CSE-ConnectionGUID: 8ro6VdlQRm6nrs39mnPYWA==
X-CSE-MsgGUID: xwBPi0gRRqOxUwmh1u5NlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="73716387"
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; d="scan'208";a="73716387"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 16:45:35 -0700
X-CSE-ConnectionGUID: kH8/y39FQVmY0MR43UMAhg==
X-CSE-MsgGUID: 60YoU2FYRJ2X4u+80YIxpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; d="scan'208";a="145227765"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by orviesa006.jf.intel.com with ESMTP; 04 Jun 2025 16:45:34 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2] drm/xe/guc: Set wedged on Xe micro hardware initialization
 error
Date: Wed,  4 Jun 2025 19:45:32 -0400
Message-Id: <20250604234532.1167699-1-zhanjun.dong@intel.com>
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

Declare wedged on Xe micro controller hardware initialization
failed.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4917

---
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>

Change list:
v2: Remove unnecessary jump to err-out
    Drop disable ct, swtich to set wedge
---
 drivers/gpu/drm/xe/xe_uc.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 3a8751a8b92d..bd1d4e8fab7e 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -13,6 +13,7 @@
 #include "xe_gt_printk.h"
 #include "xe_gt_sriov_vf.h"
 #include "xe_guc.h"
+#include "xe_guc_ct.h"
 #include "xe_guc_pc.h"
 #include "xe_guc_engine_activity.h"
 #include "xe_huc.h"
@@ -157,19 +158,22 @@ static int vf_uc_init_hw(struct xe_uc *uc)
 
 	err = xe_guc_enable_communication(&uc->guc);
 	if (err)
-		return err;
+		goto err_out;
 
 	err = xe_gt_sriov_vf_connect(uc_to_gt(uc));
 	if (err)
-		return err;
+		goto err_out;
 
 	uc->guc.submission_state.enabled = true;
 
 	err = xe_gt_record_default_lrcs(uc_to_gt(uc));
 	if (err)
-		return err;
+		goto err_out;
 
 	return 0;
+err_out:
+	xe_device_declare_wedged(uc_to_xe(uc));
+	return err;
 }
 
 /*
@@ -197,19 +201,19 @@ int xe_uc_init_hw(struct xe_uc *uc)
 
 	ret = xe_guc_enable_communication(&uc->guc);
 	if (ret)
-		return ret;
+		goto err_out;
 
 	ret = xe_gt_record_default_lrcs(uc_to_gt(uc));
 	if (ret)
-		return ret;
+		goto err_out;
 
 	ret = xe_guc_post_load_init(&uc->guc);
 	if (ret)
-		return ret;
+		goto err_out;
 
 	ret = xe_guc_pc_start(&uc->guc.pc);
 	if (ret)
-		return ret;
+		goto err_out;
 
 	xe_guc_engine_activity_enable_stats(&uc->guc);
 
@@ -221,6 +225,9 @@ int xe_uc_init_hw(struct xe_uc *uc)
 	xe_gsc_load_start(&uc->gsc);
 
 	return 0;
+err_out:
+	xe_device_declare_wedged(uc_to_xe(uc));
+	return ret;
 }
 
 int xe_uc_fini_hw(struct xe_uc *uc)
-- 
2.34.1

