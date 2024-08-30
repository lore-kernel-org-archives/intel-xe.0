Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 680E5CA0EE0
	for <intel-xe@archiver.kernel.org>; Fri, 30 Aug 2024 05:05:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EA4710E7C7;
	Fri, 30 Aug 2024 05:05:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TIyo1H51";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F0E510E7C7
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Aug 2024 05:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724994346; x=1756530346;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/OaDPxHkwVKxyBzB6O6Q6OUjdnb9j/5ipn1b1lQ43OI=;
 b=TIyo1H51XcqUuLrKEk2ULfWm0bc8n/7NtaRSqhnhKgwyT/EH3xGSuIth
 TZEINXDHQTckNdHCoQAROxmw5BwGXaqVN1zbRExixJMrFw/FMYpb25O8k
 qBwR11M+ovs0vo0qUi2MxA/EmimEwpnpL9Axqfaor+90gNCQNxz/fNBNd
 Vbzscak+c8cWNGmbbf+sFcNFMq+j19/JFsuiqkG3BZrAlkA4H/t41PC+Z
 9PCxKnlUiWTG9R2hBXn6b9+hdLsYFRwSyUInPZMcJqsSJ6s7bkI1C9qTW
 mKvc4FxBAcfUnDqivQ0y7qJIw6Ws+pmlH4WQuiPHpgQ0RIfNVQ2TOEJzk w==;
X-CSE-ConnectionGUID: P0WSGVOdRtmY3uTab+Z0ew==
X-CSE-MsgGUID: XM97fFrGQg2t8ewUZ6imNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="49006482"
X-IronPort-AV: E=Sophos;i="6.10,187,1719903600"; d="scan'208";a="49006482"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 22:05:46 -0700
X-CSE-ConnectionGUID: aYqNuLgITb2r+lHlPypGiQ==
X-CSE-MsgGUID: afjQvr+vQaO/YE8/D1ELuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,187,1719903600"; d="scan'208";a="101301981"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa001.jf.intel.com with ESMTP; 29 Aug 2024 22:05:43 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [RFC 3/9] drm/xe/gsc: call xe_force_wake_put() only if
 xe_force_wake_get() succeeds
Date: Fri, 30 Aug 2024 10:53:20 +0530
Message-Id: <20240830052326.3707019-4-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240830052326.3707019-1-himal.prasad.ghimiray@intel.com>
References: <20240830052326.3707019-1-himal.prasad.ghimiray@intel.com>
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

A failure in xe_force_wake_get() no longer increments the domain's
refcount, so xe_force_wake_put() should not be called in such cases.

Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_gsc.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
index 8a137cb83318..99e946c8cdcd 100644
--- a/drivers/gpu/drm/xe/xe_gsc.c
+++ b/drivers/gpu/drm/xe/xe_gsc.c
@@ -258,10 +258,11 @@ static int gsc_upload_and_init(struct xe_gsc *gsc)
 {
 	struct xe_gt *gt = gsc_to_gt(gsc);
 	struct xe_tile *tile = gt_to_tile(gt);
+	int fw_get_fail = 0;
 	int ret;
 
 	if (XE_WA(tile->primary_gt, 14018094691)) {
-		ret = xe_force_wake_get(gt_to_fw(tile->primary_gt), XE_FORCEWAKE_ALL);
+		fw_get_fail = xe_force_wake_get(gt_to_fw(tile->primary_gt), XE_FORCEWAKE_ALL);
 
 		/*
 		 * If the forcewake fails we want to keep going, because the worst
@@ -269,7 +270,7 @@ static int gsc_upload_and_init(struct xe_gsc *gsc)
 		 * which is not fatal. We still throw a warning so the issue is
 		 * seen if it happens.
 		 */
-		xe_gt_WARN_ON(tile->primary_gt, ret);
+		xe_gt_WARN_ON(tile->primary_gt, fw_get_fail);
 
 		xe_gt_mcr_multicast_write(tile->primary_gt,
 					  EU_SYSTOLIC_LIC_THROTTLE_CTL_WITH_LOCK,
@@ -278,7 +279,7 @@ static int gsc_upload_and_init(struct xe_gsc *gsc)
 
 	ret = gsc_upload(gsc);
 
-	if (XE_WA(tile->primary_gt, 14018094691))
+	if (!fw_get_fail && XE_WA(tile->primary_gt, 14018094691))
 		xe_force_wake_put(gt_to_fw(tile->primary_gt), XE_FORCEWAKE_ALL);
 
 	if (ret)
@@ -347,6 +348,7 @@ static void gsc_work(struct work_struct *work)
 	struct xe_gsc *gsc = container_of(work, typeof(*gsc), work);
 	struct xe_gt *gt = gsc_to_gt(gsc);
 	struct xe_device *xe = gt_to_xe(gt);
+	int fw_get_fail;
 	u32 actions;
 	int ret;
 
@@ -356,7 +358,8 @@ static void gsc_work(struct work_struct *work)
 	spin_unlock_irq(&gsc->lock);
 
 	xe_pm_runtime_get(xe);
-	xe_gt_WARN_ON(gt, xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC));
+	fw_get_fail = xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC);
+	xe_gt_WARN_ON(gt, fw_get_fail);
 
 	if (actions & GSC_ACTION_ER_COMPLETE) {
 		ret = gsc_er_complete(gt);
@@ -376,7 +379,8 @@ static void gsc_work(struct work_struct *work)
 		xe_gsc_proxy_request_handler(gsc);
 
 out:
-	xe_force_wake_put(gt_to_fw(gt), XE_FW_GSC);
+	if (!fw_get_fail)
+		xe_force_wake_put(gt_to_fw(gt), XE_FW_GSC);
 	xe_pm_runtime_put(xe);
 }
 
-- 
2.34.1

