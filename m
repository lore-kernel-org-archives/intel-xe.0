Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9A2606A31B
	for <intel-xe@archiver.kernel.org>; Mon, 26 Oct 2026 06:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RykyqS4M
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 463B310EA80;
	Mon, 26 Oct 2026 06:05:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07C0F10EA8F
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Oct 2026 06:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792994743; x=1824530743;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7Uq9+54hy4zbZQ3kU+K9QsHLfMug+yU5Kmm1pOINlJs=;
 b=RykyqS4MOyCaZMWgmb6iWdE8YKimN7pCtRSgvH9AYCHRzfxGLybMbd35
 yqjEGdUxOVSy2W0/dGm2neP4RkpByQkQEABq3mrwKaA/0nTZDxuVuOWEQ
 pDlX/bl+ry2anriA5UuseuaL/+DMZz9WtN2kTEXiw4xK+Jy4OzSzUkRXF
 /g1YxCfOqGYBvKAWzeQbkrN1UmXot2d1bhRuLU1XhLp+sNwoxLfQg2tD5
 WLyvB//HT1iO/qn6/hBv1zceUo98e1NnLdfCDl5mgd3vn4NnClaOOagaJ
 Vj/xCpJQXkeW82c5PBQHRo+4k4fr1KaXGv22j5fSzncMhgcFOxTEOYeKq A==;
X-CSE-ConnectionGUID: xKkHZi9hRV+4opne9o9gZQ==
X-CSE-MsgGUID: nzGnuxc4RhKTga/1eDqZsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1531048"
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="1531048"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2026 23:05:43 -0700
X-CSE-ConnectionGUID: Ia7SPV2rTW6Ad+f3MO5q9A==
X-CSE-MsgGUID: h7VAVjpSRxaX/4W0tdxKwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="4557347"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2026 23:05:40 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, tejas.upadhyay@intel.com
Subject: [PATCH v2 8/9] drm/xe/xe_ras: Trigger SBR for all device errors
Date: Mon, 26 Oct 2026 11:35:07 +0530
Message-ID: <20261026060459.771448-19-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20261026060459.771448-11-riana.tauro@intel.com>
References: <20261026060459.771448-11-riana.tauro@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

There are two paths for error reporting. Uncorrectable non-fatal device
errors are reported via direct IRQ. Uncorrectable device fatal errors are
downgraded as non fatal uncorrectable internal errors and reported as AER.
Set the default action to Secondary Bus Reset (SBR) for device fatal
uncorrectable errors.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_ras.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 42fb24366a6b..3b07b2fa8cd4 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -3,6 +3,8 @@
  * Copyright © 2026 Intel Corporation
  */
 
+#include <generated/xe_device_wa_oob.h>
+
 #include "xe_assert.h"
 #include "xe_bo.h"
 #include "xe_configfs.h"
@@ -20,6 +22,7 @@
 #include "xe_sysctrl_mailbox.h"
 #include "xe_sysctrl_mailbox_types.h"
 #include "xe_ttm_vram_mgr.h"
+#include "xe_wa.h"
 #include "xe_wedge.h"
 
 /* Any non-null entry marks the page as offlined by firmware */
@@ -718,6 +721,7 @@ static int get_counter(struct xe_device *xe, struct xe_ras_error_class *counter,
 enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
 {
 	struct xe_sysctrl_mailbox_command command = {0};
+	struct xe_ras_state *ras = &xe->ras.state;
 	enum xe_ras_recovery_action final_action;
 	u32 remaining = XE_SYSCTRL_FLOOD_LIMIT;
 	struct xe_ras_get_soc_error response;
@@ -735,9 +739,16 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
 		return XE_RAS_RECOVERY_ACTION_RECOVERED;
 
 	BUILD_BUG_ON(BITS_PER_TYPE(sent) < XE_RAS_COMP_MAX);
-	/* Default action */
+	/* Default action for PCIe bus errors */
 	final_action = XE_RAS_RECOVERY_ACTION_RECOVERED;
 
+	/*
+	 * Device fatal errors are downgraded to non-fatal and reported as an uncorrectable
+	 * internal error. Set the default action to reset.
+	 */
+	if (ras->aer_path && XE_DEVICE_WA(xe, 14028434957))
+		final_action = XE_RAS_RECOVERY_ACTION_RESET;
+
 	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_GET_SOC_ERROR,
 				  NULL, 0, &response, sizeof(response));
 
-- 
2.47.1

