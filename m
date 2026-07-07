Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E78CC44501
	for <intel-xe@archiver.kernel.org>; Tue,  7 Jul 2026 22:08:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C690C10EF29;
	Tue,  7 Jul 2026 22:08:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kp2y/AUn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B27010E512
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Jul 2026 22:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783462114; x=1814998114;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ONE3g2kuxNBzaYLDLMBP48pN3+bdpfXWEuPLeX6IR6s=;
 b=Kp2y/AUn8ULC6fmQjFVyblezl0DG7MKehdzxeusEdgyVwfBBv9szGLIF
 2eTi7UOpsxMopoe5RRv/C9m5ltGzQTpSVfLvUJSnwbeNWLDFflF3EnpKy
 soxgPNQcDcC+/arK/Ivd/hqO2Xzsc0oNvi68wY64NT/UY9aQ8+3ssNKUS
 67ydxEzGLX+NaJNR2zpLnujzYasMKeFB3C2KczBBkP9/Poe5D0hYrxp9u
 BRVXdtLEIBv0qcQOjKrNSAiopwc4/xvotrWoddkKk/pnOwP7JN+aRJ0Pd
 FdFp36kpRV6weNMMmAtUoE5V8PJ6+k/n47RRiGcE/PDubVBqBowidOWYX w==;
X-CSE-ConnectionGUID: UV7eZSMzTCiX1fVa6/iBeA==
X-CSE-MsgGUID: hZAe/aslROet2bd9LPLTFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="84176534"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="84176534"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 15:08:34 -0700
X-CSE-ConnectionGUID: sdouqX1iRIOGrkWMAx3EcQ==
X-CSE-MsgGUID: 0Pv3ZU47TRWZ3O2WGr3+6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="278487667"
Received: from ssharm2x-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.34.19])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 15:08:33 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Subject: [PATCH v2 06/13] drm/xe/guc: Add KLV parsing helper
Date: Wed,  8 Jul 2026 00:08:08 +0200
Message-ID: <20260707220816.677-7-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707220816.677-1-michal.wajdeczko@intel.com>
References: <20260707220816.677-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

We have already introduced a helper to encode larger objects. Now
add helper to parse the KLVs buffer. We will use it shortly.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_klv_helpers.c | 38 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_klv_helpers.h |  3 ++
 2 files changed, 41 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
index 5ad51a8ff0de..723fc6894c37 100644
--- a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
+++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
@@ -317,3 +317,41 @@ u32 *xe_guc_klv_encode_object(u32 *klvs, u32 avail, u16 key, const void *obj,
 	*klvs = PREP_GUC_KLV(key, end - (klvs + GUC_KLV_LEN_MIN));
 	return end;
 }
+
+/**
+ * xe_guc_klv_parser() - Parse and decode stream of KLVs.
+ * @klvs: the buffer with KLVs
+ * @num_dwords: number of dwords (u32) available in the buffer
+ * @obj: opaque pointer to be used by the @decoder function
+ * @decoder: pointer to the decoder function
+ *
+ * Return: The sum of all results returned by the decoder or
+ *         an -errno on decoder or buffer failure.
+ */
+int xe_guc_klv_parser(const u32 *klvs, u32 num_dwords, void *obj,
+		      int (*decoder)(void *obj, u16 key, u16 len, const u32 *value))
+{
+	int total = 0;
+	int ret;
+
+	while (num_dwords >= GUC_KLV_LEN_MIN) {
+		u16 key = FIELD_GET(GUC_KLV_0_KEY, klvs[0]);
+		u16 len = FIELD_GET(GUC_KLV_0_LEN, klvs[0]);
+
+		klvs += GUC_KLV_LEN_MIN;
+		num_dwords -= GUC_KLV_LEN_MIN;
+
+		if (num_dwords < len)
+			return -ENODATA;
+
+		ret = decoder(obj, key, len, klvs);
+		if (ret < 0)
+			return ret;
+		total += ret;
+
+		klvs += len;
+		num_dwords -= len;
+	}
+
+	return total;
+}
diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.h b/drivers/gpu/drm/xe/xe_guc_klv_helpers.h
index 855805f4463d..cf3b29adc9d6 100644
--- a/drivers/gpu/drm/xe/xe_guc_klv_helpers.h
+++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.h
@@ -23,6 +23,9 @@ u32 *xe_guc_klv_encode_string(u32 *klvs, u32 avail, u16 key, const char *s);
 u32 *xe_guc_klv_encode_object(u32 *klvs, u32 avail, u16 key, const void *obj,
 			      u32 *(*encoder)(u32 *klvs, u32 avail, const void *obj));
 
+int xe_guc_klv_parser(const u32 *klvs, u32 num_dwords, void *obj,
+		      int (*decoder)(void *obj, u16 key, u16 len, const u32 *value));
+
 /**
  * PREP_GUC_KLV - Prepare KLV header value based on provided key and len.
  * @key: KLV key
-- 
2.47.1

