Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE27CEDA685
	for <intel-xe@archiver.kernel.org>; Tue,  3 Mar 2026 15:21:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DC9E10E837;
	Tue,  3 Mar 2026 15:21:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gq97st6Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FD4710E83D
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Mar 2026 15:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772551263; x=1804087263;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AHyu60de/EDcQB8/Hj48bl0LnGEtc38ZN0/60VACUXE=;
 b=gq97st6ZHHzOBzI6B20DcqQEAcvM6Y+dl402hMcz/FCgu5YpnvZZ+tBW
 uVp5L3qicWJB5JiRcEIWLJJ1J2fP4YNsCSJjyMRfgW1uSiH1HknCL/6qF
 qnjw8N5QGzUZBwGmi5LpRsnwrJpQR1QDfUlwrjS8n9+dR/SNqOfVTjfQC
 vJHbRL4eVZedtSsxvu/rJG/DpFevQ/PbIyU7JJk/meBYte9bbFi/FXJuS
 EHwutIUaR8kXVFhF2YtRTwBLqQC2nA4R37yyomhZ5h7C0OcZrXeQaatFA
 JtXzmWuYTEa39mQr+aq2TKVeOQkUnGyUDhG5ZP4/F4kdhGtWavClNUcrR A==;
X-CSE-ConnectionGUID: +GwEQ1muT8qYdpzdZFXHdw==
X-CSE-MsgGUID: 31tJUM3zSyi8p8jXrhbmsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="73656006"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="73656006"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 07:21:03 -0800
X-CSE-ConnectionGUID: KHhnq+LYRKyrWfYtpaGojg==
X-CSE-MsgGUID: WTYruQ0ZR8uiGXeyhBgCeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="222507009"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 07:21:02 -0800
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com, pallavi.mishra@intel.com
Subject: [PATCH v6 12/12] drm/xe/bo: Skip zero-refcount BOs in shrinker
Date: Tue,  3 Mar 2026 20:50:08 +0530
Message-ID: <20260303152015.3499248-13-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260303152015.3499248-1-arvind.yadav@intel.com>
References: <20260303152015.3499248-1-arvind.yadav@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Zero-refcount BOs are being destroyed. Skip them in the shrinker
to avoid racing with cleanup by returning -EBUSY.

Ghost BOs from ttm_bo_pipeline_gutting() still hold reclaimable
pages, so continue processing them via xe_bo_shrink_purge().

Fixes: 00c8efc3180f ("drm/xe: Add a shrinker for xe bos")

v6:
  - Split from patch 0010 (Thomas)

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 598d4463baf3..07acce383cb1 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1295,9 +1295,13 @@ long xe_bo_shrink(struct ttm_operation_ctx *ctx, struct ttm_buffer_object *bo,
 	if (!xe_bo_eviction_valuable(bo, &place))
 		return -EBUSY;
 
-	if (!xe_bo_is_xe_bo(bo) || !xe_bo_get_unless_zero(xe_bo))
+	/* Ghost BOs still hold reclaimable pages, try to shrink them. */
+	if (!xe_bo_is_xe_bo(bo))
 		return xe_bo_shrink_purge(ctx, bo, scanned);
 
+	if (!xe_bo_get_unless_zero(xe_bo))
+		return -EBUSY;
+
 	if (xe_tt->purgeable) {
 		if (bo->resource->mem_type != XE_PL_SYSTEM)
 			lret = xe_bo_move_notify(xe_bo, ctx);
-- 
2.43.0

