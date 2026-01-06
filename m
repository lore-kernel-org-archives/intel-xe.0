Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47DEACEFD11
	for <intel-xe@archiver.kernel.org>; Tue,  6 Jan 2026 21:34:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B64D10E16F;
	Tue,  6 Jan 2026 21:34:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m0sdA4Pa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DFB310E16F
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Jan 2026 21:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767735289; x=1799271289;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ch8FabFt3PNKe10yWwUD+PQSuEQd87BUz1sUPq4Hhbo=;
 b=m0sdA4ParDHVGpXOVR530jk/0tkdWwEAhKnH0BMrqnCI0rPtAj/IMooX
 QKc62MN1BKoquBqqd55gC7JYQ4TDK3GBKjOCjsuZODUX5h4sLV6F8G/TY
 YJON+yWy/U/t2iaBhmr9UD+3Ff17dIdA+/28koWAwfxNxQ8w6FC+BDVMq
 SD4o+RQxjJEm5BJSM85vCEIWe003p3xm6SsGVHqfODy4n4G480OHBtOfP
 K/A0+j5VRUsREBk0f7Rc2/ATC1Y62F/EDRNY0se5WwgVplNdZzpBYDkRw
 /g1XgzHNoME1IZnyufSUkBFwlLZtRa1/wn+GAoXi6xWuPPdUK0Cu2YhCP w==;
X-CSE-ConnectionGUID: 60Jqgu9IQX2KIYvgorVLdg==
X-CSE-MsgGUID: InUnyM+FR52V0F+loa+1ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="72953539"
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; d="scan'208";a="72953539"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 13:34:49 -0800
X-CSE-ConnectionGUID: J9fkp0OjTh6Fw2aFjqQZBg==
X-CSE-MsgGUID: u3M3x+IGQpi/CaBQ6lrliA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; d="scan'208";a="202658242"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 13:34:48 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com, carlos.santa@intel.com,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH] drm/xe: Validate preferred system memory placement in
 xe_svm_range_validate
Date: Tue,  6 Jan 2026 13:34:43 -0800
Message-Id: <20260106213443.1866797-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Ensure preferred system memory placement is checked in
xe_svm_range_validate when dpagemap is NULL. Without this check, a
prefetch to system memory may become a no-op because device memory is
considered a valid placement.

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Fixes: 238dbc9d9f4a ("drm/xe: Use the vma attibute drm_pagemap to select where to migrate")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 05dba6abbcc8..be55b53ace8c 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -988,6 +988,8 @@ bool xe_svm_range_validate(struct xe_vm *vm,
 	ret = (range->tile_present & ~range->tile_invalidated & tile_mask) == tile_mask;
 	if (dpagemap)
 		ret = ret && xe_svm_range_has_pagemap_locked(range, dpagemap);
+	else
+		ret = ret && !range->base.pages.dpagemap;
 
 	xe_svm_notifier_unlock(vm);
 
-- 
2.34.1

