Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7745606A329
	for <intel-xe@archiver.kernel.org>; Tue,  3 Nov 2026 08:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kPZrHlBp
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7070110E500;
	Tue,  3 Nov 2026 08:19:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 874D610E500
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Nov 2026 08:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793693952; x=1825229952;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qTmIpFev3YS2yOANWF0naGSCxPIdjYI2+EgHh9WHjvg=;
 b=kPZrHlBpseStUumw4MoZe6Y36Gg/QGZV3K8wbgaIutG0wB4iDMUnkcGS
 kV4vc+9lt9/ZSLklDJ2zst/EqQi8unviDK3GI5c1aadBEGqGKd3i8XRKX
 56Xn+WVDdlFQFcCI8p1z66t4Yf8M8u419ypEfOj2n2bL5hIOVa2l/AS9x
 XnL5ie2ixPp5FsRYCWhVt35TX5W5NY6E/3184Lh5CPwj/pAvyVfhfYFry
 Re3LdirjiJf3SZG311BVmVJ6vfZCV3EQj13HYkuwEfdlnQ4eCqsQD2kj0
 zukrGHifguyGIOqxlIlt2Wipt3roVZ6ST0pEJeUjahn46QrekqoFEc+ar A==;
X-CSE-ConnectionGUID: KFFR7kTXTJe75zhGu8zfxA==
X-CSE-MsgGUID: YFO9Hue3Qh2KT2kAcKx4bA==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2298380"
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="2298380"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 00:19:12 -0800
X-CSE-ConnectionGUID: cgqnLTppQGGXXpMIHwyulA==
X-CSE-MsgGUID: +BCgTtLcQkyoiDMZmxQ6pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="6686052"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 00:19:11 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com,
	anshuman.gupta@intel.com
Subject: [PATCH v3] drm/xe/xe_pci_error: Wait for pcode init post SBR
Date: Tue,  3 Nov 2026 13:49:03 +0530
Message-ID: <20261103081902.1609156-2-riana.tauro@intel.com>
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

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 drivers/gpu/drm/xe/xe_pci_error.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
index 9bf0da3a3d15..03a9f295d077 100644
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
@@ -112,6 +113,11 @@ static pci_ers_result_t xe_pci_error_slot_reset(struct pci_dev *pdev)
 		return PCI_ERS_RESULT_DISCONNECT;
 	}
 
+	err = xe_pcode_ready(xe, true);
+	/* TODO: dump survivability info on pcode init failure */
+	if (err)
+		return PCI_ERS_RESULT_DISCONNECT;
+
 	/*
 	 * Secondary Bus Reset causes all VRAM state to be lost along with
 	 * hardware state. As an initial step, re-probe the device to
-- 
2.47.1

