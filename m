Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC3F8C4345F
	for <intel-xe@archiver.kernel.org>; Mon, 29 Apr 2024 15:43:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 530E410E405;
	Mon, 29 Apr 2024 15:43:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jtSfFtuf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87DA710E405
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Apr 2024 15:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714405386; x=1745941386;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8cOe05u3RczbT8zZhsNXkuM/2iwoNUxHLnr8BZHuCdQ=;
 b=jtSfFtufr/HxqzVso2nQg+wO6bHR0j5t4WFNrDQp6ilZJ7uk5M3hBgC/
 CPbNG6btaiuwX5eL+zb4vuks24CKtJynuk/xojpDbhBmcl81jUOCPiHnR
 Sk+deEnkdnVgakzWyavyOX/iUkxljAU2GRdiek4EaNVmqolYbd92Wni/H
 SgHsWLNIrENdLDwtnYSWx/v33cEBqYCdpKFBAhEaSqpVxC8pEwBjHFR0K
 Gf9FtcXoTgP/acD9gp5fHRSpVixgb/OD2zp6InkkOYAz4JG2weOBkVURp
 ZNkFIynM6Uw2Q+R+Bt+WoDQc+R4lt/mnk0pnbgYsHh7kuN0dUAl6zD9kS Q==;
X-CSE-ConnectionGUID: n2OwZ42tTlCggev3M1Zp9A==
X-CSE-MsgGUID: 5k4UcPphQRuUjUKZxaZW6A==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="27523030"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="27523030"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 08:42:57 -0700
X-CSE-ConnectionGUID: qTtE9VO1QNWPddazR5aFfg==
X-CSE-MsgGUID: 9jgcCCkATmy2wsyik82Lbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="30836574"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 08:42:56 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>, Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe: Remove uninitialized end var from
 xe_gt_tlb_invalidation_range()
Date: Mon, 29 Apr 2024 17:28:21 +0200
Message-ID: <20240429152821.27490-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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

This fixes commit c4f18703629d ("drm/xe: Add
xe_gt_tlb_invalidation_range and convert PT layer to use this")
which added the end variable as part of the function param.

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index d0ee1e0df0bd..c3d015a7ac33 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -305,7 +305,7 @@ int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
 	} else {
 		u64 orig_start = start;
 		u64 length = end - start;
-		u64 align, end;
+		u64 align;
 
 		if (length < SZ_4K)
 			length = SZ_4K;
-- 
2.42.0

