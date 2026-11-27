Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA830606A31C
	for <intel-xe@archiver.kernel.org>; Fri, 27 Nov 2026 06:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IidnYq3G
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA9BE112264;
	Fri, 27 Nov 2026 06:14:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71C1410FC9F
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Nov 2026 06:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795760028; x=1827296028;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5XQuBWm2GNWonvkbJP57dLIbATbdV9H/qokGg28N4pU=;
 b=IidnYq3G3No/kwn9wO0p/GJ6twBynriOpMzTc7kLaXVDD3ki4QNTtB6n
 gm2/QuEt+NfFEXo4NYwO9AAsJB4TfTLsqBvqbrpprPUJ0mX1d7PhvxwUM
 /si81YEYzTRWMdZdaulO7SA++TKPJphBkOjD+ifniGAQAomwHNwKe/QMG
 BcKt0/NbeKP9sdJx640ugRpkUs2+DdcFlYZ2D9lNR+/o3U5lRbN22BS3X
 iXCkaBXWLQRPhWLrQBbWeycTLs0siayXeB4icCzNaK5GhJF8pKhVI7Vw9
 RYsmnnL3hhF5MXpxitCnJuv45syAOohWyfC7M6YCLrSk6T6ZqbhRz7Mse g==;
X-CSE-ConnectionGUID: T+8rBqiQSc2dgfJqMKDxVA==
X-CSE-MsgGUID: epxCcdstRHGyzYEZEzm+kQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4554503"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4554503"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 22:13:47 -0800
X-CSE-ConnectionGUID: HyTB09kJRrOwk4OKsqsOFA==
X-CSE-MsgGUID: w0TnaIPvRt+K6+gAZZq4Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; d="scan'208";a="12353936"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 22:13:45 -0800
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, heikki.krogerus@linux.intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [PATCH 3/5] drm/xe: Request cold-reset recovery on AMC CATERR alert
Date: Fri, 27 Nov 2026 11:43:37 +0530
Message-ID: <20261127061333.1019047-10-badal.nilawar@intel.com>
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

When AMC reports a catastrophic error, notify userspace to attempt
cold-reset recovery.

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_amc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_amc.c b/drivers/gpu/drm/xe/xe_amc.c
index 346a7a7f8fae..b0e9250fa971 100644
--- a/drivers/gpu/drm/xe/xe_amc.c
+++ b/drivers/gpu/drm/xe/xe_amc.c
@@ -164,10 +164,10 @@ static void xe_amc_work(struct work_struct *work)
 	switch (alert_reason) {
 	case AMC_ALERT_FW_DOWNLOAD:
 	case AMC_ALERT_OOB_RESET:
-	case AMC_ALERT_CATERR:
 		alert_str = amc_alert[alert_reason];
 		recovery = DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET;
 		break;
+	case AMC_ALERT_CATERR:
 	case AMC_ALERT_OOB_REQUEST:
 	case AMC_ALERT_THERMAL_TRIP:
 		alert_str = amc_alert[alert_reason];
-- 
2.56.0

