Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3B5BC30653
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jul 2024 23:17:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D90F10E05B;
	Mon,  1 Jul 2024 23:17:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MaWoi2lw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BA6010E05B
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Jul 2024 23:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719875832; x=1751411832;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QAnZWP8OAnO6iTyHGZplfKmTJ5n36+gg3k2uP0/srrg=;
 b=MaWoi2lwSQa5jG/xwGKQ9Vt/Y8ztJp3L+5l0FxVK2qA2JxqoN1NQhcVK
 /vKz7/o8mgR6kf4ytg2ElDbIv4LhfPpmdLUjXPr1SfcDTStjsO8gTyN21
 166ftScfLMqlzcZHuiptsCkqJXaQLSJ68fVO9dneGsgdhq4shWqRcM6xC
 rwQuuluAu5/gmvN+8nLEruQhp16GHem4N8j8g5HS79YYmD6GNhWyZ66Ur
 rsQjxl8lhyY1/vjXH0rRjGgR4E0ySVnPTi8qKew3/HmFxbXnvALwXeam7
 nujL2cs9GjuGqmX/CYlODp7AV2IAfaM3dGVAPc+76opU/qltx/jvDmqkw A==;
X-CSE-ConnectionGUID: xQmzLEdoSde2FY74+ynQ7w==
X-CSE-MsgGUID: KOGnJAvMSLebp43l2wHDmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11120"; a="16692094"
X-IronPort-AV: E=Sophos;i="6.09,177,1716274800"; d="scan'208";a="16692094"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2024 16:17:11 -0700
X-CSE-ConnectionGUID: T6o3KShbQx2l8aNgdv22CQ==
X-CSE-MsgGUID: uxcs0Qf1Qma71Hpq6/zDaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,177,1716274800"; d="scan'208";a="50132527"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.141])
 by fmviesa005.fm.intel.com with ESMTP; 01 Jul 2024 16:17:11 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: [PATCH 1/2] drm/xe/guc: Prevent use of uninitialized mutex
Date: Mon,  1 Jul 2024 16:15:28 -0700
Message-Id: <20240701231529.2582452-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
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

When skip_guc_pc is set and/or this is for a VF.

Fixes: 3b1592fb7835 ("drm/xe/lnl: Apply Wa_22019338487")
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index d88f5e960fbd..f7b468930697 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -26,6 +26,7 @@
 #include "xe_mmio.h"
 #include "xe_pcode.h"
 #include "xe_pm.h"
+#include "xe_sriov.h"
 #include "xe_wa.h"
 
 #define MCHBAR_MIRROR_BASE_SNB	0x140000
@@ -825,6 +826,9 @@ int xe_guc_pc_restore_stashed_freq(struct xe_guc_pc *pc)
 {
 	int ret = 0;
 
+	if (IS_SRIOV_VF(pc_to_xe(pc)) || pc_to_xe(pc)->info.skip_guc_pc)
+		return 0;
+
 	mutex_lock(&pc->freq_lock);
 	ret = pc_set_max_freq(pc, pc->stashed_max_freq);
 	if (!ret)
-- 
2.38.1

