Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 542AECCF2C3
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 20:44:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E7821129D0;
	Fri, 16 Oct 2026 20:44:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62D9D1129DA
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 20:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792183454; x=1823719454;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VjzE2JtHqtpeSdb0qcHeEYgDTKo5/LXYPP9jG0J7R0Y=;
 b=c8ShbY8/sz4OZKanZqq8m5rXBMgeVe88/c41yYNxviBB6nV9m+mj3CmC
 IaqOkZuQWww3GqnTbBZuO5q4ZY9FMgVH+m2z+Gux8+G60dlAzpsWpEgzf
 2eOv67fG1XXq6wOZUVvoEjfK6HmQy3ZUqv/ePelwpez09Q9ritKVdsPVG
 os/Yn2tvOjb02UePT9xmZ/oIXtT+2QmyYtG/ArIe3zaMcL4qQD7Njbzba
 aKpHdaUOlK9kfkz73hu2w8Ae4lapzMuBKKRuweZuype19I8Zcx3kqwkHH
 fI/eDqsNJ9tW3UZXPxeKfc50Yr4M3aOxaZOIQRcUXTFrDrzPakkYT3qOr g==;
X-CSE-ConnectionGUID: 6GWxtNxoRBKzVXn3F28bMg==
X-CSE-MsgGUID: 9x2zK4GKRtCG+N15pnJW5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11937"; a="1074535"
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="1074535"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 13:44:04 -0700
X-CSE-ConnectionGUID: 7Ut3KlmMQuiPI15X/0PlRw==
X-CSE-MsgGUID: D6x0oyY9R0ipCb0KQ1BDiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="3784148"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 13:44:05 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com, dnyaneshwar.bhadane@intel.com,
 michal.wajdeczko@intel.com, jesus.narvaez@intel.com
Subject: [PATCH v8 5/7] drm/xe/uc: Report DMA failure using SIGID
Date: Fri, 16 Oct 2026 13:44:00 -0700
Message-ID: <20261016204354.364846-14-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261016204354.364846-9-umesh.nerlige.ramappa@intel.com>
References: <20261016204354.364846-9-umesh.nerlige.ramappa@intel.com>
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

From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Convert the uC DMA failure error to use the xe_log_err() helper.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
v2: add assert and simplify if/else
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index ab2b413f05c6..52e878c94ba4 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -18,6 +18,7 @@
 #include "xe_gt_sriov_vf.h"
 #include "xe_gt_types.h"
 #include "xe_guc.h"
+#include "xe_log.h"
 #include "xe_map.h"
 #include "xe_mmio.h"
 #include "xe_module.h"
@@ -916,8 +917,12 @@ static int uc_fw_xfer(struct xe_uc_fw *uc_fw, u32 offset, u32 dma_flags)
 int xe_uc_fw_upload(struct xe_uc_fw *uc_fw, u32 offset, u32 dma_flags)
 {
 	struct xe_device *xe = uc_fw_to_xe(uc_fw);
+	struct xe_gt *gt = uc_fw_to_gt(uc_fw);
 	int err;
 
+	xe_gt_assert(gt, uc_fw->type == XE_UC_FW_TYPE_GUC ||
+		     uc_fw->type == XE_UC_FW_TYPE_HUC);
+
 	/* make sure the status was cleared the last time we reset the uc */
 	xe_assert(xe, !xe_uc_fw_is_loaded(uc_fw));
 
@@ -933,9 +938,11 @@ int xe_uc_fw_upload(struct xe_uc_fw *uc_fw, u32 offset, u32 dma_flags)
 	return 0;
 
 fail:
-	drm_err(&xe->drm, "Failed to load %s firmware %s (%d)\n",
-		xe_uc_fw_type_repr(uc_fw->type), uc_fw->path,
-		err);
+	if (uc_fw->type == XE_UC_FW_TYPE_GUC)
+		xe_log_err(gt, GUC, err, "Failed to load firmware %s\n", uc_fw->path);
+	else
+		xe_log_err(gt, HUC, err, "Failed to load firmware %s\n", uc_fw->path);
+
 	xe_uc_fw_change_status(uc_fw, XE_UC_FIRMWARE_LOAD_FAIL);
 	return err;
 }
-- 
2.55.0

