Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D42CCCD199
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 22:57:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3126B10EABA;
	Thu, 16 Oct 2025 22:57:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gXcs807K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE93510EABA
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Oct 2025 22:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760655449; x=1792191449;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yaRBxecWYb7noq1TJ70Dq5YhFPTteGj1sQMUi74LHvc=;
 b=gXcs807KnSMmLbEj0KHFuPE83VmwM99oAcA3R7eoZLJYYU3thQOcHoma
 zIPXK06NFphUDmnMU/Qcd14u7Og3vOMteAneFUxhLoZ0aaojZG+Os2CYt
 RyzGoYWzmolcKIhs0t67qU2catP7IcYcDjpS3ojM0BTy6nfIyxcVCgd6v
 5AHLOjH42oqoKkf8rpURrECS7o6N9l2GuVhyxY4jrLTzRj0d2GFN9i0Pk
 mM1xJs0LCrT9f8YwSpOtwqyEIq8tUVZHperT9bVtwA6keQFcdjQJ5glpN
 I9JHMx/vR1RmDsSgRNrrvSjUirgLrAdgLMNcDoq7ipf0vbxYgy7ZPnd5t A==;
X-CSE-ConnectionGUID: gH70lma9RcKpdxQ2aNoOVw==
X-CSE-MsgGUID: iBjQkvuORrqkePkrzpb71Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="85480902"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="85480902"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 15:57:29 -0700
X-CSE-ConnectionGUID: GDZddmpmQmyphdBb0grAww==
X-CSE-MsgGUID: dpvZ60GcTb+WuSVYO3seqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="186972690"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by fmviesa005.fm.intel.com with ESMTP; 16 Oct 2025 15:57:29 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH] drm/xe: Fix stolen size check to allow equal WOPCM size
Date: Thu, 16 Oct 2025 22:55:07 +0000
Message-ID: <20251016225506.2256127-2-shuicheng.lin@intel.com>
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

On some platforms without dedicated stolen memory, the calculated
stolen size may be exactly equal to the WOPCM size. The current
assertion incorrectly requires it to be strictly greater, causing
a false failure. Relax the check to allow equality.

Fixes: 65369b8e2961 ("drm/xe: Change return type of detect_bar2_dgfx() from s64 to u64")
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6359
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
index e368b2a36bac..1bddecfb723a 100644
--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
@@ -106,7 +106,7 @@ static u64 detect_bar2_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
 
 	stolen_size = tile_size - mgr->stolen_base;
 
-	xe_assert(xe, stolen_size > wopcm_size);
+	xe_assert(xe, stolen_size >= wopcm_size);
 	stolen_size -= wopcm_size;
 
 	/* Verify usage fits in the actual resource available */
-- 
2.49.0

