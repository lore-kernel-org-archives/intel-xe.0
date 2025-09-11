Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D85CA1016
	for <intel-xe@archiver.kernel.org>; Thu, 11 Sep 2025 08:04:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF07710EA3E;
	Thu, 11 Sep 2025 08:04:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KdtEqoec";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C62B10EA3E
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Sep 2025 08:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757577869; x=1789113869;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RpFEubS6PWIbVDTGZzno953Mmk7orj09EXjG//KooX4=;
 b=KdtEqoec4hZ+i7Qaf5cFK6+mTG3Kz5OGU2ExOD5rco+5TZl4FjyXy0A6
 NCNBrE3RRcprQnr0qBM/B0bVR5oLXIYlBDk6WRm6oVapdaQGQK6qU9bta
 HOl6zmYw1v72EW2SoVBzwbwk88C6Y5CF6Kzu7yPZyHo5B2u+xEOkedaBn
 9gAiMrwiQ2h9h5dYsJyVIrZ+6LKSRuIYOd8awjWf6a5uirA3S1kzuiHVZ
 AB1Mn2Caz+xsrdn6MlR5ZUgxt4rCvqk6icEzXHc977OT2dt+vCMbohTGx
 fcFLxuJB3z8a6t5ywOgLGQ7w2WdjqBQWdytodl68yGO4KbtFugEVI6i8I g==;
X-CSE-ConnectionGUID: iioRYz5RS5yeoDZB08pmXQ==
X-CSE-MsgGUID: 83GjBVKsTVus6QbSPOOMtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="82489895"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="82489895"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 01:04:29 -0700
X-CSE-ConnectionGUID: mLS5CCmeSzCEhZki31K5/w==
X-CSE-MsgGUID: lGK0ohovTt66fPRysqKG0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; d="scan'208";a="204392471"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO fedora)
 ([10.245.245.168])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 01:04:27 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>, kernel test robot <lkp@intel.com>
Subject: [PATCH v2] drm/xe: Work around clang multiple goto-label error
Date: Thu, 11 Sep 2025 10:03:24 +0200
Message-ID: <20250911080324.180307-1-thomas.hellstrom@linux.intel.com>
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

When using drm_exec_retry_on_contention(), clang may consider
all labels for which we take addresses in a function as
potential retry goto targets, although strictly only one
is possible. It will then in some situations generate false
positive errors.

In this case, the compiler, for some architectures, consider the

might_lock(&m->job_mutex);

as a potential goto target from drm_exec_retry_on_contention(),
and errors.

Work around that by moving the xe_validate / drm_exec
transaction to a separate function.

v2:
- New commit message based on analysis of Nathan Chancellor

Fixes: 59eabff2a352 ("drm/xe: Convert xe_bo_create_pin_map() for exhaustive eviction")
Cc: Matthew Brost <matthew.brost@intel.com>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202509101853.nDmyxTEM-lkp@intel.com/
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
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

