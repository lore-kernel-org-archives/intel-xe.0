Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2F9606A31E
	for <intel-xe@archiver.kernel.org>; Fri, 27 Nov 2026 06:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aDdj42UN
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F05510FD0D;
	Fri, 27 Nov 2026 06:13:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2617C10FC9F
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Nov 2026 06:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795760022; x=1827296022;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=USDM9IiB0NwpsILo7wtRoh39ur/e+1VPBKnubIcafjA=;
 b=aDdj42UNFCW4pGP/weV4RupGT4PmZqBKs620z3EqJd1K2VYl+V7J1HLy
 inpGuoB5A/sa2Jf7sQFK60HCOUZcnzeId7m1kQA8+HwjojpzPTxXEHBVU
 yYHRTI/Hyi1bGC80HwO5sw7LZZsMbx6RMHRtIO6zT7PB+SiNC7Phs01xh
 hdMs9K3xWH71uAb6x59nIIJCqmsaza6XGGB2/tnRmduX2eV71quz5oXnx
 faa+ke3AgsWeyKP8A9oyeJoEH1AwcTJ5YrXwB4dAkazoiY04stJHp80Af
 4QBE+p8ekffwKyDYwO72bFcQSG1Pe2inRM8VE6I5C0WrpRiE1O+c1mppB Q==;
X-CSE-ConnectionGUID: D55CCAsVSzKwspAjcIglug==
X-CSE-MsgGUID: W/ITVjRSSF2QFrvE2/3BwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4554500"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4554500"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 22:13:42 -0800
X-CSE-ConnectionGUID: 32QjymsWQ82a2RK5Hm62eQ==
X-CSE-MsgGUID: NTR1varcRISgTdDbhiFPag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; d="scan'208";a="12353929"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 22:13:40 -0800
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, heikki.krogerus@linux.intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [PATCH 1/5] drm/xe: Request cold-reset recovery on AMC thermal trip
 alert
Date: Fri, 27 Nov 2026 11:43:35 +0530
Message-ID: <20261127061333.1019047-8-badal.nilawar@intel.com>
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

AMC powers down the SoC after reporting a thermal trip. Notify userspace
to attempt cold-reset recovery after the SoC cools down.

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_amc.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_amc.c b/drivers/gpu/drm/xe/xe_amc.c
index 37694e34271a..58edf52724e9 100644
--- a/drivers/gpu/drm/xe/xe_amc.c
+++ b/drivers/gpu/drm/xe/xe_amc.c
@@ -115,6 +115,8 @@ static void xe_amc_work(struct work_struct *work)
 	u8 alert_reason = AMC_ALERT_UNKNOWN;
 	struct amc_response response;
 	struct i2c_client *client;
+	const char *alert_str;
+	unsigned long recovery = 0;
 	int ret;
 
 	xe_pm_runtime_get(xe);
@@ -161,19 +163,25 @@ static void xe_amc_work(struct work_struct *work)
 
 	switch (alert_reason) {
 	case AMC_ALERT_FW_DOWNLOAD:
-	case AMC_ALERT_THERMAL_TRIP:
 	case AMC_ALERT_OOB_REQUEST:
 	case AMC_ALERT_OOB_RESET:
 	case AMC_ALERT_CATERR:
-		dev_warn(amc->i2c->drm_dev, "AMC Alert: %s\n", amc_alert[alert_reason]);
-		xe_wedge_declare(i2c_client_to_xe_device(client),
-				 DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET);
+		alert_str = amc_alert[alert_reason];
+		recovery = DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET;
+		break;
+	case AMC_ALERT_THERMAL_TRIP:
+		alert_str = amc_alert[alert_reason];
+		recovery = DRM_WEDGE_RECOVERY_COLD_RESET;
 		break;
 	default:
-		dev_warn(amc->i2c->drm_dev, "unknown AMC alert: %d\n", alert_reason);
+		alert_str = "unknown";
 		break;
 	}
 
+	dev_warn(amc->i2c->drm_dev, "AMC Alert: %s (%u)\n", alert_str, alert_reason);
+	if (recovery)
+		xe_wedge_declare(i2c_client_to_xe_device(client), recovery);
+
 	xe_pm_runtime_put(xe);
 }
 
-- 
2.56.0

