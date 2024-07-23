Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A22E8C3DA63
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jul 2024 09:39:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43C0E10E529;
	Tue, 23 Jul 2024 09:39:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aEJsVVrw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0C6210E529
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Jul 2024 09:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721727597; x=1753263597;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=c6boa/rPS+o3r89s289jqLp3JGOv7oym73Z29t78NU8=;
 b=aEJsVVrwvqteYStao2I9GNkhfZh2ls9EPNyyi/z7eaEt0bMHxDbVNNB4
 ioHtmg8mojbp9TBKflGztwZe3DnaC3BIv+xgkkvR0YiZDjOtfD2MqhT/v
 KamAEweesIjvsgV/gmuSLesiZ4g6kVBZ6Q5mxQYHxALv94iMHyzqVk57a
 A0nRtaHoN/RQRfyk2aTGClq1MirwvWmBy0CCzXbpBL0r3RgGiKS2jDHuA
 ukvcoab4q5G5q+v0XZzFYmQtqR+MEdEWL1A//o0ljn3IcjGXEZo/SgUDs
 a1iTyXKJwmrNjaTPKd8O+RdlhSutX+8vLzG1/KjcxCxsASLG6+EkOGYk9 g==;
X-CSE-ConnectionGUID: pA0MHRMeSuuSY+LegjhHMA==
X-CSE-MsgGUID: zmEuykyQQ4il83KpzVx8Pg==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="30003247"
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; d="scan'208";a="30003247"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2024 02:39:56 -0700
X-CSE-ConnectionGUID: ZS2T7seFThCaRPgc5hNsxg==
X-CSE-MsgGUID: F6FLUMKdT+mABd3I3mHE5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; d="scan'208";a="57027954"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.47])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2024 02:39:54 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?q?Juha-Pekka=20Heikkil=C3=A4?= <juha-pekka.heikkila@intel.com>
Subject: [PATCH v5 1/2] drm/xe: Separate 64K physical allocation for display
Date: Tue, 23 Jul 2024 11:39:36 +0200
Message-Id: <20240723093937.144596-2-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240723093937.144596-1-zbigniew.kempczynski@intel.com>
References: <20240723093937.144596-1-zbigniew.kempczynski@intel.com>
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

In case Tile4 + compression Battlemage requires physical 64K pages
for allocating display framebuffer. Add flag which distincts
buffer created for scanout from other buffers which don't need this
restriction.

We previously agreed userspace requires passing buffer size which
matches to region constraints. This restriction was already relaxed
in xe_bo_dumb_create(). To avoid complex UMD changes related to uapi
change let's extend this exception to scanout buffers for platforms
which display requires allocation in 64K contiguous chunks.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Juha-Pekka Heikkilä <juha-pekka.heikkila@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c           | 18 +++++++++++++++---
 drivers/gpu/drm/xe/xe_device_types.h |  1 +
 drivers/gpu/drm/xe/xe_vm.c           |  2 +-
 3 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 3295bc92d7aa..995cafca60ae 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1238,6 +1238,15 @@ void xe_bo_free(struct xe_bo *bo)
 	kfree(bo);
 }
 
+static bool display_needs64k(u32 flags, u8 vram_flags)
+{
+	if (flags & XE_BO_FLAG_SCANOUT &&
+	    vram_flags & XE_VRAM_FLAGS_DISPLAY_NEED64K)
+		return true;
+
+	return false;
+}
+
 struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
 				     struct xe_tile *tile, struct dma_resv *resv,
 				     struct ttm_lru_bulk_move *bulk, size_t size,
@@ -1264,11 +1273,13 @@ struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
 	if (flags & (XE_BO_FLAG_VRAM_MASK | XE_BO_FLAG_STOLEN) &&
 	    !(flags & XE_BO_FLAG_IGNORE_MIN_PAGE_SIZE) &&
 	    ((xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K) ||
-	     (flags & (XE_BO_FLAG_NEEDS_64K | XE_BO_FLAG_NEEDS_2M)))) {
+	    display_needs64k(flags, xe->info.vram_flags) ||
+	    (flags & (XE_BO_FLAG_NEEDS_64K | XE_BO_FLAG_NEEDS_2M)))) {
 		size_t align = flags & XE_BO_FLAG_NEEDS_2M ? SZ_2M : SZ_64K;
 
 		aligned_size = ALIGN(size, align);
-		if (type != ttm_bo_type_device)
+		if (type != ttm_bo_type_device ||
+		    display_needs64k(flags, xe->info.vram_flags))
 			size = ALIGN(size, align);
 		flags |= XE_BO_FLAG_INTERNAL_64K;
 		alignment = align >> PAGE_SHIFT;
@@ -2316,8 +2327,9 @@ int xe_bo_dumb_create(struct drm_file *file_priv,
 	uint32_t handle;
 	int cpp = DIV_ROUND_UP(args->bpp, 8);
 	int err;
+	u8 flags_64k = XE_VRAM_FLAGS_NEED64K | XE_VRAM_FLAGS_DISPLAY_NEED64K;
 	u32 page_size = max_t(u32, PAGE_SIZE,
-		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K);
+		xe->info.vram_flags & flags_64k ? SZ_64K : SZ_4K);
 
 	args->pitch = ALIGN(args->width * cpp, 64);
 	args->size = ALIGN(mul_u32_u32(args->pitch, args->height),
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 36252d5b1663..2c5b60dda778 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -47,6 +47,7 @@ struct xe_pat_ops;
 #define HAS_HECI_CSCFI(xe) ((xe)->info.has_heci_cscfi)
 
 #define XE_VRAM_FLAGS_NEED64K		BIT(0)
+#define XE_VRAM_FLAGS_DISPLAY_NEED64K	BIT(1)
 
 #define XE_GT0		0
 #define XE_GT1		1
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 8fa2821d0c64..4b870263a641 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2905,7 +2905,7 @@ static int xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_bo *bo,
 		return -EINVAL;
 	}
 
-	if (bo->flags & XE_BO_FLAG_INTERNAL_64K) {
+	if (!(bo->flags & XE_BO_FLAG_SCANOUT) && bo->flags & XE_BO_FLAG_INTERNAL_64K) {
 		if (XE_IOCTL_DBG(xe, obj_offset &
 				 XE_64K_PAGE_MASK) ||
 		    XE_IOCTL_DBG(xe, addr & XE_64K_PAGE_MASK) ||
-- 
2.34.1

