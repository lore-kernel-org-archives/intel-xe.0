Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7980ACCF9F0
	for <intel-xe@archiver.kernel.org>; Wed, 29 Oct 2025 14:45:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DA0E10E7D8;
	Wed, 29 Oct 2025 14:45:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U85Uuf0y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABB4510E7D8
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Oct 2025 14:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761749114; x=1793285114;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DKwc9AGp69Eh27W82dIdWBNr2ZWL8ar5vZs6FZ/4ppI=;
 b=U85Uuf0yoMHxeeD/7x6KvOIj+YX8tqKzqLuczjZDqNM0orPBxGxRM+U5
 f18KbScYm0AcQqpztKLqgP3C/2DP67RBuNK0W+fLFjcfZctTYooW8h6rO
 12WjoTKtIoceIFA82arjF51yYrbCq8hkHzyUFkuTAODYC/6nK3qZO3Lqe
 EaFba/DPfQZcBnPaxfbI/I2rGk2YqKgqeg+NtukWG/9He5P2/WYzbaJGM
 WcIbAE56qbV7/8QpiNRfWc6WnuCiDcBl23S34P4cGGOePl9slGt+thzji
 4CZihEbUkrFNx3gi8I5S1/NeVIUSeSt2mHSseHFYeTmiNClN2KD7wu/60 g==;
X-CSE-ConnectionGUID: pY8HdkBESlOZC38qWngJyg==
X-CSE-MsgGUID: hLUmKqcYRbKAIRXP/ztxYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67709087"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="67709087"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 07:45:13 -0700
X-CSE-ConnectionGUID: V/+XhfHtTfS947rr4GiMVQ==
X-CSE-MsgGUID: BPb1lOjfRzSabriIz8M6lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; d="scan'208";a="186033964"
Received: from vpanait-mobl.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.48])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 07:45:12 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v5] verbose p2p
Date: Wed, 29 Oct 2025 14:45:05 +0000
Message-ID: <20251029144504.199716-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
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

Do not review.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_dma_buf.c | 2 +-
 drivers/iommu/intel/iommu.c     | 4 ++--
 drivers/pci/p2pdma.c            | 4 ++++
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
index 54e42960daad..b047251674ea 100644
--- a/drivers/gpu/drm/xe/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/xe_dma_buf.c
@@ -28,7 +28,7 @@ static int xe_dma_buf_attach(struct dma_buf *dmabuf,
 	struct drm_gem_object *obj = attach->dmabuf->priv;
 
 	if (attach->peer2peer &&
-	    pci_p2pdma_distance(to_pci_dev(obj->dev->dev), attach->dev, false) < 0)
+	    pci_p2pdma_distance(to_pci_dev(obj->dev->dev), attach->dev, true) < 0)
 		attach->peer2peer = false;
 
 	if (!attach->peer2peer && !xe_bo_can_migrate(gem_to_xe_bo(obj), XE_PL_TT))
diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index e236c7ec221f..af07c4355b64 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -65,7 +65,7 @@ static int rwbf_quirk;
  */
 static int force_on = 0;
 static int intel_iommu_tboot_noforce;
-static int no_platform_optin;
+static int no_platform_optin = 1;
 
 #define ROOT_ENTRY_NR (VTD_PAGE_SIZE/sizeof(struct root_entry))
 
@@ -203,7 +203,7 @@ static LIST_HEAD(dmar_satc_units);
 
 static void intel_iommu_domain_free(struct iommu_domain *domain);
 
-int dmar_disabled = !IS_ENABLED(CONFIG_INTEL_IOMMU_DEFAULT_ON);
+int dmar_disabled = 1;
 int intel_iommu_sm = IS_ENABLED(CONFIG_INTEL_IOMMU_SCALABLE_MODE_DEFAULT_ON);
 
 int intel_iommu_enabled = 0;
diff --git a/drivers/pci/p2pdma.c b/drivers/pci/p2pdma.c
index 78e108e47254..630374711dee 100644
--- a/drivers/pci/p2pdma.c
+++ b/drivers/pci/p2pdma.c
@@ -451,6 +451,7 @@ static const struct pci_p2pdma_whitelist_entry {
 	{PCI_VENDOR_ID_INTEL,	0x2033, 0},
 	{PCI_VENDOR_ID_INTEL,	0x2020, 0},
 	{PCI_VENDOR_ID_INTEL,	0x09a2, 0},
+	{PCI_VENDOR_ID_INTEL,	0x4648, 0},
 	{}
 };
 
@@ -503,7 +504,10 @@ static bool __host_bridge_whitelist(struct pci_host_bridge *host,
 	vendor = root->vendor;
 	device = root->device;
 
+	pr_info("root v:%x d:%x\n", vendor, device);
+
 	for (entry = pci_p2pdma_whitelist; entry->vendor; entry++) {
+		pr_info("entry v:%x d:%x\n", entry->vendor, entry->device);
 		if (vendor != entry->vendor || device != entry->device)
 			continue;
 		if (entry->flags & REQ_SAME_HOST_BRIDGE && !same_host_bridge)
-- 
2.51.0

