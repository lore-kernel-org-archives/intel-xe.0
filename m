Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C69A4CA9ED5
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 05:19:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 841F110EA2B;
	Mon, 12 Oct 2026 05:19:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80B0010ECA0
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 05:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791782382; x=1823318382;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eOb8aV3OLvdIfzxxeT5UBwPHPbQxtgSjyBjdN1QwtCw=;
 b=ixiIsSTGKfYkfDiQHll/04CWsnXMUq3QgMraWgaUirczRlOySdRc1W3C
 +jA5c5fZnQ+/o88uGWtvNgtpsQMmreWrj+kyq/Ge23Ykdfa9wGQtvtB4p
 P8v+h7lF/ASpMLLdrXKmMx9Jx8psQam5DxzqP3TnQ95k87N4YzJL07Cys
 ZrNWQ8cUIRH9+tWGz+7ihz8k2lYw9v+SxMBzgnI8xVkvRDS5Oz44woMx1
 X/ZtORZ8Qduvyx8ZKt88MPYVIPSf8qnS6YFgs+HnavT4S+1F5ywvmfNf7
 SuJwpFQmls7Tcz3RESjwBVAwqQCQ22HygpECR1TQctw2SUfKIP2mtdGIS g==;
X-CSE-ConnectionGUID: uykSrrgeTViFzcWK2KI7VQ==
X-CSE-MsgGUID: 8akjMhQYQzCCad9nuR1LjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="390515"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="390515"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2026 22:18:44 -0700
X-CSE-ConnectionGUID: 0pJtPRv7Rj2x4wwsE45pPg==
X-CSE-MsgGUID: /chwaiASS+qtXRfPH6yEOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="735976"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by orviesa009.jf.intel.com with ESMTP; 11 Oct 2026 22:18:43 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: mallesh.koujalagi@intel.com,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH v6 11/12] drm/xe/vram: Report tile vs device VRAM visibility
 errors
Date: Mon, 12 Oct 2026 10:48:22 +0530
Message-ID: <20261012051823.2201360-12-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261012051823.2201360-1-dnyaneshwar.bhadane@intel.com>
References: <20261012051823.2201360-1-dnyaneshwar.bhadane@intel.com>
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

Derive the owning tile of a struct xe_vram_region inside
vram_region_init() from vram->id, so the "no CPU visible VRAM"
error can distinguish a per-tile region from the device-wide
region without changing the function's signature.

Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
---
 drivers/gpu/drm/xe/xe_vram.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index dcedd8cfd731..73aef047eb38 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -244,6 +244,8 @@ static int vram_region_init(struct xe_device *xe, struct xe_vram_region *vram,
 			    struct xe_vram_region *lmem_bar, u64 offset, u64 usable_size,
 			    u64 region_size, resource_size_t remain_io_size)
 {
+	struct xe_tile *tile = vram != xe->mem.vram ? &xe->tiles[vram->id] : NULL;
+
 	/* Check if VRAM region is already initialized */
 	if (vram->mapping)
 		return 0;
@@ -253,11 +255,12 @@ static int vram_region_init(struct xe_device *xe, struct xe_vram_region *vram,
 	vram->io_size = min_t(u64, usable_size, remain_io_size);
 
 	if (!vram->io_size) {
-		drm_err(&xe->drm, "Tile without any CPU visible VRAM. Aborting.\n");
+		drm_err(&xe->drm, "%s without any CPU visible VRAM. Aborting.\n",
+			tile ? "Tile" : "Device");
 		return -ENODEV;
 	}
 
-	if (vram != xe->mem.vram) {
+	if (tile) {
 		struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 
 		vram->mapping = devm_ioremap_wc(&pdev->dev, vram->io_start, vram->io_size);
-- 
2.54.0

