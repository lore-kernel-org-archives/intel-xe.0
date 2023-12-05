Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10207C4167B
	for <intel-xe@archiver.kernel.org>; Tue,  5 Dec 2023 23:21:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAF8110E645;
	Tue,  5 Dec 2023 23:21:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B08110E644
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Dec 2023 23:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701818470; x=1733354470;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oIz7BIXuJazTg0d4AUOXxoZB1NQ92B78S4Mog9D4mE4=;
 b=Ksas82D4O6kyHBeO+vgvaZDpa7UjTPUt7xYYeBztXIJPVs22Kz3gqLAQ
 arhv0B9AHMmRob7a4MdSgEBceQdyJ7IYnslr8bFMKQeIE9L2bX1TcmFIh
 +YLwTEY4QocmZZfZAedumHFn9sr581CYwB6JWYKy/r0Gat+20txVt31vV
 VY5lMxQDWd1yfuxE6doC8fVALMotbi14YXjmVlp3+w+8H3eU3vFEL30IE
 8MAbhTDMjWXhNC5U6O7ls2NrkMqhrL1H4vNC2TSNht4kDbyPftk4pZcCA
 LgHxZupgOu2xt1Fk7QeTGh6QcckEoI+DfBYuFFuo3XaegFfG8eLTWK+rB Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="396767210"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; d="scan'208";a="396767210"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 15:21:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="771093086"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; d="scan'208";a="771093086"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by orsmga002.jf.intel.com with ESMTP; 05 Dec 2023 15:21:09 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  5 Dec 2023 15:20:47 -0800
Message-Id: <20231205232047.3277223-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Check skip_guc_pc before disabling gucrc
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Also, use the new C6 helper instead of duplicating that code.

v2: Check skip flag at the beginning of the function (Rodrigo)

Fixes: ff1db4de1e40 ("drm/xe: Manually setup C6 when skip_guc_pc is set")
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 1943893a3fd7..86124f55dbd3 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -794,9 +794,13 @@ static int pc_adjust_requested_freq(struct xe_guc_pc *pc)
  */
 int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc)
 {
+	struct xe_device *xe = pc_to_xe(pc);
 	struct xe_gt *gt = pc_to_gt(pc);
 	int ret = 0;
 
+	if (xe->info.skip_guc_pc)
+		return 0;
+
 	xe_device_mem_access_get(pc_to_xe(pc));
 
 	ret = pc_action_setup_gucrc(pc, XE_GUCRC_HOST_CONTROL);
@@ -807,9 +811,7 @@ int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc)
 	if (ret)
 		goto out;
 
-	xe_mmio_write32(gt, PG_ENABLE, 0);
-	xe_mmio_write32(gt, RC_CONTROL, 0);
-	xe_mmio_write32(gt, RC_STATE, 0);
+	xe_gt_idle_disable_c6(gt);
 
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 
-- 
2.38.1

