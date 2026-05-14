Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF188CD4F3D
	for <intel-xe@archiver.kernel.org>; Thu, 14 May 2026 21:45:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C4EA10E61A;
	Thu, 14 May 2026 21:45:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lo6YZpUn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E34C10E61A
 for <intel-xe@lists.freedesktop.org>; Thu, 14 May 2026 21:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778795119; x=1810331119;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=v+9VGxJ8N1NzjxJona9SB3ergey9cjdEsk52SI1KyDk=;
 b=Lo6YZpUnnjxr8kGLhPrhYiyfzNTwrBWw+6K5NT38uk+wRzELEqQy9OE3
 4vVqZgkGnJgkRchut22+/49q7EaM14xsECBwRcVRl2JhciFHTAYki2n/I
 fXREtOryUVqfkxRO1gr+5SXoAlkB0922f8GtEwPHzyfhLsFr8wViXLtW+
 W82R1tlPcN2GFNjT5ZcEfxgZXeTAY4oFakKqMCnaVin1xau5Bz4qsrxJ7
 61TUrKyqYgkeRBdL2JkglwCEn9UOS+AafC1QiVEBAdWBngMgm5PizswxG
 2sACUXQrPIQQTz/5iahsbgt2jyeglE7rUJHjBlLgPcie1ztu7VTXEZ6fW g==;
X-CSE-ConnectionGUID: nE4YPpQYRDCL4lzHeL02IA==
X-CSE-MsgGUID: KWfDJfTFSRW4iojtV1O/Lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="67277259"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; d="scan'208";a="67277259"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 14:45:19 -0700
X-CSE-ConnectionGUID: Raa0kCymRRGJtELBU1mm3A==
X-CSE-MsgGUID: gMFpkLfIQIWbmwqzvxkoXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; d="scan'208";a="238613213"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.189])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 14:45:18 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Thu, 14 May 2026 18:44:48 -0300
Subject: [PATCH v3 5/7] drm/xe/kunit: Use KUNIT_EXPECT_EQ() in xe_wa_gt()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-rtp-mcr-check-v3-5-30dd47855fee@intel.com>
References: <20260514-rtp-mcr-check-v3-0-30dd47855fee@intel.com>
In-Reply-To: <20260514-rtp-mcr-check-v3-0-30dd47855fee@intel.com>
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

