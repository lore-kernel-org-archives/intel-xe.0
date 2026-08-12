Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B96B9C5AD5A
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 19:15:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E2C810F0DF;
	Wed, 12 Aug 2026 19:15:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IdBMAeNN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1634110F0DF
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 19:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786562139; x=1818098139;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oMR+OWjRwL5c6AjISI99amRy9CDmTX9GfGzBv3gkrZU=;
 b=IdBMAeNNw/jQ3mzDwd90zWwQoI4omy/8OKWgxjhq5xNsdfqJ0iYMm21y
 1r/uoYPuVk3S9SYUMdIODhAcLpsY/7nABuFLPpBb9UrZpCJoVKmzC9Vji
 AvhjtdnUQKqBbQz87qd+EGAoYwApivYDoIp37mCutZiUzdPppTtCBKIfI
 eY0WkEfU65/Nrlob03FWpPsBVgpVEX7GalY4t1ooDRZaiw9pfroiMP0MI
 xVlGzbQqz4oIjMm7fRdrs8/U4ozJgx9mInwv5YdxhWFOKZR7sE7usmkJJ
 ASMpiZ9omMecAURzl1B8/wZBSbqT1mJof03HdyYLw8fv9ZEM9MsJR46cZ A==;
X-CSE-ConnectionGUID: 9RW/W9A9TimV3l2HGXm3Yw==
X-CSE-MsgGUID: eTayNvNnRai0RYM6woCbDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="86987567"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="86987567"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 12:15:39 -0700
X-CSE-ConnectionGUID: wI1P82omRrO8dvobScGOHQ==
X-CSE-MsgGUID: 0L2Ds8e+RfuXzvPe942Enw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="268892037"
Received: from miqurash-mobl2.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.17.41])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 12:15:37 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Riana Tauro <riana.tauro@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v4 21/32] drm/xe/survivability: Report 'sysfs failure' error
 using SIGID
Date: Wed, 12 Aug 2026 21:14:37 +0200
Message-ID: <20260812191450.11690-22-michal.wajdeczko@intel.com>
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

Report 'failed to create sysfs files' error using xe_log_err() helper
from all sysfs failure points and for all call sites.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 drivers/gpu/drm/xe/xe_survivability_mode.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
index 85b4c125a217..2d8c532157fd 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
@@ -280,24 +280,26 @@ static int create_survivability_sysfs(struct pci_dev *pdev)
 	int ret;
 
 	ret = device_create_file(dev, &dev_attr_survivability_mode);
-	if (ret) {
-		dev_warn(dev, "Failed to create survivability sysfs files\n");
-		return ret;
-	}
+	if (ret)
+		goto failed;
 
 	ret = devm_add_action_or_reset(xe->drm.dev,
 				       xe_survivability_mode_fini, xe);
 	if (ret)
-		return ret;
+		goto failed;
 
 	/* Survivability info is not required if enabled via configfs */
 	if (!xe_configfs_get_survivability_mode(pdev)) {
 		ret = devm_device_add_group(dev, &survivability_info_group);
 		if (ret)
-			return ret;
+			goto failed;
 	}
 
 	return 0;
+
+failed:
+	xe_log_err(xe, SURVIVABILITY, ret, "Failed to create sysfs files!\n");
+	return ret;
 }
 
 static int enable_boot_survivability_mode(struct pci_dev *pdev)
@@ -403,9 +405,7 @@ void xe_survivability_mode_runtime_enable(struct xe_device *xe)
 	}
 
 	populate_survivability_info(xe);
-
-	if (create_survivability_sysfs(pdev))
-		dev_err(&pdev->dev, "Failed to create survivability sysfs\n");
+	create_survivability_sysfs(pdev);
 
 	survivability->type = XE_SURVIVABILITY_TYPE_RUNTIME;
 	dev_err(&pdev->dev, "Runtime Survivability mode enabled\n");
-- 
2.47.1

