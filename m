Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AB3CC77B61
	for <intel-xe@archiver.kernel.org>; Tue, 25 Apr 2023 10:14:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3224910E077;
	Tue, 25 Apr 2023 10:14:23 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4972610E077
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Apr 2023 10:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682417661; x=1713953661;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UwuTYNXpSXJ6jxl0KJVZh7oXkubNAC4XFytAULx9lws=;
 b=gq5q2zVEVR/1KbjdAltPhIBf3mkqPxk+gQVGP8hNGKzvtYvky+C2SlSo
 LqZIwObGAjuDkH1XmTYzKUzLTORQKc1t8FKb3VGK9uQPmGrWa94AuUmHe
 BOaDdVovQ2cfOBzbl9fLHkFBdKDQde3zOMXyEhpR0tJfCzF5S8nf63WW7
 0ABjL3n/qMJsxvhi5T5QCG+6uT9wuSAEHq6xFqAislEUJjSwNVxfbnS9x
 U1xFnbgid2MwLVX1N6oJModTJtakZfKMo0suLGNSfPJ/7+Cz+1Kjj6PCG
 Hy02RNc7b9qkozYERTJvofrIc6f0d9ASwfNas49W3iJIwIaoKIbyiFLxi g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="374668841"
X-IronPort-AV: E=Sophos;i="5.99,225,1677571200"; d="scan'208";a="374668841"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2023 03:14:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="805022700"
X-IronPort-AV: E=Sophos;i="5.99,225,1677571200"; d="scan'208";a="805022700"
Received: from nishtha-mobl1.gar.corp.intel.com (HELO bvivekan-mobl.fritz.box)
 ([10.213.79.217])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2023 03:14:20 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 25 Apr 2023 15:44:07 +0530
Message-Id: <20230425101407.924576-1-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2] drm/xe: Keep all resize bar related prints
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

Modified all BAR size prints to consistently print the size in MiB.

Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 98357c1f109f..46dc59152350 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -95,7 +95,7 @@ static int xe_resize_vram_bar(struct xe_device *xe, resource_size_t vram_size)
 		    rebar_size >= roundup_pow_of_two(vram_size)) {
 			rebar_size = vram_size;
 			drm_info(&xe->drm,
-				 "Given bar size is not within supported size, setting it to default: %llu\n",
+				 "Given bar size is not within supported size, setting it to default: %lluMiB\n",
 				 (u64)vram_size >> 20);
 		}
 	} else {
@@ -107,6 +107,9 @@ static int xe_resize_vram_bar(struct xe_device *xe, resource_size_t vram_size)
 			return 0;
 	}
 
+	drm_info(&xe->drm, "Resizing bar from %lluMiB -> %lluMiB\n",
+		 (u64)current_size >> 20, (u64)rebar_size >> 20);
+
 	while (root->parent)
 		root = root->parent;
 
@@ -117,7 +120,7 @@ static int xe_resize_vram_bar(struct xe_device *xe, resource_size_t vram_size)
 	}
 
 	if (!root_res) {
-		drm_info(&xe->drm, "Can't resize VRAM BAR - platform support is missing\n");
+		drm_info(&xe->drm, "Can't resize VRAM BAR - platform support is missing. Consider enabling 'Resizable BAR' support in your BIOS\n");
 		return -1;
 	}
 
@@ -183,7 +186,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
 	u64 vram_size;
 	u64 original_size;
 	u64 usable_size;
-	int resize_result, err;
+	int err;
 
 	if (!IS_DGFX(xe)) {
 		xe->mem.vram.mapping = 0;
@@ -212,7 +215,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
 	if (err)
 		return err;
 
-	resize_result = xe_resize_vram_bar(xe, vram_size);
+	xe_resize_vram_bar(xe, vram_size);
 	xe->mem.vram.io_start = pci_resource_start(pdev, GEN12_LMEM_BAR);
 	xe->mem.vram.io_size = min(usable_size,
 				   pci_resource_len(pdev, GEN12_LMEM_BAR));
@@ -221,16 +224,9 @@ int xe_mmio_probe_vram(struct xe_device *xe)
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
-		drm_warn(&xe->drm, "Restricting VRAM size to PCI resource size (0x%llx->0x%llx)\n",
-			 usable_size, xe->mem.vram.io_size);
+		drm_warn(&xe->drm, "Restricting VRAM size to PCI resource size (%lluMiB->%lluMiB)\n",
+			 (u64)usable_size >> 20, (u64)xe->mem.vram.io_size >> 20);
 
 	xe->mem.vram.mapping = ioremap_wc(xe->mem.vram.io_start, xe->mem.vram.io_size);
 	xe->mem.vram.size = min_t(u64, xe->mem.vram.size, usable_size);
-- 
2.34.1

