Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2833CAC5B0
	for <intel-xe@archiver.kernel.org>; Tue, 23 Sep 2025 21:16:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93DDA10E1CD;
	Tue, 23 Sep 2025 21:16:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UZ+ULTsV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95B2610E0FD
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Sep 2025 21:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758662189; x=1790198189;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9i3YTScIf5ajZIrR6fEMPpwMeVMOqtkKo2tYOAyHP2w=;
 b=UZ+ULTsV+9mB2lybIg2Ewf86BuE5HeGR6weO/ZKcLQmic1hPam8ctG2F
 rpift3XAR0nmes61eGhWZlAkvtIuPBetbW0YeC0Jqt2XGrS3xTQljsMdx
 pgBO00TDomnp0XVb52jC78fiAyc8VxLaYtzrfmEM4tvqph3NOGheN4o0V
 msAGW48nyei1CS2Ms2zvT5K6M5bC1iaQE8WUESCRr72TwbaYdqvXFz5As
 O2CMhC72PQ8zOGAcLcSUlN3Db76tR6USwgXZxpGWC2rQpJVl20CVGMsid
 deSdebDgjxMXkAlJRRi3Mgv6mf3XYtr3zqLVlLORgYCAo38bz55u2mcYX g==;
X-CSE-ConnectionGUID: ViWgcmtNSHWmP/MukHzyGw==
X-CSE-MsgGUID: +W1Xd5ssRVu7/4d/VqVdFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="64592576"
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; d="scan'208";a="64592576"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 14:16:29 -0700
X-CSE-ConnectionGUID: WV0TMM3sQeC6vbgPLVt0zQ==
X-CSE-MsgGUID: WVSLMBHlTJWAdOEppXd0rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; d="scan'208";a="175989808"
Received: from pczakx-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.84.166])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 14:16:27 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 1/5] drm/xe/debugfs: Update xe_gt_topology_dump signature
Date: Tue, 23 Sep 2025 23:16:09 +0200
Message-ID: <20250923211613.193347-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250923211613.193347-1-michal.wajdeczko@intel.com>
References: <20250923211613.193347-1-michal.wajdeczko@intel.com>
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

Our debugfs helper xe_gt_debugfs_show_with_rpm() expects print()
functions to return int. New signature allows us to drop wrapper.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_debugfs.c  |  8 +-------
 drivers/gpu/drm/xe/xe_gt_topology.c | 11 +++++++++--
 drivers/gpu/drm/xe/xe_gt_topology.h |  2 +-
 3 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index b9176d4398e1..6694a38203d3 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -136,12 +136,6 @@ static int hw_engines(struct xe_gt *gt, struct drm_printer *p)
 	return ret;
 }
 
-static int topology(struct xe_gt *gt, struct drm_printer *p)
-{
-	xe_gt_topology_dump(gt, p);
-	return 0;
-}
-
 static int steering(struct xe_gt *gt, struct drm_printer *p)
 {
 	xe_gt_mcr_steering_dump(gt, p);
@@ -239,7 +233,7 @@ static int hwconfig(struct xe_gt *gt, struct drm_printer *p)
  * - without access to the PF specific data
  */
 static const struct drm_info_list vf_safe_debugfs_list[] = {
-	{ "topology", .show = xe_gt_debugfs_show_with_rpm, .data = topology },
+	{ "topology", .show = xe_gt_debugfs_show_with_rpm, .data = xe_gt_topology_dump },
 	{ "register-save-restore",
 		.show = xe_gt_debugfs_show_with_rpm, .data = register_save_restore },
 	{ "workarounds", .show = xe_gt_debugfs_show_with_rpm, .data = workarounds },
diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
index 4e61c5e39bcb..80ef3a6e0a3b 100644
--- a/drivers/gpu/drm/xe/xe_gt_topology.c
+++ b/drivers/gpu/drm/xe/xe_gt_topology.c
@@ -269,8 +269,14 @@ static const char *eu_type_to_str(enum xe_gt_eu_type eu_type)
 	return NULL;
 }
 
-void
-xe_gt_topology_dump(struct xe_gt *gt, struct drm_printer *p)
+/**
+ * xe_gt_topology_dump() - Dump GT topology into a drm printer.
+ * @gt: the &xe_gt
+ * @p: the &drm_printer
+ *
+ * Return: always 0.
+ */
+int xe_gt_topology_dump(struct xe_gt *gt, struct drm_printer *p)
 {
 	drm_printf(p, "dss mask (geometry): %*pb\n", XE_MAX_DSS_FUSE_BITS,
 		   gt->fuse_topo.g_dss_mask);
@@ -285,6 +291,7 @@ xe_gt_topology_dump(struct xe_gt *gt, struct drm_printer *p)
 	if (xe_gt_topology_report_l3(gt))
 		drm_printf(p, "L3 bank mask:        %*pb\n", XE_MAX_L3_BANK_MASK_BITS,
 			   gt->fuse_topo.l3_bank_mask);
+	return 0;
 }
 
 /*
diff --git a/drivers/gpu/drm/xe/xe_gt_topology.h b/drivers/gpu/drm/xe/xe_gt_topology.h
index 5e62f5949b7b..3ff40f44bf2a 100644
--- a/drivers/gpu/drm/xe/xe_gt_topology.h
+++ b/drivers/gpu/drm/xe/xe_gt_topology.h
@@ -23,7 +23,7 @@ struct drm_printer;
 
 void xe_gt_topology_init(struct xe_gt *gt);
 
-void xe_gt_topology_dump(struct xe_gt *gt, struct drm_printer *p);
+int xe_gt_topology_dump(struct xe_gt *gt, struct drm_printer *p);
 
 /**
  * xe_gt_topology_mask_last_dss() - Returns the index of the last DSS in a mask.
-- 
2.47.1

