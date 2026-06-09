Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58853CD98C8
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jun 2026 20:17:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 060A310E651;
	Tue,  9 Jun 2026 20:17:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ysl2QpTO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D701510E64E
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jun 2026 20:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781036273; x=1812572273;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=QzQHWRKBITsFuKMHvipanWGHMOpdzOobBdaKBHEQfUQ=;
 b=Ysl2QpTOxagnjkpNHgnhJnV3sqEU2pbu6pST6pm1T4ZGPHtzJKXA1v8l
 lQRTya58cMl4VquK6jt5OhiTav1pnBVUnLYFfuwWoAsXO0AzAOJeuQEM4
 yjdMfH/aN6Fpe241RTIA8KckuVwPGyo4Bejm5znebF1RDAJb/3zAnrG+0
 dtTwIFmZUqTRVAHIOwgnPvQ9gsQdxMYncAYceQZGNJI2B6kPFYVOoj1+d
 /o1GplE2h99qDSVKeF9Y7lebeWXFka7hQjsJ9rZfdnLl4dOBI+GDaO/4Y
 CivAvA1fZQx9r+jOhc0p4z4l9nMkg7Ru+GSbtpyQ+wUDw7CAMwVjOhNqp g==;
X-CSE-ConnectionGUID: Zl2U1U0hReSt4XnVOoHrxA==
X-CSE-MsgGUID: Yq0Wjz1XSC2Y4YZEMZl9cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="84383307"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="84383307"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 13:17:53 -0700
X-CSE-ConnectionGUID: 3xG0mtArRzm2wl+DS3/2vQ==
X-CSE-MsgGUID: UWWNNmR5TsKSp8X0G6Bb0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="284027551"
Received: from hanvin-mobl3.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.223.198])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 13:17:54 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Tue, 09 Jun 2026 17:17:38 -0300
Subject: [PATCH 6/9] drm/xe/tests: Set non-GMDID graphics step in
 xe_pci_fake_device_init()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-xe-probe-info-v1-6-21e83e188e60@intel.com>
References: <20260609-xe-probe-info-v1-0-21e83e188e60@intel.com>
In-Reply-To: <20260609-xe-probe-info-v1-0-21e83e188e60@intel.com>
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

Currently the logic to set the graphics step for non-GMDID-based
platforms in kunit testing is defined in xe_wa_test_init().  That
logic should rather belong to the helper xe_pci_fake_device_init(), so
move it there.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_pci.c     | 3 +++
 drivers/gpu/drm/xe/tests/xe_wa_test.c | 3 ---
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
index 1baf3cd0d381..a665d5dbc472 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci.c
+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
@@ -388,6 +388,9 @@ int xe_pci_fake_device_init(struct xe_device *xe)
 	xe_info_init_early(xe, desc, subplatform_desc, &probed_info);
 	xe_info_init(xe, desc, &probed_info);
 
+	if (data && !data->graphics_verx100)
+		xe->info.step = data->step;
+
 	return 0;
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_pci_fake_device_init);
diff --git a/drivers/gpu/drm/xe/tests/xe_wa_test.c b/drivers/gpu/drm/xe/tests/xe_wa_test.c
index ff0e2502b39f..21601e9df353 100644
--- a/drivers/gpu/drm/xe/tests/xe_wa_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_wa_test.c
@@ -43,9 +43,6 @@ static int xe_wa_test_init(struct kunit *test)
 		xe_gt_mmio_init(gt);
 	}
 
-	if (!param->graphics_verx100)
-		xe->info.step = param->step;
-
 	/* TODO: init hw engines for engine/LRC WAs */
 	xe->drm.dev = dev;
 	test->priv = xe;

-- 
2.53.0

