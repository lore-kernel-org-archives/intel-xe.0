Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4301CD4F47
	for <intel-xe@archiver.kernel.org>; Sun, 17 May 2026 17:25:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A38D10E269;
	Sun, 17 May 2026 17:25:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OKRAXO9q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ECF910E269
 for <intel-xe@lists.freedesktop.org>; Sun, 17 May 2026 17:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779038722; x=1810574722;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Fa7nXKoWKvN6GRD84NIUUi/IqkAGC185W5HZ8C4SP+8=;
 b=OKRAXO9qMTkCBxbhz7MMOYYrYZ7ALyGBlxfVThLmAAue6XQiH4TIGKud
 MpDoiX61DtEM52HQzJ4CnB04JgsweasqPdSCQzitdFmvX3oBQRf3g5vQA
 1fgcMsPoWGaSR5237l152lEOInNlYFAEBN6WfTlTNfq2iBuNrrzpCzrn/
 dNiCCeUl44WcGIXYcGpzksfNJ2pnnv/OQp4N+jmElpES1fnY6Q762/HC0
 X8mXKxhQP/MB9+uVYYcBPygzNG45h1prFrjHjP6vriVk0ImIgblAblj6+
 IAGYCvt+UZ/shU3nh1uXE3ADn6SPa16NTLOySR69TGBRQByOBe11NpzAf w==;
X-CSE-ConnectionGUID: w6jzuJlKTsCrp4wq9XKbTg==
X-CSE-MsgGUID: ijEbLJENRjqnCeZUOK093A==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="105365569"
X-IronPort-AV: E=Sophos;i="6.23,240,1770624000"; d="scan'208";a="105365569"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2026 10:25:21 -0700
X-CSE-ConnectionGUID: WswythuyQJ2JwRPixKLKsg==
X-CSE-MsgGUID: yTo1/W/8QYePitZ0c0WSUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,240,1770624000"; d="scan'208";a="238330628"
Received: from osgcshtiger.sh.intel.com ([10.239.81.49])
 by orviesa010.jf.intel.com with ESMTP; 17 May 2026 10:25:20 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
	Ilia Levi <ilia.levi@intel.com>
Subject: [PATCH] drm/xe: Revoke drm_vma_node on xe_mmio_gem destroy
Date: Sun, 17 May 2026 17:24:08 +0000
Message-Id: <20260517172408.1083275-1-shuicheng.lin@intel.com>
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

xe_mmio_gem_create() calls drm_vma_node_allow() but nothing ever calls
drm_vma_node_revoke(). The drm_vma_offset_file rb-tree entry allocated
by drm_vma_node_allow() is not freed by drm_gem_object_release(), so
it is leaked on every create/destroy cycle.

Add a struct drm_file * parameter to xe_mmio_gem_destroy() and call
drm_vma_node_revoke() from there, mirroring the drm_vma_node_allow()
call in xe_mmio_gem_create().

The xe_mmio_gem helpers currently have no in-tree users; this prevents
a latent leak once they are used.

Fixes: 1ffcf8b8ae8a ("drm/xe: Support for mmap-ing mmio regions")
Suggested-by: Ilia Levi <ilia.levi@intel.com>
Assisted-by: Claude:claude-opus-4.6
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio_gem.c | 4 +++-
 drivers/gpu/drm/xe/xe_mmio_gem.h | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio_gem.c b/drivers/gpu/drm/xe/xe_mmio_gem.c
index 8c803ef233cc..b7dcc2cc572d 100644
--- a/drivers/gpu/drm/xe/xe_mmio_gem.c
+++ b/drivers/gpu/drm/xe/xe_mmio_gem.c
@@ -128,14 +128,16 @@ static void xe_mmio_gem_free(struct drm_gem_object *base)
 /**
  * xe_mmio_gem_destroy - Destroy the GEM object that exposes an MMIO region
  * @gem: the GEM object to destroy
+ * @file: DRM file descriptor previously passed to xe_mmio_gem_create()
  *
  * This function releases resources associated with the GEM object created by
  * xe_mmio_gem_create().
  *
  * See: "Exposing MMIO regions to userspace"
  */
-void xe_mmio_gem_destroy(struct xe_mmio_gem *gem)
+void xe_mmio_gem_destroy(struct xe_mmio_gem *gem, struct drm_file *file)
 {
+	drm_vma_node_revoke(&gem->base.vma_node, file);
 	xe_mmio_gem_free(&gem->base);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_mmio_gem.h b/drivers/gpu/drm/xe/xe_mmio_gem.h
index 4b76d5586ebb..80d7795f07c8 100644
--- a/drivers/gpu/drm/xe/xe_mmio_gem.h
+++ b/drivers/gpu/drm/xe/xe_mmio_gem.h
@@ -15,6 +15,6 @@ struct xe_mmio_gem;
 struct xe_mmio_gem *xe_mmio_gem_create(struct xe_device *xe, struct drm_file *file,
 				       phys_addr_t phys_addr, size_t size);
 u64 xe_mmio_gem_mmap_offset(struct xe_mmio_gem *gem);
-void xe_mmio_gem_destroy(struct xe_mmio_gem *gem);
+void xe_mmio_gem_destroy(struct xe_mmio_gem *gem, struct drm_file *file);
 
 #endif /* _XE_MMIO_GEM_H_ */
-- 
2.43.0

