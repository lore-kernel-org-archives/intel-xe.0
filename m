Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B73BDD3B9A7
	for <intel-xe@archiver.kernel.org>; Tue, 26 Nov 2024 15:30:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8434010E13A;
	Tue, 26 Nov 2024 15:30:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GtpVT5pJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE2A110E13A
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Nov 2024 15:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732635056; x=1764171056;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T2MZlOUojNn8HARZWRS8Q+IVwZxP8+idhWvu2lE4hxM=;
 b=GtpVT5pJtTjgg02jHo4dRiapw9o85uqcTzodxefdMdtZ3qz8yQBOUXSO
 3Rfea/YxAr9QCbnDDj9WFeK88BM4RNy43/N8E2X8DAEgJYSLMeHvKxOXS
 s8Mvf08EedlwXbjo/AxxRpbJOBQVljJ8i+Z0+zklDM7fPy3s6y9JprNBN
 k8CHv9BV6gKwQl6RzTcj2YstZIx4HQ9FEO8Qj5ONFC4pjfsC6M41nu0fY
 HQXWKS10XyvH86sbCquLu422YuZK1uMIiCx29YqPNgR9knMduACBHCVW6
 EOYYZ3pk/UYRquleKGMj9Eq5DPHNzIkaELIZ0pCqIB7aTBye0IF2yX6Z9 Q==;
X-CSE-ConnectionGUID: ai/llZc/QWuC7Q5w1NhzNg==
X-CSE-MsgGUID: HYLRqBKtQdO0fKfsfbS8pA==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="32960750"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="32960750"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 07:30:56 -0800
X-CSE-ConnectionGUID: Yp0eZ4MHQEeKMLdNFNxa9g==
X-CSE-MsgGUID: a0eF27LrSv2lIgapkj3Ojw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="96707019"
Received: from spottumu-desk.iind.intel.com ([10.145.152.200])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 07:30:54 -0800
From: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com,
	sai.teja.pottumuttu@intel.com
Subject: [PATCH 2/3] drm/xe/oa: Make OA buffer size configurable
Date: Tue, 26 Nov 2024 20:52:49 +0530
Message-Id: <20241126152250.371478-3-sai.teja.pottumuttu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241126152250.371478-1-sai.teja.pottumuttu@intel.com>
References: <20241126152250.371478-1-sai.teja.pottumuttu@intel.com>
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

Add a new property called DRM_XE_OA_PROPERTY_OA_BUFFER_SIZE to
allow OA buffer size to be configurable from userspace.

With this OA buffer size can be configured to any power of 2
size between 128KB and 128MB and it would default to 16MB in case
the size is not supplied.

Note that we also set the respective bits in OAG_OABUFFER and
OAG_OA_DEBUG to enable up to 128MB sizing.

BSpec: 61100, 61228
Signed-off-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c       | 49 +++++++++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_oa_types.h |  2 +-
 include/uapi/drm/xe_drm.h        |  7 +++++
 3 files changed, 47 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 0e1049079905..125990a49401 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -96,6 +96,7 @@ struct xe_oa_open_param {
 	struct drm_xe_sync __user *syncs_user;
 	int num_syncs;
 	struct xe_sync_entry *syncs;
+	size_t oa_buffer_size;
 };
 
 struct xe_oa_config_bo {
@@ -405,9 +406,17 @@ static void xe_oa_init_oa_buffer(struct xe_oa_stream *stream)
 {
 	struct xe_mmio *mmio = &stream->gt->mmio;
 	u32 gtt_offset = xe_bo_ggtt_addr(stream->oa_buffer.bo);
-	/* For 128M OA buffer size, x8 is done in xe_oa_enable_metric_set() */
-	u32 oa_buf = gtt_offset | OABUFFER_SIZE_16M | OAG_OABUFFER_MEMORY_SELECT;
+	u32 oa_buf = gtt_offset | OAG_OABUFFER_MEMORY_SELECT;
 	unsigned long flags;
+	int size_exponent = __ffs(stream->oa_buffer.bo->size);
+
+	/*
+	 * If oa buffer size is more than 16MB (exponent greater than 24), the
+	 * oa buffer size field is multiplied by 8 in xe_oa_enable_metric_set by
+	 * setting OAG_OA_DEBUG_BUFFER_SIZE_SELECT bit in OAG DEBUG register
+	 */
+	oa_buf |= REG_FIELD_PREP(OABUFFER_SIZE_MASK,
+		size_exponent > 24 ? size_exponent - 20 : size_exponent - 17);
 
 	spin_lock_irqsave(&stream->oa_buffer.ptr_lock, flags);
 
@@ -902,14 +911,14 @@ static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
 	xe_file_put(stream->xef);
 }
 
-static int xe_oa_alloc_oa_buffer(struct xe_oa_stream *stream)
+static int xe_oa_alloc_oa_buffer(struct xe_oa_stream *stream, size_t size)
 {
 	struct xe_bo *bo;
 
 	BUILD_BUG_ON_NOT_POWER_OF_2(XE_OA_BUFFER_SIZE);
 
 	bo = xe_bo_create_pin_map(stream->oa->xe, stream->gt->tile, NULL,
-				  XE_OA_BUFFER_SIZE, ttm_bo_type_kernel,
+				  size, ttm_bo_type_kernel,
 				  XE_BO_FLAG_SYSTEM | XE_BO_FLAG_GGTT);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
@@ -1087,11 +1096,12 @@ static u32 oag_report_ctx_switches(const struct xe_oa_stream *stream)
 			     0 : OAG_OA_DEBUG_DISABLE_CTX_SWITCH_REPORTS);
 }
 
-static u32 oag_buf_size_select(void)
+static u32 oag_buf_size_select(const struct xe_oa_stream *stream)
 {
 	BUILD_BUG_ON(XE_OA_BUFFER_SIZE != SZ_16M && XE_OA_BUFFER_SIZE != SZ_128M);
 	return _MASKED_FIELD(OAG_OA_DEBUG_BUF_SIZE_SELECT,
-			     (XE_OA_BUFFER_SIZE == SZ_128M) ? OAG_OA_DEBUG_BUF_SIZE_SELECT : 0);
+			     (stream->oa_buffer.bo->size > SZ_16M) ?
+			     OAG_OA_DEBUG_BUF_SIZE_SELECT : 0);
 }
 
 static int xe_oa_enable_metric_set(struct xe_oa_stream *stream)
@@ -1126,7 +1136,7 @@ static int xe_oa_enable_metric_set(struct xe_oa_stream *stream)
 	xe_mmio_write32(mmio, __oa_regs(stream)->oa_debug,
 			_MASKED_BIT_ENABLE(oa_debug) |
 			oag_report_ctx_switches(stream) |
-			oag_buf_size_select() |
+			oag_buf_size_select(stream) |
 			oag_configure_mmio_trigger(stream, true));
 
 	xe_mmio_write32(mmio, __oa_regs(stream)->oa_ctx_ctrl, stream->periodic ?
@@ -1268,6 +1278,17 @@ static int xe_oa_set_prop_syncs_user(struct xe_oa *oa, u64 value,
 	return 0;
 }
 
+static int xe_oa_set_prop_oa_buffer_size(struct xe_oa *oa, u64 value,
+					 struct xe_oa_open_param *param)
+{
+	if (!is_power_of_2(value) || value < SZ_128K || value > SZ_128M) {
+		DRM_DEBUG("OA buffer size invalid %llu\n", value);
+		return -EINVAL;
+	}
+	param->oa_buffer_size = value;
+	return 0;
+}
+
 static int xe_oa_set_prop_ret_inval(struct xe_oa *oa, u64 value,
 				    struct xe_oa_open_param *param)
 {
@@ -1288,6 +1309,7 @@ static const xe_oa_set_property_fn xe_oa_set_property_funcs_open[] = {
 	[DRM_XE_OA_PROPERTY_NO_PREEMPT] = xe_oa_set_no_preempt,
 	[DRM_XE_OA_PROPERTY_NUM_SYNCS] = xe_oa_set_prop_num_syncs,
 	[DRM_XE_OA_PROPERTY_SYNCS] = xe_oa_set_prop_syncs_user,
+	[DRM_XE_OA_PROPERTY_OA_BUFFER_SIZE] = xe_oa_set_prop_oa_buffer_size,
 };
 
 static const xe_oa_set_property_fn xe_oa_set_property_funcs_config[] = {
@@ -1302,6 +1324,7 @@ static const xe_oa_set_property_fn xe_oa_set_property_funcs_config[] = {
 	[DRM_XE_OA_PROPERTY_NO_PREEMPT] = xe_oa_set_prop_ret_inval,
 	[DRM_XE_OA_PROPERTY_NUM_SYNCS] = xe_oa_set_prop_num_syncs,
 	[DRM_XE_OA_PROPERTY_SYNCS] = xe_oa_set_prop_syncs_user,
+	[DRM_XE_OA_PROPERTY_OA_BUFFER_SIZE] = xe_oa_set_prop_ret_inval,
 };
 
 static int xe_oa_user_ext_set_property(struct xe_oa *oa, enum xe_oa_user_extn_from from,
@@ -1791,9 +1814,10 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
 	if (GRAPHICS_VER(stream->oa->xe) >= 20 &&
 	    stream->hwe->oa_unit->type == DRM_XE_OA_UNIT_TYPE_OAG && stream->sample)
 		stream->oa_buffer.circ_size =
-			XE_OA_BUFFER_SIZE - XE_OA_BUFFER_SIZE % stream->oa_buffer.format->size;
+			param->oa_buffer_size -
+			param->oa_buffer_size % stream->oa_buffer.format->size;
 	else
-		stream->oa_buffer.circ_size = XE_OA_BUFFER_SIZE;
+		stream->oa_buffer.circ_size = param->oa_buffer_size;
 
 	if (stream->exec_q && engine_supports_mi_query(stream->hwe)) {
 		/* If we don't find the context offset, just return error */
@@ -1836,7 +1860,7 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
 		goto err_fw_put;
 	}
 
-	ret = xe_oa_alloc_oa_buffer(stream);
+	ret = xe_oa_alloc_oa_buffer(stream, param->oa_buffer_size);
 	if (ret)
 		goto err_fw_put;
 
@@ -2133,6 +2157,11 @@ int xe_oa_stream_open_ioctl(struct drm_device *dev, u64 data, struct drm_file *f
 		drm_dbg(&oa->xe->drm, "Using periodic sampling freq %lld Hz\n", oa_freq_hz);
 	}
 
+	if (!param.oa_buffer_size) {
+		/* If the oa buffer size is not provided, default to 16MB*/
+		param.oa_buffer_size = XE_OA_BUFFER_SIZE;
+	}
+
 	ret = xe_oa_parse_syncs(oa, &param);
 	if (ret)
 		goto err_exec_q;
diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
index 539c75f57c09..fea9d981e414 100644
--- a/drivers/gpu/drm/xe/xe_oa_types.h
+++ b/drivers/gpu/drm/xe/xe_oa_types.h
@@ -15,7 +15,7 @@
 #include "regs/xe_reg_defs.h"
 #include "xe_hw_engine_types.h"
 
-#define XE_OA_BUFFER_SIZE SZ_128M
+#define XE_OA_BUFFER_SIZE SZ_16M
 
 enum xe_oa_report_header {
 	HDR_32_BIT = 0,
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 4a8a4a63e99c..aeb8a0f0741c 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1651,6 +1651,13 @@ enum drm_xe_oa_property_id {
 	 * to the VM bind case.
 	 */
 	DRM_XE_OA_PROPERTY_SYNCS,
+
+	/**
+	 * @DRM_XE_OA_PROPERTY_OA_BUFFER_SIZE: Specifies the size of OA buffer
+	 * allocated by the driver in bytes. The default size would be 16MB and the
+	 * supported sizes are powers of 2 from 128KB to 128MB.
+	 */
+	DRM_XE_OA_PROPERTY_OA_BUFFER_SIZE,
 };
 
 /**
-- 
2.34.1

