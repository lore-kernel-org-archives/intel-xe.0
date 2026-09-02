Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBC18C624D7
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 10:39:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88B3E10E4AA;
	Wed,  2 Sep 2026 10:39:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KSeu3N9Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EEA110E489
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 10:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788345590; x=1819881590;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oU7u2pi2AtpxLmF9rt2oQ2eKLqqiFJnGVKf5IZ71qVc=;
 b=KSeu3N9YYnvezFkSw5Xo+RuVYDq6TW+2eI1mmjq9pF4ja9pxlse/TIbL
 FHsUlVqbY8+F1RjrpV5eVGRA7beHBwD1XB5jRX66NKIzcnUwE5yeB5lP7
 0yAUlUqiuHL5lR9+9aafqXaE3DdZRxBzEz5SfQ/C/HFfaKNmsZ14isobO
 NrLUo5O8cuqp8xVFbPhCvQZd+G3zFJQAhX345aagK2HWa9nkwrxF0w8GL
 EaIwKNPw64cJB2U8tldain+f1MsPug2EgGlX8cza1P+MBCzuit4mJ9GsI
 MeTu+l38rXpA2bOG0538fzgvPRxHiY7SXYI4zgcNGemwW1Y/btstnzoo3 A==;
X-CSE-ConnectionGUID: 1BKzk/MbRR60YJHKCZHW+A==
X-CSE-MsgGUID: PUITy40gTBuhKC5aYUDBxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="88556986"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="88556986"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 03:39:45 -0700
X-CSE-ConnectionGUID: oWX4SvCYRAqNKWB4mYkTvw==
X-CSE-MsgGUID: Nudd2EYoSteXWf1wrW+FaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="265667578"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.174])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 03:39:43 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v2 3/5] drm/xe/vram: revamp CPU VRAM mapping
Date: Wed,  2 Sep 2026 11:39:35 +0100
Message-ID: <20260902103931.826063-10-matthew.auld@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902103931.826063-7-matthew.auld@intel.com>
References: <20260902103931.826063-7-matthew.auld@intel.com>
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

Assisted-by: Gemini:gemini-3.1-pro-preview
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_vram.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

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

