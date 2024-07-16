Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8B92C3DA59
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jul 2024 01:01:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7B5610E52C;
	Tue, 16 Jul 2024 01:01:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QqSrMW/l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1A6E10E4CE
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jul 2024 01:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721091692; x=1752627692;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Z0MixY46eVTLHJwmGWomjg6ImgqNlCs88etnZomoDJw=;
 b=QqSrMW/l6yngLiA0ubRAcaslyKre5u2NeUHQnOe50cynREyxe7o+esD6
 WXAq+coLu6KOJuDRpgtsDlqSBuHBugOnp4kplZPG9adMRuCnTOc3HCiS5
 Wxj89IVFS78w3H9yqAbyLAsFh52dXQQfae9arocIX1Rt1oS3KTEHXw5tx
 MOwZciLHJ8cfIoMEhybywsy+G2mMbtiCsBM59+8e856MdxtGFXDbHPO5e
 ir68LwL0ofjIfpoceaNWLyc6+0HAabsTC07JqvNj+WgWwudcjck1O+HML
 Ifmpm2K5ItdBYeb76hL7oIAgnBWGjJsOxHEm3ReJe4zv0JxBfcRcz3lWj w==;
X-CSE-ConnectionGUID: dfyF2YXXReG2WVzujbh3Tg==
X-CSE-MsgGUID: l7YEYZfkSzeHz46vBYHzkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="18618359"
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; d="scan'208";a="18618359"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2024 18:01:32 -0700
X-CSE-ConnectionGUID: H7q9m/aZSSum9+cCOQu4Gg==
X-CSE-MsgGUID: XuL+jcrhThW8spOTIUVfUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; d="scan'208";a="49874292"
Received: from dut1103bmgfrd.igk.intel.com ([10.211.177.128])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2024 18:01:30 -0700
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: akshatajahagirdar6@gmail.com,
 "Jahagirdar, Akshata" <akshata.jahagirdar@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v4 6/7] drm/xe/xe2: Do not run xe_bo_test for xe2+ dgfx
Date: Tue, 16 Jul 2024 01:01:10 +0000
Message-Id: <32c54be67c2a6ac6002a5922e2b66e29f33c20a8.1721091282.git.akshata.jahagirdar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721091282.git.akshata.jahagirdar@intel.com>
References: <cover.1721091282.git.akshata.jahagirdar@intel.com>
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

From: "Jahagirdar, Akshata" <akshata.jahagirdar@intel.com>

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

