Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8EADCD37B2
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 15:46:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5F0510E55A;
	Mon, 11 May 2026 15:46:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hHjtJoJY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BA1C10E55A
 for <intel-xe@lists.freedesktop.org>; Mon, 11 May 2026 15:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778514392; x=1810050392;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JyI92tdPYlOAZlnKYLuSq37FSQ6M31RLv59KvDqsGK4=;
 b=hHjtJoJYCPlO/dsVBeIY+mLIzBz5eOj0yLLyX8ITw4ZjYOYbdbnjjj3N
 uu6bd5QQRUdGHjl4v6MlVrkyG3Ux2r3frJXMTr4PTM29shItziOo1b+BH
 Qr9f9NogYoCHj+9Nzw99A0Q5X7mKACaHJsW8+/y4VPtuUH3MM/DPk205A
 oNeBhuPKmf9gn/b4lOwiBfDC976vSZ3ybfw6mym7pZ7IVmv8GcS/AyKmJ
 2ommvIatEbn5MndpcsF1xeZBcyU5lulkhK3U5etQGsz0f37NNZy6he0aP
 eFcj0NTbAfrJo9KB+4WH9D03g6+gKdHjmOOMUy1p08fndPOkBQ6OSrEX9 w==;
X-CSE-ConnectionGUID: oFe1SW5eTJaHo3Trp89kiA==
X-CSE-MsgGUID: bLBHRhNGSOyc5Om4tydUEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="83253985"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="83253985"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 08:46:31 -0700
X-CSE-ConnectionGUID: e1wbcMtsTX2GGQY8T7wMUA==
X-CSE-MsgGUID: 3wBKQ0IuTbaS+2hSSERHqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="234433197"
Received: from osgcshtiger.sh.intel.com ([10.239.81.49])
 by fmviesa007.fm.intel.com with ESMTP; 11 May 2026 08:46:30 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Subject: [PATCH] drm/xe/hw_engine: Fix double-free of managed BO in error path
Date: Mon, 11 May 2026 15:46:22 +0000
Message-Id: <20260511154622.223795-1-shuicheng.lin@intel.com>
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

The error path in hw_engine_init() explicitly frees a BO allocated
with xe_managed_bo_create_pin_map() via xe_bo_unpin_map_no_vm().
Since the managed BO already has a devm cleanup action registered,
this causes a double-free when devm unwinds during probe failure.

Remove the explicit free and let devm handle it, consistent with
all other xe_managed_bo_create_pin_map() callers.

Fixes: 23e939bc8f56 ("drm/xe: Add a helper for DRM device-lifetime BO create")
Assisted-by: Claude:claude-opus-4.6
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
Cc: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 0f0e08bcc182..7c994051280a 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -612,7 +612,7 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
 		hwe->exl_port = xe_execlist_port_create(xe, hwe);
 		if (IS_ERR(hwe->exl_port)) {
 			err = PTR_ERR(hwe->exl_port);
-			goto err_hwsp;
+			goto err_name;
 		}
 	} else {
 		/* GSCCS has a special interrupt for reset */
@@ -632,8 +632,6 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
 
 	return devm_add_action_or_reset(xe->drm.dev, hw_engine_fini, hwe);
 
-err_hwsp:
-	xe_bo_unpin_map_no_vm(hwe->hwsp);
 err_name:
 	hwe->name = NULL;
 
-- 
2.43.0

