Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFB77EB64DC
	for <intel-xe@archiver.kernel.org>; Thu, 20 Jul 2023 04:21:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93C3710E554;
	Thu, 20 Jul 2023 04:21:31 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44BF610E551
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Jul 2023 04:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689826881; x=1721362881;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JQV5kMkAWP4t6eMzubKyEdn0yh4UJMJd0ZPrBpuyG6A=;
 b=KtH4Y8gCEj0KXj8aeEcW/j34hlPKDW4dsIwwk8TqoaUVM/alxNq/TuH1
 Zq0ndNSYYl/s5v/exYoa0l42olcliQvxKd7Ucw9p4piH9N4q2F5UGG9BZ
 zMRVI4kWTgDvFOXhU6Gu2LSFgEiJ1e3D+N1b7kOASibzMn4iixLLsggMS
 6TPveuezZExcW+ynWEzKQUkaijI648YbKRNpgT9Vbs18Y59WQGok2dTWx
 p9qkxJW3LN8RVdh+IndV172IFGD2p3PM36KRiis+D/V0vOFHaXbIeVHsA
 D74cuTOMX2Br71CTKcdxuAWr5RM/rHJJOnxY2c+wrr7fcOJsiC1FEifam w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="366661710"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="366661710"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2023 21:21:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="724245039"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="724245039"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2023 21:21:19 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 19 Jul 2023 21:21:09 -0700
Message-Id: <20230720042115.119494-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230720042115.119494-1-matthew.brost@intel.com>
References: <20230720042115.119494-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 1/7] drm/xe: Remove xe_vma_op_unmap
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

xe_vma_op_unmap isn't used, remove it.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c       |  5 -----
 drivers/gpu/drm/xe/xe_vm_types.h | 10 ----------
 2 files changed, 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index fc2a09087d98..87907a97a8c3 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2508,11 +2508,6 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_engine *e,
 					xe_vma_size(gpuva_to_vma(op->base.remap.unmap->va));
 				break;
 			case DRM_GPUVA_OP_UNMAP:
-				op->unmap.start =
-					xe_vma_start(gpuva_to_vma(op->base.unmap.va));
-				op->unmap.range =
-					xe_vma_size(gpuva_to_vma(op->base.unmap.va));
-				break;
 			case DRM_GPUVA_OP_PREFETCH:
 				/* Nothing to do */
 				break;
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 379c5d617d72..dbe6aed6d2cf 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -326,14 +326,6 @@ struct xe_vma_op_map {
 	bool is_null;
 };
 
-/** struct xe_vma_op_unmap - VMA unmap operation */
-struct xe_vma_op_unmap {
-	/** @start: start of the VMA unmap */
-	u64 start;
-	/** @range: range of the VMA unmap */
-	u64 range;
-};
-
 /** struct xe_vma_op_remap - VMA remap operation */
 struct xe_vma_op_remap {
 	/** @prev: VMA preceding part of a split mapping */
@@ -401,8 +393,6 @@ struct xe_vma_op {
 	union {
 		/** @map: VMA map operation specific data */
 		struct xe_vma_op_map map;
-		/** @unmap: VMA unmap operation specific data */
-		struct xe_vma_op_unmap unmap;
 		/** @remap: VMA remap operation specific data */
 		struct xe_vma_op_remap remap;
 		/** @prefetch: VMA prefetch operation specific data */
-- 
2.34.1

