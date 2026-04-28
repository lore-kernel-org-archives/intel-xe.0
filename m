Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B252FF8868
	for <intel-xe@archiver.kernel.org>; Tue, 28 Apr 2026 10:32:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3BA410E2FA;
	Tue, 28 Apr 2026 10:32:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AZVnTRS+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBCFA10E2FA
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Apr 2026 10:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777372345; x=1808908345;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3A8Gf7nM6HCxVQ3WgbuyGF6h4ZdKT0qBi6Jxw0Emy1E=;
 b=AZVnTRS+6us4qQ/prO3H6t18W34rhWpoYr5oR/SA3aV/1k4dI1ZPOYu8
 iM3VXwIzchvba7gTbm0vEtuZN9IlBlmPtHuUI+TSAHkijqrgWB4lN4g4c
 f0wC8DdyGs9tYlWXel+d6bZ4kTprtGtAKhtzs8gOEdGxmHCfqNv7tmgFG
 24o+q/2eZylj0NhID3vdZiBS7tDxfBfBvNiSNbpAuFT0J3a2tbFdYe7Qc
 +zVW3TVYGdN45/B4UyMMI19EY5lbG8MDGKXF1EGQsbpMkIVL5fZNV9ikb
 tfE0ShTMHusQn1BDMi+fZC3Q5Aw7+AdvhgZy9t7DWoVwqLWGgDmGGDeLs w==;
X-CSE-ConnectionGUID: P8TrbPyMRIuLMLZPn7UPnw==
X-CSE-MsgGUID: whxyQ7D2TRaTHIcMgRKAHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="82140055"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="82140055"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 03:32:24 -0700
X-CSE-ConnectionGUID: FWcfvSD2RvWi3gQtybCDiQ==
X-CSE-MsgGUID: UY2ksLNEQnqImh/9rz8nuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="230764858"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 03:32:22 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, himal.prasad.ghimiray@intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH] drm/xe: Destroy mutex on gpu_buddy_init failure in VRAM
 manager init
Date: Tue, 28 Apr 2026 16:02:03 +0530
Message-ID: <20260428103202.3889095-2-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
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

In __xe_ttm_vram_mgr_init(), if gpu_buddy_init() fails, the function
returns early without calling mutex_destroy() on mgr->lock which was
previously initialized via mutex_init(). The normal cleanup path in
xe_ttm_vram_mgr_fini() is registered via drmm_add_action_or_reset()
only after gpu_buddy_init() succeeds, so it never runs for this error
case.

Add mutex_destroy() before the early return to properly clean up the
initialized mutex.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM buddy based VRAM manager")
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 5fd0d5506a7e..3189e4b7ad05 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -319,8 +319,10 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
 
 	ttm_resource_manager_init(man, &xe->ttm, size);
 	err = gpu_buddy_init(&mgr->mm, man->size, default_page_size);
-	if (err)
+	if (err) {
+		mutex_destroy(&mgr->lock);
 		return err;
+	}
 
 	ttm_set_driver_manager(&xe->ttm, mem_type, &mgr->manager);
 	ttm_resource_manager_set_used(&mgr->manager, true);
-- 
2.52.0

