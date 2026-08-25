Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E3C4C61DBC
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 17:43:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F6DA10EB28;
	Tue, 25 Aug 2026 17:43:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dLd+r8ao";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B1F510EB28
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Aug 2026 17:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787679780; x=1819215780;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=x99dDUIJ0yXUsrPrBK53hZ4FsFdY7XA8h/UTY3/2Pis=;
 b=dLd+r8aoBOVY1ZRO54GvaYihq7IciCK8lhdpHOl61BCE8JRQnp92BCas
 SSZfaiwjqy0j2qYOo5uzUH28A1aCTQq9BgtzQvrknI2AHtpoT1c5mUqsA
 f0kHtO+Zd8sz3AQCED5zRraVNjICYKpjowyJeKt5ZcWhn5Eop9VI5uPm3
 o3p3kTz1B3+C+1m6fbzM1Uhfztrms0h3E4EG+TAO+Bri7OF7DkP2VmyBP
 uaGhkpNkIu2IpgH+B9DZxn36uo3n1uIlwtl506vGWSg/5Ch7KiiaFMTYx
 cQhnTCx9LWMHOyGR4dZ/UDEorDZOO6UnueBjooIOv526x1YzNo4+ajboc g==;
X-CSE-ConnectionGUID: qBVZ37adR52x2jVQGA4tBQ==
X-CSE-MsgGUID: xFqBiNV2SWiadYT/x03Veg==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="88210826"
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; d="scan'208";a="88210826"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 10:43:00 -0700
X-CSE-ConnectionGUID: iNXES1pGQfKcwioIIT4EKw==
X-CSE-MsgGUID: KerhH2LFQGCqQsCyYDCO5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; d="scan'208";a="272585126"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 10:42:57 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, michal.wajdeczko@intel.com,
 himal.prasad.ghimiray@intel.com, arvind.yadav@intel.com
Subject: [PATCH v2 09/11] drm/xe/ras: Report core compute errors using SIGID
Date: Tue, 25 Aug 2026 23:29:26 +0530
Message-ID: <20260825175916.1103841-22-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260825175916.1103841-13-badal.nilawar@intel.com>
References: <20260825175916.1103841-13-badal.nilawar@intel.com>
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
 drivers/gpu/drm/xe/xe_ras.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 172653be1b82..3b43d363d5de 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -332,7 +332,7 @@ static void ras_send_error_event(struct xe_device *xe, u8 severity, u8 component
 	xe_drm_ras_event(xe, drm_component, drm_severity, response.value);
 }
 
-static u8 handle_core_compute_errors(struct xe_ras_error_array *arr)
+static u8 handle_core_compute_errors(struct xe_device *xe, struct xe_ras_error_array *arr)
 {
 	struct xe_ras_compute_error *error_info = (void *)arr->details;
 	u8 uncorr_type;
@@ -340,13 +340,18 @@ static u8 handle_core_compute_errors(struct xe_ras_error_array *arr)
 	uncorr_type = FIELD_GET(CORE_COMPUTE_UNCORR_TYPE, error_info->log_header);
 
 	/* Request a reset if error is global */
-	if (uncorr_type == GLOBAL_UNCORR_ERROR)
+	if (uncorr_type == GLOBAL_UNCORR_ERROR) {
+		xe_log_comp_recoverable(xe, CORE_COMPUTE, &arr->counter, sizeof(arr->counter),
+					"Global uncorrectable error detected\n");
 		return XE_RAS_RECOVERY_ACTION_RESET;
+	}
 
 	/*
 	 * No action needed for other errors.
 	 * Local errors are recovered using an engine reset by GuC.
 	 */
+	xe_log_comp_recoverable(xe, CORE_COMPUTE, &arr->counter, sizeof(arr->counter),
+				"Other compute errors\n");
 	return XE_RAS_RECOVERY_ACTION_RECOVERED;
 }
 
@@ -940,7 +945,7 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
 
 			switch (component) {
 			case XE_RAS_COMP_CORE_COMPUTE:
-				action = handle_core_compute_errors(arr);
+				action = handle_core_compute_errors(xe, arr);
 				break;
 			case XE_RAS_COMP_SOC_INTERNAL:
 				action = handle_soc_internal_errors(xe, arr);
-- 
2.54.0

