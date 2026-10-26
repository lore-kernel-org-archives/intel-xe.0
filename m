Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C21F606A31D
	for <intel-xe@archiver.kernel.org>; Mon, 26 Oct 2026 06:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=esaicJK6
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7F4E10EA53;
	Mon, 26 Oct 2026 06:05:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BA6F10EA90
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Oct 2026 06:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792994736; x=1824530736;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=exdxt4WH9SrQ3bIhLbpb70yNRF4eBULLntJwNGVQzi8=;
 b=esaicJK6tWqzEzx6AMysY+hrEmWkq1tY23ajKnFvM4qXKydrtg9dSNcy
 U10NZopF1s/BHbWNqxXmw0aUVW19AeRhzb8GgAR7290tpfXp58zUU3m9G
 suTMh2TmMLFXdj5diZKZHzXPX7zdLUE8XIx6CDyyHRmz0FVqtYJZod3bU
 gfojkkpo7bsMmc4N1zMNyUvvMLOmI5U4ym0oXRZ+K+VhVt8Jc9vdUpZXI
 5CS0zuAQfq+dskFd5u49SgIGZECI9g6iDzynUfD1PiobrFLjX2agtVb9e
 BsEZc7Cyf1+tBJb0tEwOgO7NN/2cOKJR61dCHsKPXJsINHkjk7mcyn4St g==;
X-CSE-ConnectionGUID: 7mBWkxu6Rq2mIRIEy/edfw==
X-CSE-MsgGUID: l1RCPdxDQ6CkxBsSYRYicg==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1531038"
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="1531038"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2026 23:05:35 -0700
X-CSE-ConnectionGUID: OCPGPelFRO2ljmenWkoKNg==
X-CSE-MsgGUID: nfRCb1DuTumXRMmBKG4alg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="4557337"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2026 23:05:32 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, tejas.upadhyay@intel.com
Subject: [PATCH v2 6/9] drm/xe/pci: Add upstream switch port lookup helper
Date: Mon, 26 Oct 2026 11:35:05 +0530
Message-ID: <20261026060459.771448-17-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20261026060459.771448-11-riana.tauro@intel.com>
References: <20261026060459.771448-11-riana.tauro@intel.com>
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

Move the USP lookup logic out of RAS code and into the PCI
layer so it can be reused by other callers.

No functional change.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 23 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pci.h |  1 +
 drivers/gpu/drm/xe/xe_ras.c | 19 ++-----------------
 3 files changed, 26 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 0c13eb901aa7..a9b8e65dff07 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -1521,6 +1521,29 @@ struct xe_device *xe_pci_to_pf_device(struct pci_dev *pdev)
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
index 2b1a7cb01b0d..a91c3d924e8c 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -10,6 +10,7 @@
 #include "xe_device.h"
 #include "xe_drm_ras.h"
 #include "xe_log.h"
+#include "xe_pci.h"
 #include "xe_pm.h"
 #include "xe_printk.h"
 #include "xe_ras.h"
@@ -462,22 +463,6 @@ static void get_offline_list(struct xe_device *xe)
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
@@ -485,7 +470,7 @@ static void ras_usp_aer_init(struct xe_device *xe)
 	u16 aer_cap;
 	u32 status;
 
-	usp = find_usp_dev(pdev);
+	usp = xe_pci_get_usp_dev(pdev);
 	if (!usp)
 		return;
 
-- 
2.47.1

