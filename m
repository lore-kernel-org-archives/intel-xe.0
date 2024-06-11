Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D37DCC27C75
	for <intel-xe@archiver.kernel.org>; Tue, 11 Jun 2024 10:08:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC0D210E58F;
	Tue, 11 Jun 2024 10:08:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lmVNkIvb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 261BB10E4A6
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Jun 2024 10:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718100497; x=1749636497;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jeQbz5BSun0AKXeZUV9xpywcOshkOrv385BLFVnbUDU=;
 b=lmVNkIvbWsOkzlAIMF8/FXLthLE7plMrFKr2JWTAXLJdSpDnRlwsRcoY
 0oFnF7pATot6TD2Va5dC82o+dpjz+5EQtqDSITfjwW0w/o7geB1KvalYa
 Wg5CrTY1v1KmFEl830YV6MWQvApzH+JyTLDa/8FLJUzYaYK6vP5aqt6Zr
 I7Il0aSQyF8JB3m2xFmgwPBD6ua3oBwoXihrx6k3T1m2OYcksyvFZP4A/
 3ESnIGpCiAOLja1jYRY/uEABcu624w1u/KQwl0jnodqVLZL2DbNEyHHKm
 vM5H0XwlVbeyxnnb3JVreHOHwH75hdeeb2BPk+RPS2G1gsLBvnWFugAyQ A==;
X-CSE-ConnectionGUID: Hlbq739cSJqjvXX+WoAiTA==
X-CSE-MsgGUID: YNaqAfEkSWaOElaRT4zG+g==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="18582066"
X-IronPort-AV: E=Sophos;i="6.08,229,1712646000"; d="scan'208";a="18582066"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 03:08:17 -0700
X-CSE-ConnectionGUID: WPwAAGHTREmghm/AshouZg==
X-CSE-MsgGUID: yPdjkBFeSSC+DhHkU0w5pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,229,1712646000"; d="scan'208";a="39456840"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.94.248.185])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 03:08:15 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v2 1/4] drm/xe: Prefer GT oriented messages in xe_force_wake.c
Date: Tue, 11 Jun 2024 12:07:54 +0200
Message-Id: <20240611100757.1856-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240611100757.1856-1-michal.wajdeczko@intel.com>
References: <20240611100757.1856-1-michal.wajdeczko@intel.com>
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

If possible, we should prefer xe_gt_notice() over drm_notice().
While at it, undo line split of fw_to_gt() function signature.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_force_wake.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
index b2d385daff4b..2497f0f65aa0 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -10,22 +10,16 @@
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_reg_defs.h"
 #include "xe_gt.h"
+#include "xe_gt_printk.h"
 #include "xe_mmio.h"
 
 #define XE_FORCE_WAKE_ACK_TIMEOUT_MS	50
 
-static struct xe_gt *
-fw_to_gt(struct xe_force_wake *fw)
+static struct xe_gt *fw_to_gt(struct xe_force_wake *fw)
 {
 	return fw->gt;
 }
 
-static struct xe_device *
-fw_to_xe(struct xe_force_wake *fw)
-{
-	return gt_to_xe(fw_to_gt(fw));
-}
-
 static void domain_init(struct xe_force_wake_domain *domain,
 			enum xe_force_wake_domain_id id,
 			struct xe_reg reg, struct xe_reg ack)
@@ -135,7 +129,6 @@ static int domain_sleep_wait(struct xe_gt *gt,
 int xe_force_wake_get(struct xe_force_wake *fw,
 		      enum xe_force_wake_domains domains)
 {
-	struct xe_device *xe = fw_to_xe(fw);
 	struct xe_gt *gt = fw_to_gt(fw);
 	struct xe_force_wake_domain *domain;
 	enum xe_force_wake_domains tmp, woken = 0;
@@ -153,8 +146,8 @@ int xe_force_wake_get(struct xe_force_wake *fw,
 		ret = domain_wake_wait(gt, domain);
 		ret2 |= ret;
 		if (ret)
-			drm_notice(&xe->drm, "Force wake domain (%d) failed to ack wake, ret=%d\n",
-				   domain->id, ret);
+			xe_gt_notice(gt, "Force wake domain (%d) failed to ack wake, ret=%d\n",
+				     domain->id, ret);
 	}
 	fw->awake_domains |= woken;
 	spin_unlock_irqrestore(&fw->lock, flags);
@@ -165,7 +158,6 @@ int xe_force_wake_get(struct xe_force_wake *fw,
 int xe_force_wake_put(struct xe_force_wake *fw,
 		      enum xe_force_wake_domains domains)
 {
-	struct xe_device *xe = fw_to_xe(fw);
 	struct xe_gt *gt = fw_to_gt(fw);
 	struct xe_force_wake_domain *domain;
 	enum xe_force_wake_domains tmp, sleep = 0;
@@ -183,8 +175,8 @@ int xe_force_wake_put(struct xe_force_wake *fw,
 		ret = domain_sleep_wait(gt, domain);
 		ret2 |= ret;
 		if (ret)
-			drm_notice(&xe->drm, "Force wake domain (%d) failed to ack sleep, ret=%d\n",
-				   domain->id, ret);
+			xe_gt_notice(gt, "Force wake domain (%d) failed to ack sleep, ret=%d\n",
+				     domain->id, ret);
 	}
 	fw->awake_domains &= ~sleep;
 	spin_unlock_irqrestore(&fw->lock, flags);
-- 
2.43.0

