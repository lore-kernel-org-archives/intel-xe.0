Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F304C4167B
	for <intel-xe@archiver.kernel.org>; Tue, 12 Dec 2023 21:01:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12DDA10E6A0;
	Tue, 12 Dec 2023 21:01:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8B5810E69D
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Dec 2023 21:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702414886; x=1733950886;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9HcnOc0sirdfS2rDO76IAQFC3Llbzk5shcbkRyGrmA8=;
 b=CSfbiLiiWiPIf68wg/sXjqc8P+nYrMJP45GtKhjNHJmqxhWcpTySJxeh
 7wfoIzsEPkXY6y19xM/x0c2pB8y+zyBRdNSip7ht0tvMGryHmqGaa8yd/
 59k0O9038nQVIkuFn4SxQ+//U/78MzG4f5AvqpHLOlTiZ1gAKAFeYdxS+
 X33unaZn+RzrozgZwetUj5JfqT5r+dLJTb+1eKtqnHx+lV8V09u46V+cL
 oroBBrxYX1dE5SKwx5Ivh+qFo8je8gQXCT4/44VoWb6aTz5dOIjMY/SmB
 S/AjLbW/EXmUNJV/ffV2Qi2e2I04o2+dO3xdsT6EferEEAZV/APkJ+pRZ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="397654619"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; d="scan'208";a="397654619"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 13:01:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="917417232"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; d="scan'208";a="917417232"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.128.218])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 13:01:25 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 09/10] drm/xe/vf: Setup memory based interrupts in GuC
Date: Tue, 12 Dec 2023 22:00:53 +0100
Message-Id: <20231212210054.1747-10-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20231212210054.1747-1-michal.wajdeczko@intel.com>
References: <20231212210054.1747-1-michal.wajdeczko@intel.com>
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

When Memory Based Interrupts are used, the VF driver must provide
to the GuC references to the Source and Status Report Pages.

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

