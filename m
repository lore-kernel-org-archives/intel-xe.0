Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDDEFC25B78
	for <intel-xe@archiver.kernel.org>; Mon, 13 May 2024 21:37:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7725110E9A5;
	Mon, 13 May 2024 21:37:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CeiI+dhP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6664110E995
 for <intel-xe@lists.freedesktop.org>; Mon, 13 May 2024 21:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715636235; x=1747172235;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=IuCy1NBM1Y/+HKX+M9R+ivIb7VHqM9gZPxUZPkm1Utw=;
 b=CeiI+dhPHgtZ/7P+1iYr+lUG2ADf//TOMivExQsWxThzskyiCo9L0z13
 ZeHT9v4+pwtXz9FNXui4uREugD0kGWwX+ZQiLOswUie/Pg99ikN7qmKJo
 cuUyGHdaPpp3eq5JPKk9+qzqt8ZO1Tju/+x8umXOTgR4d1hWzz0fwE+es
 0rNnlR8d6G31jLuF4WtWyRvlavtM691rFm9FtPvTrwsBtZ83jDso897uB
 0abzGtWnDZVC+MA0hOws+ydx1xaTrh73pdjNgxs611O6iFE/+inZhi+lZ
 XGjHVNFE0ZqCUO8o8hUbc4pxtBhHwvcTNTWmpodz3Q/5PjPZ4Jg8mvmLE w==;
X-CSE-ConnectionGUID: XgyFEg1zTRGnuaUhX/2Ehg==
X-CSE-MsgGUID: KqeKZR8lQ3OVR+PFJWzKKQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="11505920"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="11505920"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 14:37:06 -0700
X-CSE-ConnectionGUID: Eh1I29UqTiGnwieDiG/uNA==
X-CSE-MsgGUID: 5s9m859tSEiBF15SPsSwGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="35348595"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 14:37:05 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [CI 5/5] drm/xe: Move sw-only pcode initialization
Date: Mon, 13 May 2024 14:37:51 -0700
Message-ID: <20240513213751.1017791-5-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240513213751.1017791-1-lucas.demarchi@intel.com>
References: <20240513213751.1017791-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Move it to xe_gt_init_early() that initializes the sw-only part for each
gt.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 3 ---
 drivers/gpu/drm/xe/xe_gt.c     | 2 ++
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 8cb93be83332..8da90934c900 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -598,9 +598,6 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
-	for_each_gt(gt, xe, id)
-		xe_pcode_init(gt);
-
 	err = xe_display_init_noirq(xe);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index e05899691a8c..11870ad2caf6 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -44,6 +44,7 @@
 #include "xe_migrate.h"
 #include "xe_mmio.h"
 #include "xe_pat.h"
+#include "xe_pcode.h"
 #include "xe_pm.h"
 #include "xe_mocs.h"
 #include "xe_reg_sr.h"
@@ -329,6 +330,7 @@ int xe_gt_init_early(struct xe_gt *gt)
 	xe_tuning_process_gt(gt);
 
 	xe_force_wake_init_gt(gt, gt_to_fw(gt));
+	xe_pcode_init(gt);
 
 	return 0;
 }
-- 
2.43.0

