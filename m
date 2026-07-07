Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8064BC44503
	for <intel-xe@archiver.kernel.org>; Tue,  7 Jul 2026 22:08:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40FCC10E52D;
	Tue,  7 Jul 2026 22:08:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ViazUWaq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B0B910E52B
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Jul 2026 22:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783462111; x=1814998111;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pdmM1PaBkozYpQLmliQROU6pxvJZypE0WCEby7bGjzI=;
 b=ViazUWaqxrvWnAfgUVbO+bqsl+k5klnM6Ny4GF82wc67e88jwLbc7/gE
 7SA95kYDfAwiq2T27R8YcCIuQq7uoAPTXhWb4kWp1OCZu5HuArtjDGqH9
 DA3ZC2mpUEwbUyWHeNkXXSufOkQ0ZPo13ZWfocF+WxJ+KEKgHcEIUuLfi
 KlNay4qhSrl1PIlDyvRtjGLoEihawi4Z/k/Mwc/fL84Rl6ZzUX6lPN1UC
 SNAivWBmYu+qs55RJ4HBh4qk7I9LrdkbwcKrvsTyvGzNxBklV+K3iKRy9
 anAIE2IMgDJViPrta1Oqy3Z49RnA5vFq7rnH6Eig/RfKUXPlLjOJp0BY6 Q==;
X-CSE-ConnectionGUID: EZLaTZuFR6iJy9giMuhnjw==
X-CSE-MsgGUID: dPOb7wcJShCOiVVa3tToUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="84176518"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="84176518"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 15:08:30 -0700
X-CSE-ConnectionGUID: 3dSbcwNHTkmkpCvGBIL/Vg==
X-CSE-MsgGUID: tuaqaJp0SNaVCI+AYyOO2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="278487655"
Received: from ssharm2x-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.34.19])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 15:08:29 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Subject: [PATCH v2 03/13] drm/xe/guc: Add basic KLV encoding helpers
Date: Wed,  8 Jul 2026 00:08:05 +0200
Message-ID: <20260707220816.677-4-michal.wajdeczko@intel.com>
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

We plan to encode more data as KLVs. Add helpers for that.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_klv_helpers.c | 56 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_klv_helpers.h |  3 ++
 2 files changed, 59 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
index f672f4947768..5f94852a906f 100644
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
+	u16 len = to_num_dwords(sizeof(u64));
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

