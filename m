Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EC79C61DBD
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 17:43:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 415F110EB32;
	Tue, 25 Aug 2026 17:43:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="koApnsuP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73DA110EB32
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Aug 2026 17:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787679783; x=1819215783;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YTvqKV1a6Xtb3B88aX8Gu88d4B8ijnjE5thCBDs0Lzk=;
 b=koApnsuPyKaCx+WSytGCKVrxanKd3C/Emwsky+c2FmkyY9zeYkyYoKXJ
 860xEu8fLygyQpu5f2DEjKbWLBN2d5kJ7szrpITrYpHPaHMuL2XeDLR0O
 ZjxipQkpaGsjgStx42j7bx/odekda4wVamDO727Cg5JRgOutGITZDfD1p
 jK9L7NMxHgOvvasXP3OMHXKQcxZwLSOdUECy9/MC6Att2+OcHqxRYVJW+
 eg9jE5mj2wM7Xu2C4PUDl9t7YmYvEaH0WrQe4kcHLleAcRo8qo01WcUci
 zCJt/qqdazovUA3s1dNYcEyOCiRrtaylNBMqheXzl/5RASlBYNU7UNuJo A==;
X-CSE-ConnectionGUID: P5NRYbnWRDGBUG63jxKmzA==
X-CSE-MsgGUID: PyqCR8DmT0yMqH6pieq/rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="88210831"
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; d="scan'208";a="88210831"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 10:43:03 -0700
X-CSE-ConnectionGUID: qkGOJeUnTJGIuVNOnyxG2A==
X-CSE-MsgGUID: u4IXT/c9RCGC9I0keym3KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; d="scan'208";a="272585133"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 10:43:00 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, michal.wajdeczko@intel.com,
 himal.prasad.ghimiray@intel.com, arvind.yadav@intel.com
Subject: [PATCH v2 10/11] drm/xe/ras: Report soc internal errors using SIGID
Date: Tue, 25 Aug 2026 23:29:27 +0530
Message-ID: <20260825175916.1103841-23-badal.nilawar@intel.com>
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

Use xe_log_* helpers to report soc internal errors.

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_ras.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 3b43d363d5de..4cd1d5eb75f4 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -365,7 +365,6 @@ static u8 handle_soc_internal_errors(struct xe_device *xe, struct xe_ras_error_a
 {
 	struct xe_ras_soc_error *info = (void *)arr->details;
 	struct xe_ras_soc_error_source *source = &info->source;
-	struct xe_ras_error_class *counter = &arr->counter;
 
 	if (source->csc) {
 		struct xe_ras_csc_error *csc_error = (void *)info->details;
@@ -379,19 +378,18 @@ static u8 handle_soc_internal_errors(struct xe_device *xe, struct xe_ras_error_a
 		 * is required.
 		 */
 		if (csc_error->hec_fw_error) {
-			xe_err(xe, "[RAS]: CSC %s detected: 0x%x\n",
-			       sev_to_str(counter->common.severity),
-			       csc_error->hec_fw_error);
-			xe_survivability_mode_runtime_enable(xe);
+			xe_log_comp_fatal(xe, SOC_INTERNAL, &arr->counter, sizeof(arr->counter),
+					  "CSC error detected: 0x%x\n", csc_error->hec_fw_error);
+		xe_survivability_mode_runtime_enable(xe);
 			return XE_RAS_RECOVERY_ACTION_DISCONNECT;
 		}
 	} else if (source->ieh) {
 		struct xe_ras_ieh_error *ieh_error = (void *)info->details;
 
 		if (ieh_error->global_error_status & XE_RAS_SOC_IEH_PUNIT) {
-			xe_err(xe, "[RAS]: PUNIT %s detected: 0x%x\n",
-			       sev_to_str(counter->common.severity),
-			       ieh_error->global_error_status);
+			xe_log_comp_fatal(xe, SOC_INTERNAL, &arr->counter, sizeof(arr->counter),
+					  "PUNIT error detected: 0x%x\n",
+					  ieh_error->global_error_status);
 			punit_error_handler(xe);
 			return XE_RAS_RECOVERY_ACTION_DISCONNECT;
 		}
-- 
2.54.0

