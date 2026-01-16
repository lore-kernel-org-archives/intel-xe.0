Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D0D3C98308
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jan 2026 22:12:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DACC510E272;
	Fri, 16 Jan 2026 22:12:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LhHHn65s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8799510E26A
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jan 2026 22:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768601571; x=1800137571;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=WYOtbITbo7LD+Cfkr3DNdXrhLjWwKwqiVgJwigyJp3s=;
 b=LhHHn65seI+MZTp1TFKy5qKkRkN2pV0zRw/OGlOyo3J3GXhRV1pXa1+R
 mW4bTZNpuGW8IUCcbSaoSO/8AH86/jkaNcc+FOgR3zwi0xVVJNXHlco0c
 3hJrXnhsJiJZyByBLFai19FlwMNGZyGJHLI+hi4jkt6ApHxV2+5HUR+JU
 hKhzmINOltmAzf2KKo6C3pnQxwZpd3qBenuaNlS/IfSuotPovD4q6Iu/F
 xdPn0v0EH7uBpOo6BXESFgja+BC1eP4IprXpyggGFueWN/PR11NMlCj/N
 m0mJ+PPL8JPsDq5vM57RKcwZjDEBff8q7mvh4hCU7KIpbTi1HXLjnv4PO w==;
X-CSE-ConnectionGUID: tIGlBNVuQD6CNh1fElaXdQ==
X-CSE-MsgGUID: XtmAeHrMSkKO5kUyYZtTrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="69123028"
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="69123028"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 14:12:50 -0800
X-CSE-ConnectionGUID: SiCjd/+yTom+s8xEJLJvEg==
X-CSE-MsgGUID: +DHA0XWkTlabtsKuZ1kjtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="204961808"
Received: from khuang2-desk.gar.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.59])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 14:12:50 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Fri, 16 Jan 2026 19:12:17 -0300
Subject: [PATCH 09/12] drm/xe/kunit: Use KUNIT_EXPECT_EQ() in xe_wa_gt()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-rtp-mcr-check-v1-9-d420b9c1a327@intel.com>
References: <20260116-rtp-mcr-check-v1-0-d420b9c1a327@intel.com>
In-Reply-To: <20260116-rtp-mcr-check-v1-0-d420b9c1a327@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
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
2.52.0

