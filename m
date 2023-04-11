Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 785D2C77B61
	for <intel-xe@archiver.kernel.org>; Tue, 11 Apr 2023 00:31:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F3BE10E452;
	Tue, 11 Apr 2023 00:31:06 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 874A410E452
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Apr 2023 00:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681173064; x=1712709064;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6veAcFzKrBx7xgZGmYvi6o2GR60CvFit3qITLSlzJRs=;
 b=USWuo2f08jO+160tsVHaprvmyUvNEjv4SYpOnx2YVIFAHiDEsor2/UlJ
 5uEJZ5U395mRymufJavFuv/gzKseTsDI2upARlhnfqBhPpO+2f/ZWxuxJ
 R2PoC62z91k3RwB/55QD4ZKAtXVeZNVVgsdafDxbGXZjOB3GiYBoZPaIu
 QqvS1SL0a+uApZm4PbA6Ip9h0mhBxiURcwlxoGRQKL1gkfpYmZzQXuB4n
 JWp308QY7EnaWlQtILs4tPWwQdgiao8eD4b1IR/gbB+3+nVYmLlx3tR0w
 7XDJf1hMUNox+JbZ98DYtaexy9PYaQmnLd7VQhtTxba4o+g1lDbyj6QTt w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="323123247"
X-IronPort-AV: E=Sophos;i="5.98,335,1673942400"; d="scan'208";a="323123247"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2023 17:31:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="681885403"
X-IronPort-AV: E=Sophos;i="5.98,335,1673942400"; d="scan'208";a="681885403"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2023 17:31:03 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 10 Apr 2023 17:27:59 -0700
Message-Id: <20230411002800.2779322-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Invalidate media GT TLB for objects
 mapped by media GT
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Xe is still lacking some general infrastructure to handle GGTT TLB
invalidation properly for platforms like MTL where multiple GTs share a
single GGTT.  As a temporary bandaid while that infrastructure is
missing, make xe_ggtt_map_bo invalidate on bo->gt rather than ggtt->gt.
This allows MTL's driver initialization to make some forward progress
since using ggtt->gt (which is always the primary GT) results in driver
timeouts while setting up the HWSP for hardware engines on the media GT.

A proper solution here will likely involve invalidating the TLBs of both
GTs rather than just one (gitlab issue #220); this is just a temporary
hack for now to help unblock other MTL-related driver work.

Reference: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/220
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 0ae373b604f6..11461c02a831 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -271,7 +271,13 @@ void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 		xe_ggtt_set_pte(ggtt, start + offset, pte);
 	}
 
-	xe_ggtt_invalidate(ggtt->gt);
+	/*
+	 * FIXME:  Multiple GTs can share a single GGTT on platforms like
+	 * MTL, so simply invalidating a single GT's TLB isn't really correct.
+	 * We really need more extensive changes to invalidate all appropriate
+	 * GTs rather than just one.
+	 */
+	xe_ggtt_invalidate(bo->gt);
 }
 
 static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
-- 
2.39.2

