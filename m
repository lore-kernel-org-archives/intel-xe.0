Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5F0ECD5BB1
	for <intel-xe@archiver.kernel.org>; Tue, 26 May 2026 12:51:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92B1210E49D;
	Tue, 26 May 2026 12:51:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fs4VBl5T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 350FC10E49D
 for <intel-xe@lists.freedesktop.org>; Tue, 26 May 2026 12:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779799912; x=1811335912;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Xj++f1mQDkWZk8gIlRc4qbyLU9oi8iiPdYVRwJilHH4=;
 b=fs4VBl5TegLKI7XLHgyfpbByKlfh45qoQensXKH7FCPjNjDRAhbJayu3
 WRpuKPhGlUsPUjdQgms65uBWcUyfCsXW2tuOqqae5gEDEg1kgXI18XuBf
 wXE1e3KkEfN3jy3Uf1fNlMbUYYbKHUzdL6zKxkKXBhFUSurnx74po6wQh
 +R+d38hBRcbj/I/W9KlNcJn2tlyeKqvFP/5tvQVnFqjW2hVD3J/XxrhQN
 URaKN3JAFZHlHguNCjBjibgB4YwLx+pnoQnRgpIrDrr2z8an0Lp0DBhqW
 BRPherf0bRRdf7zEpAUZou1Lkhe1yuCPZfPtDmFLys6okeQRY/cs8yYgy w==;
X-CSE-ConnectionGUID: 0SyFBeE2RK+e/rpTSJMlHg==
X-CSE-MsgGUID: N8C7ZMIoS0WIK0XxYO1Prg==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="92082768"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="92082768"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 05:51:30 -0700
X-CSE-ConnectionGUID: /fTF989ET0q0Am3Kn/VLvQ==
X-CSE-MsgGUID: jug7vxTFQzuYHbR7J5PMIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="235554592"
Received: from ilevi-vm-u24.iil.labsad.intel.com ([10.111.58.213])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 05:51:26 -0700
From: Ilia Levi <ilia.levi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ilia.levi@intel.com, koby.elbaz@intel.com, shuicheng.lin@intel.com,
 thomas.hellstrom@intel.com
Subject: [PATCH v2 3/5] drm/xe/mmio_gem: Revoke drm_vma_node on xe_mmio_gem
 destroy
Date: Tue, 26 May 2026 15:51:10 +0300
Message-ID: <20260526125106.2806522-10-ilia.levi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260526125106.2806522-7-ilia.levi@intel.com>
References: <20260526125106.2806522-7-ilia.levi@intel.com>
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

From: Shuicheng Lin <shuicheng.lin@intel.com>

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
Reviewed-by: Ilia Levi <ilia.levi@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio_gem.c | 4 +++-
 drivers/gpu/drm/xe/xe_mmio_gem.h | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio_gem.c b/drivers/gpu/drm/xe/xe_mmio_gem.c
index 15e884ad3f1c..330ba3552e12 100644
--- a/drivers/gpu/drm/xe/xe_mmio_gem.c
+++ b/drivers/gpu/drm/xe/xe_mmio_gem.c
@@ -131,14 +131,16 @@ static void xe_mmio_gem_free(struct drm_gem_object *base)
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

