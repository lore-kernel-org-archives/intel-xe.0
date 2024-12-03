Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD7AE6C5EA
	for <intel-xe@archiver.kernel.org>; Tue,  3 Dec 2024 02:07:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41B8A10E21E;
	Tue,  3 Dec 2024 02:07:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D0CYW3K4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3663F10E21E
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Dec 2024 02:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733191678; x=1764727678;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OaPjq3XKnN6AGcub5rSwTQVsqkjUyBFlCboaj2JDoWs=;
 b=D0CYW3K4FOWnUuHXBEAI8w7du8qxpta/vdin8m24vwPfAN/9A81oVVQY
 GtWEq1HGr7cyAt5hgW2+aOGsJw72IH/jELIyjT4ilJb0rrjzUC2xaeulG
 pvYcz9ML3j6L5IBGUuQzkeHWUdM+Jo2CqWHGpSmw8bmYkEdEQLtKRE0e7
 +0VRVGlDO5H0/XKqrxtkbzCbDn1ALCZDgPkq8K6cveWxDua0/bWN6q7sZ
 n4vg2tCgvZmIoBwpzzKEiRqjzLEItx7L4mtv/MWVoygo8qC/8BV3qoQTy
 Y1e5ArdPruGVOoMN0seN2Q4o66j03YXiPJd8n1C6hHeNjIO7iXPyotItm g==;
X-CSE-ConnectionGUID: qaUpQOcJSEeJIgzGd0TuUQ==
X-CSE-MsgGUID: MbYOT7P5Tzy44mxCo4As8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="44419780"
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; d="scan'208";a="44419780"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 18:07:58 -0800
X-CSE-ConnectionGUID: JbT/ps2fRCeoEnwI+/i9Bw==
X-CSE-MsgGUID: SaZnI+7CTaCKRZcGQUgUOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="98301813"
Received: from szeng-desk.jf.intel.com ([10.165.21.160])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 18:07:58 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Thomas.Hellstrom@linux.intel.com
Subject: [PATCH] drm/xe: Trace xe_bo_validate
Date: Mon,  2 Dec 2024 21:21:40 -0500
Message-Id: <20241203022140.1919922-1-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
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

Add a tracepoint for xe_bo_validate function. I found this is
useful during debug issues.

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c       | 1 +
 drivers/gpu/drm/xe/xe_trace_bo.h | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index bdac446bf8c06..3448ede2befa6 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2004,6 +2004,7 @@ int xe_bo_validate(struct xe_bo *bo, struct xe_vm *vm, bool allow_res_evict)
 		ctx.resv = xe_vm_resv(vm);
 	}
 
+	trace_xe_bo_validate(bo);
 	return ttm_bo_validate(&bo->ttm, &bo->placement, &ctx);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_trace_bo.h b/drivers/gpu/drm/xe/xe_trace_bo.h
index c6d3140542cff..e393a2dd83dbe 100644
--- a/drivers/gpu/drm/xe/xe_trace_bo.h
+++ b/drivers/gpu/drm/xe/xe_trace_bo.h
@@ -53,6 +53,11 @@ DEFINE_EVENT(xe_bo, xe_bo_create,
 	     TP_ARGS(bo)
 );
 
+DEFINE_EVENT(xe_bo, xe_bo_validate,
+	     TP_PROTO(struct xe_bo *bo),
+	     TP_ARGS(bo)
+);
+
 TRACE_EVENT(xe_bo_move,
 	    TP_PROTO(struct xe_bo *bo, uint32_t new_placement, uint32_t old_placement,
 		     bool move_lacks_source),
-- 
2.26.3

