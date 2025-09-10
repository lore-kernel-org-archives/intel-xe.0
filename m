Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43121CA0FED
	for <intel-xe@archiver.kernel.org>; Wed, 10 Sep 2025 16:12:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B37610E965;
	Wed, 10 Sep 2025 16:12:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NAv30grU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C7D410E965
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Sep 2025 16:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757520731; x=1789056731;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zdEEY5Vs+4XTMr2C9Ik0/VGSuR2H2cPGRj8PdgzzXoY=;
 b=NAv30grUcSLpJ7bs0Jehm+uz2Yy7s7hj11h2+/SyR2SoGUp/MnkqiGAW
 Tmq0ZCWGjqFI8hRJ/mJDqSqgWJX5mwF3zSuU+bvemDZ0ZH3sUWSMliNcl
 5eAcfVRvSHm6zucITjg+go1ccQyYa5jVA866k+8ufBCgZ2oY/t4UT+xB2
 nrFrWdeCj7XkSJIlll022Rtjf/I42KnPgXpt5fjS83O5ntu5khdIhZEGN
 UXZ3+pU7XWryB3voxNgOYkcbP4yRgnBEdS8DupfGnLDdCIebY+khR/4fT
 S6IzA5kAO+XXnM/pdNKdO39Q/iz5jQHEBh1hSdxn3WuCGPjE4jwts+Guk g==;
X-CSE-ConnectionGUID: pp3eU1SbSxqml64ZW5SPEg==
X-CSE-MsgGUID: smbhF1t3SeGLdF7KK3m/jQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="63473892"
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; d="scan'208";a="63473892"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 09:12:10 -0700
X-CSE-ConnectionGUID: UJtTsp+rTranIHinXgu3Fw==
X-CSE-MsgGUID: mfrqqiyZSMq47RKRlH6vJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; d="scan'208";a="177758429"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO fedora)
 ([10.245.245.22])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 09:12:09 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>, kernel test robot <lkp@intel.com>
Subject: [PATCH] drm/xe: Work around a loongarch clang error report
Date: Wed, 10 Sep 2025 18:11:22 +0200
Message-ID: <20250910161122.103584-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.51.0
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

There seems to be a problem with the clang loongarch compiler in
that it confuses instruction pointer reads if there are more than
one per function. So break one out to a separate function
(The one in xe_validation_guard()).

Fixes: 59eabff2a352 ("drm/xe: Convert xe_bo_create_pin_map() for exhaustive eviction")
Cc: Matthew Brost <matthew.brost@intel.com>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202509101853.nDmyxTEM-lkp@intel.com/
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
Sending out this patch in case we need a quick fix. But if this is
indeed a compiler error we shouln't hide it by merging this.
---
 drivers/gpu/drm/xe/xe_migrate.c | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 6fad5d469629..1d667fa36cf3 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -394,6 +394,24 @@ struct xe_migrate *xe_migrate_alloc(struct xe_tile *tile)
 	return m;
 }
 
+static int xe_migrate_lock_prepare_vm(struct xe_tile *tile, struct xe_migrate *m, struct xe_vm *vm)
+{
+	struct xe_device *xe = tile_to_xe(tile);
+	struct xe_validation_ctx ctx;
+	struct drm_exec exec;
+	int err = 0;
+
+	xe_validation_guard(&ctx, &xe->val, &exec, (struct xe_val_flags) {}, err) {
+		err = xe_vm_drm_exec_lock(vm, &exec);
+		drm_exec_retry_on_contention(&exec);
+		err = xe_migrate_prepare_vm(tile, m, vm, &exec);
+		drm_exec_retry_on_contention(&exec);
+		xe_validation_retry_on_oom(&ctx, &err);
+	}
+
+	return err;
+}
+
 /**
  * xe_migrate_init() - Initialize a migrate context
  * @m: The migration context
@@ -405,8 +423,6 @@ int xe_migrate_init(struct xe_migrate *m)
 	struct xe_tile *tile = m->tile;
 	struct xe_gt *primary_gt = tile->primary_gt;
 	struct xe_device *xe = tile_to_xe(tile);
-	struct xe_validation_ctx ctx;
-	struct drm_exec exec;
 	struct xe_vm *vm;
 	int err;
 
@@ -416,14 +432,7 @@ int xe_migrate_init(struct xe_migrate *m)
 	if (IS_ERR(vm))
 		return PTR_ERR(vm);
 
-	err = 0;
-	xe_validation_guard(&ctx, &xe->val, &exec, (struct xe_val_flags) {}, err) {
-		err = xe_vm_drm_exec_lock(vm, &exec);
-		drm_exec_retry_on_contention(&exec);
-		err = xe_migrate_prepare_vm(tile, m, vm, &exec);
-		drm_exec_retry_on_contention(&exec);
-		xe_validation_retry_on_oom(&ctx, &err);
-	}
+	err = xe_migrate_lock_prepare_vm(tile, m, vm);
 	if (err)
 		return err;
 
-- 
2.51.0

