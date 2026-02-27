Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09E9DFEFB47
	for <intel-xe@archiver.kernel.org>; Fri, 27 Feb 2026 13:01:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4BD710EB35;
	Fri, 27 Feb 2026 13:01:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S9yeWToA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3C4510EB35;
 Fri, 27 Feb 2026 13:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772197286; x=1803733286;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ban2oT8oQ2d+7YZbeJ3M0DPentQs/jjeGWdse6aDDTQ=;
 b=S9yeWToARu1IWZY+gGOTezu0n4L37kBJOQ0LJCgZWEyDhXKdRjC7Ne9N
 m1KnpfnnPNhwXUWqory7E2C5EOspKsq1uT8AfwS1xdenKGc1+3l9DU8kU
 c182yM/LgdVWkE6HfOlzxHfvYFZWXI8c1EPsUnS9OlGLPoTzsq7kwZnz8
 pa/tpfXSdTTy/Vu1fbGtqyeEoDasfV1mT+xiggqQp6BokSAtjiDH+loSO
 k4+tFU3hjmP6g0XwuzObc9O1ewbYWSiRmHFbsxIbPu6+/qelVyUa+NTVa
 oSD5qI2NMTB/6NM9EhkTw1TD+b7UK909LaLlxMOsCyael7BcG0sW2WIZS A==;
X-CSE-ConnectionGUID: VaVP4x4eTvugl/yQfyfW8w==
X-CSE-MsgGUID: b1hlVreSQfC0GIEvD0mgaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="72478436"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="72478436"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 05:01:25 -0800
X-CSE-ConnectionGUID: S0HLL5kiRjuxG3YnLxLGIw==
X-CSE-MsgGUID: qvPrrxY5QmeBwBy5is4dLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="221393790"
Received: from yadavs-z690i-a-ultra-plus.iind.intel.com ([10.190.216.90])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 05:01:24 -0800
From: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [CI] gpu/buddy: Introduce gpu_buddy_assert() for kunit-aware
 assertions
Date: Fri, 27 Feb 2026 18:30:38 +0530
Message-ID: <20260227130037.53615-2-sanjay.kumar.yadav@intel.com>
X-Mailer: git-send-email 2.52.0
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

Introduce gpu_buddy_assert(), a small helper that wraps WARN_ON() and,
when CONFIG_KUNIT is enabled, also calls kunit_fail_current_test() so
that any active KUnit test is marked as failed. In non-KUnit builds
the macro reduces to WARN_ON(), preserving existing behaviour.

Stringify the asserted condition in the failure message to make it easy
to identify which assertion fired. Leave the WARN_ON() in
gpu_buddy_block_trim() unchanged, as it returns -EINVAL and the caller
already observes the failure via the return code.

Cc: Christian König <christian.koenig@amd.com>
Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Suggested-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
Reviewed-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/buddy.c | 36 ++++++++++++++++++++++++++++--------
 1 file changed, 28 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/buddy.c b/drivers/gpu/buddy.c
index b27761246d4b..da5a1222f46b 100644
--- a/drivers/gpu/buddy.c
+++ b/drivers/gpu/buddy.c
@@ -3,8 +3,7 @@
  * Copyright © 2021 Intel Corporation
  */
 
-#include <kunit/test-bug.h>
-
+#include <linux/bug.h>
 #include <linux/export.h>
 #include <linux/kmemleak.h>
 #include <linux/module.h>
@@ -12,6 +11,28 @@
 
 #include <linux/gpu_buddy.h>
 
+/**
+ * gpu_buddy_assert - assert a condition in the buddy allocator
+ * @condition: condition expected to be true
+ *
+ * When CONFIG_KUNIT is enabled, evaluates @condition and, if false, triggers
+ * a WARN_ON() and also calls kunit_fail_current_test() so that any running
+ * kunit test is properly marked as failed. The stringified condition is
+ * included in the failure message for easy identification.
+ *
+ * When CONFIG_KUNIT is not enabled, this reduces to WARN_ON() so production
+ * builds retain the same warning semantics as before.
+ */
+#if IS_ENABLED(CONFIG_KUNIT)
+#include <kunit/test-bug.h>
+#define gpu_buddy_assert(condition) do {						\
+	if (WARN_ON(!(condition)))						\
+		kunit_fail_current_test("gpu_buddy_assert(" #condition ")");	\
+} while (0)
+#else
+#define gpu_buddy_assert(condition) WARN_ON(!(condition))
+#endif
+
 static struct kmem_cache *slab_blocks;
 
 static unsigned int
@@ -268,8 +289,8 @@ static int __force_merge(struct gpu_buddy *mm,
 				if (!gpu_buddy_block_is_free(buddy))
 					continue;
 
-				WARN_ON(gpu_buddy_block_is_clear(block) ==
-					gpu_buddy_block_is_clear(buddy));
+				gpu_buddy_assert(gpu_buddy_block_is_clear(block) !=
+						 gpu_buddy_block_is_clear(buddy));
 
 				/*
 				 * Advance to the next node when the current node is the buddy,
@@ -415,8 +436,7 @@ void gpu_buddy_fini(struct gpu_buddy *mm)
 		start = gpu_buddy_block_offset(mm->roots[i]);
 		__force_merge(mm, start, start + size, order);
 
-		if (WARN_ON(!gpu_buddy_block_is_free(mm->roots[i])))
-			kunit_fail_current_test("buddy_fini() root");
+		gpu_buddy_assert(gpu_buddy_block_is_free(mm->roots[i]));
 
 		gpu_block_free(mm, mm->roots[i]);
 
@@ -424,7 +444,7 @@ void gpu_buddy_fini(struct gpu_buddy *mm)
 		size -= root_size;
 	}
 
-	WARN_ON(mm->avail != mm->size);
+	gpu_buddy_assert(mm->avail == mm->size);
 
 	for_each_free_tree(i)
 		kfree(mm->free_trees[i]);
@@ -541,7 +561,7 @@ static void __gpu_buddy_free_list(struct gpu_buddy *mm,
 {
 	struct gpu_buddy_block *block, *on;
 
-	WARN_ON(mark_dirty && mark_clear);
+	gpu_buddy_assert(!(mark_dirty && mark_clear));
 
 	list_for_each_entry_safe(block, on, objects, link) {
 		if (mark_clear)
-- 
2.52.0

