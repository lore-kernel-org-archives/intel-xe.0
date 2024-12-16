Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50405E7717F
	for <intel-xe@archiver.kernel.org>; Mon, 16 Dec 2024 19:44:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AA0810E784;
	Mon, 16 Dec 2024 19:44:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dSUPD4qf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2654710E784
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Dec 2024 19:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734378281; x=1765914281;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MfdoGVRV8krbAaFPO0os/Ds+8hYDiJIfRpcICq7DneQ=;
 b=dSUPD4qfdchTHTg7paRafcVzHx1n7uFFXFl9TmuMizQwxv6YaHA3iJ5e
 t1KzE+juaSxKXdMSrFWG5AQ4PZNn2hmDFzF601rRXdMMpPHQZwLjpvr/X
 JO+h/cUoMjzhRkG8tw/UN1aXl+SWiPiWhX88zIWYIczOu70PMSR+ay3BK
 W4R2fD1Q7BqyKO87RGyFznkfNJBx40wrVHr5mbl1Ja1UxgVI6k7dUpiP/
 PaMvg27AGbowhqVOeVIeDlO6AUZ2VkwRx6HCo1TPinOCOTvrZv/g/8Yyr
 j2+z0gucOw0S3N/YniUOG1BocwhRj0jlpQ7na2cPWtYTpVG1yVJpx+HNC Q==;
X-CSE-ConnectionGUID: 250ZkeDtRLCYo9zNRsev/Q==
X-CSE-MsgGUID: R5wLPMVhTHmvNNy3dFqBzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45269240"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="45269240"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 11:44:41 -0800
X-CSE-ConnectionGUID: bDMC0azhRG20fZBNbrTXMQ==
X-CSE-MsgGUID: JYtpb4ICRXO+wC5OwVb56w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="134633124"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.141])
 by orviesa001.jf.intel.com with ESMTP; 16 Dec 2024 11:44:41 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH] drm/xe/slpc: Remove unnecessary force wakes
Date: Mon, 16 Dec 2024 11:41:19 -0800
Message-Id: <20241216194119.3017792-1-vinay.belgaumkar@intel.com>
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

FORCEWAKE_ALL is not needed when we are trying to read the cur_freq,
we just need to wake up the GT domain. We also do not need a force wake
to for a H2G query to obtain min frequency.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 26 +++++++-------------------
 1 file changed, 7 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index e8b9faeaef64..5f9828ffc19c 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -421,8 +421,8 @@ int xe_guc_pc_get_cur_freq(struct xe_guc_pc *pc, u32 *freq)
 	 * GuC SLPC plays with cur freq request when GuCRC is enabled
 	 * Block RC6 for a more reliable read.
 	 */
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FW_GT)) {
 		xe_force_wake_put(gt_to_fw(gt), fw_ref);
 		return -ETIMEDOUT;
 	}
@@ -481,10 +481,10 @@ u32 xe_guc_pc_get_rpn_freq(struct xe_guc_pc *pc)
  */
 int xe_guc_pc_get_min_freq(struct xe_guc_pc *pc, u32 *freq)
 {
-	struct xe_gt *gt = pc_to_gt(pc);
-	unsigned int fw_ref;
 	int ret;
 
+	xe_device_assert_mem_access(pc_to_xe(pc));
+
 	mutex_lock(&pc->freq_lock);
 	if (!pc->freq_ready) {
 		/* Might be in the middle of a gt reset */
@@ -492,24 +492,12 @@ int xe_guc_pc_get_min_freq(struct xe_guc_pc *pc, u32 *freq)
 		goto out;
 	}
 
-	/*
-	 * GuC SLPC plays with min freq request when GuCRC is enabled
-	 * Block RC6 for a more reliable read.
-	 */
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
-		ret = -ETIMEDOUT;
-		goto fw;
-	}
-
 	ret = pc_action_query_task_state(pc);
 	if (ret)
-		goto fw;
+		goto out;
 
 	*freq = pc_get_min_freq(pc);
 
-fw:
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 out:
 	mutex_unlock(&pc->freq_lock);
 	return ret;
@@ -969,8 +957,8 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
 
 	xe_gt_assert(gt, xe_device_uc_enabled(xe));
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FW_GT)) {
 		xe_force_wake_put(gt_to_fw(gt), fw_ref);
 		return -ETIMEDOUT;
 	}
-- 
2.38.1

