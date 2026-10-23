Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D081A606A319
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 04:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hQ8YFIEC
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94C2810E577;
	Fri, 23 Oct 2026 04:17:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C0D911296C
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Oct 2026 04:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792729070; x=1824265070;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=f4lZ3pKsjkUADk/bAjQAmMzhIRT4OjFIgnVDIbaNxR4=;
 b=hQ8YFIEC6YTSHMg1Rx3V+86JmwLObrHxqpOQfaLKwWhjmPdzWIJp5D+Y
 YnxUkZlQZPQAZQvX860txowGmjFoIB7PJhQjsiCpkrX5WdFTD9nf9oe4I
 PQ9iERxB0YeqC5tDpDGp2wznNQUq5jWLL05Tc4d4gmsWrv9CAXTOL3rb9
 VQuQs+EES+0MWpzDhZ0IqFM1wpsXFnp+9aMB+LhzXhwZMNXk52lulAhWp
 AUMuzXr4Tyh1ufI+C1qLaemoPdiX9oypR/c0Am5GEIHdBP6rE+eV+23oc
 wFXQz+k9yovwUX/ywYF75SQHzrfTAhHeeTfPbZ2Q2rUf/2wHIJ6UUqj3D Q==;
X-CSE-ConnectionGUID: uvYDtKSLSt21eKO6EBfl2A==
X-CSE-MsgGUID: rMK5bix9SK+0whpOKfgJ6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1383503"
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="1383503"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 21:17:50 -0700
X-CSE-ConnectionGUID: qLaUtbCfSsCJY3IhDSukYw==
X-CSE-MsgGUID: wW3jIZdtTquAoiu3h+X8Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="3658292"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 21:17:48 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, himal.prasad.ghimiray@intel.com,
 arvind.yadav@intel.com, syed.abdul.muqthyar.ahmed@intel.com,
 nitin.r.gote@intel.com
Subject: [PATCH v5 09/13] drm/xe/xe_ras: Report soc internal errors using SIGID
Date: Fri, 23 Oct 2026 10:04:31 +0530
Message-ID: <20261023043422.681260-24-badal.nilawar@intel.com>
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

Use xe_log_* helpers to report soc internal errors.

Example:
	xe 0000:03:00.0: [drm] *ERROR* SIGID=205 FATAL
(020600700000000000000000) [Hardware Error]: SOC_INTERNAL:
PUNIT error detected: 0x00000002

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>
---
v5:
  - Log unknown soc internal errors
---
 drivers/gpu/drm/xe/xe_ras.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 1f94dd1fb91b..4408fc530900 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -608,7 +608,6 @@ static u8 handle_soc_internal_errors(struct xe_device *xe, struct xe_ras_error_a
 {
 	struct xe_ras_soc_error *info = (void *)arr->details;
 	struct xe_ras_soc_error_source *source = &info->source;
-	struct xe_ras_error_class *counter = &arr->counter;
 
 	if (source->csc) {
 		struct xe_ras_csc_error *csc_error = (void *)info->details;
@@ -622,9 +621,8 @@ static u8 handle_soc_internal_errors(struct xe_device *xe, struct xe_ras_error_a
 		 * is required.
 		 */
 		if (csc_error->hec_fw_error) {
-			xe_err(xe, "[RAS]: CSC %s detected: 0x%x\n",
-			       sev_to_str(counter->common.severity),
-			       csc_error->hec_fw_error);
+			xe_log_comp_fatal(xe, SOC_INTERNAL, &arr->counter, sizeof(arr->counter),
+					  "CSC error detected: 0x%08x\n", csc_error->hec_fw_error);
 			xe_survivability_mode_runtime_enable(xe);
 			return XE_RAS_RECOVERY_ACTION_DISCONNECT;
 		}
@@ -632,15 +630,19 @@ static u8 handle_soc_internal_errors(struct xe_device *xe, struct xe_ras_error_a
 		struct xe_ras_ieh_error *ieh_error = (void *)info->details;
 
 		if (ieh_error->global_error_status & XE_RAS_SOC_IEH_PUNIT) {
-			xe_err(xe, "[RAS]: PUNIT %s detected: 0x%x\n",
-			       sev_to_str(counter->common.severity),
-			       ieh_error->global_error_status);
+			xe_log_comp_fatal(xe, SOC_INTERNAL, &arr->counter, sizeof(arr->counter),
+					  "PUNIT error detected: 0x%08x\n",
+					  ieh_error->global_error_status);
 			punit_error_handler(xe);
 			return XE_RAS_RECOVERY_ACTION_DISCONNECT;
 		}
 	}
 
 	/* For other SoC internal errors, request a reset as recovery mechanism */
+	xe_log_comp(xe, ras_sev_to_cper_sev(arr->counter.common.severity), SOC_INTERNAL,
+		    &arr->counter, sizeof(arr->counter),
+		    "Unknown error detected (csc=%u ieh=%u)\n",
+		    source->csc, source->ieh);
 	return XE_RAS_RECOVERY_ACTION_RESET;
 }
 
-- 
2.54.0

