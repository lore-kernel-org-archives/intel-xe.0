Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBF3AFF8850
	for <intel-xe@archiver.kernel.org>; Sat, 25 Apr 2026 00:14:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87E0710F715;
	Sat, 25 Apr 2026 00:14:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OgmDAJEu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D17B10F714
 for <intel-xe@lists.freedesktop.org>; Sat, 25 Apr 2026 00:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777076085; x=1808612085;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OHUax/OFfCCj/D7GQvj6taIVdYspEHXZ49FjOBAqHog=;
 b=OgmDAJEuQ2vL3LGorAGHn9dAYnI9zapzp3NGlwE01R8Zo68DnDgJCwgI
 pU8S7AFaY/17M2/o2crR/WK5urF5g67lu560L1AxgM9jHQNQbNwGOl4H0
 7trXx21FlN4N2aEXXFS5rgIJb2FaqRKdtBkjRXh8EKPDpQvpaEPC/w5wc
 EjTd+pUyLnC4vhdF3bSvqAT8lkvcMLzFytd3fVFkl0frYnfzf+3lmib4w
 YaT2XH3Ovi/Tq+I0Gg9DstJQYHUV1wBlZiwXA2Q6HRW8J9s7wqmDVFOec
 l8dW3psfQooH3p+VU52j1upV89B8L40FuLZp6QizyliBE4qhwNF8Znljy w==;
X-CSE-ConnectionGUID: wNvgF5ADTp6mqTM9J/lAtA==
X-CSE-MsgGUID: /Bg0sYkaQbi7ltuMBYiRHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11766"; a="78081511"
X-IronPort-AV: E=Sophos;i="6.23,197,1770624000"; d="scan'208";a="78081511"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 17:14:44 -0700
X-CSE-ConnectionGUID: nxMEsrY8RdyO40/nDIVYVQ==
X-CSE-MsgGUID: 2sJH/kfuRgK+qDnGimvHdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,197,1770624000"; d="scan'208";a="238156010"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 17:14:44 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH 3/3] drm/xe/oa: Implement Wa_14026633728
Date: Fri, 24 Apr 2026 17:14:39 -0700
Message-ID: <20260425001439.2148765-4-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260425001439.2148765-1-ashutosh.dixit@intel.com>
References: <20260425001439.2148765-1-ashutosh.dixit@intel.com>
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
index 5ccf63c807920..2a9b0d9884237 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -250,6 +250,11 @@ static void oa_timestamp_clear(struct xe_oa_stream *stream, u32 head)
 		xe_map_wr(stream->oa->xe, map, head + 4, u32, 0);
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

