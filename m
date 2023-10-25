Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31DCEC0032E
	for <intel-xe@archiver.kernel.org>; Wed, 25 Oct 2023 17:40:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0301D10E0FD;
	Wed, 25 Oct 2023 17:40:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2806F10E055
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Oct 2023 17:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698255594; x=1729791594;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=q2HZAVoHdcKrgPGM9phkiGhvQ8pSwGBtNUBEZMTIrVU=;
 b=K1RQqTNzrSyjcgbx9CldB7RC0wpsoWSwzxNprVHhcEd/XcsHxnYXRjDm
 N3bjTwU6+DH7kA2RGFU5AlZR/S8WSkpQhqN9/6FQx79xjtrQ235ifPrBO
 f0QhS/quC/ElnNoAoj+RlL8HjJbYCE3YGuQIpYllzSg8yri9PAJKrixbn
 xj9MePAiNt04yQkOvkAWDDKu1e7EufSG/f4m+F5oW6ENosvnYZ1iWPMJN
 HAnqhsJee4n9V51XXZZtYzTz40KcDJdUT2oYEE29ESEex5Yv0o38+4CEK
 q0QZzkNzS5NiUA6d9mxa5xmWlpVlRFvsdGmC8btqkdV8uvdoa8vKmFwnU w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="391233703"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="391233703"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 10:39:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="735464922"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="735464922"
Received: from kozlovdm-mobl.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.252.19.91])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 10:39:52 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 25 Oct 2023 18:39:41 +0100
Message-ID: <20231025173937.197744-8-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231025173937.197744-5-matthew.auld@intel.com>
References: <20231025173937.197744-5-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/3] drm/xe/bo: sync kernel fences for KMD buffers
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
required serialisation for CPU access via the fault handler, and
likewise for GPU access when vm_binding them.

To fix this serialise against any kernel fences for all KMD objects at
creation. This seems to resolve some severe corruption seen during
evictions.

Closes: ?
Testcase: igt@xe-evict-ccs
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 61789c0e88fb..26a103aa5d48 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1272,6 +1272,16 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
 	else
 		ttm_bo_move_to_lru_tail_unlocked(&bo->ttm);
 
+	/*
+	 * TTM can give us VRAM that still has active fences i.e GPU might still
+	 * be accessing it. To keep things simple just sync any kernel fences
+	 * here, if the buffer is KMD internal. For normal userspace objects we
+	 * should already have the required pipelining or sync waiting.
+	 */
+	if (type == ttm_bo_type_kernel)
+		dma_resv_wait_timeout(bo->ttm.base.resv, DMA_RESV_USAGE_KERNEL,
+				      false, MAX_SCHEDULE_TIMEOUT);
+
 	return bo;
 }
 
-- 
2.41.0

