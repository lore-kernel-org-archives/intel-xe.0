Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A249C79FA1
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 13:50:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EACDD10EC12;
	Tue,  8 Sep 2026 13:50:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MLV5HT7u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D02D10EC09
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 13:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788875453; x=1820411453;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tn9aqsUNGQ3a5OqSkWGV0OCwZYupMzrIbI9zp20C8mg=;
 b=MLV5HT7uc/rOVNnvZX67UjgLH1G+w6tTLjuml4gXwSezhgPO6/e8jCb7
 vWo85zib4SohxWzoLchB/jaP8Kl6rpHOh+eGAVn1R6h0eNnQWa0m96QhR
 gYM7xp1GXuUdQbA8C0h+noRQ+n5cxFGIqXzzxhE3VS40XhFK4wfB95Puv
 YGUAa7JSoKQbAOHtLfGc0WLkC8/lrZ3NTCS9LKsaygLi350dVYrhqSqFX
 HD9l17xCKAjCP/kaG8hFTxXAfCtl1rFIqkNFBxK8aPNWvAGrzLubj9teu
 uKNXtevPnXlFGbSYfEOLX7zZ568k4X6ks4Lo9ULC7FQOGsvi3DQqVxsto w==;
X-CSE-ConnectionGUID: uQnj0GJcTVCIF3pclfEtUg==
X-CSE-MsgGUID: koZ41BaxQKC3+auNzMj5XQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="106793379"
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="106793379"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 06:50:53 -0700
X-CSE-ConnectionGUID: 6G6mXGHHRRybjp/9aj7M4g==
X-CSE-MsgGUID: 6eR4SNc2ToS0UZm4n9EooQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="270519692"
Received: from rvuia-mobl.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.158])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 06:50:52 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
	Ilia Levi <ilia.levi@intel.com>
Subject: [PATCH v4 4/8] drm/xe/mmio_gem: Revoke drm_vma_node on xe_mmio_gem
 destroy
Date: Tue,  8 Sep 2026 14:50:00 +0100
Message-ID: <20260908134955.1344429-14-matthew.auld@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260908134955.1344429-10-matthew.auld@intel.com>
References: <20260908134955.1344429-10-matthew.auld@intel.com>
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

Fixes: 1ffcf8b8ae8a ("drm/xe: Support for mmap-ing mmio regions")
Suggested-by: Ilia Levi <ilia.levi@intel.com>
Assisted-by: Claude:claude-opus-4.6
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
Reviewed-by: Ilia Levi <ilia.levi@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio_gem.c | 4 +++-
 drivers/gpu/drm/xe/xe_mmio_gem.h | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio_gem.c b/drivers/gpu/drm/xe/xe_mmio_gem.c
index 3b6d04efe81a..3c42d8358c7d 100644
--- a/drivers/gpu/drm/xe/xe_mmio_gem.c
+++ b/drivers/gpu/drm/xe/xe_mmio_gem.c
@@ -138,14 +138,16 @@ static void xe_mmio_gem_free(struct drm_gem_object *base)
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
2.55.0

