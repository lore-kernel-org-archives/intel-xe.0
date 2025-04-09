Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBE3DC36002
	for <intel-xe@archiver.kernel.org>; Wed,  9 Apr 2025 06:20:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76E2310E7E1;
	Wed,  9 Apr 2025 06:20:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VMIohLve";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4809210E7E1
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Apr 2025 06:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744179653; x=1775715653;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HS0vkMOI/KD92eGOZf/R4h7bLWkx++iGIWcbCjVJjoE=;
 b=VMIohLve5YKVNz+qqYS/COPgXJQ1FuYWqkzna4EN9WTBf2bjsco5k6ov
 GJMJ4kyqJ6oDziss6VqBvSJihBzkM3sf7Vx77B26ya/RrJHf1Po6/IMeE
 kzRunDmg8lV90tvhq1y/uk1ZE7x5QIFNfSSOpIKA3fe5cl4EFU+im3oqz
 xsfCYxCmNTwpxfSPtnaCTdoam9d+tK4zAm2sYDbZZnjJNuKLS3yZNNTqk
 ls0sawuO8mIMljbEue2ZUGE5ubF/gMN7A3xnAGK785T01RHmod4ESxteB
 UQ/6ZbA3qYYX8mwMF5TtbnT1cOionDS5FjQzjJG/Rqfl5Ben9yQ2nCuvJ A==;
X-CSE-ConnectionGUID: aDmOChGURymR/qEb0UPVrQ==
X-CSE-MsgGUID: 6GPuxRFlTtaU2HcbdkpEqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="44779991"
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; d="scan'208";a="44779991"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 23:20:52 -0700
X-CSE-ConnectionGUID: 5EcLAYJBRbG9pgPIWKi8kw==
X-CSE-MsgGUID: YRSo68pjQnSOt1P5DtODQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; d="scan'208";a="128402375"
Received: from unknown (HELO tejasupa-desk..) ([10.190.239.37])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 23:20:51 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, rodrigo.vivi@intel.com,
 ruthuvikas.ravikumar@intel.com, Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH] drm/xe/tests/mocs: Hold XE_FORCEWAKE_ALL for LNCF regs
Date: Wed,  9 Apr 2025 11:58:36 +0530
Message-Id: <20250409062836.13609-1-tejas.upadhyay@intel.com>
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

LNCF registers report wrong values when XE_FORCEWAKE_GT
only is held. Holding XE_FORCEWAKE_ALL ensures correct
operations on LNCF regs.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1999
Fixes: a6a4ea6d7d37 ("drm/xe: Add mocs kunit")
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_mocs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_mocs.c b/drivers/gpu/drm/xe/tests/xe_mocs.c
index ef1e5256c56a..cce7ebf5df72 100644
--- a/drivers/gpu/drm/xe/tests/xe_mocs.c
+++ b/drivers/gpu/drm/xe/tests/xe_mocs.c
@@ -46,7 +46,7 @@ static void read_l3cc_table(struct xe_gt *gt,
 	unsigned int fw_ref, i;
 	u32 reg_val;
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	KUNIT_ASSERT_NE_MSG(test, fw_ref, 0, "Forcewake Failed.\n");
 
 	for (i = 0; i < info->num_mocs_regs; i++) {
-- 
2.34.1

