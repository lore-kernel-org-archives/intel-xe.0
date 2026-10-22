Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11FE606A31D
	for <intel-xe@archiver.kernel.org>; Thu, 22 Oct 2026 05:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=f8N6i6s+
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96812112307;
	Thu, 22 Oct 2026 05:13:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2E26112315
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Oct 2026 05:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792646023; x=1824182023;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9YB30P4G3AWCnDTEIo7jPJY3CGap/AEjsc4hpaPrgFU=;
 b=f8N6i6s+Raj4/T0eXpDub3V/XOn/7JCieLFcBpkcBvPAuxWBULJ0CgCC
 xrEbJDUq9VRwiA5H1qIc1aq1XcB3FlOy+24rgDtP3Bfo4w13WIK3dN9fI
 kgERcj2Cho1HtRRjfh44o0Mz95HewnMgeSthfp8DX5RQ08hH3wNnRtanu
 ly4sswre7Fa1IPB0V8a3WKkia9pPLSPNwjYWEEbBeAlZQa6MyMijFKVR2
 u7CPLyr0PEqh8J44zMI6zBWqS++fk9tizZzqIEOADqzMtflM05RgTzzKV
 YCU1Lxk68+CehYyFdad7oOeKyvZH8qek+eVgm2aMZqii2UajJ7pT0EYKA w==;
X-CSE-ConnectionGUID: OCMJALHlRb6CM2HFPrIMAA==
X-CSE-MsgGUID: yKK2OyMgQkmEUf0IVVSPqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1393954"
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="1393954"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 22:13:42 -0700
X-CSE-ConnectionGUID: WOazyIjyQISrw3vVoeIiHA==
X-CSE-MsgGUID: EC7jP096QjeHTFc9xAzFBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="3268764"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa004.jf.intel.com with ESMTP; 21 Oct 2026 22:13:40 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, michal.wajdeczko@intel.com, lukasz.laguna@intel.com,
 matthew.d.roper@intel.com, matthew.brost@intel.com,
 mallesh.koujalagi@intel.com, rodrigo.vivi@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v14 7/9] drm/xe/amc: Guard xe_amc_work() with runtime PM
Date: Thu, 22 Oct 2026 10:42:31 +0530
Message-ID: <20261022051303.282805-8-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261022051303.282805-1-raag.jadav@intel.com>
References: <20261022051303.282805-1-raag.jadav@intel.com>
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

xe_device_declare_wedged() callers are expected to hold a runtime PM
reference. Fix it.

Fixes: a55b76b8bc2c ("drm/xe/i2c: Fix the interrupt handling")
Signed-off-by: Raag Jadav <raag.jadav@intel.com>
Reviewed-by: Riana Tauro <riana.tauro@intel.com>
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

