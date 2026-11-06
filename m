Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65192606A329
	for <intel-xe@archiver.kernel.org>; Fri,  6 Nov 2026 07:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hHEBwcfB
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AA1E10EC81;
	Fri,  6 Nov 2026 07:20:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A738610EC81
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Nov 2026 07:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793949621; x=1825485621;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=i6NpFTaMjWPP/Us+KxeDKZPV9zehSBHGBv7aybPmlvE=;
 b=hHEBwcfBs5wTSIZRaUzzKEnAUO2AHjV4Vv95IEdfYwgchS17vdLHLWjM
 ejaimQshFn4lkWuk3HuAnkuYK9GwIspCo0NjTjIZHREqjlA4iRmSxSUWj
 wKmHX7qwWprnnzhDS1bd0wG49Lwy/9NBiCz6e+kE76CGiZNawm9tozUGo
 32NqeQ/E5aXWfHPmJqcaU7OuLdYUtV9yn0EqGSwEVVzE/OBeHf66ADEr7
 HZfLSoc9i1vvMFIeR899/K+q/0t4deHYMygAmvzwQCk4VexoS7NPZskwC
 YpbrJ4ikPpHwuPD3Vrm8bC/8/UpcmPosoppDU8gw8hCrFsgDkac08BakV Q==;
X-CSE-ConnectionGUID: G/77FnoURSSps5eXxFYUsA==
X-CSE-MsgGUID: kP0h2mFPQRSUUCrEQTE/Xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2659352"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2659352"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 23:20:21 -0800
X-CSE-ConnectionGUID: WwgK6hHAT2a/vPkZJBh7pw==
X-CSE-MsgGUID: 5WxGrDPURNSxHcgzpKu91A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7549068"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 23:20:18 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, raag.jadav@intel.com,
 mallesh.koujalagi@intel.com, badal.nilawar@intel.com,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: [PATCH v4 5/8] drm/xe/pci: Add upstream switch port lookup helper
Date: Fri,  6 Nov 2026 12:49:50 +0530
Message-ID: <20261106071944.2693854-15-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20261106071944.2693854-10-riana.tauro@intel.com>
References: <20261106071944.2693854-10-riana.tauro@intel.com>
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

Move the USP lookup logic out of RAS code and into the PCI
layer so it can be reused by other callers.

No functional change.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 23 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pci.h |  1 +
 drivers/gpu/drm/xe/xe_ras.c | 19 ++-----------------
 3 files changed, 26 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index ba23ec60477b..c4dca113c947 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -1526,6 +1526,29 @@ struct xe_device *xe_pci_to_pf_device(struct pci_dev *pdev)
 	return to_xe_device(drm);
 }
 
+/**
+ * xe_pci_get_usp_dev() - Get the upstream switch port device.
+ * @pdev: pci device of SGunit
+ *
+ * Device Hierarchy:
+ * Upstream Switch Port (USP) --> Virtual Switch Port (VSP) --> SGunit (GPU endpoint)
+ *
+ * The function traverses the PCI device hierarchy to find the upstream switch port
+ * device.
+ *
+ * Return: pointer to USP &pci_dev, NULL otherwise.
+ */
+struct pci_dev *xe_pci_get_usp_dev(struct pci_dev *pdev)
+{
+	struct pci_dev *vsp;
+
+	vsp = pci_upstream_bridge(pdev);
+	if (!vsp)
+		return NULL;
+
+	return pci_upstream_bridge(vsp);
+}
+
 int xe_register_pci_driver(void)
 {
 	return pci_register_driver(&xe_pci_driver);
diff --git a/drivers/gpu/drm/xe/xe_pci.h b/drivers/gpu/drm/xe/xe_pci.h
index 11bcc5fe2c5b..3dc3539c3970 100644
--- a/drivers/gpu/drm/xe/xe_pci.h
+++ b/drivers/gpu/drm/xe/xe_pci.h
@@ -11,5 +11,6 @@ struct pci_dev;
 int xe_register_pci_driver(void);
 void xe_unregister_pci_driver(void);
 struct xe_device *xe_pci_to_pf_device(struct pci_dev *pdev);
+struct pci_dev *xe_pci_get_usp_dev(struct pci_dev *pdev);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index cd753c82b0ff..3aea4969af13 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -13,6 +13,7 @@
 #include "xe_device.h"
 #include "xe_drm_ras.h"
 #include "xe_log.h"
+#include "xe_pci.h"
 #include "xe_pm.h"
 #include "xe_printk.h"
 #include "xe_ras.h"
@@ -504,22 +505,6 @@ static void get_offline_list(struct xe_device *xe)
 			      &response, sizeof(response), &response.common, false);
 }
 
-static struct pci_dev *find_usp_dev(struct pci_dev *pdev)
-{
-	struct pci_dev *vsp;
-
-	/*
-	 * Device Hierarchy:
-	 *
-	 * Upstream Switch Port (USP) --> Virtual Switch Port (VSP) --> SGunit (GPU endpoint)
-	 */
-	vsp = pci_upstream_bridge(pdev);
-	if (!vsp)
-		return NULL;
-
-	return pci_upstream_bridge(vsp);
-}
-
 static void ras_usp_aer_init(struct xe_device *xe)
 {
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
@@ -527,7 +512,7 @@ static void ras_usp_aer_init(struct xe_device *xe)
 	u16 aer_cap;
 	u32 status;
 
-	usp = find_usp_dev(pdev);
+	usp = xe_pci_get_usp_dev(pdev);
 	if (!usp)
 		return;
 
-- 
2.47.1

