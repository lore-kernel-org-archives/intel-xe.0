Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBD45CA5FA5
	for <intel-xe@archiver.kernel.org>; Tue, 29 Sep 2026 18:10:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1BB610EFEE;
	Tue, 29 Sep 2026 18:10:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PkzukCzF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6731C10EFE9
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Sep 2026 18:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790705430; x=1822241430;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=gaRqahCeA8xGL0WX/x06gIFiZxyGTaj0KxE5ituhf5c=;
 b=PkzukCzFhbLajYBZATriK0Wa2DclrMOClafBPoUwtLn4zOOLMCwOU/hR
 8VF2+T/w7RpTghh5yBJkz5C8S5ETIna4AkA70VcDFm+1FoG/blZnxHnO1
 WQsep+3MlMCNIXxfM0r96ARiaiYa7tVvMbY6vJtnEjT5nqyBGHArJpDav
 J+4wRq3muRLAEylFPBjAc5WIyAtyPv8i8cwafSKlhwlFRc9NYUg2CtF6U
 6dYIiq570M4JRKcxRHuOZ4jA3SMltnR2CXNAr44jsGxaHRIgYqQT852KD
 mG063a4CZXF9wp5DZVN4PJUQnmBYTW4b0wZzWsfS4xw+mW3nRSlN4Ec/R Q==;
X-CSE-ConnectionGUID: cX88UWDeRx+aKAkX4llIpA==
X-CSE-MsgGUID: 7NUtinmOTL6OQlKFFmAR4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="95247044"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="95247044"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 11:10:30 -0700
X-CSE-ConnectionGUID: ao7bXojRSAG9xv9nS1XDMQ==
X-CSE-MsgGUID: u/ml96nLRBa6rkfC6cW80w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="304949133"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 11:10:30 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/3] drm/xe: Add XE_BO_FLAG_SKIP_CLEAR
Date: Tue, 29 Sep 2026 11:10:22 -0700
Message-Id: <20260929181024.2743854-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260929181024.2743854-1-matthew.brost@intel.com>
References: <20260929181024.2743854-1-matthew.brost@intel.com>
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

TTM issues a GPU clear when a BO is first backed by device memory. For
BOs whose owner guarantees that every byte is either overwritten or
explicitly cleared before the contents can be observed, that clear is
pure overhead.

Add XE_BO_FLAG_SKIP_CLEAR which suppresses it. The first user is SVM
device memory, where the clear sits directly in the GPU page fault and
prefetch critical paths.

Assisted-by: Github-Copilot:Claude-opus-5
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 3 +++
 drivers/gpu/drm/xe/xe_bo.h | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 6921b6967330..351cb12ecd11 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1024,6 +1024,9 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 	needs_clear = (ttm && ttm->page_flags & TTM_TT_FLAG_ZERO_ALLOC) ||
 		(!ttm && ttm_bo->type == ttm_bo_type_device);
 
+	if (bo->flags & XE_BO_FLAG_SKIP_CLEAR)
+		needs_clear = false;
+
 	if (new_mem->mem_type == XE_PL_TT) {
 		ret = xe_tt_map_sg(xe, ttm);
 		if (ret)
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 861b1be231de..45fd6dea4fa7 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -56,6 +56,7 @@
 #define XE_BO_FLAG_FORCE_USER_VRAM	BIT(25)
 #define XE_BO_FLAG_NO_COMPRESSION	BIT(26)
 #define XE_BO_FLAG_NEEDS_1G		BIT(27)
+#define XE_BO_FLAG_SKIP_CLEAR		BIT(28)
 
 /* this one is trigger internally only */
 #define XE_BO_FLAG_INTERNAL_TEST	BIT(30)
-- 
2.34.1

