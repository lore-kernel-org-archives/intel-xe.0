Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CE6CC79F8C
	for <intel-xe@archiver.kernel.org>; Sun,  6 Sep 2026 17:09:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 252A810E1F2;
	Sun,  6 Sep 2026 17:09:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fNLnyWUd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BD5A10E1F2
 for <intel-xe@lists.freedesktop.org>; Sun,  6 Sep 2026 17:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788714589; x=1820250589;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6qASXvUZh5ZBo8rg3l6ALg+H8z8iXRH1IhF2NotOAnc=;
 b=fNLnyWUdX5gHQG+AOcg3d0iaPPv5lu+w2mlKHpXEZX9hL1G8KByFNWzz
 Z3EYSyVi34CZMCAvHKFpW2AAHCwZuMgq1Q+MYFK4eu/4B0jF25Sa7plTG
 XFRL2SdeYYcf4tB7dxZZpMbXHStPvsypIE9LrRWedPePd3AH7UqsZvyMV
 zXrjaC+TuKXwVKJfGr6nMzxa2Naujinc/RgBnDHvA73Kv6YAUk9gGqNCC
 aW/piRed/xrh9pDORQY23SR6CgggppP9hP3F9eBoIu4nifSZBUZvfy++M
 ifH4pD7ofPLkKh/aTYYpI3k6Nh+HPZiF/oynbOCHwEIoktd0qvV2lLzLR A==;
X-CSE-ConnectionGUID: zvHlRWKaSFiL6aQ6RWuhZg==
X-CSE-MsgGUID: i8NC6L9QRWOkUwhw061+qQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="88071456"
X-IronPort-AV: E=Sophos;i="6.25,265,1779174000"; d="scan'208";a="88071456"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2026 10:09:48 -0700
X-CSE-ConnectionGUID: ntp21tKZTz+Y+8zvgmo9GA==
X-CSE-MsgGUID: LvwVA9gLR5aSw98DlWAi2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,265,1779174000"; d="scan'208";a="269996143"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2026 10:09:46 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, michal.wajdeczko@intel.com,
 himal.prasad.ghimiray@intel.com, arvind.yadav@intel.com,
 syed.abdul.muqthyar.ahmed@intel.com, nitin.r.gote@intel.com
Subject: [PATCH v3 10/12] drm/xe/xe_ras: Report soc internal errors using SIGID
Date: Sun,  6 Sep 2026 22:56:15 +0530
Message-ID: <20260906172604.2215987-24-badal.nilawar@intel.com>
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

Use xe_log_* helpers to report soc internal errors.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>
---
v2: Fix indentation
---
 drivers/gpu/drm/xe/xe_ras.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 78ea5e33e244..e93a989fc8f6 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -344,7 +344,6 @@ static u8 handle_soc_internal_errors(struct xe_device *xe, struct xe_ras_error_a
 {
 	struct xe_ras_soc_error *info = (void *)arr->details;
 	struct xe_ras_soc_error_source *source = &info->source;
-	struct xe_ras_error_class *counter = &arr->counter;
 
 	if (source->csc) {
 		struct xe_ras_csc_error *csc_error = (void *)info->details;
@@ -358,9 +357,8 @@ static u8 handle_soc_internal_errors(struct xe_device *xe, struct xe_ras_error_a
 		 * is required.
 		 */
 		if (csc_error->hec_fw_error) {
-			xe_err(xe, "[RAS]: CSC %s detected: 0x%x\n",
-			       sev_to_str(counter->common.severity),
-			       csc_error->hec_fw_error);
+			xe_log_comp_fatal(xe, SOC_INTERNAL, &arr->counter, sizeof(arr->counter),
+					  "CSC error detected: 0x%x\n", csc_error->hec_fw_error);
 			xe_survivability_mode_runtime_enable(xe);
 			return XE_RAS_RECOVERY_ACTION_DISCONNECT;
 		}
@@ -368,9 +366,9 @@ static u8 handle_soc_internal_errors(struct xe_device *xe, struct xe_ras_error_a
 		struct xe_ras_ieh_error *ieh_error = (void *)info->details;
 
 		if (ieh_error->global_error_status & XE_RAS_SOC_IEH_PUNIT) {
-			xe_err(xe, "[RAS]: PUNIT %s detected: 0x%x\n",
-			       sev_to_str(counter->common.severity),
-			       ieh_error->global_error_status);
+			xe_log_comp_fatal(xe, SOC_INTERNAL, &arr->counter, sizeof(arr->counter),
+					  "PUNIT error detected: 0x%x\n",
+					   ieh_error->global_error_status);
 			punit_error_handler(xe);
 			return XE_RAS_RECOVERY_ACTION_DISCONNECT;
 		}
-- 
2.54.0

