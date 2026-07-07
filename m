Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B23E2C43458
	for <intel-xe@archiver.kernel.org>; Tue,  7 Jul 2026 22:08:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48A0E10EF19;
	Tue,  7 Jul 2026 22:08:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HshVcBDb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8C2910EF00
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Jul 2026 22:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783462112; x=1814998112;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fByNxMiduCAZtx4wCgjD56+Gd58mDc9xbM23+mNnkIE=;
 b=HshVcBDbNZifPI0OdH4AjbRhFqT88ax/MRbPzye2DldW5igjZlymigkv
 uU1IleomPMzAhgGdSNrIfFOZ7Vg4Vkyh8J/WcwWWaNBlwFlW2v64jdAe7
 7AS6X1TKRAmoJci1r0DUax8ubozftS3nmfItJftHirbVkVMdEZLhfEVwV
 lJ8uVwyDIGMmIXuxR7QQ7E7/jXJ5+1rUEEiy2xX83vwh9ofbXVipUyU2w
 p+S4IqdNmyfh7Dz9/iKIKnSHU8OjMsCbbgsjvlMc91U5yE7vDfIBrulNB
 U7XM3Q/mKJngMgpPhA0yvKV1hQDfpbPguIsMtvqKr1PA590nhbHm52D+G w==;
X-CSE-ConnectionGUID: JYW9zck3QyWXpY7NntYf6Q==
X-CSE-MsgGUID: sMCB6wCtREGndyvzkFRVFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="84176521"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="84176521"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 15:08:32 -0700
X-CSE-ConnectionGUID: LdnBIS0TTNi/zXumkQlgdw==
X-CSE-MsgGUID: ob+asWZ7Qx2NHIJVlLVHYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="278487661"
Received: from ssharm2x-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.34.19])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 15:08:30 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Subject: [PATCH v2 04/13] drm/xe/guc: Add string KLV encoding helper
Date: Wed,  8 Jul 2026 00:08:06 +0200
Message-ID: <20260707220816.677-5-michal.wajdeczko@intel.com>
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

We also plan to encode a text data as KLV. Add helper for that too.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
---
v2: don't mix units, report too long string (Michal/Sashiko)
---
 drivers/gpu/drm/xe/xe_guc_klv_helpers.c | 35 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_klv_helpers.h |  1 +
 2 files changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
index 5f94852a906f..45471738c150 100644
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
@@ -243,3 +248,33 @@ u32 *xe_guc_klv_encode_u64(u32 *klvs, u32 avail, u16 key, u64 value)
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
+	size_t longest = to_num_bytes(FIELD_MAX(GUC_KLV_0_LEN));
+	size_t size = strnlen(s, longest) + 1; /* \0 */
+	u16 len = to_num_dwords(size);
+
+	if (IS_ERR(klvs))
+		return klvs;
+
+	if (size > longest)
+		return ERR_PTR(-E2BIG);
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

