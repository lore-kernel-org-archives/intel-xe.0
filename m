Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0299ECD8CB9
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jun 2026 17:27:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3E2C10E528;
	Wed, 10 Jun 2026 17:27:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mRNA3K0g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C776D10E528
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jun 2026 17:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781112431; x=1812648431;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lK971/DmDFzEk4FlP+P4tsPBUIGMBjrwzsHTD1Yhgjc=;
 b=mRNA3K0gFGgIVuV+AOCtCyajsC5+hXeDMkuJ6v8b5vzWENTMboDPTvfy
 yfgFKg2P+dd1hsGWQxOCKv9n436G6yBA11I4MVEGQZu3tlsyOHquIxTo5
 UzoQlb7geK0fVm6aVFUCm5MrtPtzBpzKrCVjaiKhtC1YXc9ZJvJLUATwR
 EUghVxItV2SS5YWphiEtU0bfD0MtjJmqZbt8PnNIHCgeu+jZbyQukWG0d
 G/IeOxPunSQ/hNbNBz1VTLqKGJ9M2BcXbEH3J7S9pC1T/Gwv3Dr14YuCz
 VLqO+WAPq4RTgxtAt5Ocs8zrB4SJS6GbT9oEZxDxI47ivILA+kx54wFtw g==;
X-CSE-ConnectionGUID: zM41hpUQTgiCXKN6aytFQA==
X-CSE-MsgGUID: KjzqOn31RTmRZvCkyjp5Pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="93302700"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="93302700"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 10:27:10 -0700
X-CSE-ConnectionGUID: hePlN3W8SOGKPKhVrvw83g==
X-CSE-MsgGUID: x02m3G5aTdG8Qhv5bnYxfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="251151658"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 10:27:10 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Wentao Liang <vulab@iscas.ac.cn>
Subject: [CI] drm/xe: fix refcount leak in xe_range_fence_insert()
Date: Wed, 10 Jun 2026 10:27:05 -0700
Message-Id: <20260610172705.3450560-1-matthew.brost@intel.com>
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

From: Wentao Liang <vulab@iscas.ac.cn>

xe_range_fence_insert() acquires a reference on fence via
dma_fence_get() and stores it in rfence->fence.  It then calls
dma_fence_add_callback() and handles two cases: when the callback
is successfully registered (err == 0) the fence is transferred to
the tree for later cleanup; when the fence is already signaled
(err == -ENOENT) it manually drops the extra reference with
dma_fence_put(fence).

However, dma_fence_add_callback() can fail with other errors
(e.g. -EINVAL) and in that case the code falls through to the free:
label without releasing the acquired reference, leaking it.

Fix the leak by adding an else branch that calls dma_fence_put()
before jumping to free: for any error other than -ENOENT.

Fixes: 845f64bdbfc9 ("drm/xe: Introduce a range-fence utility")
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_range_fence.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_range_fence.c b/drivers/gpu/drm/xe/xe_range_fence.c
index 372378e89e98..3d8fa194a7b0 100644
--- a/drivers/gpu/drm/xe/xe_range_fence.c
+++ b/drivers/gpu/drm/xe/xe_range_fence.c
@@ -77,6 +77,8 @@ int xe_range_fence_insert(struct xe_range_fence_tree *tree,
 	} else if (err == 0) {
 		xe_range_fence_tree_insert(rfence, &tree->root);
 		return 0;
+	} else {
+		dma_fence_put(fence);
 	}
 
 free:
-- 
2.34.1

