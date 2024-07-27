Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B216C3DA49
	for <intel-xe@archiver.kernel.org>; Sat, 27 Jul 2024 01:21:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04D7B10E06A;
	Sat, 27 Jul 2024 01:21:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c1/3tHRZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DA0910E06A
 for <intel-xe@lists.freedesktop.org>; Sat, 27 Jul 2024 01:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722043289; x=1753579289;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ta8wxXyodREkYVAOGAzvwhXg/naKSWiw+UOh1UQF2Ak=;
 b=c1/3tHRZvb28oH4UgqH8Q/Kwk+wn6/ujAiHYYBU4p9WwB1P17lMlnWV3
 JyYUio0dHaWRnVc9uK2ovLgZ91rBDZpLraTzD3+5EH37H98ZRcbZ2c9YZ
 qlgyPf/7SEa47uybSd9rr6XpudPYTS6w+ff54ElEbIF9UhoTzvSTQ2vBh
 4BIJlcYwVy2FzhUO8YY5ngLuvQ+KqjaFjJtpoFyLgl4CWeQdbevHfiRYc
 8F813cjun6TrgwtFIT823sfxrC9P/yihaM6xCoYbXs5QnEAJ62QfvC79E
 2R4Ms9sR11x8hz0EwzVBb8M419r1k+S3d4LpB4SKHcKFJYw1CYRhxWS9K w==;
X-CSE-ConnectionGUID: os9+7xIxSPutZsU2Wo4diA==
X-CSE-MsgGUID: kGGcu9mHRnGRt73hkvGhfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="37323979"
X-IronPort-AV: E=Sophos;i="6.09,240,1716274800"; d="scan'208";a="37323979"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 18:21:29 -0700
X-CSE-ConnectionGUID: D6pAbpyDQeO8t4iY2LwSJA==
X-CSE-MsgGUID: KwFxImOtTfO05G9mtnJwWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,240,1716274800"; d="scan'208";a="58207682"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 18:21:28 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: paulo.r.zanoni@intel.com
Subject: [PATCH] drm/xe: Use dma_fence_chain_free in chain fence unused as a
 sync
Date: Fri, 26 Jul 2024 18:22:16 -0700
Message-Id: <20240727012216.2118276-1-matthew.brost@intel.com>
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

A chain fence is uninitialized if not installed in a drm sync obj. Thus
if xe_sync_entry_cleanup is called and sync->chain_fence is non-NULL the
proper cleanup is dma_fence_chain_free rather than a dma-fence put.

Reported-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2411
Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_sync.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index 533246f42256..3aa6270e5dd7 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -259,7 +259,7 @@ void xe_sync_entry_cleanup(struct xe_sync_entry *sync)
 	if (sync->fence)
 		dma_fence_put(sync->fence);
 	if (sync->chain_fence)
-		dma_fence_put(&sync->chain_fence->base);
+		dma_fence_chain_free(sync->chain_fence);
 	if (sync->ufence)
 		user_fence_put(sync->ufence);
 }
-- 
2.34.1

