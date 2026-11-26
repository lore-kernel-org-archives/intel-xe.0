Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2D7606A326
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 13:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MPMC3VU1
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59D4A10E9E0;
	Thu, 26 Nov 2026 13:57:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E04FB10E9AE
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Nov 2026 13:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795701468; x=1827237468;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=goG9JJHezdfm/lyhheuv8vICAtvuchSr1kStgdT5jwc=;
 b=MPMC3VU1tNgjlrpto7waRTAhw0RxOtfHxTF5fE63Bsx/AZGXIEegF0wW
 B6k/4JfETb1X3DM1aYWOQ3iTldD5Gz/1EnEHyBBVg7QXaKJmLalNgu03M
 yLUXk4nf/msh6N83j4BJVxm7BOF7RlJFQ2B09QPxHaQGt3WPapmWeDFg8
 TJehpPO3rvrOTI/edzwAxdAWrjKuRCaat/VAm+R3lLNovw6LqmpsrI1pE
 rDT2hVurtBhHFgOX7f+hNVkmCUKcAgP9ukwVMt3Cue5UaPYVrhXMOz3fi
 +N+QR9dZhYztpFrAKgd8tZcYmgGqGlyqZL6HHn5VAohm9RWGLim35dK7V A==;
X-CSE-ConnectionGUID: ngBLlIE2R0yYw45tTezi8Q==
X-CSE-MsgGUID: /DFG4ATFTuGjU9KHR0jDHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4520588"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4520588"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 05:57:48 -0800
X-CSE-ConnectionGUID: hja5RLhWQdqONI0g6LfwOQ==
X-CSE-MsgGUID: mSgXX4bWQTiUfaaTJe3YVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; d="scan'208";a="12684395"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa001.fm.intel.com with ESMTP; 26 Nov 2026 05:57:44 -0800
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com,
 aravind.iddamsetty@linux.intel.com, jani.nikula@linux.intel.com,
 daniele.ceraolospurio@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [RFC PATCH v1 1/6] drm/xe/cper: Software CPER-Do not review
Date: Thu, 26 Nov 2026 19:27:33 +0530
Message-ID: <20261126135732.2169939-9-mallesh.koujalagi@intel.com>
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

DO NOT REVIEW. COMPILATION ONLY
This patch is from https://patchwork.freedesktop.org/series/176576
Added only for Compilation.

Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_log_kunit.c | 103 +++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_cper.c            |  72 +++++++++++++++--
 drivers/gpu/drm/xe/xe_cper_types.h      |  39 ++++++++-
 drivers/gpu/drm/xe/xe_device_types.h    |   2 +
 drivers/gpu/drm/xe/xe_pci.c             |   2 +
 drivers/gpu/drm/xe/xe_pci_types.h       |   1 +
 drivers/gpu/drm/xe/xe_printk.h          |   3 +
 7 files changed, 211 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_log_kunit.c b/drivers/gpu/drm/xe/tests/xe_log_kunit.c
index 56c36c8a08e1..9d8966a3177f 100644
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
 
@@ -123,6 +142,14 @@ static void demo_dmesg(struct kunit *test)
 	demo(test->priv);
 }
 
+static void test_cper_null_xe(struct kunit *test)
+{
+	xe_cper_emit(NULL, CPER_SEV_FATAL, XE_SIGID_PROBE,
+		     XE_LOG_COMPONENT_PROBE, XE_LOG_LOCATION_NONE,
+		     ERR_PTR(-ENODEV), 0, NULL);
+	KUNIT_SUCCEED(test);
+}
+
 static void demo_cper(struct kunit *test)
 {
 	kunit_activate_static_stub(test, log_emit_cper, fake_emit_cper);
@@ -130,6 +157,78 @@ static void demo_cper(struct kunit *test)
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
@@ -539,7 +638,9 @@ static int xe_log_test_init(struct kunit *test)
 static struct kunit_case xe_log_test_cases[] = {
 	KUNIT_CASE(demo_cper),
 	KUNIT_CASE(demo_dmesg),
+	KUNIT_CASE(test_cper_null_xe),
 	KUNIT_CASE_PARAM(test_dmesg, log_gen_params),
+	KUNIT_CASE_PARAM(test_sw_cper, sw_cper_gen_params),
 	KUNIT_CASE_PARAM(test_invalid, invalid_param_gen_params),
 	{}
 };
diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
index 64bbb149e4e3..d8fff57a349e 100644
--- a/drivers/gpu/drm/xe/xe_cper.c
+++ b/drivers/gpu/drm/xe/xe_cper.c
@@ -32,6 +32,11 @@ static bool is_hw_sigid(enum xe_sigid sigid)
 	return in_range(sigid, INTEL_SIGID_GPU_XE_HARDWARE_START, INTEL_SIGID_BATCH);
 }
 
+static bool is_sw_sigid(enum xe_sigid sigid)
+{
+	return in_range(sigid, INTEL_SIGID_GPU_XE_SOFTWARE_START, INTEL_SIGID_BATCH);
+}
+
 /* CPER platform_id GUIDs (RFC 9562 UUIDv5) for each PCI device ID. */
 static const struct xe_device_guid_entry xe_device_guids[] = {
 	{ 0x674C, GUID_INIT(0x9046afe5, 0x9041, 0x5124,
@@ -95,11 +100,14 @@ static u64 cper_timestamp_now(void)
 	return ts;
 }
 
-static void cper_init_intel_hdr(struct xe_device *xe, const struct xe_ras_error_class *counter,
+static void cper_init_intel_hdr(struct xe_device *xe, const union xe_cper_error_class *error_class,
 				u64 first_timestamp, u32 sig_id, u32 error_count,
 				u32 einfo_size, struct xe_cper_intel_hdr *ihdr)
 {
-	ihdr->counter = *counter;
+	BUILD_BUG_ON(sizeof(struct xe_ras_error_class) !=
+		     sizeof(struct xe_cper_driver_error_class));
+
+	ihdr->error_class = *error_class;
 	ihdr->validation_bits |= XE_CPER_VALID_LOCATION;
 	ihdr->sig_id = U32_MAX;
 
@@ -172,10 +180,14 @@ static void cper_init_section_desc(struct xe_device *xe, u8 severity,
 	}
 }
 
+/* TODO: Handle xe_log_* helper function for atomic context */
+/* Software CPER may be emitted from atomic context */
+#define XE_CPER_SW_GFP	(GFP_NOWAIT | __GFP_NOWARN)
+
 static void cper_record_emit(struct xe_device *xe, u8 severity,
 			     const guid_t *notification_type,
 			     const struct xe_cper_intel_hdr *ihdr,
-			     const void *einfo, u32 einfo_len)
+			     const void *einfo, u32 einfo_len, gfp_t gfp)
 {
 	struct cper_section_descriptor *sdesc;
 	struct xe_cper_nonstd_record *rec;
@@ -183,9 +195,13 @@ static void cper_record_emit(struct xe_device *xe, u8 severity,
 	u32 total_len;
 
 	total_len = sizeof(struct xe_cper_nonstd_record) + einfo_len;
-	rec = kzalloc(total_len, GFP_KERNEL);
-	if (!rec)
+	rec = kzalloc(total_len, gfp);
+	if (!rec) {
+		int total = atomic_inc_return(&xe->cper.dropped);
+
+		xe_warn_ratelimited(xe, "CPER: record dropped, total=%d\n", total);
 		return;
+	}
 
 	rhdr = &rec->record_hdr;
 	sdesc = &rec->section_desc;
@@ -461,14 +477,15 @@ void xe_cper_emit_counter(struct xe_device *xe, int cper_sev, enum xe_sigid sigi
 	}
 
 	for (i = 0; i < count; i++) {
+		union xe_cper_error_class error_class = { .counter = entries[i].hdr.counter };
 		struct xe_cper_intel_hdr ihdr = {};
 
-		cper_init_intel_hdr(xe, &entries[i].hdr.counter, entries[i].timestamp,
+		cper_init_intel_hdr(xe, &error_class, entries[i].timestamp,
 				    sigid, entries[i].hdr.error_count,
 				    entries[i].einfo_size, &ihdr);
 
 		cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_GPU_ERROR, &ihdr,
-				 entries[i].einfo, entries[i].einfo_size);
+				 entries[i].einfo, entries[i].einfo_size, GFP_KERNEL);
 	}
 
 	free_info_arr(info_arr, num_entries);
@@ -491,6 +508,36 @@ static void cper_emit_hw_err(struct xe_device *xe, int cper_sev, enum xe_sigid s
 	xe_cper_emit_counter(xe, cper_sev, sigid, &response);
 }
 
+static void cper_emit_sw_err(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
+			     u32 component, u32 location, const void *data,
+			     struct va_format *vaf)
+{
+	union xe_cper_error_class error_class = {};
+	struct xe_cper_intel_hdr ihdr = {};
+	struct xe_cper_driver_error_class *driver = &error_class.driver;
+	u64 timestamp;
+	char *msg;
+	size_t msg_len;
+
+	msg = kvasprintf(XE_CPER_SW_GFP, vaf->fmt, *vaf->va);
+	if (!msg)
+		xe_warn_ratelimited(xe, "CPER: message dropped\n");
+
+	driver->error_type = cper_sev;
+	driver->error_component = component;
+	driver->tile = location;
+	if (IS_ERR(data))
+		driver->cause = -PTR_ERR(data);
+
+	msg_len = msg ? strlen(msg) + 1 : 0;
+	timestamp = ktime_get_real_ns();
+
+	cper_init_intel_hdr(xe, &error_class, timestamp, sigid, 1, msg_len, &ihdr);
+	cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_DRV_ERROR, &ihdr, msg, msg_len,
+			 XE_CPER_SW_GFP);
+	kfree(msg);
+}
+
 /**
  * xe_cper_emit() - Emit a CPER record for a SIGID log entry
  * @xe: The &xe_device
@@ -519,12 +566,21 @@ void xe_cper_emit(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
 		  u32 component, u32 location, const void *data, size_t len,
 		  struct va_format *vaf)
 {
+	/* TODO: Handle using pdev instead of xe. */
+	if (!xe)
+		return;
+
 	if (is_hw_sigid(sigid) && !IS_ERR_OR_NULL(data)) {
 		cper_emit_hw_err(xe, cper_sev, sigid, data);
 		return;
 	}
 
-	/* TODO software CPER */
+	if (xe->info.has_driver_cper) {
+		if (is_sw_sigid(sigid) &&
+		    (cper_sev == CPER_SEV_RECOVERABLE || cper_sev == CPER_SEV_FATAL))
+			cper_emit_sw_err(xe, cper_sev, sigid, component, location, data, vaf);
+		return;
+	}
 }
 
 static ssize_t cper_on_query_show(struct device *dev, struct device_attribute *attr, char *buf)
diff --git a/drivers/gpu/drm/xe/xe_cper_types.h b/drivers/gpu/drm/xe/xe_cper_types.h
index 0748b7ec9464..500207bd2e75 100644
--- a/drivers/gpu/drm/xe/xe_cper_types.h
+++ b/drivers/gpu/drm/xe/xe_cper_types.h
@@ -6,6 +6,7 @@
 #ifndef _XE_CPER_TYPES_H_
 #define _XE_CPER_TYPES_H_
 
+#include <linux/atomic.h>
 #include <linux/cper.h>
 #include <linux/types.h>
 #include <linux/uuid.h>
@@ -45,11 +46,38 @@
 	GUID_INIT(0x4ae12aef, 0x8745, 0x5fc7, \
 		  0xb9, 0x96, 0x71, 0xee, 0xbb, 0x51, 0xf2, 0x23)
 
+#define INTEL_CPER_NOTIFY_DRV_ERROR \
+	GUID_INIT(0xcef7e934, 0x51e7, 0x535f, \
+		  0xa6, 0x78, 0x5a, 0x4c, 0xcc, 0xb6, 0x96, 0x09)
+
 /* Section Types */
 #define INTEL_CPER_SECTION_ACCEL_GENERIC \
 	GUID_INIT(0xea9d8f84, 0x4258, 0x5227, \
 		  0x80, 0x28, 0xb9, 0xb1, 0x3e, 0x6d, 0x58, 0xb0)
 
+/**
+ * struct xe_cper_driver_error_class - Intel GPU CPER driver-detected error classification
+ */
+struct xe_cper_driver_error_class {
+	/** @error_type: CPER severity: CPER_SEV_* */
+	u8  error_type;
+	/** @reserved0: Reserved, must be zero */
+	u8  reserved0;
+	/** @error_component: Driver component id: CLASS[7:0].TYPE[15:8] */
+	u16 error_component;
+	/** @tile: Driver location id: TYPE[7:0].ID[15:8] ('tile' and 'GT' field region) */
+	u16 tile;
+	/** @reserved1: Reserved, must be zero */
+	u16 reserved1;
+	/** @cause: errno of the failing operation, or 0 if none */
+	u32 cause;
+};
+
+/* Same size as the counter-sourced error_class */
+#define XE_CPER_ERROR_CLASS_SIZE	12
+
+static_assert(sizeof(struct xe_cper_driver_error_class) == XE_CPER_ERROR_CLASS_SIZE);
+
 /**
  * struct xe_cper_intel_hdr - Intel-specific CPER header
  *
@@ -57,8 +85,13 @@
  * All multi-byte fields are little-endian.
  */
 struct xe_cper_intel_hdr {
-	/** @counter: Error class (severity, component, location, cause) */
-	struct xe_ras_error_class counter;
+	/** @error_class: Error classification */
+	union xe_cper_error_class {
+		/** @error_class.counter: Error class (severity, component, location, cause) */
+		struct xe_ras_error_class counter;
+		/** @error_class.driver: Driver-detected error classification */
+		struct xe_cper_driver_error_class driver;
+	} error_class;
 	/** @first_timestamp: First occurrence of this error class, in ticks */
 	u64 first_timestamp;
 	/** @sig_id: Aggregated error class SIG ID; set to U32_MAX if unknown */
@@ -160,6 +193,8 @@ struct xe_cper_info_entry {
 struct xe_cper {
 	/** @on_query: Emit a CPER record on each RAS counter query */
 	bool on_query;
+	/** @dropped: Number of CPER records dropped due to allocation failure */
+	atomic_t dropped;
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 9e0d7d3d07d5..e38bc28404ff 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -171,6 +171,8 @@ struct xe_device {
 		u8 has_device_atomics_on_smem:1;
 		/** @info.has_device_uid: Device supports unique 64-bit GPU SOC ID */
 		u8 has_device_uid:1;
+		/** @info.has_driver_cper: Device supports driver-generated CPER records */
+		u8 has_driver_cper:1;
 		/** @info.has_drm_ras: Device supports drm_ras (Reliability, Availability, Serviceability) */
 		u8 has_drm_ras:1;
 		/** @info.has_fan_control: Device supports fan control */
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index eaac0b25b948..ac04a45ab13e 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -486,6 +486,7 @@ static const struct xe_device_desc cri_desc = {
 	.dma_mask_size = 52,
 	.has_display = false,
 	.has_device_uid = true,
+	.has_driver_cper = true,
 	.has_drm_ras = true,
 	.has_flat_ccs = false,
 	.has_gsc_nvm = 1,
@@ -814,6 +815,7 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.is_dgfx = desc->is_dgfx;
 	xe->info.has_cached_pt = desc->has_cached_pt;
 	xe->info.has_device_uid = desc->has_device_uid;
+	xe->info.has_driver_cper = desc->has_driver_cper;
 	xe->info.has_drm_ras = desc->has_drm_ras;
 	xe->info.has_fan_control = desc->has_fan_control;
 	xe->info.has_fixed_vram_channels = desc->has_fixed_vram_channels;
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index 90936f805d8f..177b963bfc5a 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -42,6 +42,7 @@ struct xe_device_desc {
 	u8 has_cached_pt:1;
 	u8 has_display:1;
 	u8 has_device_uid:1;
+	u8 has_driver_cper:1;
 	u8 has_drm_ras:1;
 	u8 has_fan_control:1;
 	u8 has_fixed_vram_channels:1;
diff --git a/drivers/gpu/drm/xe/xe_printk.h b/drivers/gpu/drm/xe/xe_printk.h
index 87f51d7edfa8..47886897b4ac 100644
--- a/drivers/gpu/drm/xe/xe_printk.h
+++ b/drivers/gpu/drm/xe/xe_printk.h
@@ -27,6 +27,9 @@
 #define xe_warn(_xe, _fmt, ...) \
 	xe_printk((_xe), warn, _fmt, ##__VA_ARGS__)
 
+#define xe_warn_ratelimited(_xe, _fmt, ...) \
+	xe_printk((_xe), warn_ratelimited, _fmt, ##__VA_ARGS__)
+
 #define xe_notice(_xe, _fmt, ...) \
 	xe_printk((_xe), notice, _fmt, ##__VA_ARGS__)
 
-- 
2.48.1

