Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F3F606A319
	for <intel-xe@archiver.kernel.org>; Thu, 22 Oct 2026 17:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dMlzGX5d
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7752811285C;
	Thu, 22 Oct 2026 17:41:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED8AC11285C
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Oct 2026 17:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792690871; x=1824226871;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=i0sUBTn7zZHjGdLUQOGsSLgWeN2sedvkN870GTcfR8E=;
 b=dMlzGX5dAlyael9969AcLBzT0WLcnRwPnB08n6kmuOf7Z4t/2X4jOij8
 dk5lRFR3+iEOcuOMbod2uIlmFKwxrctV4r68mnHkUEldZJ/8bFkln7881
 CbYO+Gm3qdGYIViprCLG1NAw1VSPwubAJ3Dwm2BIk1aBjFjAKRGgoENtv
 T6wJ2bnx+p4wRnKuK4OXWwua+7WFkNkNQsgzJIY/YX/bHzR+BvjGVq93c
 jTgGDJhvGJ3skLhH4BOm5g8WaScOxJ0wtWZMKI6owcY7z5O4dqX6U2BWM
 VV53UH8dEkOYiCUj65NO4Cak90zaAqh66VVabsQO8NrgFUT6HkChsPiVZ Q==;
X-CSE-ConnectionGUID: o06MXfQLTmihXBH9qMaDIA==
X-CSE-MsgGUID: hyEuwLYjT8OhxLYdpVxISw==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1435957"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1435957"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 10:41:10 -0700
X-CSE-ConnectionGUID: tO/Bvy6VRjqyvYDaKkdhrA==
X-CSE-MsgGUID: Mjcx5rxVS9W868FwUvC7Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="3366104"
Received: from abityuts-desk1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.243])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 10:41:09 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>, stable@vger.kernel.org
Subject: [PATCH 1/2] drm/xe/sa: make suballocator waits uninterruptible
Date: Thu, 22 Oct 2026 18:41:00 +0100
Message-ID: <20261022174058.226432-5-matthew.auld@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261022174058.226432-4-matthew.auld@intel.com>
References: <20261022174058.226432-4-matthew.auld@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Large BO clears and copies in xe_migrate_clear() and xe_migrate_copy()
are split into multiple passes, each needing a batchbuffer from the
fixed size kernel bb pool. Once the pool fills up, __xe_sa_bo_new()
waits interruptibly for space, so a pending signal (e.g. Xorg's 5ms
SIGALRM smart-scheduler timer) makes it fail mid-loop with -ERESTARTSYS.
The partial progress is then thrown away and the restarted ioctl starts
again from byte 0, including the memory allocation, which can livelock
if the signal arrives faster than the whole operation completes. In the
shrinker path the same error also aborts the shrinker walk, even though
ctx->interruptible is false.

Being interruptible here doesn't seem to buy much anyway: on error
the loop already waits uninterruptibly for all submitted passes before
returning. So just make the suballocator waits uninterruptible, matching
amdgpu and radeon. The other users (page reclaim from a kworker, and the
GuC buffer cache) shouldn't really see any meaningful change.

Assisted-by: LLM
Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/9644
Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: <stable@vger.kernel.org> # v6.12+
---
 drivers/gpu/drm/xe/xe_sa.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
index f32045f40b7a..d9c2b28b08c2 100644
--- a/drivers/gpu/drm/xe/xe_sa.c
+++ b/drivers/gpu/drm/xe/xe_sa.c
@@ -165,7 +165,8 @@ void xe_sa_bo_sync_shadow(struct drm_suballoc *sa_bo)
  * @size: number of bytes we want to suballocate
  * @gfp: gfp flags used for memory allocation. Typically GFP_KERNEL.
  *
- * Try to make a suballocation of size @size.
+ * Try to make a suballocation of size @size. Any waits for space are
+ * uninterruptible.
  *
  * Return: a &drm_suballoc, or an ERR_PTR.
  */
@@ -178,7 +179,7 @@ struct drm_suballoc *__xe_sa_bo_new(struct xe_sa_manager *sa_manager, u32 size,
 	if (size > sa_manager->base.size)
 		return ERR_PTR(-ENOBUFS);
 
-	return drm_suballoc_new(&sa_manager->base, size, gfp, true, 0);
+	return drm_suballoc_new(&sa_manager->base, size, gfp, false, 0);
 }
 
 /**
-- 
2.56.0

