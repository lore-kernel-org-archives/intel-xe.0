Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C824606A31E
	for <intel-xe@archiver.kernel.org>; Wed, 25 Nov 2026 10:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZH3zV0+C
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6497810FAA0;
	Wed, 25 Nov 2026 10:07:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8F3510E865
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Nov 2026 10:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795601254; x=1827137254;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=79Ts93vRD56nUGx6w7SEKtRChFuZyixUHOFHWtNoVn0=;
 b=ZH3zV0+CP8lCFf1o1DdBmZs0EKKnaZ9Zh70rzI1Ad4PJEZKELAhh7CFG
 g4jnQ597KlEkNu8SXzqLwF7yat9+l4D/tEaWIV6BB/EaHud5i24UwObKh
 e0x8pgC6ITPCszA3Tr57ICxrktmEuCQUmm1r58sZqwQI8Qyx4wFTlINBE
 JJVntZyoRuLi/jNaiF1IEhaV1Up1+33SDa6WlRA1IjiinpGD1ajmGPKzu
 CBalGxPtIbHyFwYsXjd8RYTNTsyETmhk4NPZFvmbIjqkiZ7SieMc8GzXe
 2aKrGZnZ5XAm0m4PjH9rpatHaIkMojckQkSvUBtmPGkFpFaVTuyJjX4b2 w==;
X-CSE-ConnectionGUID: fB+jPrmkSqW7ln5gJ6FI6w==
X-CSE-MsgGUID: HjmuAsGOSkmWIqjphz+1yQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4450559"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4450559"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 02:07:34 -0800
X-CSE-ConnectionGUID: ZXSXoyyQSMqfkM9qhcVapA==
X-CSE-MsgGUID: BgU9GHVeRjyCDVSkf4UO1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; d="scan'208";a="12136398"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa007.fm.intel.com with ESMTP; 25 Nov 2026 02:07:30 -0800
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com,
 aravind.iddamsetty@linux.intel.com, jani.nikula@linux.intel.com,
 daniele.ceraolospurio@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v6 2/6] drm/xe/cper: Prepare CPER headers for software errors
Date: Wed, 25 Nov 2026 15:37:18 +0530
Message-ID: <20261125100716.2151294-10-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125100716.2151294-8-mallesh.koujalagi@intel.com>
References: <20261125100716.2151294-8-mallesh.koujalagi@intel.com>
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

Add software error classification support and reuse the
common CPER header initialization path.

Cc: Badal Nilawar <badal.nilawar@intel.com>
Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
---
v2:
- Move union inside xe_cper_intel_hdr structure. (Badal)

v3:
- Introduce structure where it's used. (Badal)
- Move error-class union inside cper_init_intel_hdr. (Badal)

v4:
- Update commit message. (Badal)
- Use ktime_get_real_ns.
- Add BUILD_BUG_ON. (Raag)

v5:
- Call timestamp near to use. (Badal)
---
 drivers/gpu/drm/xe/xe_cper.c       | 23 ++++++++++++++++++---
 drivers/gpu/drm/xe/xe_cper_types.h | 32 ++++++++++++++++++++++++++++--
 2 files changed, 50 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
index d75b867940ad..dec2e4d004b7 100644
--- a/drivers/gpu/drm/xe/xe_cper.c
+++ b/drivers/gpu/drm/xe/xe_cper.c
@@ -100,11 +100,14 @@ static u64 cper_timestamp_now(void)
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
 
@@ -466,9 +469,10 @@ void xe_cper_emit_counter(struct xe_device *xe, int cper_sev, enum xe_sigid sigi
 	}
 
 	for (i = 0; i < count; i++) {
+		union xe_cper_error_class error_class = { .counter = entries[i].hdr.counter };
 		struct xe_cper_intel_hdr ihdr = {};
 
-		cper_init_intel_hdr(xe, &entries[i].hdr.counter, entries[i].timestamp,
+		cper_init_intel_hdr(xe, &error_class, entries[i].timestamp,
 				    sigid, entries[i].hdr.error_count,
 				    entries[i].einfo_size, &ihdr);
 
@@ -500,6 +504,19 @@ static void cper_emit_sw_err(struct xe_device *xe, int cper_sev, enum xe_sigid s
 			     u32 component, u32 location, const void *data,
 			     struct va_format *vaf)
 {
+	union xe_cper_error_class error_class = {};
+	struct xe_cper_intel_hdr ihdr = {};
+	struct xe_cper_driver_error_class *driver = &error_class.driver;
+	u64 timestamp;
+
+	driver->error_type = cper_sev;
+	driver->error_component = component;
+	driver->tile = location;
+	if (IS_ERR(data))
+		driver->cause = -PTR_ERR(data);
+
+	timestamp = ktime_get_real_ns();
+	cper_init_intel_hdr(xe, &error_class, timestamp, sigid, 1, 0, &ihdr);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_cper_types.h b/drivers/gpu/drm/xe/xe_cper_types.h
index 0748b7ec9464..dde008803c23 100644
--- a/drivers/gpu/drm/xe/xe_cper_types.h
+++ b/drivers/gpu/drm/xe/xe_cper_types.h
@@ -50,6 +50,29 @@
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
@@ -57,8 +80,13 @@
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
-- 
2.48.1

