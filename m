Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F448C28B20
	for <intel-xe@archiver.kernel.org>; Fri, 28 Mar 2025 15:42:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25A6110EA50;
	Fri, 28 Mar 2025 15:42:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ldHw+jw9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A361510EA50
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Mar 2025 15:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743176562; x=1774712562;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oEBoWZSgebJl1Ej/q43GPkRV2LMoEJgK2A86NFSXj2E=;
 b=ldHw+jw98jFDh5Do+mvS2yIfbct+dDcKBqgjzigELdg2cO9kMVU0onAJ
 dbEYG7CatQYhK9uiD5djH48RYDi78sFw4MwWNxyKb+qEV7gf/hh/6WFJh
 h3dzws30YDtwlenjmb06NflfnW6vGaCt1G4J6sS4fxdKHaryqfRyA9MO0
 9nNCMx7s4P+5fb6DpA76weXV6O5vg6E+5lhmM+WqGOkXHHV4hrfI3vzDV
 Onqbo5/JfHuig8cFVnxW9y02yDKwbS7joPo+xgU9eES29d23aAEs5GOl6
 0DDxZDp9NMp6+1TviJHkwIT4Nr2fFasYt8DU3yozw85O/xw9skLZCdGc0 A==;
X-CSE-ConnectionGUID: /70aT1JLTKiBwcKkNIYVYQ==
X-CSE-MsgGUID: oxLAQJcMTnmOkoY20t+kXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="61937825"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="61937825"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 08:42:41 -0700
X-CSE-ConnectionGUID: OIgx6+aAQDWuQUP8vYrsfg==
X-CSE-MsgGUID: 2uA1MeWkTKmwRp65sBoNiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="130177394"
Received: from live-gta-imageloader.fm.intel.com (HELO
 DUT137ARLU.fm.intel.com) ([10.105.23.68])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 08:42:40 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: stuart.summers@intel.com, john.c.harrison@intel.com,
 intel-xe@lists.freedesktop.org, lucas.demarchi@intel.com
Subject: [PATCH] drm/xe: Don't print error about hwconfig when using execlists
Date: Fri, 28 Mar 2025 15:42:36 +0000
Message-Id: <20250328154236.9216-1-stuart.summers@intel.com>
X-Mailer: git-send-email 2.34.1
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

This error message is only applicable for platforms using
GuC submission - to warn the user if the GuC they are using
or the platform they are running doesn't have this information
to provide to userspace about the platform. When forcing
execlist submission, which is something only used for debug,
the user is running at their own risk and should understand
the limitations of running without GuC.

v2 (John/Lucas): Don't print an info message with execlists

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_mcr.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
index 605aad3554e7..d4d9730f0d2c 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
@@ -345,7 +345,8 @@ static unsigned int dss_per_group(struct xe_gt *gt)
 	 * Some older platforms don't have tables or don't have complete tables.
 	 * Newer platforms should always have the required info.
 	 */
-	if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 2000)
+	if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 2000 &&
+	    !gt_to_xe(gt)->info.force_execlist)
 		xe_gt_err(gt, "Slice/Subslice counts missing from hwconfig table; using typical fallback values\n");
 
 	if (gt_to_xe(gt)->info.platform == XE_PVC)
-- 
2.34.1

