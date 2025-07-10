Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F04EC83F17
	for <intel-xe@archiver.kernel.org>; Thu, 10 Jul 2025 13:41:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1BB510E10A;
	Thu, 10 Jul 2025 13:41:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AWWUWC46";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 850C610E10A
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Jul 2025 13:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752154906; x=1783690906;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UYDaq2EoqmaQLn5ihi3N2lhHrF5UudWwSkKhWtGhOUI=;
 b=AWWUWC46WMG9MuqlLltXAe67VdRJbNNTh2/AWr3HLwE/SHlMdoVOobdo
 WMzDWru8zCOMnXX9khr3N4Mf0IULiliMNk4DnFnuBcFXJgza6LZ9lKbjU
 cKmcEx9dcanwXSqKGx3uFU0JeQ/PosYKquLGKI1R2HOLhjuCiSOnl30rA
 XkFu7eowSpud6ljbB6bwasMlKC1M6/nluVIUxwYBJny4FRD0JAsYs/18L
 GXDxtsPAM9YHW87MKoSeNZAu1/eQ0sc891bCTXqbAChOGssTZehQjlDKQ
 Owk6Mjkf3DilD6Y3mo6mMA47/4hvxfjdrpYko4/haYIjbar+hrG/cF0vO g==;
X-CSE-ConnectionGUID: Q69CjkeyS0y1MfvAFA+kew==
X-CSE-MsgGUID: IqBiyWhzQ7qeuD9n2aPoLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="79871886"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="79871886"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 06:41:46 -0700
X-CSE-ConnectionGUID: aN2DL2nBRVe7tD+f/Qm06A==
X-CSE-MsgGUID: U04IurL8TKSFX2Ur/vOtQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="160383725"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.129])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 06:41:45 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe/migrate: fix copy direction in access_memory
Date: Thu, 10 Jul 2025 14:41:29 +0100
Message-ID: <20250710134128.800756-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.50.0
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

After we do the modification on the host side, ensure we write the
result back to VRAM and not the other way around, otherwise the
modification will be lost if treated like a read.

Fixes: 270172f64b11 ("drm/xe: Update xe_ttm_access_memory to use GPU for non-visible access")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 4e2bdf70eb70..2adf95d35c31 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1848,7 +1848,7 @@ int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
 				err = xe_migrate_access_memory(m, bo,
 							       offset & ~XE_CACHELINE_MASK,
 							       (void *)ptr,
-							       sizeof(bounce), 0);
+							       sizeof(bounce), write);
 				if (err)
 					return err;
 			} else {
-- 
2.50.0

