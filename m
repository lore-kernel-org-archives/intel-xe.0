Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C499FC00528
	for <intel-xe@archiver.kernel.org>; Thu,  3 Aug 2023 23:42:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83ED710E22B;
	Thu,  3 Aug 2023 23:42:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 436C410E11F
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Aug 2023 23:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691106144; x=1722642144;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LUX+IMaah+xBPBFzdlCa3a+qrYQQBk2y7rNspc5KLCc=;
 b=Nyjq+yjsdryehAo+nUWb8u4GHCNp7OIvYU12kh8egewLiPLxh190qQtu
 4boc6hCY/OmE/6eNEsGvBUGEPeqQUO3A1iEE0Ol8vrmeGPXRLyclgYDfW
 1WiWM/5jhf/akuxSYF8Eb3KyYOsjSpi2Rq8u8QtB2FwDtE6aE55+QJbxM
 Q/0x1Pz83cY+RUccetmojfTWptwo3uMCpQOAOmKb7lEY7H790BnxE/8Zj
 jA5Lhx98FNdUkvuilv+2ZXGsX3OkejpD7zxp/HHPOSmJ97nCqLa80T07G
 8xGaXRi97c38KhTAHilHYVKnEIyYLWEnVdT0+XZV11R/cgBFHjJPuqv8C Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="436344583"
X-IronPort-AV: E=Sophos;i="6.01,253,1684825200"; d="scan'208";a="436344583"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2023 16:42:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="853488580"
X-IronPort-AV: E=Sophos;i="6.01,253,1684825200"; d="scan'208";a="853488580"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2023 16:42:16 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  3 Aug 2023 16:42:08 -0700
Message-Id: <20230803234209.881924-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] drm/xe: Fix error path in
 xe_guc_pc_gucrc_disable()
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Make sure to always call xe_device_mem_access_put(), even on error.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 91a3967fd799..19d743f92f43 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -745,25 +745,27 @@ static int pc_adjust_requested_freq(struct xe_guc_pc *pc)
 int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc)
 {
 	struct xe_gt *gt = pc_to_gt(pc);
-	int ret;
+	int ret = 0;
 
 	xe_device_mem_access_get(pc_to_xe(pc));
 
 	ret = pc_action_setup_gucrc(pc, XE_GUCRC_HOST_CONTROL);
 	if (ret)
-		return ret;
+		goto out;
 
 	ret = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	if (ret)
-		return ret;
+		goto out;
 
 	xe_mmio_write32(gt, PG_ENABLE, 0);
 	xe_mmio_write32(gt, RC_CONTROL, 0);
 	xe_mmio_write32(gt, RC_STATE, 0);
 
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+
+out:
 	xe_device_mem_access_put(pc_to_xe(pc));
-	return 0;
+	return ret;
 }
 
 static void pc_init_pcode_freq(struct xe_guc_pc *pc)
-- 
2.40.1

