Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43EFDCCF9EB
	for <intel-xe@archiver.kernel.org>; Tue, 28 Oct 2025 17:59:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 016CA10E643;
	Tue, 28 Oct 2025 17:59:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PnG3K0H5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0408610E642
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Oct 2025 17:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761674352; x=1793210352;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0svlS0OyNi+GkV4IkiUQkQGCCBKc3m0lExhfbCUaXkU=;
 b=PnG3K0H58MTtHUxuyY2ka2z10H3MU0t7NED2P7wrvW+8CLXFfhbMlPkS
 wDMWByzHbyFeQ1L5y19KaQzObphO2iexKQWY0ylyBTLf4zHpKa5MGf2kL
 dWch96qRUCtFndaWbGOaHODDO7z63gq3hwu/r036ponAPgTEEDYGkPA/7
 FBZ9QDsKgP/inoLvFwMZxZG46fR+NqfxeXT9RdVaMLKfbEGROYb8AIbCa
 GdRa6fPILK/jJxQut0JRF9EJJWrInprbRUTKYrYCnwQD7aHWTIXOLb8V0
 W51sv0zq19NoYypRFzUt0ybamq1DqM/wl8/xYjhQoc1gNC9RTgd664M48 g==;
X-CSE-ConnectionGUID: mOPa3clmSt6MmMCfOjSaTg==
X-CSE-MsgGUID: DZfFl0zYQyyXQOs6GNNtUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63687862"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63687862"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 10:59:11 -0700
X-CSE-ConnectionGUID: uV8aBqkoRYi2AGhTUPDqWg==
X-CSE-MsgGUID: KXKbXNT2R823lRwOHNtWnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="189469455"
Received: from ngusev-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.98.92])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 10:59:09 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v2 14/17] drm/xe/pf: Promote xe_pci_sriov_get_vf_pdev
Date: Tue, 28 Oct 2025 18:58:28 +0100
Message-ID: <20251028175832.184534-15-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251028175832.184534-1-michal.wajdeczko@intel.com>
References: <20251028175832.184534-1-michal.wajdeczko@intel.com>
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

In the upcoming patch we would like to use this private helper
during preparation of the sysfs links. Promote it.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
v2: drop redundant comment (Piotr)
---
 drivers/gpu/drm/xe/xe_pci_sriov.c | 36 ++++++++++++++++++++-----------
 drivers/gpu/drm/xe/xe_pci_sriov.h |  1 +
 2 files changed, 24 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
index 735f51effc7a..4d5da6686e92 100644
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
@@ -228,3 +216,25 @@ int xe_pci_sriov_configure(struct pci_dev *pdev, int num_vfs)
 
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

