Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B93F3C54FB9
	for <intel-xe@archiver.kernel.org>; Tue, 21 Nov 2023 11:16:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B17C10E2A7;
	Tue, 21 Nov 2023 11:16:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B661D10E2A7
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Nov 2023 11:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700565404; x=1732101404;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Lcf7Ft0G/uZmr2XhBLV+f5tNHIMh5vG1HRzR7HP6oT4=;
 b=WeweCa25MW/I/dCFOU27l16MBEX7zZM/pHAvAl/NArlXt0OFO8GvXQAH
 KLwZN8aWyzremFMvdHBbuFBNMpnud+sACFk66G2Hzrd8kLb6akEH2GqJh
 hZiMPL3LqtIdsModmhzgQM/34bW2RzktW5fhjHUzOPG5RmzeMs7QCL7Oy
 4LN6q0R8Yby2pAJ7mtTXYdN+/joIXhV8Fbo0uC/9E7g9eCjblEY56xB/S
 WK++9G8403z0MdfewPX3EVWv2sG0hbObSvzhAGZbfdFomEGo43CYAZQZz
 E4auDkNzVVu8qI04J28vmpvZu+NUSyaECrmm4LOW2YU7JxXxXMqVChKPA g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="422914964"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; d="scan'208";a="422914964"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2023 03:16:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; d="scan'208";a="14472537"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orviesa001.jf.intel.com with ESMTP; 21 Nov 2023 03:16:43 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 21 Nov 2023 16:55:55 +0530
Message-Id: <20231121112555.3734840-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Move wa processing to gt_init
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

Currently WA processing for gt is happening in early init API.
It also includes processing of WAs which needs filter based on
hardware engine by looping over number of hardware engines in gt.

However at early init stage hardware engines are not associated
with gt in software which skips processing such WAs.

Example WAs which will be fixed to apply after this change,
"14011060649",
"16010515920",
"16021867713"

Fixes: 811a9b3d262d8 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 0dddb751c6a4..3d0f7b6f952c 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -311,7 +311,6 @@ int xe_gt_init_early(struct xe_gt *gt)
 	if (err)
 		return err;
 
-	xe_wa_process_gt(gt);
 	xe_wa_process_oob(gt);
 	xe_tuning_process_gt(gt);
 
@@ -495,6 +494,7 @@ int xe_gt_init(struct xe_gt *gt)
 	if (err)
 		return err;
 
+	xe_wa_process_gt(gt);
 	xe_force_wake_init_engines(gt, gt_to_fw(gt));
 
 	err = all_fw_domain_init(gt);
-- 
2.25.1

