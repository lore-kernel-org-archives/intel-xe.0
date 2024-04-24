Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26C03C07E8E
	for <intel-xe@archiver.kernel.org>; Wed, 24 Apr 2024 17:10:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B684610F6BB;
	Wed, 24 Apr 2024 17:10:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SbElkesn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98F3710F6BB
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Apr 2024 17:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713978640; x=1745514640;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=L28LyFWSF3uKEZoQIfszA/eMTY22+U9CO8vQ4If9BdA=;
 b=SbElkesnUMpPU0PeR98Bt04vLc8sfa0Ri/luLz7XfzrjgHYFg4V3xjcP
 LcGwj5xCOGZ69uFUUGguBVMtVhlPKEATIt+5amqS6tjNbZQVjHIRRuS5g
 yim1Ig9HffMIa6oPp1paaHgg+Ow0NIUX3P4wttQFSXhT3J+qWAsFp0o67
 UUtvcBDO3QzeAudt1wi9Ga5mPr823AQ9MCQWTUn9717l9dFLtFBFxO6je
 4r6dYHLWtQdEFLkiHwwouYrdRFwuK29lkbrYDh12VVIqj1exXFJDVRtpe
 SVh3DigDgeUEw6IQj4MAM4yZRsozzpLeqpI0iV3uMKangLA1YMAJ5VnFF A==;
X-CSE-ConnectionGUID: OTJ/vBw9SKCJeYC4th1KBg==
X-CSE-MsgGUID: MK7MmQ3+S4epJpcSjCoLuQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="9493279"
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; 
   d="scan'208";a="9493279"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 10:10:39 -0700
X-CSE-ConnectionGUID: FAohDVDzS0+ZXdmwzlNBuQ==
X-CSE-MsgGUID: hqxrrxr3RcGS33dufzCiVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; d="scan'208";a="48036532"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.252.46.168])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 10:10:38 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe/pf: Expose PF service details via debugfs
Date: Wed, 24 Apr 2024 19:10:30 +0200
Message-Id: <20240424171030.2177-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

For debug purposes we might want to verify which registers values
PF is sharing with VFs and to view which VF/PF ABI versions were
negotiated by the VFs. Plug the 'print' functions already provided
by the PF service code into our debugfs.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
index ab1a26fce3aa..5102035faa7e 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
@@ -18,6 +18,7 @@
 #include "xe_gt_sriov_pf_debugfs.h"
 #include "xe_gt_sriov_pf_helpers.h"
 #include "xe_gt_sriov_pf_policy.h"
+#include "xe_gt_sriov_pf_service.h"
 #include "xe_pm.h"
 
 /*
@@ -52,6 +53,8 @@ static unsigned int extract_vfid(struct dentry *d)
  *      │   │   ├── ggtt_provisioned
  *      │   │   ├── contexts_provisioned
  *      │   │   ├── doorbells_provisioned
+ *      │   │   ├── runtime_registers
+ *      │   │   ├── negotiated_versions
  */
 
 static const struct drm_info_list pf_info[] = {
@@ -75,6 +78,16 @@ static const struct drm_info_list pf_info[] = {
 		.show = xe_gt_debugfs_simple_show,
 		.data = xe_gt_sriov_pf_config_print_dbs,
 	},
+	{
+		"runtime_registers",
+		.show = xe_gt_debugfs_simple_show,
+		.data = xe_gt_sriov_pf_service_print_runtime,
+	},
+	{
+		"negotiated_versions",
+		.show = xe_gt_debugfs_simple_show,
+		.data = xe_gt_sriov_pf_service_print_version,
+	},
 };
 
 /*
-- 
2.43.0

