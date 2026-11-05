Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295D7606A331
	for <intel-xe@archiver.kernel.org>; Thu,  5 Nov 2026 08:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=R/E+FIPG
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9986112269;
	Thu,  5 Nov 2026 08:54:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B667112269
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Nov 2026 08:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793868849; x=1825404849;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WBG0zazN9zO0sE9Rjz14qzHY1i/GCs+CiHIn2VBA808=;
 b=R/E+FIPGRO7aQAsq5moRv0lh2rL7DPj2eLMJr9u2tBjgD7p9vz1s+C6W
 z7Lqd41p1IqS3ryPhMC6i5vy3dh8Ly2+d7hGb7XDdFy+6lklEzPJ4GUW5
 aLofl1BZce6RqbvSGF1Gsm509VGnDEUO4zEdWpiP8jmI0ubGkXeEAyY/0
 0fjH1Ij4DNOFDRQbeM0UR+aE4MrF6wJf+8NvCl7vN7fJ/yMVYyBX0ZWdc
 ASdYIABw31ts2AnmtPQyg97dNgVuEaRhevfMnQFzqZZRCxmrOKGWV8hh0
 3GDh/yAdBFBv1t/491m1VmVnsHJwqJxoqcwv2iI7V4piienfkBez43QXs w==;
X-CSE-ConnectionGUID: 0NYNkspCQr2XynhW3VMFZw==
X-CSE-MsgGUID: conl+/UkRPyZFlQcc1hHSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2641566"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2641566"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 00:54:09 -0800
X-CSE-ConnectionGUID: mM6tCR/uTduEel2QbuVndA==
X-CSE-MsgGUID: amhhI7ivSzu8eg79gqaN1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="8721572"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa011.fm.intel.com with ESMTP; 05 Nov 2026 00:54:06 -0800
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com,
 aravind.iddamsetty@linux.intel.com, jani.nikula@linux.intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v3 3/6] drm/xe/cper: Emit software CPER records
Date: Thu,  5 Nov 2026 14:23:52 +0530
Message-ID: <20261105085348.1467925-11-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105085348.1467925-8-mallesh.koujalagi@intel.com>
References: <20261105085348.1467925-8-mallesh.koujalagi@intel.com>
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

Emit CPER records for software SIGIDs and attach the
formatted log message as record data.

Cc: Badal Nilawar <badal.nilawar@intel.com>
Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 drivers/gpu/drm/xe/xe_cper.c       | 12 ++++++++++++
 drivers/gpu/drm/xe/xe_cper_types.h |  4 ++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
index 10aa10bbf282..9510dcd1754c 100644
--- a/drivers/gpu/drm/xe/xe_cper.c
+++ b/drivers/gpu/drm/xe/xe_cper.c
@@ -248,6 +248,13 @@ static void cper_emit_hw_err(struct xe_device *xe, int cper_sev, enum xe_sigid s
 	xe_cper_emit_counter(xe, cper_sev, sigid, counter, &response);
 }
 
+#define XE_CPER_SW_MSG_MAX	256
+
+static size_t cper_format_sw_msg(struct va_format *vaf, char *buf, size_t size)
+{
+	return scnprintf(buf, size, "%pV", vaf) + 1;
+}
+
 static void cper_emit_sw_err(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
 			     u32 component, u32 location, const void *data,
 			     struct va_format *vaf)
@@ -256,6 +263,8 @@ static void cper_emit_sw_err(struct xe_device *xe, int cper_sev, enum xe_sigid s
 	struct xe_cper_intel_hdr ihdr = {};
 	struct xe_cper_driver_error_class *driver = &error_class.driver;
 	u64 timestamp = ktime_get_boottime_ns();
+	char msg[XE_CPER_SW_MSG_MAX];
+	size_t msg_len;
 
 	driver->error_type = cper_sev;
 	driver->error_component = component;
@@ -263,7 +272,10 @@ static void cper_emit_sw_err(struct xe_device *xe, int cper_sev, enum xe_sigid s
 	if (IS_ERR(data))
 		driver->cause = -PTR_ERR(data);
 
+	msg_len = cper_format_sw_msg(vaf, msg, sizeof(msg));
+
 	cper_init_intel_hdr(xe, &error_class, timestamp, sigid, 1, &ihdr);
+	cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_DRV_ERROR, &ihdr, msg, msg_len);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_cper_types.h b/drivers/gpu/drm/xe/xe_cper_types.h
index d8581992dc45..268995a537c4 100644
--- a/drivers/gpu/drm/xe/xe_cper_types.h
+++ b/drivers/gpu/drm/xe/xe_cper_types.h
@@ -40,6 +40,10 @@
 	GUID_INIT(0x4ae12aef, 0x8745, 0x5fc7, \
 		  0xb9, 0x96, 0x71, 0xee, 0xbb, 0x51, 0xf2, 0x23)
 
+#define INTEL_CPER_NOTIFY_DRV_ERROR \
+	GUID_INIT(0xcef7e934, 0x51e7, 0x535f, \
+		  0xa6, 0x78, 0x5a, 0x4c, 0xcc, 0xb6, 0x96, 0x09)
+
 /* Section Types */
 #define INTEL_CPER_SECTION_ACCEL_GENERIC \
 	GUID_INIT(0xea9d8f84, 0x4258, 0x5227, \
-- 
2.48.1

