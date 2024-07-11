Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D56FAC3DA4A
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jul 2024 09:20:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A670110E9E3;
	Thu, 11 Jul 2024 09:20:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JmbFQb6h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A719A10E9DE
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jul 2024 09:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720689615; x=1752225615;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WbrWZGUH2oUVAjDqhgMn/l7gIP4yytZO/xHtO9tLIs4=;
 b=JmbFQb6hsz8qszF8ev2tKMzc3bxxgNQk4bG1JoDReTqGblzL+n60yMIa
 Reo4d23gZI4t/BD87Oe5SfKFSDayyM5HkTZ8Ptq5Nmj+nCnFjgMbaNCqJ
 MmxyPqEAbuL+jagabYq/tX6gV5MXmPPhXfGiclOHnDA8OSBH3Nv9Sozyy
 qp9C9dCUYJJ0fELGr+xS232BFWgeDmcWZbStncSxV9msJdywPWKifeBw3
 gO8x9RJzO8S3TrTe8HRGdEo2PJXDBZnAeGV9ZAsgdhmPHU/wznO9/Y+MN
 U5DFZ+yuBwH1axaB67zmy6fHUb0Pn1GMUu4aAzIP5X0U2Cp7WsQi4ojPU A==;
X-CSE-ConnectionGUID: JRFbD4WyQzWQd8k4xkp9cw==
X-CSE-MsgGUID: Ym08o6FKTr6pRLKtaOP7CA==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="12495928"
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; d="scan'208";a="12495928"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 02:20:15 -0700
X-CSE-ConnectionGUID: qsPCe60VTIysraICIMJofA==
X-CSE-MsgGUID: eds0tl2rSASFuhVvW0vGug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; d="scan'208";a="48470897"
Received: from dut1122bmgfrd.igk.intel.com ([10.211.178.41])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 02:20:14 -0700
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: akshatajahagirdar6@gmail.com,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Subject: [PATCH 6/6] drm/xe/xe2: Do not run xe_bo_test for xe2+ dgfx
Date: Thu, 11 Jul 2024 09:20:02 +0000
Message-ID: <79f935e813ca24711a6af5f8db71e0a064ec06bf.1720689220.git.akshata.jahagirdar@intel.com>
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
Message-ID: <20240711092002.pwVai_ocG0j93pUZI9tIbVeD7k7wMmLGsBtpOhHaG8E@z>

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

