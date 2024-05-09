Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98A80C25B74
	for <intel-xe@archiver.kernel.org>; Thu,  9 May 2024 04:11:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0400310E1C1;
	Thu,  9 May 2024 04:11:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IYqGRCDu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F18C10E1C1
 for <intel-xe@lists.freedesktop.org>; Thu,  9 May 2024 04:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715227891; x=1746763891;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=drVZllywv0Genkk3JlbMgl82wK9NGkbJsh5rA97zzfk=;
 b=IYqGRCDuPavI0URoo7o27LS3DdrB//mIhs5jg6eLXupubgRhcWtXjeZg
 Jv/Q8Z2ny9JXI/tgQbd1aqZ+DT2QvovU4V5DuwGkMgC0CumRJjxWsr+iF
 TJn6fSpoevRLwo/daahwqjCeysvul5DXIyO8Ce9YtRsC5rYpWPMMgf6rn
 qpU20Kj+rRWrNx93lFOXNWCNmSQZWRs+KpZ7H4PSKwadJowGs0OUeLCH+
 UoaQgJxVjSCUYDdWD8k1EZVFkQtgxso5u4TFbTd1CbGOq5TbsGluzKr2q
 CnNFm5V3d2NvFQuRsGLWu8Gc7Ea770FF/gp/4zqgXNvFx0V6NsLPGTTWw w==;
X-CSE-ConnectionGUID: CHZ5eHdlSvqF76qSlm1vKA==
X-CSE-MsgGUID: PWUMr4D9Se+SASVHe/xd5w==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="11249893"
X-IronPort-AV: E=Sophos;i="6.08,146,1712646000"; d="scan'208";a="11249893"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 21:11:29 -0700
X-CSE-ConnectionGUID: S13b4NA+TrWtsKtDhTr6jw==
X-CSE-MsgGUID: CFNT1qIGRIWjoXGhyr7Euw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,146,1712646000"; d="scan'208";a="33915532"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 21:11:29 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Zhanjun Dong <zhanjun.dong@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [CI 2/5] drm/xe: Drop useless forcewake get/put
Date: Wed,  8 May 2024 21:12:22 -0700
Message-ID: <20240509041225.610636-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240509041225.610636-1-lucas.demarchi@intel.com>
References: <20240509041225.610636-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Forcewake used to be needed in xe_gt_init_early() since it was calling
xe_gt_topology_init(). That call was dropped in commit 4c47049d93b7
("drm/xe/guc: Fix missing topology init"), but the forcewake calls were
left behind. Remove them.

Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Zhanjun Dong <zhanjun.dong@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 3b3418eb7bc4..05b77214f996 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -318,14 +318,6 @@ int xe_gt_init_early(struct xe_gt *gt)
 			return err;
 	}
 
-	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (err)
-		return err;
-
-	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
-	if (err)
-		return err;
-
 	xe_reg_sr_init(&gt->reg_sr, "GT", gt_to_xe(gt));
 
 	err = xe_wa_init(gt);
-- 
2.43.0

