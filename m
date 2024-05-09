Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DEA9C41513
	for <intel-xe@archiver.kernel.org>; Thu,  9 May 2024 04:11:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AD5910E244;
	Thu,  9 May 2024 04:11:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bzag0dTm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 679CE10E244
 for <intel-xe@lists.freedesktop.org>; Thu,  9 May 2024 04:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715227891; x=1746763891;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oLGNhnlGJVZA6/dXsdtGUP5mQM+hmcg88GGB3XK2feE=;
 b=Bzag0dTmDBMtz9q0JK+GZlfQXVxvTZByadEm3BIq8TlsmaJfUFzlT6qS
 kZ3mp92FWB5Znbwk5W8vqBAsbRRe7LCPLq0U/yhuYHnzNwM3q9eDA2Vy8
 4XgmePoTrkUGaWsYR7nLzguX6r/kuxhB010eZiOD6Tvag8xA+lveNWUp4
 W6XPASnFpPc8WjrsJuIN9KXQz9rsqLwZWTyq/ZC07Rte8geozl3/rSa16
 KdUdOnwSn8bjQFHT3rfK1zpbpcwtfMU/h4daYw72sYmLGPcDm/YRQMaJ5
 jTWs53o3+yQvllGMkZ9LnqVrbPKoKJd2Yy4piter79kvA/fcnKQ2flQiG g==;
X-CSE-ConnectionGUID: Su34fHO8QY6FwFVyUwcrIg==
X-CSE-MsgGUID: iUln4niCQ0mIYkyVfh7Z9w==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="11249896"
X-IronPort-AV: E=Sophos;i="6.08,146,1712646000"; d="scan'208";a="11249896"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 21:11:29 -0700
X-CSE-ConnectionGUID: uACfvIfxRSitUg3YQH1nOQ==
X-CSE-MsgGUID: AX/Z6wFvRbeXnrBZljijlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,146,1712646000"; d="scan'208";a="33915541"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 21:11:29 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Subject: [CI 5/5] drm/xe: Move sw-only pcode initialization
Date: Wed,  8 May 2024 21:12:25 -0700
Message-ID: <20240509041225.610636-5-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240509041225.610636-1-lucas.demarchi@intel.com>
References: <20240509041225.610636-1-lucas.demarchi@intel.com>
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
index fb838f35ab52..e24335df5e2c 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -597,9 +597,6 @@ int xe_device_probe(struct xe_device *xe)
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

