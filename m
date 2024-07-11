Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD3D5C3DA4D
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jul 2024 09:19:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A14EC10E9D3;
	Thu, 11 Jul 2024 09:19:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Igp27LuF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 535F810E9D3
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jul 2024 09:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720689542; x=1752225542;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WbrWZGUH2oUVAjDqhgMn/l7gIP4yytZO/xHtO9tLIs4=;
 b=Igp27LuFY0RwrghCpV1GuSELjn1Dj3sh1n1hxLs1f+j6PyiQocjFK7Xq
 z24R+4zu/+2d2Wb29ecNHKxwrni0Hlq8Wxkj5iCl5NLjGEWn4+9uEYLny
 SGdDc7IE066JYkDZ/Pb/yGsmQSrJOv562Ar4SMfxAPbDkgYUUhuloAEBL
 F+kMdMdAam8OQoFTJ4gLG+Y/LBorO0ZH0ZDrQONW6pCXIFZ9nQPpUNzfq
 J0kM/9hcfCG9syNx9siaQObz73Tap1D/hxIwmubX0X6g3mTPtq6gw8ZBG
 tN4gWBfvM2vWcwaL0kvf6vZ+NtRZfUQ9qPtMxqv+4lVMPlVcVXr7XJioq w==;
X-CSE-ConnectionGUID: F6iQdq4WQTe9uhHe7A6DMw==
X-CSE-MsgGUID: XUZGlLXZSQ+fJl/TAyEHZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="17671961"
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; d="scan'208";a="17671961"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 02:18:37 -0700
X-CSE-ConnectionGUID: 9fa8w2AIQ8SIFzcp3d+x/Q==
X-CSE-MsgGUID: FsDT1Lj2TyGyQERXkrOCDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; d="scan'208";a="79210110"
Received: from dut1122bmgfrd.igk.intel.com ([10.211.178.41])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 02:18:35 -0700
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, matthew.auld@intel.com,
 himal.prasad.ghimiray@intel.com, lucas.demarchi@intel.com,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Subject: [PATCH 6/6] drm/xe/xe2: Do not run xe_bo_test for xe2+ dgfx
Date: Thu, 11 Jul 2024 09:18:19 +0000
Message-Id: <79f935e813ca24711a6af5f8db71e0a064ec06bf.1720689220.git.akshata.jahagirdar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720689220.git.akshata.jahagirdar@intel.com>
References: <cover.1720689220.git.akshata.jahagirdar@intel.com>
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
---
 drivers/gpu/drm/xe/tests/xe_bo.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
index 9f3c02826464..f7ef91b9a5d2 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -163,6 +163,12 @@ static int ccs_test_run_device(struct xe_device *xe)
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

