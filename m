Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29B4CC25B75
	for <intel-xe@archiver.kernel.org>; Thu, 23 May 2024 22:31:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE80E10EC76;
	Thu, 23 May 2024 22:31:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oGy2Bw5K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C65B110EC76
 for <intel-xe@lists.freedesktop.org>; Thu, 23 May 2024 22:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716503475; x=1748039475;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Z/4Zl8YhGT0Dg5k0DWk1E+68BolDcNg7nm9ZmIviJxw=;
 b=oGy2Bw5KecyufguKVaZppPtIwd/bnARyJiOdCzcIo2+tBrWACTMxGHHU
 NIIaumTEhjCBVFepvOcoV05irEkgVstgvgKzxGufcdOAlido4G32Ev7SF
 7/DLPxvFuZXLUjxxSqPcvQrnZ75CQ73SyVF0/i8UJDJU5DYR9xp5CpQ84
 sQa4xDkKiK167x03sICs4OclwMcgwMCp4h3l8wsYn8MX5qkvajXhN6JwG
 Y+LSGQZtSS4kKlKmeLCDrw7LqDcVIQ2s/lYth6rF//Q+GFEE4d/oX9Q6L
 4/yeVzGb4UataEhLMs6etW7095P/nIDJuH+E9VsNIzVckblKxndwOOLMZ A==;
X-CSE-ConnectionGUID: M+7yn1lASFmJ0RRxA6FFlg==
X-CSE-MsgGUID: rTg6aH4aSXSggdjjeqbmYA==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="12979578"
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; d="scan'208";a="12979578"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 15:31:14 -0700
X-CSE-ConnectionGUID: W6zIxmP5RYuEFu4psysitw==
X-CSE-MsgGUID: udXPQiTeRMKcfYWr1Wg9xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; d="scan'208";a="34358364"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.96.165])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 15:31:12 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 4/6] drm/xe/vf: Provide early access to GMDID register
Date: Fri, 24 May 2024 00:30:42 +0200
Message-Id: <20240523223042.888-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240523192240.844-5-michal.wajdeczko@intel.com>
References: <20240523192240.844-5-michal.wajdeczko@intel.com>
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

VFs do not have direct access to the GMDID register and must obtain
its value from the GuC. Since we need GMDID value very early in the
driver probe flow, before we even start the full setup of GT and GuC
data structures, we must do some early initializations ourselves.

Additionally, since we also need GMDID for the media GT, which isn't
created yet, temporarly tweak the root GT type into MEDIA to allow
communication with the correct GuC, as only it can provide the value
of the media GMDID register.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
v2: add a note about overwriting temporary changes (Matt)
---
 drivers/gpu/drm/xe/xe_pci.c | 50 ++++++++++++++++++++++++++++++++++---
 1 file changed, 47 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index ece410289f6c..8d235d691c7d 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -20,6 +20,8 @@
 #include "xe_device.h"
 #include "xe_drv.h"
 #include "xe_gt.h"
+#include "xe_gt_sriov_vf.h"
+#include "xe_guc.h"
 #include "xe_macros.h"
 #include "xe_mmio.h"
 #include "xe_module.h"
@@ -471,10 +473,52 @@ static void read_gmdid(struct xe_device *xe, enum xe_gmdid_type type, u32 *ver,
 
 	KUNIT_STATIC_STUB_REDIRECT(read_gmdid, xe, type, ver, revid);
 
-	if (type == GMDID_MEDIA)
-		gmdid_reg.addr += MEDIA_GT_GSI_OFFSET;
+	if (IS_SRIOV_VF(xe)) {
+		/*
+		 * To get the value of the GMDID register, VFs must obtain it
+		 * from the GuC using MMIO communication.
+		 *
+		 * Note that at this point the xe_gt is not fully uninitialized
+		 * and only basic access to MMIO registers is possible. To use
+		 * our existing GuC communication functions we must perform at
+		 * least basic xe_gt and xe_guc initialization.
+		 *
+		 * Since to obtain the value of GMDID_MEDIA we need to use the
+		 * media GuC, temporarly tweak the gt type.
+		 */
+		xe_gt_assert(gt, gt->info.type == XE_GT_TYPE_UNINITIALIZED);
+
+		if (type == GMDID_MEDIA) {
+			gt->info.id = 1;
+			gt->info.type = XE_GT_TYPE_MEDIA;
+		} else {
+			gt->info.id = 0;
+			gt->info.type = XE_GT_TYPE_MAIN;
+		}
+
+		xe_guc_comm_init_early(&gt->uc.guc);
+
+		/* Don't bother with GMDID if failed to negotiate the GuC ABI */
+		val = xe_gt_sriov_vf_bootstrap(gt) ? 0 : xe_gt_sriov_vf_gmdid(gt);
+
+		/*
+		 * Only undo xe_gt.info here, the remaining changes made above
+		 * will be overwritten as part of the regular initialization.
+		 */
+		gt->info.id = 0;
+		gt->info.type = XE_GT_TYPE_UNINITIALIZED;
+	} else {
+		/*
+		 * We need to apply the GSI offset explicitly here as at this
+		 * point the xe_gt is not fully uninitialized and only basic
+		 * access to MMIO registers is possible.
+		 */
+		if (type == GMDID_MEDIA)
+			gmdid_reg.addr += MEDIA_GT_GSI_OFFSET;
+
+		val = xe_mmio_read32(gt, gmdid_reg);
+	}
 
-	val = xe_mmio_read32(gt, gmdid_reg);
 	*ver = REG_FIELD_GET(GMD_ID_ARCH_MASK, val) * 100 + REG_FIELD_GET(GMD_ID_RELEASE_MASK, val);
 	*revid = REG_FIELD_GET(GMD_ID_REVID, val);
 }
-- 
2.43.0

