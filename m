Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2616C43458
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jun 2026 13:27:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74AA810E993;
	Tue, 30 Jun 2026 13:27:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pb6JFL6x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D4D810E1D9
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jun 2026 13:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782826007; x=1814362007;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=g97x0m4jAbLvgmQ+Ecor0l2ybX5tnYACvE9nWTMKn/8=;
 b=Pb6JFL6xjdNIgfibK3odPQuAfjeNkphOxsPJv+az0DmCXx9LhX4gJD4M
 ZcZixn8UwiM5zwmiHz6LNvpLX0Cwvx14CAs9rQsx8pCnf0nhl7i97KAp9
 bJyVh2x1sEf2F4FMG9T55ZXCn+SVwr1fSBb2EZON4xGNOxAJGoAjYmUy8
 U5tOQ0RJxoXRYUrdMs/vYHFRbjF8ChDy0yV9m8t3SFOa5tIlUrwJILbtK
 0SA6ZPtmgZQVHy+YUuMyXYKS7Slq4M6CcL5/yaSsl0PYSpSuf8ZDiq02m
 KPZb7u+fFqj0P3KMHFtHf9jGfE2gaaxOZjbEQRiyF9KXeHNzdoeu365SW g==;
X-CSE-ConnectionGUID: 7ZXZf6BlRSaf2T7vyJAUww==
X-CSE-MsgGUID: oZ1sggqtSGuAHUltgQzYcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="83623512"
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; d="scan'208";a="83623512"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2026 06:26:47 -0700
X-CSE-ConnectionGUID: lKIASt68RceagDF3+L/oTw==
X-CSE-MsgGUID: zNPu4ZMdSjWOfRWxJNgpTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; d="scan'208";a="256182199"
Received: from smoudgil-mobl1.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.117.247])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2026 06:26:46 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 03/13] drm/xe/guc: Add basic KLV encoding helpers
Date: Tue, 30 Jun 2026 15:26:22 +0200
Message-ID: <20260630132633.32804-4-michal.wajdeczko@intel.com>
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

We plan to encode more data as KLVs. Add helpers for that.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_klv_helpers.c | 56 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_klv_helpers.h |  3 ++
 2 files changed, 59 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
index f672f4947768..e84d1f5f5c56 100644
--- a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
+++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
@@ -187,3 +187,59 @@ int xe_guc_klv_count(const u32 *klvs, u32 num_dwords)
 
 	return num_dwords ? -ENODATA : num_klvs;
 }
+
+static u16 to_num_dwords(size_t size)
+{
+	return round_up(size, sizeof(u32)) / sizeof(u32);
+}
+
+/**
+ * xe_guc_klv_encode_u32() - Encode 32-bit value as KLV.
+ * @klvs: the buffer where to place KLV
+ * @avail: number of dwords (u32) available in the buffer
+ * @key: key to be used
+ * @value: value to be encoded
+ *
+ * Return: pointer to the buffer location past the encoded KLV or
+ *         an ERR_PTR if there was no space to encode the KLV.
+ */
+u32 *xe_guc_klv_encode_u32(u32 *klvs, u32 avail, u16 key, u32 value)
+{
+	u16 len = to_num_dwords(sizeof(u32));
+
+	if (IS_ERR(klvs))
+		return klvs;
+
+	if (avail < GUC_KLV_LEN_MIN + len)
+		return ERR_PTR(-ENOSPC);
+
+	*klvs++ = PREP_GUC_KLV(key, len);
+	*klvs++ = value;
+	return klvs;
+}
+
+/**
+ * xe_guc_klv_encode_u64() - Encode 64-bit value as KLV.
+ * @klvs: the buffer where to place KLV
+ * @avail: number of dwords (u32) available in the buffer
+ * @key: key to be used
+ * @value: value to be encoded
+ *
+ * Return: pointer to the buffer location past the encoded KLV or
+ *         an ERR_PTR if there was no space to encode the KLV.
+ */
+u32 *xe_guc_klv_encode_u64(u32 *klvs, u32 avail, u16 key, u64 value)
+{
+	u32 len = to_num_dwords(sizeof(u64));
+
+	if (IS_ERR(klvs))
+		return klvs;
+
+	if (avail < GUC_KLV_LEN_MIN + len)
+		return ERR_PTR(-ENOSPC);
+
+	*klvs++ = PREP_GUC_KLV(key, len);
+	*klvs++ = lower_32_bits(value);
+	*klvs++ = upper_32_bits(value);
+	return klvs;
+}
diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.h b/drivers/gpu/drm/xe/xe_guc_klv_helpers.h
index c7b7e61c1250..713ef7f7b9f2 100644
--- a/drivers/gpu/drm/xe/xe_guc_klv_helpers.h
+++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.h
@@ -17,6 +17,9 @@ void xe_guc_klv_print_one(u16 key, u16 len, const u32 *value, struct drm_printer
 void xe_guc_klv_print(const u32 *klvs, u32 num_dwords, struct drm_printer *p);
 int xe_guc_klv_count(const u32 *klvs, u32 num_dwords);
 
+u32 *xe_guc_klv_encode_u32(u32 *klvs, u32 avail, u16 key, u32 value);
+u32 *xe_guc_klv_encode_u64(u32 *klvs, u32 avail, u16 key, u64 value);
+
 /**
  * PREP_GUC_KLV - Prepare KLV header value based on provided key and len.
  * @key: KLV key
-- 
2.47.1

