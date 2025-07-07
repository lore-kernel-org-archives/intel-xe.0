Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 258A3C83F07
	for <intel-xe@archiver.kernel.org>; Mon,  7 Jul 2025 02:00:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFCBB10E2FE;
	Mon,  7 Jul 2025 01:59:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G1fjznFs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4FC810E2FE
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Jul 2025 01:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751853598; x=1783389598;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZEs16mSAuCvjY3cyIBAv5B+QnxWkCagLEC3QzAlSXu0=;
 b=G1fjznFsanxLh9xhg5Km60pFurIyeXuGmFiNm5mfzwKzSCl7RdNkc8R+
 07l2KIbgdchRzUaXeDZ4scqRrejfr00A9S+1+9i0NILDnkRaPqtM4WEUQ
 baho+raD8HwpqkeECSd9X7t0qJuyH8KpFfhnC9Hlv6L09tGOwp0+Dejfe
 9i9raOiPqUejgRByz31j8/rNqxntaDHcrDqEKr2wxG3cThdnKoKqS1Cxm
 dTHs9PYbXmtCeI5Bgh+82tC3HipsGZJkKssKf5yybLB0FBcafPCMCAwRE
 qhZ5tNkAt73gD6ghdnGGkU5/OSW5QUTi7IPLRShxOk7b5GbxikMI2U8Ty A==;
X-CSE-ConnectionGUID: X1E3m3POQwCkITcrSRcZUA==
X-CSE-MsgGUID: +Bulp7iBRliAqbCXFtNEPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="53931188"
X-IronPort-AV: E=Sophos;i="6.16,293,1744095600"; d="scan'208";a="53931188"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2025 18:59:57 -0700
X-CSE-ConnectionGUID: ohKckd6fRES9NmQZG/JhkQ==
X-CSE-MsgGUID: DF1v3fLZTXii/1apfSeuoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,293,1744095600"; d="scan'208";a="154829253"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by orviesa009.jf.intel.com with ESMTP; 06 Jul 2025 18:59:56 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH] drm/xe/pm: Restore display pm if there is error after display
 suspend
Date: Mon,  7 Jul 2025 01:58:26 +0000
Message-ID: <20250707015825.3522467-2-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.49.0
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

xe_bo_evict_all() is called after xe_display_pm_suspend(). So if there
is error with xe_bo_evict_all(), display pm should be restored.

Fixes: 51462211f4a9 ("drm/xe/pxp: add PXP PM support")
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index ff749edc005b..bcfda545e74f 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -134,7 +134,7 @@ int xe_pm_suspend(struct xe_device *xe)
 	/* FIXME: Super racey... */
 	err = xe_bo_evict_all(xe);
 	if (err)
-		goto err_pxp;
+		goto err_display;
 
 	for_each_gt(gt, xe, id) {
 		err = xe_gt_suspend(gt);
@@ -151,7 +151,6 @@ int xe_pm_suspend(struct xe_device *xe)
 
 err_display:
 	xe_display_pm_resume(xe);
-err_pxp:
 	xe_pxp_pm_resume(xe->pxp);
 err:
 	drm_dbg(&xe->drm, "Device suspend failed %d\n", err);
-- 
2.49.0

