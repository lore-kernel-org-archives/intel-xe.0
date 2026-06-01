Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00B0ECD6E55
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jun 2026 10:35:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EBFE113194;
	Mon,  1 Jun 2026 10:35:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A0Q3onRG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3BEF113194;
 Mon,  1 Jun 2026 10:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780310135; x=1811846135;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o3QQR/eEHFxVr2O6mxyhIDoMzeO2Q11hzh+GlyOp1iQ=;
 b=A0Q3onRGPeM4MBrERnDhqBw/oiIklMQ8KeSQhAs4bTMfFW6XNXlJY4GV
 d6GqK6VS2cLH9f5hpuX+NANXnCChC2qomm/CA4Eq32Hspn0IRFBncN+wl
 aeqmPuOMMkM5fMzA1uNLJ5yCQNVy+ahuxu9ZrliPFUsOJy5T2MAhs/G2J
 TsjbRAWx5/KrnQ2nmZ1zdlLp/uI43GSXk6EaBK1gnIbvoaIQxj0bYlqxx
 IgfOPaCK2KKNwM/ON7VB59/C+AdolUhDTRy+qlUT9YTw8mCPnDWKneh3q
 4um3ph3AZrMLzjWPA2XreYOAjkG4ju8DVGfq7wUUkf6wufPaF4tqsOmvl Q==;
X-CSE-ConnectionGUID: FTZ2KfkdStmY7i0Xzb+2Ng==
X-CSE-MsgGUID: 3LRp/BOORVuZvP1Xn8uUDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="80797263"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="80797263"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 03:35:35 -0700
X-CSE-ConnectionGUID: zqFTIZ2ISkGd6LhA4fm0BA==
X-CSE-MsgGUID: 8GISFYiYSjanrNiIPnHYQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="242728591"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.121])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 03:35:33 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: imre.deak@intel.com, ville.syrjala@linux.intel.com, jani.nikula@intel.com
Subject: [CI 5/5] drm/xe/display: drop duplicate intel_dp_mst_suspend() call
Date: Mon,  1 Jun 2026 13:35:00 +0300
Message-ID: <515ff69eb3ac08e2a0650a4acf72446c344121f9.1780310011.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780310011.git.jani.nikula@intel.com>
References: <cover.1780310011.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

intel_display_driver_suspend() already calls
intel_dp_mst_suspend(). Remove the duplicate call.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index 6e82dc70ca89..8d55e7a37d6d 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -342,7 +342,6 @@ void xe_display_pm_shutdown(struct xe_device *xe)
 		intel_display_driver_suspend(display);
 	}
 
-	intel_dp_mst_suspend(display);
 	intel_encoder_block_all_hpds(display);
 	intel_hpd_cancel_work(display);
 
-- 
2.47.3

