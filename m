Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA2CBC67861
	for <intel-xe@archiver.kernel.org>; Fri,  5 Apr 2024 15:38:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A72410E2E4;
	Fri,  5 Apr 2024 15:38:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CbuE3dxD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 087C310E2E4
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Apr 2024 15:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712331538; x=1743867538;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9VHFiPNk3vDW7ekU8tUavhuhOxJJA08LbYJEu/ObCtA=;
 b=CbuE3dxDb+aWX6UaoMla5rRCUvqlB9JFqwLvUo1wPqXy279/KPGL2SPR
 kZyBYrVgwa/itXv1hTMRdVl1mH+1bFdU/S7I1ica2cpoidt1j7L93rP6C
 HapmhhWLiASv4wbkBFZeYp+xGMHHIBb5sRwELdlzRjauy1eh5udiBbj8G
 foNUzzr06MYKjC8slvi44XST+3jfM6xnfh7Rcg1OkHCs4DLyHMGDvD94F
 Lifs6DPdfbPJsjRrcFQlR3hGr45cbnIYju69eXD/nfMEIe/crKONlW7/Y
 HuVDXtSvaRC5h+j8AqRTeUUTfWM2Xd3DPb+6C5WHvcaBGTzT1g52VrIiC g==;
X-CSE-ConnectionGUID: rIurfUI5SkqgcMglRAXpYA==
X-CSE-MsgGUID: e693+QQpQgOMEmP0SLvUQg==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="25106836"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; d="scan'208";a="25106836"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 08:38:56 -0700
X-CSE-ConnectionGUID: UxDyKRwmTueDiAzD6pMraA==
X-CSE-MsgGUID: J5MsFY1ORMuGPO+dvO6CTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; d="scan'208";a="23680395"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 08:38:55 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH] drm/xe: Remove debug message from migrate_clear()
Date: Fri,  5 Apr 2024 08:38:49 -0700
Message-ID: <20240405153849.44906-1-jose.souza@intel.com>
X-Mailer: git-send-email 2.44.0
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

This messages is printed a lot and from my understanding it do not
bring any value, so here dropping it.

Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 524b0198fcae3..2e37cbe35d16e 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -984,7 +984,6 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 	struct xe_res_cursor src_it;
 	struct ttm_resource *src = dst;
 	int err;
-	int pass = 0;
 
 	if (!clear_vram)
 		xe_res_first_sg(xe_bo_sg(bo), 0, bo->size, &src_it);
@@ -1005,8 +1004,6 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 
 		clear_L0 = xe_migrate_res_sizes(m, &src_it);
 
-		drm_dbg(&xe->drm, "Pass %u, size: %llu\n", pass++, clear_L0);
-
 		/* Calculate final sizes and batch size.. */
 		batch_size = 2 +
 			pte_update_size(m, clear_vram, src, &src_it,
-- 
2.44.0

