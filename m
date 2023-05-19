Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C049C77B75
	for <intel-xe@archiver.kernel.org>; Fri, 19 May 2023 09:45:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C75E10E14E;
	Fri, 19 May 2023 09:45:51 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7970510E5F5
 for <intel-xe@lists.freedesktop.org>; Fri, 19 May 2023 09:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684489550; x=1716025550;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JzfjqMo0xN6LkScUnOVQz8POqNmqF5ajAx8zFu8kuxI=;
 b=W4mJqd8F3pQquLNiSNIOeS2BEt+SsezxSVAzleHzmkxoSAMSovmR4aVK
 hs1/PPz3isVnp0fMzCoJLlPL75CjjGc5UBtJSt81DmHEPx0I1BWp/oPMi
 oWAouZt2mPKQ6Zu3yGrGfHx4kZDl0eSbtE1VzXbiuvelNWvAxlXT9W7x5
 1FRMuUPB+d10EiWPVUivCGZQGXPsJfkd+eRgQ1M/NX0SJHuGhIkuKTXEe
 oqTrnCXi73mStk+8f8Ncox2SDoU0naxWA6hamMnYUiwS2GVbFCVy2Qxbq
 ooK1V427ugGE8AuoegaX6GKt7PL+itR0kyvcumuj5jU3fcrQiDHACswmD Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="331936698"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; d="scan'208";a="331936698"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 02:45:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="772234590"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; d="scan'208";a="772234590"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.143.198])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 02:45:48 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 19 May 2023 11:45:39 +0200
Message-Id: <20230519094539.1116-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2] drm/xe: Move Media GuC register definition to
 regs/
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This GuC register can be moved together with the rest of the
GuC register definitions and be named in a similar way.

v2: fix placement

Bspec: 63363
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com> #v1
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_guc_regs.h | 2 ++
 drivers/gpu/drm/xe/xe_guc.c           | 4 +---
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
index 37e0ac550931..b4f27cadb68f 100644
--- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
@@ -119,6 +119,8 @@ struct guc_doorbell_info {
 #define VF_SW_FLAG(n)				XE_REG(0x190240 + (n) * 4)
 #define VF_SW_FLAG_COUNT			4
 
+#define MED_GUC_HOST_INTERRUPT			XE_REG(0x190304)
+
 #define MED_VF_SW_FLAG(n)			XE_REG(0x190310 + (n) * 4)
 #define MED_VF_SW_FLAG_COUNT			4
 
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index eb4af4c71124..18bce8c1fbf7 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -22,8 +22,6 @@
 #include "xe_uc_fw.h"
 #include "xe_wopcm.h"
 
-#define MEDIA_GUC_HOST_INTERRUPT        XE_REG(0x190304)
-
 static struct xe_gt *
 guc_to_gt(struct xe_guc *guc)
 {
@@ -268,7 +266,7 @@ int xe_guc_init(struct xe_guc *guc)
 	guc_init_params(guc);
 
 	if (xe_gt_is_media_type(gt))
-		guc->notify_reg = MEDIA_GUC_HOST_INTERRUPT;
+		guc->notify_reg = MED_GUC_HOST_INTERRUPT;
 	else
 		guc->notify_reg = GUC_HOST_INTERRUPT;
 
-- 
2.25.1

