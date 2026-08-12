Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DA45C5AD5A
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 19:15:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DE1210F0E2;
	Wed, 12 Aug 2026 19:15:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FNEnP8nC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE6D710F0E2
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 19:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786562141; x=1818098141;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dR6s6WaXPw+ENGZvjXFE5lDu+N8V5JlguFY1XzWakk0=;
 b=FNEnP8nC5CH9zu1LJBtn2GSvDRKdexX7DvFGvjT4vnuZJfJ3tHoLod2y
 Y+zTX2nNlA0R2EnUMXTBQNx6jISVlXNSTLqQEI/POKZpX4SkWCz5mR1f+
 /Hutd+2hZcHuP12fAx9Ah4rzxZwYLne8nUoqDhJnr96FacSvIUF+kZ7yp
 Ja+vU8FY4H/9wBiZqyMAcBMkVxO0jSDK0I77phZ28CYluE8iCc/6PKlga
 /r5Et26y+i06aWLznZRRJ5xuMJpvInf5hoSIvmWisGA7g+n5r5LuJXUXM
 ruwi2rA02XDG7MZx2YJC9MpHYyhZjUFEGQCxFkyhBtAM0hYefdr1/LnGh Q==;
X-CSE-ConnectionGUID: FdjiAq9cQbux19JhnsEf9w==
X-CSE-MsgGUID: tfJtKcwuSLutmCl5WgWbfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="86987571"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="86987571"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 12:15:41 -0700
X-CSE-ConnectionGUID: 8MkoBnGCSbuqbffaIxsJpA==
X-CSE-MsgGUID: pct3ppISSBi5yhqydKLaqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="268892047"
Received: from miqurash-mobl2.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.17.41])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 12:15:39 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Riana Tauro <riana.tauro@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v4 22/32] drm/xe/survivability: Report 'Boot Mode enabled'
 status using SIGID
Date: Wed, 12 Aug 2026 21:14:38 +0200
Message-ID: <20260812191450.11690-23-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812191450.11690-1-michal.wajdeczko@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
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
 drivers/gpu/drm/xe/xe_survivability_mode.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
index 2d8c532157fd..ebd288986c11 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
@@ -304,14 +304,13 @@ static int create_survivability_sysfs(struct pci_dev *pdev)
 
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
@@ -323,19 +322,25 @@ static int enable_boot_survivability_mode(struct pci_dev *pdev)
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
+		xe_log_comp_fatal(pdev, SURVIVABILITY,
+				  &survivability->boot_status,
+				  sizeof(survivability->boot_status),
+				  "Boot Mode enabled!\n");
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

