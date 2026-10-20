Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A59E606A319
	for <intel-xe@archiver.kernel.org>; Tue, 20 Oct 2026 02:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YxkkFoX0
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CCDA10F1CB;
	Tue, 20 Oct 2026 02:37:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3D8710F1CB
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Oct 2026 02:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792463860; x=1823999860;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=traalHYi2eFl3Q8y5HzUUXzlXhywDa1atkF4zurJJ0U=;
 b=YxkkFoX0nylCA1u9j91vwZ40KGT5ueSeVframQoh1kbPbBnVfiSpbq6h
 c/fjYwR9IHC+ssoOfppHr3rJHXSOu1z0sgEIYfOVBJ7HR6S7lmq37lhG3
 qSOmL2VgDsuBpozq08a3KVNTT/cl5uu5xYxKq1Dr4xxhIwEq6F/eCuiSR
 zg/Ku6XnRu6YEhHRdx3mje/W29UULqvIy+xp1THnZ/F8/LPxtRW3+Dseu
 xLd7ms3BwcRaGKEwMK/dqV5BVdDOI2dMviGC0HRxsbQ5ko3w4d7HKueEp
 fZTSYtp0NSvOuwF7nzCfctX0joy0I+GOLThWwmg9AsWbIaCoW4/qzpA+D Q==;
X-CSE-ConnectionGUID: a07Bh5DBTEmPp2xzWdDgRQ==
X-CSE-MsgGUID: IMc6XFhxSYaRq7oBEEnq+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1040811"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1040811"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 19:37:40 -0700
X-CSE-ConnectionGUID: tW2PBZxQQBSdeW3hIVeG0Q==
X-CSE-MsgGUID: 1NI56CqqTpGmkyV7Krn2dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2648725"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa005.jf.intel.com with ESMTP; 19 Oct 2026 19:37:38 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, michal.wajdeczko@intel.com, lukasz.laguna@intel.com,
 matthew.d.roper@intel.com, matthew.brost@intel.com,
 mallesh.koujalagi@intel.com, rodrigo.vivi@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v13 7/9] drm/xe/amc: Guard xe_amc_work() with runtime PM
Date: Tue, 20 Oct 2026 08:06:07 +0530
Message-ID: <20261020023641.200658-8-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020023641.200658-1-raag.jadav@intel.com>
References: <20261020023641.200658-1-raag.jadav@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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

