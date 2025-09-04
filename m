Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD88DCA1012
	for <intel-xe@archiver.kernel.org>; Thu,  4 Sep 2025 10:35:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81DC810E244;
	Thu,  4 Sep 2025 10:35:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TKPJI7/A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB4F010E244
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Sep 2025 10:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756982134; x=1788518134;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+B8yAFWOemUXQUkvEXoiOrBn1Z4aAQMZigwlO8t7ObI=;
 b=TKPJI7/APutWpwGCyP5G9eqI0UmuUe6PXYQOHgsdynvY5RkPKZRkZkYh
 pyJACV/2LIRVrMF5jWhy757ojaSUyMpsbQt7Smtcth++Cx0DV0mmnFyB6
 aGCJE5ZIrrWjcuPyu2v8rxbhPHUDBWbPaj3V3Edlp6yQopBO7W6r89Gy0
 W+aqS45m9WGpB39HwlHJPEIentVlwSf9YAdD4Fae1O1+NT/8hoC+pc6H0
 ADdrCLW6M0JcvPH/T5gsjtzApj1/YuLlpQbCH8lGB0s0oMuh7dGpzJk4Q
 u8nyOq9EzkD058OlOpiTQuENz8g3nzZchN6BsNe5KYUD+iFqJLcHkxdDJ g==;
X-CSE-ConnectionGUID: 4rAUgd+URnG8Y66Pq5a4JA==
X-CSE-MsgGUID: mi037wJhRWicnOKZpnLNEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59385280"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="59385280"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 03:35:34 -0700
X-CSE-ConnectionGUID: wkPJSaeRQru0mSZHnYig4A==
X-CSE-MsgGUID: GYtDx6nQRpO3LlSY2n8VpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; d="scan'208";a="176193039"
Received: from ruymanre-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.252.70])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 03:35:32 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Riana Tauro <riana.tauro@intel.com>,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH v2 1/3] drm/xe/configfs: Don't touch survivability_mode on fini
Date: Thu,  4 Sep 2025 12:35:21 +0200
Message-ID: <20250904103521.7130-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250902131744.5076-2-michal.wajdeczko@intel.com>
References: <20250902131744.5076-2-michal.wajdeczko@intel.com>
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

This is a user controlled configfs attribute, we should not
modify that outside the configfs attr.store() implementation.

Fixes: bc417e54e24b ("drm/xe: Enable configfs support for survivability mode")
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Stuart Summers <stuart.summers@intel.com>
---
v2: add Fixes tag (Lucas) and update the doc (Riana)
---
 drivers/gpu/drm/xe/xe_survivability_mode.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
index 53c5af4b810c..7999cc5262a5 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
@@ -44,6 +44,8 @@
  *
  *	# echo 1 > /sys/kernel/config/xe/0000:03:00.0/survivability_mode
  *
+ * It is the responsibility of the user to clear the mode once firmware flash is complete.
+ *
  * Refer :ref:`xe_configfs` for more details on how to use configfs
  *
  * Survivability mode is indicated by the below admin-only readable sysfs which provides additional
@@ -180,7 +182,6 @@ static void xe_survivability_mode_fini(void *arg)
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	struct device *dev = &pdev->dev;
 
-	xe_configfs_clear_survivability_mode(pdev);
 	sysfs_remove_file(&dev->kobj, &dev_attr_survivability_mode.attr);
 }
 
-- 
2.47.1

