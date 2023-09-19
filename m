Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B54BCE79AC
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 16:16:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3225510E3C8;
	Tue, 19 Sep 2023 16:16:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F29CF10E13B
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Sep 2023 16:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695140180; x=1726676180;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BHVaDc4wR8nY+eJ2qI8+CbRw+74s4kDyHNpB0SeHN/w=;
 b=ihsZH608AV5n2kbhl9tDZU5FqiitbHifKmnW6Owm5eqUdGCg7UZG8OJv
 TYOhMvHtQn0oA3DS1nER7D6a34lV3Dm2dQQNNiC93dtNWzWRvU45c76cJ
 f+CXUsbWXAgo6jX84mqI1tjD54oK04GYSpWrC/239rernqlT7eJe894Mh
 Gu5MQy1hLa6D56OJ426z7Y0VlQla3x0M4OertWdlnamz3ieJEhKXM65At
 P2YDAiPgEhYO+S5/NKO0BvqYDQu4egIEi2G1VWxpveZhvqumw8qX+ze9f
 RKdCxTQ8cFzCQyK7zzK5Za8pcp2nyljUGOl6i4OKzmvDLVThjLCeLJf1x A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="410913570"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; d="scan'208";a="410913570"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 09:10:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="870016545"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; d="scan'208";a="870016545"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 09:10:54 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 19 Sep 2023 09:10:43 -0700
Message-ID: <20230919161049.2307855-16-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230919161049.2307855-1-ashutosh.dixit@intel.com>
References: <20230919161049.2307855-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 15/21] drm/xe/uapi: Remove OA format names from
 OA uapi
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

OA format names (in enum drm_xe_oa_format) have an overhead in that the
uapi header has to be updated each time a HW introduces a new
format. Instead of directly using OA format names, switch to using the same
fields Bspec uses to specify formats. The fields change much less often
than the format names. The format names are still internally maintained,
just not exchanged through the uapi.

Bspec: 52198, 60942

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c       | 52 +++++++++++++++++++++-----------
 drivers/gpu/drm/xe/xe_oa_types.h | 23 ++++++++++++--
 include/uapi/drm/xe_drm.h        | 33 ++++++++++----------
 3 files changed, 72 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 19ad23b90e6ad..d49debe732bbd 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -53,10 +53,10 @@ static const struct xe_oa_format oa_formats[] = {
 	[XE_OA_FORMAT_A12]			= { 0, 64 },
 	[XE_OA_FORMAT_A12_B8_C8]		= { 2, 128 },
 	[XE_OA_FORMAT_A32u40_A4u32_B8_C8]	= { 5, 256 },
-	[XE_OAR_FORMAT_A32u40_A4u32_B8_C8]	= { 5, 256 },
+	[XE_OAR_FORMAT_A32u40_A4u32_B8_C8]	= { 5, 256, XE_OA_FMT_TYPE_OAR },
 	[XE_OA_FORMAT_A24u40_A14u32_B8_C8]	= { 5, 256 },
-	[XE_OAM_FORMAT_MPEC8u64_B8_C8]		= { 1, 192, TYPE_OAM, HDR_64_BIT },
-	[XE_OAM_FORMAT_MPEC8u32_B8_C8]		= { 2, 128, TYPE_OAM, HDR_64_BIT },
+	[XE_OAM_FORMAT_MPEC8u64_B8_C8]		= { 1, 192, XE_OA_FMT_TYPE_OAM_MPEC, HDR_64_BIT },
+	[XE_OAM_FORMAT_MPEC8u32_B8_C8]		= { 2, 128, XE_OA_FMT_TYPE_OAM_MPEC, HDR_64_BIT },
 };
 
 struct xe_oa_open_properties {
@@ -65,7 +65,7 @@ struct xe_oa_open_properties {
 	u64 exec_q_id;
 
 	int metrics_set;
-	int oa_format;
+	enum xe_oa_format_name oa_format;
 	bool oa_periodic;
 	int oa_period_exponent;
 
@@ -1529,13 +1529,6 @@ static u64 oa_exponent_to_ns(struct xe_oa *oa, int exponent)
 	return div_u64(nom + den - 1, den);
 }
 
-static bool oa_format_valid(struct xe_oa *oa, u64 format)
-{
-	if (format >= XE_OA_FORMAT_MAX)
-		return false;
-	return test_bit(format, oa->format_mask);
-}
-
 static bool engine_supports_oa(const struct xe_hw_engine *hwe)
 {
 	return hwe->oa_group;
@@ -1543,7 +1536,32 @@ static bool engine_supports_oa(const struct xe_hw_engine *hwe)
 
 static bool engine_supports_oa_format(const struct xe_hw_engine *hwe, int type)
 {
-	return hwe->oa_group && hwe->oa_group->type == type;
+	switch (hwe->oa_group->type) {
+	case TYPE_OAG:
+		return type == XE_OA_FMT_TYPE_OAG || type == XE_OA_FMT_TYPE_OAR;
+	case TYPE_OAM:
+		return type == XE_OA_FMT_TYPE_OAM || type == XE_OA_FMT_TYPE_OAM_MPEC;
+	default:
+		return false;
+	}
+}
+
+static int decode_oa_format(struct xe_oa *oa, u64 prop, enum xe_oa_format_name *name)
+{
+	u32 counter_sel = FIELD_GET(XE_OA_MASK_COUNTER_SEL, prop);
+	u32 type = FIELD_GET(XE_OA_MASK_FMT_TYPE, prop);
+	int idx;
+
+	for_each_set_bit(idx, oa->format_mask, XE_OA_FORMAT_MAX) {
+		const struct xe_oa_format *f = &oa->oa_formats[idx];
+
+		if (type == f->type && counter_sel == f->format) {
+			*name = idx;
+			return 0;
+		}
+	}
+
+	return -EINVAL;
 }
 
 #define OA_EXPONENT_MAX 31
@@ -1600,12 +1618,12 @@ static int xe_oa_read_properties_unlocked(struct xe_oa *oa, u64 __user *uprops,
 			props->metrics_set = value;
 			break;
 		case DRM_XE_OA_PROP_OA_FORMAT:
-			if (!oa_format_valid(oa, value)) {
-				drm_dbg(&oa->xe->drm, "Unsupported OA report format %llu\n",
+			ret = decode_oa_format(oa, value, &props->oa_format);
+			if (ret) {
+				drm_dbg(&oa->xe->drm, "Unsupported OA report format %#llx\n",
 					value);
-				return -EINVAL;
+				return ret;
 			}
-			props->oa_format = value;
 			break;
 		case DRM_XE_OA_PROP_OA_EXPONENT:
 			if (value > OA_EXPONENT_MAX) {
@@ -2227,7 +2245,7 @@ u16 xe_oa_unit_id(struct xe_hw_engine *hwe)
 		hwe->oa_group->oa_unit_id : U16_MAX;
 }
 
-static void oa_format_add(struct xe_oa *oa, enum drm_xe_oa_format format)
+static void oa_format_add(struct xe_oa *oa, enum xe_oa_format_name format)
 {
 	__set_bit(format, oa->format_mask);
 }
diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
index ac8b23695cc6e..3cc1d88fe4a51 100644
--- a/drivers/gpu/drm/xe/xe_oa_types.h
+++ b/drivers/gpu/drm/xe/xe_oa_types.h
@@ -24,7 +24,7 @@ enum {
 	OA_GROUP_INVALID = U32_MAX,
 };
 
-enum oa_type {
+enum oa_unit_type {
 	TYPE_OAG,
 	TYPE_OAM,
 };
@@ -34,6 +34,25 @@ enum report_header {
 	HDR_64_BIT,
 };
 
+enum xe_oa_format_name {
+	XE_OA_FORMAT_C4_B8 = 7,
+
+	/* Gen8+ */
+	XE_OA_FORMAT_A12,
+	XE_OA_FORMAT_A12_B8_C8,
+	XE_OA_FORMAT_A32u40_A4u32_B8_C8,
+
+	/* DG2 */
+	XE_OAR_FORMAT_A32u40_A4u32_B8_C8,
+	XE_OA_FORMAT_A24u40_A14u32_B8_C8,
+
+	/* MTL OAM */
+	XE_OAM_FORMAT_MPEC8u64_B8_C8,
+	XE_OAM_FORMAT_MPEC8u32_B8_C8,
+
+	XE_OA_FORMAT_MAX,
+};
+
 struct xe_oa_format {
 	u32 format;
 	int size;
@@ -96,7 +115,7 @@ struct xe_oa_group {
 	struct xe_oa_regs regs;
 
 	/** @type: Type of OA unit - OAM, OAG etc. */
-	enum oa_type type;
+	enum oa_unit_type type;
 };
 
 /**
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index fe873dc63fc5a..77949c5abcee1 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1124,23 +1124,13 @@ struct drm_xe_perf_param {
 	__u64 param;
 };
 
-enum drm_xe_oa_format {
-	XE_OA_FORMAT_C4_B8 = 7,
-
-	/* Gen8+ */
-	XE_OA_FORMAT_A12,
-	XE_OA_FORMAT_A12_B8_C8,
-	XE_OA_FORMAT_A32u40_A4u32_B8_C8,
-
-	/* DG2 */
-	XE_OAR_FORMAT_A32u40_A4u32_B8_C8,
-	XE_OA_FORMAT_A24u40_A14u32_B8_C8,
-
-	/* MTL OAM */
-	XE_OAM_FORMAT_MPEC8u64_B8_C8,
-	XE_OAM_FORMAT_MPEC8u32_B8_C8,
-
-	XE_OA_FORMAT_MAX	    /* non-ABI */
+enum drm_xe_oa_format_type {
+	XE_OA_FMT_TYPE_OAG,
+	XE_OA_FMT_TYPE_OAR,
+	XE_OA_FMT_TYPE_OAM,
+	XE_OA_FMT_TYPE_OAC,
+	XE_OA_FMT_TYPE_OAM_MPEC,
+	XE_OA_FMT_TYPE_PEC,
 };
 
 enum drm_xe_oa_property_id {
@@ -1167,6 +1157,15 @@ enum drm_xe_oa_property_id {
 	 * The value specifies the size and layout of OA unit reports.
 	 */
 	DRM_XE_OA_PROP_OA_FORMAT,
+	/**
+	 * OA_FORMAT's are specified the same way as in Bspec, in terms of
+	 * the following quantities: a. enum @drm_xe_oa_format_type
+	 * b. Counter select c. Counter size and d. BC report
+	 */
+#define XE_OA_MASK_FMT_TYPE	(0xff << 0)
+#define XE_OA_MASK_COUNTER_SEL	(0xff << 8)
+#define XE_OA_MASK_COUNTER_SIZE	(0xff << 16)
+#define XE_OA_MASK_BC_REPORT	(0xff << 24)
 
 	/**
 	 * Specifying this property implicitly requests periodic OA unit
-- 
2.41.0

