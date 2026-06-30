Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59548C44501
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jun 2026 13:27:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1837510E9FC;
	Tue, 30 Jun 2026 13:27:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G4VrTBZ7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E6AC10E1D9
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jun 2026 13:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782826008; x=1814362008;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=U89XTGJJasmhadZC23nsR9jCFIgM3q7iTD0vCpJsces=;
 b=G4VrTBZ7i9fbwVq2FU6lp3nnVJALdxN+d0y1/CkDblMhCEX4GNAMreHs
 fqv2oqLKBwD5ZPCtsokeEaEZ4ZuhK+WFvlB7zQBEuKjYHTkeRhQLh3lyl
 h/bs+qcYElxiVISGouMxROKURK1XFqFfy3awHIRWUToODPDQUcxRp9Cai
 GtqAMLgp8SL84Z3ghGHQUlUKbmBpMqQvlGoYyulWI7RLZRRHRmGBoBfn/
 F240cZVsXAKzgXHv6nMH9zIcsUXRipDfnFkLzj7TZSYoKt5iCk6OOc4wi
 uANvKg7ui8EzprRFVCaY1PqeHzXSMUPlcTzQyMc1ExrSXth8RkmSPMGDO w==;
X-CSE-ConnectionGUID: MGvmELmDSvGPwxooHanOEA==
X-CSE-MsgGUID: S77drjRFT1K2VPUkfuBYng==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="83623514"
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; d="scan'208";a="83623514"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2026 06:26:48 -0700
X-CSE-ConnectionGUID: 21uRgut7TXa5063/Ici8JQ==
X-CSE-MsgGUID: 4/Nsb8MiScufWWm6bJ9uyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; d="scan'208";a="256182204"
Received: from smoudgil-mobl1.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.117.247])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2026 06:26:48 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 04/13] drm/xe/guc: Add string KLV encoding helper
Date: Tue, 30 Jun 2026 15:26:23 +0200
Message-ID: <20260630132633.32804-5-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630132633.32804-1-michal.wajdeczko@intel.com>
References: <20260630132633.32804-1-michal.wajdeczko@intel.com>
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

We also plan to encode a text data as KLV. Add helper for that too.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_klv_helpers.c | 31 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_klv_helpers.h |  1 +
 2 files changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
index e84d1f5f5c56..a5fcfc4a6c37 100644
--- a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
+++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
@@ -188,6 +188,11 @@ int xe_guc_klv_count(const u32 *klvs, u32 num_dwords)
 	return num_dwords ? -ENODATA : num_klvs;
 }
 
+static size_t to_num_bytes(u16 dwords)
+{
+	return dwords * sizeof(u32);
+}
+
 static u16 to_num_dwords(size_t size)
 {
 	return round_up(size, sizeof(u32)) / sizeof(u32);
@@ -243,3 +248,29 @@ u32 *xe_guc_klv_encode_u64(u32 *klvs, u32 avail, u16 key, u64 value)
 	*klvs++ = upper_32_bits(value);
 	return klvs;
 }
+
+/**
+ * xe_guc_klv_encode_string() - Encode string as KLV.
+ * @klvs: the buffer where to place KLV
+ * @avail: number of dwords (u32) available in the buffer
+ * @key: key to be used
+ * @s: string to be encoded
+ *
+ * Return: pointer to the buffer location past the encoded KLV or
+ *         an ERR_PTR if there was no space to encode the KLV.
+ */
+u32 *xe_guc_klv_encode_string(u32 *klvs, u32 avail, u16 key, const char *s)
+{
+	size_t size = strnlen(s, FIELD_MAX(GUC_KLV_0_LEN) - 1) + 1; /* \0 */
+	u16 len = to_num_dwords(size);
+
+	if (IS_ERR(klvs))
+		return klvs;
+
+	if (avail < GUC_KLV_LEN_MIN + len)
+		return ERR_PTR(-ENOSPC);
+
+	*klvs++ = PREP_GUC_KLV(key, len);
+	strscpy_pad((void *)klvs, s, to_num_bytes(len));
+	return klvs + len;
+}
diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.h b/drivers/gpu/drm/xe/xe_guc_klv_helpers.h
index 713ef7f7b9f2..1c576456efc5 100644
--- a/drivers/gpu/drm/xe/xe_guc_klv_helpers.h
+++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.h
@@ -19,6 +19,7 @@ int xe_guc_klv_count(const u32 *klvs, u32 num_dwords);
 
 u32 *xe_guc_klv_encode_u32(u32 *klvs, u32 avail, u16 key, u32 value);
 u32 *xe_guc_klv_encode_u64(u32 *klvs, u32 avail, u16 key, u64 value);
+u32 *xe_guc_klv_encode_string(u32 *klvs, u32 avail, u16 key, const char *s);
 
 /**
  * PREP_GUC_KLV - Prepare KLV header value based on provided key and len.
-- 
2.47.1

