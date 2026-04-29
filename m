Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CF24FF886D
	for <intel-xe@archiver.kernel.org>; Wed, 29 Apr 2026 09:32:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2A2410EF16;
	Wed, 29 Apr 2026 09:31:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U+Z8fWBs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6621E10EF1B
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Apr 2026 09:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777455118; x=1808991118;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MkXHszNftPYPTc4enVHAaXrDUU7FcHNkH/5y7SI3ptU=;
 b=U+Z8fWBsXfrHzgY5mczBwwMZd3y4OR2G1+AVrQZ29cWkIfgiy1eY46v+
 uaMYHsDIJOMHn2BZwmZ+VeZqJcO+KiiinLGxs5TfcfTtmzTX8Szwh0HKl
 QqXfSqLBOjZk0Lc1byoYnLb6OdaN+wy11fOqxUfLJMVwdPr/kZoafrIlh
 i5M7nzoRFrsyLaVHHCsYY3E61+9PgkpU5BCESG30K05vdtJpWr/sHUxVb
 /7l2kA9okEfOcEBhPEKm9QxW3P0p3/V19znOQGkx8OpFW/7bMnLp5TSkB
 1TLGZbrch9BRM4K70XZ2yfXTByrdv0WMeNZdR553QEw1cIqNfMqmn2DT9 w==;
X-CSE-ConnectionGUID: IEVfi5k4RseC+jG1Og/Yng==
X-CSE-MsgGUID: oz8bivPOQ5Gu3AewNg6yCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="82235636"
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; d="scan'208";a="82235636"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 02:31:58 -0700
X-CSE-ConnectionGUID: sRj4/GT3RIy0TlVSzpc+uA==
X-CSE-MsgGUID: hmBrwqy+R2qNl2pmBuNiTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; d="scan'208";a="239253239"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 02:31:56 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, himal.prasad.ghimiray@intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH] drm/xe: Use drmm_mutex_init for VRAM manager lock
Date: Wed, 29 Apr 2026 15:01:39 +0530
Message-ID: <20260429093138.3899280-2-tejas.upadhyay@intel.com>
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

Replace mutex_init()/mutex_destroy() with drmm_mutex_init() for the
VRAM manager lock. This leverages DRM managed infrastructure to
automatically destroy the mutex during device teardown, eliminating
manual mutex_destroy() calls in both the normal fini path and the
gpu_buddy_init() error path.

Assisted-by: Claude:claude-opus-4.6
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 5fd0d5506a7e..6ba47996bc7c 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -292,8 +292,6 @@ static void xe_ttm_vram_mgr_fini(struct drm_device *dev, void *arg)
 	ttm_resource_manager_cleanup(&mgr->manager);
 
 	ttm_set_driver_manager(&xe->ttm, mgr->mem_type, NULL);
-
-	mutex_destroy(&mgr->lock);
 }
 
 int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
@@ -312,7 +310,9 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
 
 	man->func = &xe_ttm_vram_mgr_func;
 	mgr->mem_type = mem_type;
-	mutex_init(&mgr->lock);
+	err = drmm_mutex_init(&xe->drm, &mgr->lock);
+	if (err)
+		return err;
 	mgr->default_page_size = default_page_size;
 	mgr->visible_size = io_size;
 	mgr->visible_avail = io_size;
-- 
2.52.0

