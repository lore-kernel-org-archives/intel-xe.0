Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD7CFC6FD1C
	for <intel-xe@archiver.kernel.org>; Thu, 23 Mar 2023 20:23:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AC1F10EB1D;
	Thu, 23 Mar 2023 20:23:20 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE02210EB1D
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Mar 2023 20:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679602998; x=1711138998;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=p3D8QcaEDN8qfGw37goNoEmiy9dWfjO8Yi8IBk4iXwc=;
 b=WL8YHTtdkXAn0zX9NWklqYIr1PcFbmi/CeCEk/bh9BJGmBiXCM4H3x1u
 sIYojGJLlOzJvLHGWlvKmN2UYKzZSvSWEzrgCOZ4e80waSZzVtg5KuhWI
 mu3O5lpZUFeb8MArLUB8j+ADI9Fqa7MHjncvqaC5gCvpFuy3JPmwSlfEQ
 ePPCo/WUaMntPWCkxBXwlrqXpBZ2i34kRlBjwTvnrTUJs+RxbAs6a0wci
 Sp7hVpFlmdX0LAedcly08z+2KAp/L4XO2eFu0w5SjgM9TieqvgGLkB1tV
 GGq984gFCl+e50Huc19LZlACXEl89QR3RmL9VoxWJD3FoXrSPqxzCh5Yw w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="404523458"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; d="scan'208";a="404523458"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 13:23:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="806402111"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; d="scan'208";a="806402111"
Received: from unknown (HELO DUT731-PVC.fm.intel.com) ([10.1.40.69])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 13:23:18 -0700
From: "Chang, Bruce" <yu.bruce.chang@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 23 Mar 2023 20:23:13 +0000
Message-Id: <20230323202313.3523-1-yu.bruce.chang@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: don't auto fall back to execlist mode if
 guc failed to init
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

In general, this is due to FW load failure, should just report
error and fail the probe so that user can easily retry again.

Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Bruce Chang <yu.bruce.chang@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 4 ++--
 drivers/gpu/drm/xe/xe_uc.c | 3 ---
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index daa433d0f2f5..8a436c95591e 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -455,9 +455,9 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 			goto err_force_wake;
 	}
 
-	/* Allow driver to load if uC init fails (likely missing firmware) */
 	err = xe_uc_init(&gt->uc);
-	XE_WARN_ON(err);
+	if (err)
+		goto err_force_wake;
 
 	err = xe_uc_init_hwconfig(&gt->uc);
 	if (err)
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 4ccf2b3435e1..70eabf567156 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -54,9 +54,6 @@ int xe_uc_init(struct xe_uc *uc)
 	return 0;
 
 err:
-	/* If any uC firmwares not found, fall back to execlists */
-	xe_device_guc_submission_disable(uc_to_xe(uc));
-
 	return ret;
 }
 
-- 
2.25.1

