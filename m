Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED81CD318AD
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 23:03:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E610010E58E;
	Tue, 13 Jan 2026 23:03:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J+I6IRA7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 001A410E567
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 23:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768345423; x=1799881423;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5lLfwtV4mACDJZD606kbVv4DgxGEY1VkXxXpe1ZhO2A=;
 b=J+I6IRA7BY4QQ62j4OzLxnqUc/S+RKTrd/TyMDOk5Ei1Kg/bUziRFmKn
 yKPVvcjCEytxamGoQ5BwSfykqMfnKKfjybMBO4pYW88W1+b8gCirCL3/0
 q/bLlvWZRInJW2MzZVTGTiCaF7XeXoyFvA9nguUnWNo57VVwxcMRIvav0
 qv8upCEr6ghi+3LYAyHnrodG0nE4XZalpb9MSESy2BuQGVQjqbpZe6xcN
 xljx+wv9wPmGK5WelW1jPAcVkrOE7Db3sS/21xT214ekMX/F2ZuVdv/pC
 04vXcDAtST5VrNUagNms7mx+saS6kZudZ9szDNBghpYzNdNz2O3ft6tG1 g==;
X-CSE-ConnectionGUID: H41cDphAR1KsEPPvvlWDSQ==
X-CSE-MsgGUID: eyF9qLcKTRyCupsCwBCl3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="92311174"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="92311174"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:42 -0800
X-CSE-ConnectionGUID: WRBML30wTV2sRvrxgQym4Q==
X-CSE-MsgGUID: IqBwp6soS2K/XNJwWUXKIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="204147458"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:39 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 68/79] drm/xe: Drop unused header in xe_ttm_vram_mgr.c
Date: Tue, 13 Jan 2026 15:04:13 -0800
Message-ID: <20260113230315.3081153-149-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260113230315.3081153-81-matthew.d.roper@intel.com>
References: <20260113230315.3081153-81-matthew.d.roper@intel.com>
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

xe_ttm_vram_mgr.c doesn't need anything from xe_gt.h.  Drop the
unnecessary include.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 9f70802fce92..6553a19f7cf2 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -12,7 +12,6 @@
 
 #include "xe_bo.h"
 #include "xe_device.h"
-#include "xe_gt.h"
 #include "xe_res_cursor.h"
 #include "xe_ttm_vram_mgr.h"
 #include "xe_vram_types.h"
-- 
2.52.0

