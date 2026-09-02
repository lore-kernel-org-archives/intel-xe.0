Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93E07C624D7
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 12:41:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D19E10E4F5;
	Wed,  2 Sep 2026 12:41:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bjN4URUj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F21CF89207
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 12:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788352911; x=1819888911;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Lokxjhacvej39jGa1t9Co4IH9AshJ3V7mYIe84vAKuA=;
 b=bjN4URUjKdL4ugJ7YFKqrpX8fGLXzlZScT2eHIaTfw9R/MoOmLDC2Lih
 R6XbZcH96CnNRfbJS4pPqlSDkNjrKXyu1kme7WuFQGyXaJ1iEFqu/Mrok
 nA9qiWs5ecQZ7PqJEqEAvWwx5X5AOb8EDbxUIijCVP08No7b5qywtyE8p
 vAEIqjaz/FUdPp8/C0vqOpdsI0fnpPayUPOppRghlgd5o82hAWHBhRgCZ
 +4JJI/XWLVp8H1LZtDDipwXu9tVnJtGf8HsZo7LzbeKfh4bCUHvLWKIQ/
 VmOS5pJ0if7sZgQDu7ZSPlZv6Etlnn03UrCL7yjHmusfHVE9brvNvCJGS g==;
X-CSE-ConnectionGUID: Jr5jk1SnQgSktfoIIN+/iQ==
X-CSE-MsgGUID: JDBP83QJSe6ceE+gRmSKhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="88829518"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="88829518"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 05:41:51 -0700
X-CSE-ConnectionGUID: CjENV+2ERUmdT3OYsLwdxQ==
X-CSE-MsgGUID: QsiLLsPWS/ihGlFgLOLUjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="269965283"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.174])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 05:41:49 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v3 3/5] drm/xe/vram: revamp CPU VRAM mapping
Date: Wed,  2 Sep 2026 13:41:21 +0100
Message-ID: <20260902124117.918018-10-matthew.auld@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902124117.918018-7-matthew.auld@intel.com>
References: <20260902124117.918018-7-matthew.auld@intel.com>
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

Previously, we called devm_ioremap_wc() for the entire PCI LMEM BAR (which
can be significantly larger than usable memory, e.g., mapping 16G for a
10G card), and then simply assigned subsets of this global mapping to each
tile.

By moving the devm_ioremap_wc() call into vram_region_init() and mapping
on a per-tile basis, we restrict the virtual address space to exactly
the usable_size of each tile. The other big win is that the core kernel
will place a guard page at the end of each per-tile mapping to help
catch OOB CPU writes (e.g. into the flat CCS storage) by triggering an
immediate page fault instead of silent memory corruption.

As a consequence the global vram->mapping is now NULL. But that was
unused anyway, with CPU access already correctly routed through the per
tile mapping.

v2 (Sashiko)
  - Make sure to update the panic flow to now use the root tile.

Assisted-by: Gemini:gemini-3.1-pro-preview
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/display/xe_panic.c |  3 ++-
 drivers/gpu/drm/xe/xe_vram.c          | 14 +++++++++-----
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_panic.c b/drivers/gpu/drm/xe/display/xe_panic.c
index 12c6fb99015d..1a6cee25e9d7 100644
--- a/drivers/gpu/drm/xe/display/xe_panic.c
+++ b/drivers/gpu/drm/xe/display/xe_panic.c
@@ -52,7 +52,8 @@ static void xe_panic_page_set_pixel(struct drm_scanout_buffer *sb, unsigned int
 	if (new_page != panic->page) {
 		if (xe_bo_is_vram(bo)) {
 			/* Display is always mapped on root tile */
-			struct xe_vram_region *vram = xe_bo_device(bo)->mem.vram;
+			struct xe_vram_region *vram =
+				xe_device_get_root_tile(xe_bo_device(bo))->mem.vram;
 
 			if (panic->page < 0 || new_page < panic->page) {
 				xe_res_first(bo->ttm.resource, new_page * PAGE_SIZE,
diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index 56cff1e44530..04d831b101bd 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -55,9 +55,6 @@ static int determine_lmem_bar_size(struct xe_device *xe, struct xe_vram_region *
 	/* XXX: Need to change when xe link code is ready */
 	lmem_bar->dpa_base = 0;
 
-	/* set up a map to the total memory area. */
-	lmem_bar->mapping = devm_ioremap_wc(&pdev->dev, lmem_bar->io_start, lmem_bar->io_size);
-
 	return 0;
 }
 
@@ -196,7 +193,7 @@ static void vram_fini(void *arg)
 	struct xe_tile *tile;
 	int id;
 
-	xe->mem.vram->mapping = NULL;
+	xe_assert(xe, !xe->mem.vram->mapping);
 
 	for_each_tile(tile, xe, id) {
 		tile->mem.vram->mapping = NULL;
@@ -257,8 +254,15 @@ static int vram_region_init(struct xe_device *xe, struct xe_vram_region *vram,
 		return -ENODEV;
 	}
 
+	if (vram != xe->mem.vram) {
+		struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+
+		vram->mapping = devm_ioremap_wc(&pdev->dev, vram->io_start, vram->io_size);
+		if (!vram->mapping)
+			return -ENOMEM;
+	}
+
 	vram->dpa_base = lmem_bar->dpa_base + offset;
-	vram->mapping = lmem_bar->mapping + offset;
 	vram->usable_size = usable_size;
 
 	print_vram_region_info(xe, vram);
-- 
2.55.0

