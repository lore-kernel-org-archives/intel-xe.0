Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D1DC41513
	for <intel-xe@archiver.kernel.org>; Thu, 23 May 2024 19:23:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89ABE10EC11;
	Thu, 23 May 2024 19:23:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZMe8u8EH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4327710EC11
 for <intel-xe@lists.freedesktop.org>; Thu, 23 May 2024 19:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716492179; x=1748028179;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=WSe9NNA3YjXJwDTTpLfe4lTkKaOmM06o5HPWd2OYSuo=;
 b=ZMe8u8EHGFw3OUZQN2tx6003dSfcfE8wlXXsxDi9lJo+CdeVeBx3ZHkC
 FQ/eV5L2xqMxhCsudXFFnxQw3qYTzZ8V2qGad7R2jSEAd4D6jItlvyhd2
 vP5yzPfKY84POtC+ANqaqvqq/m/MftStDGhK4XriGe2ZrZykEW1ta0Ysg
 /jwLxvWXdeP4TtsiIAdE8Ro3DfTwq/+dOJ5brK93Tj9yv/tESYOFsgnxQ
 bZhqrqa2AZa1h+bjqXV/HnJBsK3U5CwSw7rHHmnKKOErX+vh8FHNeXDBT
 eptNXpE2YDgbavH8a3TwNietuEmQo2x5mOelLEaejocYxj0QQOFGD0ay9 A==;
X-CSE-ConnectionGUID: 1oxO7eUsRjSKmhCJQXXxGQ==
X-CSE-MsgGUID: J9crnwmtTPWI7C1xCefX9w==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="13023480"
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; d="scan'208";a="13023480"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 12:22:56 -0700
X-CSE-ConnectionGUID: BBjbj3qGQ4GjnEIVCt6+lA==
X-CSE-MsgGUID: 6Xq1+CV9R5WwakE+0GymIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; d="scan'208";a="33848857"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.19.248])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 12:22:56 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 4/6] drm/xe/vf: Provide early access to GMDID register
Date: Thu, 23 May 2024 21:22:38 +0200
Message-Id: <20240523192240.844-5-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240523192240.844-1-michal.wajdeczko@intel.com>
References: <20240523192240.844-1-michal.wajdeczko@intel.com>
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

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 47 ++++++++++++++++++++++++++++++++++---
 1 file changed, 44 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index ece410289f6c..eefac633dbc1 100644
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
@@ -471,10 +473,49 @@ static void read_gmdid(struct xe_device *xe, enum xe_gmdid_type type, u32 *ver,
 
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
+		/* don't bother with GMDID if failed to negotiate the GuC ABI */
+		val = xe_gt_sriov_vf_bootstrap(gt) ? 0 : xe_gt_sriov_vf_gmdid(gt);
+
+		/* undo */
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

