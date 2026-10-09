Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D41E5CA6012
	for <intel-xe@archiver.kernel.org>; Fri,  9 Oct 2026 10:31:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6311E112047;
	Fri,  9 Oct 2026 10:31:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j4mjRzbV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B7FD112058
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Oct 2026 10:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791541786; x=1823077786;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XZEedHhQgxoVse1kgrkuKnreDxVE6INYiE5f26wrf/o=;
 b=j4mjRzbVww/sfNQaTYjpndwHMjXxryQXWP29A3+53t7kSyREggv6s9IZ
 O6BprJLGjSFjuZ9MQoEYiLlwuWZ5yY6UUy2CSk8r7Y5bfp1HPSLkTYVXl
 9l+7kGVpAmI2TeUr2FXkeOxdm0ru4/KjBI4FF7iQlfQF71f3C2vTaZ/jR
 3maBtQHaQ8lDxOE3sR5HB9jogCSoqffKqEZjMb6+5ol6inZ/FLsU3oJdC
 lpDibfE6iJN05bLi8k9HpgXTz/2z84QS6rymXhKiAkiqJK8Qk9g0eWyu+
 v+9LYoiYPSYsp+YTYC41cVwxD64mXETjAp3buuOOXAYk4CKbxIcQ6RTNR g==;
X-CSE-ConnectionGUID: HPfaCe8cRhS5lHiQgG6NHA==
X-CSE-MsgGUID: xMEm+T2TS22FNbaBaytPbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="344100"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="344100"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 03:29:45 -0700
X-CSE-ConnectionGUID: ib3VsZ4qS6+4jh8JYS3Jcg==
X-CSE-MsgGUID: rqM0xJ3tQbuT1nl85ulqRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="2025615"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 03:29:42 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, himal.prasad.ghimiray@intel.com,
 arvind.yadav@intel.com, syed.abdul.muqthyar.ahmed@intel.com,
 nitin.r.gote@intel.com, pravalika.gurram@intel.com
Subject: [PATCH v4 10/12] drm/xe/xe_ras: Report core compute errors using SIGID
Date: Fri,  9 Oct 2026 16:16:13 +0530
Message-ID: <20261009104602.1075405-24-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261009104602.1075405-14-badal.nilawar@intel.com>
References: <20261009104602.1075405-14-badal.nilawar@intel.com>
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

Use xe_log_* helpers to report core compute errors.

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>
---
v2:
  - Pass RAS firmware reported severity to xe_log
---
 drivers/gpu/drm/xe/xe_ras.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 8ed4a6992ef1..6647300c7f17 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -332,21 +332,27 @@ static void ras_send_error_event(struct xe_device *xe, u8 severity, u8 component
 	xe_drm_ras_event(xe, drm_component, drm_severity, response.value);
 }
 
-static u8 handle_core_compute_errors(struct xe_ras_error_array *arr)
+static u8 handle_core_compute_errors(struct xe_device *xe, struct xe_ras_error_array *arr)
 {
 	struct xe_ras_compute_error *error_info = (void *)arr->details;
+	u8 cper_sev = ras_sev_to_cper_sev(arr->counter.common.severity);
 	u8 uncorr_type;
 
 	uncorr_type = FIELD_GET(CORE_COMPUTE_UNCORR_TYPE, error_info->log_header);
 
 	/* Request a reset if error is global */
-	if (uncorr_type == GLOBAL_UNCORR_ERROR)
+	if (uncorr_type == GLOBAL_UNCORR_ERROR) {
+		xe_log_comp(xe, cper_sev, CORE_COMPUTE, &arr->counter, sizeof(arr->counter),
+			    "Global uncorrectable error detected\n");
 		return XE_RAS_RECOVERY_ACTION_RESET;
+	}
 
 	/*
 	 * No action needed for other errors.
 	 * Local errors are recovered using an engine reset by GuC.
 	 */
+	xe_log_comp(xe, cper_sev, CORE_COMPUTE, &arr->counter, sizeof(arr->counter),
+		    "Other compute errors\n");
 	return XE_RAS_RECOVERY_ACTION_RECOVERED;
 }
 
@@ -592,7 +598,7 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
 
 			switch (component) {
 			case XE_RAS_COMP_CORE_COMPUTE:
-				action = handle_core_compute_errors(arr);
+				action = handle_core_compute_errors(xe, arr);
 				break;
 			case XE_RAS_COMP_SOC_INTERNAL:
 				action = handle_soc_internal_errors(xe, arr);
-- 
2.54.0

