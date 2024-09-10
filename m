Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AB94EB64DE
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 14:14:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25C1610E812;
	Tue, 10 Sep 2024 14:14:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YF1TIE4o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 753FC10E812
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 14:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725977674; x=1757513674;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1iL9Xfdpid5+TLAOUj2k9cG+BhiFDFJ2NTd2z69Kr2E=;
 b=YF1TIE4oTqBLemhJd+Hk3Vcx7jqvFlEsWpiQoga0YqU3Mbab9hguHrFp
 cQuWexnhrgTU3NxvO5ZfhLuF4z+xBEHWRlSiKwr+FokQcJoWiytZeKO12
 areFpep3vXUbyZB8WNJ3ASHIE9DKayNuHp5ZMbDWSmqgujJg+xxi5px7E
 +5w0tWcn5DNFuT2R0y9vOa3qzarnSQI93Tl502RMgusCN+dMUtPsNKhgx
 YcQd2Yh6ephiK7pAPRqVI9Lt6dXEDEFXx5Of4B1ST3Wi49RavTA+Kve1q
 b2x/AUsrUZL1+vVthrkhP2FELvNUekbpBGQKnZUI55dWY1tmaejC5t6em A==;
X-CSE-ConnectionGUID: kMosnI8ETm2bqj2O/VsfuQ==
X-CSE-MsgGUID: TMT7fuLbRFeoiFbrKGxVCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="28618379"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="28618379"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 07:14:34 -0700
X-CSE-ConnectionGUID: Hfl4SePLS8eJUzmbINdD4A==
X-CSE-MsgGUID: D+cyOKmySTesYiCL9KvNOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="67001161"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 07:14:33 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, rodrigo.vivi@intel.com, jani.nikula@linux.intel.com
Subject: [PATCH] drm/xe/xe_gt_idle: Fix name conflict
Date: Tue, 10 Sep 2024 19:58:37 +0530
Message-Id: <20240910142837.636680-1-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
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

Remove local copy of str_up_down to fix name conflict.

Fixes: 0914c1e45d3a ("drm/xe/xe_gt_idle: add debugfs entry for powergating info")
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_debugfs.c | 2 +-
 drivers/gpu/drm/xe/xe_gt_idle.c    | 9 ++-------
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index cbc43973ff7e..8f850b9e1947 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -14,8 +14,8 @@
 #include "xe_force_wake.h"
 #include "xe_ggtt.h"
 #include "xe_gt.h"
-#include "xe_gt_mcr.h"
 #include "xe_gt_idle.h"
+#include "xe_gt_mcr.h"
 #include "xe_gt_sriov_pf_debugfs.h"
 #include "xe_gt_sriov_vf_debugfs.h"
 #include "xe_gt_stats.h"
diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
index 85a35ed153a3..a8ce8b484561 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle.c
+++ b/drivers/gpu/drm/xe/xe_gt_idle.c
@@ -53,11 +53,6 @@ pc_to_xe(struct xe_guc_pc *pc)
 	return gt_to_xe(gt);
 }
 
-static inline const char *str_up_down(bool v)
-{
-	return v ? "up" : "down";
-}
-
 static const char *gt_idle_state_to_string(enum xe_gt_idle_state state)
 {
 	switch (state) {
@@ -227,7 +222,7 @@ int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p)
 			   str_yes_no(pg_enabled & RENDER_POWERGATE_ENABLE));
 
 		drm_printf(p, "Render Power Gate Status: %s\n",
-			   str_up_down(pg_status & RENDER_AWAKE_STATUS));
+			  (pg_status & RENDER_AWAKE_STATUS) ? "up" : "down");
 	}
 
 	vcs_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_VIDEO_DECODE);
@@ -241,7 +236,7 @@ int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p)
 		for (n = 0; n < ARRAY_SIZE(media_slices); n++)
 			if (gt->info.engine_mask & media_slices[n].engines)
 				drm_printf(p, "Media Slice%d Power Gate Status: %s\n", n,
-					   str_up_down(pg_status & media_slices[n].status_bit));
+					  (pg_status & media_slices[n].status_bit) ? "up" : "down");
 	}
 	return 0;
 }
-- 
2.40.0

