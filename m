Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB28ACD8CB2
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 16:54:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2E5B10F775;
	Mon,  8 Jun 2026 16:54:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XRv/1wlK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA3B710F76C
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jun 2026 16:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780937690; x=1812473690;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5pNSGydw+CrhYuD25spGWt7SzugTq8IZNgvP7yPkBF8=;
 b=XRv/1wlK2+/rEM2m8ZV9Ff9GLJ0RoLU/7ch03esD95eS5mbZ9nf/sTUt
 BdQlOnhYPYgFUC5cH2143+Hbz1hZCdTIQA8RwtNycjxpxGjtzdheAIb+0
 9hVzzXlCGUgJUaCT4ZG2hs5sffgH3IOSyIbfxdR8QptK9aFpLS4HrmdVH
 TYx82gna91ZpRjEb0qqNKcIJtNO1DtS3mbGBdP/6zRJTXZcjvO3CbEtqd
 y+mNk7DTPtdqkXxiCbaW9SAhynBbZj3S1RZ8gd97D1L2BpvhqXNnLVXs+
 TNKE3mvOAyxzhoMQkmiCrDOIR2Ty4rS85v3J7B/W5Cd8TLsTebq3BIGfc A==;
X-CSE-ConnectionGUID: f3XycSHqT6Wz+54m+sSkEA==
X-CSE-MsgGUID: z3WNM+YcQXSK4BciXFVpAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="81744552"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="81744552"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 09:54:49 -0700
X-CSE-ConnectionGUID: Zi/F4ROvSKit70RZskDafQ==
X-CSE-MsgGUID: AHo2BuV1QuCg85V41OwuDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="247467563"
Received: from smoudgil-mobl1.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.117.247])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 09:54:47 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH 07/16] drm/xe: Add helper to detect real vs kunit xe_device
Date: Mon,  8 Jun 2026 18:54:20 +0200
Message-ID: <20260608165429.587-8-michal.wajdeczko@intel.com>
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

In some cases we might want to know if we are running our test
code on real vs kunit xe device; also use of static kunit stub
might be not possible as test code might be use other threads.

As only real xe_device instances will be on the true PCI bus,
and all kunit fake devices are attached to the kunit_bus_type,
add helper that checks underlying bus to determine xe status.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
v2: make if always true if no KUNIT_TEST (Michal)
---
 drivers/gpu/drm/xe/tests/xe_kunit_helpers.c | 2 ++
 drivers/gpu/drm/xe/xe_device.h              | 9 +++++++++
 2 files changed, 11 insertions(+)

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
index 975768a6a9c8..0a3aa6ea2515 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -220,6 +220,15 @@ static inline bool xe_device_is_admin_only(const struct xe_device *xe)
 }
 #endif
 
+static inline bool xe_device_is_real(const struct xe_device *xe)
+{
+#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
+	return xe->drm.dev->bus == &pci_bus_type;
+#else
+	return true;
+#endif
+}
+
 /*
  * Occasionally it is seen that the G2H worker starts running after a delay of more than
  * a second even after being queued and activated by the Linux workqueue subsystem. This
-- 
2.47.1

