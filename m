Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71778C43458
	for <intel-xe@archiver.kernel.org>; Thu,  2 Jul 2026 09:16:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35C5A10F259;
	Thu,  2 Jul 2026 09:16:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C1BB+l1x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCD3210F259
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Jul 2026 09:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782983794; x=1814519794;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6vOw0f78hkthYfyCUMj5oQEO9/gbO3mDw358WYu4eHA=;
 b=C1BB+l1xkEoUcZ7pUkXerF1zc8zyyEOAK+y7uTisGe18RvJscgwrrVyi
 dn6F+dWT3ou2yU4JfSYb4UxThOSB6nAn0DdEJno5YTwiPeGcCAvVyASlK
 K/Sbk8Skpk3vq4hzB0oeO6gq68pG0kKDjD+aCXWgVuKw96CVUxvFkiUkX
 /ITqjzxVv2ZAL8QZpRCzmELkGfRhu1JwdYmJcDJ7CbrzZ+ZuPGL/Moj6q
 +KRWKHik7FH4iRWBRbihM7M3P/2DqaWQzbhBMj9ZhE3wk6qZZ4EBLq/SQ
 Ft8E9eLjpv0xHvZKoXqQ4xjHByqla4NCnSeT5IRYoJ5VFsU6AlhFTm8u0 Q==;
X-CSE-ConnectionGUID: 3SvNX5SxQZ6JxTqwE5znXg==
X-CSE-MsgGUID: +Lb5/9iaQUK4DIqWZbChgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="82721015"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; d="scan'208";a="82721015"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2026 02:16:34 -0700
X-CSE-ConnectionGUID: oKb+83ehQ1SL5wC4u65Mvw==
X-CSE-MsgGUID: +e3bfS3hT3CDUWBHC4GblA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; d="scan'208";a="251082048"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2026 02:16:30 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 michael.j.ruhl@intel.com, matthew.d.roper@intel.com,
 soham.purkait@intel.com, michal.wajdeczko@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v5 2/2] drm/xe/debugfs: Add debugfs for pcode information
Date: Thu,  2 Jul 2026 14:55:40 +0530
Message-Id: <20260702092540.1005095-3-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260702092540.1005095-1-karthik.poosa@intel.com>
References: <20260702092540.1005095-1-karthik.poosa@intel.com>
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

Introduce a pcode_info debugfs entry to report pcode details.
This initial implementation exposes the pcode version.
This can aid debugging when the pcode version is needed.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---

v2:
 - Enable the debugfs only for supported platforms. (Micheal Ruhl)

v3:
 - Move the platform check out of this patch, as it is not relevant here.
   This patch solely enables debugfs; debugfs creation will be determined
   based on the return value of get_pcode_version. (Karthik)

v4:
 - Skip creating debugfs entries for SR-IOV VFs, as this is not
   supported. (Matt)
 - Reintroduce the platform check during debugfs creation to prevent
   creating debugfs on unsupported platforms.

v5:
 - Address review comments from Michal.
 - Remove a redudant warning log.
 - Use %u instead of %d for version print.

 drivers/gpu/drm/xe/xe_debugfs.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 3c018dbccc07..8c391c7b017a 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -21,6 +21,7 @@
 #include "xe_guc_ads.h"
 #include "xe_hw_engine.h"
 #include "xe_mmio.h"
+#include "xe_pcode.h"
 #include "xe_pm.h"
 #include "xe_psmi.h"
 #include "xe_pxp_debugfs.h"
@@ -160,6 +161,22 @@ static int workaround_info(struct seq_file *m, void *data)
 	return 0;
 }
 
+static int pcode_info(struct seq_file *m, void *data)
+{
+	struct xe_device *xe = node_to_xe(m->private);
+	struct drm_printer p = drm_seq_file_printer(m);
+	struct xe_pcode_version version;
+	int ret = 0;
+
+	ret = xe_get_pcode_version(xe, &version);
+	if (ret)
+		return ret;
+
+	drm_printf(&p, "pcode version: %u.%u.%u\n", version.major,
+		   version.minor, version.engg);
+	return 0;
+}
+
 static int dgfx_pkg_residencies_show(struct seq_file *m, void *data)
 {
 	struct xe_device *xe;
@@ -220,6 +237,10 @@ static const struct drm_info_list debugfs_list[] = {
 	{ .name = "workarounds", .show = workaround_info, },
 };
 
+static const struct drm_info_list pcode_info_debugfs[] = {
+	{ .name = "pcode_info", .show = pcode_info, },
+};
+
 static const struct drm_info_list debugfs_residencies[] = {
 	{ .name = "dgfx_pkg_residencies", .show = dgfx_pkg_residencies_show, },
 	{ .name = "dgfx_pcie_link_residencies", .show = dgfx_pcie_link_residencies_show, },
@@ -566,6 +587,18 @@ void xe_debugfs_register(struct xe_device *xe)
 					  &inject_csc_hw_error);
 	}
 
+	/*
+	 * Pcode version read from PMT is currently only supported on CRI and BMG platforms in PF
+	 * mode, as both platforms support the necessary telemetry read mechanism and have a fixed
+	 * PUNIT_VERSION_OFFSET.
+	 * Attempting this access on other platforms must be verified before enabling support.
+	 */
+	if (!IS_SRIOV_VF(xe) &&
+	    (xe->info.platform == XE_CRESCENTISLAND || xe->info.platform == XE_BATTLEMAGE))
+		drm_debugfs_create_files(pcode_info_debugfs,
+					 ARRAY_SIZE(pcode_info_debugfs),
+					 root, minor);
+
 	debugfs_create_file("forcewake_all", 0400, root, xe,
 			    &forcewake_all_fops);
 
-- 
2.25.1

