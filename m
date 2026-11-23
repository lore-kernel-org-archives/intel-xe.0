Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD90606A31E
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 07:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PS80ZpXW
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 818B010E652;
	Mon, 23 Nov 2026 07:02:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B685F10E2E5
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Nov 2026 07:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795417353; x=1826953353;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8DJqF2aGcHY9QUYsebInxB9NywoDe6zmGpxxkchcQyc=;
 b=PS80ZpXWhwsjkHy11mpu32A9KHYSQ7lCUgCAmPVFvHSt5SJqCTRuBd3q
 haCvB2CH7lrI4XORobOYtw9Fh77mhDq0lZR5lFsM3/oegK/ZL/yh81+Rd
 fXrSa73AFs5ZvXOoQG9ACCT1zsxkVmKzAcVc4ADgUtd8HyGnEk8SYntGi
 SeF2kHZqvQSBI1NDJZOwqB0f18k2CT+XTKFJVf7FgXiasHatmPAk4vLAP
 PTw8gbFQGBeKxgOLrhwMQbzt1pBtneWy2WwmFmZRVdIYPlkJJBZHtZyp5
 ygZjS4K+OztbprvbTWcxvgFuK6OtbvegSn/oUGw6FcghnkhEHw3QYRVWA A==;
X-CSE-ConnectionGUID: 2/ynSo5JQeeVljef9kUKdQ==
X-CSE-MsgGUID: pD5xtOchQkmR00dEbzRhRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4062748"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4062748"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2026 23:02:32 -0800
X-CSE-ConnectionGUID: 55DJoPGzSsykEF7HC92WsQ==
X-CSE-MsgGUID: /UU1TKN/TjGIeZIo5UZTzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="11101470"
Received: from psoham-ms-7e03.iind.intel.com ([10.223.55.64])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2026 23:02:30 -0800
From: Soham Purkait <soham.purkait@intel.com>
To: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 anshuman.gupta@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, raag.jadav@intel.com, rodrigo.vivi@intel.com
Cc: soham.purkait@intel.com
Subject: [PATCH] drm/xe/ras: Handle SPI out of flash error
Date: Mon, 23 Nov 2026 12:32:22 +0530
Message-ID: <20261123070221.1611306-2-soham.purkait@intel.com>
X-Mailer: git-send-email 2.43.0
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

Wedge the device with an unknown recovery method if Page-Offline returns
OUT_OF_RESOURCES, or if the offline list is full at probe.

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
---
 drivers/gpu/drm/xe/xe_ras.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 0fb891d00b36..76441858391d 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -80,6 +80,7 @@ enum xe_ras_response_status {
 	XE_RAS_STATUS_TIMEOUT,
 	XE_RAS_STATUS_HARDWARE_FAILURE,
 	XE_RAS_STATUS_INSUFFICIENT_RESOURCES,
+	XE_RAS_STATUS_OUT_OF_RESOURCES = 0x9,
 	XE_RAS_STATUS_MAX
 };
 
@@ -226,6 +227,7 @@ static int ras_status_to_errno(u32 status)
 	case XE_RAS_STATUS_HARDWARE_FAILURE:
 		return -EIO;
 	case XE_RAS_STATUS_INSUFFICIENT_RESOURCES:
+	case XE_RAS_STATUS_OUT_OF_RESOURCES:
 		return -ENOSPC;
 	default:
 		return -EPROTO;
@@ -299,6 +301,11 @@ static int send_page_offline_cmd(struct xe_device *xe, u64 page_address,
 	if (ret) {
 		xe_log_err(xe, SYSCTRL, ret, "page offline command failed with status %u\n",
 			   response.status);
+		if (response.status == XE_RAS_STATUS_OUT_OF_RESOURCES) {
+			xe_log_err(xe, SYSCTRL, ret,
+				   "No space left in SPI flash for bad pages, manual intervention required\n");
+			xe_wedge_declare(xe, 0);
+		}
 		return ret;
 	}
 
@@ -504,8 +511,17 @@ static void get_offline_list(struct xe_device *xe)
 	struct xe_ras_offline_list_response response = {0};
 	struct xe_ras_offline_list_request request = {0};
 
+	struct xe_ras_state *state = &xe->ras.state;
+
 	process_offline_pages(xe, XE_SYSCTRL_CMD_GET_OFFLINE_LIST, &request, sizeof(request),
 			      &response, sizeof(response), &response.common, false);
+
+	if (state->max_pages && response.common.total_pages >= state->max_pages) {
+		xe_log_err(xe, SYSCTRL, -ENOSPC,
+			   "Offline list full (%u/%u), manual intervention required\n",
+			   response.common.total_pages, state->max_pages);
+		xe_wedge_declare(xe, 0);
+	}
 }
 
 static void ras_usp_aer_init(struct xe_device *xe)
-- 
2.43.0

