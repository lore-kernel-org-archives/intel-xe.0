Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B86D0CD37A7
	for <intel-xe@archiver.kernel.org>; Wed,  4 Sep 2024 00:21:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5693F10E664;
	Wed,  4 Sep 2024 00:21:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TzSynryf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6A2810E63A
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Sep 2024 00:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725409276; x=1756945276;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JGX4tF0pU7rc0feZzErJndmeAzy/naGTDg8DSWep+LA=;
 b=TzSynryfhBInSojbvoQ+3hboL/b3JvsqTAC/0z7JCqqsGxZMcjpJKbno
 c7VcU2jPQyTPEOTwkeNPRbCzSeXjbrkEkRhZjvuMFXlUSr+bpTyXlB7cm
 WWz1Jkqtd25MImth1e0/ebJicgAFZZqNhBRJrrrZhwsiYnRW3RNiB/kkR
 uAiENexKSI/WAze8bAGTiTJzx3Pb4ZYKQwhgAaMjtc/IIykcsA2RglqfQ
 8kak4wFSGT1/2kV0qZc7+KNNKnt1o7jDZLzK5Cb1/+23taEZgrmiFBqrs
 ktWQKL3Aju6CwLq/gKUzL25v6Vn2HGBdwSTtObMamragHVTpA5j/ytARU A==;
X-CSE-ConnectionGUID: VKZPUfUASl+MQUF8iGRk7g==
X-CSE-MsgGUID: l4Ka8kcbQ5m2PzryKYsW+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="23904810"
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; d="scan'208";a="23904810"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 17:21:16 -0700
X-CSE-ConnectionGUID: n0PZAGCeTAWuhzbxtg+EZg==
X-CSE-MsgGUID: qKoTEWU+SEqbaAphdepQjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; d="scan'208";a="69944269"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 17:21:16 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 22/43] drm/xe/huc: Convert register access to use xe_mmio
Date: Tue,  3 Sep 2024 17:21:23 -0700
Message-ID: <20240904002100.2023834-67-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240904002100.2023834-45-matthew.d.roper@intel.com>
References: <20240904002100.2023834-45-matthew.d.roper@intel.com>
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

Stop using GT pointers for register access.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_huc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
index f5459f97af23..77c5830309cf 100644
--- a/drivers/gpu/drm/xe/xe_huc.c
+++ b/drivers/gpu/drm/xe/xe_huc.c
@@ -229,7 +229,7 @@ bool xe_huc_is_authenticated(struct xe_huc *huc, enum xe_huc_auth_types type)
 {
 	struct xe_gt *gt = huc_to_gt(huc);
 
-	return xe_mmio_read32(gt, huc_auth_modes[type].reg) & huc_auth_modes[type].val;
+	return xe_mmio_read32(&gt->mmio, huc_auth_modes[type].reg) & huc_auth_modes[type].val;
 }
 
 int xe_huc_auth(struct xe_huc *huc, enum xe_huc_auth_types type)
@@ -268,7 +268,7 @@ int xe_huc_auth(struct xe_huc *huc, enum xe_huc_auth_types type)
 		goto fail;
 	}
 
-	ret = xe_mmio_wait32(gt, huc_auth_modes[type].reg, huc_auth_modes[type].val,
+	ret = xe_mmio_wait32(&gt->mmio, huc_auth_modes[type].reg, huc_auth_modes[type].val,
 			     huc_auth_modes[type].val, 100000, NULL, false);
 	if (ret) {
 		xe_gt_err(gt, "HuC: firmware not verified: %pe\n", ERR_PTR(ret));
@@ -308,7 +308,7 @@ void xe_huc_print_info(struct xe_huc *huc, struct drm_printer *p)
 		return;
 
 	drm_printf(p, "\nHuC status: 0x%08x\n",
-		   xe_mmio_read32(gt, HUC_KERNEL_LOAD_INFO));
+		   xe_mmio_read32(&gt->mmio, HUC_KERNEL_LOAD_INFO));
 
 	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 }
-- 
2.45.2

