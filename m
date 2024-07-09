Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1155C2BD09
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jul 2024 12:25:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 739F610E533;
	Tue,  9 Jul 2024 12:25:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RVtM3h0j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4948D10E533
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jul 2024 12:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720527929; x=1752063929;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GUgBolM+ezlvlZ93T8EGQPampWnr3eSlCuVjeTAak4U=;
 b=RVtM3h0j90C6n3l4NCs4Dx9r5gX5RY+opUz2s3qGjjdEY248H3kxokWC
 3uD+lgA+f+eatFR1oxD19HRmCqBURe04TNI/pPQwU09Me+hzfKnwTTfjE
 1nNYttEnAbEdNO+FFbJfA0A2kZWwzXNdfHNDt/aSGrjoMICYmQGu8gZWV
 /Betp2cmYTq+i3ipoq94gg0Y3eYzTRX8+3Q5GvzcnQ8ZuViSzSfPcyDoF
 zbLUm0AwmedEJ6TkntAV5Gizh0YX3L/BUNq+fH3lOzDrJTBYofqWw379h
 d+l3jISX1ppRHabenIEk1IAH1jCKUTuJlMU59ACP/cNa2hFqS7lcIt07Y Q==;
X-CSE-ConnectionGUID: 3ZPGGUpCTIKflMuAUb6SAg==
X-CSE-MsgGUID: BDbAwcpaSUi8/6YGue+hVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="17647149"
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; d="scan'208";a="17647149"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 05:25:29 -0700
X-CSE-ConnectionGUID: jFkw0S5uSs6XREjHXmxPag==
X-CSE-MsgGUID: jk3TqvDDQ/OT4bC2f813Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; d="scan'208";a="47774118"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.59])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 05:25:27 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v2 1/2] drm/xe: Separate 64K physical allocation for display
Date: Tue,  9 Jul 2024 14:25:13 +0200
Message-Id: <20240709122514.538137-2-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240709122514.538137-1-zbigniew.kempczynski@intel.com>
References: <20240709122514.538137-1-zbigniew.kempczynski@intel.com>
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

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
v2: Distinct 64K for Battlemage only (Matt)
---
 drivers/gpu/drm/xe/xe_bo.c           | 9 +++++++--
 drivers/gpu/drm/xe/xe_device_types.h | 1 +
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 31192d983d9e..fbcf77698bf1 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1984,9 +1984,13 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 	if (args->flags & DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING)
 		bo_flags |= XE_BO_FLAG_DEFER_BACKING;
 
-	if (args->flags & DRM_XE_GEM_CREATE_FLAG_SCANOUT)
+	if (args->flags & DRM_XE_GEM_CREATE_FLAG_SCANOUT) {
 		bo_flags |= XE_BO_FLAG_SCANOUT;
 
+		if (xe->info.vram_flags & XE_VRAM_FLAGS_DISPLAY_NEED64K)
+			bo_flags |= XE_BO_NEEDS_64K;
+	}
+
 	bo_flags |= args->placement << (ffs(XE_BO_FLAG_SYSTEM) - 1);
 
 	if (args->flags & DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM) {
@@ -2315,8 +2319,9 @@ int xe_bo_dumb_create(struct drm_file *file_priv,
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
index f0cf9020e463..386faaffac53 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -46,6 +46,7 @@ struct xe_pat_ops;
 #define HAS_HECI_GSCFI(xe) ((xe)->info.has_heci_gscfi)
 
 #define XE_VRAM_FLAGS_NEED64K		BIT(0)
+#define XE_VRAM_FLAGS_DISPLAY_NEED64K	BIT(1)
 
 #define XE_GT0		0
 #define XE_GT1		1
-- 
2.34.1

