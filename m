Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E22606A31F
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 16:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=abeLdoH4
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C03AF10E334;
	Wed, 21 Oct 2026 16:25:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D25C210FEF7
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Oct 2026 16:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792599947; x=1824135947;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=C5MN07pn7Iw/391VZyjiYzZCRY7w3AnbV3Qy7g+dBNc=;
 b=abeLdoH4QKfy6cQEyAb6BJC7/b4Ot5ShLx7tQXW3ahRzyc+9IeUvy8Sm
 wED+4U9vc6IhJOjMSgYriaLpaiutLR8KFwUvVWX3Rm3nAZzeL4uuhVrco
 M45cemkG34clpg+lMetUlLp2wmF8I5EEQ7cEtPvTLV0O5DbNZQ2coVdCN
 Adjtd9ixgEpLUwpsDGxyUCeqs9fgiSrh3yvT4QKVyzxwiWH+dFlm4LGiL
 IAmL9eOsdZCiLAEb4k6oKbdc4RA0wOjtnzrPgJQ4aIK5j3/ETC+xu6Pzb
 vLhH8W/+yr6CKy4BfuZi9DQ3X0tL3LgaNm/P18Y3LqkE9TVYBKJOA7E+y A==;
X-CSE-ConnectionGUID: ZfydHjGpQ8ydcq8Wkw+Tfg==
X-CSE-MsgGUID: NizbtI+wRuGjZKhDP4s7yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1428313"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1428313"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 09:25:47 -0700
X-CSE-ConnectionGUID: WfjoMghXS1SHXSECSgLWGA==
X-CSE-MsgGUID: Ppg5U7V0RdGord2PJCS/PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3468975"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa007.fm.intel.com with ESMTP; 21 Oct 2026 09:25:43 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@linux.intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH 5/5] drm/xe/log: Add software CPER KUnit test
Date: Wed, 21 Oct 2026 21:55:13 +0530
Message-ID: <20261021162508.265700-12-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021162508.265700-7-mallesh.koujalagi@intel.com>
References: <20261021162508.265700-7-mallesh.koujalagi@intel.com>
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
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add test_sw_cper() to validate software CPER logging.

Verify that xe_log_emit() forwards severity, SIGID, component,
and error data correctly, and ensure the SIGID stays in the
software range.

Print the generated error class to simplify debugging and
record inspection.

Assisted-by: LLM
Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_log_kunit.c | 94 ++++++++++++++++++++++++-
 1 file changed, 93 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_log_kunit.c b/drivers/gpu/drm/xe/tests/xe_log_kunit.c
index 56c36c8a08e1..e53100df5b32 100644
--- a/drivers/gpu/drm/xe/tests/xe_log_kunit.c
+++ b/drivers/gpu/drm/xe/tests/xe_log_kunit.c
@@ -6,11 +6,14 @@
 #include <kunit/static_stub.h>
 #include <kunit/test.h>
 #include <kunit/test-bug.h>
+#include <linux/minmax.h>
 
 #include "tests/xe_kunit_helpers.h"
 #include "tests/xe_pci_test.h"
+#include "xe_cper.h"
 #include "xe_device.h"
 #include "xe_log.h"
+#include "xe_ras_types.h"
 
 static void nop_dmesg_vprintk(struct pci_dev *pdev, int cper_sev, struct va_format *vaf)
 {
@@ -43,6 +46,19 @@ static const char *location_type(u32 location)
 	       location ? "?" : "";
 }
 
+static bool is_sw_cper(enum xe_sigid sigid)
+{
+	return in_range(sigid, INTEL_SIGID_GPU_XE_SOFTWARE_START, INTEL_SIGID_BATCH);
+}
+
+static void fake_emit_sw_cper(int cper_sev, u32 component, u32 location, const void *data)
+{
+	/* mirrors xe_cper_driver_error_class: full 16-bit component/tile, unconditional */
+	pr_info("SW CPER CLASS=severity:%u component:%u tile:%u cause:%u\n",
+		cper_sev, (u16)component, (u16)location,
+		IS_ERR(data) ? (u32)-PTR_ERR(data) : 0);
+}
+
 static void fake_emit_cper(struct pci_dev *pdev, int cper_sev,
 			   enum xe_sigid sigid, u32 component, u32 location,
 			   const void *data, size_t len, struct va_format *vaf)
@@ -51,7 +67,8 @@ static void fake_emit_cper(struct pci_dev *pdev, int cper_sev,
 	int n;
 
 	pr_info("\n");
-	pr_info("CPER SEV=%u SIGID=%u\n", cper_sev, sigid);
+	pr_info("CPER SEV=%u SIGID=%u \t# %s\n", cper_sev, sigid,
+		is_sw_cper(sigid) ? "software" : "");
 	pr_info("CPER DEVICE=%s\n", dev_name(&pdev->dev));
 	if (location)
 		pr_info("CPER LOCATION=%#x \t# %s.%u\n",
@@ -68,6 +85,8 @@ static void fake_emit_cper(struct pci_dev *pdev, int cper_sev,
 
 	n = vscnprintf(msg, sizeof(msg), vaf->fmt, *vaf->va);
 	print_hex_dump(KERN_INFO, "CPER MSG=", DUMP_PREFIX_OFFSET, 16, 1, msg, n, true);
+	if (is_sw_cper(sigid))
+		fake_emit_sw_cper(cper_sev, component, location, data);
 	pr_info("CPER END\n");
 }
 
@@ -130,6 +149,78 @@ static void demo_cper(struct kunit *test)
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
@@ -540,6 +631,7 @@ static struct kunit_case xe_log_test_cases[] = {
 	KUNIT_CASE(demo_cper),
 	KUNIT_CASE(demo_dmesg),
 	KUNIT_CASE_PARAM(test_dmesg, log_gen_params),
+	KUNIT_CASE_PARAM(test_sw_cper, sw_cper_gen_params),
 	KUNIT_CASE_PARAM(test_invalid, invalid_param_gen_params),
 	{}
 };
-- 
2.48.1

