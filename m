Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA9A9CCD184
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 19:36:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8179210E690;
	Tue, 14 Oct 2025 19:36:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WRvPdOmw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE22E10E690
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 19:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760470601; x=1792006601;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kCnPebG/BuVHWGFWNUx1NrzTjnGdimXLTx4c0q+YnCQ=;
 b=WRvPdOmw40pkaQUx9SaVL2f4NngKjPZdvqI7uJTZ9FIxGl4nhicktZ0o
 0+Vl7Drwbv4coLZxfYmygQicSHh08PDHpHwFPmpZPMgfMpFDrWi9l24Kh
 xcYOzpiLuxL3r9vbQ874YjmKWHDDM+wmLjCgn3SwIVT7P7vkKk1XGwEYU
 dqL5RZtTnj6cHYh3wtDUYqFQZArzVlpcJjfCA0qpM1YhjWv1LIde/GAYZ
 wfZZYiu1UCk3vgkyyiZjgX57Mbx/bh5GkCNdqLHSy2/P1+V/NKUosWZuR
 ISVkuP+cIsm+5IZhDayXf96PegSs/z89ZkYLDoPk0+9qzFkO0QFyQNumE Q==;
X-CSE-ConnectionGUID: dYphedG+TLa021ORNVFtew==
X-CSE-MsgGUID: prLWxJpuRnyTiDzmnfTuVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="50202874"
X-IronPort-AV: E=Sophos;i="6.19,229,1754982000"; d="scan'208";a="50202874"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 12:36:41 -0700
X-CSE-ConnectionGUID: yrfqclutT2CCjDEzx02XeA==
X-CSE-MsgGUID: ykP2TyB6SSyA2wkiGXFh9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,229,1754982000"; d="scan'208";a="186223734"
Received: from dut4443lnl.fm.intel.com ([10.105.8.76])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 12:36:40 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com,
	alex.zuo@intel.com,
	jonathan.cavitt@intel.com
Subject: [PATCH] drm/xe: Don't call xe_device_get_gt twice in
 xe_hw_engine_lookup
Date: Tue, 14 Oct 2025 19:36:40 +0000
Message-ID: <20251014193639.148788-2-jonathan.cavitt@intel.com>
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

We already initialize a
struct xe_gt *gt = xe_device_get_gt(xe, eci.gt_id)
in xe_hw_engine_lookup to ensure the given gt_id is valid.
We don't need to call xe_device_get_gt again to pass the same gt to
xe_gt_hw_engine in xe_hw_engine_lookup.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index cba4375525c7..07288a3db4ba 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -1073,7 +1073,6 @@ xe_hw_engine_lookup(struct xe_device *xe,
 	idx = array_index_nospec(eci.engine_class,
 				 ARRAY_SIZE(user_to_xe_engine_class));
 
-	return xe_gt_hw_engine(xe_device_get_gt(xe, eci.gt_id),
-			       user_to_xe_engine_class[idx],
+	return xe_gt_hw_engine(gt, user_to_xe_engine_class[idx],
 			       eci.engine_instance, true);
 }
-- 
2.43.0

