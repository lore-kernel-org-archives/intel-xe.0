Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6EFB606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 08:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CdztJ+Gx
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA21F10E444;
	Thu, 29 Oct 2026 08:30:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CDA710E444
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Oct 2026 08:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793262639; x=1824798639;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4HZ00xXiSqnRCCt41tGSe5qhOWjPffGkdaL3UIjBOh0=;
 b=CdztJ+Gxv4YXTPW+ks9hwUDtM4ZTObC4I+x9xniStLXc7tEEDj0zPE28
 JcHw7S64+OFhccZcZ8K2fxSHHPxdz1FzlXHl646nX5cK17D7tYLl6aEft
 7RtNZcokKsgM2ecOt9ejS6QA2euDWVR/p7j5za9dIwPb6XlqT3t0x5nhx
 jeOwaAyd952NOSevcS6UjZ1R8PcSNCXSUIV8rDNc1UcHvKzZzK+hfOkBF
 7Ihku/b5GyIHw04dnARYoSPY3hfgEy8WdiZz3w7aIgoFRC/ra4lX2p6a3
 YURnhVC6KrMJvQlcNOT1/xg6umrRRVtHRnKSXtz8kD2e44klWEilxgZFk A==;
X-CSE-ConnectionGUID: FSEN7MLLQPGbo20DefDEGQ==
X-CSE-MsgGUID: MuLav1alSCGY0pIbmUCEIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="2014740"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="2014740"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 01:28:36 -0700
X-CSE-ConnectionGUID: K1JDESc/RKuTPuv6ISiSqA==
X-CSE-MsgGUID: ALdJ0KQcQi+rUU339wXs9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5166549"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 01:28:31 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, himal.prasad.ghimiray@intel.com,
 arvind.yadav@intel.com, syed.abdul.muqthyar.ahmed@intel.com,
 nitin.r.gote@intel.com
Subject: [PATCH v7 10/10] drm/xe/xe_ras: Report correctable errors using SIGID
Date: Thu, 29 Oct 2026 13:58:03 +0530
Message-ID: <20261029082752.1739281-22-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261029082752.1739281-12-badal.nilawar@intel.com>
References: <20261029082752.1739281-12-badal.nilawar@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Use xe_log_* helper to report correctable errors.

Example:
	xe 0000:03:00.0: [drm] *ERROR* SIGID=203 CORRECTED
(010200180000000100000000) [Hardware Error]: CORE_COMPUTE: error detected

Assisted-by: LLM
Reviewed-by: Raag Jadav <raag.jadav@intel.com>
Cc: Raag Jadav <raag.jadav@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_ras.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 58d3834345bc..09b3c96042d5 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -3,6 +3,8 @@
  * Copyright © 2026 Intel Corporation
  */
 
+#include <linux/bitfield.h>
+
 #include "xe_assert.h"
 #include "xe_bo.h"
 #include "xe_configfs.h"
@@ -226,6 +228,12 @@ static int ras_status_to_errno(u32 status)
 	}
 }
 
+static u16 ras_comp_to_log_comp(u8 component)
+{
+	return FIELD_PREP(XE_LOG_COMPONENT_CLASS_MASK, XE_LOG_COMPONENT_CLASS_HARDWARE) |
+	       FIELD_PREP(XE_LOG_COMPONENT_TYPE_MASK, component);
+}
+
 static inline const char *sev_to_str(u8 severity)
 {
 	if (severity >= XE_RAS_SEV_MAX)
@@ -714,8 +722,11 @@ void xe_ras_counter_threshold_crossed(struct xe_device *xe,
 		if (!ras_counter_is_valid(xe, &errors[id]))
 			continue;
 
-		xe_warn(xe, "[RAS]: %s %s detected\n",
-			comp_to_str(component), sev_to_str(severity));
+		xe_log_from(xe, ras_sev_to_cper_sev(severity),
+			    ras_comp_to_hw_sigid(component),
+			    ras_comp_to_log_comp(component),
+			    &errors[id], sizeof(errors[id]),
+			    "error detected\n");
 
 		/* Send event once per component */
 		if (sent & BIT(component))
-- 
2.56.0

