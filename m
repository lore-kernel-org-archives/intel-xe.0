Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB8C606A31A
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 04:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=katVO2kT
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8778D10EC4C;
	Wed, 21 Oct 2026 04:13:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D256310E2E4
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Oct 2026 04:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792556030; x=1824092030;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HdOZxjkilMvNSSC0EiKqZ9+pVFlHnMTiyL6+FGrNRaM=;
 b=katVO2kTpnDQ8zjCXCfw1UhIG12pN4QTL1AaizGYzHC7HSzS0euT5KAd
 n0VEdDW7CV5qUeNzwVBef2Mdfq9hx7gS7cMu2965ROJoED9kgAQEEpN63
 eocdzywcucHfWJfAKbWOE36+LRKQUfPlq8thtkrsOprPfl0DOcV2wjRUk
 2kWRYEVlEEmGYpYo8xN1RvBrs6BrHri6gPDs/WZQ2xBf/dHM9B3gF6gYI
 PRPEmhlQEOQBF3c/2HRB2o2VLCxUxF6B5eADI1WXfUFiBHFuvB9HTYndO
 U0clJ+CYZJjLtI1XaEkkHGCnOPbmSwtSkIB8bXxsyZbTdEF3stce0S8xR g==;
X-CSE-ConnectionGUID: h/Z/qLWoRDCPjrRHJ3KeMA==
X-CSE-MsgGUID: i3pFP3hZRRqcSPXbsP/hJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1264310"
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="1264310"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 21:13:50 -0700
X-CSE-ConnectionGUID: fpEi++eUQoS2J84fIzcUFA==
X-CSE-MsgGUID: vMoWOgheSuqJp319iH1TNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="2868686"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by orviesa008.jf.intel.com with ESMTP; 20 Oct 2026 21:13:49 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com,
 Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH 1/6] drm/xe/pci: log ATS/PASID enablement state at probe
Date: Wed, 21 Oct 2026 09:41:12 +0530
Message-ID: <20261021041117.1774877-2-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021041117.1774877-1-naresh.kumar.g@intel.com>
References: <20261021041117.1774877-1-naresh.kumar.g@intel.com>
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

Add debug logging in xe_pci_probe() for ATS and PASID enablement state
when the corresponding capabilities are present.
This makes platform and IOMMU related bring up issues easier to diagnose.

Also add a small helper to report weather ATS and PASID are both enabled,
for use follow up checks that depend on both features.

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 7 +++++++
 drivers/gpu/drm/xe/xe_pci.h | 6 ++++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index e44b74b9aa27..40c0f4c42ed3 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -1275,6 +1275,13 @@ static int __xe_pci_probe(struct pci_dev *pdev, const struct xe_device_desc *des
 		xe_step_name(xe->info.step.media),
 		xe_step_name(xe->info.step.basedie));
 
+	if (pdev->ats_cap)
+		drm_dbg(&xe->drm, "Arch ATS = %s",
+			str_enabled_disabled(pdev->ats_enabled));
+	if (pdev->pasid_cap)
+		drm_dbg(&xe->drm, "Arch PASID = %s",
+			str_enabled_disabled(pdev->pasid_enabled));
+
 	drm_dbg(&xe->drm, "SR-IOV support: %s (mode: %s)\n",
 		str_yes_no(xe_device_has_sriov(xe)),
 		xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
diff --git a/drivers/gpu/drm/xe/xe_pci.h b/drivers/gpu/drm/xe/xe_pci.h
index 11bcc5fe2c5b..5f784229a5ec 100644
--- a/drivers/gpu/drm/xe/xe_pci.h
+++ b/drivers/gpu/drm/xe/xe_pci.h
@@ -5,6 +5,7 @@
 
 #ifndef _XE_PCI_H_
 #define _XE_PCI_H_
+#include <linux/pci.h>
 
 struct pci_dev;
 
@@ -12,4 +13,9 @@ int xe_register_pci_driver(void);
 void xe_unregister_pci_driver(void);
 struct xe_device *xe_pci_to_pf_device(struct pci_dev *pdev);
 
+static inline bool xe_pci_ats_pasid_enabled(struct pci_dev *pdev)
+{
+	return pdev->ats_enabled && pdev->pasid_enabled;
+}
+
 #endif
-- 
2.43.0

