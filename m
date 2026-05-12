Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 955A4CD343F
	for <intel-xe@archiver.kernel.org>; Tue, 12 May 2026 19:45:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 336A710E2C3;
	Tue, 12 May 2026 19:45:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gIjHat44";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEC0210E2BA
 for <intel-xe@lists.freedesktop.org>; Tue, 12 May 2026 19:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778615127; x=1810151127;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BFPGgecmX3mV65+NILHv//KBFgfNvPNu8AbbOgnv1XU=;
 b=gIjHat44RPk1rgr43I8c/nrNR5diHmNWA4w5aJuCvjakkKE4Jf9py2QJ
 52KLpRqMjtYchDx5/QMtn5M2SNtuzADD7jECrl22JNGkM5eEexF3pa5OB
 OBhkuhYooithcsP8+bPKIRbdaZ7rWJBr4ooqvSuhrPH6a34aEO6OIMcS/
 db22kX+AnPzsXH2iPa96gmW5CzyWucFYlChr4HXSK5QtBmwDUIwEOQq6S
 k20ckB5mSW6NDSaObev0vsjc+PIzzCrMRsdOOm8ytn6unbSZB0fxjGcn3
 qH+ctwZb0oNAsGIyePOMBGTJAq9ei2vsxiOsTygRh/5g2Vj4TEwjMFlfj A==;
X-CSE-ConnectionGUID: at+4yjeJRX2egZhSyazfqw==
X-CSE-MsgGUID: nfSqz32MTeaKi/i/isAMCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="79250266"
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; d="scan'208";a="79250266"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 12:45:27 -0700
X-CSE-ConnectionGUID: MQXVuOSmSjmnDxD9pBNu7A==
X-CSE-MsgGUID: uBzAD7TESUuPZXzQOg0ejg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; d="scan'208";a="234809574"
Received: from dmagui1x-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.118.167])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 12:45:25 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH] drm/xe: Add helper to detect real vs kunit xe_device
Date: Tue, 12 May 2026 21:45:14 +0200
Message-ID: <20260512194514.3414-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
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

In some cases we might want to know if we are running our test
code on real vs kunit xe device; also use of static kunit stub
might be not possible as test code might be use other threads.

As only real xe_device instances will be on the true PCI bus,
and all kunit fake devices are attached to the kunit_bus_type,
add helper that checks underlying bus to determine xe status.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_kunit_helpers.c | 2 ++
 drivers/gpu/drm/xe/xe_device.h              | 5 +++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
index bc5156966ce9..28d7d1618638 100644
--- a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
+++ b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
@@ -39,6 +39,7 @@ struct xe_device *xe_kunit_helper_alloc_xe_device(struct kunit *test,
 					       struct xe_device,
 					       drm, DRIVER_GEM);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xe);
+	KUNIT_ASSERT_FALSE(test, xe_device_is_real(xe));
 	return xe;
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_kunit_helper_alloc_xe_device);
@@ -118,6 +119,7 @@ int xe_kunit_helper_xe_device_live_test_init(struct kunit *test)
 
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xe);
 	kunit_info(test, "running on %s device\n", xe->info.platform_name);
+	KUNIT_ASSERT_TRUE(test, xe_device_is_real(xe));
 
 	KUNIT_ASSERT_FALSE(test, xe_device_wedged(xe));
 	xe_pm_runtime_get(xe);
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 355d69dc8f54..c14624a19808 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -220,6 +220,11 @@ static inline bool xe_device_is_admin_only(const struct xe_device *xe)
 }
 #endif
 
+static inline bool xe_device_is_real(const struct xe_device *xe)
+{
+	return xe->drm.dev->bus == &pci_bus_type;
+}
+
 /*
  * Occasionally it is seen that the G2H worker starts running after a delay of more than
  * a second even after being queued and activated by the Linux workqueue subsystem. This
-- 
2.47.1

