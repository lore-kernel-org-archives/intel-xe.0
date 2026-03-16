Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63576F53D6F
	for <intel-xe@archiver.kernel.org>; Mon, 16 Mar 2026 16:20:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2467510E025;
	Mon, 16 Mar 2026 16:20:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZrkdnCtD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D19DC10E025
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Mar 2026 16:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773678006; x=1805214006;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=avg+tNjlqOQrUMK/RyWTtsMF0CLDgVj/mcRUgQDrVe8=;
 b=ZrkdnCtDmvJl79ouPWI9tDZwmP6MGLRuGdmMQSmbK6fOkGjM0JkHmcZU
 azvCFwKRmUjtITNm0tTpUAGeQIBZxy6PmxqZoTRFYTbPn0IJChTj2Q9q4
 6jRR0KSM3S3AbscDxla2NceqretEFgJcUzWT4IU06YPVC6FhbsnxpL2o7
 THsyARmpY77T2ffq8tVW5l6NqGZRwuUu2pW9Wy0R/r0YU5IWuo5VpW1Ix
 vpLVdWm1pGFipPpW+JLf4uufDc5sGpdQYP6uwoS1wTaodHJpoccTyNvf7
 M/ywmQusPfzfCk2aqC0CgjMz9M3TBw1mqLbTr0G363GRYvTVAM4LQkhAm w==;
X-CSE-ConnectionGUID: rRMjVxwPS6maV4FtMl1VQw==
X-CSE-MsgGUID: s6Zp3ycEQga3jGSsGCmpFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="85328234"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="85328234"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 09:20:04 -0700
X-CSE-ConnectionGUID: tuR3gw4UQcuWxZHj853VoQ==
X-CSE-MsgGUID: r6j/J2TXR6ObRGpoVT7OUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="221004191"
Received: from dut4086lnl.fm.intel.com ([10.105.10.52])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 09:20:04 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 thomas.hellstrom@linux.intel.com
Subject: [PATCH] drm/xe/tlb: Init range tilemask err to zero
Date: Mon, 16 Mar 2026 16:20:04 +0000
Message-ID: <20260316162003.64643-2-jonathan.cavitt@intel.com>
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

Initialize err = 0 in xe_tlb_inval_range_tilemask_submit to prevent a
possible uninitialized value return in the case where the tile_mask
somehow doesn't match any available tile ids.

This targets a static analysis issue.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_tlb_inval.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c b/drivers/gpu/drm/xe/xe_tlb_inval.c
index 10dcd4abb00f..bbd21d393062 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
@@ -529,7 +529,7 @@ int xe_tlb_inval_range_tilemask_submit(struct xe_device *xe, u32 asid,
 	struct xe_tile *tile;
 	u32 fence_id = 0;
 	u8 id;
-	int err;
+	int err = 0;
 
 	batch->num_fences = 0;
 	if (!tile_mask)
-- 
2.43.0

