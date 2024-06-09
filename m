Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EA8DC27C6E
	for <intel-xe@archiver.kernel.org>; Sun,  9 Jun 2024 18:19:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FE4710E25D;
	Sun,  9 Jun 2024 18:19:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JC/T/jd8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10CC410E22D
 for <intel-xe@lists.freedesktop.org>; Sun,  9 Jun 2024 18:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717957192; x=1749493192;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pOCgwRmmjHeB34Uri+/CbNA04XVaaeHhLQfKfGw3kTU=;
 b=JC/T/jd8joaEs4USXStbvjDXtkrSPPwDrwIvqB3BE+jP5lwUqReWAR+o
 57ONdzNHJn70LMfqjUg1NmJhLepEKEMgMa1lCc5XMX4Y+9lQJCy591Ni+
 msi7hYfB7TSgDKvGZgTw2BYRallg3CN3gFHSuy0UepzfM/mb+Lxn6+HhQ
 KSlbuYg5oAen0wJf2Ir4xMMCVzYR5YNEE5MIrAn8dOzyIrR/bBCJrJvCD
 kvVJi9J41qAmrMPUYFYR/FkJhTUJSgI+gSuk7e8fr+oWYC23ENuomQjD2
 Phz70Se2RM5Oq5Fs8RP4uPwWjkfG3Q6TW3T9/Sh4W3xEEJ6Vqg2zzfz8z Q==;
X-CSE-ConnectionGUID: NocMy8BjQkeXbioH8XLTWA==
X-CSE-MsgGUID: /qWGMdIxQ12+DaOCtGCHpQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="25192327"
X-IronPort-AV: E=Sophos;i="6.08,225,1712646000"; d="scan'208";a="25192327"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2024 11:19:52 -0700
X-CSE-ConnectionGUID: YIrU/u5oQna+FCOJC/1a5Q==
X-CSE-MsgGUID: +w0bTU6sSCGXoqnBUaxLpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,225,1712646000"; d="scan'208";a="38969126"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.119.62])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2024 11:19:50 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: [PATCH 3/3] drm/xe/guc: Prefer GT oriented messages in xe_guc_pc
Date: Sun,  9 Jun 2024 20:19:31 +0200
Message-Id: <20240609181931.1724-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240609181931.1724-1-michal.wajdeczko@intel.com>
References: <20240609181931.1724-1-michal.wajdeczko@intel.com>
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

If possible, we should prefer xe_gt_err() over drm_err().
While at it, improve and fix some of the error messages.
Also drop unnecessary "xe_gt_sysfs.h" include.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 2eb8584566eb..666a37106bc5 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -17,7 +17,7 @@
 #include "xe_force_wake.h"
 #include "xe_gt.h"
 #include "xe_gt_idle.h"
-#include "xe_gt_sysfs.h"
+#include "xe_gt_printk.h"
 #include "xe_gt_types.h"
 #include "xe_guc.h"
 #include "xe_guc_ct.h"
@@ -139,7 +139,8 @@ static int pc_action_reset(struct xe_guc_pc *pc)
 
 	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
 	if (ret)
-		drm_err(&pc_to_xe(pc)->drm, "GuC PC reset: %pe", ERR_PTR(ret));
+		xe_gt_err(pc_to_gt(pc), "GuC PC reset failed: %pe\n",
+			  ERR_PTR(ret));
 
 	return ret;
 }
@@ -161,8 +162,8 @@ static int pc_action_query_task_state(struct xe_guc_pc *pc)
 	/* Blocking here to ensure the results are ready before reading them */
 	ret = xe_guc_ct_send_block(ct, action, ARRAY_SIZE(action));
 	if (ret)
-		drm_err(&pc_to_xe(pc)->drm,
-			"GuC PC query task state failed: %pe", ERR_PTR(ret));
+		xe_gt_err(pc_to_gt(pc), "GuC PC query task state failed: %pe\n",
+			  ERR_PTR(ret));
 
 	return ret;
 }
@@ -183,8 +184,8 @@ static int pc_action_set_param(struct xe_guc_pc *pc, u8 id, u32 value)
 
 	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
 	if (ret)
-		drm_err(&pc_to_xe(pc)->drm, "GuC PC set param failed: %pe",
-			ERR_PTR(ret));
+		xe_gt_err(pc_to_gt(pc), "GuC PC set param[%u]=%u failed: %pe\n",
+			  id, value, ERR_PTR(ret));
 
 	return ret;
 }
@@ -200,8 +201,8 @@ static int pc_action_setup_gucrc(struct xe_guc_pc *pc, u32 mode)
 
 	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
 	if (ret)
-		drm_err(&pc_to_xe(pc)->drm, "GuC RC enable failed: %pe",
-			ERR_PTR(ret));
+		xe_gt_err(pc_to_gt(pc), "GuC RC enable mode=%u failed: %pe\n",
+			  mode, ERR_PTR(ret));
 	return ret;
 }
 
@@ -844,7 +845,7 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
 		goto out;
 
 	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING)) {
-		drm_err(&pc_to_xe(pc)->drm, "GuC PC Start failed\n");
+		xe_gt_err(gt, "GuC PC Start failed\n");
 		ret = -EIO;
 		goto out;
 	}
-- 
2.43.0

