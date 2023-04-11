Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E0D9C7619A
	for <intel-xe@archiver.kernel.org>; Tue, 11 Apr 2023 10:05:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22AE210E08B;
	Tue, 11 Apr 2023 10:05:59 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2254010E08B
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Apr 2023 10:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681207557; x=1712743557;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ls3C/Yj8L/FLemMaif7BPgOlQt/eGfUuxbqkL09Mpo8=;
 b=d59RJPmTOv4pAEmd9cCIRpYnixqNtmCIY1nlrziI5lEPZPYMdL05aqBc
 dE955fFbCSUaVEg35xNKoJOgMAKX9wf/S77U9Df8L4iDCZFfG3Dyi3TYv
 85hi5oX21ATZBFQjk4jCAeo6UtCt2haUe8loz7H0MmcSpynlVRYMBTD3X
 lyB6QHMlapJenLrP1VaYhg3pK595duwX9+mHwTXSxl6XmCumFXCiqn1QH
 yMpUTzPQnJ+9nYV+6XolOSVos+UoGJD9Q0lhWXSB/04b7Lqw9tFSSZqbA
 NE5Fw2aG1s1dUgQB8HLNyFalnc9qE9qKyFMWTQ+xCCBwP0GfCUVI60frT Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="345363496"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; d="scan'208";a="345363496"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2023 03:05:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="718911571"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; d="scan'208";a="718911571"
Received: from aperesto-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.7.9])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2023 03:05:55 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 11 Apr 2023 11:04:58 +0100
Message-Id: <20230411100458.24314-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/mmio: stop incorrectly triggering drm_warn
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

CI keeps triggering:

xe 0000:03:00.0: [drm] Restricting VRAM size to PCI resource size
(0x400000000->0x3fa000000)

Due to usable_size vs vram_size differences. However, we only want to
trigger the drm_warn() to let developers know that the system they are
using is going clamp the VRAM size to match the IO size, where they can
likely only use 256M of VRAM. Once we properly support small-bar we can
drop this.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 5cacaa05759a..7d62fae25bb4 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -228,9 +228,9 @@ int xe_mmio_probe_vram(struct xe_device *xe)
 	else if (xe->mem.vram.io_size < usable_size && !xe_force_vram_bar_size)
 		drm_info(&xe->drm, "Using a reduced BAR size of %lluMiB. Consider enabling 'Resizable BAR' support in your BIOS.\n",
 			 (u64)xe->mem.vram.size >> 20);
-	if (xe->mem.vram.size < vram_size)
+	if (usable_size > xe->mem.vram.io_size) /* TODO: remove once we properly support small-bar */
 		drm_warn(&xe->drm, "Restricting VRAM size to PCI resource size (0x%llx->0x%llx)\n",
-			 vram_size, (u64)xe->mem.vram.size);
+			 usable_size, xe->mem.vram.io_size);
 
 	xe->mem.vram.mapping = ioremap_wc(xe->mem.vram.io_start, xe->mem.vram.io_size);
 	xe->mem.vram.size = min_t(u64, xe->mem.vram.size, usable_size);
-- 
2.39.2

