Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BEA606A31A
	for <intel-xe@archiver.kernel.org>; Wed, 28 Oct 2026 07:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=M34Dwi9k
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A7CF10E5A9;
	Wed, 28 Oct 2026 07:28:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDF7610E5A9
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Oct 2026 07:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793172495; x=1824708495;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HMortoAoGrDLdTL6BGtNdhaTC4ramUx1HkztJxPkkHE=;
 b=M34Dwi9k8tLMeRZRIpaGJak81e//xztdUGw20l7dvveutUKbvImjRSGa
 GItHeTWUBCxD/BwfMKG9AWUsMnPvoBlgJaw/Sb4BuqjBopm7NEWZIQZhz
 4n/lD6C3om8zahb7ELckzY1UjFB6ZNCm3uM0OXBVlzMCiwV2yn/6nNv1d
 /FSgyK9/WQvssZLtfoKD1f5DgjY+NcVhMgIv4ZjGSQfLuOk9zRNOQ3hxj
 X+v7qVEtccOTIADzgIICe5zHwmzhkwxFePcqOe9Y78KWn+wKJH70sNrRz
 BDtYX9TOwwDMmrFIhwFm4v+8Pt0NTMVGdfIxVR3Rhk42iHykXoBBvaNyQ A==;
X-CSE-ConnectionGUID: 16ouHSBVRZqNuI01ezu3zQ==
X-CSE-MsgGUID: CuTmwuijQr2FaqYD6Fcqcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1876406"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1876406"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 00:28:14 -0700
X-CSE-ConnectionGUID: XiwPNcLXSQ6NfVp2dH9BwA==
X-CSE-MsgGUID: 4qABrsNPTMSbLdrHZDfT5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4895210"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 00:28:12 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, raag.jadav@intel.com,
 mallesh.koujalagi@intel.com
Subject: [PATCH v2] drm/xe/xe_pci_error: Wait for pcode init post SBR
Date: Wed, 28 Oct 2026 12:58:04 +0530
Message-ID: <20261028072803.937955-2-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
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

Pcode init complete indicates the device is ready, with device memory
initialization complete. Wait for Pcode init before accessing the
device post Secondary Bus Reset (SBR).

In case of failure, enter survivability mode.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 drivers/gpu/drm/xe/xe_pci_error.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
index 9bf0da3a3d15..0675b5a8f643 100644
--- a/drivers/gpu/drm/xe/xe_pci_error.c
+++ b/drivers/gpu/drm/xe/xe_pci_error.c
@@ -9,6 +9,7 @@
 #include "xe_gt.h"
 #include "xe_log.h"
 #include "xe_pci.h"
+#include "xe_pcode.h"
 #include "xe_pm.h"
 #include "xe_printk.h"
 #include "xe_ras.h"
@@ -112,6 +113,12 @@ static pci_ers_result_t xe_pci_error_slot_reset(struct pci_dev *pdev)
 		return PCI_ERS_RESULT_DISCONNECT;
 	}
 
+	err = xe_pcode_ready(xe, true);
+	if (err) {
+		xe_survivability_mode_runtime_enable(xe);
+		return PCI_ERS_RESULT_DISCONNECT;
+	}
+
 	/*
 	 * Secondary Bus Reset causes all VRAM state to be lost along with
 	 * hardware state. As an initial step, re-probe the device to
-- 
2.47.1

