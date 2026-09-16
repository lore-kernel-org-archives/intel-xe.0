Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2BEAC88E5C
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 05:28:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9887410E296;
	Wed, 16 Sep 2026 05:28:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e7TW9Nfh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C875510E37A
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Sep 2026 05:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789536536; x=1821072536;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dV5mscHKjg5vCX27KFzT7LK5opmLgEiPXFGlQidlrF4=;
 b=e7TW9NfhrdbPExb4OiRZJMPb4XSHaQe3r+HF4Dx0DMg2y3VX7es8pz3y
 4BP+cFQZT+fgOLlhiR0v52HGn84Lf6kQTLtBvseMxqdkqBGWRG0guWqhY
 Hjb7we/yCaHHZ4BaeKpwjHBs45ws8rZBBUMwCLu+pMIO5lWleXVi4aF5S
 hCtW463NYedHzevln5W4PIiQLJU7x18aU33yU4kyV5vq9aYWeTJUuC6Pp
 sJ5R3Ozujl2NBCgCt7+3Jez/zgUW9qwsqj/DVfqbsiDZ8gldPmRlBSwyS
 j4QuCD678+FFLpYDz5GEmj5SrC7ZqZUWmcWajwE9IDwVg7Rr0u1UaCUNw A==;
X-CSE-ConnectionGUID: JScYq3BeRRKIsUhz5nB6Zg==
X-CSE-MsgGUID: 0zre/rD5RJCepnIXNWJllg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="77469958"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="77469958"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 22:28:56 -0700
X-CSE-ConnectionGUID: DgWaoAzgSTmGSrtLcV4IBQ==
X-CSE-MsgGUID: HnhjzPNLSgeXl6pnyBvXmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="275190118"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 22:28:53 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com
Subject: [PATCH v2 1/2] drm/xe/xe_ras: Add support for handling Fabric errors
Date: Wed, 16 Sep 2026 10:58:38 +0530
Message-ID: <20260916052836.2953509-5-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260916052836.2953509-4-riana.tauro@intel.com>
References: <20260916052836.2953509-4-riana.tauro@intel.com>
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

Add support for handling fabric errors. For System Agent Fabric errors
caused by data payload parity, log the error and return. For all other
errors or causes, request a Seconday Bus Reset(SBR).

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
v2: add mapping to cper severity (Badal, Rodrigo)
    add abbreviations
    add new line in header (Raag)
---
 drivers/gpu/drm/xe/xe_ras.c       | 35 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras_types.h |  6 ++++++
 2 files changed, 41 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 7a85735c57d5..c1939fd71f2d 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -185,6 +185,20 @@ static int ras_status_to_errno(u32 status)
 	}
 }
 
+static u8 ras_sev_to_cper_sev(u8 sev)
+{
+	switch (sev) {
+	case XE_RAS_SEV_CORRECTABLE:
+		return CPER_SEV_CORRECTED;
+	case XE_RAS_SEV_UNCORRECTABLE:
+		return CPER_SEV_RECOVERABLE;
+	case XE_RAS_SEV_INFORMATIONAL:
+		return CPER_SEV_INFORMATIONAL;
+	default:
+		return CPER_SEV_RECOVERABLE;
+	}
+}
+
 static inline const char *sev_to_str(u8 severity)
 {
 	if (severity >= XE_RAS_SEV_MAX)
@@ -395,6 +409,24 @@ static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_
 	return XE_RAS_RECOVERY_ACTION_RECOVERED;
 }
 
+static u8 handle_fabric_errors(struct xe_device *xe, struct xe_ras_error_array *arr)
+{
+	struct xe_ras_error_product *product = &arr->counter.product;
+	struct xe_ras_ieh_error *info = (void *)arr->details;
+	u8 severity = arr->counter.common.severity;
+
+	if ((info->global_error_status & XE_RAS_FAB_IEH_SAF_MHB) &&
+	    product->cause.cause == XE_RAS_FAB_CAUSE_PAYLOAD) {
+		xe_log_comp(xe, ras_sev_to_cper_sev(severity), FABRIC, &arr->counter,
+			    sizeof(arr->counter), "SAF MHB error detected\n");
+		return XE_RAS_RECOVERY_ACTION_RECOVERED;
+	}
+
+	xe_log_comp(xe, ras_sev_to_cper_sev(severity), FABRIC, &arr->counter,
+		    sizeof(arr->counter), "Errors detected\n");
+	return XE_RAS_RECOVERY_ACTION_RESET;
+}
+
 void xe_ras_counter_threshold_crossed(struct xe_device *xe,
 				      struct xe_sysctrl_event_response *response)
 {
@@ -556,6 +588,9 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
 			case XE_RAS_COMP_DEVICE_MEMORY:
 				action = handle_device_memory_errors(xe, arr);
 				break;
+			case XE_RAS_COMP_FABRIC:
+				action = handle_fabric_errors(xe, arr);
+				break;
 			default:
 				/* For any other component, reset */
 				action = XE_RAS_RECOVERY_ACTION_RESET;
diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
index fe6f3658a2a4..4a8cd6fc5ba2 100644
--- a/drivers/gpu/drm/xe/xe_ras_types.h
+++ b/drivers/gpu/drm/xe/xe_ras_types.h
@@ -12,6 +12,12 @@
 #define XE_RAS_NUM_ERROR_ARR			3
 /* Error bits in IEH global error status register */
 #define XE_RAS_SOC_IEH_PUNIT			BIT(1)
+/* Bits 16-31 represent individual SAF MHB unit */
+#define XE_RAS_FAB_IEH_SAF_MHB			GENMASK(31, 16)
+
+/* Fabric Data payload parity errors */
+#define XE_RAS_FAB_CAUSE_PAYLOAD		BIT(2)
+
 /* Device memory error categories */
 #define XE_RAS_MEMORY_DB_ECC			BIT(1)
 #define XE_RAS_MEMORY_POISON			BIT(2)
-- 
2.47.1

