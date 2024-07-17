Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A97A4C3DA5D
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 21:10:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E92C10E444;
	Wed, 17 Jul 2024 21:10:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UPGhrhxr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CD9610E444
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 21:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721250626; x=1752786626;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/iw/8P1zrApqeGbCeZyB1nLKxd4owRv50/2HvyqnhwA=;
 b=UPGhrhxrgJpUnjxez0Z9hxv/RKHoUH4YRw2OI2qafsFPrQJQnTEmP53B
 Zv7rxf0BU9zvkJZY3TirxoA6D/3Qd31bH13eiY6sdrf3SkPC0+IHltSB9
 KAZR26f7pOUpvzndhf+QMDMab98Gmtht0MUgOJm3899R0dH8RhO0B/DDY
 oHBo8vAMnn8lfgfwEF1c69xJX6hcOE/awERHGCu9xY15046MGQf/0/XEe
 GnW9zkcX0jEmdRyd/mX6ch7G/UnbxWQ7TyMma+zxJXyQRyBtc+vZK1B4v
 1VafOdHVrlYw61srWBr5T6jPJY2Rt9lK7WZFaeFrCQ3Hy3h3S3FnhaUi/ A==;
X-CSE-ConnectionGUID: LU2FpUecRQeCVkZBOGMa3Q==
X-CSE-MsgGUID: MsrBkHCnT66jG1z1whvX5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="12596219"
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="12596219"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 14:10:26 -0700
X-CSE-ConnectionGUID: RzpybjP8RuqfGrcQGu2+nQ==
X-CSE-MsgGUID: ka20RWvFTyWRM6UJnyATmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="50252677"
Received: from dut1122bmgfrd.igk.intel.com ([10.211.178.41])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 14:10:25 -0700
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: akshatajahagirdar6@gmail.com,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v7 7/7] drm/xe/xe2: Do not run xe_bo_test for xe2+ dgfx
Date: Wed, 17 Jul 2024 21:10:08 +0000
Message-Id: <57d9df82ad02e53c9b0d2a7d40bb27acce57b927.1721250309.git.akshata.jahagirdar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721250309.git.akshata.jahagirdar@intel.com>
References: <cover.1721250309.git.akshata.jahagirdar@intel.com>
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

In xe2+ dgfx, we don't need to handle the copying of ccs
metadata during migration. This test validates the ccs data post
clear and copy during evict/restore operation. Thus, we can skip
this test on xe2+ dgfx.

Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_bo.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
index 692e1b46b9cf..e2e0ea24757a 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -162,6 +162,12 @@ static int ccs_test_run_device(struct xe_device *xe)
 		return 0;
 	}
 
+	/* For xe2+ dgfx, we don't handle ccs metadata */
+	if (GRAPHICS_VER(xe) >= 20 && IS_DGFX(xe)) {
+		kunit_info(test, "Skipping on xe2+ dgfx device.\n");
+		return 0;
+	}
+
 	xe_pm_runtime_get(xe);
 
 	for_each_tile(tile, xe, id) {
-- 
2.34.1

