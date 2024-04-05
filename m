Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55AB7CD1299
	for <intel-xe@archiver.kernel.org>; Fri,  5 Apr 2024 13:39:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD51D10E50D;
	Fri,  5 Apr 2024 13:39:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="huj/DFSv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E6E8113388
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Apr 2024 13:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712324386; x=1743860386;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=yW2tzQXpoqQgstYQy1YGQCT5I1kBT9kgfSgbm248bDE=;
 b=huj/DFSvVal/O9ryS8bMhGeDYW+kmcjHxicMWbcoGc2wNc5c+3KGc0n9
 rea/p5dadQe+12/UxLXye+Vnd5KGTcW3lzr4Rhx4eCB5lGiMK+UPVd+dz
 CPeyAMdTDLGnBYOzJK/f/CdeCAUYoKG0WGc8dl7J4YcD3FZvAXuT+cqOC
 gE9nCnrYrlGlPqCsnQTvp9NuA77NqcXEI85S1w+1vd4XoDea/AWF/Wa8C
 pjXFyygZ0bQVFYzc6fZlTVN/HXLnE7URMsikwqDEuGDcj4iDti3U9JU5u
 HzyBkmQWfxLezshhEaXTZW7Ab2JpQmTTMB6B5ezdQW/922WVsOilGwi5q Q==;
X-CSE-ConnectionGUID: 9XjvjyGHRNOG1LPWTtU+zQ==
X-CSE-MsgGUID: yHECSJzJT4OSaSLcWJOzCg==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="7838168"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="7838168"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 06:39:46 -0700
X-CSE-ConnectionGUID: /uyaTdzcSzGIR13M/yFTaQ==
X-CSE-MsgGUID: SXSLjgvAQLOwg5jwEYT1cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; d="scan'208";a="19239414"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.143.198])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 06:39:45 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/3] drm/xe/vf: Don't try to program MOCS if VF
Date: Fri,  5 Apr 2024 15:39:35 +0200
Message-Id: <20240405133936.891-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240405133936.891-1-michal.wajdeczko@intel.com>
References: <20240405133936.891-1-michal.wajdeczko@intel.com>
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

VFs drivers don't have access to MOCS registers. It is a PF driver
responsibility to program MOCS according to the HW team guidelines.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_mocs.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
index bff659d20062..d16fa64da881 100644
--- a/drivers/gpu/drm/xe/xe_mocs.c
+++ b/drivers/gpu/drm/xe/xe_mocs.c
@@ -568,6 +568,9 @@ void xe_mocs_init(struct xe_gt *gt)
 	flags = get_mocs_settings(gt_to_xe(gt), &table);
 	mocs_dbg(gt, "flag:0x%x\n", flags);
 
+	if (IS_SRIOV_VF(gt_to_xe(gt)))
+		return;
+
 	if (flags & HAS_GLOBAL_MOCS)
 		__init_mocs_table(gt, &table);
 	if (flags & HAS_LNCF_MOCS)
-- 
2.43.0

