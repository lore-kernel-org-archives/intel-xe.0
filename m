Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DA3AC27C46
	for <intel-xe@archiver.kernel.org>; Fri, 27 Oct 2023 10:48:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CD7110E977;
	Fri, 27 Oct 2023 10:48:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF69010E06E
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Oct 2023 10:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698403721; x=1729939721;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=e/hJ8/CWxF42APm/SQMZwn4alMeqktV45oTYy4sQ0a8=;
 b=Qvn3yX8JoDlWWrtnRFbh0k6crpphWYj/sqWJuyjEGt5/kbfeftJq6K/h
 rPhB+yhWWhnd91truqbLytDoWb2LiAAL0DhY9dcCMsbaTCgF/tCtit75h
 m60j0sXGEQZ5AQAF6Ena8DdIn5okkLc1BXYSvxkGfafE5pFo8bPAPK+q8
 VpZoy15lOuuUBYZbyJQ+sjykOg/K23shkkn4v98LFZBdy1LsrPuq5g8tP
 XzMYPR/zfG2wy8sKfbK3tW+6V8DBa8CWhDafcdJWkal7CqtnOrq5d29uC
 19IVOntaDADGS6kHjqSyi40wyr5HFPeLlmyWdJ0WzwbVCM+AMkHGgi7ZZ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="545187"
X-IronPort-AV: E=Sophos;i="6.03,256,1694761200"; 
   d="scan'208";a="545187"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 03:48:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="794543102"
X-IronPort-AV: E=Sophos;i="6.03,256,1694761200"; d="scan'208";a="794543102"
Received: from tmarkand-mobl1.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.252.2.153])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 03:48:31 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 27 Oct 2023 11:48:14 +0100
Message-ID: <20231027104810.310819-8-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231027104810.310819-5-matthew.auld@intel.com>
References: <20231027104810.310819-5-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 3/3] drm/xe/bo: sync kernel fences for KMD
 buffers
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

With things like pipelined evictions, VRAM pages can be marked as free
and yet still have some active kernel fences, with the idea that the
next caller to allocate the memory will respect them. However it looks
like we are missing synchronisation for KMD internal buffers, like
page-tables, lrc etc. For userspace objects we should already have the
required synchronisation for CPU access via the fault handler, and
likewise for GPU access when vm_binding them.

To fix this synchronise against any kernel fences for all KMD objects at
creation. This should resolve some severe corruption seen during
evictions.

v2 (Matt B):
  - Revamp the comment explaining this. Also mention why USAGE_KERNEL is
    correct here.

Closes: ?
Testcase: igt@xe-evict-ccs
Reported-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 61789c0e88fb..d8afcae0780f 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1272,6 +1272,27 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
 	else
 		ttm_bo_move_to_lru_tail_unlocked(&bo->ttm);
 
+	/*
+	 * The VRAM pages underneath are potentially still being accessed by the
+	 * GPU, as per async GPU clearing and async evictions. However TTM makes
+	 * sure to add any corresponding move/clear fences into the objects
+	 * dma-resv using the DMA_RESV_USAGE_KERNEL slot.
+	 *
+	 * For KMD internal buffers we don't care about GPU clearing, however we
+	 * still need to handle async evictions, where the VRAM is still being
+	 * accessed by the GPU. Most internal callers are not expecting this,
+	 * since they are missing the required synchronisation before accessing
+	 * the memory. To keep things simple just sync wait any kernel fences
+	 * here, if the buffer is designated KMD internal.
+	 *
+	 * For normal userspace objects we should already have the required
+	 * pipelining or sync waiting elsewhere, since we already have to deal
+	 * with things like async GPU clearing.
+	 */
+	if (type == ttm_bo_type_kernel)
+		dma_resv_wait_timeout(bo->ttm.base.resv, DMA_RESV_USAGE_KERNEL,
+				      false, MAX_SCHEDULE_TIMEOUT);
+
 	return bo;
 }
 
-- 
2.41.0

