Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED772EB3632
	for <intel-xe@archiver.kernel.org>; Mon,  2 Mar 2026 21:25:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A35B310E5D2;
	Mon,  2 Mar 2026 21:25:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hN+NlNYF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0D1B10E5D2
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Mar 2026 21:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772486744; x=1804022744;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uNCk8g9ew8d6vswrlBvgfxofcV3eLGGC+lUSwCfCMOQ=;
 b=hN+NlNYF7+IWkXfChqI7LF+mqJZbiKNdTmn4/3wvprVl4BxhxhODwVAg
 RG4SrLdluJ3iTnHcO7DjdO73VDALcv90XlkIIz/G6gKzpyas1RNEcvRvm
 H2V/xnDM45OujBLqTviGNuvxeiuf75hNlpUdpBU3NJnbJhe/qh89VxigW
 +K8bV26YZ/LGDeYBpVS8CxCoNGcTkWwkHz2Bk4I3jy+NuYlbQyvSi6WDu
 CsOU7sC5JH7xVcfMGljmwY5bZZsY8gqrKxY7yCd/vJtUdt4MTvo7kbYJ0
 +9kiJkYUs+lRq6wNOiq1duNFzh8xDoEVur1VB47aDVYHcFLSK6gjlkcmI g==;
X-CSE-ConnectionGUID: zqmCsnqlSyqZbV3WjtwEUg==
X-CSE-MsgGUID: rUSav2WDTneTUK+pkDVeQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="73377855"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="73377855"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 13:25:44 -0800
X-CSE-ConnectionGUID: d2rt5cYHRXmjw2lvLuGBqA==
X-CSE-MsgGUID: 8tnnEYQYRxyx5fN7ENLqWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="215742346"
Received: from dut6079bmgfrd.fm.intel.com ([10.80.54.66])
 by fmviesa007.fm.intel.com with ESMTP; 02 Mar 2026 13:25:43 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe/multi_queue: Fix error path skipping group xa cleanup
Date: Mon,  2 Mar 2026 21:24:47 +0000
Message-Id: <20260302212447.208218-1-shuicheng.lin@intel.com>
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

When xe_hw_engine_group_add_exec_queue() fails for a secondary
multi-queue queue, the error path jumped directly to put_exec_queue,
bypassing the delete_queue_group label.  This left the LRC reference
inserted by xe_exec_queue_group_add() sitting in the group's xarray
until the primary queue is eventually destroyed.

Jump to delete_queue_group instead so that xe_exec_queue_group_delete()
is called and the xarray entry is properly removed.

Fixes: d9ec63474648 ("drm/xe/multi_queue: Add user interface for multi queue support")
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---

Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>

---
 drivers/gpu/drm/xe/xe_exec_queue.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 1a7a4a37bbc6..fbe3ac399cae 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -1298,7 +1298,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 		if (q->vm && q->hwe->hw_engine_group) {
 			err = xe_hw_engine_group_add_exec_queue(q->hwe->hw_engine_group, q);
 			if (err)
-				goto put_exec_queue;
+				goto delete_queue_group;
 		}
 	}
 
-- 
2.34.1

