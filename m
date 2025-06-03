Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36ED4C5AD49
	for <intel-xe@archiver.kernel.org>; Tue,  3 Jun 2025 23:45:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEDEF10E228;
	Tue,  3 Jun 2025 23:45:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G5V3WQfu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C88610E8C2
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Jun 2025 23:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748994312; x=1780530312;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6Ux+IHNfej7bzV1VLwnGnBiCBIpcjt1JOKCfX8K6kdY=;
 b=G5V3WQfu+k1R6fsqqmvxN0ABfe9uAOM+tG9LjYwT/iBOS99kcyMM9Ous
 wpx3ebrVHy0hR5YFULkimajNCiDt26aRY35MhVXpzTR1jQLEqLiu9+PcE
 /exyt/FIyAHVOSSZyqecTywOdUZJWHS9KHkimdcKaNQKboik39F8GaTIf
 dYUi/nAFCyarlzuMLCH5fdh8hiMCqQxJvQLAOOAub6renOPe7bOP6L+gF
 5k25YAVVNiP7bfpttyewQslgt1sqdGstMAxOSex4WuiXRHT4OGEdUn+Kq
 zHKtCeiHPVul8mDfAFXl+Cp97ctBUmBhkloqY8x8dYYSqPc//MhvhlbzO Q==;
X-CSE-ConnectionGUID: 6ASkTWSJTuuC7hgcMnMfXA==
X-CSE-MsgGUID: QTihbTH4RoS/V3OgrUGbEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="76442366"
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; d="scan'208";a="76442366"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 16:45:12 -0700
X-CSE-ConnectionGUID: 2Wp5TOtRRFKaiAoT05X8eA==
X-CSE-MsgGUID: Jg1X3YNsTw6e6cAnJf9XUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; d="scan'208";a="145623816"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by orviesa007.jf.intel.com with ESMTP; 03 Jun 2025 16:45:12 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH] drm/xe/guc: Disable ct on xe micro hardware init error
Date: Tue,  3 Jun 2025 19:45:10 -0400
Message-Id: <20250603234510.612162-1-zhanjun.dong@intel.com>
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

Disable ct if xe micro controller hardware init failed.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4917
---
 drivers/gpu/drm/xe/xe_uc.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 3a8751a8b92d..ba72c1b30f2f 100644
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
@@ -189,27 +190,27 @@ int xe_uc_init_hw(struct xe_uc *uc)
 
 	ret = xe_huc_upload(&uc->huc);
 	if (ret)
-		return ret;
+		goto err;
 
 	ret = xe_guc_upload(&uc->guc);
 	if (ret)
-		return ret;
+		goto err;
 
 	ret = xe_guc_enable_communication(&uc->guc);
 	if (ret)
-		return ret;
+		goto err;
 
 	ret = xe_gt_record_default_lrcs(uc_to_gt(uc));
 	if (ret)
-		return ret;
+		goto err;
 
 	ret = xe_guc_post_load_init(&uc->guc);
 	if (ret)
-		return ret;
+		goto err;
 
 	ret = xe_guc_pc_start(&uc->guc.pc);
 	if (ret)
-		return ret;
+		goto err;
 
 	xe_guc_engine_activity_enable_stats(&uc->guc);
 
@@ -221,6 +222,9 @@ int xe_uc_init_hw(struct xe_uc *uc)
 	xe_gsc_load_start(&uc->gsc);
 
 	return 0;
+err:
+	xe_guc_ct_disable(&uc->guc.ct);
+	return ret;
 }
 
 int xe_uc_fini_hw(struct xe_uc *uc)
-- 
2.34.1

