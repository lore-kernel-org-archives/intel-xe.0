Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC49DCD98F2
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jun 2026 19:06:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C84B10F3C3;
	Thu, 18 Jun 2026 19:06:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e4JXdsy/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5B9F10F3C3
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jun 2026 19:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781809563; x=1813345563;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LgRDJc3no6eXRrY4sCWwEP3L/W8uSZM8bqneXv0cT/E=;
 b=e4JXdsy/TBZzE6IOmcCJ5GbqWkpTj34z5lCUmNomP3snO2O/Wrj4K6Ub
 vp+Rw3ElXaMCyCmpBdxtCb9aCHzOEZjDnUNZa9fajvYOFPpdpXbWmVRZk
 hsxL7jj52xj2xXauuHQyv1ZghWN2rrIrgOOA6jwz3iB9zMxhYrcu16XwK
 xtiV+wlkVGYUg9DtooD1koTOsY8hP3KkLmBbRArK6veyjDC3KKT9aRERV
 pXayo8znVBLyGVsRP4TB3/OUljYkm8FPFvhRrW63OaKyQaMILcmo5Oejx
 vIsJgzmvUTYkrZnuFj8VnyEpjN8b3EnpKbT6L4SFHWfplgv7NYNgSyCBs A==;
X-CSE-ConnectionGUID: OJEx/GmvT/GflhcCUnGmhQ==
X-CSE-MsgGUID: pnwzVb3zRx+rbTfCUSZVRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11821"; a="82433034"
X-IronPort-AV: E=Sophos;i="6.24,212,1774335600"; d="scan'208";a="82433034"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 12:06:00 -0700
X-CSE-ConnectionGUID: FrX9YrLxR8ioFzGeuJ2p7Q==
X-CSE-MsgGUID: 0KZ1m3rJQLyJTgoPHpgkiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,212,1774335600"; d="scan'208";a="248319689"
Received: from padamowi-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.18.63])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 12:05:56 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 2/3] drm/xe/kunit: Assert gt before assigning relay pointer
Date: Thu, 18 Jun 2026 21:05:40 +0200
Message-ID: <20260618190542.593-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618190542.593-1-michal.wajdeczko@intel.com>
References: <20260618190542.593-1-michal.wajdeczko@intel.com>
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

While our fake xe_device will be always initialized with the GT0
and the xe_device_get_gt() will never return a NULL, add explicit
assert to emphasize that so we can safely continue to use the GuC
relay pointer.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_guc_relay_test.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_guc_relay_test.c b/drivers/gpu/drm/xe/tests/xe_guc_relay_test.c
index 13701451b923..5c42eb31fb6c 100644
--- a/drivers/gpu/drm/xe/tests/xe_guc_relay_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_guc_relay_test.c
@@ -31,6 +31,7 @@ static int relay_test_init(struct kunit *test)
 	};
 	struct xe_guc_relay *relay;
 	struct xe_device *xe;
+	struct xe_gt *gt;
 
 	test->priv = &fake;
 	xe_kunit_helper_xe_device_test_init(test);
@@ -38,7 +39,10 @@ static int relay_test_init(struct kunit *test)
 	xe = test->priv;
 	KUNIT_ASSERT_EQ(test, xe_sriov_init(xe), 0);
 
-	relay = &xe_device_get_gt(xe, 0)->uc.guc.relay;
+	gt = xe_device_get_gt(test->priv, 0);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, gt);
+
+	relay = &gt->uc.guc.relay;
 	kunit_activate_static_stub(test, relay_get_totalvfs,
 				   replacement_relay_get_totalvfs);
 
-- 
2.47.1

