Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7384CA9ED0
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 12:25:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82FDB10F06F;
	Mon, 12 Oct 2026 12:25:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D79C410F09C
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 12:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791807943; x=1823343943;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4j2e1aAZbg8lbtJdnNPz977FU1ZMBMXAUOSW6yO5zKk=;
 b=mzgeZkAJvKyB4dsszbeo3dWQ5CzlY/XqUqOiEH+hgKgfJw8wLFNjbior
 75SsGS2HmIwtmLys+GLspAYOh3yAvmm7XLIJv1sp0QGxYYhZTRzRb6quk
 zbIHhm7SSY/0Di7TZx066XarRXRcHb+zrb1ihBmg9kWkVYJ/gm6PVOZ25
 Z/uIuVyEKaf9eqcgxgGx9tm4ix5JOIdkOE8EzqUx2dj5zjZXBp6GFy5kE
 sR+wleflpp4jrVhogp02yQK+eI82wE17/SwUlKWU57f2naC0kHqYpioMh
 s7xcrg3ncZQ3xwelFgyl9M8Q5E9GgGTbD2HRDuPfdBN8ZRK9MLh6kBG6v A==;
X-CSE-ConnectionGUID: 28izOpqnQgy+uZTT8DWBjw==
X-CSE-MsgGUID: maz6lFoURmuOMFWiXV5QQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="522916"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="522916"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 05:25:39 -0700
X-CSE-ConnectionGUID: l9QUhMqfTvSd0rqdWT5mkw==
X-CSE-MsgGUID: 4d33VhCiSHeJObE1tvm+Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="962814"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by fmviesa004.fm.intel.com with ESMTP; 12 Oct 2026 05:25:38 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: mallesh.koujalagi@intel.com,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH v7 11/12] drm/xe/vram: Report tile vs device VRAM visibility
 errors
Date: Mon, 12 Oct 2026 17:55:20 +0530
Message-ID: <20261012122522.2307625-12-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261012122522.2307625-1-dnyaneshwar.bhadane@intel.com>
References: <20261012122522.2307625-1-dnyaneshwar.bhadane@intel.com>
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
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
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

