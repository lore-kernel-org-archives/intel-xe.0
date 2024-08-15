Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAC93C5320D
	for <intel-xe@archiver.kernel.org>; Thu, 15 Aug 2024 23:06:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8262210E558;
	Thu, 15 Aug 2024 23:06:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AL6bljkq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 059B410E551
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Aug 2024 23:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723763158; x=1755299158;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JuRTnMHHnjeCA0io1EhMRhWICOcL6MiCjQI67f6rG2E=;
 b=AL6bljkq6WRtEoXB6K+/IvZf7w5099o/0LuLE27MuW0L3qHRNPpCHmWK
 w7eGioq+E6dsMIAYH8DggfKti7VUWPR/LnN77go2UGnTEk2wYzR0Z+te6
 5SYHwQ8YgXDkomsxubn7CRU9DAv+pPFQeA1+AUQch90iWZgtSiiJ40qJc
 49+41X9O90lzPYq8SSv2deAKo7x5ixNR1IHSNoZXVgWw4CMfKk9p2Ffho
 pK0q5/cHX89AC6QL2e6IgSqVdU82qA5+UfgKvuOFVRaTJCrB4DS65g9CM
 jmu7he4zs+buyCI5p3lgSfMD1MqE/L/ZnfMW8rdcvPAULe5hHUdxuBGt8 g==;
X-CSE-ConnectionGUID: iY5++fnvShiiHBkOVy3vVg==
X-CSE-MsgGUID: q+QgjhpZTPaC67K0ebjBVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="21687155"
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; d="scan'208";a="21687155"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 16:05:58 -0700
X-CSE-ConnectionGUID: +k5IV8COSlGS/V8a/5S1+A==
X-CSE-MsgGUID: dCiMUq6ZQICAqNnUyIbwhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; d="scan'208";a="63686130"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 16:05:55 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [CI 3/3] drm/xe: Fix tile fini sequence
Date: Thu, 15 Aug 2024 16:05:41 -0700
Message-ID: <20240815230541.3828206-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240815230541.3828206-1-lucas.demarchi@intel.com>
References: <20240815230541.3828206-1-lucas.demarchi@intel.com>
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

From: Matthew Brost <matthew.brost@intel.com>

Only set tile->mmio.regs to NULL if not the root tile in tile_fini. The
root tile mmio regs is setup ealier in MMIO init thus it should be set
to NULL in mmio_fini.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index bdcc7282385c4..3fd462fda6255 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -29,7 +29,7 @@ static void tiles_fini(void *arg)
 	struct xe_tile *tile;
 	int id;
 
-	for_each_tile(tile, xe, id)
+	for_each_remote_tile(tile, xe, id)
 		tile->mmio.regs = NULL;
 }
 
@@ -146,9 +146,11 @@ int xe_mmio_probe_tiles(struct xe_device *xe)
 static void mmio_fini(void *arg)
 {
 	struct xe_device *xe = arg;
+	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
 
 	pci_iounmap(to_pci_dev(xe->drm.dev), xe->mmio.regs);
 	xe->mmio.regs = NULL;
+	root_tile->mmio.regs = NULL;
 }
 
 int xe_mmio_init(struct xe_device *xe)
-- 
2.43.0

