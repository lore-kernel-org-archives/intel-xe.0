Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8390FC27C53
	for <intel-xe@archiver.kernel.org>; Sat, 22 Jun 2024 09:43:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34FB510E034;
	Sat, 22 Jun 2024 09:43:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bqShwqR2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4ED610E034
 for <intel-xe@lists.freedesktop.org>; Sat, 22 Jun 2024 09:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719049386; x=1750585386;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vuy4CsD+gxV3UzXHAJQBWj1+tsgD6T9LYAkI3YJZbUo=;
 b=bqShwqR21kwzVWdrYWBcbaJ084vcZW1pFAQ3DpSMyWXG93x1+4JAbjDc
 iOp1uddu+FzllkBHpRnsZTEOryuuKkIRWUK8CgcBNg1wqUlJWqIYPKMY+
 D3/+wH0oRZoA2cDY5B2xmsD1vj/oyV1aRxLQnEoBqKisrRkItZccs72yR
 zWR8X3FIMvi5UQ1Y33CdVn8hYHt691AB9hzKFfioSJkmVScFAn7ubr54s
 ld9Lk/SiXTinGilgHDxybY3uJ5NQKyZV5oudkWJdPCg6a/fphoB6Nv/cm
 PF1krsyWVqAIcBOA8zXV5ovMBiIwNkhjgAr01O4RdiRrgzZPQn90rQ+CC A==;
X-CSE-ConnectionGUID: t7TuFvGSQfCbHhNkTWTwyg==
X-CSE-MsgGUID: VXOcvv9+RBeYx3IutAIUBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="16229226"
X-IronPort-AV: E=Sophos;i="6.08,257,1712646000"; d="scan'208";a="16229226"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2024 02:43:05 -0700
X-CSE-ConnectionGUID: KlV4mnnvTMuNupPqFVo8XA==
X-CSE-MsgGUID: RKP/7PLBQACaIdN3jtkKgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,257,1712646000"; d="scan'208";a="43257387"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.19.248])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2024 02:43:04 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2] drm/xe/vf: Skip attempt to start GuC PC if VF
Date: Sat, 22 Jun 2024 11:42:53 +0200
Message-Id: <20240622094253.1081-1-michal.wajdeczko@intel.com>
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

We have already marked the GuC PC feature as not applicable for
VF devices, but we missed the fact that there may be still some
privileged activities performed by this component, who does much
more than its name suggests.

Explicitly skip xe_guc_pc_start() if running as a VF driver and
use a GT oriented message to report any error.

v2: also skip xe_guc_pc_stop (Vinay)

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 172b65a50e31..eb655cee19f7 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1113,7 +1113,13 @@ void xe_guc_reset_wait(struct xe_guc *guc)
 
 void xe_guc_stop_prepare(struct xe_guc *guc)
 {
-	XE_WARN_ON(xe_guc_pc_stop(&guc->pc));
+	if (!IS_SRIOV_VF(guc_to_xe(guc))) {
+		int err;
+
+		err = xe_guc_pc_stop(&guc->pc);
+		xe_gt_WARN(guc_to_gt(guc), err, "Failed to stop GuC PC: %pe\n",
+			   ERR_PTR(err));
+	}
 }
 
 void xe_guc_stop(struct xe_guc *guc)
@@ -1125,10 +1131,13 @@ void xe_guc_stop(struct xe_guc *guc)
 
 int xe_guc_start(struct xe_guc *guc)
 {
-	int ret;
+	if (!IS_SRIOV_VF(guc_to_xe(guc))) {
+		int err;
 
-	ret = xe_guc_pc_start(&guc->pc);
-	XE_WARN_ON(ret);
+		err = xe_guc_pc_start(&guc->pc);
+		xe_gt_WARN(guc_to_gt(guc), err, "Failed to start GuC PC: %pe\n",
+			   ERR_PTR(err));
+	}
 
 	return xe_guc_submit_start(guc);
 }
-- 
2.43.0

