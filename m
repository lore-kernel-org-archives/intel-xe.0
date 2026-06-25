Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82877CDE00B
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jun 2026 15:21:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4042E10F30E;
	Thu, 25 Jun 2026 15:21:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KZrttwtj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2926610F30D
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jun 2026 15:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782400873; x=1813936873;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=U8na6DNLz1Yh6Jav4zaYRh1DO4K2I3IPftJGZoPgdLI=;
 b=KZrttwtj7twuOVRrcTc8/7wbzTFhKE/CiPd4pbrXIxWVwZ/gc3fQadO9
 4/tGgGO8zMmhfXtfkm8u02VinZS107f+OjKuUfWEANg5RftSJevwzH4hO
 SIBNY1Mdiv2+rQQ+7u07aC5WYF0vjWcg629j4cpMC8q5EE8umls5t1scs
 eYfYoj/ZAHbeGutjS+WCGUIywgkYxacyP0LzEI35Y8WZNdIYkcgaRigUX
 sXO1WG6HDxoYXf2abbV/WS0JJtxn182xUNevqqzqwEb/IgGat5cJPZF0Z
 Vj7fYkD/dSim9meT07CicHpXOkmxOOLElHuVhOcHeNLGQQbTDPQ2MJrMi Q==;
X-CSE-ConnectionGUID: GyHwHLFlQ6i4n4OmdO9zoA==
X-CSE-MsgGUID: q6t5HW1fQOqcOtjAPCb2YQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="94576333"
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; d="scan'208";a="94576333"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 08:21:13 -0700
X-CSE-ConnectionGUID: OIcrRxT9R+aC/S8/rwZnBw==
X-CSE-MsgGUID: kDPh6Gs6TjaMi+JNbv/wVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; d="scan'208";a="249734572"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.127])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 08:21:12 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Schwartz <matthew.schwartz@linux.dev>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Arvind Yadav <arvind.yadav@intel.com>
Subject: [PATCH 1/3] drm/xe: fix NPD in bo_meminfo()
Date: Thu, 25 Jun 2026 16:20:56 +0100
Message-ID: <20260625152054.450125-6-matthew.auld@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260625152054.450125-5-matthew.auld@intel.com>
References: <20260625152054.450125-5-matthew.auld@intel.com>
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

v2 (Sashiko):
 - There could potentially be other cases where we might end up with a
   NULL resource, so make this a general NULL check for now.

Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/8419
Fixes: ad9843aac91a ("drm/xe/madvise: Implement purgeable buffer object support")
Assisted-by: Copilot:gemini-3.1-pro-preview
Reported-by: Matthew Schwartz <matthew.schwartz@linux.dev>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_drm_client.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index 84b66147bf49..81020b4b344e 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -168,10 +168,20 @@ static void bo_meminfo(struct xe_bo *bo,
 		       struct drm_memory_stats stats[TTM_NUM_MEM_TYPES])
 {
 	u64 sz = xe_bo_size(bo);
-	u32 mem_type = bo->ttm.resource->mem_type;
+	u32 mem_type;
 
 	xe_bo_assert_held(bo);
 
+	/*
+	 * The resource can be NULL if the BO has been purged, plus maybe some
+	 * other cases. Either way there shouldn't be any memory to account for,
+	 * or a current resource to account this against, so skip for now.
+	 */
+	if (!bo->ttm.resource)
+		return;
+
+	mem_type = bo->ttm.resource->mem_type;
+
 	if (drm_gem_object_is_shared_for_memory_stats(&bo->ttm.base))
 		stats[mem_type].shared += sz;
 	else
-- 
2.54.0

