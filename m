Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04AF4C77B75
	for <intel-xe@archiver.kernel.org>; Fri, 19 May 2023 09:56:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5AE410E080;
	Fri, 19 May 2023 09:56:32 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 494B610E080
 for <intel-xe@lists.freedesktop.org>; Fri, 19 May 2023 09:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684490191; x=1716026191;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XW7bCrhYYgh81qzQWi6tsNIcl97YYiZ+CbWiqARMyzw=;
 b=k9qZoXDVWrWPNmXpo3Sbrn24lFJmZpHVA+f/J+7eE0Xx9Zgg0aF9tqGU
 +80N03culRYBWknO4jQqWJnevK4VDX4lDWAzTLp0xJ7/3e8zmedNHa4iE
 M2FTuKogr0vLfRVBfe+T2sOhy+5E0JSxmPPneWH4++27ebdD0j9hfECLC
 jhg3H+rsGdbo4leil32KzF956nA4qwDhVxONjqiC/zNasDXNkTdW/rBTE
 bUbVDJ1WeLykfRotprHSdh43bnKYHMaqwN7uKisXdkRAzRvTcL7zqvIQu
 vKjyjmuVcFz87GQMJrK6oq1NzloUUVAmGYe0jYMfPeucbNb5U1JzvCVgD A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="336925912"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; d="scan'208";a="336925912"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 02:56:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="733244115"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; d="scan'208";a="733244115"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.143.198])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 02:56:28 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 19 May 2023 11:56:18 +0200
Message-Id: <20230519095618.1160-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Change GuC interrupt data
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

Both GUC_HOST_INTERRUPT and MED_GUC_HOST_INTERRUPT can pass
additional payload data to the GuC but this capability is not
used by the firmware yet.

Stop using value mandated by legacy GuC interrupt register and
use default notify value (zero) instead.

Bspec: 49813, 63363
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index eb4af4c71124..effd8b1ff59d 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -600,8 +600,14 @@ int xe_guc_suspend(struct xe_guc *guc)
 void xe_guc_notify(struct xe_guc *guc)
 {
 	struct xe_gt *gt = guc_to_gt(guc);
+	const u32 default_notify_data = 0;
 
-	xe_mmio_write32(gt, guc->notify_reg, GUC_SEND_TRIGGER);
+	/*
+	 * Both GUC_HOST_INTERRUPT and MED_GUC_HOST_INTERRUPT can pass
+	 * additional payload data to the GuC but this capability is not
+	 * used by the firmware yet. Use default value in the meantime.
+	 */
+	xe_mmio_write32(gt, guc->notify_reg, default_notify_data);
 }
 
 int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr)
-- 
2.25.1

