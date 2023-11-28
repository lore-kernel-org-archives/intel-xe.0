Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B49FDC4167B
	for <intel-xe@archiver.kernel.org>; Tue, 28 Nov 2023 21:36:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E50A10E334;
	Tue, 28 Nov 2023 21:36:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8981110E06E
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Nov 2023 21:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701207395; x=1732743395;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=288ZL6dKw7epMABq8/dZ5U1L7fg5uogYCKTsA5gsx5o=;
 b=fKrQ8Aq2yAsZOfVtU1VZ2RxqaZy4/7Vi4unma/6/qS1UHfbXeIbBP2Es
 e3Qcl33HLdVNioLWgfJiU7nQzhstc/+1Sn8GCdIjg58Ynkiw9wvY5JWq6
 NjxF/xXIwrBt2usNFrqyZ5gU9d2H664Qq+5qnAxa46NeIWLJCYp1a1Fx0
 +Y8jPdVidwfNz35b8meY0Plk3nzret7VluEJkilo++3z0cjO/QpJ7NgkT
 b7oRfPsnpbZfTQm8INNXHdqxoxxSRyvc9KPzy5079KARejpG5akmQdGuY
 +GE67mt1YU9hrWISFqfe/d+Lgtru9W0pjhi7nQ3lM4rd4+IncG+yd8RPp w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="390193766"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="390193766"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 13:36:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="886587845"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="886587845"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 13:36:34 -0800
From: Brian Welty <brian.welty@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 28 Nov 2023 13:36:33 -0800
Message-Id: <20231128213634.3633-2-brian.welty@intel.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20231128213634.3633-1-brian.welty@intel.com>
References: <20231128213634.3633-1-brian.welty@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] drm/xe/xe2: Update LNL platform to support
 device page faults
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

LNL is first integrated platform to support device pagefaults.
As we have no VRAM, changes needed to support LNL are:
- device pagefault handler should not attempt to migrate into VRAM
- update xe_migrate_prepare_vm() to use the usm batch buffer even
  for servicing device page faults on integrated platforms

Signed-off-by: Brian Welty <brian.welty@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c | 2 +-
 drivers/gpu/drm/xe/xe_migrate.c      | 7 +++++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 03c1ab0ab0ca..959ea50c04db 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -105,7 +105,7 @@ static int xe_pf_begin(struct drm_exec *exec, struct xe_vma *vma,
 	if (err)
 		return err;
 
-	if (atomic) {
+	if (atomic && IS_DGFX(vm->xe)) {
 		if (xe_vma_is_userptr(vma)) {
 			err = -EACCES;
 			return err;
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 80a130beca61..e8b567708ac0 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -215,10 +215,13 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 	}
 
 	if (!IS_DGFX(xe)) {
-		xe_tile_assert(tile, !xe->info.supports_usm);
-
 		/* Write out batch too */
 		m->batch_base_ofs = NUM_PT_SLOTS * XE_PAGE_SIZE;
+		if (xe->info.supports_usm) {
+			batch = tile->primary_gt->usm.bb_pool->bo;
+			m->usm_batch_base_ofs = m->batch_base_ofs;
+		}
+
 		for (i = 0; i < batch->size;
 		     i += vm->flags & XE_VM_FLAG_64K ? XE_64K_PAGE_SIZE :
 		     XE_PAGE_SIZE) {
-- 
2.38.0

