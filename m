Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2F1606A31B
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 16:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=U6SbxxVR
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A984010FECB;
	Wed, 21 Oct 2026 16:25:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECDE410FECB
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Oct 2026 16:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792599936; x=1824135936;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+uP2vQWcCwlqRXYL1bvoybRTbHw1PikfKInyAOlX7ws=;
 b=U6SbxxVRTduVWOOSxya2cKGZhtN97J3Dy+fRSBzIVri3/9uR5JlWgZBE
 T6trE3cx2OKj3vkg4Rnfv1Dmr40/oQPrtPlUkpgGS41rYDNTmbTEIpjtv
 bHY9ZOPDqdm0fsey21xQ/eGEkDgPuAcSBWl/nMyEHyD5jmTQCKqQEFeI8
 VYkfOLLJO7Jo6Ifu9KFnpA2WdRPD2JCSyGpA6jSPiekxuiTSgefIZuizY
 Rtmg+UpWQNx4AxCvWZVR6aZs9HTLsxSPMz/imrOwV6OEUS//a7m3aHmuJ
 pwxZN79aAzov58IxUoSTQE39N53VUFuJpQ7KGtRLpEOvSRKjAtCh8yUh7 g==;
X-CSE-ConnectionGUID: siu5VY39Q0mjiW4II9DZlg==
X-CSE-MsgGUID: qyNe9r0jQqKXT5drH8vQog==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1428276"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1428276"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 09:25:36 -0700
X-CSE-ConnectionGUID: 5Gk3143kRnaUVdQjrscOPA==
X-CSE-MsgGUID: N5iEZqJqR6qVdDnSZJmLYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3468914"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa007.fm.intel.com with ESMTP; 21 Oct 2026 09:25:33 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@linux.intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH 2/5] drm/xe/cper: Add driver error classification definitions
Date: Wed, 21 Oct 2026 21:55:10 +0530
Message-ID: <20261021162508.265700-9-mallesh.koujalagi@intel.com>
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add definitions for driver-detected CPER error classification,
including xe_cper_driver_error_class, a common union for raw and
typed access, and the INTEL_CPER_NOTIFY_DRV_ERROR notification GUID.

These definitions will be used for software-generated CPER records.

Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 drivers/gpu/drm/xe/xe_cper_types.h | 41 ++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_cper_types.h b/drivers/gpu/drm/xe/xe_cper_types.h
index e0034429e661..5e7bceef703e 100644
--- a/drivers/gpu/drm/xe/xe_cper_types.h
+++ b/drivers/gpu/drm/xe/xe_cper_types.h
@@ -41,6 +41,10 @@
 	GUID_INIT(0x4ae12aef, 0x8745, 0x5fc7, \
 		  0xb9, 0x96, 0x71, 0xee, 0xbb, 0x51, 0xf2, 0x23)
 
+#define INTEL_CPER_NOTIFY_DRV_ERROR \
+	GUID_INIT(0xcef7e934, 0x51e7, 0x535f, \
+		  0xa6, 0x78, 0x5a, 0x4c, 0xcc, 0xb6, 0x96, 0x09)
+
 /* Section Types */
 #define INTEL_CPER_SECTION_ACCEL_GENERIC \
 	GUID_INIT(0xea9d8f84, 0x4258, 0x5227, \
@@ -66,6 +70,43 @@ struct xe_cper_error_class {
 	u8  reserved;
 };
 
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
+/**
+ * union xe_cper_error_class_u - RAS counter-sourced or driver-sourced error classification
+ */
+union xe_cper_error_class_u {
+	/** @ras: RAS counter-sourced error classification */
+	struct xe_cper_error_class ras;
+	/** @driver: Driver-detected (software) error classification */
+	struct xe_cper_driver_error_class driver;
+	/** @raw: Raw byte view */
+	u8 raw[XE_CPER_ERROR_CLASS_SIZE];
+};
+
+static_assert(sizeof(struct xe_cper_error_class) == XE_CPER_ERROR_CLASS_SIZE);
+static_assert(sizeof(struct xe_cper_driver_error_class) == XE_CPER_ERROR_CLASS_SIZE);
+static_assert(sizeof(union xe_cper_error_class_u) == XE_CPER_ERROR_CLASS_SIZE);
+
 /**
  * struct xe_cper_sec_intel_err_hdr - Intel-specific CPER error section header
  *
-- 
2.48.1

