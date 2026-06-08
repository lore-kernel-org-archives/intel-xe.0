Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 112E5CD8C9F
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 16:54:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAFDF10F776;
	Mon,  8 Jun 2026 16:54:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MjOM5sG3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 400D210F76B
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jun 2026 16:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780937692; x=1812473692;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7Ii9CL5rMUdTzVJw/wgPMMtMlCB5CsjYf8NenZ/LjOw=;
 b=MjOM5sG3RP2Av4qqCEqltKNAkIfpeWFHqgtUEciFZ81FPYyv+tM9QQXV
 2FregO5iWZWK7H55S6weohSXNV1KpfZYTgZXlA+vd+t/tyeTSxCJlkzyN
 mY2vdNHHaep/uuHCCKP0PnhZjJbRIVmp5IrBLob1WVFhDkP+bYRWZpuKH
 Osl+L2h+PSStVZlR06omdC7DnP8+UyO+KRg89emra84olgeHYHH8YuvdW
 HcsSqIFWF+jJpxCTriGwUpiqwzJ7Y8lvbIRFyCO+Eq1yd0Z3Soid9rOwQ
 yxvzeyaxp8IH2EcKZ1DTHVyUnM/Lp4mtvKz1PddgTmGFlghKaXkr2/xHB Q==;
X-CSE-ConnectionGUID: 5IB6I13jR7mkhrTNKfFyQw==
X-CSE-MsgGUID: lKJuy/C3SUC4dIw8SsUBow==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="81744558"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="81744558"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 09:54:51 -0700
X-CSE-ConnectionGUID: Otutiz5bRU2oIEb9rC86lg==
X-CSE-MsgGUID: FWWNUDXxTcSd6Upxd1fk9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="247467573"
Received: from smoudgil-mobl1.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.117.247])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 09:54:50 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 09/16] drm/xe/kunit: Claim minimal RPM support for fake xe
 device
Date: Mon,  8 Jun 2026 18:54:22 +0200
Message-ID: <20260608165429.587-10-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260608165429.587-1-michal.wajdeczko@intel.com>
References: <20260608165429.587-1-michal.wajdeczko@intel.com>
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

This will allow us to use more unmodified xe code in kunit tests.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_kunit_helpers.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
index 28d7d1618638..e0eeb419e837 100644
--- a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
+++ b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
@@ -87,6 +87,9 @@ int xe_kunit_helper_xe_device_test_init(struct kunit *test)
 	err = kunit_add_action_or_reset(test, kunit_action_restore_priv, test->priv);
 	KUNIT_ASSERT_EQ(test, err, 0);
 
+	pm_runtime_enable(xe->drm.dev);
+	pm_runtime_forbid(xe->drm.dev);
+
 	test->priv = xe;
 	return 0;
 }
-- 
2.47.1

