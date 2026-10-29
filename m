Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84583606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 13:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VBe6wPWY
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 497641122C1;
	Thu, 29 Oct 2026 13:26:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 677501122B0
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Oct 2026 13:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793280399; x=1824816399;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w2vJPjrWYYPokkofhPKZdOz0hXfU1iDdXo0erb1c8ic=;
 b=VBe6wPWYBEUKrmAE3I5Dpa4Rb65pZOd2dwX2V0Hr8G0NsxgfWCb1mAta
 uGbkynkpc1r/6rYL1+COZX4ofH52Ab93gMh5ahTs6NE7i2rlnT376eISw
 xb0m/kpnISqzPmMMK5gkND7+mQH3rTZkc8n0Ob9zp80xAvoqz1Qf+v5Ne
 EDhAuVRDHFub7MHr03yTs4zMFaTNRKhve4XqwHx8jmkdxJH60O/sZr68M
 +kI6L7QyTOzK0tj0JxENj5wO0sLI1QC3e4fR3C6Aa1xuwmiZjOND74CM0
 /r53otgFVL+cHloZVoWlEViNXnx41XuESR+YGFfsgJM4SqDMyvMslLCsP g==;
X-CSE-ConnectionGUID: +d2k2HbfRyaMbMmXfHT95A==
X-CSE-MsgGUID: tRFw+ROrTC2vN4LLzNHHVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1900367"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1900367"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 06:26:39 -0700
X-CSE-ConnectionGUID: uUQ0PoAPQ7KTOF2VE6TujQ==
X-CSE-MsgGUID: w0NMGHHRRS+YxQ2J/Xwf4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5691702"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa010.fm.intel.com with ESMTP; 29 Oct 2026 06:26:34 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@linux.intel.com, jani.nikula@linux.intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v2 5/6] drm/xe/log: Add software CPER information to KUnit
 output
Date: Thu, 29 Oct 2026 18:56:15 +0530
Message-ID: <20261029132609.907017-13-mallesh.koujalagi@intel.com>
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

Display driver classification details for software CPER records
in the fake CPER emitter used by KUnit tests.

Assisted-by: LLM
Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_log_kunit.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_log_kunit.c b/drivers/gpu/drm/xe/tests/xe_log_kunit.c
index 56c36c8a08e1..08828ecc9098 100644
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
 
-- 
2.48.1

