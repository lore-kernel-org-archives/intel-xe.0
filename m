Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F569C25B79
	for <intel-xe@archiver.kernel.org>; Mon, 13 May 2024 21:37:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 102C610E9B4;
	Mon, 13 May 2024 21:37:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rz5CTqoD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D791610E775
 for <intel-xe@lists.freedesktop.org>; Mon, 13 May 2024 21:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715636235; x=1747172235;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=drVZllywv0Genkk3JlbMgl82wK9NGkbJsh5rA97zzfk=;
 b=Rz5CTqoDvBdurW5dID7/sdECSKfBBYypGdnVzpI4TE3uPu+RKs/QSUr7
 /Ry1aqrZ2JVVRfgU+PkYINhBFrCoD9t2d/+tstaP80tpPS3zW2zUz+TWc
 yBEDr3dnrhIlf4xeIq+9z6h2V2fFv/aIoFmvcVV6G+tIG3vVaGJaZCD9Q
 C8UShSyrj+nEIiK5782GjpiooBGRaPCNfRm9v16YmLY4hHrDgHX+HMjca
 AR0cU0Vq0cnNPRY2RL5Erv9fCo8jalDunDu+Fjosv7euIvXgXffWRbHrM
 cTE7CFO+GqFBetg52sDA2t0CRQB7G4rl5NqAWt1Mt0N6mM/6FM+I8NT4w w==;
X-CSE-ConnectionGUID: PUh6AKRVToOpjVycwFsnFw==
X-CSE-MsgGUID: NmxhE7FWQ0miOyFk0dFiYg==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="11505916"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="11505916"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 14:37:06 -0700
X-CSE-ConnectionGUID: x0wRWvS1R9WqVo1i3iZpyg==
X-CSE-MsgGUID: SG8gbsLDS+6+OooiQ59QDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="35348587"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 14:37:05 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [CI 2/5] drm/xe: Drop useless forcewake get/put
Date: Mon, 13 May 2024 14:37:48 -0700
Message-ID: <20240513213751.1017791-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240513213751.1017791-1-lucas.demarchi@intel.com>
References: <20240513213751.1017791-1-lucas.demarchi@intel.com>
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

