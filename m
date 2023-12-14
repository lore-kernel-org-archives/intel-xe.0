Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B599C4167D
	for <intel-xe@archiver.kernel.org>; Thu, 14 Dec 2023 19:02:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C437410E256;
	Thu, 14 Dec 2023 19:02:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 959E210E994
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Dec 2023 19:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702580452; x=1734116452;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CU4Af30af6Zjn7B1jJtapksbA3Ig4i/Wh3RnqeTnCfA=;
 b=Z+vGZJqn5TVs5S9C32wU7OtNI/XCDYX0i9xLBLhSom9Sc5vAH7OZk0ZQ
 g8PZDhDDncVEhLZwyO0FdIkXQoS0pPAMvcBxIeOZUVT1eSzYVlDx/triZ
 JVHUoy8ys3V+a6YTnrmegCMeaEc86mzApPmvfNs+JCSVJVjwyqT0bAM5g
 kGo8fODDOlYN9hBh+wDsbPAVyvbPJcxYy4/gntkQ6oVFA6xHQHeyDZBc1
 rgv9TXbJ3kU0k5NpKlvgqvxjV8kwLEZLxoumy/zc8pEarL5a3sYhDm6Kz
 eDsZfmBmpxGiqMVen6ptbOt94gsfeWfNWdKip8Q4z03xgwMPmVp0Nroxm g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="399006428"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; d="scan'208";a="399006428"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 11:00:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; d="scan'208";a="15964812"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.128.198])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 11:00:28 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 09/10] drm/xe/vf: Setup memory based interrupts in GuC
Date: Thu, 14 Dec 2023 19:59:54 +0100
Message-Id: <20231214185955.1791-10-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20231214185955.1791-1-michal.wajdeczko@intel.com>
References: <20231214185955.1791-1-michal.wajdeczko@intel.com>
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
Cc: Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

When Memory Based Interrupts are used, the VF driver must provide
to the GuC references to the Source and Status Report Pages.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 482cb0df9f15..85096741cb3b 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -22,8 +22,10 @@
 #include "xe_guc_log.h"
 #include "xe_guc_pc.h"
 #include "xe_guc_submit.h"
+#include "xe_memirq.h"
 #include "xe_mmio.h"
 #include "xe_platform_types.h"
+#include "xe_sriov.h"
 #include "xe_uc.h"
 #include "xe_uc_fw.h"
 #include "xe_wa.h"
@@ -574,10 +576,20 @@ static void guc_enable_irq(struct xe_guc *guc)
 
 int xe_guc_enable_communication(struct xe_guc *guc)
 {
+	struct xe_device *xe = guc_to_xe(guc);
 	int err;
 
 	guc_enable_irq(guc);
 
+	if (IS_SRIOV_VF(xe) && xe_device_has_memirq(xe)) {
+		struct xe_gt *gt = guc_to_gt(guc);
+		struct xe_tile *tile = gt_to_tile(gt);
+
+		err = xe_memirq_init_guc(&tile->sriov.vf.memirq, guc);
+		if (err)
+			return err;
+	}
+
 	xe_mmio_rmw32(guc_to_gt(guc), PMINTRMSK,
 		      ARAT_EXPIRED_INTRMSK, 0);
 
-- 
2.25.1

