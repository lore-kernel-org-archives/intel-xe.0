Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A46EFE87850
	for <intel-xe@archiver.kernel.org>; Tue,  3 Feb 2026 17:39:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E6DE10E71C;
	Tue,  3 Feb 2026 17:39:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f3VFsqGk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8187B10E71C
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Feb 2026 17:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770140388; x=1801676388;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fNRBpP7XbOK4hetoTlypPtR+grvVXAzd+XKy2VpztVY=;
 b=f3VFsqGkhh/lt0/sHGKEEMz9mNew+ybT0DWXJSMXYD14VlE3iNoSNwYM
 IrC/YamRicJlVbyo/WO62CZ8b7dJ/e9dWgRb0snYkVNOtwYJRoWXw+sKp
 3YnnMpW/2SDLaU8+xzGWPpq3c7m44lLBKCg+FLK70SnqmR0YYjxEwGwNU
 Gig+HsHgH/pt2kTa353BYX3fbc6uK9UM835WzVFuXmMdgwXYdDl6Yyu2V
 kmykUxKcuJlId3ewHji1mxGJxNN1KBUK4q/4A4Uxm6NvxZ+siDYCKpzVI
 Z+gEcO4fL3Vk6uB2nfYxW11+s3ok+qCQLsXvx3FlT2bOAhYFFih7NtF5M g==;
X-CSE-ConnectionGUID: UKkUcKifQRaVgQFDyYJr3A==
X-CSE-MsgGUID: wMwiw5tAQh+I1ZAatVbWCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71479112"
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; d="scan'208";a="71479112"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 09:39:48 -0800
X-CSE-ConnectionGUID: eiijMX1xT5utSt/jKWRgDA==
X-CSE-MsgGUID: 2OwEH7RyRWO0fLncNs8MgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; d="scan'208";a="209716579"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by orviesa009.jf.intel.com with ESMTP; 03 Feb 2026 09:39:46 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH] drm/xe/reg_sr: Fix leak on xa_store failure
Date: Tue,  3 Feb 2026 17:36:40 +0000
Message-ID: <20260203173639.1399354-2-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
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

Free the newly allocated entry when xa_store() fails to avoid a memory
leak on the error path.

Fixes: e5283bd4dfec ("drm/xe/reg_sr: Remove register pool")
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_reg_sr.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
index d3e13ea33123..ce3dab8a0f47 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr.c
+++ b/drivers/gpu/drm/xe/xe_reg_sr.c
@@ -74,6 +74,7 @@ int xe_reg_sr_add(struct xe_reg_sr *sr,
 {
 	unsigned long idx = e->reg.addr;
 	struct xe_reg_sr_entry *pentry = xa_load(&sr->xa, idx);
+	bool allocated = false;
 	int ret;
 
 	if (pentry) {
@@ -94,6 +95,7 @@ int xe_reg_sr_add(struct xe_reg_sr *sr,
 		ret = -ENOMEM;
 		goto fail;
 	}
+	allocated = true;
 
 	*pentry = *e;
 	ret = xa_err(xa_store(&sr->xa, idx, pentry, GFP_KERNEL));
@@ -103,6 +105,8 @@ int xe_reg_sr_add(struct xe_reg_sr *sr,
 	return 0;
 
 fail:
+	if (allocated)
+		kfree(pentry);
 	xe_gt_err(gt,
 		  "discarding save-restore reg %04lx (clear: %08x, set: %08x, masked: %s, mcr: %s): ret=%d\n",
 		  idx, e->clr_bits, e->set_bits,
-- 
2.50.1

