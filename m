Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D00DAC982C1
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 21:58:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B18F10E335;
	Wed, 16 Sep 2026 21:58:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lu5LfxDk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5673F10E2E5
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Sep 2026 21:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789595927; x=1821131927;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ezm1YwjlMkFXQZKotxcApbKIdhg7R6dbP3MnLItXeUc=;
 b=lu5LfxDk3F7HCG+WdmDLGzvrevFqtvRAGIXWMG7S78cW6VH2OtOxOM+X
 tlVZ5ZS/pl9e/A5v0/4DXidYoaRwFvabQJ6h6m8zLlcdQSj0XX398aSXq
 mvFhgs1aQOi32c3pbwgnwoTKgru7lARKWHPWaVdq72Nt+vdgtqce52/r/
 QZBKwAKVf15MIFzwEB6G0zZM77NUz1blijeW0IOv1WAB9Sb1n4Nqq6Hxl
 gl0btPV9VE5xwluLFTfHenhTW3BY3nw+MAWf8iC7Aw9oy7TAGI9DOUbvG
 QL5tdkyOxvr+fDPYp5+/Zl3iSjwrdBYzW/TiUX4lmgZmylJLpbj4bATFH A==;
X-CSE-ConnectionGUID: o8BQiMIoTqCkPLoAc9X78g==
X-CSE-MsgGUID: WTVmeV8ASSaStxHVzoSKtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="101325123"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="101325123"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 14:58:46 -0700
X-CSE-ConnectionGUID: Wpo9PiaVTfiCeOjlUw3rBw==
X-CSE-MsgGUID: QGJGG+ufQia/VQzCg2novg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="267247867"
Received: from awalabdu-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.64.211])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 14:58:45 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 1/3] drm/xe/guc: Add simple KLV decoder helpers
Date: Wed, 16 Sep 2026 23:58:25 +0200
Message-ID: <20260916215827.13488-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916215827.13488-1-michal.wajdeczko@intel.com>
References: <20260916215827.13488-1-michal.wajdeczko@intel.com>
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

Instead of retrieving data from the KLV dwords manually, add
simple helpers that will do that together with sanity checks.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_klv_helpers.c | 79 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_klv_helpers.h |  5 ++
 2 files changed, 84 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
index dc8612d761e3..5c40ee44d9a5 100644
--- a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
+++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
@@ -372,6 +372,85 @@ int xe_guc_klv_parser(const u32 *klvs, u32 num_dwords, void *obj,
 	return total;
 }
 
+/**
+ * xe_guc_klv_decode_u16() - Decode u16 data from KLV.
+ * @value: array of dwords
+ * @len: number of dwords in @value
+ * @data: pointer where to store the data
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_guc_klv_decode_u16(const u32 *value, u16 len, u16 *data)
+{
+	u32 tmp;
+	int err;
+
+	err = xe_guc_klv_decode_u32(value, len, &tmp);
+	if (err)
+		return err;
+	if (upper_16_bits(tmp))
+		return -EOVERFLOW;
+	*data = lower_16_bits(tmp);
+	return 0;
+}
+
+/**
+ * xe_guc_klv_decode_u32() - Decode u32 data from KLV.
+ * @value: array of dwords
+ * @len: number of dwords in @value
+ * @data: pointer where to store the data
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_guc_klv_decode_u32(const u32 *value, u16 len, u32 *data)
+{
+	if (len < to_num_dwords(sizeof(u32)))
+		return -ENODATA;
+	if (len > to_num_dwords(sizeof(u32)))
+		return -ENOMSG;
+	*data = *value;
+	return 0;
+}
+
+/**
+ * xe_guc_klv_decode_u64() - Decode u64 data from KLV.
+ * @value: array of dwords
+ * @len: number of dwords in @value
+ * @data: pointer where to store the data
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_guc_klv_decode_u64(const u32 *value, u16 len, u64 *data)
+{
+	if (len < to_num_dwords(sizeof(u64)))
+		return -ENODATA;
+	if (len != to_num_dwords(sizeof(u64)))
+		return -ENOMSG;
+	*data = make_u64(value[1], value[0]);
+	return 0;
+}
+
+/**
+ * xe_guc_klv_decode_string() - Decode string data from KLV.
+ * @key: the key
+ * @len: number of dwords in @value
+ * @value: array of dwords
+ * @data: pointer where to store the data
+ *
+ * Note: caller must use kfree() to release decoded string.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_guc_klv_decode_string(const u32 *value, u16 len, char **data)
+{
+	const char *src = (const void *)value;
+
+	if (!len)
+		return -ENOMSG;
+	*data = kstrndup(src, to_num_bytes(len), GFP_KERNEL);
+	return *data ? 0 : -ENOMEM;
+}
+
 #if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST)
 #include "tests/xe_guc_klv_helpers_kunit.c"
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.h b/drivers/gpu/drm/xe/xe_guc_klv_helpers.h
index cf3b29adc9d6..10af545a0f79 100644
--- a/drivers/gpu/drm/xe/xe_guc_klv_helpers.h
+++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.h
@@ -26,6 +26,11 @@ u32 *xe_guc_klv_encode_object(u32 *klvs, u32 avail, u16 key, const void *obj,
 int xe_guc_klv_parser(const u32 *klvs, u32 num_dwords, void *obj,
 		      int (*decoder)(void *obj, u16 key, u16 len, const u32 *value));
 
+int xe_guc_klv_decode_u16(const u32 *value, u16 len, u16 *data);
+int xe_guc_klv_decode_u32(const u32 *value, u16 len, u32 *data);
+int xe_guc_klv_decode_u64(const u32 *value, u16 len, u64 *data);
+int xe_guc_klv_decode_string(const u32 *value, u16 len, char **data);
+
 /**
  * PREP_GUC_KLV - Prepare KLV header value based on provided key and len.
  * @key: KLV key
-- 
2.47.1

