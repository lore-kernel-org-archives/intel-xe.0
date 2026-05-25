Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E2CACD5BB1
	for <intel-xe@archiver.kernel.org>; Mon, 25 May 2026 12:58:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CDD010E31A;
	Mon, 25 May 2026 12:58:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZZmD6f41";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B8ED10E315
 for <intel-xe@lists.freedesktop.org>; Mon, 25 May 2026 12:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779713901; x=1811249901;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=t1BJb1nWvYrI4cegKp2VkhAYHWf5QuQTHiwHyFsITqE=;
 b=ZZmD6f41uJg9FH/mlVwZ/Wk9ota6Y7bAlm/PV6HYYbZeNN8Mx+4f0C7b
 ACP8xjcMcUP17kJ7MNAMtyMKI8nNR2fo1TTckrKOGZIJo6WN5gjSIhYsO
 Rt627I/IPrWwNqKIYyLQPsrYmhkZS0843Byuu4MfA0BCdNddgddxttKQC
 Qk3NBVrVS1eh8JMiwc8DesBPhOLXz9KsN9c8TYULf24hDiyNsnv6ehmxW
 T95Dg+8QrckDlxgzUBHssmEfeg3aCko+GJ3Jh2yT9RughHdrBDlCVGaJ1
 6kVr442iNd0q1PfnPwn8bJEuU1AGMmUcbA2BUToMDlUPmiAT2Bxm+XM84 A==;
X-CSE-ConnectionGUID: ZOz8y5jJT3WICenSBAJ5zw==
X-CSE-MsgGUID: dFHM1izSSgujuTWm25CVRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="91223150"
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; d="scan'208";a="91223150"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 05:58:21 -0700
X-CSE-ConnectionGUID: c3orwbyPS2mCn5A6Qh1XAA==
X-CSE-MsgGUID: GbeHrlYgTpeYCEFpcU01nw==
X-ExtLoop1: 1
Received: from ilevi-vm-u24.iil.labsad.intel.com ([10.111.58.213])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 05:58:20 -0700
From: Ilia Levi <ilia.levi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ilia.levi@intel.com, koby.elbaz@intel.com, shuicheng.lin@intel.com,
 thomas.hellstrom@intel.com
Subject: [PATCH 2/4] drm/xe/mmio_gem: Revoke drm_vma_node on xe_mmio_gem
 destroy
Date: Mon, 25 May 2026 15:58:04 +0300
Message-ID: <20260525125801.975038-8-ilia.levi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260525125801.975038-6-ilia.levi@intel.com>
References: <20260525125801.975038-6-ilia.levi@intel.com>
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
index 48b3a993afcf..07ae21dc6211 100644
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

