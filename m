Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6065B606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 13:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hNx2K4Zn
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1595F112440;
	Thu, 26 Nov 2026 13:58:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB56D10E9C7
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Nov 2026 13:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795701479; x=1827237479;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JnQJ8uXKuax6k01/ZpxcywSYRgS69k+wvcpReoNg6CM=;
 b=hNx2K4ZnOgp/r41IQ8SW3AaJiRoe981Hsb3G66nFUTZ0T+0TZVzJAG0W
 ofJEM99wfxopgDpUNzLzn0crOpzzVeEzkidAb4Hxd1ZfQJsuO6wuwvE9/
 MAvjQbXbT3RgnpdSglZWLBHTeEj9wqWRzdfYJuzFfHqEV4Ibf4zKtrq7Y
 MF+xaPX4o2EpHZ3NPQj5VLrFFBZ12AxT2ovRUBMWa7cZfFPxDTmcciljr
 KqsI31CMbp6qs+70V0VM2ys/wsbRq1YVQsVxYGY759ao1CDNRkcJKR1Bp
 R/CNM2KgijKzGw6hww0WKKnjYvjTwP5B7G/JOpRdo/4RNhMPaLGBytwOG A==;
X-CSE-ConnectionGUID: w1UBI51kRWuY6FJgx+vqqg==
X-CSE-MsgGUID: kFI41OlIRxiR1gASNhmrWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4520605"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4520605"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 05:57:59 -0800
X-CSE-ConnectionGUID: g4RPwlfxThKU93oTPD7pOg==
X-CSE-MsgGUID: ZCY4gJkxRJC1S55T4IpNng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; d="scan'208";a="12684407"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa001.fm.intel.com with ESMTP; 26 Nov 2026 05:57:56 -0800
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com,
 aravind.iddamsetty@linux.intel.com, jani.nikula@linux.intel.com,
 daniele.ceraolospurio@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [RFC PATCH v1 4/6] drm/xe/tests: Update log tests for atomic logging
 support
Date: Thu, 26 Nov 2026 19:27:36 +0530
Message-ID: <20261126135732.2169939-12-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261126135732.2169939-8-mallesh.koujalagi@intel.com>
References: <20261126135732.2169939-8-mallesh.koujalagi@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add KUnit coverage for xe_log_err_atomic() and
xe_log_err_fatal_atomic().

Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_log_kunit.c | 40 +++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_log_kunit.c b/drivers/gpu/drm/xe/tests/xe_log_kunit.c
index bdbdec45e73d..f04ce3dd4ccf 100644
--- a/drivers/gpu/drm/xe/tests/xe_log_kunit.c
+++ b/drivers/gpu/drm/xe/tests/xe_log_kunit.c
@@ -229,6 +229,44 @@ static void test_sw_cper(struct kunit *test)
 	KUNIT_EXPECT_TRUE(test, is_sw_cper(sw_cper_capture.sigid));
 }
 
+static void test_cper_atomic_err(struct kunit *test)
+{
+	struct xe_gt *gt = to_gt_safe(test->priv);
+
+	kunit_activate_static_stub(test, log_emit_cper_atomic, capture_emit_cper);
+	kunit_activate_static_stub(test, log_dmesg_vprintk, nop_dmesg_vprintk);
+	memset(&sw_cper_capture, 0, sizeof(sw_cper_capture));
+
+	xe_log_err_atomic(gt, PROBE, -ENODEV, "testing %d\n", 123);
+
+	KUNIT_ASSERT_EQ(test, sw_cper_capture.count, 1);
+	KUNIT_EXPECT_EQ(test, sw_cper_capture.cper_sev, CPER_SEV_RECOVERABLE);
+	KUNIT_EXPECT_EQ(test, (u32)sw_cper_capture.sigid, (u32)XE_LOG_COMPONENT_PROBE_SIGID);
+	KUNIT_EXPECT_EQ(test, sw_cper_capture.component, XE_LOG_COMPONENT_PROBE);
+	KUNIT_EXPECT_EQ(test, sw_cper_capture.location, xe_log_location(gt));
+	KUNIT_EXPECT_PTR_EQ(test, sw_cper_capture.data, ERR_PTR(-ENODEV));
+	KUNIT_EXPECT_EQ(test, sw_cper_capture.len, 0);
+}
+
+static void test_cper_atomic_err_fatal(struct kunit *test)
+{
+	struct xe_gt *gt = to_gt_safe(test->priv);
+
+	kunit_activate_static_stub(test, log_emit_cper_atomic, capture_emit_cper);
+	kunit_activate_static_stub(test, log_dmesg_vprintk, nop_dmesg_vprintk);
+	memset(&sw_cper_capture, 0, sizeof(sw_cper_capture));
+
+	xe_log_err_fatal_atomic(gt, PROBE, -EIO, "testing %d\n", 123);
+
+	KUNIT_ASSERT_EQ(test, sw_cper_capture.count, 1);
+	KUNIT_EXPECT_EQ(test, sw_cper_capture.cper_sev, CPER_SEV_FATAL);
+	KUNIT_EXPECT_EQ(test, (u32)sw_cper_capture.sigid, (u32)XE_LOG_COMPONENT_PROBE_SIGID);
+	KUNIT_EXPECT_EQ(test, sw_cper_capture.component, XE_LOG_COMPONENT_PROBE);
+	KUNIT_EXPECT_EQ(test, sw_cper_capture.location, xe_log_location(gt));
+	KUNIT_EXPECT_PTR_EQ(test, sw_cper_capture.data, ERR_PTR(-EIO));
+	KUNIT_EXPECT_EQ(test, sw_cper_capture.len, 0);
+}
+
 static const char *test_fatal(struct xe_device *xe)
 {
 	struct pci_dev *pdev = to_pdev_safe(xe);
@@ -641,6 +679,8 @@ static struct kunit_case xe_log_test_cases[] = {
 	KUNIT_CASE(test_cper_null_xe),
 	KUNIT_CASE_PARAM(test_dmesg, log_gen_params),
 	KUNIT_CASE_PARAM(test_sw_cper, sw_cper_gen_params),
+	KUNIT_CASE(test_cper_atomic_err),
+	KUNIT_CASE(test_cper_atomic_err_fatal),
 	KUNIT_CASE_PARAM(test_invalid, invalid_param_gen_params),
 	{}
 };
-- 
2.48.1

