Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81B44D65521
	for <intel-xe@archiver.kernel.org>; Tue, 26 Nov 2024 16:44:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 559B710E953;
	Tue, 26 Nov 2024 16:44:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J2XEdkBx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24CBB10E953
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Nov 2024 16:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732639440; x=1764175440;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VzK+rsf7W1di9cUDxJ5D5COYqbXRDTc2XNlJFvr4vMo=;
 b=J2XEdkBxCFCqqIox410nvblM1Xjc7UB2v5ynlrYMX40te/GSHV0q3uvZ
 s3ejcQ1u6Q+Jl1zdyYfUeXAoQYNyepaPBIPMU5YLZ/p4y9pW9dPcCOPPE
 1tTj/Ybr5zml8T837GFiqoYsI9n/wJ2p20rFGrwd06+9qqk8aV3mz41ID
 GwqTqevJWnbNpDoR5UG4p8vs6njLYlc9jQSCeDjA7huM7PZyTTqGf1gbA
 GrklcOC+35TVLkuRvLl/Q7IvBEIzR8Quo6zo3F8fB1W75ImzAgU9gTM34
 N0ktY+962pSkzr70C52s4vABhE0najTCjilg5Ku4IvHQGlXT6zVinVeyf A==;
X-CSE-ConnectionGUID: kIKgn3foQ+ipUHqfFRSeng==
X-CSE-MsgGUID: JnyncqJJTcabjuFfRs35qQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="43307144"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="43307144"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 08:44:00 -0800
X-CSE-ConnectionGUID: 2K5/nHIORJSXpEa4P+2oxg==
X-CSE-MsgGUID: 3/T3fZ/wSBu8+E3oZ93Q3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="122512876"
Received: from spottumu-desk.iind.intel.com ([10.145.152.200])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 08:43:58 -0800
From: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com,
	sai.teja.pottumuttu@intel.com
Subject: [PATCH v2 3/3] drm/xe/oa: Remove all the instances of hardcoded OA
 buffer size
Date: Tue, 26 Nov 2024 22:05:53 +0530
Message-Id: <20241126163553.449850-4-sai.teja.pottumuttu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241126163553.449850-1-sai.teja.pottumuttu@intel.com>
References: <20241126163553.449850-1-sai.teja.pottumuttu@intel.com>
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

Remove all the instances of hardcoded OA buffer size and use the
size coming from the new parameter and stream's oa buffer size at
the required places.

Signed-off-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c       | 9 +++------
 drivers/gpu/drm/xe/xe_oa_types.h | 2 +-
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 7e5da7fef6ad..6db09a20f2e1 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -915,8 +915,6 @@ static int xe_oa_alloc_oa_buffer(struct xe_oa_stream *stream, size_t size)
 {
 	struct xe_bo *bo;
 
-	BUILD_BUG_ON_NOT_POWER_OF_2(XE_OA_BUFFER_SIZE);
-
 	bo = xe_bo_create_pin_map(stream->oa->xe, stream->gt->tile, NULL,
 				  size, ttm_bo_type_kernel,
 				  XE_BO_FLAG_SYSTEM | XE_BO_FLAG_GGTT);
@@ -1098,7 +1096,6 @@ static u32 oag_report_ctx_switches(const struct xe_oa_stream *stream)
 
 static u32 oag_buf_size_select(const struct xe_oa_stream *stream)
 {
-	BUILD_BUG_ON(XE_OA_BUFFER_SIZE != SZ_16M && XE_OA_BUFFER_SIZE != SZ_128M);
 	return _MASKED_FIELD(OAG_OA_DEBUG_BUF_SIZE_SELECT,
 			     (stream->oa_buffer.bo->size > SZ_16M) ?
 			     OAG_OA_DEBUG_BUF_SIZE_SELECT : 0);
@@ -1584,7 +1581,7 @@ static long xe_oa_status_locked(struct xe_oa_stream *stream, unsigned long arg)
 
 static long xe_oa_info_locked(struct xe_oa_stream *stream, unsigned long arg)
 {
-	struct drm_xe_oa_stream_info info = { .oa_buf_size = XE_OA_BUFFER_SIZE, };
+	struct drm_xe_oa_stream_info info = { .oa_buf_size = stream->oa_buffer.bo->size, };
 	void __user *uaddr = (void __user *)arg;
 
 	if (copy_to_user(uaddr, &info, sizeof(info)))
@@ -1670,7 +1667,7 @@ static int xe_oa_mmap(struct file *file, struct vm_area_struct *vma)
 	}
 
 	/* Can mmap the entire OA buffer or nothing (no partial OA buffer mmaps) */
-	if (vma->vm_end - vma->vm_start != XE_OA_BUFFER_SIZE) {
+	if (vma->vm_end - vma->vm_start != stream->oa_buffer.bo->size) {
 		drm_dbg(&stream->oa->xe->drm, "Wrong mmap size, must be OA buffer size\n");
 		return -EINVAL;
 	}
@@ -2159,7 +2156,7 @@ int xe_oa_stream_open_ioctl(struct drm_device *dev, u64 data, struct drm_file *f
 
 	if (!param.oa_buffer_size) {
 		/* If the oa buffer size is not provided, default to 16MB*/
-		param.oa_buffer_size = XE_OA_BUFFER_SIZE;
+		param.oa_buffer_size = DEFAULT_XE_OA_BUFFER_SIZE;
 	}
 
 	ret = xe_oa_parse_syncs(oa, &param);
diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
index fea9d981e414..df7793915628 100644
--- a/drivers/gpu/drm/xe/xe_oa_types.h
+++ b/drivers/gpu/drm/xe/xe_oa_types.h
@@ -15,7 +15,7 @@
 #include "regs/xe_reg_defs.h"
 #include "xe_hw_engine_types.h"
 
-#define XE_OA_BUFFER_SIZE SZ_16M
+#define DEFAULT_XE_OA_BUFFER_SIZE SZ_16M
 
 enum xe_oa_report_header {
 	HDR_32_BIT = 0,
-- 
2.34.1

