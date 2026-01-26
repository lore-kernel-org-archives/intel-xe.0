Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5307CD1951B
	for <intel-xe@archiver.kernel.org>; Mon, 26 Jan 2026 23:10:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08C0210E08E;
	Mon, 26 Jan 2026 23:10:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q0EhiZRm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 032EF10E08E
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Jan 2026 23:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769469022; x=1801005022;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xc/E2JiMl9YCELlCpoZy1n6JLyQixsIpRTXhPc3joy0=;
 b=Q0EhiZRmzHM5VxUmgA6DGQjAIjGxI+Z22kunbdC/j3fWEOvmWTaQUkFF
 gtO0Z1p+C0r3Fn6NalkQO+UiulzClkxk4gmco1eeHVvLsXCXw3kC2Vfv7
 s5HNmPYYbua1c4mrIAqPT5kmUgMPEshcNTxZl2aVbJB1gHYsjBngkgW3A
 EAFLViiamDgRfuydsCbxgQCyX0XR2xLtDjD6UZTMqoSCxrescrqqTkhw7
 Prbu1SyCsXsSl8A53dRTJBX1y+oQQfW0gDCnaZPPJfARJjZuUiY548J48
 sIBcIoVn/9j5NK69w3E2X0RBXeS9JurWxBjETZFNtlI3O61H8AFqLglVk w==;
X-CSE-ConnectionGUID: /vAanZNNS7uY+MQqrQ9XbQ==
X-CSE-MsgGUID: oTLnVZ8WQriv++RT0EhpsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="70714138"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="70714138"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2026 15:10:21 -0800
X-CSE-ConnectionGUID: fbTAyZFfTaGOKwap8o8sxw==
X-CSE-MsgGUID: tcQMvCnjT6GV3pwPCXWavg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="207830851"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2026 15:10:21 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 George D Sworo <george.d.sworo@intel.com>
Subject: [PATCH] drm/xe/guc: Fix CFI violation in debugfs access.
Date: Mon, 26 Jan 2026 15:10:12 -0800
Message-ID: <20260126231011.3834087-2-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
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

xe_guc_print_info is void-returning, but the function pointer it is
assigned to expects an int-returning function, leading to the following
CFI error:

[  206.873690] CFI failure at guc_debugfs_show+0xa1/0xf0 [xe]
(target: xe_guc_print_info+0x0/0x370 [xe]; expected type: 0xbe3bc66a)

Fix this by using a local int-returning function, like we do for the
other debugfs entries in the same file.

Fixes: e15826bb3c2c ("drm/xe/guc: Refactor GuC debugfs initialization")
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: George D Sworo <george.d.sworo@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_debugfs.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_debugfs.c b/drivers/gpu/drm/xe/xe_guc_debugfs.c
index 2f23119686d4..1a4c940ebecb 100644
--- a/drivers/gpu/drm/xe/xe_guc_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_guc_debugfs.c
@@ -74,6 +74,12 @@ static int guc_debugfs_show(struct seq_file *m, void *data)
 	return print(&gt->uc.guc, &p);
 }
 
+static int guc_info(struct xe_guc *guc, struct drm_printer *p)
+{
+	xe_guc_print_info(guc, p);
+	return 0;
+}
+
 static int guc_log(struct xe_guc *guc, struct drm_printer *p)
 {
 	xe_guc_log_print(&guc->log, p);
@@ -110,7 +116,7 @@ static int guc_pc(struct xe_guc *guc, struct drm_printer *p)
  * - without access to the PF specific GuC objects
  */
 static const struct drm_info_list vf_safe_debugfs_list[] = {
-	{ "guc_info", .show = guc_debugfs_show, .data = xe_guc_print_info },
+	{ "guc_info", .show = guc_debugfs_show, .data = guc_info },
 	{ "guc_ctb", .show = guc_debugfs_show, .data = guc_ctb },
 };
 
-- 
2.43.0

