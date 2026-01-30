Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 109FBE6BF12
	for <intel-xe@archiver.kernel.org>; Fri, 30 Jan 2026 13:37:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B74410E9E5;
	Fri, 30 Jan 2026 13:37:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NJ72nJFG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A02AA10E11C
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Jan 2026 13:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769780221; x=1801316221;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YVvZSqlNe+LpcfDUT61xt9mmYadjgHe9K11uCMOWaH4=;
 b=NJ72nJFGvu8LyvJRztYniEwje9DW6IDsf3D0J78o9xCIXBrkoJ3XIXKB
 YR2eLv1xbuLKPDWnNEXxMO03xmlN60zH0KQSVoQsx754T68YqqqsjzzYN
 d761dMXR9xtvHvzFB+dT8gM+cu+oe0p6x7dErZ0ETiKNFHPVrRJe7mTG0
 QB3UIn+1F90Ci81xDYMHzWHENWC6ozpemoLqcpYCLgVJ//VUTP7quIUEe
 Xf4CUQ3QahqZqlcA2uLEK7tz7NFrYUxufDozACF4CcteKGBitNdz3PZIP
 vm3h+Cv9i+MGCNyqmlYQUuNCWGRykuFRWEpmwN3zkk1qEU2VQaXFdmTMA w==;
X-CSE-ConnectionGUID: KcFteDn3R7OvJe0DTPdmtg==
X-CSE-MsgGUID: aLW7TgcYSYuM598tvILD5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="71194396"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="71194396"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 05:37:01 -0800
X-CSE-ConnectionGUID: T7STb+e/QIu3AYSsAY3T6A==
X-CSE-MsgGUID: aVXudVYARgq/uKcDqgypsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="207983242"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com)
 ([10.124.220.170])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 05:36:59 -0800
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org,
 hansg@kernel.org, ilpo.jarvinen@linux.intel.com, matthew.brost@intel.com,
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com,
 airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com
Cc: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Subject: [PATCH v2 3/5] drm/xe/vsec: Support Crescent Island PMT
Date: Fri, 30 Jan 2026 08:36:43 -0500
Message-ID: <20260130133639.765378-10-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260130133639.765378-7-michael.j.ruhl@intel.com>
References: <20260130133639.765378-7-michael.j.ruhl@intel.com>
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

Crescent Island (CRI) supports PMT telemetry and crashlog.

Add Crescent Island (CRI) discovery structure (DVSEC) information to
allow for Xe registration.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_pmt.h |  5 ++++
 drivers/gpu/drm/xe/xe_vsec.c     | 43 ++++++++++++++++++++++++++++++--
 2 files changed, 46 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_pmt.h b/drivers/gpu/drm/xe/regs/xe_pmt.h
index 240d57993ea6..874f44b79780 100644
--- a/drivers/gpu/drm/xe/regs/xe_pmt.h
+++ b/drivers/gpu/drm/xe/regs/xe_pmt.h
@@ -18,6 +18,11 @@
 #define BMG_TELEMETRY_BASE_OFFSET	0xE0000
 #define BMG_TELEMETRY_OFFSET		(SOC_BASE + BMG_TELEMETRY_BASE_OFFSET)
 
+#define CRI_TELEMETRY_BASE_OFFSET	0xE0000
+/* for CRI discovery and telemetry are in an indexed window */
+#define CRI_DISCOVERY_OFFSET		(SOC_BASE + CRI_TELEMETRY_BASE_OFFSET)
+#define CRI_TELEMETRY_OFFSET		(SOC_BASE + CRI_TELEMETRY_BASE_OFFSET)
+
 #define BMG_MODS_RESIDENCY_OFFSET		(0x4D0)
 #define BMG_G2_RESIDENCY_OFFSET		(0x530)
 #define BMG_G6_RESIDENCY_OFFSET		(0x538)
diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index 44607f1eaa88..254f7ebca6eb 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -19,8 +19,16 @@
 
 #include "regs/xe_pmt.h"
 
-/* PMT GUID value for BMG devices.  NOTE: this is NOT a PCI id */
+/* PMT GUID value for BMG and CRI devices.  NOTE: this is NOT a PCI id */
 #define BMG_DEVICE_ID 0xE2F8
+#define CRI_DEVICE_ID 0xE2F9
+
+/*
+ * sizeof(Crashlog Type1 Version2) = 0x18 (24) bytes
+ * For BMG and CRI crashlogs are consecutive and start at 0x60.
+ */
+#define PUNIT_DISC_OFFSET 0x60
+#define OOBMSM_DISC_OFFSET (PUNIT_DISC_OFFSET + 0x18)
 
 static struct intel_vsec_header bmg_telemetry = {
 	.rev = 1,
@@ -39,7 +47,7 @@ static struct intel_vsec_header bmg_crashlog = {
 	.num_entries = 2,
 	.entry_size = 6,
 	.tbir = 0,
-	.offset = BMG_DISCOVERY_OFFSET + 0x60,
+	.offset = BMG_DISCOVERY_OFFSET + PUNIT_DISC_OFFSET,
 };
 
 static struct intel_vsec_header *bmg_capabilities[] = {
@@ -48,9 +56,36 @@ static struct intel_vsec_header *bmg_capabilities[] = {
 	NULL
 };
 
+static struct intel_vsec_header cri_telemetry = {
+	.rev = 1,
+	.length = 0x10,
+	.id = VSEC_ID_TELEMETRY,
+	.num_entries = 3,
+	.entry_size = 4,
+	.tbir = 0,
+	.offset = CRI_DISCOVERY_OFFSET,
+};
+
+static struct intel_vsec_header cri_crashlog = {
+	.rev = 1,
+	.length = 0x10,
+	.id = VSEC_ID_CRASHLOG,
+	.num_entries = 2,
+	.entry_size = 6,
+	.tbir = 0,
+	.offset = CRI_DISCOVERY_OFFSET + PUNIT_DISC_OFFSET,
+};
+
+static struct intel_vsec_header *cri_capabilities[] = {
+	&cri_telemetry,
+	&cri_crashlog,
+	NULL
+};
+
 enum xe_vsec {
 	XE_VSEC_UNKNOWN = 0,
 	XE_VSEC_BMG,
+	XE_VSEC_CRI,
 };
 
 static struct intel_vsec_platform_info xe_vsec_info[] = {
@@ -58,6 +93,10 @@ static struct intel_vsec_platform_info xe_vsec_info[] = {
 		.caps = VSEC_CAP_TELEMETRY | VSEC_CAP_CRASHLOG,
 		.headers = bmg_capabilities,
 	},
+	[XE_VSEC_CRI] = {
+		.caps = VSEC_CAP_TELEMETRY | VSEC_CAP_CRASHLOG,
+		.headers = cri_capabilities,
+	},
 	{ }
 };
 
-- 
2.52.0

