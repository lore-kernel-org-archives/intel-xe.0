Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECAC2606A31E
	for <intel-xe@archiver.kernel.org>; Fri, 27 Nov 2026 06:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YeWQLsj3
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABF741122BE;
	Fri, 27 Nov 2026 06:14:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 835621122BE
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Nov 2026 06:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795760034; x=1827296034;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kWpBCp+ZwmRgjk/TDqMuDg5I2vh/j9ravYIi1nlbVfA=;
 b=YeWQLsj3XIPuE2uBcV7dmzA+e1ax7PPdQoVO+IIxGQm8di/f2/G6C2Hx
 Y04T5wyyZAkHfHgzUgzSaRoXooxEKCiW+GnP6jKkwU5sVzjI1d1abbUub
 lz+migAnYmSLi/tT4HNdkvdGwnSHcph1YSGWPUpeYjhfqglh4b+pRMAEc
 oPvYIIhpOzcs4FAbbc9KrrNuZE44RLmnB/7xEmFb/tG/QnATufKyCrOI+
 BVG7PveS1bfB/u1mIxH0XAHQWhoRCtr2TBqvDUtbKmknxPi136fkAas4C
 cGN4Oj0/ymg8dZdZmtUu4EAtgooukwwRfRUA2nChkuD6ZNyyuLeeRD2Bj A==;
X-CSE-ConnectionGUID: Fze7gIpyQBW4iimSF1K8xw==
X-CSE-MsgGUID: Cz37e/OBQpCfz+CHi6230w==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4554510"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4554510"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 22:13:54 -0800
X-CSE-ConnectionGUID: RX+rsd/rSp+LC6K6epe4Lg==
X-CSE-MsgGUID: h56ziPbhT+2RXBstpFXN/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; d="scan'208";a="12353949"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 22:13:50 -0800
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, heikki.krogerus@linux.intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [PATCH 5/5] drm/xe: Request vendor recovery for AMC firmware download
 alert
Date: Fri, 27 Nov 2026 11:43:39 +0530
Message-ID: <20261127061333.1019047-12-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261127061333.1019047-7-badal.nilawar@intel.com>
References: <20261127061333.1019047-7-badal.nilawar@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

AMC reports a firmware download alert when a device firmware update is
in progress. Request vendor-specific recovery so userspace can identify
the alert reason and perform the documented recovery.

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_amc.c   |  3 +++
 drivers/gpu/drm/xe/xe_wedge.c | 20 ++++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_amc.c b/drivers/gpu/drm/xe/xe_amc.c
index a619346a3451..2685d6bc36b8 100644
--- a/drivers/gpu/drm/xe/xe_amc.c
+++ b/drivers/gpu/drm/xe/xe_amc.c
@@ -214,6 +214,9 @@ static void xe_amc_work(struct work_struct *work)
 
 	switch (alert_reason) {
 	case AMC_ALERT_FW_DOWNLOAD:
+		alert_str = amc_alert[alert_reason];
+		recovery = DRM_WEDGE_RECOVERY_VENDOR;
+		break;
 	case AMC_ALERT_OOB_RESET:
 		alert_str = amc_alert[alert_reason];
 		recovery = DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET;
diff --git a/drivers/gpu/drm/xe/xe_wedge.c b/drivers/gpu/drm/xe/xe_wedge.c
index e48cca34d660..07556c5cf808 100644
--- a/drivers/gpu/drm/xe/xe_wedge.c
+++ b/drivers/gpu/drm/xe/xe_wedge.c
@@ -54,6 +54,26 @@
  *
  * - Admin/userspace consumer can use firmware flashing tools like fwupd to flash
  *   firmware and restore device to normal operation.
+ *
+ * Case: Firmware Download (AMC alert)
+ * -----------------------------------
+ *
+ * Identification Hint
+ * +++++++++++++++++++
+ *
+ * ``WEDGED=vendor-specific`` drm device wedged uevent with
+ * ``/sys/bus/pci/devices/<device>/xe_amc_alert_reason`` reporting
+ * ``Firmware Download`` indicates that a firmware download is in progress and
+ * the AMC will reset the device when it completes.
+ *
+ * Recovery Procedure
+ * ++++++++++++++++++
+ *
+ * Once ``WEDGED=vendor-specific`` drm device wedged uevent is received, follow
+ * the below steps
+ *
+ * - Check the AMC alert reason sysfs. If it reports ``Firmware Download``,
+ *   once the AMC-initiated reset completes, rescan the PCI device.
  */
 
 /**
-- 
2.56.0

