Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66087CD342F
	for <intel-xe@archiver.kernel.org>; Fri,  8 May 2026 21:42:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 285B410F60C;
	Fri,  8 May 2026 21:42:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LyEeRBvG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 036FC10F60C
 for <intel-xe@lists.freedesktop.org>; Fri,  8 May 2026 21:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778276578; x=1809812578;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=v+9VGxJ8N1NzjxJona9SB3ergey9cjdEsk52SI1KyDk=;
 b=LyEeRBvG+YYFILmJT24BUi7lFs4g5rEtZJFdmlqEXeq3Y0a2NjbLxn4w
 g/+jHRA+OcTUgYT0RIFlrktUEuJ/XfUePW7/1tQFBx+xsyqYoubMJDfhL
 TVAK4So8Uh0hEtUFbkXairrcvDwAjNkpubjOd8shO0yczTOLxNcyg3swN
 umQYRXclmRH2g6ktNMyviqQynsYao+nQYHRAD2xIeJYigIpFMsmxf4Wev
 BlIfim2aKu6O/XzrIUJ9xhRNd1m5u95ztq2zHQ9LED29wZFTPRAeUqEXN
 oC70QgGe3ck+nV+rsVgsXqM7gsXDGp08uWq121kbP1LDbvZyVMtUh9j9f Q==;
X-CSE-ConnectionGUID: n7w1o7TeSYGofifLLI1r4w==
X-CSE-MsgGUID: A8yvgSJoSRq+CAkTT4iUwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="90635995"
X-IronPort-AV: E=Sophos;i="6.23,224,1770624000"; d="scan'208";a="90635995"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2026 14:42:58 -0700
X-CSE-ConnectionGUID: 3RUTHxGKTwSYjKkWtR2Krg==
X-CSE-MsgGUID: YiNIy9JyQ9K0RfNiuDzyqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,224,1770624000"; d="scan'208";a="267244252"
Received: from jjgreens-desk20.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.220.81])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2026 14:42:56 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Fri, 08 May 2026 18:42:36 -0300
Subject: [PATCH v2 6/8] drm/xe/kunit: Use KUNIT_EXPECT_EQ() in xe_wa_gt()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-rtp-mcr-check-v2-6-9897b147a5d2@intel.com>
References: <20260508-rtp-mcr-check-v2-0-9897b147a5d2@intel.com>
In-Reply-To: <20260508-rtp-mcr-check-v2-0-9897b147a5d2@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Michal Wajdeczko <michal.wajdeczko@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.15-dev
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

Use KUNIT_EXPECT_EQ() in xe_wa_gt() as reg_sr errors in one GT do not
impact the next GT in the test.

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_wa_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_wa_test.c b/drivers/gpu/drm/xe/tests/xe_wa_test.c
index 49d191043dfa..2bf6fab015cd 100644
--- a/drivers/gpu/drm/xe/tests/xe_wa_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_wa_test.c
@@ -55,7 +55,7 @@ static void xe_wa_gt(struct kunit *test)
 		xe_wa_process_gt(gt);
 		xe_tuning_process_gt(gt);
 
-		KUNIT_ASSERT_EQ(test, gt->reg_sr.errors, 0);
+		KUNIT_EXPECT_EQ(test, gt->reg_sr.errors, 0);
 	}
 }
 

-- 
2.53.0

