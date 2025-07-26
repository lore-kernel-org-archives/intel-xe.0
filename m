Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 461FEC87FCA
	for <intel-xe@archiver.kernel.org>; Sat, 26 Jul 2025 01:23:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB7AF10EA3C;
	Sat, 26 Jul 2025 01:23:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D+YHf62J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A95EE10EA3C
 for <intel-xe@lists.freedesktop.org>; Sat, 26 Jul 2025 01:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753492980; x=1785028980;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ySD63A/xxGzQmggcuWlIt3SQcJtRu5vBwHt7Gs0lwHg=;
 b=D+YHf62J5yN6AZhRhaQqbRRKw/ayP+cd+CP+/DCCNPm7W3z+NDZhfkc/
 KwNHzHbf9scftmxdjHNOp3S+AeViRaA6diKG4/1ohAj+brEg6DSwgdjQc
 XpgJWUKymaIymu3IngXkp0UxeWXmzXnzqW61+jB9OLoUGYcSxeWOfpaae
 Vurrp+wqS8/C9gCvLkKlDmgvmi4iRqyYgMWAeQyYGjKPuo4nZ6oQ0wNDx
 fhtic4+WVPxyowvdYk+WZQR9Tu5wZWQMhw7KS9uZndG9vCn5PcdR3pZIJ
 uDY2tgU58o9oS04TphSHsfk0oMyCQHMEEHhckfEI4OBqRIIRnDEX9Vgf8 Q==;
X-CSE-ConnectionGUID: 5Zrg58L0Rpm0Omx0iJ7ZSA==
X-CSE-MsgGUID: frocS49gQpq/j5Wh+oJVUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11503"; a="67182017"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="67182017"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2025 18:23:00 -0700
X-CSE-ConnectionGUID: luPlKjnvTXGKpKtX+ISGlA==
X-CSE-MsgGUID: mrzKm1h3TDKdnEwtA96cXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="165504654"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa005.fm.intel.com with ESMTP; 25 Jul 2025 18:22:58 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH] drm/xe/vf: Fix VM crash during VF driver release
Date: Sat, 26 Jul 2025 07:09:46 +0530
Message-ID: <20250726013946.32233-1-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
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

The VF CCS save/restore series (patchwork #149108) has a dependency
on the migration framework. A recent migration update in commit
d65ff1ec8535 ("drm/xe: Split xe_migrate allocation from initialization")
caused a VM crash during XE driver release for iGPU devices.

Update the VF CCS migration initialization sequence to align with the new
migration framework changes, resolving the release-time crash.

Fixes: f3009272ff2e ("drm/xe/vf: Create contexts for CCS read write")

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c           | 2 +-
 drivers/gpu/drm/xe/xe_migrate.c      | 5 ++---
 drivers/gpu/drm/xe/xe_migrate.h      | 2 +-
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c | 9 ++++++++-
 4 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index c8eda36546d3..1ef6eea7df19 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -564,7 +564,7 @@ static int gt_init_with_all_forcewake(struct xe_gt *gt)
 	if (xe_gt_is_main_type(gt)) {
 		struct xe_tile *tile = gt_to_tile(gt);
 
-		tile->migrate = xe_migrate_init(tile);
+		tile->migrate = xe_migrate_init(tile, tile->migrate);
 		if (IS_ERR(tile->migrate)) {
 			err = PTR_ERR(tile->migrate);
 			goto err_force_wake;
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 90065d7d29ff..ae03440a276c 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -400,11 +400,10 @@ struct xe_migrate *xe_migrate_alloc(struct xe_tile *tile)
  *
  * Return: Pointer to a migrate context on success. Error pointer on error.
  */
-struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
+struct xe_migrate *xe_migrate_init(struct xe_tile *tile, struct xe_migrate *m)
 {
-	struct xe_device *xe = tile_to_xe(tile);
 	struct xe_gt *primary_gt = tile->primary_gt;
-	struct xe_migrate *m = tile->migrate;
+	struct xe_device *xe = tile_to_xe(tile);
 	struct xe_vm *vm;
 	int err;
 
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index 3758f9615484..a5dfb34fc072 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -105,7 +105,7 @@ struct xe_migrate_pt_update {
 };
 
 struct xe_migrate *xe_migrate_alloc(struct xe_tile *tile);
-struct xe_migrate *xe_migrate_init(struct xe_tile *tile);
+struct xe_migrate *xe_migrate_init(struct xe_tile *tile, struct xe_migrate *m);
 
 struct dma_fence *xe_migrate_to_vram(struct xe_migrate *m,
 				     unsigned long npages,
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
index af43e04179aa..1752864f7ffe 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
@@ -270,11 +270,18 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
 		ctx = &tile->sriov.vf.ccs[ctx_id];
 		ctx->ctx_id = ctx_id;
 
-		migrate = xe_migrate_init(tile);
+		migrate = xe_migrate_alloc(tile);
 		if (IS_ERR(migrate)) {
 			err = PTR_ERR(migrate);
 			goto err_ret;
 		}
+
+		migrate = xe_migrate_init(tile, migrate);
+		if (IS_ERR(migrate)) {
+			err = PTR_ERR(migrate);
+			goto err_ret;
+		}
+
 		ctx->migrate = migrate;
 
 		err = alloc_bb_pool(tile, ctx);
-- 
2.43.0

