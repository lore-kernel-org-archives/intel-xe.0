Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72FD2C87FC5
	for <intel-xe@archiver.kernel.org>; Thu, 24 Jul 2025 22:44:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A2A410E087;
	Thu, 24 Jul 2025 22:44:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nhTDxtFK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B250E10E087
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Jul 2025 22:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753397056; x=1784933056;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9najgbhMu5/hLdkspVv2b2ZALioj5W1zaq3eE3hMCrQ=;
 b=nhTDxtFKDyM1W/6ZqkrcL8NZ7peBpY2tqLk1D9qUU7Kn4UgXJSiOrppD
 9y2tB6VFq1Hb2TFtOOgALvuqicq04LlP1Y1vz3y1av1g9/H+NvxlfB0ZJ
 zgLdTFaKyoZuG8ZzGJDU2c4p9z3ClgIP7d6h32najUNGf1AKLD9BDRzM9
 /CH0v7IZwacGW4donRdWC44RrjYcC5h5jKKqdhwZgwt1ukZh96l+ZXd6v
 LoaMcIzEHbZotdfE4KBbEpxkAbpfjbBiqkIa4vSY81KWfunkvoRgrPW/X
 dV/Me16MZR6pxW8rF8RbQGQ/z9rcjR7q6IJjbxbZ2Vve91FNj0DIAelbp A==;
X-CSE-ConnectionGUID: 2iS2DYScSwq8KeS1BeV3RQ==
X-CSE-MsgGUID: t/5UTcz8Sv2s+2mWeVRx0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="55429370"
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="55429370"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 15:44:16 -0700
X-CSE-ConnectionGUID: kqfqRgKRQQKzSz+JFKNgnQ==
X-CSE-MsgGUID: qApJO9QeQLKT5zrWGz6T+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="164751281"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by orviesa003.jf.intel.com with ESMTP; 24 Jul 2025 15:44:16 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v2] drm/xe/uc: Add stop on hardware initialization error
Date: Thu, 24 Jul 2025 18:44:13 -0400
Message-Id: <20250724224413.158598-1-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
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

During hardware initialization, GuC communication is expected, which
will increase the outstanding counter. Non-zero counter will cause
assertion failed during shutdown process.
Add GuC CT stop to clear the counter.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5466
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5530
Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
v2: Switch to xe_guc_ct_stop
---
 drivers/gpu/drm/xe/xe_uc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 465bda355443..e8874b4d7633 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -13,6 +13,7 @@
 #include "xe_gt_printk.h"
 #include "xe_gt_sriov_vf.h"
 #include "xe_guc.h"
+#include "xe_guc_ct.h"
 #include "xe_guc_pc.h"
 #include "xe_guc_engine_activity.h"
 #include "xe_huc.h"
@@ -173,6 +174,7 @@ static int vf_uc_load_hw(struct xe_uc *uc)
 	return 0;
 
 err_out:
+	xe_guc_ct_stop(&uc->guc.ct);
 	xe_guc_sanitize(&uc->guc);
 	return err;
 }
@@ -228,6 +230,7 @@ int xe_uc_load_hw(struct xe_uc *uc)
 	return 0;
 
 err_out:
+	xe_guc_ct_stop(&uc->guc.ct);
 	xe_guc_sanitize(&uc->guc);
 	return ret;
 }
-- 
2.34.1

