Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F51BD65C47
	for <intel-xe@archiver.kernel.org>; Wed, 17 Dec 2025 13:20:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3B4010E348;
	Wed, 17 Dec 2025 13:20:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ld46OR/2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D31FB10E348
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Dec 2025 13:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765977635; x=1797513635;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=X7t+DO7SZ7ftEDf2jNz/7GeJlDhESluJQ+bQOuz8Rc4=;
 b=ld46OR/2RqPGEHqXv4fSTbz9Ykv9WmsW/AlbbFU4pfUmvEDSO0+BuAQQ
 z1DQtYi1gnGnaC0Nm8GVsz0dYtTzB3acG7g3ciLdfpSYljByzIAqpv42h
 8IOkNEEyEEAfzKbilP4BthBomd5SO2LNyW5QEeZu+0+anRCEwZDnvqr/G
 HgY4ZWhzPDfuSDUXr9wGPK+/v7e3P/qreqvH/p//G6gDuyziv3eQ8sUAp
 y37iqwlL07NR99rKf28t1Asf8WK7m1RTAYfCUJt/OYX08HSYs/muulM0j
 iHbptihTqTGeFzlnz7/gcU4sEL3Qan0ZFiDxjtkAUxY21SgrJNnH63gDb g==;
X-CSE-ConnectionGUID: Zic2mEmBS22u6CiSWw50wQ==
X-CSE-MsgGUID: p+BPTrKrRIiqAumA07yUQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="71769926"
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; d="scan'208";a="71769926"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 05:20:35 -0800
X-CSE-ConnectionGUID: 1rFePUrNRMaPGE0YEaoadQ==
X-CSE-MsgGUID: +x2uiLOGSSmKeqbAEhGDOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; d="scan'208";a="235711129"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa001.jf.intel.com with ESMTP; 17 Dec 2025 05:20:32 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, matthew.brost@intel.com,
 michal.wajdeczko@intel.com, badal.nilawar@intel.com,
 karthik.poosa@intel.com, matthew.d.roper@intel.com, dev@lankhorst.se,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1] drm/xe/pm: Handle GT resume failure
Date: Wed, 17 Dec 2025 18:49:09 +0530
Message-ID: <20251217131909.1226331-1-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
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

We've been historically ignoring GT resume failure. Since the function
can return error, handle it properly.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 4390ba69610d..a8b50091d62e 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -260,8 +260,11 @@ int xe_pm_resume(struct xe_device *xe)
 
 	xe_irq_resume(xe);
 
-	for_each_gt(gt, xe, id)
-		xe_gt_resume(gt);
+	for_each_gt(gt, xe, id) {
+		err = xe_gt_resume(gt);
+		if (err)
+			goto err;
+	}
 
 	xe_display_pm_resume(xe);
 
@@ -656,8 +659,11 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 
 	xe_irq_resume(xe);
 
-	for_each_gt(gt, xe, id)
-		xe->d3cold.allowed ? xe_gt_resume(gt) : xe_gt_runtime_resume(gt);
+	for_each_gt(gt, xe, id) {
+		err = xe->d3cold.allowed ? xe_gt_resume(gt) : xe_gt_runtime_resume(gt);
+		if (err)
+			goto out;
+	}
 
 	xe_display_pm_runtime_resume(xe);
 
-- 
2.43.0

