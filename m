Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DAFEC61DBE
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 14:11:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 656F110EA71;
	Tue, 25 Aug 2026 14:11:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aCt8W0Sg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51DB410EA71
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Aug 2026 14:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787667087; x=1819203087;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GpiYIMWe8skGycHt6HvzRFB+YlQH1pDc0t6K/VdpnsI=;
 b=aCt8W0Sg6yKb07tw8GsK3I+1PCV0XzIKgM0ejHmdd4HU6/845Mk59bJC
 GiiPAtu9vaC5MBNIKwlLAuTOesW8h9oR/AIjt4mEYN25s7ByItc1ioNTj
 2bcQOt5BrWd7MXJMG/4gCu5QhCQdGOBq2Rq206Dtr+5+YV6s/Fa2UqTSj
 QhCZ+ccFdzmzWjwhTL1M8ZWl13x/ZFfNx41WgKcdKOZexn1VS4k+vDuSF
 chJMJv5asl/ILKUgxFcHxJwpfCQNq/vr35C3kxKvL/rpNvKVkfQ9Iia9Y
 nl79UOlsudB/UpJUeSKIthMMjs+lS0l+ftbFegBbkZn0JfaHV0ALPRxKg Q==;
X-CSE-ConnectionGUID: x0puwDdiQ1OgxkEwwG70rw==
X-CSE-MsgGUID: gy0wkuueSs+XWjn5TGupjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="90648430"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="90648430"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 07:11:27 -0700
X-CSE-ConnectionGUID: D5zu7CQKTw2I8exkmyr3HQ==
X-CSE-MsgGUID: ZXReacpMTf2fS4LV/j2KKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="265996111"
Received: from unknown (HELO rtauro-desk.iind.intel.com) ([10.190.238.50])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 07:11:25 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: [PATCH 1/2] drm/xe/xe_ras: Add Fabric error handling
Date: Tue, 25 Aug 2026 19:41:11 +0530
Message-ID: <20260825141109.3797483-5-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260825141109.3797483-4-riana.tauro@intel.com>
References: <20260825141109.3797483-4-riana.tauro@intel.com>
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

SAF MHB errors are collected and classifed under Fabric error component
by System controller. For SAF_MHB errors, if the cause is data
payload parity error then log and return.

For all other errors and causes, request a Secondary Bus Reset (SBR)

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_ras.c       | 20 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras_types.h |  4 ++++
 2 files changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index d25d25f77531..586dc28a638a 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -394,6 +394,23 @@ static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_
 	return XE_RAS_RECOVERY_ACTION_RECOVERED;
 }
 
+static u8 handle_fabric_errors(struct xe_device *xe, struct xe_ras_error_array *arr)
+{
+	struct xe_ras_error_product *product = &arr->counter.product;
+	struct xe_ras_ieh_error *info = (void *)arr->details;
+
+	if ((info->global_error_status & XE_RAS_FAB_IEH_SAF_MHB) &&
+	    product->cause.cause == XE_RAS_FAB_CAUSE_PAYLOAD) {
+		xe_log_comp_recoverable(xe, FABRIC, &arr->counter, sizeof(arr->counter),
+					"SAF MHB error detected\n");
+		return XE_RAS_RECOVERY_ACTION_RECOVERED;
+	}
+
+	xe_log_comp_fatal(xe, FABRIC, &arr->counter, sizeof(arr->counter),
+			  "Other errors detected\n");
+	return XE_RAS_RECOVERY_ACTION_RESET;
+}
+
 void xe_ras_counter_threshold_crossed(struct xe_device *xe,
 				      struct xe_sysctrl_event_response *response)
 {
@@ -555,6 +572,9 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
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
index 99b2466e2062..73517fd0d415 100644
--- a/drivers/gpu/drm/xe/xe_ras_types.h
+++ b/drivers/gpu/drm/xe/xe_ras_types.h
@@ -12,6 +12,10 @@
 #define XE_RAS_NUM_ERROR_ARR			3
 /* Error bits in IEH global error status register */
 #define XE_RAS_SOC_IEH_PUNIT			BIT(1)
+/* Bits 16-31 represent individual SAF MHB unit */
+#define XE_RAS_FAB_IEH_SAF_MHB			GENMASK(31, 16)
+/* Fabric Data payload parity errors */
+#define XE_RAS_FAB_CAUSE_PAYLOAD		BIT(2)
 /* Device memory error categories */
 #define XE_RAS_MEMORY_DB_ECC			BIT(1)
 #define XE_RAS_MEMORY_POISON			BIT(2)
-- 
2.47.1

