Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC02CC5DF97
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 00:28:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F53B10E364;
	Thu, 27 Aug 2026 00:28:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iMO5QC0S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA48610E364
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Aug 2026 00:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787790491; x=1819326491;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bgUcWZViGoZ4Mb14wqr+Q8clUWqWe8abjKdPP9EQF3U=;
 b=iMO5QC0SEwUo7aIguUXiyFopbiibH44LA6ByfDaWLYWLomiFmDr7y1xV
 4qqWEAZErI4xXSBDQWj4GkaBaMPnkxzQfk/wrfV7vO3TJTIpQJ2kVcR57
 SHvQDImg4TNPnPsPzyAyIQVtuc+aSGbUtjDmoelB4/eOA+Usr1hzjFmdJ
 BdEoWnvAsahB/PcapFKz84x+Ez5Lo61QrUou7CMXC4Wzw/ztzbkCHmzDy
 diGmzY6nezAmo69LPVWHp/LeyY+E4MRFG6ipCx3Tz3YZC1bvEHqluW/uT
 +RF1JOIyN/IkeEJcRlK3ckJp3y2JEIROwuxi05lX+03jC791tbGJsYIQz g==;
X-CSE-ConnectionGUID: IOap/jz/SdiMUMfJ3fR46A==
X-CSE-MsgGUID: AjX2C4fXQTOUclWoZSeOkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="98620375"
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="98620375"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 17:28:10 -0700
X-CSE-ConnectionGUID: Lfv+xVSpRAWlLLMl5wNM6w==
X-CSE-MsgGUID: AvhxjjqwSMebQJn9s3jHYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="265126118"
Received: from dceraolo-desk1.fm.intel.com (HELO dceraolo-desk1)
 ([10.121.64.189])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 17:28:10 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 Alan Previn Teres Alexis <alan.previn.teres.alexis@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH 1/3] drm/xe/uc: Report DMA failure using SIGID
Date: Thu, 27 Aug 2026 00:27:59 +0000
Message-ID: <20260827002801.837731-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.53.0
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

Convert the uC DMA failure error to use the xe_log_err() helper.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Cc: Alan Previn Teres Alexis <alan.previn.teres.alexis@intel.com>
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index e29878b255ba..02ed4f0eaf40 100644
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
@@ -914,6 +915,7 @@ static int uc_fw_xfer(struct xe_uc_fw *uc_fw, u32 offset, u32 dma_flags)
 int xe_uc_fw_upload(struct xe_uc_fw *uc_fw, u32 offset, u32 dma_flags)
 {
 	struct xe_device *xe = uc_fw_to_xe(uc_fw);
+	struct xe_gt *gt = uc_fw_to_gt(uc_fw);
 	int err;
 
 	/* make sure the status was cleared the last time we reset the uc */
@@ -931,9 +933,11 @@ int xe_uc_fw_upload(struct xe_uc_fw *uc_fw, u32 offset, u32 dma_flags)
 	return 0;
 
 fail:
-	drm_err(&xe->drm, "Failed to load %s firmware %s (%d)\n",
-		xe_uc_fw_type_repr(uc_fw->type), uc_fw->path,
-		err);
+	if (uc_fw->type == XE_UC_FW_TYPE_GUC)
+		xe_log_err(gt, GUC, err, "Failed to load firmware %s\n", uc_fw->path);
+	else if (uc_fw->type == XE_UC_FW_TYPE_HUC)
+		xe_log_err(gt, HUC, err, "Failed to load firmware %s\n", uc_fw->path);
+
 	xe_uc_fw_change_status(uc_fw, XE_UC_FIRMWARE_LOAD_FAIL);
 	return err;
 }
-- 
2.53.0

