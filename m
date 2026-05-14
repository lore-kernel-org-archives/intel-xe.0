Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66DD7CD4F39
	for <intel-xe@archiver.kernel.org>; Thu, 14 May 2026 19:17:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13C6710E40D;
	Thu, 14 May 2026 19:17:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jdBFIojn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 838FF10F31F
 for <intel-xe@lists.freedesktop.org>; Thu, 14 May 2026 19:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778786218; x=1810322218;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OPGbKySq6NfSiwyPRvuJsdguSi7Cihl8L1izgyfg9Ak=;
 b=jdBFIojn9Qbd7kdWKkVDvzRJ03XZT+cysaIJTQv27IF+oQin6dH3PYq9
 zQm7zHkpkPCSotyyEI+Kq5Tmiwxed58k4ZNx9UWeAQKyONIWa3YdwwY7r
 1wyd59ORujxvIsz2PXIHhh/WAEkNpQGlUwG83/SRzxjr2OHT6XntqroL7
 G8+Ka/Ii3AB4y5tlZBi46DPdeXTdo3JWpwbJjvA8kW+uhDyleu3PxNijK
 pj0rLeq1pDaraW5nFfO1sQk1BZ1XXUDUOBMpUDyy6RdJT2876oe0TTrdT
 d6fGDswaLQ6ScvsK9sHb20Rqn2D6jbqSS22lNEfDWUx4uvnMtftX8tXXZ w==;
X-CSE-ConnectionGUID: 6NjHk7sgT9CKL+nYdU+Wig==
X-CSE-MsgGUID: OKklxxpYR56q2ljDs+POtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="97313320"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; d="scan'208";a="97313320"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 12:16:58 -0700
X-CSE-ConnectionGUID: FcfuKuCsSZmoDF9tA8ToxA==
X-CSE-MsgGUID: 4y0p36XPQh+DI+iXqnWu4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; d="scan'208";a="238734392"
Received: from osgcshtiger.sh.intel.com ([10.239.81.49])
 by orviesa007.jf.intel.com with ESMTP; 14 May 2026 12:16:58 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
	Ilia Levi <ilia.levi@intel.com>
Subject: [PATCH] drm/xe: Revoke drm_vma_node on xe_mmio_gem free
Date: Thu, 14 May 2026 19:16:49 +0000
Message-Id: <20260514191649.592407-1-shuicheng.lin@intel.com>
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

Store the owning drm_file in struct xe_mmio_gem and call
drm_vma_node_revoke() from xe_mmio_gem_free().

The xe_mmio_gem helpers currently have no in-tree users; this prevents
a latent leak once they are used.

Fixes: 1ffcf8b8ae8a ("drm/xe: Support for mmap-ing mmio regions")
Assisted-by: Claude:claude-opus-4.6
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
Cc: Ilia Levi <ilia.levi@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio_gem.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_mmio_gem.c b/drivers/gpu/drm/xe/xe_mmio_gem.c
index 8c803ef233cc..78f6cc6fe9a1 100644
--- a/drivers/gpu/drm/xe/xe_mmio_gem.c
+++ b/drivers/gpu/drm/xe/xe_mmio_gem.c
@@ -36,6 +36,7 @@ static vm_fault_t xe_mmio_gem_vm_fault(struct vm_fault *);
 
 struct xe_mmio_gem {
 	struct drm_gem_object base;
+	struct drm_file *file;
 	phys_addr_t phys_addr;
 };
 
@@ -96,6 +97,8 @@ struct xe_mmio_gem *xe_mmio_gem_create(struct xe_device *xe, struct drm_file *fi
 	if (err)
 		goto free_gem;
 
+	obj->file = file;
+
 	return obj;
 
 free_gem:
@@ -121,6 +124,8 @@ static void xe_mmio_gem_free(struct drm_gem_object *base)
 {
 	struct xe_mmio_gem *obj = to_xe_mmio_gem(base);
 
+	if (obj->file)
+		drm_vma_node_revoke(&base->vma_node, obj->file);
 	drm_gem_object_release(base);
 	kfree(obj);
 }
-- 
2.43.0

