Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B49DEC2BD05
	for <intel-xe@archiver.kernel.org>; Fri, 21 Jun 2024 17:00:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C65D010E0A2;
	Fri, 21 Jun 2024 17:00:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XWiBkdFF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EF2510E0A2
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Jun 2024 17:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718989242; x=1750525242;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pVJo60a+UEDk5sWalvo9a7/lnAJlDQTGPJcF08n0kQM=;
 b=XWiBkdFFGxZOGBrNtY+pe7GsH7t1/6RwQvtYFDOJ2VBhM3FA9k0XqS+b
 PPeLckduyi31dqm4g4yyDoO9uAXEUJzRjW8bdoJpi/5husu/dA6IKaOQl
 YpzPn4Ha3In1Td0UXHS//BLvELPWiHvWpgMuQJUSMW5nOc4BpmShs8s6N
 s6IFKaawyF6jmClHUhPzvmja+HEiOAqDBME/72avpcVwmxGcjxaBFGx4g
 GY7AoKBwq96AtlM7wWH6o7MANKTluLTMwbVmHAkPCluRclzWb3Yv0RtwL
 aV1yy8AWJwDHOSETva8R5nyJ4aHqPjXbNL6u8UKtUexi+uMz6IVKg7M69 A==;
X-CSE-ConnectionGUID: LdPOAkqERxCHznwyEBEkhA==
X-CSE-MsgGUID: vHR143A1T7GXO3I9WXNrEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="16161667"
X-IronPort-AV: E=Sophos;i="6.08,255,1712646000"; d="scan'208";a="16161667"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 10:00:17 -0700
X-CSE-ConnectionGUID: lIwthmhPTKm9VCiRldSbyQ==
X-CSE-MsgGUID: 8ZGBG3LLR3C8l16d4G/j5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,255,1712646000"; d="scan'208";a="42744499"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.119.62])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 10:00:15 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe/vf: Skip attempt to start GuC PC if VF
Date: Fri, 21 Jun 2024 19:00:02 +0200
Message-Id: <20240621170002.993-1-michal.wajdeczko@intel.com>
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

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 172b65a50e31..79931466e479 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1125,10 +1125,13 @@ void xe_guc_stop(struct xe_guc *guc)
 
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

