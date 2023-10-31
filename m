Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6EE1C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 31 Oct 2023 18:49:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B33F10E5B2;
	Tue, 31 Oct 2023 18:49:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFD8010E5B2
 for <intel-xe@lists.freedesktop.org>; Tue, 31 Oct 2023 18:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698778184; x=1730314184;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9N4nmZh4rYIVK2Ra9+Mv09uNQBbNLXsk3HWScdf59NE=;
 b=fNYIO//Y65Hcn+h4qJl3PQ7Hky9wFXuo+WwPJxXCB3qXrh+4FT1yeE0L
 Zaba9UNDQ+A3qJljpQDiCnU7urtKwfhJ4O0cIt7rtTghKOdkib2/0juu5
 LRJQAaSqf7+9dy06GUddiOZ2dum4V8XhGhbSs9HjKkEYqzHN67xxT1vBs
 4D7htDd23nKINnGeie+2rBt3eX8isjm2EEW4iHpOrSF10GVCfUuOLR0eF
 QZ3skO/tOg34Y3XJjQtDMeTaJyWYScbf7jRiYF3FjkWpgisaGcMmS0htl
 fLLh8Hw4+r2hCUGDiXv9z7Dly6M5QprgwYzRLRKTf0aKF++TY1ZrvdS1U A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="454822812"
X-IronPort-AV: E=Sophos;i="6.03,266,1694761200"; d="scan'208";a="454822812"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2023 11:49:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="737143660"
X-IronPort-AV: E=Sophos;i="6.03,266,1694761200"; d="scan'208";a="737143660"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2023 11:49:44 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 31 Oct 2023 11:50:14 -0700
Message-Id: <20231031185014.1605381-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Adjust tile_present mask when skipping
 rebinds
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

If a rebind is skipped the tile_present mask needs to be updated for the
newly created vma to properly reflect the state of the vma.

Reported-by: <christoph.manszewski@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 498c0b3e1d73..d26c90f0d702 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2340,6 +2340,10 @@ static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
 			op->flags |= XE_VMA_OP_COMMITTED;
 		break;
 	case DRM_GPUVA_OP_REMAP:
+	{
+		u8 tile_present =
+			gpuva_to_vma(op->base.remap.unmap->va)->tile_present;
+
 		prep_vma_destroy(vm, gpuva_to_vma(op->base.remap.unmap->va),
 				 true);
 		op->flags |= XE_VMA_OP_COMMITTED;
@@ -2348,15 +2352,21 @@ static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
 			err |= xe_vm_insert_vma(vm, op->remap.prev);
 			if (!err)
 				op->flags |= XE_VMA_OP_PREV_COMMITTED;
-			if (!err && op->remap.skip_prev)
+			if (!err && op->remap.skip_prev) {
+				op->remap.prev->tile_present =
+					tile_present;
 				op->remap.prev = NULL;
+			}
 		}
 		if (op->remap.next) {
 			err |= xe_vm_insert_vma(vm, op->remap.next);
 			if (!err)
 				op->flags |= XE_VMA_OP_NEXT_COMMITTED;
-			if (!err && op->remap.skip_next)
+			if (!err && op->remap.skip_next) {
+				op->remap.next->tile_present =
+					tile_present;
 				op->remap.next = NULL;
+			}
 		}
 
 		/* Adjust for partial unbind after removin VMA from VM */
@@ -2365,6 +2375,7 @@ static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
 			op->base.remap.unmap->va->va.range = op->remap.range;
 		}
 		break;
+	}
 	case DRM_GPUVA_OP_UNMAP:
 		prep_vma_destroy(vm, gpuva_to_vma(op->base.unmap.va), true);
 		op->flags |= XE_VMA_OP_COMMITTED;
-- 
2.34.1

