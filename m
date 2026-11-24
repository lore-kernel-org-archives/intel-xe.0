Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF794606A31E
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 00:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=l9TAoZxO
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7142510F2B5;
	Tue, 24 Nov 2026 00:39:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70B4510F2B8
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Nov 2026 00:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795480762; x=1827016762;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=4xF1evHpyznKiMIzsTeSc2qiff37ofUk6whKxWvMSsM=;
 b=l9TAoZxOg1BKwoqJXQ59O8ZXmwDnvwK2Ej+rqnVmPbhFFATadpamWvTN
 Ydk3M/7TRhLH2EyeC8XLaVe1BXXLrikeKDlTnNB2dabfcDYYNP/INn45R
 dTaJldcm4LdqOdUSTQm2eVIYAmQUzYQ6BAyLkepEvq1bEgdx0xjotnS5c
 YoUJheOfY6yOXB6mm4IBD837eWJwdTKiTiSF45jzMmiwPH92fSAMGbpcb
 p9+QIDMZJsRyW+77rGnr4zgnisJfWPNcqs8/OlXSigk0Hks3QnlAKdLCM
 pzgkaJAHCxiVqc9dLyH5oPDUQjTzila9W4R3atVVn/ALpLhxA9rcZL3Un Q==;
X-CSE-ConnectionGUID: 7Jnxh36FSme/69NqgbXUdg==
X-CSE-MsgGUID: JE5NlTIXTQaKeMVnRaUGRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4332870"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4332870"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 16:39:06 -0800
X-CSE-ConnectionGUID: jU4f+i68Rd6UGk64LK18Fw==
X-CSE-MsgGUID: TKMXsrg2Qcy35YDW8S6KpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; d="scan'208";a="11805758"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 16:39:06 -0800
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org,
 hansg@kernel.org, ilpo.jarvinen@linux.intel.com, matthew.brost@intel.com,
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com,
 airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com,
 anoop.c.vijay@intel.com, badal.nilawar@intel.com,
 matthew.d.roper@intel.com, james.ausmus@intel.com
Subject: [PATCH v22 10/19] drm/xe/vsec: Update VSEC probe order
Date: Mon, 23 Nov 2026 16:39:06 -0800
Message-ID: <20261124003856.4145635-31-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261124003856.4145635-21-michael.j.ruhl@intel.com>
References: <20261124003856.4145635-21-michael.j.ruhl@intel.com>
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
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Both debugfs and hwmon access the PMT data area before PMT is
initialized.

Hardwired offset usage allows this to work by accident.
Upcoming changes will break this usage.

Re-order the probe steps to initialize VSEC before the other
features are initialized.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index eafc66d686e2..e9a9634744ae 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1092,6 +1092,8 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		goto err_unregister_display;
 
+	xe_vsec_init(xe);
+
 	xe_debugfs_register(xe);
 
 	err = xe_hwmon_register(xe);
@@ -1102,8 +1104,6 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		goto err_unregister_hwmon;
 
-	xe_vsec_init(xe);
-
 	err = xe_sriov_init_late(xe);
 	if (err)
 		goto err_unregister_hwmon;
-- 
2.43.0

