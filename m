Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3668EECE564
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 13:12:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE55210E7C8;
	Tue, 10 Sep 2024 13:12:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NKGqt29J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 090B210E7BD
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 13:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725973920; x=1757509920;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XF5quP1SDVR3xGZ7RGQMQNCzMKIuZCT3KhpMHKMXEkc=;
 b=NKGqt29JlmJL+L1RrAs5pfKfTCar5Hw81dC9PSq0DqRiiJfKXYVAZ/nE
 LISunwu34Y8F5WaNg3acySiCXB6odUq129Ks7SzcY+6LslTUGYKj78NTD
 5oc+1wlgapimYCMcVMcp0Q/iPty5flcS+DJL9nQbfoNI1zs/+zMBfMtjY
 oAXpoOSUa5Rno6HDGTNkrDYXRliQPP7oRSyZ0C1nM5I3JhpX77iTUJ+XI
 DVR4+E8ddUCAGoJY73gJ403/Tasr0niu948gonP8LUXLW2VX3ZNcVxUfE
 PnH/Q8haxJkTRzSS/IVtoiTWoo50KtMaOGNWXwlDfGIHctG1alcDoJhwK Q==;
X-CSE-ConnectionGUID: mEJESG/CRUycHUUZMRFIWg==
X-CSE-MsgGUID: M3526BgXQn2+DZAcWGbnrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24861231"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="24861231"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 06:12:00 -0700
X-CSE-ConnectionGUID: I8cL+SBSSLinUt/GnmKy0w==
X-CSE-MsgGUID: R/yUKCGtQruiPmoKgNznJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="67037906"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.215])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 06:11:58 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 stable@vger.kernel.org
Subject: [PATCH 1/4] drm/xe/client: fix deadlock in show_meminfo()
Date: Tue, 10 Sep 2024 14:11:46 +0100
Message-ID: <20240910131145.136984-5-matthew.auld@intel.com>
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

