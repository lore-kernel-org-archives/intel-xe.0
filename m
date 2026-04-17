Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B656F436BB
	for <intel-xe@archiver.kernel.org>; Fri, 17 Apr 2026 16:33:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07DCB10EA7E;
	Fri, 17 Apr 2026 16:33:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CzqxWg9a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A956210EA7E
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Apr 2026 16:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776443595; x=1807979595;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1RwF2G3OOknxDdLKit9yUQjuT9fCBwXN3Bd1Rqd280w=;
 b=CzqxWg9aael/VFr2njtjys5DpPQSPWWMd5VlZsUpjzG46duO8zEAy8l4
 RvEdrOKKnTnkiD/5vkFH6t61c7zB4XEbsrCBwuk51+efvI5Bta8AUZi/+
 pcK2EZWzI7kNBgHzyccF5xAIWZmL2a22vpfVXxUFoD2PzFnKzu6bPEL+x
 FhKW9gFmm/aaBZ9SV8RJd1vL5P7JptrKJ7ujVOG3MYno8m6W5bd3gP0BY
 44gWDTP/c0copRi2F7c/mBLpewbV6hvmRiJGjDK9QznhACzO5CspOL0dQ
 O8NCANbdozDzGqbjFS5t8BOPsorfZe/JBUIH4IDRHC/nEVXLYtcAcQP14 A==;
X-CSE-ConnectionGUID: q5Wc3cSFTxCU84m8PBSgUQ==
X-CSE-MsgGUID: +5MCLtJKShenRsRnynBI2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="87761511"
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; d="scan'208";a="87761511"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 09:33:15 -0700
X-CSE-ConnectionGUID: wldk1DEsSeiIY/S+krKpcQ==
X-CSE-MsgGUID: VXbsSrpNRi6Z+3q1pvPdxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; d="scan'208";a="230224829"
Received: from osgcshtiger.sh.intel.com ([10.239.81.49])
 by orviesa010.jf.intel.com with ESMTP; 17 Apr 2026 09:33:14 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH] drm/xe/gsc: Fix BO leak on error in
 query_compatibility_version()
Date: Fri, 17 Apr 2026 16:33:08 +0000
Message-Id: <20260417163308.3416147-1-shuicheng.lin@intel.com>
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

When xe_gsc_read_out_header() fails, query_compatibility_version()
returns directly instead of jumping to the out_bo label. This skips
the xe_bo_unpin_map_no_vm() call, leaving the BO pinned and mapped
with no remaining reference to free it.

Fix by using goto out_bo so the error path properly cleans up the BO,
consistent with the other error handling in the same function.

Fixes: 0881cbe04077 ("drm/xe/gsc: Query GSC compatibility version")
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_gsc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
index e5c234f3d795..0d13e357fb43 100644
--- a/drivers/gpu/drm/xe/xe_gsc.c
+++ b/drivers/gpu/drm/xe/xe_gsc.c
@@ -166,7 +166,7 @@ static int query_compatibility_version(struct xe_gsc *gsc)
 				     &rd_offset);
 	if (err) {
 		xe_gt_err(gt, "HuC: invalid GSC reply for version query (err=%d)\n", err);
-		return err;
+		goto out_bo;
 	}
 
 	compat->major = version_query_rd(xe, &bo->vmap, rd_offset, proj_major);
-- 
2.43.0

