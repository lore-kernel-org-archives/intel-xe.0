Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0736C3DA4A
	for <intel-xe@archiver.kernel.org>; Sat, 10 Aug 2024 01:54:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BBA910EA55;
	Sat, 10 Aug 2024 01:54:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q7D0i/mk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EADE710EA55
 for <intel-xe@lists.freedesktop.org>; Sat, 10 Aug 2024 01:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723254894; x=1754790894;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=JYO2rWc8/2oRliQUvFySpXAlIwNwoFoO5qwddnoym6w=;
 b=Q7D0i/mkNAAxwD8SfWcjNXOVBO5pUPRcvNJSsDLYbnWK10LBXWzKct3a
 v3lkysJQuvYpL8uDvmLC45KimOjRdXbpevgbuBJGGvKn2rPJZrbGT8kt4
 seShLMgznCdlB7o2XkytSHCAjgwSwnB4ouI+EJLFR0MlMmDja68nGGrHg
 UtbCrwCcYhLSC3ELI6oF8cKth8gztfMrb7GOITR8+62R96LFAoTJJmAE8
 DRNw56aRWgbkm0wqwE4SqL9Fxm6R32uT5gxu5c0pkQ1NvKZjZcd77JW8i
 6nRi0GxXwVA48YjLGSY0aQCkDNKJvwFwtbMiZQV3iZjtT4YZTSFsBxgHE g==;
X-CSE-ConnectionGUID: rnlOLUr6QLW9feqj3ehHCw==
X-CSE-MsgGUID: P5rvaQO+T++Gha+i3qH+ZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="21420026"
X-IronPort-AV: E=Sophos;i="6.09,278,1716274800"; d="scan'208";a="21420026"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 18:54:53 -0700
X-CSE-ConnectionGUID: 2HqER2noRsOejNmPe1X5Aw==
X-CSE-MsgGUID: BsAfD+SJTW+/bP74ENg2zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,278,1716274800"; d="scan'208";a="57813384"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 18:54:52 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 04/11] drm/xe: Fix tile fini sequence
Date: Fri,  9 Aug 2024 18:55:37 -0700
Message-Id: <20240810015544.3443258-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240810015544.3443258-1-matthew.brost@intel.com>
References: <20240810015544.3443258-1-matthew.brost@intel.com>
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

Only set tile->mmio.regs to NULL if not the root tile in tile_fini. The
root tile mmio regs is setup ealier in MMIO init thus it should be set
to NULL in mmio_fini.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index bdcc7282385c..f5bdb540e823 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -30,7 +30,8 @@ static void tiles_fini(void *arg)
 	int id;
 
 	for_each_tile(tile, xe, id)
-		tile->mmio.regs = NULL;
+		if (tile != xe_device_get_root_tile(xe))
+			tile->mmio.regs = NULL;
 }
 
 /*
@@ -146,9 +147,11 @@ int xe_mmio_probe_tiles(struct xe_device *xe)
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
2.34.1

