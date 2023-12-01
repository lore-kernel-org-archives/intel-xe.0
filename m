Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AAC6C4167B
	for <intel-xe@archiver.kernel.org>; Fri,  1 Dec 2023 20:33:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1338510E146;
	Fri,  1 Dec 2023 20:33:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19F9810E146
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Dec 2023 20:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701462837; x=1732998837;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Kwjd6zaZ9Cljtntnh5x3osUuCBqDX3YgT3I+qmR9gaE=;
 b=C2ypeviTdQ4hbZThPw8u/ApCZkur96KiB+AB/o/A745tIAYQCpHF8AMT
 htKOEddLq5JJypNyAUT0UcKfo02naX8pzzWDGv66JOM1NUdHV0bkybkra
 qkxR8AL0Dhgu5hOVDpLm+bkBsI5deXjsRVB7oBVEiCpYs1l6sAZ36N0Cf
 e9cUkAyd/gVXZSiOr6vJHOf2gCf5tjITEqQPiv5reL1WaRrh8Up/3n8hZ
 fanhMYOZeBVcYDTYvG0Bj16eRF/XGNilEEA66wVZOniZYLhNJhmDMF6BH
 3rkzduSC5SIU70476WZEzU/lEdXKuKfojceALV5u/TjuqcZu/extt1szu g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="479752068"
X-IronPort-AV: E=Sophos;i="6.04,242,1695711600"; d="scan'208";a="479752068"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2023 12:33:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="719645136"
X-IronPort-AV: E=Sophos;i="6.04,242,1695711600"; d="scan'208";a="719645136"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by orsmga003.jf.intel.com with ESMTP; 01 Dec 2023 12:33:55 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  1 Dec 2023 12:33:44 -0800
Message-Id: <20231201203344.1981431-1-vinay.belgaumkar@intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Also, use the new C6 helper instead of duplicating that code.

Fixes: ff1db4de1e40 ("drm/xe: Manually setup C6 when skip_guc_pc is set")
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 1943893a3fd7..8c559ff57e3d 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -794,22 +794,23 @@ static int pc_adjust_requested_freq(struct xe_guc_pc *pc)
  */
 int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc)
 {
+	struct xe_device *xe = pc_to_xe(pc);
 	struct xe_gt *gt = pc_to_gt(pc);
 	int ret = 0;
 
 	xe_device_mem_access_get(pc_to_xe(pc));
 
-	ret = pc_action_setup_gucrc(pc, XE_GUCRC_HOST_CONTROL);
-	if (ret)
-		goto out;
+	if (!xe->info.skip_guc_pc) {
+		ret = pc_action_setup_gucrc(pc, XE_GUCRC_HOST_CONTROL);
+		if (ret)
+			goto out;
+	}
 
 	ret = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	if (ret)
 		goto out;
 
-	xe_mmio_write32(gt, PG_ENABLE, 0);
-	xe_mmio_write32(gt, RC_CONTROL, 0);
-	xe_mmio_write32(gt, RC_STATE, 0);
+	xe_gt_idle_disable_c6(gt);
 
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 
-- 
2.38.1

