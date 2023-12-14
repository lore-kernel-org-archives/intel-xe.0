Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09877C4167B
	for <intel-xe@archiver.kernel.org>; Thu, 14 Dec 2023 18:47:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99F5F10E265;
	Thu, 14 Dec 2023 18:47:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79AB110E209
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Dec 2023 18:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702579648; x=1734115648;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=l1xPbJ7AyqUCQ4t4pC270cItAcE2GPgQMDV6fdJrbfI=;
 b=mLXEr7RTvVOKeU/PKr0nqXPVjBv1LKTb23iQzJYVMv9aPsTLEfkP2hj+
 DJhH/q9dclk+yWu5no4NHOIYeKK+dFBIC0JDGqqDMqW3OUaAEzWtcFW27
 QQoUcI+1kaVoaLg72/9W6iS/uSzFnQ9dKi8zNtFB9bItVtZBFtk6ZRyZ0
 iENEQiRSlgU0W8QmuNLTx3lLyaP1iHHI14wHTI7aj3cWXNSl3k3eweDvO
 KADs3wjjJg/rQN+pwfB1W3X655yhqP8XxYFRUVHYNQBmdkj8RwnuDNvqY
 ejyWnFriHW5RrtEqtuVVBODP98FQuotX0sTULqkCupGcZ/lA0AEld466Y g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="397953934"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; d="scan'208";a="397953934"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 10:47:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="892581850"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; d="scan'208";a="892581850"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.131])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 10:47:11 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 6/8] drm/xe: Define interrupt vector bits with the interrupt
 registers
Date: Thu, 14 Dec 2023 10:47:06 -0800
Message-ID: <20231214184659.2249559-16-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231214184659.2249559-10-matthew.d.roper@intel.com>
References: <20231214184659.2249559-10-matthew.d.roper@intel.com>
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The bit definitions had become a bit orphaned; move them to the same
location as the interrupt registers that they're used with.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 5 +++++
 drivers/gpu/drm/xe/regs/xe_regs.h    | 6 ------
 drivers/gpu/drm/xe/xe_hw_engine.c    | 1 -
 3 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 4448507ef4ca..2c48de2076a6 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -456,6 +456,11 @@
 #define XEHPC_BCS3_BCS4_INTR_MASK		XE_REG(0x190114)
 #define XEHPC_BCS5_BCS6_INTR_MASK		XE_REG(0x190118)
 #define XEHPC_BCS7_BCS8_INTR_MASK		XE_REG(0x19011c)
+#define   GT_WAIT_SEMAPHORE_INTERRUPT		REG_BIT(11)
+#define   GT_CONTEXT_SWITCH_INTERRUPT		REG_BIT(8)
+#define   GT_RENDER_PIPECTL_NOTIFY_INTERRUPT	REG_BIT(4)
+#define   GT_CS_MASTER_ERROR_INTERRUPT		REG_BIT(3)
+#define   GT_RENDER_USER_INTERRUPT		REG_BIT(0)
 
 #define PVC_GT0_PACKAGE_ENERGY_STATUS		XE_REG(0x281004)
 #define PVC_GT0_PACKAGE_RAPL_LIMIT		XE_REG(0x281008)
diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
index 67ce087e21d0..2c214bb9b671 100644
--- a/drivers/gpu/drm/xe/regs/xe_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_regs.h
@@ -7,12 +7,6 @@
 
 #include "regs/xe_reg_defs.h"
 
-#define   GT_WAIT_SEMAPHORE_INTERRUPT		REG_BIT(11)
-#define   GT_CONTEXT_SWITCH_INTERRUPT		REG_BIT(8)
-#define   GT_RENDER_PIPECTL_NOTIFY_INTERRUPT	REG_BIT(4)
-#define   GT_CS_MASTER_ERROR_INTERRUPT		REG_BIT(3)
-#define   GT_RENDER_USER_INTERRUPT		REG_BIT(0)
-
 #define TIMESTAMP_OVERRIDE					XE_REG(0x44074)
 #define   TIMESTAMP_OVERRIDE_US_COUNTER_DENOMINATOR_MASK	REG_GENMASK(15, 12)
 #define   TIMESTAMP_OVERRIDE_US_COUNTER_DIVIDER_MASK		REG_GENMASK(9, 0)
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 86b863b99065..1fa5cf5eea97 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -9,7 +9,6 @@
 
 #include "regs/xe_engine_regs.h"
 #include "regs/xe_gt_regs.h"
-#include "regs/xe_regs.h"
 #include "xe_assert.h"
 #include "xe_bo.h"
 #include "xe_device.h"
-- 
2.43.0

