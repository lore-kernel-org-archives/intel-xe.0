Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 018CAC5CFCF
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 17:19:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B47DF10F6CC;
	Fri, 14 Aug 2026 17:19:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NVDzRHMS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25EE710F6C8
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 17:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786727939; x=1818263939;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zpXa8jXGiTDbKWR+rvsxIKVsB6vOh5Qll2sTwW7U67M=;
 b=NVDzRHMSQ8ebHfhaPDuE83ptHm9tp2EFt4FKLpv1uAD9o5+lVfRkRVeb
 wxgJzGKMSEcVQBwet+uNEIzsLmSANEOtErAHN+4wvzXJdeYGccux+NrjX
 69IXTROl3CzFpawHtckUHww+ID+kWV/fSngHq/zO54oEW/KFDz8hMlXZW
 uo3GWclTLmAgBM4/Gss7qR61KDjXYet6MimH2v2xHSKTikTdVLAoeCoD6
 p94LYKNQb7sb6BuXCSAt1G8zn+9X6JxVZMCcdt1qbBjt6GwrOMBahJhBy
 u8mjFpYhfiXpNCORXss9uEAKlbPog+o5CYmu1+rEwi7bI5SNIGff1JyDk g==;
X-CSE-ConnectionGUID: SvpljbRGRt+xhY3Gs/l9kg==
X-CSE-MsgGUID: nESkmUYkQA+dPyvdA8AlZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="98464087"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="98464087"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 10:18:59 -0700
X-CSE-ConnectionGUID: FknB4BR7TmefWlf2jsgqeA==
X-CSE-MsgGUID: SkcG2cdyRzKA4MYkosfiyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="262946280"
Received: from smoudgil-mobl1.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.117.247])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 10:18:58 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Riana Tauro <riana.tauro@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v5 23/33] drm/xe/survivability: Report 'Boot Mode enabled'
 status using SIGID
Date: Fri, 14 Aug 2026 19:17:49 +0200
Message-ID: <20260814171801.13347-24-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260814171801.13347-1-michal.wajdeczko@intel.com>
References: <20260814171801.13347-1-michal.wajdeczko@intel.com>
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

Report 'Boot Mode' status or failure using various xe_log() helpers.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
v2: don't dump boot_status (Riana)
---
 drivers/gpu/drm/xe/xe_survivability_mode.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
index e14553295171..77923bdfb19b 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
@@ -338,14 +338,13 @@ static int create_survivability_sysfs(struct pci_dev *pdev)
 
 static int enable_boot_survivability_mode(struct pci_dev *pdev)
 {
-	struct device *dev = &pdev->dev;
 	struct xe_device *xe = pdev_to_xe_device(pdev);
 	struct xe_survivability *survivability = &xe->survivability;
-	int ret = 0;
+	int ret;
 
 	ret = create_survivability_sysfs(pdev);
 	if (ret)
-		return ret;
+		goto failed;
 
 	/* Make sure xe_heci_gsc_init() and xe_i2c_probe() are aware of survivability */
 	survivability->mode = true;
@@ -357,19 +356,22 @@ static int enable_boot_survivability_mode(struct pci_dev *pdev)
 	if (survivability->fdo_mode) {
 		ret = xe_nvm_init(xe);
 		if (ret)
-			goto err;
+			goto failed;
 	}
 
 	ret = xe_i2c_probe(xe);
 	if (ret)
-		goto err;
+		goto failed;
 
-	dev_err(dev, "In Survivability Mode\n");
+	if (check_boot_failure(xe))
+		xe_log_err_fatal(pdev, SURVIVABILITY, 0, "Boot Mode enabled!\n");
+	else
+		xe_log_info(pdev, SURVIVABILITY, "Boot Mode enabled!\n");
 
 	return 0;
 
-err:
-	dev_err(dev, "Failed to enable Survivability Mode\n");
+failed:
+	xe_log_err_fatal(pdev, SURVIVABILITY, ret, "Failed to enable Boot Mode!\n");
 	survivability->mode = false;
 	return ret;
 }
-- 
2.47.1

