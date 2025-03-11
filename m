Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CDF3C2BA1B
	for <intel-xe@archiver.kernel.org>; Tue, 11 Mar 2025 06:56:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D93B310E514;
	Tue, 11 Mar 2025 06:56:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OZoLnTrK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35B5510E514
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Mar 2025 06:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741676214; x=1773212214;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oNOgLS+/r1cej0G7tygJG18BrRpsX2LL+QsQQbHO+xE=;
 b=OZoLnTrKCM1zB3ShzwXOURMSOdzThn50dtJQrR+6a+ugqTNEmHpIdLd6
 YSyBrMpemNgSov92NAHwZZT4Z0RHVWSBjq/CPsgu2mch9a2Gik+d2/xmt
 QnOhq/bK5cDYfaWfiOFC9+NOiO/wjXCcf0DCxQnKVHOjs1aHodwEDCsmi
 iHoHuQzplEJ+eKYXUM6964IRalUkchybuxwkfIVsX0mRif2BtMBmrWRcm
 vRc55do8u7i/SCHAdhwbiTUHIsCTMmU1FT9FlnGvf8TdtNRBsvYLI8slj
 1Xa6oV4vah5kCdLXJ/Pkq3OcG+SAA46QWAl+hiQU/o781ghlZUsHeWH1T A==;
X-CSE-ConnectionGUID: W5dcGVVBQ9KT/WI/NWLOiA==
X-CSE-MsgGUID: ziLa+fGMQGetL3zebAJUdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="42415280"
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; d="scan'208";a="42415280"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 23:56:54 -0700
X-CSE-ConnectionGUID: RkhLeegpSyqpHZmdt1/JBw==
X-CSE-MsgGUID: 0YsQ8gcZQPGQXvGJ2Qvcrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; d="scan'208";a="120158256"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 23:56:52 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, lucas.demarchi@intel.com,
 michal.wajdeczko@intel.com, vinay.belgaumkar@intel.com
Subject: [PATCH v2 3/3] drm/xe/pf: Enable per-function engine activity stats
Date: Tue, 11 Mar 2025 12:47:59 +0530
Message-ID: <20250311071759.2117211-4-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250311071759.2117211-1-riana.tauro@intel.com>
References: <20250311071759.2117211-1-riana.tauro@intel.com>
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
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_pci_sriov.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
index 09ee8a06fe2e..d69b6b2a3061 100644
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
@@ -111,6 +112,20 @@ static void pf_link_vfs(struct xe_device *xe, int num_vfs)
 	}
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
@@ -145,6 +160,9 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
 
 	xe_sriov_info(xe, "Enabled %u of %u VF%s\n",
 		      num_vfs, total_vfs, str_plural(total_vfs));
+
+	pf_engine_activity_stats(xe, num_vfs, true);
+
 	return num_vfs;
 
 failed:
@@ -168,6 +186,8 @@ static int pf_disable_vfs(struct xe_device *xe)
 	if (!num_vfs)
 		return 0;
 
+	pf_engine_activity_stats(xe, num_vfs, false);
+
 	pci_disable_sriov(pdev);
 
 	pf_reset_vfs(xe, num_vfs);
-- 
2.47.1

