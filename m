Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7AA7C77B7A
	for <intel-xe@archiver.kernel.org>; Fri, 19 May 2023 19:48:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D20E10E47D;
	Fri, 19 May 2023 19:48:22 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7DE810E47D
 for <intel-xe@lists.freedesktop.org>; Fri, 19 May 2023 19:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684525700; x=1716061700;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=B3Uu0Y3rsVKLLTCKgLxTW5kmvIpFs7viGnVeDdxDons=;
 b=RSt7hmFiGWMRcp8e0gc+gVy1YvTCgI932wHO47rbRVoKQ5q6hLGjTBlS
 D63Z0yGIWdIlDRYQzqgSwdzl47o5YHu3Bn4wIfDv0QCAqU7LjFxZYUTgh
 PCxeN0sDrvCg8DmBjNmT0qwpyxyMknsdwD2B3b0Z3oQ1fjLSHdxlijUW1
 IIBxAUjQhK30iItDF6cmpiFhy04MVCQoaRYYgLbuHK+b9Ipx+2Fv5cxfI
 54Ani9lbFFnErRhR62YnJnSIOT1vsZTxk1xLLQnOUJpFT/iWHahbba8h+
 hZdtKQ5qvTX1iwGyibLcOrep+VldJA07akbSB8jtguZ2Y41rBpPxjPt+j g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="415927918"
X-IronPort-AV: E=Sophos;i="6.00,177,1681196400"; d="scan'208";a="415927918"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 12:48:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="705734280"
X-IronPort-AV: E=Sophos;i="6.00,177,1681196400"; d="scan'208";a="705734280"
Received: from kmlong-mobl1.amr.corp.intel.com (HELO gjsousa-mobl2.intel.com)
 ([10.255.38.200])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 12:48:16 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 19 May 2023 16:48:02 -0300
Message-Id: <20230519194802.578182-1-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Do not forget to drm_dev_put() in
 xe_pci_probe():
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

We should also call drm_dev_put() when calling xe_device_probe().

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index e789a50a1310..2d0d50dcd396 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -639,10 +639,8 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	subplatform_desc = find_subplatform(xe, desc);
 
 	err = xe_info_init(xe, desc, subplatform_desc);
-	if (err) {
-		drm_dev_put(&xe->drm);
-		return err;
-	}
+	if (err)
+		goto err_drm_put;
 
 	xe_display_info_init(xe);
 
@@ -668,10 +666,8 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	pci_set_drvdata(pdev, xe);
 	err = pci_enable_device(pdev);
-	if (err) {
-		drm_dev_put(&xe->drm);
-		return err;
-	}
+	if (err)
+		goto err_drm_put;
 
 	pci_set_master(pdev);
 
@@ -679,14 +675,20 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		drm_dbg(&xe->drm, "can't enable MSI");
 
 	err = xe_device_probe(xe);
-	if (err) {
-		pci_disable_device(pdev);
-		return err;
-	}
+	if (err)
+		goto err_pci_disable;
 
 	xe_pm_runtime_init(xe);
 
 	return 0;
+
+err_pci_disable:
+	pci_disable_device(pdev);
+
+err_drm_put:
+	drm_dev_put(&xe->drm);
+
+	return err;
 }
 
 static void xe_pci_shutdown(struct pci_dev *pdev)
-- 
2.40.1

