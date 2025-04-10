Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09AA3C3601E
	for <intel-xe@archiver.kernel.org>; Thu, 10 Apr 2025 16:27:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C252310EA09;
	Thu, 10 Apr 2025 16:27:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bDy1XTIj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE1C310EA09
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Apr 2025 16:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744302449; x=1775838449;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=chKz2qbGpXeMzyi0x8vRH1CFhl6txUlwu3vv0gJbwUw=;
 b=bDy1XTIjbXM0PXJGG0Rdtsxp4fhY7veIzyH+b19/eCK0vJ2OZhcz7QbG
 h+9bQ1iKRjAd1+wiMxxofTkMoVu8DWZx10w0UL3Vtd2uJd/NPG/DALiul
 v8/gb9FTwjKKQnjOa/6DDZd7gzMMjO8yBw8HC3+YcP/fffZtVVVsiZ4hi
 NhwzX9UEQ8SbPc+NhA/mak2ZbjSJ8DLrTh4Izm4UowXQzIdj3wLz75t9H
 ctK8xTYjQnst1DEDPj/lc2D14liTRd9EB7tM6dj7opJUNQKJ4/9vvfE+8
 X6s/FIacgVFZx4FgbOkHBqQFYbQA7ckwNpzfuD3T8/9foyHYiBzLil/eH g==;
X-CSE-ConnectionGUID: c0PPVfp2RYiUoodJj2Asug==
X-CSE-MsgGUID: ckvUrzXgSUCg+TTX5mdkoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="63377528"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="63377528"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 09:27:29 -0700
X-CSE-ConnectionGUID: VynYyzp3Sw6zOYf33MFRRA==
X-CSE-MsgGUID: lS/peeEeTPuuQ9QBhaSONA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="152135201"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.125])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 09:27:28 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>, stable@vger.kernel.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH] drm/xe/dma_buf: stop relying on placement in unmap
Date: Thu, 10 Apr 2025 17:27:17 +0100
Message-ID: <20250410162716.159403-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.49.0
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

The is_vram() is checking the current placement, however if we consider
exported VRAM with dynamic dma-buf, it looks possible for the xe driver
to async evict the memory, notifying the importer, however importer does
not have to call unmap_attachment() immediately, but rather just as
"soon as possible", like when the dma-resv idles. Following from this we
would then pipeline the move, attaching the fence to the manager, and
then update the current placement. But when the unmap_attachment() runs
at some later point we might see that is_vram() is now false, and take
the complete wrong path when dma-unmapping the sg, leading to
explosions.

To fix this check if the sgl was mapping a struct page.

v2:
  - The attachment can be mapped multiple times it seems, so we can't
    really rely on encoding something in the attachment->priv. Instead
    see if the page_link has an encoded struct page. For vram we expect
    this to be NULL.

Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4563
Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: <stable@vger.kernel.org> # v6.8+
Acked-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/xe/xe_dma_buf.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
index f67803e15a0e..f7a20264ea33 100644
--- a/drivers/gpu/drm/xe/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/xe_dma_buf.c
@@ -145,10 +145,7 @@ static void xe_dma_buf_unmap(struct dma_buf_attachment *attach,
 			     struct sg_table *sgt,
 			     enum dma_data_direction dir)
 {
-	struct dma_buf *dma_buf = attach->dmabuf;
-	struct xe_bo *bo = gem_to_xe_bo(dma_buf->priv);
-
-	if (!xe_bo_is_vram(bo)) {
+	if (sg_page(sgt->sgl)) {
 		dma_unmap_sgtable(attach->dev, sgt, dir, 0);
 		sg_free_table(sgt);
 		kfree(sgt);
-- 
2.49.0

