Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3F31C4345F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Apr 2024 15:03:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61D9D10EC3F;
	Fri, 12 Apr 2024 15:03:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J7VQQSt1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ACB310EC3F
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Apr 2024 15:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712934209; x=1744470209;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8GYn8CRCFP/5gCN7LMPoico2Emp3ryfxztrr7PRrzX8=;
 b=J7VQQSt1Y9I5T/Nb15D+oIU1r0iF82IE+76WA29UqcFVz7s+/co+jhyb
 M1tyIWcwehMk9n2zPJY1MMpIg6F4N986+bZNkb9eXukYs268gCtfOtZc8
 wIpj4UQzSODU0wHJrYt6z4+3/Ljvk2Ls1kn7G0bPa79tIXjUudDXH76Eb
 c+voCYosCYnCaokZtmCRfkT+KdGQsWrLyvqaHW5DrRyc7rbH1WwlDS8aM
 aRIkEcwH8T4MKloUbxUnUbqrw2/dglA8m1y2x3X8ib64HnMedzD3jYVhX
 RmiELhaliIngzZAbDSopVQV+FsuULysJ4U+FvQJX6OcYLFovujjZFL5Q+ w==;
X-CSE-ConnectionGUID: Dxj2ZQq6RxOapjECVEBoJw==
X-CSE-MsgGUID: I2JT9ZghQpqUnltaRxEiMw==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="8947081"
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; 
   d="scan'208";a="8947081"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 08:03:28 -0700
X-CSE-ConnectionGUID: gmiMsPm5SduX1MCyZWwxxA==
X-CSE-MsgGUID: aWmQihSoQ0uIYMnQy5/GDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; d="scan'208";a="21821748"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.44])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 08:03:28 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH 1/2] drm/xe/stolen: lower the default alignment
Date: Fri, 12 Apr 2024 16:03:02 +0100
Message-ID: <20240412150301.273344-3-matthew.auld@intel.com>
X-Mailer: git-send-email 2.44.0
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

No need to be so aggressive here. The upper layers will already apply
the needed alignment, plus some allocations might wish to skip it. Main
issue is that we might want to have start/end bias range which doesn't
match the default alignment which is rejected by the allocator.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
index 6ffecf9f23d1..f77367329760 100644
--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
@@ -204,7 +204,7 @@ void xe_ttm_stolen_mgr_init(struct xe_device *xe)
 {
 	struct xe_ttm_stolen_mgr *mgr = drmm_kzalloc(&xe->drm, sizeof(*mgr), GFP_KERNEL);
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
-	u64 stolen_size, io_size, pgsize;
+	u64 stolen_size, io_size;
 	int err;
 
 	if (!mgr) {
@@ -226,10 +226,6 @@ void xe_ttm_stolen_mgr_init(struct xe_device *xe)
 		return;
 	}
 
-	pgsize = xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
-	if (pgsize < PAGE_SIZE)
-		pgsize = PAGE_SIZE;
-
 	/*
 	 * We don't try to attempt partial visible support for stolen vram,
 	 * since stolen is always at the end of vram, and the BAR size is pretty
@@ -240,7 +236,7 @@ void xe_ttm_stolen_mgr_init(struct xe_device *xe)
 		io_size = stolen_size;
 
 	err = __xe_ttm_vram_mgr_init(xe, &mgr->base, XE_PL_STOLEN, stolen_size,
-				     io_size, pgsize);
+				     io_size, PAGE_SIZE);
 	if (err) {
 		drm_dbg_kms(&xe->drm, "Stolen mgr init failed: %i\n", err);
 		return;
-- 
2.44.0

