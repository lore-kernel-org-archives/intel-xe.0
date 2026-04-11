Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D95A2F45A15
	for <intel-xe@archiver.kernel.org>; Sat, 11 Apr 2026 00:48:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B98110E176;
	Sat, 11 Apr 2026 00:48:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rxg5wx6l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C784210E173
 for <intel-xe@lists.freedesktop.org>; Sat, 11 Apr 2026 00:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775868498; x=1807404498;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tdts2hY0bxhLa54FVwHLGaYBPOcP8ZWe3/AUWKAh93A=;
 b=Rxg5wx6lNX9arRRjcgaDcJh5wwfNeRgh9d+9+0MYc3U+gSJpsRcXTUXg
 VIFFBhFzt7Xn6tTl0r6NVAma2cEDFMQiPcdN4z0ma0Razv4RNob/yoREg
 QsaUlL4/6h4cv7LP01/qXxIMtRsbSI9WBwNU1hAnUpUK1BqBCTqsosGwe
 xrXYTK4vbh+TDDJ2QAFW3FL6TBdaP+SU831kdCzvVwXlkDZzLBDqeoXdJ
 lYlYyZ0eknFVLj1IeqxBo2Gehtqx68KwE13CqlJ6IWVL6XmquvVndoDoN
 XVo9SG0vYPhfezgXP3n/RwggRSz2b9QiivIG0V8qhS6LMDkT784z0bPBL g==;
X-CSE-ConnectionGUID: gL8SQBlNQGy28LfS0IspQQ==
X-CSE-MsgGUID: n6I6mxw5S92Zn4MJQ9leuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="87522103"
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; d="scan'208";a="87522103"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 17:48:18 -0700
X-CSE-ConnectionGUID: D0CYoV0yRwuwU1TSDhXHog==
X-CSE-MsgGUID: 1gWVNDqlStueMdXCoJMYeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; d="scan'208";a="226079400"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 17:48:17 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH 3/3] drm/xe/oa: Implement Wa_14026633728
Date: Fri, 10 Apr 2026 17:48:09 -0700
Message-ID: <20260411004809.570098-4-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260411004809.570098-1-ashutosh.dixit@intel.com>
References: <20260411004809.570098-1-ashutosh.dixit@intel.com>
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
index 7ada6e2a0d955..7610b2d744066 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -250,6 +250,11 @@ static void oa_timestamp_clear(struct xe_oa_stream *stream, u32 head)
 		xe_map_wr(stream->oa->xe, map, head + 1, u32, 0);
 }
 
+static bool mert_wa_14026633728(struct xe_oa_stream *s)
+{
+	return s->oa_unit->type == DRM_XE_OA_UNIT_TYPE_MERT && XE_GT_WA(s->gt, 14026633728);
+}
+
 static bool xe_oa_buffer_check_unlocked(struct xe_oa_stream *stream)
 {
 	u32 gtt_offset = xe_bo_ggtt_addr(stream->oa_buffer.bo);
@@ -884,11 +889,14 @@ static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
 
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
2.48.1

