Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0F9606A31A
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 13:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ids+qCGB
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 387AC1122AA;
	Thu, 29 Oct 2026 13:26:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36C1B1122BD
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Oct 2026 13:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793280403; x=1824816403;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dyLfeRRYmDfhShYhC/Lla2ZPUG9Ek3mrjDGbEiegWUY=;
 b=ids+qCGBARkSnhi7Dxon9UAeES8pUwEnGW/vc0mSQg5l1i3SwvsIKBqM
 rA1XlRCrWMn5zzLbHTkTfT0GayFhfQs45/o0p63kC1lp1k4cZfe8D/QUk
 5Pl3bVd9kCr4duWLIz7BC2PK+OmPfXbfv051hid44quYwDKZB+xtsYCAW
 aYn0+PPAlvQX7eg20QMgdfwW9JO8vvmY0UI2VxSjvR0vxxqqGDsM6eCnZ
 xIb6hsSvT+j6JBoF9xD+1gchlAwQQcTHxbjZvJvcv5NekErXKb9Wid8fd
 qwf6sZaaG6nWlUeKpGV5rAA1MJUb1IVURPRF62g/aZ6luAFotrFpKfacX Q==;
X-CSE-ConnectionGUID: npgBuUKIQJCnLFtu+EFEgA==
X-CSE-MsgGUID: fziVKHoDRHiunNuidTOqDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1900386"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1900386"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 06:26:42 -0700
X-CSE-ConnectionGUID: PIyBYTKNQGOQ7FVWgiYLgQ==
X-CSE-MsgGUID: /8uyyIwqRT6HnqeQ7h5HUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5691707"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa010.fm.intel.com with ESMTP; 29 Oct 2026 06:26:38 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@linux.intel.com, jani.nikula@linux.intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v2 6/6] drm/xe/log: Test software CPER emission parameters
Date: Thu, 29 Oct 2026 18:56:16 +0530
Message-ID: <20261029132609.907017-14-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029132609.907017-8-mallesh.koujalagi@intel.com>
References: <20261029132609.907017-8-mallesh.koujalagi@intel.com>
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

Add KUnit tests for software SIGIDs to verify the correct
arguments are forwarded to the CPER emission path.

Assisted-by: LLM
Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_log_kunit.c | 73 +++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_log_kunit.c b/drivers/gpu/drm/xe/tests/xe_log_kunit.c
index 08828ecc9098..e53100df5b32 100644
--- a/drivers/gpu/drm/xe/tests/xe_log_kunit.c
+++ b/drivers/gpu/drm/xe/tests/xe_log_kunit.c
@@ -149,6 +149,78 @@ static void demo_cper(struct kunit *test)
 	demo(test->priv);
 }
 
+/*
+ * Software CPER
+ */
+static struct {
+	unsigned int count;
+	int cper_sev;
+	enum xe_sigid sigid;
+	u32 component;
+	u32 location;
+	const void *data;
+	size_t len;
+} sw_cper_capture;
+
+static void capture_emit_cper(struct pci_dev *pdev, int cper_sev,
+			      enum xe_sigid sigid, u32 component, u32 location,
+			      const void *data, size_t len, struct va_format *vaf)
+{
+	sw_cper_capture.count++;
+	sw_cper_capture.cper_sev = cper_sev;
+	sw_cper_capture.sigid = sigid;
+	sw_cper_capture.component = component;
+	sw_cper_capture.location = location;
+	sw_cper_capture.data = data;
+	sw_cper_capture.len = len;
+}
+
+static const struct sw_cper_param {
+	int cper_sev;
+	enum xe_sigid sigid;
+	u32 component;
+	int err;		/* reported as ERR_PTR when non-zero */
+	size_t len;		/* bytes of @blob passed as data */
+	const char *name;
+} sw_cper_params[] = {
+	{ CPER_SEV_FATAL, XE_SIGID_PROBE, XE_LOG_COMPONENT_PROBE,
+	  -ENODEV, 0, "sw-fatal-errno" },
+	{ CPER_SEV_RECOVERABLE, XE_SIGID_GT_TDR, XE_LOG_COMPONENT_GUCSUBMIT,
+	  -ETIMEDOUT, 0, "sw-recoverable-errno" },
+	{ CPER_SEV_CORRECTED, XE_SIGID_MEM_FAULT, XE_LOG_COMPONENT_PAGEFAULT,
+	  0, 0, "sw-corrected" },
+	{ CPER_SEV_INFORMATIONAL, XE_SIGID_SURVIVABILITY, XE_LOG_COMPONENT_SURVIVABILITY,
+	  0, 0, "sw-informational" },
+	{ CPER_SEV_FATAL, XE_SIGID_SW, XE_LOG_COMPONENT_NONE,
+	  0, sizeof(struct xe_ras_error_class), "sw-with-error-class" },
+};
+
+KUNIT_ARRAY_PARAM_DESC(sw_cper, sw_cper_params, name);
+
+static void test_sw_cper(struct kunit *test)
+{
+	const struct sw_cper_param *param = test->param_value;
+	struct xe_device *xe = test->priv;
+	struct pci_dev *pdev = xe_any_to_pdev(xe);
+	const void *data = param->err ? ERR_PTR(param->err) : param->len ? blob : NULL;
+
+	memset(&sw_cper_capture, 0, sizeof(sw_cper_capture));
+	kunit_activate_static_stub(test, log_emit_cper, capture_emit_cper);
+	kunit_activate_static_stub(test, log_dmesg_vprintk, nop_dmesg_vprintk);
+
+	xe_log_emit(pdev, param->cper_sev, param->sigid, param->component,
+		    XE_LOG_LOCATION_NONE, data, param->len, "testing %s\n", param->name);
+
+	KUNIT_ASSERT_EQ(test, sw_cper_capture.count, 1);
+	KUNIT_EXPECT_EQ(test, sw_cper_capture.cper_sev, param->cper_sev);
+	KUNIT_EXPECT_EQ(test, (u32)sw_cper_capture.sigid, (u32)param->sigid);
+	KUNIT_EXPECT_EQ(test, sw_cper_capture.component, param->component);
+	KUNIT_EXPECT_PTR_EQ(test, sw_cper_capture.data, data);
+	KUNIT_EXPECT_EQ(test, sw_cper_capture.len, param->len);
+
+	KUNIT_EXPECT_TRUE(test, is_sw_cper(sw_cper_capture.sigid));
+}
+
 static const char *test_fatal(struct xe_device *xe)
 {
 	struct pci_dev *pdev = to_pdev_safe(xe);
@@ -559,6 +631,7 @@ static struct kunit_case xe_log_test_cases[] = {
 	KUNIT_CASE(demo_cper),
 	KUNIT_CASE(demo_dmesg),
 	KUNIT_CASE_PARAM(test_dmesg, log_gen_params),
+	KUNIT_CASE_PARAM(test_sw_cper, sw_cper_gen_params),
 	KUNIT_CASE_PARAM(test_invalid, invalid_param_gen_params),
 	{}
 };
-- 
2.48.1

