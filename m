Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D1CDCCF2D5
	for <intel-xe@archiver.kernel.org>; Mon, 19 Oct 2026 02:38:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E07110E196;
	Mon, 19 Oct 2026 02:37:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97EF110E775
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Oct 2026 02:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792377469; x=1823913469;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=traalHYi2eFl3Q8y5HzUUXzlXhywDa1atkF4zurJJ0U=;
 b=GZJ0ZFYkFpPT0mtwsVegUzB9VihcQvASGthabWf3XKsD3lRT1URWrzjG
 cTvhu0Xzydrqf2yKxNZaiE3uUPOwOt+HM4LyfhwlVVVem15lZZJkc7wNo
 dqiR70qVKOXrAgfYBo0WSnavV8f0kOUcj2GfKdqh+zLGsfAq+XPjBdZkZ
 KRkcb/1pZl2WSoicvw4QvaPvRFgaZGDyNDFw4ppMPIWmcikUFZ4HbrDes
 dbsHuVy7EbiZgOkHVKB/BUOPkuA6r0q8pBDl6v094Y5f+jOjbLrRfQcCc
 1UMearVmGNb0FZtB0SCQAFuVbblQoweIPgUnksaaPs685WwEfdY7FCUjx w==;
X-CSE-ConnectionGUID: gK0MC3liSdad6RyniJ69+Q==
X-CSE-MsgGUID: 789JpU+yRlKjTWpatbJbEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="943671"
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="943671"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2026 19:37:49 -0700
X-CSE-ConnectionGUID: TyxWeGMHSsmX7LEU7wtXTg==
X-CSE-MsgGUID: 7S6rpVAGQvunkB5jX7wGJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="2526516"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa002.fm.intel.com with ESMTP; 18 Oct 2026 19:37:47 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, michal.wajdeczko@intel.com, lukasz.laguna@intel.com,
 matthew.d.roper@intel.com, matthew.brost@intel.com,
 mallesh.koujalagi@intel.com, rodrigo.vivi@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v12 7/9] drm/xe/amc: Guard xe_amc_work() with runtime PM
Date: Mon, 19 Oct 2026 08:06:38 +0530
Message-ID: <20261019023708.128835-8-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019023708.128835-1-raag.jadav@intel.com>
References: <20261019023708.128835-1-raag.jadav@intel.com>
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

