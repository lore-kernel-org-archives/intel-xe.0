Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 799BCC43327
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jun 2026 13:26:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0788A10E993;
	Tue, 30 Jun 2026 13:26:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lo7dIGog";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF50710E1D9
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jun 2026 13:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782826011; x=1814362011;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JO2ccjvYPx0jOG9siQp+g2OiWe2R8aF4Me4feomRzuQ=;
 b=Lo7dIGogokXBGrwDfeqSMBf8tBS9dLjJyRvKPgxHc3EmvCuOEpXgkZsw
 TiyzBv/LqjHAylcA1NLasRgFPaE9Y9JMeAOg+f8yh+xm8rrnWwelnc6Ip
 JA/m/prT5SfvDHu5fDw79f4lVHSK56/MsotVq0cGqPQhbTl6c193Zrkvc
 TBXTA2U3UTmUwwcPWcb77wEbcbvngN+c7oG0GCmDINSGJsoYNJwfTWsYF
 n1lWYq7KlclLRae5xbKN7vnodeykApx2IWHtpv9hEC3Uk/z0QEmUBho2z
 jnpFoY/OrmXv//TzEJLoyNLvJrfxVsB8Ko1jitQ8EHYbnf8TT4Boiq0N6 w==;
X-CSE-ConnectionGUID: leAMjwpvTCuRJiSR+AqHsw==
X-CSE-MsgGUID: f/07RTJ7Rs+5s9bUpLw34w==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="83623518"
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; d="scan'208";a="83623518"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2026 06:26:51 -0700
X-CSE-ConnectionGUID: PspIa8eaQnCP1FrWcI4O6w==
X-CSE-MsgGUID: V1RyHcpBSRKuW1VW9/LcXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; d="scan'208";a="256182211"
Received: from smoudgil-mobl1.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.117.247])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2026 06:26:50 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 06/13] drm/xe/guc: Add KLV parsing helper
Date: Tue, 30 Jun 2026 15:26:25 +0200
Message-ID: <20260630132633.32804-7-michal.wajdeczko@intel.com>
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

We have already introduced a helper to encode larger objects. Now
add helper to parse the KLVs buffer. We will use it shortly.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_klv_helpers.c | 38 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_klv_helpers.h |  3 ++
 2 files changed, 41 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
index 53a8beb9af04..d610ab75aecc 100644
--- a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
+++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
@@ -310,3 +310,41 @@ u32 *xe_guc_klv_encode_object(u32 *klvs, u32 avail, u16 key, const void *obj,
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

