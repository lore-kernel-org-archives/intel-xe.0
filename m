Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C2FDCCA463
	for <intel-xe@archiver.kernel.org>; Sat, 17 Oct 2026 03:50:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D40210E28A;
	Sat, 17 Oct 2026 03:50:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E48010E28A
 for <intel-xe@lists.freedesktop.org>; Sat, 17 Oct 2026 03:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792208998; x=1823744998;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=traalHYi2eFl3Q8y5HzUUXzlXhywDa1atkF4zurJJ0U=;
 b=Q4uagIVqGmntEuvjbip/9ykvxQGIUiq9BVG2QaBjCwY5VAJJiJhAVaMv
 geRYzOL/gzwkIxbI866pAITpINS+vRLCTLBZ1ZI/ytm1TPuP/UVzs5u2y
 hnsXfBfgwceEAE79/nkLivbpsw/vMEP0Pt/7RGAoxceDtoHTup7jdDQ07
 5lHLotcwflw3HbTGEJH38QxjL/cV9AIn7X6PVVYd6eYh1oABnSo5L6ip0
 KozWBnR53TTEnC9bxRK4xno2oh4tjr1g7YcZG7h0tZBUuUid0ZQhnv+YL
 9qjKDFf1e34UAdJcLU435eovxWAn6q8b+2xl9Sg8MgUoitgG2lsiD4NpZ Q==;
X-CSE-ConnectionGUID: EvfkBPm/Q8ml0p5mH/WESw==
X-CSE-MsgGUID: 0surixenTMaJYLy9HkxNyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11937"; a="1011722"
X-IronPort-AV: E=Sophos;i="6.27,163,1787036400"; 
   d="scan'208";a="1011722"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 20:49:57 -0700
X-CSE-ConnectionGUID: fuM5IrnhRk618HqpD1vBkA==
X-CSE-MsgGUID: ncj7Xby+QoykuEW3K/OjxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,163,1787036400"; 
   d="scan'208";a="2154372"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa003.fm.intel.com with ESMTP; 16 Oct 2026 20:49:54 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, michal.wajdeczko@intel.com, lukasz.laguna@intel.com,
 matthew.d.roper@intel.com, matthew.brost@intel.com,
 mallesh.koujalagi@intel.com, rodrigo.vivi@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v11 7/9] drm/xe/amc: Guard xe_amc_work() with runtime PM
Date: Sat, 17 Oct 2026 09:17:44 +0530
Message-ID: <20261017034842.67054-8-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261017034842.67054-1-raag.jadav@intel.com>
References: <20261017034842.67054-1-raag.jadav@intel.com>
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

xe_device_declare_wedged() callers are expected to hold a runtime PM
reference. Fix it.

Fixes: a55b76b8bc2c ("drm/xe/i2c: Fix the interrupt handling")
Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
v10: Guard wedge callers with runtime PM (Sashiko)
v11: Use traditional xe_pm_runtime_get/put() with goto (Sashiko)
---
 drivers/gpu/drm/xe/xe_amc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_amc.c b/drivers/gpu/drm/xe/xe_amc.c
index b7390a4ee3ce..1f85df598e56 100644
--- a/drivers/gpu/drm/xe/xe_amc.c
+++ b/drivers/gpu/drm/xe/xe_amc.c
@@ -15,9 +15,11 @@
 #include "regs/xe_i2c_regs.h"
 
 #include "xe_amc.h"
+#include "xe_any.h"
 #include "xe_device.h"
 #include "xe_i2c.h"
 #include "xe_mmio.h"
+#include "xe_pm.h"
 
 /**
  * DOC: Add-In Management Controller (AMC)
@@ -108,11 +110,14 @@ static void xe_amc_work(struct work_struct *work)
 {
 	const struct amc_request *request = &amc_get_alert_reason;
 	struct xe_amc *amc = from_work(amc, work, work);
+	struct xe_device *xe = xe_any_to_xe(amc->i2c->drm_dev);
 	u8 alert_reason = AMC_ALERT_UNKNOWN;
 	struct amc_response response;
 	struct i2c_client *client;
 	int ret;
 
+	xe_pm_runtime_get(xe);
+
 	client = amc->i2c->client[XE_I2C_CLIENT_AMC];
 	if (IS_ERR_OR_NULL(client))
 		goto out_reassert_interrupt;
@@ -167,6 +172,8 @@ static void xe_amc_work(struct work_struct *work)
 		dev_warn(amc->i2c->drm_dev, "unknown AMC alert: %d\n", alert_reason);
 		break;
 	}
+
+	xe_pm_runtime_put(xe);
 }
 
 void xe_amc_handle_alert(struct xe_i2c *i2c)
-- 
2.43.0

