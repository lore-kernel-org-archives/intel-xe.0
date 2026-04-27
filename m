Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6BC4FF8868
	for <intel-xe@archiver.kernel.org>; Mon, 27 Apr 2026 20:27:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 692E110E917;
	Mon, 27 Apr 2026 20:27:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P6YK3x5L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DF7A10E913
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Apr 2026 20:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777321621; x=1808857621;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8a1HX5TWnPh3PBpZ1v7lUCN9DV0OZiT6xfi/N5DdDSY=;
 b=P6YK3x5LqxozcglemYKfoBkjWqPw3d3IdDjQ6GtEif2CGZ9socC3eWs8
 cLv5ztH9kpH9QD69Bmrkh9VLvqWebvK2YVDFgnkxAtza8z3oFu17xEygg
 hB8GvM6BcFivI6VFGWQzvgv2LbFkGXOnYavOTwyf48Wjdwczms0N44FBO
 dWF8zoEi2qvcDQGiDAKJ2/UytDoZVfmAtpYQc9yvv/PypJmLLcL2yMoI0
 DVd9MLOlWGEtcm/Bfzr3SwHjnCCyENf6RnM3pp/REXqmEBdJab/cssgQ1
 Ju2Fb0bIz/11/b+jVyWK4u3z6VfDOUl6hj9m+j4IzqqONW464i0AjMmre w==;
X-CSE-ConnectionGUID: T5rAZy6nTaO4yC41w+ej/w==
X-CSE-MsgGUID: tiRG7p8SS2mVwE1U4fPJiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="78114620"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="78114620"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 13:27:00 -0700
X-CSE-ConnectionGUID: xChIu1HcRgyHVcuOkED93w==
X-CSE-MsgGUID: I/NqmkvITBK/0CbXWwC3HA==
X-ExtLoop1: 1
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 13:26:59 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH 3/3] drm/xe/oa: Implement Wa_14026633728
Date: Mon, 27 Apr 2026 13:26:55 -0700
Message-ID: <20260427202655.2493474-4-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260427202655.2493474-1-ashutosh.dixit@intel.com>
References: <20260427202655.2493474-1-ashutosh.dixit@intel.com>
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
index 83797c9479f7c..d905302f3f151 100644
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
@@ -893,11 +898,14 @@ static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
 
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

