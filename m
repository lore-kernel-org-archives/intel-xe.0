Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0ED606A320
	for <intel-xe@archiver.kernel.org>; Wed, 28 Oct 2026 09:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CC8WUO0L
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63DD810E5DF;
	Wed, 28 Oct 2026 09:58:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8BE210E5DF
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Oct 2026 09:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793181480; x=1824717480;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vCc1BbgbPecNxiyb0SL7dnJphGopjjlWo38gTENsTUw=;
 b=CC8WUO0LcRRjEXOZrjCfiRj3GIfY1c3kcQGTZEQrhb9WWVNBxt8jBSoU
 i1kl1Rc1Tp/UQBMdbxp+3wgqlGyH994lJEmosp1y65SmHlpf1RykPRAqy
 MjMopLlOZBvpsZUgfBNFhLR2305Z6Pk+dYAiaU4mPasTH8AecvLXb8eA0
 /hO/EBATA5fwVZ5N4fjTy8KsHyIdg+VEBln2ZzjhdxqmkLbN5IMqJXSPQ
 WGNXrXC2flj8AG/5p1ezkAmnVWtCiQiezjAHHN5IcyR9xFIjZy6mq4qTN
 gTe+nxlL5RJxc5j/wZydfe0QSI4nfs6pQ1ureCP/2SnSBn39L6muWCu2w Q==;
X-CSE-ConnectionGUID: 3XS86aFdSguYBv2+1G0O3A==
X-CSE-MsgGUID: LUKgN+9jQtqcDeczn0Zc3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1913988"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1913988"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 02:58:00 -0700
X-CSE-ConnectionGUID: hoBadmPPQPuOgFsDd2tAHg==
X-CSE-MsgGUID: BJDNHvT8RGybtDgestraXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4782784"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 02:57:57 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, himal.prasad.ghimiray@intel.com,
 arvind.yadav@intel.com, syed.abdul.muqthyar.ahmed@intel.com,
 nitin.r.gote@intel.com
Subject: [PATCH v6 09/10] drm/xe/xe_ras: Report soc internal errors using SIGID
Date: Wed, 28 Oct 2026 15:27:33 +0530
Message-ID: <20261028095723.734387-21-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028095723.734387-12-badal.nilawar@intel.com>
References: <20261028095723.734387-12-badal.nilawar@intel.com>
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

Use xe_log_* helpers to report soc internal errors.

Example:
	xe 0000:03:00.0: [drm] *ERROR* SIGID=205 FATAL
(020600700000000000000000) [Hardware Error]: SOC_INTERNAL:
PUNIT error detected: 0x00000002

Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>
---
v6:
  - Print entire xe_ras_soc_error_source for unknown errors (Raag)
v5:
  - Log unknown soc internal errors
---
 drivers/gpu/drm/xe/xe_ras.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index d7789beb2f6f..5eeccc920d7c 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -609,7 +609,7 @@ static u8 handle_soc_internal_errors(struct xe_device *xe, struct xe_ras_error_a
 {
 	struct xe_ras_soc_error *info = (void *)arr->details;
 	struct xe_ras_soc_error_source *source = &info->source;
-	struct xe_ras_error_class *counter = &arr->counter;
+	u32 raw_source;
 
 	if (source->csc) {
 		struct xe_ras_csc_error *csc_error = (void *)info->details;
@@ -623,9 +623,8 @@ static u8 handle_soc_internal_errors(struct xe_device *xe, struct xe_ras_error_a
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
@@ -633,15 +632,19 @@ static u8 handle_soc_internal_errors(struct xe_device *xe, struct xe_ras_error_a
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
+	memcpy(&raw_source, source, sizeof(raw_source));
+	xe_log_comp(xe, ras_sev_to_cper_sev(arr->counter.common.severity), SOC_INTERNAL,
+		    &arr->counter, sizeof(arr->counter),
+		    "Unknown error detected (source=0x%08x)\n", raw_source);
 	return XE_RAS_RECOVERY_ACTION_RESET;
 }
 
-- 
2.56.0

