Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F39EB64DD
	for <intel-xe@archiver.kernel.org>; Fri, 21 Jul 2023 15:29:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1E9210E6A9;
	Fri, 21 Jul 2023 15:29:28 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E30010E6A7
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Jul 2023 15:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689953365; x=1721489365;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Am467WasF01H7yeD4x6NbKSJPslULPwZVxqDoYv7RIs=;
 b=Q7YdYgJTCdrdaCR1vyhaY5B07ZkMyulWX35spXhwYAUH6EnYn2OAbZcN
 C/ugtR0i5rf011F2PDOyYvHUxmJpeU6kiJ9k6OBPZVvIbvLBQizssk9tv
 W3VQfpsHa6ktvh0K9ClNGbL1MH91KbWBNPc6vr4HIxbs2oI9mbokm8gQo
 jhxtk8ZMlSlm8dJBjXfTFTFjx2kFmJlPSIJqA6oXbNcZHlpHlABFa5Nx8
 QrCu/1+dabxKm74BL54nmj+iJ0hWEWE/UGqggYfSjl7FFmKYwAFM2omfK
 HzXRqxqZam5UVDo35hRyCh3YlT2em6QX+DD2o6jaXI4ORo3sc4tUBA6c3 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="346649156"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="346649156"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 08:29:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="718863661"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="718863661"
Received: from rtrejoca-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.30.22])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 08:29:23 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 21 Jul 2023 16:28:55 +0100
Message-ID: <20230721152852.504995-8-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230721152852.504995-5-matthew.auld@intel.com>
References: <20230721152852.504995-5-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v8 3/3] drm/xe: fully turn on small-bar support
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This allows vram_size > io_size, instead of just clamping the vram size
to the BAR size, now that the driver supports it.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Michael J. Ruhl <michael.j.ruhl@intel.com>
Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 8d0f07261bfd..aa9c573b1243 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -261,11 +261,6 @@ int xe_mmio_probe_vram(struct xe_device *xe)
 	if (err)
 		return err;
 
-	/* small bar issues will only cover root tile sizes */
-	if (xe->mem.vram.io_size < vram_size)
-		drm_warn(&xe->drm, "Restricting VRAM size to PCI resource size (0x%llx->0x%llx)\n",
-			 vram_size, (u64)xe->mem.vram.io_size);
-
 	drm_info(&xe->drm, "VISIBLE VRAM: %pa, %pa\n", &xe->mem.vram.io_start,
 		 &xe->mem.vram.io_size);
 
@@ -287,9 +282,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
 		}
 
 		tile->mem.vram.base = tile_offset;
-
-		/* small bar can limit the visible size.  size accordingly */
-		tile->mem.vram.usable_size = min_t(u64, vram_size, io_size);
+		tile->mem.vram.usable_size = vram_size;
 		tile->mem.vram.mapping = xe->mem.vram.mapping + tile_offset;
 
 		drm_info(&xe->drm, "VRAM[%u, %u]: %pa, %pa\n", id, tile->id,
@@ -304,7 +297,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
 		available_size += vram_size;
 
 		if (total_size > xe->mem.vram.io_size) {
-			drm_warn(&xe->drm, "VRAM: %pa is larger than resource %pa\n",
+			drm_info(&xe->drm, "VRAM: %pa is larger than resource %pa\n",
 				 &total_size, &xe->mem.vram.io_size);
 		}
 
-- 
2.41.0

