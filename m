Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A25CCC369AA
	for <intel-xe@archiver.kernel.org>; Wed, 25 Sep 2024 08:45:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BA7910E2DB;
	Wed, 25 Sep 2024 08:45:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m9d/Jdgd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F44710E2DB
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Sep 2024 08:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727253914; x=1758789914;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Av2iHiNo7CVeznootP0tn6Oe/So+3Y+fCNE+xjO/1MU=;
 b=m9d/JdgdRYkxXEM3KzhaAgNxVIGmLQrKe2nv5kss+GBPIN+WaglKoS4H
 Ws3EQ5KSzvZnL7rRLUkXUj4G0gPKaT0XjHQ5OoOFDflLDe77lxLePmdVx
 4EF8TFGFmYmZheTun7T8f3+bWpsUqaRnk4szieCAXLYtbb6I2GrNVQXDc
 0yZt9U9lRYMTodWp25VraGquE+0YSLtNlWJUEq0bHgc7P2+yZJPTI9V7/
 7wKzrl+6lMabub+5nzHDa1oU3rP5l6dH/plbu1vcpfXlkeGd09cAlVYSA
 /kAo7FtDE/MF9PBq/DRBN/pUSBSrjXPiGpGoSqkJ/hwmoY8NL9oD+wQZR g==;
X-CSE-ConnectionGUID: lOuA6w+LRRCrjEq5XlJG5g==
X-CSE-MsgGUID: ZjQAjJd9SGaSgGu+iPp3Mw==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="48820114"
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600"; d="scan'208";a="48820114"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 01:45:14 -0700
X-CSE-ConnectionGUID: sqDrK4HBRlia8B7Kht1tNg==
X-CSE-MsgGUID: Nl83xmiyROerO5/YK4MSJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600"; d="scan'208";a="72019407"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.19.248])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 01:45:12 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Ilia Levi <ilia.levi@intel.com>
Subject: [PATCH] drm/xe: Add memirq report page address helpers
Date: Wed, 25 Sep 2024 10:44:45 +0200
Message-Id: <20240925084445.1495-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

Both xe_memirq_{source,status}_ptr functions are now strictly for
obtaining an address of the memory based interrupt report pages
used by the HW engines. When initializing the GuC that does not
require special per instance page preparation, we don't need to
abuse these public functions and pass a NULL instead of valid hwe
pointer. Also, without further fixes, this actually may lead to
NPD crash once the hw_reports_to_instance_zero() will be true.

Add internal helpers that will provide report page addresses based
solely on the instance number, which will be always 0 for both GuCs.

Fixes: ef6103d20f97 ("drm/xe: memirq infra changes for MSI-X")
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Ilia Levi <ilia.levi@intel.com>
---
 drivers/gpu/drm/xe/xe_memirq.c | 35 ++++++++++++++++++++--------------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
index 3f8d4ca64302..715dc5903787 100644
--- a/drivers/gpu/drm/xe/xe_memirq.c
+++ b/drivers/gpu/drm/xe/xe_memirq.c
@@ -261,6 +261,15 @@ int xe_memirq_init(struct xe_memirq *memirq)
 	return 0;
 }
 
+static u32 __memirq_source_page(struct xe_memirq *memirq, u16 instance)
+{
+	memirq_assert(memirq, instance <= XE_HW_ENGINE_MAX_INSTANCE);
+	memirq_assert(memirq, memirq->bo);
+
+	instance = hw_reports_to_instance_zero(memirq) ? instance : 0;
+	return xe_bo_ggtt_addr(memirq->bo) + XE_MEMIRQ_SOURCE_OFFSET(instance);
+}
+
 /**
  * xe_memirq_source_ptr - Get GGTT's offset of the `Interrupt Source Report Page`_.
  * @memirq: the &xe_memirq to query
@@ -273,14 +282,18 @@ int xe_memirq_init(struct xe_memirq *memirq)
  */
 u32 xe_memirq_source_ptr(struct xe_memirq *memirq, struct xe_hw_engine *hwe)
 {
-	u16 instance;
-
 	memirq_assert(memirq, xe_device_uses_memirq(memirq_to_xe(memirq)));
+
+	return __memirq_source_page(memirq, hwe->instance);
+}
+
+static u32 __memirq_status_page(struct xe_memirq *memirq, u16 instance)
+{
+	memirq_assert(memirq, instance <= XE_HW_ENGINE_MAX_INSTANCE);
 	memirq_assert(memirq, memirq->bo);
 
-	instance = hw_reports_to_instance_zero(memirq) ? hwe->instance : 0;
-
-	return xe_bo_ggtt_addr(memirq->bo) + XE_MEMIRQ_SOURCE_OFFSET(instance);
+	instance = hw_reports_to_instance_zero(memirq) ? instance : 0;
+	return xe_bo_ggtt_addr(memirq->bo) + XE_MEMIRQ_STATUS_OFFSET(instance);
 }
 
 /**
@@ -295,14 +308,9 @@ u32 xe_memirq_source_ptr(struct xe_memirq *memirq, struct xe_hw_engine *hwe)
  */
 u32 xe_memirq_status_ptr(struct xe_memirq *memirq, struct xe_hw_engine *hwe)
 {
-	u16 instance;
-
 	memirq_assert(memirq, xe_device_uses_memirq(memirq_to_xe(memirq)));
-	memirq_assert(memirq, memirq->bo);
 
-	instance = hw_reports_to_instance_zero(memirq) ? hwe->instance : 0;
-
-	return xe_bo_ggtt_addr(memirq->bo) + XE_MEMIRQ_STATUS_OFFSET(instance);
+	return __memirq_status_page(memirq, hwe->instance);
 }
 
 /**
@@ -343,10 +351,9 @@ int xe_memirq_init_guc(struct xe_memirq *memirq, struct xe_guc *guc)
 	int err;
 
 	memirq_assert(memirq, xe_device_uses_memirq(memirq_to_xe(memirq)));
-	memirq_assert(memirq, memirq->bo);
 
-	source = xe_memirq_source_ptr(memirq, NULL) + offset;
-	status = xe_memirq_status_ptr(memirq, NULL) + offset * SZ_16;
+	source = __memirq_source_page(memirq, 0) + offset;
+	status = __memirq_status_page(memirq, 0) + offset * SZ_16;
 
 	err = xe_guc_self_cfg64(guc, GUC_KLV_SELF_CFG_MEMIRQ_SOURCE_ADDR_KEY,
 				source);
-- 
2.43.0

