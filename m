Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4647FEB64DA
	for <intel-xe@archiver.kernel.org>; Mon, 26 Jun 2023 10:51:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 194D710E1E3;
	Mon, 26 Jun 2023 10:51:25 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B458710E1EE
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Jun 2023 10:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687776675; x=1719312675;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zh7RFc12IylB6f0e5+EjKVLA+w/5Tm9GmyfG1ZnIYgA=;
 b=Ek5VxoU0soGHXrxViys3/iJ+0HrjHxUE09TfwJPU/01+vVbvyrgV8TGg
 pqu69Xtz2ZHegsZuIf6MmOJel+0bcewj2gGt3x385dvoQnYmIPA3i9vtr
 8lxG3kI4u47/YTmrfIMbYu3THrrUBeLNF/ZKmx/0+SLbVLDdRzFd3eIsK
 EYlWgDFn97dV+GeENF8re+JAMD4HZUCjv4Oi1/R+j0MLXWy0OF17snh0L
 povGldOrV1URbjUw1tmlB5t9brPFdT3nL0Hlfcd3e55CiPfmWVjsdCLUR
 aCOlU6KThw2IbcIcwQM2HNQzbJ5JquGzgKCFXBRAEJcbIk3MxE0HvZZC6 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="361279995"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="361279995"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2023 03:51:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="829182818"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="829182818"
Received: from cbrady5x-mobl2.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.8.226])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2023 03:51:14 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 26 Jun 2023 11:50:47 +0100
Message-ID: <20230626105037.43780-24-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230626105037.43780-15-matthew.auld@intel.com>
References: <20230626105037.43780-15-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v12 09/13] drm/xe/mmio: enforce
 xe_device_assert_mem_access
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

The mem_access is meant to cover any kind of device level memory
access, mmio included.

Suggested-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
index 3c547d78afba..1a6f0fa9e04e 100644
--- a/drivers/gpu/drm/xe/xe_mmio.h
+++ b/drivers/gpu/drm/xe/xe_mmio.h
@@ -10,6 +10,7 @@
 #include <linux/io-64-nonatomic-lo-hi.h>
 
 #include "regs/xe_reg_defs.h"
+#include "xe_device.h"
 #include "xe_device_types.h"
 #include "xe_gt_types.h"
 
@@ -25,6 +26,8 @@ static inline u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
 {
 	struct xe_tile *tile = gt_to_tile(gt);
 
+	xe_device_assert_mem_access(tile->xe);
+
 	if (reg.addr < gt->mmio.adj_limit)
 		reg.addr += gt->mmio.adj_offset;
 
@@ -36,6 +39,8 @@ static inline void xe_mmio_write32(struct xe_gt *gt,
 {
 	struct xe_tile *tile = gt_to_tile(gt);
 
+	xe_device_assert_mem_access(tile->xe);
+
 	if (reg.addr < gt->mmio.adj_limit)
 		reg.addr += gt->mmio.adj_offset;
 
@@ -46,6 +51,8 @@ static inline u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
 {
 	struct xe_tile *tile = gt_to_tile(gt);
 
+	xe_device_assert_mem_access(tile->xe);
+
 	if (reg.addr < gt->mmio.adj_limit)
 		reg.addr += gt->mmio.adj_offset;
 
@@ -69,6 +76,8 @@ static inline void xe_mmio_write64(struct xe_gt *gt,
 {
 	struct xe_tile *tile = gt_to_tile(gt);
 
+	xe_device_assert_mem_access(tile->xe);
+
 	if (reg.addr < gt->mmio.adj_limit)
 		reg.addr += gt->mmio.adj_offset;
 
@@ -79,6 +88,8 @@ static inline u64 xe_mmio_read64(struct xe_gt *gt, struct xe_reg reg)
 {
 	struct xe_tile *tile = gt_to_tile(gt);
 
+	xe_device_assert_mem_access(tile->xe);
+
 	if (reg.addr < gt->mmio.adj_limit)
 		reg.addr += gt->mmio.adj_offset;
 
-- 
2.41.0

