Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E4F5C021A6
	for <intel-xe@archiver.kernel.org>; Mon, 24 Feb 2025 13:43:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B04FF10E3F6;
	Mon, 24 Feb 2025 13:42:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NYCSD4nP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB1C010E14D
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Feb 2025 06:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740378731; x=1771914731;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ENe9JOJqy9NKcqwdEpAyUJo7UNeyfocInc2XDokMmsc=;
 b=NYCSD4nPzlwpuwztgnN7yjxkOZcqEKchIPZTT/bj5F+/W5oll+sl6/9j
 4Woiolb4EMd9h9U/aZYzvJeQXp4B1L7F4sMpZNbh3BwGg1boJtDSapqvb
 DJ8Ebtx+eaGc9Vb55q7PL/71+E576RfiSXif2hT5I1W6MmoZajwvJzjDI
 9UtMApN6JwtdemSVZ75Wgf8Lo+7UapPa7l2ZvOrhD9roVqr3N+g3m5TUH
 Zg1qJ3YeNNynJJfUPgXJX755BQTvw9DiNYtCBtTIrpa2atDk+wvSxPdof
 1KjihhTB8aAG5A0NuKhp1jD8d9rwGGfvkKZ5KmNKJF8NTIUtn6MLdevV5 Q==;
X-CSE-ConnectionGUID: 2NR7jBQ3R/Si2EMhgltmMQ==
X-CSE-MsgGUID: anj2gd6dSzOcaAV0ahx9gg==
X-IronPort-AV: E=McAfee;i="6700,10204,11354"; a="40995124"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="40995124"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2025 22:32:11 -0800
X-CSE-ConnectionGUID: HcT/4HoOS228sN0PssX5bg==
X-CSE-MsgGUID: dXLdk8PmSq6JiM/F103dLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="121058946"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa004.fm.intel.com with ESMTP; 23 Feb 2025 22:32:10 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v4 1/2] drm/xe/pf: Create a link between PF and VF devices
Date: Mon, 24 Feb 2025 12:17:44 +0530
Message-Id: <20250224064745.1778-2-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20250224064745.1778-1-satyanarayana.k.v.p@intel.com>
References: <20250224064745.1778-1-satyanarayana.k.v.p@intel.com>
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
 drivers/gpu/drm/xe/xe_pci_sriov.c | 49 +++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
index aaceee748287..4f45aae0af2d 100644
--- a/drivers/gpu/drm/xe/xe_pci_sriov.c
+++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
@@ -62,6 +62,53 @@ static void pf_reset_vfs(struct xe_device *xe, unsigned int num_vfs)
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
+		if (!pdev_vf)
+			xe_sriov_err(xe, "Cannot find VF%u device, aborting link%s creation!\n",
+				     n, str_plural(num_vfs));
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
@@ -92,6 +139,8 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
 	if (err < 0)
 		goto failed;
 
+	pf_link_vfs(xe, num_vfs);
+
 	xe_sriov_info(xe, "Enabled %u of %u VF%s\n",
 		      num_vfs, total_vfs, str_plural(total_vfs));
 	return num_vfs;
-- 
2.35.3

