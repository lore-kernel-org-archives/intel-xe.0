Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F37606A333
	for <intel-xe@archiver.kernel.org>; Thu, 12 Nov 2026 13:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=huDnWCRH
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85F3110E606;
	Thu, 12 Nov 2026 13:47:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ACF310E606
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Nov 2026 13:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794491250; x=1826027250;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nWhHt9nSCZPbAipHhOBzznhC6EVSPnjz+A5OroQZsmg=;
 b=huDnWCRH6CteEqRbrZVYxvm/GrcJ05qknSazjF32yoNNnEKPMX9gD/F1
 JAmBqYlHLXI7MPgpbdicSvBj0JoDBZhkUh8lSkap0q6CwRhDwIMIzUkcG
 pANk4zDDIU1GLyfOSlEdKooXUvvdTEsb5hyMMO8rs1GiBSpB6QSQcUCdy
 oAhzcv2Y+pCWlaG+/SPyOHn9V7FdTgfIK4XeWeWXuvi/UWrUvCvhGTY+k
 JO8wIt69ORPS3vChiv6xBLEpfClenF8zNB7xqjqrHgnxYMC4dpbDhWkuX
 vijzMcKsAbcA0TDzdoNQv6WDH9Af4BfXm6NZW1paywNFbPvqw56Sz/S4O g==;
X-CSE-ConnectionGUID: 9viWkZRsSc+Ftf6w2G1rrA==
X-CSE-MsgGUID: SBE6bOOSSiK1aff7aU8RBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3306721"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3306721"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 05:47:11 -0800
X-CSE-ConnectionGUID: R3hrhSeZSpixHrxjeExZEQ==
X-CSE-MsgGUID: y+4ydl74RqGrC3tjAXYvNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8527916"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa005.jf.intel.com with ESMTP; 12 Nov 2026 05:47:08 -0800
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com,
 aravind.iddamsetty@linux.intel.com, jani.nikula@linux.intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v4 5/6] drm/xe/log: Add software CPER information to KUnit
 output
Date: Thu, 12 Nov 2026 19:16:42 +0530
Message-ID: <20261112134636.1860446-13-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112134636.1860446-8-mallesh.koujalagi@intel.com>
References: <20261112134636.1860446-8-mallesh.koujalagi@intel.com>
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

Cc: Badal Nilawar <badal.nilawar@intel.com>
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

