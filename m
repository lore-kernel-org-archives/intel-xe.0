Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1588DC83F14
	for <intel-xe@archiver.kernel.org>; Tue, 29 Aug 2023 18:06:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C229E10E052;
	Tue, 29 Aug 2023 18:06:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D737110E052
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Aug 2023 18:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693332404; x=1724868404;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aYOcObOqdN1e4AIctAeum/Ua2y70sq1McTfOXSeFok0=;
 b=PlvFirVj+h7G/SWLAGp0BRh+riemypzHoN+GOV+LlluPE2XNMA/ygNtC
 vOE1Wd6I6WYlcI9WuMvSCT2/WlZgoWjKmHxf5wxLQqNhRzEhcvlcjxZMQ
 anFjPbDUAG1VcHwAg/5+ZLKbA73Zkef98bPMvRq4EZkZ+NFYkS4ftCPoS
 teFFwJqdiFBMIb9Q7E5vWgNhg0WJVeLswEJeyUlWfWNoHtIgX5vShe6jS
 Hyoo4e53HBWOoqlT9u4cOXngTI9Rm3WL/qpUDm9wSvOPncVQ2jM8al/TC
 TdZInChhT6eU+yrU3rjzEnWe+Al//QfgC4cteROp0NKx3YOIZksspwLaQ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="461821494"
X-IronPort-AV: E=Sophos;i="6.02,211,1688454000"; d="scan'208";a="461821494"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 11:06:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="862322964"
X-IronPort-AV: E=Sophos;i="6.02,211,1688454000"; d="scan'208";a="862322964"
Received: from pallavim-desk.iind.intel.com ([10.145.162.180])
 by orsmga004.jf.intel.com with ESMTP; 29 Aug 2023 11:06:42 -0700
From: Pallavi Mishra <pallavi.mishra@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 29 Aug 2023 23:43:35 +0530
Message-Id: <20230829181335.779696-1-pallavi.mishra@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Prevent return with locked vm
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
Cc: matthew.auld@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Reorder vm_id check after the one for VISIBLE_VRAM. This should
prevent returning with locked vm in error scenario.

Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 1ab682d61e3c..6a8a41dafe88 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1785,17 +1785,6 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 	if (XE_IOCTL_DBG(xe, args->size & ~PAGE_MASK))
 		return -EINVAL;
 
-	if (args->vm_id) {
-		vm = xe_vm_lookup(xef, args->vm_id);
-		if (XE_IOCTL_DBG(xe, !vm))
-			return -ENOENT;
-		err = xe_vm_lock(vm, &ww, 0, true);
-		if (err) {
-			xe_vm_put(vm);
-			return err;
-		}
-	}
-
 	if (args->flags & XE_GEM_CREATE_FLAG_DEFER_BACKING)
 		bo_flags |= XE_BO_DEFER_BACKING;
 
@@ -1811,6 +1800,17 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 		bo_flags |= XE_BO_NEEDS_CPU_ACCESS;
 	}
 
+	if (args->vm_id) {
+		vm = xe_vm_lookup(xef, args->vm_id);
+		if (XE_IOCTL_DBG(xe, !vm))
+			return -ENOENT;
+		err = xe_vm_lock(vm, &ww, 0, true);
+		if (err) {
+			xe_vm_put(vm);
+			return err;
+		}
+	}
+
 	bo = xe_bo_create(xe, NULL, vm, args->size, ttm_bo_type_device,
 			  bo_flags);
 	if (IS_ERR(bo)) {
-- 
2.25.1

