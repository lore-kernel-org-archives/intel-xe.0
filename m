Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 252CCC531D0
	for <intel-xe@archiver.kernel.org>; Mon, 27 Jul 2026 17:27:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4773E10E4AD;
	Mon, 27 Jul 2026 17:27:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XCjyyBGl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF64210E491
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Jul 2026 17:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785173238; x=1816709238;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UA+OIShJDrLsFdhPyY8Ggc5dK36ExiI8xRntOTgME+E=;
 b=XCjyyBGl4SZVRIJjtaZXZzWjZZ1U3fRbC8UwB6R2/G8GYDTvPJsUnJn+
 I7EaKMV7OJkvgSuZ0gsEq/6KFzw177T0qiUwWbLRWIwnOZLof3WzKk7ww
 k7ccvllOSz+cyPLlk/aA+BGjM3wOWdl+Pr3ruYmHLt9+Ezkj5pxV3M8+t
 AI6UtYJBggWhd9pg6dWbVbCU2X9EZ4Hj7pruXEWgBKoMS4BB1PiPczNBZ
 JZgR82eOlaxEV3Vch7hYFgS8SuvRivb5PnnC2dm4IMzXuOObaYY3o95Ui
 oEqgoI220z+zGFSynjKzpOmR4STjU3y8Le2trQ55bRv0LDf8CJHgoKX0d g==;
X-CSE-ConnectionGUID: x/MvzobbS9eH+XNHEsnHTA==
X-CSE-MsgGUID: UgN2N9tyRim/D4vSrq2zNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="108542897"
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; d="scan'208";a="108542897"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2026 10:27:17 -0700
X-CSE-ConnectionGUID: fC/+FLWuQsqioOOEQNpLLQ==
X-CSE-MsgGUID: X/BG422sTqe9MjpsrpcA/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; d="scan'208";a="255159388"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2026 10:27:16 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v3 1/2] drm/xe/mcr: Take vcs1/vecs1 into account for first
 media slice
Date: Mon, 27 Jul 2026 10:27:11 -0700
Message-ID: <20260727172712.2877706-2-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260727172712.2877706-1-ashutosh.dixit@intel.com>
References: <20260727172712.2877706-1-ashutosh.dixit@intel.com>
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

vcs1 and vecs1 may also be present on the first media slice, so take
vcs1/vecs1 also into account when determining if the first media slice is
absent.

Bspec: 67103, 77977

Cc: Gustavo Sousa <gustavo.sousa@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
v2: Bug fix
v3: Fix for BMG (Matt Roper)
---
 drivers/gpu/drm/xe/xe_gt_mcr.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
index 9799ffadf85d2..8beb4006cd891 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
@@ -452,11 +452,15 @@ static void init_steering_dss(struct xe_gt *gt)
 
 static void init_steering_oaddrm(struct xe_gt *gt)
 {
+	u64 hwe_mask = XE_HW_ENGINE_VCS0 | XE_HW_ENGINE_VECS0;
+
+	if (MEDIA_VERx100(gt_to_xe(gt)) >= 3500)
+		hwe_mask |= XE_HW_ENGINE_VCS1 | XE_HW_ENGINE_VECS1;
 	/*
 	 * First instance is only terminated if the entire first media slice
-	 * is absent (i.e., no VCS0 or VECS0).
+	 * is absent (i.e., no engines in hwe_mask).
 	 */
-	if (gt->info.engine_mask & (XE_HW_ENGINE_VCS0 | XE_HW_ENGINE_VECS0))
+	if (gt->info.engine_mask & hwe_mask)
 		gt->steering[OADDRM].group_target = 0;
 	else
 		gt->steering[OADDRM].group_target = 1;
-- 
2.54.0

