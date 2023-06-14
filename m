Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37339EB64DC
	for <intel-xe@archiver.kernel.org>; Wed, 14 Jun 2023 20:52:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 172BC10E46D;
	Wed, 14 Jun 2023 20:52:20 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92A6C10E46A
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Jun 2023 20:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686775932; x=1718311932;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=P2WsrP5pEPF6ZwEJ4VOB24/WMetKdVDZhKV0pfcPJOE=;
 b=Q++nc4dywAbvCAwWgW/5eiISMl/rhWgafw7RKAcaek/QBFzqx3dqst8V
 R2oX0c7a/GypAs/XbB9nzgsxHJGRfWcDir6GFHaaMyd/4aYUNsH9wFRyN
 SgbVCwMnrxbzwikfVXDxZn1hRvrF0i7J6VPqNLb6+OXZbM9dEIjyXqKRs
 77zWqXxph1KNEuoocxAy63ueRxwwF1yjQy4YkshEaeLe7Pxpi6SrJVAyr
 MSP8Bo2APP33Vj+MspjN2tMzB3ZHAm5o0jC1rDqR+ih/2UxufLw8+DoyJ
 PGz6CLgOZRZtkp5QPt7TvaXYXLGbRDNTDswDQWMd0jwkf2GSGDVD1SU/I Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="343431999"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; d="scan'208";a="343431999"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2023 13:52:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="712206072"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; d="scan'208";a="712206072"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.147])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2023 13:52:09 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 14 Jun 2023 13:52:02 -0700
Message-Id: <20230614205202.3376752-5-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230614205202.3376752-1-matthew.d.roper@intel.com>
References: <20230614205202.3376752-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 4/4] drm/xe: Enable PCI device earlier
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Newer Intel platforms require that inspect the contents of the GMD_ID
registers very early in the driver initialization process to determine
the IP version (and proper init sequences), of the platform.  Move the
general PCI device setup and enablement slightly earlier, before we
start trying to peek at the GMD_ID registers.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index b5bea42a458d..c86580eb1b56 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -651,9 +651,19 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	subplatform_desc = find_subplatform(xe, desc);
 
+	pci_set_drvdata(pdev, xe);
+	err = pci_enable_device(pdev);
+	if (err)
+		goto err_drm_put;
+
+	pci_set_master(pdev);
+
+	if (pci_enable_msi(pdev) < 0)
+		drm_dbg(&xe->drm, "can't enable MSI");
+
 	err = xe_info_init(xe, desc, subplatform_desc);
 	if (err)
-		goto err_drm_put;
+		goto err_pci_disable;
 
 	xe_display_info_init(xe);
 
@@ -677,16 +687,6 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		xe_step_name(xe->info.step.display),
 		xe_step_name(xe->info.step.basedie));
 
-	pci_set_drvdata(pdev, xe);
-	err = pci_enable_device(pdev);
-	if (err)
-		goto err_drm_put;
-
-	pci_set_master(pdev);
-
-	if (pci_enable_msi(pdev) < 0)
-		drm_dbg(&xe->drm, "can't enable MSI");
-
 	err = xe_device_probe(xe);
 	if (err)
 		goto err_pci_disable;
-- 
2.40.1

