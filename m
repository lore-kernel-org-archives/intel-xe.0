Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FBDBC77B7F
	for <intel-xe@archiver.kernel.org>; Thu, 11 May 2023 19:20:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC87210E09A;
	Thu, 11 May 2023 19:20:41 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B628610E09A
 for <intel-xe@lists.freedesktop.org>; Thu, 11 May 2023 19:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683832839; x=1715368839;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VVviwetcfwLzeDEAC+ffHMGJeuVwR25IqXAhw5VUsg4=;
 b=N8O0SEUwQ1Ys7JVPfOrre/AEwbYfiSuUOYUadDsIfUUQ0/tEXZ/qlpOl
 E8dA4dVSiJtebgL9Gu3Bu9W0cVyk3SwJdXC3lTGLMf+Svc5yPJn+QIYER
 3IuAsRReN7hnyg7/KhWeasRFaJfDjZrhW69LfrNTyqWUHwwBP/2b88B2j
 ElGpqj/A/XUoMycACGgo02dXOMZdVFj/+Aq40fMbuFA9XQm2DkYiar0ej
 gMGhQpJ245faUD7P5Ygy5YMvXNx9HApcUL/zB8vr25HCRVhwTKX6vvLVV
 s/F46h3jNEoeUEn7FU51fRdZXsqgCWCWe0wWDRuWEBFS55Bw/u3hCdCZo g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="350635090"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; d="scan'208";a="350635090"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 12:20:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="730503050"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; d="scan'208";a="730503050"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.141.62])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 12:20:37 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 11 May 2023 21:20:15 +0200
Message-Id: <20230511192015.1816-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Move Media GuC register definition to
 proper header
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

All register definitions shall be kept in dedicated regs.h files,
not defined locally in .c files. While at it, rename it to match
name from the Bspec.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_guc_regs.h | 2 ++
 drivers/gpu/drm/xe/xe_guc.c           | 4 +---
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
index 37e0ac550931..01a8b0679679 100644
--- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
@@ -122,6 +122,8 @@ struct guc_doorbell_info {
 #define MED_VF_SW_FLAG(n)			XE_REG(0x190310 + (n) * 4)
 #define MED_VF_SW_FLAG_COUNT			4
 
+#define MED_GUC_HOST_INTERRUPT			XE_REG(0x190304)
+
 /* GuC Interrupt Vector */
 #define GUC_INTR_GUC2HOST			BIT(15)
 #define GUC_INTR_EXEC_ERROR			BIT(14)
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

