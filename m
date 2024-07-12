Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22F42C2BD09
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jul 2024 07:24:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E262B10EC32;
	Fri, 12 Jul 2024 07:24:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SzfHm+O7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D23E10EC33
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jul 2024 07:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720769088; x=1752305088;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jyfkalBMTN39LPM0nUHy/z8ec0iPMf2KQZO54a0XT84=;
 b=SzfHm+O7S+AZjR9FLkN5iOAKiRt0Bd8ITTu6OCNbD3ZBHfJicTq9kPco
 4gLNpt9p8fW9tZtMJph0fkgHso1nbYhq8glyyFNm8UYnX0d5GIvVXUo2T
 Ce7F/pwU2gYyi1r68KWiyEV84Vn8enwNxejPdlFB1nEdwzb8QuJRhYUfl
 uFAl5AjGH+8H9mjYg0ZNmrttBJIO2vWFBv8zjhd+74B5g3QJ+/YGSs//4
 JivE1S2XH9J/H46fYwlg2XxTpqfWC47mChjzsAKJhzM66lvOXjggUdXZb
 aCRdo7jds+0N1LEkuJGEPLR0GRhlEUh2g0V+PX9Y82jw1eOxinD08G9zQ A==;
X-CSE-ConnectionGUID: KUnltYXOSyGO3Lyu+JCcfw==
X-CSE-MsgGUID: Ikh431tXQTmpHz2wXjF1Aw==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="28788144"
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; d="scan'208";a="28788144"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2024 00:24:48 -0700
X-CSE-ConnectionGUID: xR9+rlHLQ4m/LBsj4M+slw==
X-CSE-MsgGUID: 1NejGTljRhiQ57Zo85gIDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; d="scan'208";a="79527404"
Received: from dut1103bmgfrd.igk.intel.com ([10.211.177.128])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2024 00:24:45 -0700
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: akshatajahagirdar6@gmail.com,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH 6/6] drm/xe/xe2: Do not run xe_bo_test for xe2+ dgfx
Date: Fri, 12 Jul 2024 07:24:29 +0000
Message-Id: <7a773f0661347ec79b3124b138209424749af4ce.1720768378.git.akshata.jahagirdar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720768378.git.akshata.jahagirdar@intel.com>
References: <cover.1720768378.git.akshata.jahagirdar@intel.com>
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

