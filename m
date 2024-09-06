Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74451CE7AA5
	for <intel-xe@archiver.kernel.org>; Fri,  6 Sep 2024 03:25:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D87810E959;
	Fri,  6 Sep 2024 03:25:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CQECYKQS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB83A10E959
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Sep 2024 03:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725593112; x=1757129112;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TnUkiewmC3jV9ENIm/UzecabKzD6rrU/EmcYp7Vn580=;
 b=CQECYKQSJkKG+DNpAeXTItZ43czYwlhci2rjaVwvcKmYypkAT2N87qog
 2kQMbvXasPaHGyc4ILZVEnNcu635l6kxuGqjJpqbAdV4sQPeCXBfj49eB
 fEb57LCX4xHqMGx8kw6Mo8qbQ6xgZ2PpnWq6vaV4dJ0A4myuRnl62QkXK
 c/pONzdHPiB4nHOZBlFnvgSsJm3oYQUl3FUJjwjXhJBvTPSVoO2WmPlyD
 CBX6o4QsxRl3UL8RGrj6WMehjZzNI1wbdFa56peb9nTe9Ebe80bBmm3y3
 WeWZJcrzbRFF9F2Yh8YI5vvo0NtOeHfYYqLXoNi5iZp1+GGZZZqMiNcrS g==;
X-CSE-ConnectionGUID: UXW2XcERS8yUHRX9zQKTeA==
X-CSE-MsgGUID: T1FV821+SvSbb/LK6kTH+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="24142540"
X-IronPort-AV: E=Sophos;i="6.10,206,1719903600"; d="scan'208";a="24142540"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 20:25:12 -0700
X-CSE-ConnectionGUID: PQkMTz0wRB+EJhOc0JD4Rw==
X-CSE-MsgGUID: 3TUzv+NTSRObPaugI+vsmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,206,1719903600"; d="scan'208";a="66065101"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 20:25:12 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH] drm/xe: Fix arg to pci_iomap()
Date: Thu,  5 Sep 2024 20:25:07 -0700
Message-ID: <20240906032507.2952859-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
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

Commit 2d8865b27724 ("drm/xe: Move BAR definitions to dedicated file")
moved the BAR definition to the header, but replaced the wrong arg in
the pci_iomap() function - the last arg is actuall the length, not the
BAR. Luckily GTTMMADR_BAR == 0, so it still works. Fix the argument
to avoid confusion.

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 3fd462fda625..4aae30880bc6 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -157,15 +157,14 @@ int xe_mmio_init(struct xe_device *xe)
 {
 	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
-	const int mmio_bar = 0;
 
 	/*
 	 * Map the entire BAR.
 	 * The first 16MB of the BAR, belong to the root tile, and include:
 	 * registers (0-4MB), reserved space (4MB-8MB) and GGTT (8MB-16MB).
 	 */
-	xe->mmio.size = pci_resource_len(pdev, mmio_bar);
-	xe->mmio.regs = pci_iomap(pdev, mmio_bar, GTTMMADR_BAR);
+	xe->mmio.size = pci_resource_len(pdev, GTTMMADR_BAR);
+	xe->mmio.regs = pci_iomap(pdev, GTTMMADR_BAR, 0);
 	if (xe->mmio.regs == NULL) {
 		drm_err(&xe->drm, "failed to map registers\n");
 		return -EIO;
-- 
2.43.0

