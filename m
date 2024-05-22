Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E482BC25B77
	for <intel-xe@archiver.kernel.org>; Wed, 22 May 2024 10:22:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91C9210EE6B;
	Wed, 22 May 2024 10:22:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bEeTwP5s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE0E110EE6E
 for <intel-xe@lists.freedesktop.org>; Wed, 22 May 2024 10:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716373332; x=1747909332;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=p4+oJb/fGU2nn/DlWVbzdoCGsMzsWa4A0rLoNvJkNdM=;
 b=bEeTwP5s7GP7Dll201vUzL+e6uaXbGn+bpEo6INgbWjLqgBd4qlD7VJj
 88vqYCu8iPHpGa+18ZQZRyI82nBriETQzPjnuO0g+twd1Tn1R7Jz5UHNX
 idcwHNfgnkD5/qdP3qWlGja2dTSjnw5EQ5XeS9SyzuhMG8/vKpu804MfT
 oPfQXf1bG8zDusPNPgdG42LC7PGASUiuvFme8+oPqcj+SSVL1T7hdh+nE
 ijokGygkUqsBAEpkt566PQb/rldKzV1XigUGLNfb2gV+TAxONayBm9EFL
 g8NkJh5BsHNceouLamSBxVJ81kxaHzefu9dGAT7xxcdzYZHHkOiI/cLPd Q==;
X-CSE-ConnectionGUID: kA+5WcJaRxu8SIs2/WNnXQ==
X-CSE-MsgGUID: LDETmOO3Tjuk+Dk1mDk4qw==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="15562687"
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; d="scan'208";a="15562687"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 03:22:11 -0700
X-CSE-ConnectionGUID: c4QcWMzMSbqr1cjyDenoEg==
X-CSE-MsgGUID: yGdROWNhSXebu+kEGxLeIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; d="scan'208";a="38195267"
Received: from unknown (HELO mwauld-desk.intel.com) ([10.245.245.124])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 03:22:10 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v3 07/18] drm/xe/guc_pc: s/pc_fini/pc_fini_hw/
Date: Wed, 22 May 2024 11:21:50 +0100
Message-ID: <20240522102143.128069-25-matthew.auld@intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240522102143.128069-19-matthew.auld@intel.com>
References: <20240522102143.128069-19-matthew.auld@intel.com>
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

Make it clear that is about cleaning up the HW/FW side, and not software
state.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 4164dab1ab66..aabe241be42b 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -889,11 +889,11 @@ int xe_guc_pc_stop(struct xe_guc_pc *pc)
 }
 
 /**
- * xe_guc_pc_fini - Finalize GuC's Power Conservation component
+ * xe_guc_pc_fini_hw - Finalize GuC's Power Conservation component
  * @drm: DRM device
  * @arg: opaque pointer that should point to Xe_GuC_PC instance
  */
-static void xe_guc_pc_fini(void *arg)
+static void xe_guc_pc_fini_hw(void *arg)
 {
 	struct xe_guc_pc *pc = arg;
 	struct xe_device *xe = pc_to_xe(pc);
@@ -941,5 +941,5 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
 
 	pc->bo = bo;
 
-	return devm_add_action_or_reset(xe->drm.dev, xe_guc_pc_fini, pc);
+	return devm_add_action_or_reset(xe->drm.dev, xe_guc_pc_fini_hw, pc);
 }
-- 
2.45.1

