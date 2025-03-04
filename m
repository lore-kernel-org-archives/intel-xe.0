Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BED14C282D0
	for <intel-xe@archiver.kernel.org>; Tue,  4 Mar 2025 09:36:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88CFF10E545;
	Tue,  4 Mar 2025 09:36:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HqmiVt7i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B3A710E546
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Mar 2025 09:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741081006; x=1772617006;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EKc9y2Pp5NtTmfjb9x2lroDwmda8gJt9pXKpJdNv6FE=;
 b=HqmiVt7ikGmabwONj6mWjr89ITOTA5EucHOrLo/EDEq46xSIXVs5BwMc
 SYFboqO/HuYncikWp4vbvBi1QoIK6nYElh6ZIOJlihUUb2Jo0vvx9lZJE
 Q8Tg849OIOzoDHlGBFJwfX5x6utweu7T1vHvF+pJKW4NzIqRxp8BMEK8a
 93jiWCYEcthLo1VUTZ+ggQ4YggRNoSYRakA8DKe15y53BjsO/0t0nIod9
 5AkAs7VQimRe+cxcmpprrczwC9UT8fd7WoIGpLC7b8ZYQOz8V9OuWTmhq
 7tHazLToGuXdxNPas/O5H8I6AlRuLiJ4zGgaAqWzvMfpqhZgXpER0MNBV A==;
X-CSE-ConnectionGUID: LDGcQnleRX27PM+wEziWOg==
X-CSE-MsgGUID: 2KHV+Wl9TyijBBTIcqQDXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="45764796"
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; d="scan'208";a="45764796"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 01:36:45 -0800
X-CSE-ConnectionGUID: iyGOdePbQrWaV8xWWhFUVQ==
X-CSE-MsgGUID: 2jooL4OiRz63lzHPB4UgTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="118837735"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 01:36:43 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, lucas.demarchi@intel.com,
 michal.wajdeczko@intel.com, vinay.belgaumkar@intel.com
Subject: [PATCH 3/3] drm/xe/pf: Enable per-function engine activity stats
Date: Tue,  4 Mar 2025 15:27:43 +0530
Message-ID: <20250304095743.3274062-4-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250304095743.3274062-1-riana.tauro@intel.com>
References: <20250304095743.3274062-1-riana.tauro@intel.com>
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
index b9ac3b4e0497..d78e57070931 100644
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
@@ -120,6 +121,20 @@ static void pf_link_vfs(struct xe_device *xe, int num_vfs)
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
@@ -154,6 +169,9 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
 
 	xe_sriov_info(xe, "Enabled %u of %u VF%s\n",
 		      num_vfs, total_vfs, str_plural(total_vfs));
+
+	pf_engine_activity_stats(xe, num_vfs, true);
+
 	return num_vfs;
 
 failed:
@@ -177,6 +195,8 @@ static int pf_disable_vfs(struct xe_device *xe)
 	if (!num_vfs)
 		return 0;
 
+	pf_engine_activity_stats(xe, num_vfs, false);
+
 	pci_disable_sriov(pdev);
 
 	pf_reset_vfs(xe, num_vfs);
-- 
2.47.1

