Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9444D6EBE5
	for <intel-xe@archiver.kernel.org>; Fri, 29 Nov 2024 07:44:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A047E10EDB5;
	Fri, 29 Nov 2024 07:44:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IO/kc4zm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40FB010EDB5
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Nov 2024 07:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732866266; x=1764402266;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LZi9CNOoCZfuOw/NTQxJ79l7TDXRjMTFdOqy+/1MKBQ=;
 b=IO/kc4zmuW3lVO8IqEegZ5Juc+sXnOviRNqpVChZV4Sy9/EiJMZvJPDf
 r0V+n+6bF26LnB3lcEvmP7Hng5ESDnBOnnkkfsDtS6sYcLymQCS/yEdkA
 q83qLSOc8SFrnEkbJ7sABpVkUT2gzzjie6dRvMRyuuqSLTzw0v+JklqBv
 alkNHCYQ3zY5FMgpqeNM1qoqO3MgQomBVpgpozDGW4dPdIqEJmudPH3Co
 vOwKh45T0/V4XDapLBDQRr2ahVvuoPbqKmY1yCuykdDqzevABSjNaFUDL
 qxxjbYutFn6wp9QLssueeF2CYwrGFSwOvSiXCYSQMWMXzUOTdG/FBP/UK w==;
X-CSE-ConnectionGUID: pnWwMxuJRJmiiFG1jRa+SA==
X-CSE-MsgGUID: ouqzKBUqTKKOpPfkqnw5Sw==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="58505759"
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; d="scan'208";a="58505759"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2024 23:44:25 -0800
X-CSE-ConnectionGUID: 9KVeHXqLRp2oRaiFBA3GyA==
X-CSE-MsgGUID: GD1eb8pfT3GWemJpOS984w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; d="scan'208";a="123286513"
Received: from jraag-nuc8i7beh.iind.intel.com ([10.145.169.79])
 by orviesa002.jf.intel.com with ESMTP; 28 Nov 2024 23:44:23 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, Michal.Wajdeczko@intel.com,
 ashutosh.dixit@intel.com, rodrigo.vivi@intel.com, matthew.brost@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2] drm/xe/throttle: Log throttle reasons
Date: Fri, 29 Nov 2024 13:13:00 +0530
Message-Id: <20241129074300.1304068-1-raag.jadav@intel.com>
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

Log throttle register MMIO reads which will be useful for debugging.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---

v2: Use gt oriented logging (Michal)
    Drop local variables (Ashutosh, Rodrigo)
    Move logging to status attribute and reduce spam (Matthew Brost)

 drivers/gpu/drm/xe/xe_gt_throttle.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_throttle.c b/drivers/gpu/drm/xe/xe_gt_throttle.c
index 03b225364101..8db78d616b6f 100644
--- a/drivers/gpu/drm/xe/xe_gt_throttle.c
+++ b/drivers/gpu/drm/xe/xe_gt_throttle.c
@@ -8,6 +8,7 @@
 #include <regs/xe_gt_regs.h>
 #include "xe_device.h"
 #include "xe_gt.h"
+#include "xe_gt_printk.h"
 #include "xe_gt_sysfs.h"
 #include "xe_gt_throttle.h"
 #include "xe_mmio.h"
@@ -53,6 +54,7 @@ static u32 read_status(struct xe_gt *gt)
 {
 	u32 status = xe_gt_throttle_get_limit_reasons(gt) & GT0_PERF_LIMIT_REASONS_MASK;
 
+	xe_gt_dbg(gt, "throttle reasons: 0x%08x\n", status);
 	return status;
 }
 
-- 
2.34.1

