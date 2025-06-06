Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA88DC677C4
	for <intel-xe@archiver.kernel.org>; Fri,  6 Jun 2025 16:03:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7320410EAF3;
	Fri,  6 Jun 2025 16:03:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bxvYWsjU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E26910EAEC
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Jun 2025 16:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749225784; x=1780761784;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=m6ap6pPP+0xo6GX63sRUFHGw4j/T1VKpNoVyQBauTMA=;
 b=bxvYWsjU90Gq5p40tN60Le1W0s5OnI59g2SB+OkbqBqW6GmEkjFRQGqv
 xinhXH0PVvSq9av1ThRP1D4J27gflSwOdmwoow2BrpvG0OtNnYr3+2M6U
 wwbg1FEdQJyNkZkJITBLfPGZeIOkwfkCp/k3zHhvGpx+qujNllat+mmwP
 vB0hynP5uvP5GH/P8ekAoi5v4niRuw5AB6kF9160pZSJs8G/sfj4VmoN2
 xMTZeM55FheI3hECVT1wYNT5TL+DFVBwg/mwfjvOwpekAdGvIeadoPfQb
 SMetc7Wv2jpORwFlHKj0KLYG+zbRPtNowE6JwyM456U87VmxSoMJlg7by Q==;
X-CSE-ConnectionGUID: j0BPLaELScmVZupYoJIQpQ==
X-CSE-MsgGUID: bCHlUSVgQbydIexMn75QAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="51526357"
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="51526357"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 09:03:03 -0700
X-CSE-ConnectionGUID: NSq+QJhgSNOmSYQPOgx6ZA==
X-CSE-MsgGUID: elEyWY1aS/aDn6FsQUlN1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="145748896"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 09:03:02 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH 3/5] drm/xe/oa: Introduce stream->oa_unit
Date: Fri,  6 Jun 2025 09:02:51 -0700
Message-ID: <20250606160253.4054668-4-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250606160253.4054668-1-ashutosh.dixit@intel.com>
References: <20250606160253.4054668-1-ashutosh.dixit@intel.com>
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

Previously, the oa_unit associated with an OA stream was derived from hwe
associated with the stream (stream->hwe->oa_unit). This breaks with OAM_SAG
since OAM_SAG does not have any attached hardware engines. Resolve this by
introducing stream->oa_unit and stop depending on stream->hwe.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c       | 51 +++++++++++++++++++++-----------
 drivers/gpu/drm/xe/xe_oa_types.h |  3 ++
 2 files changed, 37 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index e22405166db6b..19529c861523b 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -83,7 +83,7 @@ struct xe_oa_config {
 
 struct xe_oa_open_param {
 	struct xe_file *xef;
-	u32 oa_unit_id;
+	struct xe_oa_unit *oa_unit;
 	bool sample;
 	u32 metric_set;
 	enum xe_oa_format_name oa_format;
@@ -200,7 +200,7 @@ static void free_oa_config_bo(struct xe_oa_config_bo *oa_bo, struct dma_fence *l
 
 static const struct xe_oa_regs *__oa_regs(struct xe_oa_stream *stream)
 {
-	return &stream->hwe->oa_unit->regs;
+	return &stream->oa_unit->regs;
 }
 
 static u32 xe_oa_hw_tail_read(struct xe_oa_stream *stream)
@@ -460,7 +460,7 @@ static u32 __oa_ccs_select(struct xe_oa_stream *stream)
 
 static u32 __oactrl_used_bits(struct xe_oa_stream *stream)
 {
-	return stream->hwe->oa_unit->type == DRM_XE_OA_UNIT_TYPE_OAG ?
+	return stream->oa_unit->type == DRM_XE_OA_UNIT_TYPE_OAG ?
 		OAG_OACONTROL_USED_BITS : OAM_OACONTROL_USED_BITS;
 }
 
@@ -481,7 +481,7 @@ static void xe_oa_enable(struct xe_oa_stream *stream)
 		__oa_ccs_select(stream) | OAG_OACONTROL_OA_COUNTER_ENABLE;
 
 	if (GRAPHICS_VER(stream->oa->xe) >= 20 &&
-	    stream->hwe->oa_unit->type == DRM_XE_OA_UNIT_TYPE_OAG)
+	    stream->oa_unit->type == DRM_XE_OA_UNIT_TYPE_OAG)
 		val |= OAG_OACONTROL_OA_PES_DISAG_EN;
 
 	xe_mmio_rmw32(&stream->gt->mmio, regs->oa_ctrl, __oactrl_used_bits(stream), val);
@@ -848,7 +848,7 @@ static void xe_oa_disable_metric_set(struct xe_oa_stream *stream)
 
 static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
 {
-	struct xe_oa_unit *u = stream->hwe->oa_unit;
+	struct xe_oa_unit *u = stream->oa_unit;
 	struct xe_gt *gt = stream->hwe->gt;
 
 	if (WARN_ON(stream != u->exclusive_stream))
@@ -1145,14 +1145,31 @@ static int decode_oa_format(struct xe_oa *oa, u64 fmt, enum xe_oa_format_name *n
 	return -EINVAL;
 }
 
+static struct xe_oa_unit *xe_oa_lookup_oa_unit(struct xe_oa *oa, u32 oa_unit_id)
+{
+	struct xe_gt *gt;
+	int gt_id, i;
+
+	for_each_gt(gt, oa->xe, gt_id) {
+		for (i = 0; i < gt->oa.num_oa_units; i++) {
+			struct xe_oa_unit *u = &gt->oa.oa_unit[i];
+
+			if (u->oa_unit_id == oa_unit_id)
+				return u;
+		}
+	}
+
+	return NULL;
+}
+
 static int xe_oa_set_prop_oa_unit_id(struct xe_oa *oa, u64 value,
 				     struct xe_oa_open_param *param)
 {
-	if (value >= oa->oa_unit_ids) {
+	param->oa_unit = xe_oa_lookup_oa_unit(oa, value);
+	if (!param->oa_unit) {
 		drm_dbg(&oa->xe->drm, "OA unit ID out of range %lld\n", value);
 		return -EINVAL;
 	}
-	param->oa_unit_id = value;
 	return 0;
 }
 
@@ -1683,13 +1700,13 @@ static const struct file_operations xe_oa_fops = {
 static int xe_oa_stream_init(struct xe_oa_stream *stream,
 			     struct xe_oa_open_param *param)
 {
-	struct xe_oa_unit *u = param->hwe->oa_unit;
 	struct xe_gt *gt = param->hwe->gt;
 	unsigned int fw_ref;
 	int ret;
 
 	stream->exec_q = param->exec_q;
 	stream->poll_period_ns = DEFAULT_POLL_PERIOD_NS;
+	stream->oa_unit = param->oa_unit;
 	stream->hwe = param->hwe;
 	stream->gt = stream->hwe->gt;
 	stream->oa_buffer.format = &stream->oa->oa_formats[param->oa_format];
@@ -1710,7 +1727,7 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
 	 * buffer whose size, circ_size, is a multiple of the report size
 	 */
 	if (GRAPHICS_VER(stream->oa->xe) >= 20 &&
-	    stream->hwe->oa_unit->type == DRM_XE_OA_UNIT_TYPE_OAG && stream->sample)
+	    stream->oa_unit->type == DRM_XE_OA_UNIT_TYPE_OAG && stream->sample)
 		stream->oa_buffer.circ_size =
 			param->oa_buffer_size -
 			param->oa_buffer_size % stream->oa_buffer.format->size;
@@ -1768,7 +1785,7 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
 	drm_dbg(&stream->oa->xe->drm, "opening stream oa config uuid=%s\n",
 		stream->oa_config->uuid);
 
-	WRITE_ONCE(u->exclusive_stream, stream);
+	WRITE_ONCE(stream->oa_unit->exclusive_stream, stream);
 
 	hrtimer_setup(&stream->poll_check_timer, xe_oa_poll_check_timer_cb, CLOCK_MONOTONIC,
 		      HRTIMER_MODE_REL);
@@ -1804,7 +1821,7 @@ static int xe_oa_stream_open_ioctl_locked(struct xe_oa *oa,
 	int ret;
 
 	/* We currently only allow exclusive access */
-	if (param->hwe->oa_unit->exclusive_stream) {
+	if (param->oa_unit->exclusive_stream) {
 		drm_dbg(&oa->xe->drm, "OA unit already in use\n");
 		ret = -EBUSY;
 		goto exit;
@@ -1880,9 +1897,9 @@ static u64 oa_exponent_to_ns(struct xe_gt *gt, int exponent)
 	return div_u64(nom + den - 1, den);
 }
 
-static bool engine_supports_oa_format(const struct xe_hw_engine *hwe, int type)
+static bool oa_unit_supports_oa_format(struct xe_oa_open_param *param, int type)
 {
-	switch (hwe->oa_unit->type) {
+	switch (param->oa_unit->type) {
 	case DRM_XE_OA_UNIT_TYPE_OAG:
 		return type == DRM_XE_OA_FMT_TYPE_OAG || type == DRM_XE_OA_FMT_TYPE_OAR ||
 			type == DRM_XE_OA_FMT_TYPE_OAC || type == DRM_XE_OA_FMT_TYPE_PEC;
@@ -1922,7 +1939,7 @@ static int xe_oa_assign_hwe(struct xe_oa *oa, struct xe_oa_open_param *param)
 		/* Else just get the first hwe attached to the oa unit */
 		for_each_gt(gt, oa->xe, i) {
 			for_each_hw_engine(hwe, gt, id) {
-				if (xe_oa_unit_id(hwe) == param->oa_unit_id) {
+				if (hwe->oa_unit == param->oa_unit) {
 					param->hwe = hwe;
 					goto out;
 				}
@@ -1930,10 +1947,10 @@ static int xe_oa_assign_hwe(struct xe_oa *oa, struct xe_oa_open_param *param)
 		}
 	}
 out:
-	if (!param->hwe || xe_oa_unit_id(param->hwe) != param->oa_unit_id) {
+	if (!param->hwe || param->hwe->oa_unit != param->oa_unit) {
 		drm_dbg(&oa->xe->drm, "Unable to find hwe (%d, %d) for OA unit ID %d\n",
 			param->exec_q ? param->exec_q->class : -1,
-			param->engine_instance, param->oa_unit_id);
+			param->engine_instance, param->oa_unit->oa_unit_id);
 		ret = -EINVAL;
 	}
 
@@ -2014,7 +2031,7 @@ int xe_oa_stream_open_ioctl(struct drm_device *dev, u64 data, struct drm_file *f
 
 	f = &oa->oa_formats[param.oa_format];
 	if (!param.oa_format || !f->size ||
-	    !engine_supports_oa_format(param.hwe, f->type)) {
+	    !oa_unit_supports_oa_format(&param, f->type)) {
 		drm_dbg(&oa->xe->drm, "Invalid OA format %d type %d size %d for class %d\n",
 			param.oa_format, f->type, f->size, param.hwe->class);
 		ret = -EINVAL;
diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
index 52e33c37d5ee8..a01c85931e2a5 100644
--- a/drivers/gpu/drm/xe/xe_oa_types.h
+++ b/drivers/gpu/drm/xe/xe_oa_types.h
@@ -182,6 +182,9 @@ struct xe_oa_stream {
 	/** @gt: gt associated with the oa stream */
 	struct xe_gt *gt;
 
+	/** @oa_unit: oa unit for this stream */
+	struct xe_oa_unit *oa_unit;
+
 	/** @hwe: hardware engine associated with this oa stream */
 	struct xe_hw_engine *hwe;
 
-- 
2.48.1

