Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD6C606A32C
	for <intel-xe@archiver.kernel.org>; Sat,  7 Nov 2026 17:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=H+X3VFX8
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1BF510E63D;
	Sat,  7 Nov 2026 17:27:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C956610E0E0
 for <intel-xe@lists.freedesktop.org>; Sat,  7 Nov 2026 17:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794072465; x=1825608465;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=MYKmHza6uAPAdDNqvY8oY/TXyccdfK1OlCm8v+4ZnD4=;
 b=H+X3VFX8rpLo8HgWd/TylFL2I0AGqMEmjm/v8rFUd2ssWL9gc/aFrWMC
 3rMzbVfji2F4TCUmBpYTwJXNMYp9VfPFthqUCxOIFOgWkuYNsmTX/Exp1
 X1iMrkWLo5wIl0p2cI5SpDsMPbYP48HM3fXLS/ZnePbb/Rk+OY/D/3H0W
 8JMzjZrVaTg5sk6hObXJpM564C0G9gumCczNncneSncxA2+Q2Lf3t0mq/
 OCfZdLyWbv3TFcayNEYmdWXVq/ozCHpEMLR3QzZBbhf8vFriff72KF1/Y
 RjdYysDbhK30OtOjtnqGpJnW/o4kaGp8zuLwEkD288w/1gDKOmBypw27l A==;
X-CSE-ConnectionGUID: 43S2GUPgTaGjSBPMGTQfnw==
X-CSE-MsgGUID: jPNH6rJUSdiut+GuudmIsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11959"; a="2901541"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2901541"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2026 09:27:44 -0800
X-CSE-ConnectionGUID: c4p7VGooQ1Wkk5C+luvIow==
X-CSE-MsgGUID: EUPF1aWjQiqZmATU8tUDjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="9382477"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.217])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2026 09:27:43 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/3] drm/xe: don't allocate fake mmap offsets for imported
 dma-bufs
Date: Sat,  7 Nov 2026 17:26:50 +0000
Message-ID: <20261107-oom-fun-v1-1-be9eb05b82ed@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261107-oom-fun-v1-0-be9eb05b82ed@intel.com>
References: <20261107-oom-fun-v1-0-be9eb05b82ed@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ttm_bo_init_reserved() allocates a fake mmap offset (drm_vma_offset
node) for ttm_bo_type_sg BOs, even though xe rejects CPU faults on
imported dma-bufs. Since the offset space is limited to 1 TiB per
device on 64-bit, heavy P2P dma-buf importing on multi-GPU systems can
exhaust it and cause imports to fail with -ENOSPC.

Remove the vma_node once an imported BO is created and reject BOs
without one in xe_gem_mmap_offset_ioctl().

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c      | 6 ++++++
 drivers/gpu/drm/xe/xe_dma_buf.c | 9 +++++++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 42a6aa1a2e4a..0181f73ef66d 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -3851,6 +3851,12 @@ int xe_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
 	if (XE_IOCTL_DBG(xe, !gem_obj))
 		return -ENOENT;
 
+	/* Imported dma-bufs have no mmap offset since CPU access is rejected. */
+	if (XE_IOCTL_DBG(xe, !drm_vma_node_size(&gem_obj->vma_node))) {
+		xe_bo_put(gem_to_xe_bo(gem_obj));
+		return -EINVAL;
+	}
+
 	/* The mmap offset was set up at BO allocation time. */
 	args->offset = drm_vma_node_offset_addr(&gem_obj->vma_node);
 
diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
index 5bf13dc4b61d..17a8663a68de 100644
--- a/drivers/gpu/drm/xe/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/xe_dma_buf.c
@@ -12,6 +12,7 @@
 
 #include <drm/drm_device.h>
 #include <drm/drm_prime.h>
+#include <drm/drm_vma_manager.h>
 #include <drm/ttm/ttm_tt.h>
 
 #include "tests/xe_test.h"
@@ -353,6 +354,14 @@ xe_dma_buf_create_obj(struct drm_device *dev, struct dma_buf *dma_buf)
 	}
 	drm_gem_object_put(dummy_obj);
 
+	/*
+	 * CPU faults on imported BOs are rejected, so there is no point in
+	 * consuming fake mmap offset space for them.
+	 */
+	if (!ret)
+		drm_vma_offset_remove(bo->ttm.bdev->vma_manager,
+				      &bo->ttm.base.vma_node);
+
 	return ret ? ERR_PTR(ret) : &bo->ttm.base;
 }
 

-- 
2.56.0
