Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DFD8606A32C
	for <intel-xe@archiver.kernel.org>; Tue,  3 Nov 2026 06:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OW4BlAiU
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 351C210F368;
	Tue,  3 Nov 2026 06:10:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D19710F368
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Nov 2026 06:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793686198; x=1825222198;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XtkCyW89snwGlokjfKnC1VcI/FKxYRR87s4IsvtfPMc=;
 b=OW4BlAiUYKRt3UgARrUVBpvLB1Lh/cppd/NwsaGtb7PDlYK1Mp2iUjAR
 +qO9tbBa4PH620hgN14LKo2BEy4flXx+B9Do8peQT3xh+O5uaWI5AaQFl
 rYMrT2QiHucQVYB1k9slPFKPW5tKFJTW223yKEq3MKUtoevcJbSARc9b2
 sidArT93jsZB2s7P60vByXAh46/Z6AOVWs8zvYdt9NkCJWzl5RnH/A5tT
 oHiNRQLDvI15Zd7bqR0lNAx3VxERd7uaznXOwJAlQf/E8SpOHpoqvJW0+
 xNWilzpLtgNTN2bdpemDUlu3XAl5h9VRkkd8btSsSZmlJ+eMEmiU90v6W A==;
X-CSE-ConnectionGUID: J8lHEcwGTEC7VdkATu4/QQ==
X-CSE-MsgGUID: FC1sSoaKTp2lkZeYo24Fsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2276709"
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="2276709"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 22:09:58 -0800
X-CSE-ConnectionGUID: mOGlwrYfTfC5Oi/lFLAg+A==
X-CSE-MsgGUID: UMMATZJxSZ+r9+Mr7WeGtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="6446352"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 22:09:55 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, raag.jadav@intel.com,
 ravi.kishore.koppuravuri@intel.com, mallesh.koujalagi@intel.com,
 tejas.upadhyay@intel.com, Andi Shyti <andi.shyti@linux.intel.com>
Subject: [PATCH v3 4/7] drm/xe/pci: Add upstream switch port lookup helper
Date: Tue,  3 Nov 2026 11:39:34 +0530
Message-ID: <20261103060929.1586783-13-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20261103060929.1586783-9-riana.tauro@intel.com>
References: <20261103060929.1586783-9-riana.tauro@intel.com>
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
index d13599d79ae9..1fa9b683f045 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -1524,6 +1524,29 @@ struct xe_device *xe_pci_to_pf_device(struct pci_dev *pdev)
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

