Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5F24CD98CE
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jun 2026 16:46:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FAE110F035;
	Thu, 11 Jun 2026 16:46:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MbiZsMib";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D8AC10F037
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jun 2026 16:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781196415; x=1812732415;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bTokoZ9F1yXixGpp6bRfhluQcnGU8DmMdqZaQ4n9MUE=;
 b=MbiZsMib5GGJ5ehwjlnpny3hlDT7D7cITn6aAY1nZwe7y4hbwqAbnNIV
 Xf8DDA4k/Ft4YI1JChym+oukXWED23NtLC9XOPNyOyM2rvNQACmtPlVPs
 8LAl9VoxhD9qGrlwe/DSnsT7XZRK/70E8yM+OJXbCAwgLCbLiDAFq4Iw9
 byVgpzwfc2kF1vAFljwRuoqTqluOH7DawFin1BBHqvrE+l/c/+Pf83qWr
 YDJDBHGV5ATlIbWuxqQoKcnalAvPXe/8XBLhSrH2eAKwEUQjvggnbZydF
 RmAl+uJCvRKV4v8vNniRsT5kpS6ysDxpn3uUwn6cqhiSRkSu2ux0FRMIw Q==;
X-CSE-ConnectionGUID: 3B+kKx/pRo69Hwl7P9JmyQ==
X-CSE-MsgGUID: Cw/dS+TPSyibl5EK3mYwHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81150706"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; d="scan'208";a="81150706"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 09:46:55 -0700
X-CSE-ConnectionGUID: gQjzPGdXSy61fVfX9MBZtA==
X-CSE-MsgGUID: qoMLdg5CQoC3b+ZWxEeDkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; d="scan'208";a="244092023"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 09:46:52 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, soham.purkait@intel.com,
 michael.j.ruhl@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v3 2/2] drm/xe/debugfs: Add debugfs for pcode information
Date: Thu, 11 Jun 2026 22:26:07 +0530
Message-Id: <20260611165607.3653019-3-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260611165607.3653019-1-karthik.poosa@intel.com>
References: <20260611165607.3653019-1-karthik.poosa@intel.com>
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

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 22b471303984..65049916e42c 100644
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
@@ -219,6 +237,7 @@ static const struct drm_info_list debugfs_list[] = {
 	{"info", info, 0},
 	{ .name = "sriov_info", .show = sriov_info, },
 	{ .name = "workarounds", .show = workaround_info, },
+	{ .name = "pcode_info", .show = pcode_info, },
 };
 
 static const struct drm_info_list debugfs_residencies[] = {
-- 
2.25.1

