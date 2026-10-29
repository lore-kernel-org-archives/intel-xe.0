Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11825606A31F
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 11:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KIGjEjjd
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0F51112237;
	Thu, 29 Oct 2026 11:37:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54D9611223E
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Oct 2026 11:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793273850; x=1824809850;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HHYIaUQLOAbLHXhBBvP9GEVO3B5nEDj15RPmdkLQyhI=;
 b=KIGjEjjdxfjecuU1LlXqDJ1GtxKomJPLc+4haw5FmWMRi33w4mH8L3Pv
 fKCej8nthNPZ1BBorbCYi+Byb+CMbVxQpm/UvCytFvRujbRUo5ht31UCA
 ZKUdF3AonSCy+GdKoODj37pfKm5uKcADlxg6dOvoFuNE0teriznScra2y
 SrWBLi8tWWl2Pke7HHxZm4dGeLQ3o25yB4Z7z9yiZpMuJHz7qN8YG3dK3
 9GbRsZeZ2qi30ZG+u5h/lDrsuP9GCQ9OByNVQl7lA8kisZsW5+Ea5HTPP
 ewztkccRzdG4+hQ4fqGe+ZJ5RTnRX3RVNTpHyys0V93fgc+w2j1VygMrq g==;
X-CSE-ConnectionGUID: A2husM6FQESRSjL/28nAQA==
X-CSE-MsgGUID: IUS8WHILReSt39ggnEeT5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="2026505"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="2026505"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 04:37:30 -0700
X-CSE-ConnectionGUID: kDZ/Kph2Q1uxxIvf4iUx2A==
X-CSE-MsgGUID: rnvv+GTZST2XWmKL9EV6ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5659167"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 04:37:27 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, himal.prasad.ghimiray@intel.com,
 arvind.yadav@intel.com, syed.abdul.muqthyar.ahmed@intel.com,
 nitin.r.gote@intel.com, matthew.d.roper@intel.com
Subject: [PATCH v8 08/10] drm/xe/xe_ras: Report core compute errors using SIGID
Date: Thu, 29 Oct 2026 17:07:02 +0530
Message-ID: <20261029113653.1860286-20-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261029113653.1860286-12-badal.nilawar@intel.com>
References: <20261029113653.1860286-12-badal.nilawar@intel.com>
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

Use xe_log_* helpers to report core compute errors.

Example:
	xe 0000:03:00.0: [drm] *ERROR* SIGID=203 (02020012000a000200000800)
[Hardware Error]: CORE_COMPUTE: Uncorrectable error detected, type 2

Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Reviewed-by: Raag Jadav <raag.jadav@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_ras.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 03826e9900df..685b491e6b27 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -578,13 +578,17 @@ static void ras_send_error_event(struct xe_device *xe, u8 severity, u8 component
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
@@ -861,7 +865,7 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
 
 			switch (component) {
 			case XE_RAS_COMP_CORE_COMPUTE:
-				action = handle_core_compute_errors(arr);
+				action = handle_core_compute_errors(xe, arr);
 				break;
 			case XE_RAS_COMP_SOC_INTERNAL:
 				action = handle_soc_internal_errors(xe, arr);
-- 
2.56.0

