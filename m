Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41DDFC61DBC
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 17:42:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F303810EB2D;
	Tue, 25 Aug 2026 17:42:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QY6aD+Rz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9938E10EB2C
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Aug 2026 17:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787679770; x=1819215770;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=veKdcVouXxzvgLpqWWGSC4BM9rMjrYIg8py4rFjk2q4=;
 b=QY6aD+RzcU+pQsOhGO6gmrFLRNgGljIrvc5/b685HJJFtQVJ8ewjIDY8
 khD5X0B40KkeRkfqBy0+jn9OL3cTVl221uJ3OUkupopfg9AG5SBHpqVuY
 NqjllDZXm0HLKcRTggpFrH6437in3BonkpvbxBLIwxI3AHBBs5b+JJk5B
 Vqk1q3J5LnPAiTxeAI6hsSer8Vw/cb+v5M31ticWIr+wp+iJu5ihljKdw
 va00zF0UlEWRr/VGi9yznNWDsaGkwjfDSHUwjuxVT5+15guOO4dJ6cUtk
 gJUJuTB7DDN2HYFlXrWP1jINDi5NSq4R75bD9EJi+wj9y1P79bKNV3gZ4 Q==;
X-CSE-ConnectionGUID: Lr1z4v/PQPKJ8Hx3bscfpA==
X-CSE-MsgGUID: r4CxgMxpRleP9PpVoUXU1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="88210815"
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; d="scan'208";a="88210815"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 10:42:50 -0700
X-CSE-ConnectionGUID: RxGo34rbSzGmpQbF0Z+9cw==
X-CSE-MsgGUID: hJsvIHHnTKqDGQznzFE5dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; d="scan'208";a="272585110"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 10:42:47 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, michal.wajdeczko@intel.com,
 himal.prasad.ghimiray@intel.com, arvind.yadav@intel.com
Subject: [PATCH v2 06/11] drm/xe/cper: Log CPER records for aggregate counter
 retrival
Date: Tue, 25 Aug 2026 23:29:23 +0530
Message-ID: <20260825175916.1103841-19-badal.nilawar@intel.com>
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

Log CPER records for aggregate counter retrieval from userspace.

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_ras.c | 92 +++++++++++++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 27c78800b5d2..ff9d917b8e29 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -204,6 +204,34 @@ static inline const char *comp_to_str(u8 component)
 	return xe_ras_components[component];
 }
 
+static u32 ras_comp_to_hw_sigid(u8 component)
+{
+	switch (component) {
+	case XE_RAS_COMP_DEVICE_MEMORY:
+		return XE_SIGID_DEVICE_MEMORY;
+	case XE_RAS_COMP_CORE_COMPUTE:
+		return XE_SIGID_CORE_COMPUTE;
+	case XE_RAS_COMP_PCIE:
+		return XE_SIGID_PCIE;
+	case XE_RAS_COMP_FABRIC:
+		return XE_SIGID_FABRIC;
+	case XE_RAS_COMP_SOC_INTERNAL:
+		return XE_SIGID_SOC_INTERNAL;
+	default:
+		return U32_MAX;
+	}
+}
+
+static u8 ras_sev_to_cper_sev(u8 ras_sev)
+{
+	switch (ras_sev) {
+	case XE_RAS_SEV_CORRECTABLE:   return CPER_SEV_CORRECTED;     /* 2 */
+	case XE_RAS_SEV_UNCORRECTABLE: return CPER_SEV_RECOVERABLE;   /* 0 */
+	case XE_RAS_SEV_INFORMATIONAL: return CPER_SEV_INFORMATIONAL; /* 3 */
+	default:                       return CPER_SEV_RECOVERABLE;
+	}
+}
+
 static bool ras_counter_is_valid(struct xe_device *xe, struct xe_ras_error_class *counter)
 {
 	u8 severity = counter->common.severity;
@@ -749,6 +777,66 @@ prepare_cper_error_info(struct xe_device *xe,
 	return einfo_arr;
 }
 
+static void emit_hw_error_cper(struct xe_device *xe,
+			       struct xe_ras_error_class *error_class,
+			       struct xe_ras_get_counter_response *resp,
+			       u32 sig_id, u8 severity)
+{
+	struct xe_ras_get_counter_response local_resp = {};
+	struct xe_ras_get_counter_response *counter_response = resp;
+	struct xe_cper_sec_intel_err_hdr ihdr = {};
+	struct xe_cper_einfo_entry *einfo_arr = NULL;
+	u32 einfo_count = 0;
+	u32 i;
+
+	if (!counter_response) {
+		counter_response = &local_resp;
+		if (get_counter(xe, error_class, counter_response)) {
+			xe_err(xe, "[RAS]: CPER: failed to get counter, skipping record\n");
+			return;
+		}
+	}
+
+	if (counter_response->has_info_queue) {
+		einfo_arr = prepare_cper_error_info(xe, counter_response,
+						    error_class, &einfo_count);
+		if (!einfo_arr)
+			xe_err(xe, "[RAS]: CPER: failed to build einfo from info queue\n");
+	}
+
+	if (einfo_count > 0) {
+		for (i = 0; i < einfo_count; i++) {
+			struct xe_cper_sec_intel_err_hdr entry_ihdr = {};
+
+			xe_cper_init_intel_err_hdr(xe,
+						   (const u8 *)&einfo_arr[i].hdr.error_class,
+						   einfo_arr[i].timestamp,
+						   sig_id,
+						   einfo_arr[i].hdr.counter,
+						   &entry_ihdr);
+
+			xe_cper_record_emit(xe, severity, &INTEL_CPER_NOTIFY_GPU_ERROR,
+					    &entry_ihdr, einfo_arr[i].einfo,
+					    einfo_arr[i].einfo_size);
+		}
+	} else {
+		xe_cper_init_intel_err_hdr(xe,
+					   (const u8 *)error_class,
+					   counter_response->timestamp,
+					   sig_id,
+					   counter_response->value,
+					   &ihdr);
+		xe_cper_record_emit(xe, severity, &INTEL_CPER_NOTIFY_GPU_ERROR,
+				    &ihdr, NULL, 0);
+	}
+
+	if (einfo_arr) {
+		for (i = 0; i < einfo_count; i++)
+			kfree(einfo_arr[i].einfo);
+		kfree(einfo_arr);
+	}
+}
+
 /**
  * xe_ras_process_errors() - Process and contain hardware errors
  * @xe: xe device instance
@@ -886,6 +974,10 @@ int xe_ras_get_counter(struct xe_device *xe, u8 severity, u8 component, u32 *val
 		return ret;
 
 	*value = response.value;
+
+	emit_hw_error_cper(xe, &counter, &response,
+			   ras_comp_to_hw_sigid(counter.common.component),
+			   ras_sev_to_cper_sev(counter.common.severity));
 	return 0;
 }
 
-- 
2.54.0

