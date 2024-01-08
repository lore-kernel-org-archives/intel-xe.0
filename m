Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FE33C3DA6E
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jan 2024 22:58:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BED510E32A;
	Mon,  8 Jan 2024 22:58:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A288A10E32A
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jan 2024 22:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704754739; x=1736290739;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=asbPVtRNaDLZEi4J7u/cxsdxHuepfhgCbGytNwV7C38=;
 b=YX9vphz6oLwygnBnnix5uodBRz6Jvb0H7dzWjjecI1qQbC+lu69BggH4
 hBudPzIt1wkfUQQgRnSN53rmht/VbpQ0aco8m6VlgadSV0ZMBV3sCOqAt
 ZbC7+oaGe21xfgMOcY08KHk+5yIokrvcjceG4yHYL3oiZ53LDlbLSENhq
 H/1onQDiTEdPNrb3CyO5f+YzxLq/9QrERohG/nYZ6s7PZ1jKB+b/Rp91L
 TAXte7cRSFJ7Sh2lLxMPq7x2zNjYUn/sqWN2gC+eOUTmePvRAibqV/2pt
 Z+2+OA6T1EoPOSX1Y8zC5HIZ3Fl55cv0uMV5B/3yLcXE2yBVLJVojNFl4 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="11512556"
X-IronPort-AV: E=Sophos;i="6.04,181,1695711600"; d="scan'208";a="11512556"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2024 14:58:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,181,1695711600"; d="scan'208";a="29947275"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by orviesa001.jf.intel.com with ESMTP; 08 Jan 2024 14:58:57 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3] drm/xe: Check skip_guc_pc before setting SLPC flag
Date: Mon,  8 Jan 2024 14:58:42 -0800
Message-Id: <20240108225842.966066-1-vinay.belgaumkar@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Don't set SLPC GuC feature ctl flag if skip_guc_pc is true.

v2: Skip the freq related sysfs creation as well (Badal)
v3: Remove unnecessary parenthesis (Lucas)

Fixes: 975e4a3795d4 ("drm/xe: Manually setup C6 when skip_guc_pc is set")
Fixes: bef52b5c7a19 ("drm/xe: Create a xe_gt_freq component for raw management and sysfs")
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_freq.c | 3 +++
 drivers/gpu/drm/xe/xe_guc.c     | 7 ++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
index 3adfa6686e7c..e5b0f4ecdbe8 100644
--- a/drivers/gpu/drm/xe/xe_gt_freq.c
+++ b/drivers/gpu/drm/xe/xe_gt_freq.c
@@ -196,6 +196,9 @@ void xe_gt_freq_init(struct xe_gt *gt)
 	struct xe_device *xe = gt_to_xe(gt);
 	int err;
 
+	if (xe->info.skip_guc_pc)
+		return;
+
 	gt->freq = kobject_create_and_add("freq0", gt->sysfs);
 	if (!gt->freq) {
 		drm_warn(&xe->drm, "failed to add freq0 directory to %s\n",
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 311a0364bff1..6e73ebf67251 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -63,7 +63,12 @@ static u32 guc_ctl_debug_flags(struct xe_guc *guc)
 
 static u32 guc_ctl_feature_flags(struct xe_guc *guc)
 {
-	return GUC_CTL_ENABLE_SLPC;
+	u32 flags = 0;
+
+	if (!guc_to_xe(guc)->info.skip_guc_pc)
+		flags |= GUC_CTL_ENABLE_SLPC;
+
+	return flags;
 }
 
 static u32 guc_ctl_log_params_flags(struct xe_guc *guc)
-- 
2.38.1

