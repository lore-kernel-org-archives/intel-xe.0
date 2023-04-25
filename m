Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 806F3C77B61
	for <intel-xe@archiver.kernel.org>; Tue, 25 Apr 2023 11:01:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54E0410E27B;
	Tue, 25 Apr 2023 11:01:23 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DADCF10E27B
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Apr 2023 11:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682420481; x=1713956481;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=m/cJOVha8qQxlDC1psOKT91iJKfeJoAoiMjUPyYh9yA=;
 b=AE7wWSPvlhCpDTnNCQOAwpI1i/DUXim0Ivr0+5tjsWEJVRzrsg4cPyKo
 OrfAHURNJq5QZMhFWkpWc1hPjEKZwHJZ8o+545VAHZU3Dpci3PfAvauOS
 t5CTlRIuak0WFklDOeyhE7hOW4yMEjHc9WHeHPMDQeW8XuyKmldQJg5BB
 Zt1RkC87b9YS9Z5PtIgdvoSLbnN26Zs46cvOEeoJuiSr3Om+oqKmtxUiH
 jS7NPZz2zUT3x2eVe23PDsrOX+2fgq/hT+16uo2/vPkYV9EHvAuQU/QKD
 sTjZYHDEOeKcK4mOh10AfH7MAow4ktbisXVlmCq0LLUHBWvfrcxKdy2hn Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="409675683"
X-IronPort-AV: E=Sophos;i="5.99,225,1677571200"; d="scan'208";a="409675683"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2023 04:01:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="758077432"
X-IronPort-AV: E=Sophos;i="5.99,225,1677571200"; d="scan'208";a="758077432"
Received: from nishtha-mobl1.gar.corp.intel.com (HELO bvivekan-mobl.fritz.box)
 ([10.213.79.217])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2023 04:01:19 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 25 Apr 2023 16:31:07 +0530
Message-Id: <20230425110107.932366-1-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3] drm/xe: Keep all resize bar related prints
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
 drivers/gpu/drm/xe/xe_mmio.c | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 98357c1f109f..5536f84682c0 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -59,7 +59,7 @@ _resize_bar(struct xe_device *xe, int resno, resource_size_t size)
 
 	ret = pci_resize_resource(pdev, resno, bar_size);
 	if (ret) {
-		drm_info(&xe->drm, "Failed to resize BAR%d to %dM (%pe)\n",
+		drm_info(&xe->drm, "Failed to resize BAR%d to %dM (%pe). Consider enabling 'Resizable BAR' support in your BIOS\n",
 			 resno, 1 << bar_size, ERR_PTR(ret));
 		return -1;
 	}
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

