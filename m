Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EDCFCA6012
	for <intel-xe@archiver.kernel.org>; Fri,  9 Oct 2026 10:29:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ED2A112053;
	Fri,  9 Oct 2026 10:29:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cSsq2qsZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39C91112053
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Oct 2026 10:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791541793; x=1823077793;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=G2Ap7Tx6tGHXChEmc7W2Ik/Sl1MtxiVuUzlfwT0bWME=;
 b=cSsq2qsZXY3Y3qDwuhqM1ekGTlVqaDPse9Ntzv7YDy18YnKPQlBe9ZRb
 cGHotq20ZPZtnPXnKXxsfAGO65NhPiAQYTFe/QCJotDIR/8Q2AuAfZwcJ
 xhwBVC3FLTEbUSGHimluMg0zrOkSPnRAJJCkekFlGURAjOKvGpx2cUdqe
 OF4XbUvslkYyH4m/dGqc1f0hxMF3yZMVoUB4sQ956hz7pHs1FedC2y5Ca
 eLgyyMQ/aYysQNa1WFEjPZvHg9I/FR/4tnWcxV2ocYq6vJ7jnN75v4CK9
 3YCP5I2QARogMdL1kBYe4XReEkW/3Hp2+IPHh29GAaTDVX7rFHQGYfA/P A==;
X-CSE-ConnectionGUID: UZE9VPaPRxmiVDPbDipLHQ==
X-CSE-MsgGUID: ceS/ZI4lQsebZ4cgVpriHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="344103"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="344103"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 03:29:52 -0700
X-CSE-ConnectionGUID: 4/4Il8fkR/GGfTVRLeblag==
X-CSE-MsgGUID: lpLuWaaHTr+YuK8XO50i7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="2025628"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 03:29:49 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, himal.prasad.ghimiray@intel.com,
 arvind.yadav@intel.com, syed.abdul.muqthyar.ahmed@intel.com,
 nitin.r.gote@intel.com, pravalika.gurram@intel.com
Subject: [PATCH v4 12/12] drm/xe/xe_ras: Report correctable errors using SIGID
Date: Fri,  9 Oct 2026 16:16:15 +0530
Message-ID: <20261009104602.1075405-26-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261009104602.1075405-14-badal.nilawar@intel.com>
References: <20261009104602.1075405-14-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Use xe_log_* helper to report correctable errors.

Assisted-by: Copilot:Claude-Opus-5.5
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Cc: Raag Jadav <raag.jadav@intel.com>
---
v4:
 - Pass structured log component to xe_log_from() (sashiko)
---
 drivers/gpu/drm/xe/xe_ras.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index af2970941b59..9df2e8942bda 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -3,6 +3,8 @@
  * Copyright © 2026 Intel Corporation
  */
 
+#include <linux/bitfield.h>
+
 #include "xe_configfs.h"
 #include "xe_cper.h"
 #include "xe_debugfs.h"
@@ -216,6 +218,12 @@ static u8 ras_sev_to_cper_sev(u8 ras_sev)
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
@@ -459,8 +467,11 @@ void xe_ras_counter_threshold_crossed(struct xe_device *xe,
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
2.54.0

