Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0BBD606A321
	for <intel-xe@archiver.kernel.org>; Thu, 12 Nov 2026 06:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mlbCh4je
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FF2E10E4F8;
	Thu, 12 Nov 2026 06:07:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 915D010E516
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Nov 2026 06:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794463650; x=1825999650;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tzSlPKD0zb+QGPGoHYFbP9W/6aQE8JBe3yFPQlv/Xrs=;
 b=mlbCh4jeoStvsjIFkdpiHTWp1WEib3arVBZfsPN9SG9TyVP+4wxGLaiw
 3I7kor38suC7TXdTD1yJ+IQOIv1/wvMUWzTxEJM/UvEpNcf6yTsAG13cU
 bZ26fhmRgdEalktvVU+WIXQwS4to4BZxRel41X43+BglgT5xjoVXND9bI
 mOBmtet27cr3M+BYgwX+2DmhSrvBviBs8JJW6VE6M+6nfrTzj23+RWb77
 tTslZVy+uMcJ6TdJ8DHCcAHVtdwU246loNnRapmJo23Y5ZudtC91P+cvZ
 XABwuqY05EGC2lArJO0+OSo0XBbWnPJTUWf9bdrT7D+x0Mf9Au14y7Mr1 Q==;
X-CSE-ConnectionGUID: gMxPf0wnRwqFAZV0/Ujl/g==
X-CSE-MsgGUID: c8i/VqNkRC6w9ypBRVPFow==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3265014"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3265014"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 22:07:30 -0800
X-CSE-ConnectionGUID: cAqqDYNtR4C0+/BFc1KYOg==
X-CSE-MsgGUID: 0M/jKsRcRm2+N9P9h6ViuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8576246"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 22:07:27 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 aravind.iddamsetty@linux.intel.com, raag.jadav@intel.com,
 badal.nilawar@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, rodrigo.vivi@intel.com,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: [PATCH v5 5/8] drm/xe/pci: Add upstream switch port lookup helper
Date: Thu, 12 Nov 2026 11:37:07 +0530
Message-ID: <20261112060701.3327125-15-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20261112060701.3327125-10-riana.tauro@intel.com>
References: <20261112060701.3327125-10-riana.tauro@intel.com>
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
index ce231069880a..c6d844992cfa 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -1542,6 +1542,29 @@ struct xe_device *xe_pci_to_pf_device(struct pci_dev *pdev)
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

