Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE4D1C3ABC3
	for <intel-xe@archiver.kernel.org>; Mon, 12 May 2025 22:00:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 815E110E28F;
	Mon, 12 May 2025 22:00:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g/BAOjlA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 321C710E28F
 for <intel-xe@lists.freedesktop.org>; Mon, 12 May 2025 22:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747087237; x=1778623237;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oQ9VUFJ+w7T0H8MfeKKyDZO6aENCKKnGOH+L3NT/7Sk=;
 b=g/BAOjlALR0s1qfBQV7roGgsjOarRjGvvQ768FBLLdVc0vOvFiH6F35r
 cwH4QBa8lOBnU4JDUdM/7lnPE2lUYzZSnnIbMGiz6a0HekJ1gOHrLn3RV
 SCloU39eg0rd4fwsBCjPdIwoura82jL+i7G7n74pWBLQXsMpFy1Fh5AQn
 qqaZ6csbZp9KWILNO0uPzJ3lPyAOX5Iv1ELXM6jx3VYMDpCq8HrRnUjeA
 eQhjCo10V7YouCwqIZCgNlxjfS3kdXgMIVxpBVx3rSoCum6FnOHVWsJPB
 5t7VCoHaMPLUIn63uHWeMVfKCGyYxAdMfiDsZTNujs4XbC98bf9ogiNCL g==;
X-CSE-ConnectionGUID: 4oV+ecRJSvmlIU37T5yknw==
X-CSE-MsgGUID: XhsPG/qbTTKO4GjITJbnVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="66317976"
X-IronPort-AV: E=Sophos;i="6.15,283,1739865600"; d="scan'208";a="66317976"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 15:00:37 -0700
X-CSE-ConnectionGUID: ZszQ9ntKR5yeVSTqhWNrdA==
X-CSE-MsgGUID: YOLXT/LDRBGoqLaW17MK9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,283,1739865600"; d="scan'208";a="137390451"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.96.179])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 15:00:32 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 2/2] drm/xe/guc: Don't allocate managed BO for each policy
 change
Date: Tue, 13 May 2025 00:00:18 +0200
Message-Id: <20250512220018.172-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20250512220018.172-1-michal.wajdeczko@intel.com>
References: <20250512220018.172-1-michal.wajdeczko@intel.com>
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

We shouldn't use xe_managed_bo_create_from_data() to allocate
temporary BO, as it will be released only on unload and every
change in wedge_mode policy will consume resources (including
precious GGTT). Instead just switchover to GuC buffer cache.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ads.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index 44c1fa2fe7c8..07a027755627 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -20,6 +20,7 @@
 #include "xe_gt_ccs_mode.h"
 #include "xe_gt_printk.h"
 #include "xe_guc.h"
+#include "xe_guc_buf.h"
 #include "xe_guc_capture.h"
 #include "xe_guc_ct.h"
 #include "xe_hw_engine.h"
@@ -994,6 +995,16 @@ static int guc_ads_action_update_policies(struct xe_guc_ads *ads, u32 policy_off
 	return xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
 }
 
+static int guc_ads_update_policies(struct xe_guc_ads *ads, const struct guc_policies *policies)
+{
+	CLASS(xe_guc_buf_from_data, buf)(&ads_to_guc(ads)->buf, policies, sizeof(*policies));
+
+	if (!xe_guc_buf_is_valid(buf))
+		return -ENOBUFS;
+
+	return guc_ads_action_update_policies(ads, xe_guc_buf_flush(buf));
+}
+
 /**
  * xe_guc_ads_scheduler_policy_toggle_reset - Toggle reset policy
  * @ads: Additional data structures object
@@ -1005,11 +1016,8 @@ static int guc_ads_action_update_policies(struct xe_guc_ads *ads, u32 policy_off
 int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads)
 {
 	struct xe_device *xe = ads_to_xe(ads);
-	struct xe_gt *gt = ads_to_gt(ads);
-	struct xe_tile *tile = gt_to_tile(gt);
 	struct guc_policies *policies;
-	struct xe_bo *bo;
-	int ret = 0;
+	int ret;
 
 	policies = kmalloc(sizeof(*policies), GFP_KERNEL);
 	if (!policies)
@@ -1023,16 +1031,7 @@ int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads)
 	else
 		policies->global_flags &= ~GLOBAL_POLICY_DISABLE_ENGINE_RESET;
 
-	bo = xe_managed_bo_create_from_data(xe, tile, policies, sizeof(struct guc_policies),
-					    XE_BO_FLAG_VRAM_IF_DGFX(tile) |
-					    XE_BO_FLAG_GGTT);
-	if (IS_ERR(bo)) {
-		ret = PTR_ERR(bo);
-		goto out;
-	}
-
-	ret = guc_ads_action_update_policies(ads, xe_bo_ggtt_addr(bo));
-out:
+	ret = guc_ads_update_policies(ads, policies);
 	kfree(policies);
 	return ret;
 }
-- 
2.47.1

