Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3EE8CD5BAF
	for <intel-xe@archiver.kernel.org>; Thu, 21 May 2026 17:40:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F69110E536;
	Thu, 21 May 2026 17:40:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jcxNeUPz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 731B710E536
 for <intel-xe@lists.freedesktop.org>; Thu, 21 May 2026 17:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779385230; x=1810921230;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7dcnf75omqf1CEe9M4OCIkT6KNOUspaPu/HIp4pe+do=;
 b=jcxNeUPzkC5hlIbZ50HOCUkzb6CkODcvHlWn0sFqLPBQB1jEqf10LEJt
 6EMWjnH8tsGo6IDpHM0QnWZb8i/l8GRI4F95i5fgcI6EalT+QeLLZXD7Q
 6mXzCage0Lf86gp4CRn2cLBuwNjZLWUIR1bkWc8dwF8Mf8p18Tat8LKHu
 Bx4becjNpwsI82p/gzH9kF1ubx1Ygx8HNF8jmyP8IqPRLNvitbCLWxERX
 rtsAEenBuet4rfeGOR485RhczryMWd4kl24p2dXXlcRnfKzGDl9pm+Os0
 BtindGZnDaoBIxUAxf//oK+Wbr7+23rtIEzkd0/G6sF6pn0UeVHk/Ss+u Q==;
X-CSE-ConnectionGUID: E2QW1R1/Qtq/rj4lPCbunQ==
X-CSE-MsgGUID: cS3t9DfZQvaJgL+cUghzWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="105772974"
X-IronPort-AV: E=Sophos;i="6.24,160,1774335600"; d="scan'208";a="105772974"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 10:40:30 -0700
X-CSE-ConnectionGUID: cnaoxJB4TWCikRcLopC4IA==
X-CSE-MsgGUID: ul9Dl2zZQBKLCCZzMqvnVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,160,1774335600"; d="scan'208";a="236346029"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 10:40:27 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, michael.j.ruhl@intel.com,
 soham.purkait@intel.com, sk.anirban@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v2 2/2] drm/xe/debugfs: Add debugfs for pcode information
Date: Thu, 21 May 2026 23:16:42 +0530
Message-Id: <20260521174642.1021590-3-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260521174642.1021590-1-karthik.poosa@intel.com>
References: <20260521174642.1021590-1-karthik.poosa@intel.com>
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

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c | 19 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_pcode.c   |  7 ++++++-
 2 files changed, 25 insertions(+), 1 deletion(-)

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
diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
index 1ebe622e947a..0b00577a995e 100644
--- a/drivers/gpu/drm/xe/xe_pcode.c
+++ b/drivers/gpu/drm/xe/xe_pcode.c
@@ -355,7 +355,12 @@ int get_pcode_version(struct xe_device *xe, struct pcode_version *version)
 {
 	int ret = 0;
 
-	ret = xe_pmt_telem_read(to_pci_dev(xe->drm.dev),
+	if (!(xe->info.platform == XE_CRESCENTISLAND || xe->info.platform == XE_BATTLEMAGE)) {
+		drm_dbg(&xe->drm, "pcode version from pmt not supported on this platform\n");
+		ret = -EOPNOTSUPP;
+	}
+
+	ret = xe_pmt_telem_read(xe->drm.dev,
 				xe_mmio_read32(xe_root_tile_mmio(xe), PUNIT_TELEMETRY_GUID),
 				(u64 *)version, PUNIT_VERSION_OFFSET, sizeof(*version));
 	if (ret != sizeof(*version)) {
-- 
2.25.1

