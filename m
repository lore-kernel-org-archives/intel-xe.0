Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7462F9D0CE
	for <intel-xe@archiver.kernel.org>; Wed, 15 Apr 2026 02:03:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94B7B10E158;
	Wed, 15 Apr 2026 02:03:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XwYadlFm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0551410E150
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Apr 2026 02:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776218631; x=1807754631;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9UC/RQTwJa1fF4FezaK9qJ+XlizLjET0Eyy9oDGEYfM=;
 b=XwYadlFmV3R0dq/1EOrxNx5uMZ6PDrpHxwfNjzgFlJmkW354gYYMVR9y
 9SVheHZYfmKTeRuM12gk/6SaBBkAGG83jf6Zp3GgJ7LL3XoULz6erbrHQ
 DVG8FrQexgOiVCPFxiXElNEeR8rRWU3jEX++5PNvugprZtb0YgGnxPdTQ
 C4Qetk4Ra6K/8M1xh64B2X/LOfr7DckJgcAj57IqQ6fs+5RWg1a4Z6zpZ
 oe0z2G5SEckq/MezVWr+EtblS903nXlsgYUJ8Q1uiSnXph5ECpZxo88wP
 uSexgeJCOXgNqxr80k4I3KVbu9nH2GDVykh03o5dGJT+7mdrfGQhe2VaG w==;
X-CSE-ConnectionGUID: YO+GhrsjRA2oZ8t5sr6ozg==
X-CSE-MsgGUID: lzhYTfrVTXeEIsJyWt/EEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="79773445"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="79773445"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 19:03:50 -0700
X-CSE-ConnectionGUID: Q3d54ROrRzuJ4NE7QTEF/w==
X-CSE-MsgGUID: 9pZe4uKHTBCM7jTSYCXpNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="235200883"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 19:03:50 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH 3/3] drm/xe/oa: Implement Wa_14026633728
Date: Tue, 14 Apr 2026 19:03:42 -0700
Message-ID: <20260415020342.782987-4-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260415020342.782987-1-ashutosh.dixit@intel.com>
References: <20260415020342.782987-1-ashutosh.dixit@intel.com>
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
index 5b8a9bd26770c..6516e933b865c 100644
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
2.48.1

