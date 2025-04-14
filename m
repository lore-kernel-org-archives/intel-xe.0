Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A6B7C369B5
	for <intel-xe@archiver.kernel.org>; Mon, 14 Apr 2025 20:24:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32AAE10E298;
	Mon, 14 Apr 2025 20:24:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T0lqXeQd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9839310E658
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Apr 2025 20:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744662241; x=1776198241;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T6nWPNWFny28M6GEMY9UBZRAOtX97CAxV+pEnaW1vBo=;
 b=T0lqXeQdnb4TCuVWZEQ2jhSmvrs/VtkLe9vRnSJ5Q1+sq+jUfHW/u+oR
 fREgBQCivrdpCVLhZ3KVA3ecZvGHtgIWPSrkot7UrKZ7amdS3lcmTF61s
 WL8vK8GiA2sb60NaSc/X8KIvXepNdxAfbE1NwbNDkiANjjXL2W4YSMzLk
 +pcIQidIUzjq7W+EExV8bSoV5SmCkMKGXI4EbmCDtPV65VDox2duap9cT
 YzIpM1JNmmQAob1484L834kGDfG6clGN14cSP6kcpGf1HkS1WXfpDu3iK
 kNBXGU2+7dnjNcWxsNi7gFtXL8zxBsDp21QN17eUfJKDOZVYnpjBY2Q8i g==;
X-CSE-ConnectionGUID: AwprxgYoTuiSt2+ZqsnKNg==
X-CSE-MsgGUID: w9m2J+n6TO+V8f1d5iMRug==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="48851482"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="48851482"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 13:24:01 -0700
X-CSE-ConnectionGUID: dRhVEmMJSheE5Om9IAiXAg==
X-CSE-MsgGUID: 4QjoCVG7SVCi90nmW4DDUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="134774367"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.114.177])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 13:24:00 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Riana Tauro <riana.tauro@intel.com>
Subject: [PATCH 2/2] drm/xe: Use GT oriented message to report engine activity
 error
Date: Mon, 14 Apr 2025 22:23:47 +0200
Message-Id: <20250414202347.1909-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20250414202347.1909-1-michal.wajdeczko@intel.com>
References: <20250414202347.1909-1-michal.wajdeczko@intel.com>
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

We are enabling/disabling engine activity on per-GT basis, so any
errors should be also reported per GT, like:

 [ ] xe 0000:00:02.0: [drm] GT0: PF: Failed to enable engine activity function stats (-ENOSPC)
 [ ] xe 0000:00:02.0: [drm] GT1: PF: Failed to enable engine activity function stats (-ENOSPC)

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_pci_sriov.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
index d69b6b2a3061..8813efdcafbb 100644
--- a/drivers/gpu/drm/xe/xe_pci_sriov.c
+++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
@@ -7,6 +7,7 @@
 #include "xe_device.h"
 #include "xe_gt_sriov_pf_config.h"
 #include "xe_gt_sriov_pf_control.h"
+#include "xe_gt_sriov_printk.h"
 #include "xe_guc_engine_activity.h"
 #include "xe_pci_sriov.h"
 #include "xe_pm.h"
@@ -121,8 +122,8 @@ static void pf_engine_activity_stats(struct xe_device *xe, unsigned int num_vfs,
 	for_each_gt(gt, xe, id) {
 		ret = xe_guc_engine_activity_function_stats(&gt->uc.guc, num_vfs, enable);
 		if (ret)
-			xe_sriov_info(xe, "Failed to %s engine activity function stats (%pe)\n",
-				      str_enable_disable(enable), ERR_PTR(ret));
+			xe_gt_sriov_info(gt, "Failed to %s engine activity function stats (%pe)\n",
+					 str_enable_disable(enable), ERR_PTR(ret));
 	}
 }
 
-- 
2.47.1

