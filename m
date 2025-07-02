Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D80C83F04
	for <intel-xe@archiver.kernel.org>; Wed,  2 Jul 2025 14:26:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11FF410E298;
	Wed,  2 Jul 2025 14:26:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X0bH96fx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF0D410E298
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Jul 2025 14:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751466363; x=1783002363;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VA5xthg9dPrTPeeGXrZjuj2UGmZFBUchuMH66WJDgXk=;
 b=X0bH96fxtIpYHc6JVNYCc+Z2D72OOs2OU9buCz5PuQw/usx98/GdScqs
 1zN4ByY+GvBvjoI+YT5U2cZzYUIKoifFEk6yTPvqc6LqcxmtliWe0YDV7
 K6C0SZPxGOPptgObzVYm6FBH5f+CYwhy4PqF78AoWgLvnOH/TcCUAsQz5
 jaVrT9UjZ3s4geZ2NTGlikYz6hT7+xbYMIXuHtukriUqmvPjs5MRdv77I
 XVFdyFy7re86p5Q8isECIPYvCD1V3DepCkwDX0+KqgOHM5hu3PxDRM3CY
 +nOsX3EGtIXL72q2v2qiVBSKOUeDZR5DpRZkCzzUUR8q4G3LfFpvZVF9g g==;
X-CSE-ConnectionGUID: sq0qq/nIQUGxR0WUkkbBtQ==
X-CSE-MsgGUID: XHDlqH9bTm6vHzhlOylo7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="64814438"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="64814438"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 07:25:18 -0700
X-CSE-ConnectionGUID: YWPDYAevSsuaZ6eytcaesQ==
X-CSE-MsgGUID: SoZSaMERSDK3AMXwjRLyCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="158658536"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.112.168])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 07:25:16 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe/guc: Don't allocate temporary policies object
Date: Wed,  2 Jul 2025 16:25:04 +0200
Message-Id: <20250702142504.1656-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

Since we are already using reusable buffer objects from the GuC
buffer cache, we can directly write into their CPU pointers and
spare unnecessary temporary allocation.

While around, also make sure to clear obtained buffer, to avoid
sending some stale data.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ads.c | 27 +++++++++------------------
 1 file changed, 9 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index b4d81f4bd548..131cfc56be00 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -995,16 +995,6 @@ static int guc_ads_action_update_policies(struct xe_guc_ads *ads, u32 policy_off
 	return xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
 }
 
-static int guc_ads_update_policies(struct xe_guc_ads *ads, const struct guc_policies *policies)
-{
-	CLASS(xe_guc_buf_from_data, buf)(&ads_to_guc(ads)->buf, policies, sizeof(*policies));
-
-	if (!xe_guc_buf_is_valid(buf))
-		return -ENOBUFS;
-
-	return guc_ads_action_update_policies(ads, xe_guc_buf_flush(buf));
-}
-
 /**
  * xe_guc_ads_scheduler_policy_toggle_reset - Toggle reset policy
  * @ads: Additional data structures object
@@ -1015,13 +1005,16 @@ static int guc_ads_update_policies(struct xe_guc_ads *ads, const struct guc_poli
  */
 int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads)
 {
-	struct xe_device *xe = ads_to_xe(ads);
 	struct guc_policies *policies;
-	int ret;
+	struct xe_guc *guc = ads_to_guc(ads);
+	struct xe_device *xe = ads_to_xe(ads);
+	CLASS(xe_guc_buf, buf)(&guc->buf, sizeof(*policies));
 
-	policies = kmalloc(sizeof(*policies), GFP_KERNEL);
-	if (!policies)
-		return -ENOMEM;
+	if (!xe_guc_buf_is_valid(buf))
+		return -ENOBUFS;
+
+	policies = xe_guc_buf_cpu_ptr(buf);
+	memset(policies, 0, sizeof(*policies));
 
 	policies->dpc_promote_time = ads_blob_read(ads, policies.dpc_promote_time);
 	policies->max_num_work_items = ads_blob_read(ads, policies.max_num_work_items);
@@ -1031,7 +1024,5 @@ int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads)
 	else
 		policies->global_flags &= ~GLOBAL_POLICY_DISABLE_ENGINE_RESET;
 
-	ret = guc_ads_update_policies(ads, policies);
-	kfree(policies);
-	return ret;
+	return guc_ads_action_update_policies(ads, xe_guc_buf_flush(buf));
 }
-- 
2.47.1

