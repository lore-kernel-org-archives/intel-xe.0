Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37F9FEB64DA
	for <intel-xe@archiver.kernel.org>; Thu, 20 Jul 2023 21:44:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D54EA10E1A6;
	Thu, 20 Jul 2023 21:44:40 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0DF410E19F
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Jul 2023 21:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689889478; x=1721425478;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/8SFhhTF8pGm8hhh2UxJxicuzfDOf1fdW36Sguh2FO8=;
 b=mB5fzQU7qMNmGMt5RdBNs0LRgAJw197L4D1bn6hSxubQHbSwiTmFd52x
 1RADsoi2zKiqc4lUKTvPKVmUVXGlx6Y6wTyYpwPUYjQCfBtqnj8RIkLXt
 fXyeyGnT8VBpZHyAqC++Qk0EKc1gRx4aUjpi7GWZ0pVI2qBBWP0D2JksI
 WdZbtH8zD28vVvAOxP2v9v5h/u//ldGLU+NdfDAUKoEL+KBiLh9CGivg8
 Asv6O1HXUc2CS8jAVKjWUUHeImO1NzGlkkuYAGEwJEeeQjlm+SG40PSPZ
 njlKqnPJOl8TiJkfyjS7/JA6AQt06aSIiq/zYKwQD9couBRNNi5YCjSDk g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="433093174"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; d="scan'208";a="433093174"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 14:43:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="814693476"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; d="scan'208";a="814693476"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 14:43:50 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 20 Jul 2023 14:43:39 -0700
Message-Id: <20230720214345.203464-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/7] drm/xe: Remove xe_vma_op_unmap
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

xe_vma_op_unmap isn't used, remove it.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c       |  5 -----
 drivers/gpu/drm/xe/xe_vm_types.h | 10 ----------
 2 files changed, 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index f8e6f1fda1fe..63c9e1c94515 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2516,11 +2516,6 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_engine *e,
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
index bcbcad1929d6..ce26298d7a5f 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -333,14 +333,6 @@ struct xe_vma_op_map {
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
@@ -408,8 +400,6 @@ struct xe_vma_op {
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

