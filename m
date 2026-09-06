Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B627C79F8C
	for <intel-xe@archiver.kernel.org>; Sun,  6 Sep 2026 17:09:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE55610E108;
	Sun,  6 Sep 2026 17:09:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W6MvX9Pj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3626A10E1F2
 for <intel-xe@lists.freedesktop.org>; Sun,  6 Sep 2026 17:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788714585; x=1820250585;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S6wfB6y5XtJupHSIbnN//wUeG1rrbJzKcrxaktqRgx8=;
 b=W6MvX9Pj4+G2pY3xhz+N6X4X+UQaBp6YCiTbTHJrYJHreWdVe95HpVbq
 +9OgFq3dch+g3GAVWvEQ2oXzDQnkIi49oA+W9q4aEiFtgVe9BuSgoluP2
 9isk7Mq8tpOG5pFVrqQuZ8aYQiadn8l8N6pmG6ugMRyo7xhmchh8xt1/3
 grb5B8AD4/kOWZL9QgqvggAo90B24kWzmNS1Fj3LCAFsfNREi66ZoKx4Z
 TWYpTf7RU9aahky6JWT6K+XgeG1YULdB2wPUF7+PzmbI28Cd7psxjXb8U
 Jo+Fbj16Dvaz/7R+W0SfBn9qC+Mbmn4t9jcasgCzeW+DOtgyyM3hYZwmq A==;
X-CSE-ConnectionGUID: Z3maqVobS/Kn7DhBuzj4Pw==
X-CSE-MsgGUID: OreOr8ewRmiS8oTi2v78vQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="88071453"
X-IronPort-AV: E=Sophos;i="6.25,265,1779174000"; d="scan'208";a="88071453"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2026 10:09:45 -0700
X-CSE-ConnectionGUID: D8wUTHnWS4SpPq71gPrW0Q==
X-CSE-MsgGUID: RHFxY313QVKDsS8+QOos9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,265,1779174000"; d="scan'208";a="269996138"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2026 10:09:42 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, michal.wajdeczko@intel.com,
 himal.prasad.ghimiray@intel.com, arvind.yadav@intel.com,
 syed.abdul.muqthyar.ahmed@intel.com, nitin.r.gote@intel.com
Subject: [PATCH v3 09/12] drm/xe/xe_ras: Report core compute errors using SIGID
Date: Sun,  6 Sep 2026 22:56:14 +0530
Message-ID: <20260906172604.2215987-23-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260906172604.2215987-14-badal.nilawar@intel.com>
References: <20260906172604.2215987-14-badal.nilawar@intel.com>
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

v2:
  - Pass RAS firmware reported severity to xe_log

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_ras.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 3a7f80370827..78ea5e33e244 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -310,21 +310,27 @@ static void ras_send_error_event(struct xe_device *xe, u8 severity, u8 component
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
 
@@ -597,7 +603,7 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
 
 			switch (component) {
 			case XE_RAS_COMP_CORE_COMPUTE:
-				action = handle_core_compute_errors(arr);
+				action = handle_core_compute_errors(xe, arr);
 				break;
 			case XE_RAS_COMP_SOC_INTERNAL:
 				action = handle_soc_internal_errors(xe, arr);
-- 
2.54.0

