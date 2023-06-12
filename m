Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0B82C7EE2F
	for <intel-xe@archiver.kernel.org>; Mon, 12 Jun 2023 17:14:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7485B10E2C0;
	Mon, 12 Jun 2023 17:14:51 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CDA710E2BD
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Jun 2023 17:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686590088; x=1718126088;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YPfcD9v2SXiHM8uIokQgTRCbge8L5GTRQAfTt7t0mDc=;
 b=OXveceBlrWucSBQV/q2zaGbSBOdt/wjnNaRsjDDRV8l30bqNN3n3jaT9
 UgBl+1rW5e14euHmexUPQ/o4rPQnciR6RJl5qODh8ZpqlFvkqQevAvE6i
 1uM3B8pMtfjxeoE9oPo122Q0KvqClA6RHc0ChxVtIsrsq2cmeA3My5idI
 BKFb/0c/rDqt0TdHE8LyFnPOFsDlKn0Y6sT5YwVYYCroq267xsPIoTYOJ
 qOAOtmmvNXwgHFG2njq+z4TSe9OKzmSjtz7t5EpbewbvN3HS0dJIaEHaW
 /kobWHj9u+3xCYgsD9lQih4vq6auJq4987crl/84RjGsn8LWAssszELmj Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="342792789"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; d="scan'208";a="342792789"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2023 10:14:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="688715239"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; d="scan'208";a="688715239"
Received: from mgutier2-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.22.12])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2023 10:14:46 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 12 Jun 2023 18:12:21 +0100
Message-Id: <20230612171225.88689-9-matthew.auld@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230612171225.88689-1-matthew.auld@intel.com>
References: <20230612171225.88689-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v11 08/12] drm/xe/mmio: enforce
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
2.40.1

