Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 865BAC27C65
	for <intel-xe@archiver.kernel.org>; Tue, 11 Jun 2024 16:35:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F93F10E105;
	Tue, 11 Jun 2024 16:35:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Iq+qiD78";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1301E10E105
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Jun 2024 16:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718123754; x=1749659754;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iC/7xh6JPiAKif8k5wSOz3LyZqcQiYS/Q7b/OcjwE74=;
 b=Iq+qiD78R8hC5zSgqDGihMOVt47+GH8xKZ9whxyLTHN7/0Ie5L8DWfie
 HTHHGp/sYRW/RcT7RMO2U4j8wl2ZmGnCMztFy5wLXQGZw31ozi6qwJmvu
 fy76IZeEXP3IJxUbOo6CMRaLM3UkWKIC/63WaScAv9gzxcA8cuoyMEp0B
 PJSYTnFHRchUzl+jyXJRb2Qhk1yP/eTxZQT4mCzlNaJuA2hV5zKXuaQyR
 gCPpGy46kp0eUzQ/u8Gew89uusCvNQ6DSNI9wa0Jj/TApwqtjaS5ikTQq
 QlS8y7AJKDurGnBFWHdy7j0Ll53xIFqkNV11E5r6h/FssQWhlqS+7qXbU A==;
X-CSE-ConnectionGUID: PY5msJ0nQkKk4u70sHDPVA==
X-CSE-MsgGUID: NQHr3bAaSvOuhMF6P+O3Ow==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="40247876"
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="40247876"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 09:35:54 -0700
X-CSE-ConnectionGUID: z+ZJe23VQzi4THABWG6GYQ==
X-CSE-MsgGUID: 4COY/dJIQyG13RhcYVvebA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="44388677"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.94.248.185])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 09:35:51 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v3 1/5] drm/xe: Prefer GT oriented messages in xe_force_wake.c
Date: Tue, 11 Jun 2024 18:35:33 +0200
Message-Id: <20240611163537.1944-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240611163537.1944-1-michal.wajdeczko@intel.com>
References: <20240611163537.1944-1-michal.wajdeczko@intel.com>
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

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
v2: don't fix fw_to_gt (Lucas)
---
 drivers/gpu/drm/xe/xe_force_wake.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
index b2d385daff4b..13ddabd90eed 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -10,6 +10,7 @@
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_reg_defs.h"
 #include "xe_gt.h"
+#include "xe_gt_printk.h"
 #include "xe_mmio.h"
 
 #define XE_FORCE_WAKE_ACK_TIMEOUT_MS	50
@@ -20,12 +21,6 @@ fw_to_gt(struct xe_force_wake *fw)
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
@@ -135,7 +130,6 @@ static int domain_sleep_wait(struct xe_gt *gt,
 int xe_force_wake_get(struct xe_force_wake *fw,
 		      enum xe_force_wake_domains domains)
 {
-	struct xe_device *xe = fw_to_xe(fw);
 	struct xe_gt *gt = fw_to_gt(fw);
 	struct xe_force_wake_domain *domain;
 	enum xe_force_wake_domains tmp, woken = 0;
@@ -153,8 +147,8 @@ int xe_force_wake_get(struct xe_force_wake *fw,
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
@@ -165,7 +159,6 @@ int xe_force_wake_get(struct xe_force_wake *fw,
 int xe_force_wake_put(struct xe_force_wake *fw,
 		      enum xe_force_wake_domains domains)
 {
-	struct xe_device *xe = fw_to_xe(fw);
 	struct xe_gt *gt = fw_to_gt(fw);
 	struct xe_force_wake_domain *domain;
 	enum xe_force_wake_domains tmp, sleep = 0;
@@ -183,8 +176,8 @@ int xe_force_wake_put(struct xe_force_wake *fw,
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

