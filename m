Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09240C54F55
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jul 2026 16:12:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4A2210E98A;
	Tue, 28 Jul 2026 16:12:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G7nrUrNL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBF8110E88A
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jul 2026 16:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785255089; x=1816791089;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H7p69HlDSi4VTtH/MitqQI3HfxtM6KfF+bZYV3IARdk=;
 b=G7nrUrNLngxOqgbeQmnUGFMzRlmrGQmt5HmqRFnd2QPOkBxMUefwCu4g
 saG1VzRQie7GkcWOLXKDWtBAQLq2p5VOTasfTF9oTNKmOolhzK3wWaePy
 XJJXaFyAZc1rOWkJkqFbk1zabJajUDfUu9VREmObXPQThXJKXB023lQv4
 9PGh7dXhEeIcFoMyWJlD+FoEbgsrbkQfRgCdbZPYaxFfaQRSoXLXkAbxw
 Pb0n3HrWvDJBkLPRulj7CBxu2Ud0tp1b36ICLZsx0brqupeHS0kkC7q8X
 m4vvUbuDaHaLXGaeR9qNB4hdpffLB/4CVx2s56lVaCi67o+oNEh0cJ70A A==;
X-CSE-ConnectionGUID: CfZY1/woT2eGm66QfRqE3g==
X-CSE-MsgGUID: j5lYfWNQTnW6BvEJW+tmzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="103386278"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="103386278"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 09:11:29 -0700
X-CSE-ConnectionGUID: u+l4C0TGTh2jO7rgkroZrw==
X-CSE-MsgGUID: mH3vPrKQQyKy2UvSl9zvTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="259819372"
Received: from dmagui1x-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.118.167])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 09:11:28 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2 13/22] drm/xe/kunit: Setup driver data in the test device
Date: Tue, 28 Jul 2026 18:10:28 +0200
Message-ID: <20260728161039.579-14-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728161039.579-1-michal.wajdeczko@intel.com>
References: <20260728161039.579-1-michal.wajdeczko@intel.com>
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

While we have helpers pdev_to_xe_device() and kdev_to_xe_device()
to obtain the xe_device pointer from the struct device pointer or
from the struct pci_dev pointer, we must also setup the drm_device
pointer as driver data in the device to make them work.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_kunit_helpers.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
index bc5156966ce9..27740b40c8ae 100644
--- a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
+++ b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
@@ -39,6 +39,10 @@ struct xe_device *xe_kunit_helper_alloc_xe_device(struct kunit *test,
 					       struct xe_device,
 					       drm, DRIVER_GEM);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xe);
+
+	dev_set_drvdata(xe->drm.dev, &xe->drm);
+	KUNIT_ASSERT_PTR_EQ(test, xe, kdev_to_xe_device(dev));
+
 	return xe;
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_kunit_helper_alloc_xe_device);
-- 
2.47.1

