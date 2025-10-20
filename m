Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93F84CCD193
	for <intel-xe@archiver.kernel.org>; Mon, 20 Oct 2025 18:24:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5733410E4B3;
	Mon, 20 Oct 2025 18:24:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rc4sCtbo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CB7610E4B2
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Oct 2025 18:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760984693; x=1792520693;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=i+/ZDdbbGA0XmkRjXHFhXG+tLH2AITz6Fbai4Mc6Sas=;
 b=Rc4sCtboo4Q3WfgNEE1wF8gJK9HF0FBkWeHyDuen8ZUB7CanH5/pDdtY
 8CHJDDDj7/sC+QmopGK8lFCLZmoj7V4penH6h1YloY41qua/AFcEY3YqR
 5EpH0YVjL2IQaN1iRLMi+yDS73i/DfJq51qJq8sinmJPCo5ViAWE8s4l3
 bM6+XBynfr8eFmpSVUwrxTYhcBMkDrkXRZodw3NhzOvikt0MunMshc4GM
 Nia4RPFosT/pbkKIh9TAErwLyUnHYlPblmQn+O7tsI6JFlJRDMWsov35W
 Ns4jbF6rozzpSN9m4GiqjO0Poe7F22RgDznXmNIR9kOw9C02kFeWczflS w==;
X-CSE-ConnectionGUID: huNt8UsIQCiFF7j63AAXAQ==
X-CSE-MsgGUID: qgaajanWQnudHhsA6qI1eQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63013081"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="63013081"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 11:24:53 -0700
X-CSE-ConnectionGUID: ++uH4Wk/Q4q6gUT2LlFzHA==
X-CSE-MsgGUID: J4zyS/pmSJqv1ssVDPB1XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="183802162"
Received: from vthervee-mobl2.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.94.249.135])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 11:24:52 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 11/14] drm/xe/pf: Promote xe_pci_sriov_get_vf_pdev
Date: Mon, 20 Oct 2025 20:24:11 +0200
Message-ID: <20251020182414.576-12-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251020182414.576-1-michal.wajdeczko@intel.com>
References: <20251020182414.576-1-michal.wajdeczko@intel.com>
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

In the upcoming patch we would like to use this private helper
during preparation of the sysfs links. Promote it.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_pci_sriov.c | 37 ++++++++++++++++++++-----------
 drivers/gpu/drm/xe/xe_pci_sriov.h |  1 +
 2 files changed, 25 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
index 735f51effc7a..678e76703cd8 100644
--- a/drivers/gpu/drm/xe/xe_pci_sriov.c
+++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
@@ -30,18 +30,6 @@ static void pf_reset_vfs(struct xe_device *xe, unsigned int num_vfs)
 		xe_sriov_pf_control_reset_vf(xe, n);
 }
 
-static struct pci_dev *xe_pci_pf_get_vf_dev(struct xe_device *xe, unsigned int vf_id)
-{
-	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
-
-	xe_assert(xe, IS_SRIOV_PF(xe));
-
-	/* caller must use pci_dev_put() */
-	return pci_get_domain_bus_and_slot(pci_domain_nr(pdev->bus),
-			pdev->bus->number,
-			pci_iov_virtfn_devfn(pdev, vf_id));
-}
-
 static void pf_link_vfs(struct xe_device *xe, int num_vfs)
 {
 	struct pci_dev *pdev_pf = to_pci_dev(xe->drm.dev);
@@ -60,7 +48,7 @@ static void pf_link_vfs(struct xe_device *xe, int num_vfs)
 	 * enforce correct resume order.
 	 */
 	for (n = 1; n <= num_vfs; n++) {
-		pdev_vf = xe_pci_pf_get_vf_dev(xe, n - 1);
+		pdev_vf = xe_pci_sriov_get_vf_pdev(pdev_pf, n);
 
 		/* unlikely, something weird is happening, abort */
 		if (!pdev_vf) {
@@ -228,3 +216,26 @@ int xe_pci_sriov_configure(struct pci_dev *pdev, int num_vfs)
 
 	return ret;
 }
+
+/**
+ * xe_pci_sriov_get_vf_pdev() - Lookup the VF's PCI device using the VF identifier.
+ * @pdev: the PF's &pci_dev
+ * @vfid: VF identifier (1-based)
+ *
+ * The caller must decrement the reference count by calling pci_dev_put().
+ *
+ * Return: the VF's &pci_dev or NULL if the VF device was not found.
+ */
+struct pci_dev *xe_pci_sriov_get_vf_pdev(struct pci_dev *pdev, unsigned int vfid)
+{
+	struct xe_device *xe = pdev_to_xe_device(pdev);
+
+	xe_assert(xe, dev_is_pf(&pdev->dev));
+	xe_assert(xe, vfid);
+	xe_assert(xe, vfid <= pci_sriov_get_totalvfs(pdev));
+
+	/* caller must use pci_dev_put() */
+	return pci_get_domain_bus_and_slot(pci_domain_nr(pdev->bus),
+					   pdev->bus->number,
+					   pci_iov_virtfn_devfn(pdev, vfid - 1));
+}
diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.h b/drivers/gpu/drm/xe/xe_pci_sriov.h
index c76dd0d90495..b9105d71dbb1 100644
--- a/drivers/gpu/drm/xe/xe_pci_sriov.h
+++ b/drivers/gpu/drm/xe/xe_pci_sriov.h
@@ -10,6 +10,7 @@ struct pci_dev;
 
 #ifdef CONFIG_PCI_IOV
 int xe_pci_sriov_configure(struct pci_dev *pdev, int num_vfs);
+struct pci_dev *xe_pci_sriov_get_vf_pdev(struct pci_dev *pdev, unsigned int vfid);
 #else
 static inline int xe_pci_sriov_configure(struct pci_dev *pdev, int num_vfs)
 {
-- 
2.47.1

