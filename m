Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51A24C74A5B
	for <intel-xe@archiver.kernel.org>; Fri, 17 Mar 2023 22:35:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23BDF10E288;
	Fri, 17 Mar 2023 22:35:34 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0E5210E288
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Mar 2023 22:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679092533; x=1710628533;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=a89vWkq2V6sfbYIIK9uzennIj4hOCvYM6ojuIK1YCUQ=;
 b=cp4lX6EUIO/evulv714VdWssAwty5o8PcbyPgz2iu4eyGLNSZ8G13Qc/
 lyQlmLf7k+VPEjd4y9wBKOH0umspFSfYsTSZRqLufbTA6b4yqkLwmUjUj
 yuAmg6/qxEiOCIWIWG5uke+aE5DKTunIvk9oHorkeqQRWskFXDfCr6ZdM
 /Q28WwkapPqazonO67FVCUCVYEX2mlwFB3wPyY0C9bzEzYUy9Qd+CwI2S
 8v7adp6q8sn0P8nRg86id3ybps4fK8CkuyAFTdEU7gJPRpazq/bXTP2fa
 5uLJKLlpX743VbWi/GPGCF6yAF5YwChllKV0oMuT2ITSyQnJ/qbaNgs0/ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="400953654"
X-IronPort-AV: E=Sophos;i="5.98,270,1673942400"; d="scan'208";a="400953654"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2023 15:35:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="712903650"
X-IronPort-AV: E=Sophos;i="5.98,270,1673942400"; d="scan'208";a="712903650"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2023 15:35:19 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 17 Mar 2023 15:34:41 -0700
Message-Id: <20230317223441.3891073-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/mcr: Separate version from engine type
 selection
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

In order to improve readability and make it more future proof,
split the engine type from the graphics/platform checks.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---

Easier to see the code move with no behavior change with:

	git show --ignore-space-change

	
 drivers/gpu/drm/xe/xe_gt_mcr.c | 32 +++++++++++++++++---------------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
index 909059112179..5412f77bc26f 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
@@ -290,22 +290,24 @@ void xe_gt_mcr_init(struct xe_gt *gt)
 		drm_WARN_ON(&xe->drm, MEDIA_VER(xe) < 13);
 
 		gt->steering[OADDRM].ranges = xelpmp_oaddrm_steering_table;
-	} else if (GRAPHICS_VERx100(xe) >= 1270) {
-		gt->steering[INSTANCE0].ranges = xelpg_instance0_steering_table;
-		gt->steering[L3BANK].ranges = xelpg_l3bank_steering_table;
-		gt->steering[DSS].ranges = xelpg_dss_steering_table;
-	} else if (xe->info.platform == XE_PVC) {
-		gt->steering[INSTANCE0].ranges = xehpc_instance0_steering_table;
-		gt->steering[DSS].ranges = xehpc_dss_steering_table;
-	} else if (xe->info.platform == XE_DG2) {
-		gt->steering[L3BANK].ranges = xehp_l3bank_steering_table;
-		gt->steering[MSLICE].ranges = xehp_mslice_steering_table;
-		gt->steering[LNCF].ranges = xehp_lncf_steering_table;
-		gt->steering[DSS].ranges = xehp_dss_steering_table;
-		gt->steering[IMPLICIT_STEERING].ranges = dg2_implicit_steering_table;
 	} else {
-		gt->steering[L3BANK].ranges = xelp_l3bank_steering_table;
-		gt->steering[DSS].ranges = xelp_dss_steering_table;
+		if (GRAPHICS_VERx100(xe) >= 1270) {
+			gt->steering[INSTANCE0].ranges = xelpg_instance0_steering_table;
+			gt->steering[L3BANK].ranges = xelpg_l3bank_steering_table;
+			gt->steering[DSS].ranges = xelpg_dss_steering_table;
+		} else if (xe->info.platform == XE_PVC) {
+			gt->steering[INSTANCE0].ranges = xehpc_instance0_steering_table;
+			gt->steering[DSS].ranges = xehpc_dss_steering_table;
+		} else if (xe->info.platform == XE_DG2) {
+			gt->steering[L3BANK].ranges = xehp_l3bank_steering_table;
+			gt->steering[MSLICE].ranges = xehp_mslice_steering_table;
+			gt->steering[LNCF].ranges = xehp_lncf_steering_table;
+			gt->steering[DSS].ranges = xehp_dss_steering_table;
+			gt->steering[IMPLICIT_STEERING].ranges = dg2_implicit_steering_table;
+		} else {
+			gt->steering[L3BANK].ranges = xelp_l3bank_steering_table;
+			gt->steering[DSS].ranges = xelp_dss_steering_table;
+		}
 	}
 
 	/* Select non-terminated steering target for each type */
-- 
2.39.0

