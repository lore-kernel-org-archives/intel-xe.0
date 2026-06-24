Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97646CDB471
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jun 2026 11:39:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43C2110EEAD;
	Wed, 24 Jun 2026 11:39:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WrhHVv5y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA3A410EEAD
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Jun 2026 11:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782301140; x=1813837140;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZzhpicnODktDP+rzOY9uf2poI/DZ0J1pWds+mQyLM00=;
 b=WrhHVv5yPuiFhuBHyh13s6yOcNjABXNr0rfZv+TECkzQVpszkMPlhax0
 atxhZ2ytaIAsb2bZt1CFv5bmOKX+8ZxacNLsNCagL2mWmkG0upFaw2Lu6
 D6qFv7YhGGGJyu//X5IoNjvJhcz+aNSe+298X0B4+3JJR1xMoBYJqeoTV
 4pZyJWhwmDpYC844sJv9npSsq601vWU+9h74rZK9L2UrFC5jn37dBP7e7
 l+0UoVOLY6t/TnZV/suTiFPuhwk4Tye0/kNv9tFO8lZe1uQI8aPYRDBM5
 ZtJszkf3dJOMl7Ycv7q5DaPJ8kHtD25Svaa5VV7/idIU8BV03IPOGfGTu w==;
X-CSE-ConnectionGUID: VUK6fm+cRY+uuMRTotXS9Q==
X-CSE-MsgGUID: qS91Yk9gR46/XdkKdQ4bjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="83109451"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="83109451"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 04:39:00 -0700
X-CSE-ConnectionGUID: SQd8rsWKQ5yt4aeVKED2MQ==
X-CSE-MsgGUID: rTY2UPV6QmCRFribB923/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="243443566"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.217])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 04:38:58 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Arvind Yadav <arvind.yadav@intel.com>
Subject: [PATCH 1/2] drm/xe: fix NPD in bo_meminfo()
Date: Wed, 24 Jun 2026 12:38:39 +0100
Message-ID: <20260624113837.342961-5-matthew.auld@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260624113837.342961-4-matthew.auld@intel.com>
References: <20260624113837.342961-4-matthew.auld@intel.com>
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

When a buffer object is purged, its ttm.resource is set to NULL via the
TTM pipeline gutting flow. However, the BO remains in the client's
object list until userspace explicitly closes the GEM handle. If memory
stats are queried during this time, accessing bo->ttm.resource->mem_type
will result in a NULL pointer dereference.

Fix this by safely skipping purged BOs in bo_meminfo, as they no longer
consume any memory.

User is getting NPD on device resume, and possible theory is that in
bo_move(), if we need to evict something to SYSTEM to save the CCS state,
but the BO is marked as dontneed, this won't trigger a move but will
nuke the pages, leaving us with a NULL bo resource. And the meminfo()
doesn't look ready to handle a NULL resource.

Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/8419
Assisted-by: Copilot:gemini-3.1-pro-preview
Fixes: ad9843aac91a ("drm/xe/madvise: Implement purgeable buffer object support")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_drm_client.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index 84b66147bf49..34a34c7e4083 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -168,10 +168,15 @@ static void bo_meminfo(struct xe_bo *bo,
 		       struct drm_memory_stats stats[TTM_NUM_MEM_TYPES])
 {
 	u64 sz = xe_bo_size(bo);
-	u32 mem_type = bo->ttm.resource->mem_type;
+	u32 mem_type;
 
 	xe_bo_assert_held(bo);
 
+	if (xe_bo_is_purged(bo))
+		return;
+
+	mem_type = bo->ttm.resource->mem_type;
+
 	if (drm_gem_object_is_shared_for_memory_stats(&bo->ttm.base))
 		stats[mem_type].shared += sz;
 	else
-- 
2.54.0

