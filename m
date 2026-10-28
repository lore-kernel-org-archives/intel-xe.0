Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81667606A31A
	for <intel-xe@archiver.kernel.org>; Wed, 28 Oct 2026 09:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RAnFC5pv
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EA1A10E621;
	Wed, 28 Oct 2026 09:58:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E4ED10E5DF
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Oct 2026 09:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793181473; x=1824717473;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Luz3JIby2sWCYiMrOz/DEFD+CD4zMjSLBcGrXb8qoCA=;
 b=RAnFC5pvu9sW+LT/uW7JL0uoV2K1btCFRGMQw9iCgXH1cFew8WCKhmA6
 7HNQtcA21/iJWU0mLSORlm7eC3G6Dx+dwqPuMfoA3g4n5Vok96b9+1x0i
 xiwLiBC3Ra/rcLsGnKFTlMhn0KDkYLotMJwcO9c5SPE5mP1YOTzdGPMoX
 BLYKg2onqsWqfqJUZyKcX4kZfZuV5UIwKx1bS8Dq5LwnQiVIsee3tEVhe
 XWyiEbDe1A6ddQaYx487CIDctHa2/jc6TKuInYf6ARQSA0vSz+8K1n12s
 px0WTZSnvi9rqNIh/DO80uKheIp/1gEsQddX8KDiSg7BDDQ65GoCZ4cJl w==;
X-CSE-ConnectionGUID: X/A8rbanRTuRcJhcg5pIzQ==
X-CSE-MsgGUID: bHKlfW2IQ4aTyotZMm445A==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1913983"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1913983"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 02:57:53 -0700
X-CSE-ConnectionGUID: DJYzJ1CgSNecttmOhLevHg==
X-CSE-MsgGUID: tf5X1xehRvSb27Zd4LBt3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4782771"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 02:57:50 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, himal.prasad.ghimiray@intel.com,
 arvind.yadav@intel.com, syed.abdul.muqthyar.ahmed@intel.com,
 nitin.r.gote@intel.com
Subject: [PATCH v6 07/10] drm/xe/xe_ras: Report device memory errors using
 SIGID
Date: Wed, 28 Oct 2026 15:27:31 +0530
Message-ID: <20261028095723.734387-19-badal.nilawar@intel.com>
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

Use xe_log_comp_info helper to report device memory errors using the
corresponding SIGID.

Example:
	xe 0000:03:00.0: [drm] SIGID=202 (020100020008002000300000)
DEVICE_MEMORY: Double-bit ECC error at sw address 0x63000

Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>
---
v6:
  - Consolidate double-bit ECC logs into a single log; informational if the
    page was offlined, error otherwise (Raag)
v5:
  - Log unknown memory errors
  - Add example log in commit message (Raag)
---
 drivers/gpu/drm/xe/xe_ras.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 6664153b3cae..8ed3c4d5b580 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -644,6 +644,7 @@ static u8 handle_soc_internal_errors(struct xe_device *xe, struct xe_ras_error_a
 static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_array *arr)
 {
 	struct xe_ras_memory_error *info = (void *)arr->details;
+	u8 cper_sev = ras_sev_to_cper_sev(arr->counter.common.severity);
 	int ret;
 
 	/*
@@ -655,17 +656,25 @@ static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_
 	 */
 	switch (info->category) {
 	case XE_RAS_MEMORY_POISON:
-		xe_info(xe, "[RAS]: Poison error detected\n");
+		xe_log_comp_info(xe, DEVICE_MEMORY, &arr->counter, sizeof(arr->counter),
+				 "Poison error detected\n");
 		break;
 	case XE_RAS_MEMORY_DATA_PARITY:
-		xe_info(xe, "[RAS]: Data parity error detected\n");
+		xe_log_comp_info(xe, DEVICE_MEMORY, &arr->counter, sizeof(arr->counter),
+				 "Data parity error detected\n");
 		break;
 	case XE_RAS_MEMORY_DB_ECC:
 		ret = handle_page_offline(xe, info->sw_address, true);
+		xe_log_comp(xe, ret ? cper_sev : CPER_SEV_INFORMATIONAL,
+			    DEVICE_MEMORY, &arr->counter, sizeof(arr->counter),
+			    "Double-bit ECC error detected at sw address 0x%llx\n",
+			    info->sw_address);
 		if (ret)
 			return XE_RAS_RECOVERY_ACTION_RESET;
 		break;
 	default:
+		xe_log_comp(xe, cper_sev, DEVICE_MEMORY, &arr->counter, sizeof(arr->counter),
+			    "Unknown error detected\n");
 		return XE_RAS_RECOVERY_ACTION_RESET;
 	}
 
-- 
2.56.0

