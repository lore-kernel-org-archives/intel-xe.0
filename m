Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CC2BC77B73
	for <intel-xe@archiver.kernel.org>; Mon,  5 Jun 2023 16:17:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0430810E2F6;
	Mon,  5 Jun 2023 16:17:28 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A5D810E2F5
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Jun 2023 16:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685981846; x=1717517846;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AA5+OH1fXfrYCzmxq5B9gImEfRG8HKrttS3FNsD0NNU=;
 b=gZf84nsMdJ1Wo/wfPFIkpnLmH2xlCQIV9Kzd+PHkvo1BFT/o8TLuklDN
 Zp2tFP72J/5RFI/pQbHRDWokjobvwgfk46T72URWxb4/+qg4GsCGuF1Mp
 KdtmsT5hrsQGKzvNFWBD3r7MaXbUKgZwbnLd4Tr4ZTS37QXUFioAouJFT
 LDFGGtC5UU6L2jzJPSE3/kwqCr2z+AUyQmJfGE9llWuhwEZi1VXV5Q3Pz
 GmscPJW2jDyKzy+bH8/bVUV48KpTYjMHnmwrG6+3leRoZrz5Y4NSdKZDC
 p5YeajuMT0aRqbJQJedIdZf2TjSCC5CLWCagqhIKhIDOc5GFjzgfuvAth A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="384717142"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; d="scan'208";a="384717142"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2023 09:17:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="708707861"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; d="scan'208";a="708707861"
Received: from awvttdev-05.aw.intel.com ([10.228.212.156])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2023 09:17:24 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  5 Jun 2023 12:17:05 -0400
Message-Id: <20230605161705.3680031-2-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230605161705.3680031-1-michael.j.ruhl@intel.com>
References: <20230605161705.3680031-1-michael.j.ruhl@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/1] drm/xe: REBAR resize should be best effort
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
Cc: lucas.demarchi@intel.com, matthew.auld@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The resizing of the PCI BAR is a best effort feature.  If it is
not available, it should not fail the driver probe.

Rework the resize to not exit on failure.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c | 28 +++++++++++-----------------
 1 file changed, 11 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 475b14fe4356..f7a7f996b37f 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -47,7 +47,7 @@ static int xe_set_dma_info(struct xe_device *xe)
 	return err;
 }
 
-static int
+static void
 _resize_bar(struct xe_device *xe, int resno, resource_size_t size)
 {
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
@@ -61,18 +61,17 @@ _resize_bar(struct xe_device *xe, int resno, resource_size_t size)
 	if (ret) {
 		drm_info(&xe->drm, "Failed to resize BAR%d to %dM (%pe). Consider enabling 'Resizable BAR' support in your BIOS\n",
 			 resno, 1 << bar_size, ERR_PTR(ret));
-		return ret;
+		return;
 	}
 
 	drm_info(&xe->drm, "BAR%d resized to %dM\n", resno, 1 << bar_size);
-	return ret;
 }
 
 /*
  * if force_vram_bar_size is set, attempt to set to the requested size
  * else set to maximum possible size
  */
-static int xe_resize_vram_bar(struct xe_device *xe)
+static void xe_resize_vram_bar(struct xe_device *xe)
 {
 	u64 force_vram_bar_size = xe_force_vram_bar_size;
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
@@ -83,14 +82,13 @@ static int xe_resize_vram_bar(struct xe_device *xe)
 	u32 bar_size_mask;
 	u32 pci_cmd;
 	int i;
-	int ret;
 
 	/* gather some relevant info */
 	current_size = pci_resource_len(pdev, GEN12_LMEM_BAR);
 	bar_size_mask = pci_rebar_get_possible_sizes(pdev, GEN12_LMEM_BAR);
 
 	if (!bar_size_mask)
-		return 0;
+		return;
 
 	/* set to a specific size? */
 	if (force_vram_bar_size) {
@@ -104,22 +102,22 @@ static int xe_resize_vram_bar(struct xe_device *xe)
 			drm_info(&xe->drm,
 				 "Requested size: %lluMiB is not supported by rebar sizes: 0x%x. Leaving default: %lluMiB\n",
 				 (u64)rebar_size >> 20, bar_size_mask, (u64)current_size >> 20);
-			return 0;
+			return;
 		}
 
 		rebar_size = 1ULL << (__fls(bar_size_bit) + BAR_SIZE_SHIFT);
 
 		if (rebar_size == current_size)
-			return 0;
+			return;
 	} else {
 		rebar_size = 1ULL << (__fls(bar_size_mask) + BAR_SIZE_SHIFT);
 
 		/* only resize if larger than current */
 		if (rebar_size <= current_size)
-			return 0;
+			return;
 	}
 
-	drm_info(&xe->drm, "Resizing bar from %lluMiB -> %lluMiB\n",
+	drm_info(&xe->drm, "Attempting to resize bar from %lluMiB -> %lluMiB\n",
 		 (u64)current_size >> 20, (u64)rebar_size >> 20);
 
 	while (root->parent)
@@ -133,17 +131,16 @@ static int xe_resize_vram_bar(struct xe_device *xe)
 
 	if (!root_res) {
 		drm_info(&xe->drm, "Can't resize VRAM BAR - platform support is missing. Consider enabling 'Resizable BAR' support in your BIOS\n");
-		return -1;
+		return;
 	}
 
 	pci_read_config_dword(pdev, PCI_COMMAND, &pci_cmd);
 	pci_write_config_dword(pdev, PCI_COMMAND, pci_cmd & ~PCI_COMMAND_MEMORY);
 
-	ret = _resize_bar(xe, GEN12_LMEM_BAR, rebar_size);
+	_resize_bar(xe, GEN12_LMEM_BAR, rebar_size);
 
 	pci_assign_unassigned_bus_resources(pdev->bus);
 	pci_write_config_dword(pdev, PCI_COMMAND, pci_cmd);
-	return ret;
 }
 
 static bool xe_pci_resource_valid(struct pci_dev *pdev, int bar)
@@ -163,16 +160,13 @@ static bool xe_pci_resource_valid(struct pci_dev *pdev, int bar)
 static int xe_determine_lmem_bar_size(struct xe_device *xe)
 {
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
-	int err;
 
 	if (!xe_pci_resource_valid(pdev, GEN12_LMEM_BAR)) {
 		drm_err(&xe->drm, "pci resource is not valid\n");
 		return -ENXIO;
 	}
 
-	err = xe_resize_vram_bar(xe);
-	if (err)
-		return err;
+	xe_resize_vram_bar(xe);
 
 	xe->mem.vram.io_start = pci_resource_start(pdev, GEN12_LMEM_BAR);
 	xe->mem.vram.io_size = pci_resource_len(pdev, GEN12_LMEM_BAR);
-- 
2.39.2

