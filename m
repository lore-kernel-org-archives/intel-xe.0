Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4DD8CD98F6
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jun 2026 11:31:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6422110F54A;
	Fri, 19 Jun 2026 11:31:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UEXbxlxS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A44E10F54A
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jun 2026 11:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781868666; x=1813404666;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0p9Jhvuzz6NAZkA0qkRPWM1XRHSLHUHtbX2YVSwvxfI=;
 b=UEXbxlxS3W3DMzZxeAa6UdHQMqB5WeWFwEWqIVg1w/M+2dQALwnsw3xb
 5nPEKUUFFRizQD2MKQt7cjz8Ltif58CYDLNwWnzG3ZhRL/wxoF628df+0
 0TtEWYDui8AjiM37bH+ljHJYJx7a1bY/rvQ2/vy/zUoyWonzD3BV0+T0O
 UnfIqeiEM/txo/1FsFy2Rby6XeT44Rfwqo/BIcz7fVa3T558CbhQh9h3k
 UtBcCB5C6oCWvy+L0kNMJ+HPh6v0frfEuYVIOFXzsFmUYLIDqv0ZYu8bQ
 oPRbD9hWEpxkbllxn5jfuun6p1+AWTPGSRYC8sjvyOx2/dPMgwa5KaI1X A==;
X-CSE-ConnectionGUID: Of4hADbwTSWZAvzxEblJvQ==
X-CSE-MsgGUID: eQnlsUlrRa6U7hgJAVcQ6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11821"; a="81822755"
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; d="scan'208";a="81822755"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 04:31:05 -0700
X-CSE-ConnectionGUID: FPnfo4GQQn6IeQEX1tedJw==
X-CSE-MsgGUID: Un0mioW8SciKEp35jxsIZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; d="scan'208";a="247470160"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 04:31:03 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 michael.j.ruhl@intel.com, matthew.d.roper@intel.com,
 soham.purkait@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v4 2/2] drm/xe/debugfs: Add debugfs for pcode information
Date: Fri, 19 Jun 2026 17:10:18 +0530
Message-Id: <20260619114018.667995-3-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260619114018.667995-1-karthik.poosa@intel.com>
References: <20260619114018.667995-1-karthik.poosa@intel.com>
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

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c | 34 +++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 22b471303984..cafe3deb04d5 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -31,6 +31,7 @@
 #include "xe_tile_debugfs.h"
 #include "xe_vsec.h"
 #include "xe_wa.h"
+#include "xe_pcode.h"
 
 #ifdef CONFIG_DRM_XE_DEBUG
 #include "xe_bo_evict.h"
@@ -161,6 +162,23 @@ static int workaround_info(struct seq_file *m, void *data)
 	return 0;
 }
 
+static int pcode_info(struct seq_file *m, void *data)
+{
+	struct xe_device *xe = node_to_xe(m->private);
+	struct drm_printer p = drm_seq_file_printer(m);
+	struct pcode_version version;
+	int ret = 0;
+
+	ret = get_pcode_version(xe, &version);
+	if (ret) {
+		drm_warn(&xe->drm, "couldn't read pcode version ret %d\n", ret);
+		return ret;
+	}
+	drm_printf(&p, "pcode version: %d.%d.%d\n", version.major,
+		   version.minor, version.engg);
+	return 0;
+}
+
 static int dgfx_pkg_residencies_show(struct seq_file *m, void *data)
 {
 	struct xe_device *xe;
@@ -221,6 +239,10 @@ static const struct drm_info_list debugfs_list[] = {
 	{ .name = "workarounds", .show = workaround_info, },
 };
 
+static const struct drm_info_list pcode_info_debugfs[] = {
+	{ .name = "pcode_info", .show = pcode_info, },
+};
+
 static const struct drm_info_list debugfs_residencies[] = {
 	{ .name = "dgfx_pkg_residencies", .show = dgfx_pkg_residencies_show, },
 	{ .name = "dgfx_pcie_link_residencies", .show = dgfx_pcie_link_residencies_show, },
@@ -567,6 +589,18 @@ void xe_debugfs_register(struct xe_device *xe)
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

