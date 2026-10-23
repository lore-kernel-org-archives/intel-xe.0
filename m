Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971C8606A31E
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 04:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EqXLw1Nn
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D817112948;
	Fri, 23 Oct 2026 04:17:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E0D8112968
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Oct 2026 04:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792729067; x=1824265067;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M3/OQmP8ywtAXMja4xkfMhZQ+460k/NGlnmn8f19y98=;
 b=EqXLw1NnN9DuBJooyZ82buXFdQHRj/3bHSKs8eNE1bYdmAb+ZWamC7NZ
 KZK0IzmcvyeMo36uXd0Ww0BgaEVSWxpBRaRcD0ccfIKHk126n+rSqgxaU
 YK5GaGMEOhhlCyO6nwruB3KCzPzmLPnyMkta33S/gntU4u5eM8PnLZ1Di
 bGfyV3P1pKXrKeoTqFSSP18Ij4u3u0eeFXyeYkDcQV37+rN2cG9XN1WLD
 W1By39uWQ0itjWjFjh32BYYxLRPuvzfVw3UeWxeF6lx+ssz7U6idKRadx
 GjM1UogbLowyUDA11ed1n2O8Zql6j8Nb/XBQ3MbOHqrM2oUF5wpHeGh/q Q==;
X-CSE-ConnectionGUID: 8+Nbtf0iTfeTMeZ0RzxGpQ==
X-CSE-MsgGUID: vYqLOBUVR1Gdx/37MtWqDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1383499"
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="1383499"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 21:17:47 -0700
X-CSE-ConnectionGUID: ZlQNzDFgSMmRN4jK7UQ4CQ==
X-CSE-MsgGUID: btfoZBFeQNqqUw5xwMxwAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="3658287"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 21:17:44 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, himal.prasad.ghimiray@intel.com,
 arvind.yadav@intel.com, syed.abdul.muqthyar.ahmed@intel.com,
 nitin.r.gote@intel.com
Subject: [PATCH v5 08/13] drm/xe/xe_ras: Report core compute errors using SIGID
Date: Fri, 23 Oct 2026 10:04:30 +0530
Message-ID: <20261023043422.681260-23-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261023043422.681260-15-badal.nilawar@intel.com>
References: <20261023043422.681260-15-badal.nilawar@intel.com>
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Use xe_log_* helpers to report core compute errors.

Example:
	xe 0000:03:00.0: [drm] *ERROR* SIGID=203 (02020012000a000200000800)
[Hardware Error]: CORE_COMPUTE: Uncorrectable error detected, type 2

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>
---
v5:
  - Print uncorr error type in sig id log (Riana)
v2:
  - Pass RAS firmware reported severity to xe_log
---
 drivers/gpu/drm/xe/xe_ras.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 5ebfc6e8dfc7..1f94dd1fb91b 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -577,13 +577,17 @@ static void ras_send_error_event(struct xe_device *xe, u8 severity, u8 component
 	xe_drm_ras_event(xe, drm_component, drm_severity, value);
 }
 
-static u8 handle_core_compute_errors(struct xe_ras_error_array *arr)
+static u8 handle_core_compute_errors(struct xe_device *xe, struct xe_ras_error_array *arr)
 {
 	struct xe_ras_compute_error *error_info = (void *)arr->details;
+	u8 cper_sev = ras_sev_to_cper_sev(arr->counter.common.severity);
 	u8 uncorr_type;
 
 	uncorr_type = FIELD_GET(CORE_COMPUTE_UNCORR_TYPE, error_info->log_header);
 
+	xe_log_comp(xe, cper_sev, CORE_COMPUTE, &arr->counter, sizeof(arr->counter),
+		    "Uncorrectable error detected, type %u\n", uncorr_type);
+
 	/* Request a reset if error is global */
 	if (uncorr_type == GLOBAL_UNCORR_ERROR)
 		return XE_RAS_RECOVERY_ACTION_RESET;
@@ -867,7 +871,7 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
 
 			switch (component) {
 			case XE_RAS_COMP_CORE_COMPUTE:
-				action = handle_core_compute_errors(arr);
+				action = handle_core_compute_errors(xe, arr);
 				break;
 			case XE_RAS_COMP_SOC_INTERNAL:
 				action = handle_soc_internal_errors(xe, arr);
-- 
2.54.0

