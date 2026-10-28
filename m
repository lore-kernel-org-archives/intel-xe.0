Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE426606A31A
	for <intel-xe@archiver.kernel.org>; Wed, 28 Oct 2026 09:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mJx1NvTi
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9470010E5BB;
	Wed, 28 Oct 2026 09:58:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED14D10FB13
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Oct 2026 09:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793181483; x=1824717483;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ShRAkLWmKGYSc5UWMPGJTpZrcZNFjxxVYatjrtEs744=;
 b=mJx1NvTipMKc4STJMHgN75yp+d/Z8WKh07F1x2cFAdo5Walhl59+QTri
 FdSoIm3P178dZ6ladkwjvR4qTlNetXAiUsq0NLzct3kYOFaZeelDeEg6a
 MHC3dGRQjrS+GDIbDFI58leHKaUsrHMx2CMPonE9kVCFzJ2ZliZq45CzB
 TndBW4UC4Td4Av13e3CJm+srVq+Hhj9Mwbhf3pnBrxfhm7l2dpkvC6q0t
 i7hyygfsjPa5GTqlGvD66fQ2aLc+fKPefUHrw/VAtlHVBg7ZHBKDK8SRS
 EdYILXlI5enyRvlrjr9EvHuIw5FPNnSoJk3vrGCCwWNMuHlz/8PiD1oz5 g==;
X-CSE-ConnectionGUID: z1/c8BxCTx2a/uK1Jhn66Q==
X-CSE-MsgGUID: ADwcMpqmTDu/B5WOXQCDow==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1913990"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1913990"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 02:58:03 -0700
X-CSE-ConnectionGUID: bCoi7rulSZmlCfCvYTZ0pw==
X-CSE-MsgGUID: g2JlrstyR06sF0Czs+q+7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4782795"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 02:58:00 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, himal.prasad.ghimiray@intel.com,
 arvind.yadav@intel.com, syed.abdul.muqthyar.ahmed@intel.com,
 nitin.r.gote@intel.com
Subject: [PATCH v6 10/10] drm/xe/xe_ras: Report correctable errors using SIGID
Date: Wed, 28 Oct 2026 15:27:34 +0530
Message-ID: <20261028095723.734387-22-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028095723.734387-12-badal.nilawar@intel.com>
References: <20261028095723.734387-12-badal.nilawar@intel.com>
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
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Cc: Raag Jadav <raag.jadav@intel.com>
---
v4:
 - Pass structured log component to xe_log_from() (sashiko)
---
 drivers/gpu/drm/xe/xe_ras.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 5eeccc920d7c..c4ff618cccf0 100644
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

