Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01707C4828F
	for <intel-xe@archiver.kernel.org>; Sat,  3 Feb 2024 06:19:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9879510E96D;
	Sat,  3 Feb 2024 06:19:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dVvBSJHb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7293B10E8CF
 for <intel-xe@lists.freedesktop.org>; Sat,  3 Feb 2024 06:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706941143; x=1738477143;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4zNfx1PPrBH+zjb+OssMCTj4fsJA3r/fOkLfII7KP98=;
 b=dVvBSJHbUNRZ6o2/cVGas9IMvDSHW6Zkh7dDBNB8qsDgcS36kAoqLda3
 0FX1CxOKHq9V+rdKaCdVQO3UZjU1oqi4IfsGarYs5490ka8Th5beARWeJ
 FRDx4KcNftPN4YC0tLkmsv81e7+9oXQE7PDysXnC4QYQYC/weewER7i7T
 UiTBcxaYip8v+eYQ5Y3UqlmtjWpiYbe9tNO+nS6mt8tnCzfRZv80oTlQx
 bdDxscgrtk6soo5QmfBVhxzFs1seeABJQMHMP2BLHtRiKkzXpY7JxXfv8
 /PjT12h4HLjd8HBJW3P3AjNSb7y1dleMqWslvGImZtGgDY+NswG8kMc8R Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="4104077"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="4104077"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 22:19:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="4872320"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 22:19:02 -0800
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, joonas.lahtinen@linux.intel.com,
 Nirmoy Das <nirmoy.das@intel.com>
Subject: [RFC PATCH 1/2] drm/xe: Add has_wmpt GT info
Date: Sat,  3 Feb 2024 07:05:33 +0100
Message-ID: <20240203060534.6839-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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

Add a GT info member to reflect wmtp feature status.

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_types.h  |  2 ++
 drivers/gpu/drm/xe/xe_hw_engine.c | 15 +++++++++++----
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 70c615dd1498..2f2fa00c1a04 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -119,6 +119,8 @@ struct xe_gt {
 		u64 __engine_mask;
 		/** @info.gmdid: raw GMD_ID value from hardware */
 		u32 gmdid;
+		/** @has_wmtp: gt supports mid-thread preemption */
+		bool has_wmtp;
 	} info;
 
 	/**
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 0d17e32d70c8..82424e5d6033 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -319,14 +319,11 @@ static bool xe_hw_engine_match_fixed_cslice_mode(const struct xe_gt *gt,
 static bool xe_rtp_cfeg_wmtp_disabled(const struct xe_gt *gt,
 				      const struct xe_hw_engine *hwe)
 {
-	if (GRAPHICS_VER(gt_to_xe(gt)) < 20)
-		return false;
-
 	if (hwe->class != XE_ENGINE_CLASS_COMPUTE &&
 	    hwe->class != XE_ENGINE_CLASS_RENDER)
 		return false;
 
-	return xe_mmio_read32(hwe->gt, XEHP_FUSE4) & CFEG_WMTP_DISABLE;
+	return !gt->info.has_wmtp;
 }
 
 void
@@ -671,6 +668,15 @@ static void read_compute_fuses(struct xe_gt *gt)
 		read_compute_fuses_from_dss(gt);
 }
 
+static void read_wmpt_fuses(struct xe_gt *gt)
+{
+	if (GRAPHICS_VER(gt_to_xe(gt)) < 20)
+		return;
+
+	gt->info.has_wmtp = !(xe_mmio_read32(gt, XEHP_FUSE4) &
+			    CFEG_WMTP_DISABLE);
+}
+
 static void check_gsc_availability(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
@@ -696,6 +702,7 @@ int xe_hw_engines_init_early(struct xe_gt *gt)
 	read_media_fuses(gt);
 	read_copy_fuses(gt);
 	read_compute_fuses(gt);
+	read_wmpt_fuses(gt);
 	check_gsc_availability(gt);
 
 	BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT < XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN);
-- 
2.42.0

