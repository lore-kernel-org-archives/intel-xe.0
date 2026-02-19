Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C003DC531E3
	for <intel-xe@archiver.kernel.org>; Thu, 19 Feb 2026 23:39:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C0C910E764;
	Thu, 19 Feb 2026 23:39:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PMiTmQc4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFEE010E764
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Feb 2026 23:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771544370; x=1803080370;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IjCHxDtr0HbIJTuWpiFNWCPAGbO6caqXyy7nB6w5o4k=;
 b=PMiTmQc4i5rR+bh8Ll9nFmOV8PDpSJCLCJzz1qROJdnfxBNV4bytH5qS
 nlW8TSrIp1RftA176zedj1VhiH+apngTmU0W4tXxae+R2ZIypfuZ+Cf0f
 YLmhn2eAm2SintV6Y7/XCqCKgHeDivPJSr1dK/ypsaVBv7bCimo8OQGT3
 NQeTtaq2kXg9gq+RYHXz8N1a0fBbLpAWy9bmHLzE6ku6dAvudfOa3EWAY
 uJglVh/cLK6PW00u5X8EdtL/IRNiCZf84EHqCc2Rw02tfpubDjZuAa/Ae
 olfFuDAOA+uxV8Hw8IqiCmJR/YaQ19K8ld5wm9m8qeTy/0yNF5iJJ0n9a g==;
X-CSE-ConnectionGUID: tHth89pnSPa+TZl8mVGvrA==
X-CSE-MsgGUID: xDtOS1WNTzm2DUnj/wHUiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="60218620"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="60218620"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 15:39:29 -0800
X-CSE-ConnectionGUID: 1wbWfyeLSfauYQQNx7sK4g==
X-CSE-MsgGUID: Zg9CSYtNQ5me0rpUwR+EBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="243239588"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by fmviesa001.fm.intel.com with ESMTP; 19 Feb 2026 15:39:28 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 1/2] drm/xe/sync: Cleanup partially initialized sync on parse
 failure
Date: Thu, 19 Feb 2026 23:35:18 +0000
Message-ID: <20260219233516.2938172-5-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260219233516.2938172-4-shuicheng.lin@intel.com>
References: <20260219233516.2938172-4-shuicheng.lin@intel.com>
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

xe_sync_entry_parse() can allocate references (syncobj, fence, chain fence,
or user fence) before hitting a later failure path. Several of those paths
returned directly, leaving partially initialized state and leaking refs.

Route these error paths through a common free_sync label and call
xe_sync_entry_cleanup(sync) before returning the error.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_sync.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index c8fdcdbd6ae7..f03ab2e27284 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -146,8 +146,10 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
 
 		if (!signal) {
 			sync->fence = drm_syncobj_fence_get(sync->syncobj);
-			if (XE_IOCTL_DBG(xe, !sync->fence))
-				return -EINVAL;
+			if (XE_IOCTL_DBG(xe, !sync->fence)) {
+				err = -EINVAL;
+				goto free_sync;
+			}
 		}
 		break;
 
@@ -167,17 +169,21 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
 
 		if (signal) {
 			sync->chain_fence = dma_fence_chain_alloc();
-			if (!sync->chain_fence)
-				return -ENOMEM;
+			if (!sync->chain_fence) {
+				err = -ENOMEM;
+				goto free_sync;
+			}
 		} else {
 			sync->fence = drm_syncobj_fence_get(sync->syncobj);
-			if (XE_IOCTL_DBG(xe, !sync->fence))
-				return -EINVAL;
+			if (XE_IOCTL_DBG(xe, !sync->fence)) {
+				err = -EINVAL;
+				goto free_sync;
+			}
 
 			err = dma_fence_chain_find_seqno(&sync->fence,
 							 sync_in.timeline_value);
 			if (err)
-				return err;
+				goto free_sync;
 		}
 		break;
 
@@ -216,6 +222,10 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
 	sync->timeline_value = sync_in.timeline_value;
 
 	return 0;
+
+free_sync:
+	xe_sync_entry_cleanup(sync);
+	return err;
 }
 ALLOW_ERROR_INJECTION(xe_sync_entry_parse, ERRNO);
 
-- 
2.50.1

