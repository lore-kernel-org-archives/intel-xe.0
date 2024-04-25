Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D033C4345F
	for <intel-xe@archiver.kernel.org>; Thu, 25 Apr 2024 18:23:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C46F4112117;
	Thu, 25 Apr 2024 18:23:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W/C3yc1Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6585611A76C
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Apr 2024 18:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714069429; x=1745605429;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1pt9FJA7xT7Ru6hE42zH5rT6Ia0gNXxWUszKIQ7w7ac=;
 b=W/C3yc1YSR4z2Q8Ht3NYki1vkKqZ1CKlZyfaxE65b38b4PUvufUHySET
 OYa3MTthtUHfQLjV7i2v9zgrZ889tJGFUMBt+2JbPC3WiDkVll3qKnT3u
 ZEt/K20OirdiLRU/toXMknSOhAf71OVwIz4V0VijIli0bgE6O5M0KiOE8
 y+UumdtG6eXO7tXp+50btS/GhsnBOp3qDS92GaBHO4+rOvmX/qN6t+4X8
 bvFJDNyQUK4JflU119IU86XsOikv6mhsEpnXY7oNJbOPaF2Yit8Bso13p
 H6qu25SWnzHHOyD5RgwAbaxj/Udh8nXqjqcIl+J9fj5T6vBtjMjj/yz7O w==;
X-CSE-ConnectionGUID: n6QlyplURpObyAt5w8sLwg==
X-CSE-MsgGUID: BCxx6TetS12QV7hIQqTzIA==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="9605755"
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="9605755"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 11:23:49 -0700
X-CSE-ConnectionGUID: aXscaHUVQSam7CU2Fx6QLA==
X-CSE-MsgGUID: 8IRbVOVEQ/mPdKFSlj27Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; d="scan'208";a="25157821"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 11:23:48 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: vinay.belgaumkar@intel.com, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 michal.winiarski@intel.com, matthew.brost@intel.com,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH 2/5] drm/xe: Drop useless forcewake get/put
Date: Thu, 25 Apr 2024 11:24:07 -0700
Message-ID: <20240425182410.2705061-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240425182410.2705061-1-lucas.demarchi@intel.com>
References: <20240425182410.2705061-1-lucas.demarchi@intel.com>
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

Forcewake used to be needed in xe_gt_init_early() since it was calling
xe_gt_topology_init(). That call was dropped in commit 4c47049d93b7
("drm/xe/guc: Fix missing topology init"), but the forcewake calls were
left behind. Remove them.

Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 00a22cf2f5b5..805fd0acfc03 100644
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

