Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D049BC7EE2E
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jun 2023 18:49:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AF3810E6D6;
	Fri,  9 Jun 2023 18:49:25 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EB0C10E6D6
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Jun 2023 18:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686336563; x=1717872563;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r1mGC1UAEJ9msWoTJvdZNNJ28Wj94mtwJM9S/L3Zz3o=;
 b=ZAKWvmRU1ebrIHA5dGyXotXPz415/fA2Kj9EgKhL40A1kQwyPY3s60qE
 mZ9S4z6hAuIefz0qbg2ScsD/38bCNuWIPV7+rz/OaN+ADxpDWc4uV2xZF
 FvdVukdhQqJ/qIhGjkVsZe6fHxXPom0JofZzIXFYym/qN9hbrMu8AYpld
 5aD6kkDcaxYTa3iKTc4mZhYCuL4P2V2ARcDdyZPMMzQYoi7YeSVKkWAKz
 o7HA2fJVhNpRdIUTB2ZfxEzvikE0rAnrS7TjUBRDgSt0ba0d/988KE8Em
 9UtKS9kKzuVMM/lB6RmRa8gY2igJKnrBI3kzWDgzvztb5U7klyxuDkJfR A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="360148663"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; d="scan'208";a="360148663"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 11:49:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="1040581386"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; d="scan'208";a="1040581386"
Received: from aravind-dev.iind.intel.com ([10.145.162.80])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 11:49:21 -0700
From: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Sat, 10 Jun 2023 00:22:49 +0530
Message-Id: <20230609185249.2032370-2-aravind.iddamsetty@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230609185249.2032370-1-aravind.iddamsetty@intel.com>
References: <20230609185249.2032370-1-aravind.iddamsetty@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/1] drm/xe: Fix stolen memory size calculation
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

The stolen memory base should be derived from GSMBASE or
FLAT_CCS_BASE_ADDR when flat ccs is applicable.

Fixes: acf067c2f5a5 ("drm/xe: Implement stolen memory.")

Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
---
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
index 21ecc734f10a..29ce69bf8200 100644
--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
@@ -54,7 +54,6 @@ bool xe_ttm_stolen_cpu_access_needs_ggtt(struct xe_device *xe)
 static s64 detect_bar2_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
 {
 	struct xe_tile *tile = xe_device_get_root_tile(xe);
-	struct xe_gt *mmio = xe_root_mmio_gt(xe);
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	u64 stolen_size;
 	u64 tile_offset;
@@ -66,12 +65,12 @@ static s64 detect_bar2_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
 		return 0;
 	}
 
-	/* Use DSM base address instead for stolen memory */
-	mgr->stolen_base = (xe_mmio_read64(mmio, DSMBASE) & BDSM_MASK) - tile_offset;
+	/* stolen base should be at end of usable vram */
+	mgr->stolen_base = vram_size;
 	if (drm_WARN_ON(&xe->drm, tile_size < mgr->stolen_base))
 		return 0;
 
-	stolen_size = tile_size - mgr->stolen_base;
+	stolen_size = tile_size - vram_size;
 
 	/* Verify usage fits in the actual resource available */
 	if (mgr->stolen_base + stolen_size <= pci_resource_len(pdev, GEN12_LMEM_BAR))
-- 
2.25.1

