Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D73A3C3600C
	for <intel-xe@archiver.kernel.org>; Thu,  3 Apr 2025 14:26:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96F2E10E9F2;
	Thu,  3 Apr 2025 14:26:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WLdS3Qcl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CAD910E9F2
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Apr 2025 14:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743690416; x=1775226416;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jfW4kJKT6mrHsjl4ajrc6zuRJWq4RxAmGV+kbsn8Xs8=;
 b=WLdS3QclEAzVvCMZKDJzG2/u6kWJ4cQqLeeqFtis5Zy19P2h6u/61JDN
 W0s/prGolaaQKVXnf+h1ZR2Y4bhFwIcw/rui5WR4ZVX67xHXldpLY2VsV
 cwOsPlGfP1igdgEayqRP9CexaWi1qkIJTgfg8vbZLQ7EGo/rXQ4YWiKyc
 Jtizl0kUpdN5tx/j19oR62wTEbzvCrXrphfwvd1TGdJwQtI54NygBrIq0
 jenqTRw2E9Bhki4nIU4opL0mZ40lfv1iwlNr3IiCd7AVakxn1XYKlpXaH
 7uoasLHROS9V0xGQXDeTqob7k8IrSkjbIG4eKOIs4sjlGvO69GHdz2y06 g==;
X-CSE-ConnectionGUID: k6Jpc58RRiqmZ69pV3CXQA==
X-CSE-MsgGUID: JOWxtAdaRzucpfjUvulbUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="45116951"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="45116951"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 07:26:55 -0700
X-CSE-ConnectionGUID: IxHaTfAkSL69MFoK1qvwZg==
X-CSE-MsgGUID: ++whr5ACTy20rkRQoTncYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="164260931"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.114.177])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 07:26:49 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 3/3] drm/xe/vf: Don't expose privileged GT debugfs files if
 VF
Date: Thu,  3 Apr 2025 16:26:35 +0200
Message-Id: <20250403142635.1821-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20250403142635.1821-1-michal.wajdeczko@intel.com>
References: <20250403142635.1821-1-michal.wajdeczko@intel.com>
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

Some of the debugfs files require access to the registers that are
not accessible to the VFs. Don't expose those files on VF drivers.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
v2: avoid "privileged" word, make it clear it's about VF/PF (Lucas)
    add hint for developers where to add new files (Lucas)
---
 drivers/gpu/drm/xe/xe_gt_debugfs.c | 30 ++++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index 2d63a69cbfa3..a88076e9cc7d 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -299,20 +299,20 @@ static int hwconfig(struct xe_gt *gt, struct drm_printer *p)
 	return 0;
 }
 
-static const struct drm_info_list debugfs_list[] = {
-	{"hw_engines", .show = xe_gt_debugfs_simple_show, .data = hw_engines},
+/*
+ * only for GT debugfs files which can be safely used on the VF as well:
+ * - without access to the GT privileged registers
+ * - without access to the PF specific data
+ */
+static const struct drm_info_list vf_safe_debugfs_list[] = {
 	{"force_reset", .show = xe_gt_debugfs_simple_show, .data = force_reset},
 	{"force_reset_sync", .show = xe_gt_debugfs_simple_show, .data = force_reset_sync},
 	{"sa_info", .show = xe_gt_debugfs_simple_show, .data = sa_info},
 	{"topology", .show = xe_gt_debugfs_simple_show, .data = topology},
-	{"steering", .show = xe_gt_debugfs_simple_show, .data = steering},
 	{"ggtt", .show = xe_gt_debugfs_simple_show, .data = ggtt},
-	{"powergate_info", .show = xe_gt_debugfs_simple_show, .data = powergate_info},
 	{"register-save-restore", .show = xe_gt_debugfs_simple_show, .data = register_save_restore},
 	{"workarounds", .show = xe_gt_debugfs_simple_show, .data = workarounds},
 	{"tunings", .show = xe_gt_debugfs_simple_show, .data = tunings},
-	{"pat", .show = xe_gt_debugfs_simple_show, .data = pat},
-	{"mocs", .show = xe_gt_debugfs_simple_show, .data = mocs},
 	{"default_lrc_rcs", .show = xe_gt_debugfs_simple_show, .data = rcs_default_lrc},
 	{"default_lrc_ccs", .show = xe_gt_debugfs_simple_show, .data = ccs_default_lrc},
 	{"default_lrc_bcs", .show = xe_gt_debugfs_simple_show, .data = bcs_default_lrc},
@@ -322,6 +322,15 @@ static const struct drm_info_list debugfs_list[] = {
 	{"hwconfig", .show = xe_gt_debugfs_simple_show, .data = hwconfig},
 };
 
+/* everything else should be added here */
+static const struct drm_info_list pf_only_debugfs_list[] = {
+	{"hw_engines", .show = xe_gt_debugfs_simple_show, .data = hw_engines},
+	{"mocs", .show = xe_gt_debugfs_simple_show, .data = mocs},
+	{"pat", .show = xe_gt_debugfs_simple_show, .data = pat},
+	{"powergate_info", .show = xe_gt_debugfs_simple_show, .data = powergate_info},
+	{"steering", .show = xe_gt_debugfs_simple_show, .data = steering},
+};
+
 void xe_gt_debugfs_register(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
@@ -345,10 +354,15 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
 	 */
 	root->d_inode->i_private = gt;
 
-	drm_debugfs_create_files(debugfs_list,
-				 ARRAY_SIZE(debugfs_list),
+	drm_debugfs_create_files(vf_safe_debugfs_list,
+				 ARRAY_SIZE(vf_safe_debugfs_list),
 				 root, minor);
 
+	if (!IS_SRIOV_VF(xe))
+		drm_debugfs_create_files(pf_only_debugfs_list,
+					 ARRAY_SIZE(pf_only_debugfs_list),
+					 root, minor);
+
 	xe_uc_debugfs_register(&gt->uc, root);
 
 	if (IS_SRIOV_PF(xe))
-- 
2.47.1

