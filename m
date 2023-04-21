Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1205C77B71
	for <intel-xe@archiver.kernel.org>; Fri, 21 Apr 2023 15:39:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFF7310E20C;
	Fri, 21 Apr 2023 15:39:06 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC89110E19F
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Apr 2023 15:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682091542; x=1713627542;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ceT4w1tHvic1VaikdVy1wYAJu6B6aZibU1UPBhfSJi0=;
 b=EojOzR0+v3QFHdr2EnmtoGc8mvDP1KUh0LfVBgpEetZk+YUKI+sHyI2n
 qAHM7Py9Ysr2PEJ1OT85LWRpqBMuhuPGl+ILFSaj6sGXEeve1oIRo/Rir
 OvldZIqiGBFt+A0+tVk7JTJf0mVyfEHpoxbypmA5H87laEGTmo/S2mUiR
 gg3T35+r5D+dmnoL8Za1ea9AXPySA9VpBg4EYM7QdV8v1dmjS2SFUgmDq
 htp0Rt0QMKDnKIWc42BEgk3jycGYDpXybKtsTnyKyLbGNwO4OynlP90GZ
 r8mGCMPu3EYRKZ1d9aYY3Bia5jEGYrtvtFQKDri2wRZvOOttP5b/ZC6DP A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="326350813"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="326350813"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 08:39:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="938526990"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="938526990"
Received: from sshaheed-mobl.gar.corp.intel.com (HELO bvivekan-mobl.fritz.box)
 ([10.213.91.130])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 08:39:00 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 21 Apr 2023 21:08:51 +0530
Message-Id: <20230421153852.329899-1-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] drm/xe: Keep all resize bar related prints
 inside xe_resize_vram_bar
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

xe_resize_vram_bar() function is already printing the status of bar
resizing. It has prints covering both success and failure.
There is no need of additional prints in the caller which were not so
easily to follow.

Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 98357c1f109f..8bd39c3e65ae 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -107,6 +107,8 @@ static int xe_resize_vram_bar(struct xe_device *xe, resource_size_t vram_size)
 			return 0;
 	}
 
+	drm_info(&xe->drm, "Resizing bar from %llu -> %llu\n", current_size, rebar_size);
+
 	while (root->parent)
 		root = root->parent;
 
@@ -117,7 +119,7 @@ static int xe_resize_vram_bar(struct xe_device *xe, resource_size_t vram_size)
 	}
 
 	if (!root_res) {
-		drm_info(&xe->drm, "Can't resize VRAM BAR - platform support is missing\n");
+		drm_info(&xe->drm, "Can't resize VRAM BAR - platform support is missing. Consider enabling 'Resizable BAR' support in your BIOS\n");
 		return -1;
 	}
 
@@ -183,7 +185,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
 	u64 vram_size;
 	u64 original_size;
 	u64 usable_size;
-	int resize_result, err;
+	int err;
 
 	if (!IS_DGFX(xe)) {
 		xe->mem.vram.mapping = 0;
@@ -212,7 +214,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
 	if (err)
 		return err;
 
-	resize_result = xe_resize_vram_bar(xe, vram_size);
+	xe_resize_vram_bar(xe, vram_size);
 	xe->mem.vram.io_start = pci_resource_start(pdev, GEN12_LMEM_BAR);
 	xe->mem.vram.io_size = min(usable_size,
 				   pci_resource_len(pdev, GEN12_LMEM_BAR));
@@ -221,13 +223,6 @@ int xe_mmio_probe_vram(struct xe_device *xe)
 	if (!xe->mem.vram.size)
 		return -EIO;
 
-	if (resize_result > 0)
-		drm_info(&xe->drm, "Successfully resize VRAM from %lluMiB to %lluMiB\n",
-			 (u64)original_size >> 20,
-			 (u64)xe->mem.vram.io_size >> 20);
-	else if (xe->mem.vram.io_size < usable_size && !xe_force_vram_bar_size)
-		drm_info(&xe->drm, "Using a reduced BAR size of %lluMiB. Consider enabling 'Resizable BAR' support in your BIOS.\n",
-			 (u64)xe->mem.vram.size >> 20);
 	if (usable_size > xe->mem.vram.io_size)
 		drm_warn(&xe->drm, "Restricting VRAM size to PCI resource size (0x%llx->0x%llx)\n",
 			 usable_size, xe->mem.vram.io_size);
-- 
2.34.1

