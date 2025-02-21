Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 896F8C021AA
	for <intel-xe@archiver.kernel.org>; Fri, 21 Feb 2025 05:41:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5235210E0E8;
	Fri, 21 Feb 2025 05:41:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YsISCkgG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAB1210E997
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Feb 2025 05:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740116511; x=1771652511;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TJEWo+dI49S+c70upFyS5N3f7Soukrn/JdfCO46q9Kg=;
 b=YsISCkgGY9AvsW1+8AIVcQm/lMSss0NW5gyv+FM4+zWVrMQ4C/s4NVsa
 3BL9+adn4raXwHrhxPifzqJcBS9s4UW9mZVogVdYfdntbfaHOdErpb1VT
 50a0gG4+jTSX2TRui4iHJc6hWpFKl7Afaz5D5sxupTau86MI01dC8l1AX
 ULTbFTWZ5R3CjX7b+xP5i2z0p/22U4SAs0GDeTI8AtNzf07yFf4aSWkqp
 3OR6zNykIIrE0q+GlycqCZYZ9jKnmZ9UgmlJ0PBDCNH20OCMm3YQ/aT7X
 jQpYTI9AONnHMmuLP0KI1K/31qunyQ9626FQUUngcv2hZ7OyEvGDHNZKX g==;
X-CSE-ConnectionGUID: gv3PcEI1QzOGyTK8rKQbaA==
X-CSE-MsgGUID: epd/aVirS0+w+Uagzv4QFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="52326338"
X-IronPort-AV: E=Sophos;i="6.13,303,1732608000"; d="scan'208";a="52326338"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 21:41:51 -0800
X-CSE-ConnectionGUID: H0IX4Ht1QPmql7598gqoRg==
X-CSE-MsgGUID: qcrkJnjiSwyQ+nV+QLZaBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,303,1732608000"; d="scan'208";a="120248361"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by orviesa004.jf.intel.com with ESMTP; 20 Feb 2025 21:41:48 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v2 1/2] drm/xe/pf: Create a link between PF and VF devices
Date: Fri, 21 Feb 2025 11:27:21 +0530
Message-Id: <20250221055722.21370-2-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20250221055722.21370-1-satyanarayana.k.v.p@intel.com>
References: <20250221055722.21370-1-satyanarayana.k.v.p@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

When both PF and VF devices are enabled on the host, they
resume simultaneously during system resume.

However, the PF must finish provisioning the VF before any
VFs can successfully resume.

Establish a parent-child device link between the PF and VF
devices to ensure the correct order of resumption.

v2:
- Added a helper function to get VF pci_dev.
- Updated xe_sriov_notice() to xe_sriov_warn() if vf pci_dev
  is not found.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_pci_sriov.c | 44 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pci_sriov.h |  6 +++++
 2 files changed, 50 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
index aaceee748287..6d2e87d1c6ba 100644
--- a/drivers/gpu/drm/xe/xe_pci_sriov.c
+++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
@@ -62,6 +62,48 @@ static void pf_reset_vfs(struct xe_device *xe, unsigned int num_vfs)
 			xe_gt_sriov_pf_control_trigger_flr(gt, n);
 }
 
+struct pci_dev *xe_pci_pf_get_vf_dev(struct pci_dev *pdev, unsigned int vf_id)
+{
+	/* caller must use pci_dev_put() */
+	return pci_get_domain_bus_and_slot(pci_domain_nr(pdev->bus),
+			pdev->bus->number,
+			pci_iov_virtfn_devfn(pdev, vf_id));
+}
+
+static void pf_link_vfs(struct xe_device *xe, int num_vfs)
+{
+	struct pci_dev *pdev_pf = to_pci_dev(xe->drm.dev);
+	struct device_link *link;
+	struct pci_dev *pdev_vf;
+	unsigned int n;
+
+	for (n = 1; n <= num_vfs; n++) {
+		pdev_vf = xe_pci_pf_get_vf_dev(pdev_pf, n - 1);
+
+		if (!pdev_vf) {
+			xe_sriov_warn(xe, "Can't link PF and VF%d due to missing pci dev..\n", n);
+			continue;
+		}
+
+		/*
+		 * When both PF and VF devices are enabled on the host, during system
+		 * resume they are resuming in parallel.
+		 *
+		 * But PF has to complete the provision of VF first to allow any VFs to
+		 * successfully resume.
+		 *
+		 * Create a parent-child device link between PF and VF devices that will
+		 * enforce correct resume order.
+		 */
+		link = device_link_add(&pdev_vf->dev, &pdev_pf->dev,
+				       DL_FLAG_AUTOREMOVE_CONSUMER);
+		if (!link)
+			xe_sriov_notice(xe, "Failed linking PF and VF%u\n", n);
+
+		pci_dev_put(pdev_vf);
+	}
+}
+
 static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
 {
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
@@ -92,6 +134,8 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
 	if (err < 0)
 		goto failed;
 
+	pf_link_vfs(xe, num_vfs);
+
 	xe_sriov_info(xe, "Enabled %u of %u VF%s\n",
 		      num_vfs, total_vfs, str_plural(total_vfs));
 	return num_vfs;
diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.h b/drivers/gpu/drm/xe/xe_pci_sriov.h
index c76dd0d90495..f66b68a25b20 100644
--- a/drivers/gpu/drm/xe/xe_pci_sriov.h
+++ b/drivers/gpu/drm/xe/xe_pci_sriov.h
@@ -10,11 +10,17 @@ struct pci_dev;
 
 #ifdef CONFIG_PCI_IOV
 int xe_pci_sriov_configure(struct pci_dev *pdev, int num_vfs);
+struct pci_dev *xe_pci_pf_get_vf_dev(struct pci_dev *pdev, unsigned int vf_id);
 #else
 static inline int xe_pci_sriov_configure(struct pci_dev *pdev, int num_vfs)
 {
 	return 0;
 }
+
+static inline struct pci_dev *xe_pci_pf_get_vf_dev(struct pci_dev *pdev, unsigned int vf_id)
+{
+	return NULL;
+}
 #endif
 
 #endif
-- 
2.35.3

