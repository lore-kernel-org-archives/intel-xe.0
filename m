Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 296D1C3600C
	for <intel-xe@archiver.kernel.org>; Thu,  3 Apr 2025 14:26:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E24CE10EA32;
	Thu,  3 Apr 2025 14:26:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VNKLusLS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 526B710EA21
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Apr 2025 14:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743690409; x=1775226409;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LaEPmBaK8k3trNLFinP65JH4b0KuccXhdLvqjNwslxw=;
 b=VNKLusLStkjwbAQnDC2mhsUxDdXAZDNk5rwmTRRSohvwu7A9vZIHk1i4
 pymRyCufnLVX1xdaWTjsyb0emmPulhaGpcu14iHMu++do1TgmaiiLHkgU
 nsrWeDd7BcD+hRWPsREKxzQ+Zoe/wqhEzw3Jr21q0AC6G5dvVPYuGatqQ
 8Db4Hxo9WITzW7CSf4ycf0Jqi0BmLD5xpGUQ5O9sf431fzyVabtTpR7Bo
 ECv511kMyOmD9KrOqwJ+Us2mccfAdcrAWeXNVkRIqBx0oBEdRmRw10Bu3
 sNKSNuFU9Pk5oPlwRef8NVPvj7+Refk7EdwbgsH4QqsiQAigW7irwoMP1 A==;
X-CSE-ConnectionGUID: SQke0pidQbCxWhCOVkpb8g==
X-CSE-MsgGUID: MCTnS3KbSQCbgvKgXr2TNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="45116897"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="45116897"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 07:26:49 -0700
X-CSE-ConnectionGUID: YrByD4t2T8CJaGWMnFmbAA==
X-CSE-MsgGUID: gg1CFbpHSdi2Mvzf12CW6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="164260918"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.114.177])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 07:26:48 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 2/3] drm/xe/guc: Don't expose GuC privileged debugfs files
 if VF
Date: Thu,  3 Apr 2025 16:26:34 +0200
Message-Id: <20250403142635.1821-3-michal.wajdeczko@intel.com>
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

Some of the GuC debugfs files require access to the data that is
not available on the VFs. Don't expose those files on the VF driver.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
v2: avoid "privileged" word, make it clear it's about VF/PF (Lucas)
    add hint for developers where to add new files (Lucas)
---
 drivers/gpu/drm/xe/xe_guc_debugfs.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_debugfs.c b/drivers/gpu/drm/xe/xe_guc_debugfs.c
index 9a1c78b89f45..f33013f8a0f3 100644
--- a/drivers/gpu/drm/xe/xe_guc_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_guc_debugfs.c
@@ -103,11 +103,20 @@ static int guc_pc(struct xe_guc *guc, struct drm_printer *p)
 	return 0;
 }
 
-static const struct drm_info_list debugfs_list[] = {
+/*
+ * only for GuC debugfs files which can be safely used on the VF as well:
+ * - without access to the GuC privileged registers
+ * - without access to the PF specific GuC objects
+ */
+static const struct drm_info_list vf_safe_debugfs_list[] = {
 	{ "guc_info", .show = guc_debugfs_show, .data = xe_guc_print_info },
+	{ "guc_ctb", .show = guc_debugfs_show, .data = guc_ctb },
+};
+
+/* everything else should be added here */
+static const struct drm_info_list pf_only_debugfs_list[] = {
 	{ "guc_log", .show = guc_debugfs_show, .data = guc_log },
 	{ "guc_log_dmesg", .show = guc_debugfs_show, .data = guc_log_dmesg },
-	{ "guc_ctb", .show = guc_debugfs_show, .data = guc_ctb },
 	{ "guc_pc", .show = guc_debugfs_show, .data = guc_pc },
 };
 
@@ -115,7 +124,12 @@ void xe_guc_debugfs_register(struct xe_guc *guc, struct dentry *parent)
 {
 	struct drm_minor *minor = guc_to_xe(guc)->drm.primary;
 
-	drm_debugfs_create_files(debugfs_list,
-				 ARRAY_SIZE(debugfs_list),
+	drm_debugfs_create_files(vf_safe_debugfs_list,
+				 ARRAY_SIZE(vf_safe_debugfs_list),
 				 parent, minor);
+
+	if (!IS_SRIOV_VF(guc_to_xe(guc)))
+		drm_debugfs_create_files(pf_only_debugfs_list,
+					 ARRAY_SIZE(pf_only_debugfs_list),
+					 parent, minor);
 }
-- 
2.47.1

