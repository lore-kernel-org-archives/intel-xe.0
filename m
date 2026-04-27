Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8864FF886C
	for <intel-xe@archiver.kernel.org>; Mon, 27 Apr 2026 19:02:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAFAD10E8F3;
	Mon, 27 Apr 2026 19:02:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yip9D1ns";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F34410E8E8
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Apr 2026 19:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777316548; x=1808852548;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mjDgUtG6Mv/RdI4CFzkWTmLDYio7nuLFP5pAly6050g=;
 b=Yip9D1nscbsJblvuq1Z1y7JJFM5BmgemMoMuEDh57FX1ZqnFEWG9PbnW
 iGXG1LZ24xYTJ9POkEz7q/vMfq63m/bPqysB9mYAQJ8z6Dj0j8AFdWYUb
 HzyLJQsVnky9lPNqGVtLDHtSUNbAHpKmivBh4uLqaYl3agzlmOthx7NdE
 q/PNPT6YXeNeepQIigo8pSPEDlj+wTEAhZthLFN0CFwgC1h3itvQgQXho
 t5ZkK7v2AXvU9eyWO+bdXrb0yLS86B7FFIaHctje14vdth9hnxkW8DyVb
 PJnCiye0jW5+SuuEUql8QrO8tx4mkwGH5uAi8SyjyBIV2zzgtEChkHhBp g==;
X-CSE-ConnectionGUID: IjR0a34uQTqRqawhLgXJGQ==
X-CSE-MsgGUID: X3d4H8dsRZKUV9X1JMHanw==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="78108219"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="78108219"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 12:02:28 -0700
X-CSE-ConnectionGUID: Sn5D4/bKRhqJEx56VUDbAg==
X-CSE-MsgGUID: 1P2U3g08QKScpeD2hvOSTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="232723311"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 12:02:28 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH 3/3] drm/xe/oa: Implement Wa_14026633728
Date: Mon, 27 Apr 2026 12:02:23 -0700
Message-ID: <20260427190223.2487665-4-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260427190223.2487665-1-ashutosh.dixit@intel.com>
References: <20260427190223.2487665-1-ashutosh.dixit@intel.com>
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

CRI Wa_14026633728 requires MERTOA buffer to be allocated in device memory,
not system memory (which is the default for OA buffers).

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c         | 10 +++++++++-
 drivers/gpu/drm/xe/xe_wa_oob.rules |  1 +
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index d3994ae8bc82d..b988b02c661c7 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -250,6 +250,11 @@ static void oa_timestamp_clear(struct xe_oa_stream *stream, u32 report_offset)
 		xe_map_wr(stream->oa->xe, map, report_offset + 4, u32, 0);
 }
 
+static bool mert_wa_14026633728(struct xe_oa_stream *s)
+{
+	return s->oa_unit->type == DRM_XE_OA_UNIT_TYPE_MERT && XE_GT_WA(s->gt, 14026633728);
+}
+
 static bool xe_oa_buffer_check_unlocked(struct xe_oa_stream *stream)
 {
 	u32 gtt_offset = xe_bo_ggtt_addr(stream->oa_buffer.bo);
@@ -891,11 +896,14 @@ static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
 
 static int xe_oa_alloc_oa_buffer(struct xe_oa_stream *stream, size_t size)
 {
+	u32 vram = mert_wa_14026633728(stream) ?
+		XE_BO_FLAG_VRAM_IF_DGFX(xe_device_get_root_tile(stream->oa->xe)) :
+		XE_BO_FLAG_SYSTEM;
 	struct xe_bo *bo;
 
 	bo = xe_bo_create_pin_map_novm(stream->oa->xe, stream->gt->tile,
 				       size, ttm_bo_type_kernel,
-				       XE_BO_FLAG_SYSTEM | XE_BO_FLAG_GGTT, false);
+				       vram | XE_BO_FLAG_GGTT, false);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index f8a185103b805..a7c1bd9bcb943 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -65,3 +65,4 @@
 
 14025883347	MEDIA_VERSION_RANGE(1301, 3503)
 		GRAPHICS_VERSION_RANGE(2004, 3005)
+14026633728	PLATFORM(CRESCENTISLAND)
-- 
2.54.0

