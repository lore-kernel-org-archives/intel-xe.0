Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BA92C3DA4A
	for <intel-xe@archiver.kernel.org>; Fri,  9 Aug 2024 23:27:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00BD710EA34;
	Fri,  9 Aug 2024 23:27:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NkPlHDv4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C20CA10EA34
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Aug 2024 23:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723246059; x=1754782059;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JYO2rWc8/2oRliQUvFySpXAlIwNwoFoO5qwddnoym6w=;
 b=NkPlHDv4B3DQmYSDLJGQqjMtbUIJ7OPoZqaFNIxs+z1xBqnNhutYi4Iy
 phZacltSo+E7jyz1TnIsAPZ5n1LCi0KeEBs4FXptqltMnqWVyNne9h2LP
 4bW8JgC5nzJpm4XQTMRtqlwezRtyFnYGxchkcl7qRmCpCyAXqFAFuTfe9
 XuUQ2w0qV8lwhNCf2H0i+SCdNtS0eDisn3gn+NmxqklM6vNEhOFYtH4M6
 8hNdzWjrd/APR+62M9e7jlYR7lY3ShlYWylJDJVXFEWudRR5ZlucHb/Ly
 0XkWHCwhwa8zU96kbZVWD0gtYU2WumOuwrKbiS6kMXJ1LTieOI3TRsfHO Q==;
X-CSE-ConnectionGUID: Tcyq5s9tQ42Hhi6PoE5l7w==
X-CSE-MsgGUID: jlwSWn0ASgW+OI1vXEcVUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="32829709"
X-IronPort-AV: E=Sophos;i="6.09,277,1716274800"; d="scan'208";a="32829709"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 16:27:39 -0700
X-CSE-ConnectionGUID: TyMduQiESSeX62MlrNOZ3Q==
X-CSE-MsgGUID: WcJspqRjQteCNlHr3SMXPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,277,1716274800"; d="scan'208";a="62551347"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 16:27:38 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Fix tile fini sequence
Date: Fri,  9 Aug 2024 16:28:30 -0700
Message-Id: <20240809232830.3302251-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

