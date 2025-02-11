Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDE6FC021A2
	for <intel-xe@archiver.kernel.org>; Tue, 11 Feb 2025 09:50:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E93F10E649;
	Tue, 11 Feb 2025 09:50:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z6DoY1A5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DABD810E645
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Feb 2025 09:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739267400; x=1770803400;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1gILMPtqW4ItULhmjAuqZ5ydQ8AjrUEha0q72TkB+y4=;
 b=Z6DoY1A566QiIhUKVZGNvf3GDzF5iBENjjuPTMybZztuHoDPKqi2pDy8
 akxO+NECUFV+6MWE4W6J0wgLOlWluLgFq2Q9KHfmbkUtAAbZzubNvYnDG
 6mlDh3lz3CoGmGSw72QqQzFSoO7y6YhB6emPif9KneF5EtytsbMyBnnva
 o8gSsXhvFEHv6y5vXOOYNixz5XCX00x4t1SDp+tatzkhQR/mYBfIvLvBt
 59BZ5KrYF40M/LHWN3WUnY25HgebhiA7KdqFYnw3i0p4S3OQmMJ6VtqYt
 Xat0OXkefhcTcFoNVp4fHcgHmupjwyHcbMT1BW3ao4AbJ9Wr3CAwRvacA Q==;
X-CSE-ConnectionGUID: LbelQdUMTeWeUFkUUhpJvg==
X-CSE-MsgGUID: 075Pu6gTRKqAU/xer/ZPDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="50104766"
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; d="scan'208";a="50104766"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 01:50:00 -0800
X-CSE-ConnectionGUID: RlvaKeo3Q/CoAppd/0zpqQ==
X-CSE-MsgGUID: dPoXNWvBS0iflKMCdTTrXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; d="scan'208";a="112974526"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 01:49:57 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, lucas.demarchi@intel.com,
 vinay.belgaumkar@intel.com, soham.purkait@intel.com,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v6 8/8] drm/xe/pf: Enable per-function engine activity stats
Date: Tue, 11 Feb 2025 15:39:50 +0530
Message-ID: <20250211100952.322303-9-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250211100952.322303-1-riana.tauro@intel.com>
References: <20250211100952.322303-1-riana.tauro@intel.com>
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

Enable per-function engine activity stats when VF's are enabled
and disable when VF's are disabled

v2: fix commit message
    remove reset stats from pf config (Michal)

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_pci_sriov.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
index aaceee748287..0159b10b4eae 100644
--- a/drivers/gpu/drm/xe/xe_pci_sriov.c
+++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
@@ -7,6 +7,7 @@
 #include "xe_device.h"
 #include "xe_gt_sriov_pf_config.h"
 #include "xe_gt_sriov_pf_control.h"
+#include "xe_guc_engine_activity.h"
 #include "xe_pci_sriov.h"
 #include "xe_pm.h"
 #include "xe_sriov.h"
@@ -62,6 +63,20 @@ static void pf_reset_vfs(struct xe_device *xe, unsigned int num_vfs)
 			xe_gt_sriov_pf_control_trigger_flr(gt, n);
 }
 
+static void pf_engine_activity_stats(struct xe_device *xe, unsigned int num_vfs, bool enable)
+{
+	struct xe_gt *gt;
+	unsigned int id;
+	int ret = 0;
+
+	for_each_gt(gt, xe, id) {
+		ret = xe_guc_engine_activity_function_stats(&gt->uc.guc, num_vfs, enable);
+		if (ret)
+			xe_sriov_info(xe, "Failed to %s engine activity function stats (%pe)\n",
+				      str_enable_disable(enable), ERR_PTR(ret));
+	}
+}
+
 static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
 {
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
@@ -94,6 +109,9 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
 
 	xe_sriov_info(xe, "Enabled %u of %u VF%s\n",
 		      num_vfs, total_vfs, str_plural(total_vfs));
+
+	pf_engine_activity_stats(xe, num_vfs, true);
+
 	return num_vfs;
 
 failed:
@@ -117,6 +135,8 @@ static int pf_disable_vfs(struct xe_device *xe)
 	if (!num_vfs)
 		return 0;
 
+	pf_engine_activity_stats(xe, num_vfs, false);
+
 	pci_disable_sriov(pdev);
 
 	pf_reset_vfs(xe, num_vfs);
-- 
2.47.1

