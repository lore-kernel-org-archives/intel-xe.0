Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3225C43602
	for <intel-xe@archiver.kernel.org>; Tue,  7 Jul 2026 22:08:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72E0B10E512;
	Tue,  7 Jul 2026 22:08:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VrXvkhpR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E001F10E512
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Jul 2026 22:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783462113; x=1814998113;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H5B84Ld6lkq1S/QHnXd+fioLq/IxZ7rYNY+/83hJ834=;
 b=VrXvkhpRc+aqosQ9GiI4/NnH8nRMHrs/GY0HKFRWAVIX0gyZ+rf29kbB
 ijyZuWSjgT1aINGEUNiLKTMTp4B/NWZZcApjHuZbZ4WrG5whboxV2Bx2u
 Shbku8u76JLJqrCNDN9Yc97h+paENh3KkYjs/nqeurxL6KijbDrAdZo68
 +BO92JM/ZggeV3PHBpMWR3Q07Q9v0UeP8OlcGU8enDVClHCfoBeK8/YaV
 WntyKKrSxYhnFJv/sO33qmcgURY7sQSAHeDYsbK4HhllCKIPmTWJM0g9c
 +t78v4xdDM0XcLxyLKdWjQn95LL80pFky06T/JE6WNjSOqaHYY0k1k109 w==;
X-CSE-ConnectionGUID: AvgpXxw8QUymuqlQBJOLYg==
X-CSE-MsgGUID: uer8whKNS2+QWTI6OOFlXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="84176529"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="84176529"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 15:08:33 -0700
X-CSE-ConnectionGUID: xeMkeq5mQD+BEhrLh8qUVA==
X-CSE-MsgGUID: b/70WU6xTFazlXifxFwcCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="278487664"
Received: from ssharm2x-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.34.19])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 15:08:32 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2 05/13] drm/xe/guc: Add object KLV encoding helper
Date: Wed,  8 Jul 2026 00:08:07 +0200
Message-ID: <20260707220816.677-6-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707220816.677-1-michal.wajdeczko@intel.com>
References: <20260707220816.677-1-michal.wajdeczko@intel.com>
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

We plan to encode larger objects as single KLV or set of KLVs.
Add helper for that.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
v2: limit avail to avoid unexpected truncation (Michal/Sashiko)
---
 drivers/gpu/drm/xe/xe_guc_klv_helpers.c | 39 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_klv_helpers.h |  2 ++
 2 files changed, 41 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
index 45471738c150..5ad51a8ff0de 100644
--- a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
+++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
@@ -278,3 +278,42 @@ u32 *xe_guc_klv_encode_string(u32 *klvs, u32 avail, u16 key, const char *s)
 	strscpy_pad((void *)klvs, s, to_num_bytes(len));
 	return klvs + len;
 }
+
+/**
+ * xe_guc_klv_encode_object() - Encode object using custom encoder as single KLV.
+ * @klvs: the buffer where to place KLV
+ * @avail: number of dwords (u32) available in the buffer
+ * @key: key to be used
+ * @obj: opaque object pointer
+ * @encoder: function pointer to the custom encoder
+ *
+ * Return: pointer to the buffer location past the encoded KLV or
+ *         an ERR_PTR if there was no space to encode the KLV.
+ */
+u32 *xe_guc_klv_encode_object(u32 *klvs, u32 avail, u16 key, const void *obj,
+			      u32 *(*encoder)(u32 *klvs, u32 avail, const void *obj))
+{
+	u32 *end;
+
+	if (IS_ERR(klvs))
+		return klvs;
+
+	if (avail < GUC_KLV_LEN_MIN)
+		return ERR_PTR(-ENOSPC);
+
+	if (avail > GUC_KLV_LEN_MIN + FIELD_MAX(GUC_KLV_0_LEN))
+		avail = GUC_KLV_LEN_MIN + FIELD_MAX(GUC_KLV_0_LEN);
+
+	end = encoder(klvs + GUC_KLV_LEN_MIN, avail - GUC_KLV_LEN_MIN, obj);
+	if (IS_ERR(end))
+		return end;
+
+	if (WARN_ON(end < klvs + GUC_KLV_LEN_MIN))
+		return ERR_PTR(-EPIPE);
+
+	if (WARN_ON(end > klvs + avail))
+		return ERR_PTR(-EFBIG);
+
+	*klvs = PREP_GUC_KLV(key, end - (klvs + GUC_KLV_LEN_MIN));
+	return end;
+}
diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.h b/drivers/gpu/drm/xe/xe_guc_klv_helpers.h
index 1c576456efc5..855805f4463d 100644
--- a/drivers/gpu/drm/xe/xe_guc_klv_helpers.h
+++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.h
@@ -20,6 +20,8 @@ int xe_guc_klv_count(const u32 *klvs, u32 num_dwords);
 u32 *xe_guc_klv_encode_u32(u32 *klvs, u32 avail, u16 key, u32 value);
 u32 *xe_guc_klv_encode_u64(u32 *klvs, u32 avail, u16 key, u64 value);
 u32 *xe_guc_klv_encode_string(u32 *klvs, u32 avail, u16 key, const char *s);
+u32 *xe_guc_klv_encode_object(u32 *klvs, u32 avail, u16 key, const void *obj,
+			      u32 *(*encoder)(u32 *klvs, u32 avail, const void *obj));
 
 /**
  * PREP_GUC_KLV - Prepare KLV header value based on provided key and len.
-- 
2.47.1

