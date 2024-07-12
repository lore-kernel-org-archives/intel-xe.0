Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59173C3DA4E
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jul 2024 06:39:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E41610EC0B;
	Fri, 12 Jul 2024 06:39:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NU4g6RWb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9864F10EC0E
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jul 2024 06:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720766382; x=1752302382;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uHcHY4CkvMR9q5KNAkGOlfpCNs58s+B0vOp8gqy+v6I=;
 b=NU4g6RWbmQgXPZfmgNEjkYZgvm/oZMvozPTaYL3rWyFfLEyb2xPZkKld
 tDETW6A75/ffdqapp7FGiaRX0PFT5wN9WO20WfeOq5wF+0pFEgx/8OCbv
 nL2K5qIKNvbwwKOgumy5pdMt/8ccYmjWmjfkTcydGe/VJ/Pydf/H6CjZa
 5zXjGzqpOUYcc6oqhEfM7kmOdFDbaXjGAay+z+4Dddr1aMSAF77sW7oS9
 EdqosMvokuRRIj8oqszc0N240qta1J70y4MeXTyWCERiYhXzzRizRuVp9
 2LDOKKp5bIFtt2u28cTYiZDseRy4s47yBLxJZauxYXSxCkq2AQG1zWaJ1 w==;
X-CSE-ConnectionGUID: 5H2MPjTWQ7GgB9tWkqHA0g==
X-CSE-MsgGUID: elqWDiIbTTGMam1Ptni05w==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="35623938"
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; d="scan'208";a="35623938"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 23:39:42 -0700
X-CSE-ConnectionGUID: rQdM1XDZQ/uN+JVR/p68tA==
X-CSE-MsgGUID: r8EmGCOuRLqpxw6eFMbh1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; d="scan'208";a="49472866"
Received: from dut1103bmgfrd.igk.intel.com ([10.211.177.128])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 23:39:41 -0700
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: akshatajahagirdar6@gmail.com,
 "Jahagirdar, Akshata" <akshata.jahagirdar@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH 6/6] drm/xe/xe2: Do not run xe_bo_test for xe2+ dgfx
Date: Fri, 12 Jul 2024 06:39:25 +0000
Message-Id: <d48a3cc31f0eb55bd0707ea960c5f390ee4eff21.1720766122.git.akshata.jahagirdar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720766122.git.akshata.jahagirdar@intel.com>
References: <cover.1720766122.git.akshata.jahagirdar@intel.com>
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

