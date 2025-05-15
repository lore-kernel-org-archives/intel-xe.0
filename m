Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91202C3ABC9
	for <intel-xe@archiver.kernel.org>; Thu, 15 May 2025 09:49:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5843210E028;
	Thu, 15 May 2025 09:49:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZvRNM0fH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41B2B10E028
 for <intel-xe@lists.freedesktop.org>; Thu, 15 May 2025 09:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747302571; x=1778838571;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CahS2Uwj4L0AVmWGWL9ASzrIhmvGjen+laujnXWXCZc=;
 b=ZvRNM0fHm4UyJAYQoiuS9erolkYmYG335rlLoyq1zlM1wq0S6JbJU3W6
 Of+7SxjnXrrGuUrZUSzGww3CeQrUSt9EIb0j926d8fvnoCO//lkrhkKqn
 fCEClSAL5/w9djM9otzWQc2RN6sw77L0tcHSGyNJWxYg/XHXu5ysdaG8+
 kswaHRfGvKNIgyCIobSCqtwhuu44hhTjEs0kjQ8dQ9LO03t2+PbXeWarl
 E+I7M7ESlAfDu+dRqi8TT1RnbS3DsvpU/gjb1z1r2I182o/Zg2s/A7uV/
 fUKMpfHelGDvnRu9aCxHOEGAWjMfU6kxBh/0ny1xG/+gXZzjgvJUiM/SC Q==;
X-CSE-ConnectionGUID: n4XdKiYjT0W0KWnIsyWOzg==
X-CSE-MsgGUID: dsTi6no6SDSK6np0NrKdFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="49389459"
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; d="scan'208";a="49389459"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 02:49:27 -0700
X-CSE-ConnectionGUID: +flfs8S6TsaIxQLV+KlWCQ==
X-CSE-MsgGUID: +uH0vLMESqOGu0vG3r88nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; d="scan'208";a="138819104"
Received: from dut2000adls.iind.intel.com (HELO DUT2000ADLS..)
 ([10.223.34.100])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 02:49:24 -0700
From: Aradhya Bhatia <aradhya.bhatia@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: Intel XE List <intel-xe@lists.freedesktop.org>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Aradhya Bhatia <aradhya.bhatia@intel.com>
Subject: [PATCH] drm/xe/guc: Make creation of SLPC debugfs files conditional
Date: Thu, 15 May 2025 09:49:12 +0000
Message-ID: <20250515094913.2437-1-aradhya.bhatia@intel.com>
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

Suggested-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Aradhya Bhatia <aradhya.bhatia@intel.com>
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

base-commit: 3d6670fab64cb00b5e6ed80d2517147db533faf1
-- 
2.43.0

