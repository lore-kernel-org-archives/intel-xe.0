Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AFF4FF8864
	for <intel-xe@archiver.kernel.org>; Mon, 27 Apr 2026 22:11:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FDA110E96D;
	Mon, 27 Apr 2026 22:11:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XlwK6wsO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADBA110E967
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Apr 2026 22:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777327897; x=1808863897;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=CtB3x+zmKSjD8qiW5fRCLCxCLXqLg46gBzmgKDsCjFI=;
 b=XlwK6wsO0jMZAjhnBWF2BkZiGKa5iXFH6B+m6B/MnS/7E7J3Dp8XiAEz
 BNJ9DFYezWQwQwD406mO8WIgjTom9hMFhmhmOu9SslaWMtDlBF8BngFBb
 29+HEpImn5VgUyKCxPBXLVw3NxlF9SjBvkeVq8/gNegIFiDOPmqJtu83V
 8glGjTUDTNDct6fooKF7RZDWrlyZlazLDh8lW+5komDsjlnTMzgkUdIRf
 wNBpyDYIU6MCAtdtdpUsr5TdevT1IziFLKbQtfRNjgEGo53yA85qlrwf3
 L+Vvs/ttl4tUXRFo+MQ7UKdz6IeIUkJz2VQxLEjZkxvA7B6HZp57jG9HR g==;
X-CSE-ConnectionGUID: HbLGDld0Qyy1CxJ6HMiyYw==
X-CSE-MsgGUID: aClgTpO/QJuLbULRUnwHOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="89607639"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="89607639"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 15:11:37 -0700
X-CSE-ConnectionGUID: n/MHQXtzTe2QX5G6XY6L5g==
X-CSE-MsgGUID: xLVYJdP/RTyXkhHPw7bVRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="257076311"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 15:11:37 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 3/3] drm/xe/oa: Implement Wa_14026633728
Date: Mon, 27 Apr 2026 15:11:33 -0700
Message-ID: <20260427221133.2500532-4-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260427221133.2500532-1-ashutosh.dixit@intel.com>
References: <20260427221133.2500532-1-ashutosh.dixit@intel.com>
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

v2: Move WA to xe_device_wa_oob.rules and use XE_DEVICE_WA() (Matt Roper)

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_device_wa_oob.rules |  1 +
 drivers/gpu/drm/xe/xe_oa.c                | 11 ++++++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device_wa_oob.rules b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
index d129cddb6ead4..92371c4905290 100644
--- a/drivers/gpu/drm/xe/xe_device_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
@@ -4,3 +4,4 @@
 22019338487_display	PLATFORM(LUNARLAKE)
 14022085890	SUBPLATFORM(BATTLEMAGE, G21)
 14026539277	PLATFORM(NOVALAKE_P), PLATFORM_STEP(A0, B0)
+14026633728	PLATFORM(CRESCENTISLAND)
diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 83797c9479f7c..5de5bf19240a2 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -15,6 +15,7 @@
 #include <uapi/drm/xe_drm.h>
 
 #include <generated/xe_wa_oob.h>
+#include <generated/xe_device_wa_oob.h>
 
 #include "abi/guc_actions_slpc_abi.h"
 #include "instructions/xe_mi_commands.h"
@@ -250,6 +251,11 @@ static void oa_timestamp_clear(struct xe_oa_stream *stream, u32 report_offset)
 		xe_map_wr(stream->oa->xe, map, report_offset + 4, u32, 0);
 }
 
+static bool mert_wa_14026633728(struct xe_oa_stream *s)
+{
+	return s->oa_unit->type == DRM_XE_OA_UNIT_TYPE_MERT && XE_DEVICE_WA(s->oa->xe, 14026633728);
+}
+
 static bool xe_oa_buffer_check_unlocked(struct xe_oa_stream *stream)
 {
 	u32 gtt_offset = xe_bo_ggtt_addr(stream->oa_buffer.bo);
@@ -893,11 +899,14 @@ static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
 
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
 
-- 
2.54.0

