Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E57AC3ABD8
	for <intel-xe@archiver.kernel.org>; Fri, 16 May 2025 14:19:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4252C10EAD9;
	Fri, 16 May 2025 14:19:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kO2ujToW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C261710EAD9
 for <intel-xe@lists.freedesktop.org>; Fri, 16 May 2025 14:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747405159; x=1778941159;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LDopPRHlh4DqnUvH5kMvo3YH2/y3ZIwyvFX79iOvb6s=;
 b=kO2ujToWkX6cvQdiBSZMQ/Uv1+eAey5UH9LxSCw2beOxg/xDmygBpTkM
 VGqClGEGLxGGxRahaHkfYVEko90paspnOd9UHtKNTXK8c4H5mw0aY0+Fy
 IgXAJ9S/v39vribBEwKcTEAsirBY8ci/FAuUYBZwSTdgOVr2FwwS//BST
 1/pem+PGbtUQ7q6HpwiXgX7KooW4Vcfa3OsmAZ4vl6sSCynqSOT9DGF69
 whS13eSN9PNkC1dbDfzheuWWwZnweNTH0LuiaFSQv6vd5Gyfd7YI11+ny
 jCZt6W7XPQwtRoLaDc3TNR8ONA/jLAnJ0NS0A+jrbWJw7Q6fvbg1N+nyn A==;
X-CSE-ConnectionGUID: I9iDwAF/S6avcqalafXk+A==
X-CSE-MsgGUID: zagLxKaNQfWdL3LlQvaQdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="49254201"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; d="scan'208";a="49254201"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 07:19:19 -0700
X-CSE-ConnectionGUID: P9/HxjqmSPqv/3Wof0vU3A==
X-CSE-MsgGUID: UrNdKtMRQoiEc9RPvnaNeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; d="scan'208";a="138448660"
Received: from dut2140ptlh.iind.intel.com (HELO DUT2104BMGFRD..)
 ([10.190.232.57])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 07:19:16 -0700
From: Aradhya Bhatia <aradhya.bhatia@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: Intel XE List <intel-xe@lists.freedesktop.org>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Stuart Summers <stuart.summers@intel.com>,
 Aradhya Bhatia <aradhya.bhatia@intel.com>
Subject: [PATCH v2] drm/xe/guc: Make creation of SLPC debugfs files conditional
Date: Fri, 16 May 2025 14:19:02 +0000
Message-ID: <20250516141902.5614-1-aradhya.bhatia@intel.com>
X-Mailer: git-send-email 2.45.2
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

Platforms that do not support SLPC are exempted from the GuC PC support.
The GuC PC does not get initialized, and neither do its BOs get created.

This causes a problem because the GuC PC debugfs file is still being
created. Whenever the file is attempted to read, it causes a NULL
pointer dereference on the supposed BO of the GuC PC.

So, make the creation of SLPC debugfs files conditional to when SLPC
features are supported.

Fixes: aaab5404b16f ("drm/xe: Introduce GuC PC debugfs")
Suggested-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
Reviewed-by: Stuart Summers <stuart.summers@intel.com>
Signed-off-by: Aradhya Bhatia <aradhya.bhatia@intel.com>
---
Changes in v2:
  - Add Fixes tag. (Tejas, Stuart)
  - Add R-b tags from Tejas Upadhyay, and Stuart Summers.

---
 drivers/gpu/drm/xe/xe_guc_debugfs.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_debugfs.c b/drivers/gpu/drm/xe/xe_guc_debugfs.c
index f33013f8a0f3..0b102ab46c4d 100644
--- a/drivers/gpu/drm/xe/xe_guc_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_guc_debugfs.c
@@ -113,23 +113,34 @@ static const struct drm_info_list vf_safe_debugfs_list[] = {
 	{ "guc_ctb", .show = guc_debugfs_show, .data = guc_ctb },
 };
 
+/* For GuC debugfs files that require the SLPC support */
+static const struct drm_info_list slpc_debugfs_list[] = {
+	{ "guc_pc", .show = guc_debugfs_show, .data = guc_pc },
+};
+
 /* everything else should be added here */
 static const struct drm_info_list pf_only_debugfs_list[] = {
 	{ "guc_log", .show = guc_debugfs_show, .data = guc_log },
 	{ "guc_log_dmesg", .show = guc_debugfs_show, .data = guc_log_dmesg },
-	{ "guc_pc", .show = guc_debugfs_show, .data = guc_pc },
 };
 
 void xe_guc_debugfs_register(struct xe_guc *guc, struct dentry *parent)
 {
-	struct drm_minor *minor = guc_to_xe(guc)->drm.primary;
+	struct xe_device *xe =  guc_to_xe(guc);
+	struct drm_minor *minor = xe->drm.primary;
 
 	drm_debugfs_create_files(vf_safe_debugfs_list,
 				 ARRAY_SIZE(vf_safe_debugfs_list),
 				 parent, minor);
 
-	if (!IS_SRIOV_VF(guc_to_xe(guc)))
+	if (!IS_SRIOV_VF(xe)) {
 		drm_debugfs_create_files(pf_only_debugfs_list,
 					 ARRAY_SIZE(pf_only_debugfs_list),
 					 parent, minor);
+
+		if (!xe->info.skip_guc_pc)
+			drm_debugfs_create_files(slpc_debugfs_list,
+						 ARRAY_SIZE(slpc_debugfs_list),
+						 parent, minor);
+	}
 }

base-commit: 6d2dd85ba4eb3df89dc816c03b5bf81a470865b2
-- 
2.43.0

