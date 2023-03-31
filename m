Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EA5CC761A6
	for <intel-xe@archiver.kernel.org>; Fri, 31 Mar 2023 17:10:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69D0510E15D;
	Fri, 31 Mar 2023 17:10:13 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E898A10E1B1
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Mar 2023 17:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680282606; x=1711818606;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kASE3EPzGMZ2yjAzofQIclTaJgZFf3IvxJZ5dsgQQh0=;
 b=CplGo2sSTqtgW9gMfJPbsSFCLWium6OeHz9dgw5O0pitWo6XK7Z4eqUV
 yIv7dfINADQJ0CiXtOFmqBtrH9C+hzAi+WvUOg987x6O+WClkyJEnfr7D
 Iq8d/h27jVdoe63ODVmJADgXsMneKqFv99a5rt6MBKJk3iQXYQXKfS/rq
 7Y4Gv4hJK47dEO8WnQjo3BqR5Zne6x8Jnvj7mQKRORwvmX0ZZsN9CkdBx
 seO3pZZSw8nBtH4GRZu2PSqVjR5Ye5Ryd7cHHiHwDLni8UliJaEr+Zlpv
 A5vE+FIJI1c9LFqMp9ZchXNwQ5lzP14JsSkE+5EejkAJsO7rlaFUYUmGu w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="325490229"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="325490229"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 10:09:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="809106394"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="809106394"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 10:09:34 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 31 Mar 2023 10:09:24 -0700
Message-Id: <20230331170925.10883-3-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20230331170925.10883-1-niranjana.vishwanathapura@intel.com>
References: <20230331170925.10883-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/3] drm/xe/tests: Set correct expectation
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
Cc: thomas.hellstrom@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

In xe_migrate_sanity_kunit test, use correct expected value from
xe_migrate_copy() operation.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_migrate.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index 085ad96d7278..2a836f5bd8ff 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -148,6 +148,7 @@ static void test_copy(struct xe_migrate *m, struct xe_bo *bo,
 	xe_map_memset(xe, &sysmem->vmap, 0, 0xc0, sysmem->size);
 	xe_map_memset(xe, &bo->vmap, 0, 0xd0, bo->size);
 
+	expected = 0xc0c0c0c0c0c0c0c0;
 	fence = xe_migrate_copy(m, sysmem, sysmem->ttm.resource,
 				bo->ttm.resource);
 	if (!sanity_fence_failed(xe, fence, big ? "Copying big bo sysmem -> vram" :
-- 
2.21.0.rc0.32.g243a4c7e27

