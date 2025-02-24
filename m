Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3712C021BF
	for <intel-xe@archiver.kernel.org>; Mon, 24 Feb 2025 13:44:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A485F10E564;
	Mon, 24 Feb 2025 13:42:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ss0JQWkb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8AB010E120
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Feb 2025 10:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740391955; x=1771927955;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ngVrOMmzTdzyY/Wdlmwm5ldpY7QISYc5inKMUG6yaR4=;
 b=Ss0JQWkbv7KvsyagFrgU18hotALj0KkgVEAilAdVTqXokuY4cPyoDHF0
 q9Uwu+fsvdCxdV5VW+evN8/Z31PoN8O1LVIRkDhCb2B/A2rMfDehJVfBN
 DP9HNU8yg96JvxOdytJ1yTFLIowKOFnC6ueXwDCeemtFxcrTdp/ffdJkU
 4TO+Zk6LkIyLw93vTb0D+dkrDJ6CHa0bRZq6wi5WY6uDMgUYvGqvaI5kX
 sOBL7ZCRshtjABVzBhr/L1UkAvJKfMICc1gZ9eH56ZaTP8/VibJQXQZoM
 P3oTc8USFQAL66iELlljGOY5w+VOTyNvgNQH/s6FTlgarLCutm4WnLVEl Q==;
X-CSE-ConnectionGUID: tO8IHM4rSAmGQoiSnm7hEQ==
X-CSE-MsgGUID: /8pWfwbLSsO+iWXqzFNMrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11354"; a="41258590"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="41258590"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 02:12:35 -0800
X-CSE-ConnectionGUID: 4DEETn83RsCioYVbqJd8iA==
X-CSE-MsgGUID: /ZFzZ/uQRF+7AOIHndIYlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="115860895"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by orviesa010.jf.intel.com with ESMTP; 24 Feb 2025 02:12:33 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v5 1/2] drm/xe/pf: Create a link between PF and VF devices
Date: Mon, 24 Feb 2025 15:58:06 +0530
Message-Id: <20250224102807.11065-2-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20250224102807.11065-1-satyanarayana.k.v.p@intel.com>
References: <20250224102807.11065-1-satyanarayana.k.v.p@intel.com>
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

V4 -> V5:
- Added missing break in the error condition.
V3 -> V4:
- Made xe_pci_pf_get_vf_dev() as a static function and updated
  input parameter types.
- Updated xe_sriov_warn() to xe_sriov_abort() when VF device
  cannot be found.
V2 -> V3:
- Added function documentation for xe_pci_pf_get_vf_dev().
- Added assertion if not called from PF.
V1 -> V2:
- Added a helper function to get VF pci_dev.
- Updated xe_sriov_notice() to xe_sriov_warn() if vf pci_dev
  is not found.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
Reviewed-by: Piotr Piorkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_pci_sriov.c | 51 +++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
index aaceee748287..09ee8a06fe2e 100644
--- a/drivers/gpu/drm/xe/xe_pci_sriov.c
+++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
@@ -62,6 +62,55 @@ static void pf_reset_vfs(struct xe_device *xe, unsigned int num_vfs)
 			xe_gt_sriov_pf_control_trigger_flr(gt, n);
 }
 
+static struct pci_dev *xe_pci_pf_get_vf_dev(struct xe_device *xe, unsigned int vf_id)
+{
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+
+	xe_assert(xe, IS_SRIOV_PF(xe));
+
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
+	/*
+	 * When both PF and VF devices are enabled on the host, during system
+	 * resume they are resuming in parallel.
+	 *
+	 * But PF has to complete the provision of VF first to allow any VFs to
+	 * successfully resume.
+	 *
+	 * Create a parent-child device link between PF and VF devices that will
+	 * enforce correct resume order.
+	 */
+	for (n = 1; n <= num_vfs; n++) {
+		pdev_vf = xe_pci_pf_get_vf_dev(xe, n - 1);
+
+		/* unlikely, something weird is happening, abort */
+		if (!pdev_vf) {
+			xe_sriov_err(xe, "Cannot find VF%u device, aborting link%s creation!\n",
+				     n, str_plural(num_vfs));
+			break;
+		}
+
+		link = device_link_add(&pdev_vf->dev, &pdev_pf->dev,
+				       DL_FLAG_AUTOREMOVE_CONSUMER);
+		/* unlikely and harmless, continue with other VFs */
+		if (!link)
+			xe_sriov_notice(xe, "Failed linking VF%u\n", n);
+
+		pci_dev_put(pdev_vf);
+	}
+}
+
 static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
 {
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
@@ -92,6 +141,8 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
 	if (err < 0)
 		goto failed;
 
+	pf_link_vfs(xe, num_vfs);
+
 	xe_sriov_info(xe, "Enabled %u of %u VF%s\n",
 		      num_vfs, total_vfs, str_plural(total_vfs));
 	return num_vfs;
-- 
2.35.3

