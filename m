Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86F28EE49BC
	for <intel-xe@archiver.kernel.org>; Wed, 11 Sep 2024 15:55:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B60C10EA3C;
	Wed, 11 Sep 2024 15:55:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W2mn4+jj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEDC810EA39
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Sep 2024 15:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726070151; x=1757606151;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=D/GbrL05OJHTIBBaWMmIQ5I4DXUAG07CD3m49MNb4yY=;
 b=W2mn4+jjKZQG15r9Fr0phax6HByKPCPds1I9UrUJtAtcjhpndc4mNj5l
 emZ7EpHqDIe5PIsPYp/tRQg5Ge9slvY8E0jbpKFGRY31qdt2zmV8x/une
 fplPGiy9zRuE4N/CwLemu3HReilDTA65rvTsoRpzNPNPpbhyMMPcZ1aqK
 RfTR9LX4ekx3OSOAne1sov4/4mVvSNhE6jJW8Gp/26G0S3W1uIOKNWtP3
 2yM1aOeiIL1eH6PawQTyceFBypiFmk3eXNLJqyZDnyxwHitJl+Y4CGAII
 oFz85yJcrl5nAZXkH3wunjsg5D+buvjMVWnSgr15d6EuUs5dKSGL7zaV3 g==;
X-CSE-ConnectionGUID: 3vERPGEhROuJEX8DlIvezA==
X-CSE-MsgGUID: o1li+hKsRjqngR43wjipNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="24703332"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; d="scan'208";a="24703332"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 08:55:49 -0700
X-CSE-ConnectionGUID: 7az0EBxMQbargoKjFD0Zbg==
X-CSE-MsgGUID: Njip1YpIQXqFD5PJpe9Kgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; d="scan'208";a="67257815"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.102])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 08:55:48 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 stable@vger.kernel.org, Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 1/4] drm/xe/client: fix deadlock in show_meminfo()
Date: Wed, 11 Sep 2024 16:55:27 +0100
Message-ID: <20240911155527.178910-5-matthew.auld@intel.com>
X-Mailer: git-send-email 2.46.0
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

There is a real deadlock as well as sleeping in atomic() bug in here, if
the bo put happens to be the last ref, since bo destruction wants to
grab the same spinlock and sleeping locks.  Fix that by dropping the ref
using xe_bo_put_deferred(), and moving the final commit outside of the
lock. Dropping the lock around the put is tricky since the bo can go
out of scope and delete itself from the list, making it difficult to
navigate to the next list entry.

Fixes: 0845233388f8 ("drm/xe: Implement fdinfo memory stats printing")
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2727
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
Cc: <stable@vger.kernel.org> # v6.8+
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_drm_client.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index e64f4b645e2e..badfa045ead8 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -196,6 +196,7 @@ static void show_meminfo(struct drm_printer *p, struct drm_file *file)
 	struct xe_drm_client *client;
 	struct drm_gem_object *obj;
 	struct xe_bo *bo;
+	LLIST_HEAD(deferred);
 	unsigned int id;
 	u32 mem_type;
 
@@ -215,11 +216,14 @@ static void show_meminfo(struct drm_printer *p, struct drm_file *file)
 	list_for_each_entry(bo, &client->bos_list, client_link) {
 		if (!kref_get_unless_zero(&bo->ttm.base.refcount))
 			continue;
+
 		bo_meminfo(bo, stats);
-		xe_bo_put(bo);
+		xe_bo_put_deferred(bo, &deferred);
 	}
 	spin_unlock(&client->bos_lock);
 
+	xe_bo_put_commit(&deferred);
+
 	for (mem_type = XE_PL_SYSTEM; mem_type < TTM_NUM_MEM_TYPES; ++mem_type) {
 		if (!xe_mem_type_to_name[mem_type])
 			continue;
-- 
2.46.0

