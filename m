Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69611C77B7C
	for <intel-xe@archiver.kernel.org>; Tue, 24 Jun 2025 08:00:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DCCF10E21E;
	Tue, 24 Jun 2025 08:00:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GLQzXSow";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85D2210E21E
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Jun 2025 08:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750752039; x=1782288039;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RSL7CsUGWm0GT+czMltLGhuf5uTU1IkW2UfyH0pKs0s=;
 b=GLQzXSowUwyc7L8Pt5gJqVRSQbkavwDC889AnwrH+l442RMBVebsiJ2S
 rN/Qna5t8H7MgLGVRx/U2Iq+GpE+tDDpPCe90sTAr8LRzqs964ikZR+4D
 Uq1eGbhjZZhsfECkw1d5hT8L9triFj9WF2hv6buFmEcHl2SJuhezi5Fqj
 5r2L8DTobwuE70BiIvJS42rlK2UaMCJ5jRej/ku+lg8S96f02ntCE/3A4
 2dt9E05gKfyI9pOPSizj7jbTOZAxIaC28TIvRpHxMDY+9Zf8lW31vrBB9
 4cQXcs2AAjyOtWieZKXhHZ2LUaCOYR/7cfS66lgxNKtDKdEBOTMPeWcf9 A==;
X-CSE-ConnectionGUID: djxMRZ2RQ5S08aRB/aZm4g==
X-CSE-MsgGUID: aXoviVHGSMGEOV2v/Ptyqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="52850087"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; d="scan'208";a="52850087"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 01:00:39 -0700
X-CSE-ConnectionGUID: xu6Hq7yDTQCK96EMa8ZY3Q==
X-CSE-MsgGUID: JQUBRQ+pRDSVZbs0XhiwiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; d="scan'208";a="151322116"
Received: from unknown (HELO tejasupa-desk..) ([10.190.239.37])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 01:00:38 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lu Baolu <baolu.lu@linux.intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH] [topic/xe-for-CI]iommu/vt-d: Enable ATS before cache tag
 assignment
Date: Tue, 24 Jun 2025 13:30:21 +0530
Message-Id: <20250624080021.4015583-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.34.1
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

From: Lu Baolu <baolu.lu@linux.intel.com>

Commit <4f1492efb495> ("iommu/vt-d: Revert ATS timing change to fix boot
failure") placed the enabling of ATS in the probe_finalize callback. This
occurs after the default domain attachment, which is when the ATS cache
tag is assigned. Consequently, the device TLB cache tag is missed when the
domain is attached, leading to the device TLB not being invalidated in the
iommu_unmap paths.

Fix it by moving the ATS enabling to the default domain attachment path,
ensuring ATS is enabled before the cache tag assignment.

Fixes: 4f1492efb495 ("iommu/vt-d: Revert ATS timing change to fix boot failure")
Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/iommu/intel/iommu.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index 7aa3932251b2..863ccb47bcca 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -54,6 +54,7 @@
 				__DOMAIN_MAX_PFN(gaw), (unsigned long)-1))
 #define DOMAIN_MAX_ADDR(gaw)	(((uint64_t)__DOMAIN_MAX_PFN(gaw)) << VTD_PAGE_SHIFT)
 
+static void sm_iommu_enable_pcicaps(struct device *dev);
 static void __init check_tylersburg_isoch(void);
 static int rwbf_quirk;
 
@@ -1825,10 +1826,11 @@ static int dmar_domain_attach_device(struct dmar_domain *domain,
 	else
 		ret = domain_setup_second_level(iommu, domain, dev,
 						IOMMU_NO_PASID, NULL);
-
 	if (ret)
 		goto out_block_translation;
 
+	/* PCI ATS enablement must happen before cache tag assigning. */
+	sm_iommu_enable_pcicaps(dev);
 	ret = cache_tag_assign_domain(domain, dev, IOMMU_NO_PASID);
 	if (ret)
 		goto out_block_translation;
@@ -3765,11 +3767,18 @@ static struct iommu_device *intel_iommu_probe_device(struct device *dev)
 	return ERR_PTR(ret);
 }
 
-static void intel_iommu_probe_finalize(struct device *dev)
+static void sm_iommu_enable_pcicaps(struct device *dev)
 {
 	struct device_domain_info *info = dev_iommu_priv_get(dev);
 	struct intel_iommu *iommu = info->iommu;
 
+	/*
+	 * Called only in iommu_device_register() path when iommu is
+	 * configured in the scalable mode.
+	 */
+	if (!sm_supported(iommu) || READ_ONCE(iommu->iommu.ready))
+		return;
+
 	/*
 	 * The PCIe spec, in its wisdom, declares that the behaviour of the
 	 * device is undefined if you enable PASID support after ATS support.
@@ -3780,7 +3789,7 @@ static void intel_iommu_probe_finalize(struct device *dev)
 	    !pci_enable_pasid(to_pci_dev(dev), info->pasid_supported & ~1))
 		info->pasid_enabled = 1;
 
-	if (sm_supported(iommu) && !dev_is_real_dma_subdevice(dev))
+	if (!dev_is_real_dma_subdevice(dev))
 		iommu_enable_pci_ats(info);
 	iommu_enable_pci_pri(info);
 }
@@ -4309,6 +4318,7 @@ static int identity_domain_attach_dev(struct iommu_domain *domain, struct device
 		ret = intel_pasid_setup_pass_through(iommu, dev, IOMMU_NO_PASID);
 	else
 		ret = device_setup_pass_through(dev);
+	sm_iommu_enable_pcicaps(dev);
 
 	if (!ret)
 		info->domain_attached = true;
@@ -4359,7 +4369,6 @@ const struct iommu_ops intel_iommu_ops = {
 	.domain_alloc_sva	= intel_svm_domain_alloc,
 	.domain_alloc_nested	= intel_iommu_domain_alloc_nested,
 	.probe_device		= intel_iommu_probe_device,
-	.probe_finalize		= intel_iommu_probe_finalize,
 	.release_device		= intel_iommu_release_device,
 	.get_resv_regions	= intel_iommu_get_resv_regions,
 	.device_group		= intel_iommu_device_group,
-- 
2.34.1

