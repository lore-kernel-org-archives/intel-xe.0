Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA75DF4613A
	for <intel-xe@archiver.kernel.org>; Mon, 23 Mar 2026 15:07:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D42410E153;
	Mon, 23 Mar 2026 15:07:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N+w7WaEs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5C8410E153
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Mar 2026 15:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774278452; x=1805814452;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pyyHVrykRrys7NOPJ72dYPCTkxq6OSp2v8MAWtsOpFA=;
 b=N+w7WaEsqqMIyAKYAtjmxlw/+0dl4n98xzUTwbyqdCpJwTfFNWYiwtiJ
 V83OnUCYnH3nI5R8QWxMjF18pLoTt1Md3c47mAzoX9jMBifA29pbZsu7a
 ijcIwpnBOdTjQ17uhc7hH7GDW4PmjvunCVkarIv0olEzoYWJsnbemUOWW
 fgL8/FJxKVgEN+YB8EchlyNJWIro9o4rh8GSQ/PiLI6kg02hWri9tdXpN
 5GCueegQz1rTB34hMGNlfEnp1ay+UcMWKmuRUTmFIrwaTP/xAO707wTTP
 uYFijdS6X/NeZvZ68V1wP1ZdSC/t7WQKs66/BPTXtZftSEos8s1eLR8ev w==;
X-CSE-ConnectionGUID: 7Iz5+wU6RKeSYXtfvMOFDA==
X-CSE-MsgGUID: O7nHkDU1RUesV7mpK8O+YQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="75300013"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="75300013"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 08:07:32 -0700
X-CSE-ConnectionGUID: G6XEISkBTKKGolgn5P5WzQ==
X-CSE-MsgGUID: 8ltuv5u3QyGNgYObe3avhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="254539564"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 08:07:30 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v1 2/2] drm/xe/debugfs: Add debugfs for pcode information
Date: Mon, 23 Mar 2026 20:43:31 +0530
Message-Id: <20260323151331.4043749-3-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260323151331.4043749-1-karthik.poosa@intel.com>
References: <20260323151331.4043749-1-karthik.poosa@intel.com>
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
---
 drivers/gpu/drm/xe/xe_debugfs.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 844cfafe1ec7..3b035bfdb453 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -29,6 +29,7 @@
 #include "xe_tile_debugfs.h"
 #include "xe_vsec.h"
 #include "xe_wa.h"
+#include "xe_pcode.h"
 
 #ifdef CONFIG_DRM_XE_DEBUG
 #include "xe_bo_evict.h"
@@ -126,6 +127,23 @@ static int workaround_info(struct seq_file *m, void *data)
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
+		drm_warn(&xe->drm, "reading pcode version failed, ret %d\n", ret);
+		return -EIO;
+	}
+	drm_printf(&p, "pcode version: %d.%d.%d\n", version.major,
+		   version.minor, version.engg);
+	return 0;
+}
+
 static int dgfx_pkg_residencies_show(struct seq_file *m, void *data)
 {
 	struct xe_device *xe;
@@ -184,6 +202,7 @@ static const struct drm_info_list debugfs_list[] = {
 	{"info", info, 0},
 	{ .name = "sriov_info", .show = sriov_info, },
 	{ .name = "workarounds", .show = workaround_info, },
+	{ .name = "pcode_info", .show = pcode_info, },
 };
 
 static const struct drm_info_list debugfs_residencies[] = {
-- 
2.25.1

