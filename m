Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0392D606A325
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 06:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eRkxRhFg
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A92C410E8CA;
	Thu, 19 Nov 2026 06:00:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3F1F10E69A
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Nov 2026 06:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795068044; x=1826604044;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rar6qpRq0MS4A67wneBZaNdT4/PJTra9JMAIB/iGZks=;
 b=eRkxRhFgwOjCP2pBhfqlNYf88dhSZXA/1j4jmvOLrSNnPpVuu+RES0ha
 i1rzaYXW3fzQ8D30BSjlXbpQX3v1xv5yz3JWyuMlXRDAcUmauW6Wq28PI
 bj0lTkwlTQcX7PpU7XEXNhOS+wicFRpcH4E8NcCIDps4fUS0BhXm0A+o+
 IhhG0HIFrT0Jz6+DKSjXIJ7I1J9GQRH+v9k7X1xmvSMKd2An+iG94Vob4
 xkgu/TrDbJRck861VqVDT8fRnIf/nFe76136VVO/hwwdoYYK27meZuOz9
 Gqlcmm/gGKIIRzI2U0KK0nh1B6L7AtroOoJkemeGe8FO7vuSfTXfK1zJG g==;
X-CSE-ConnectionGUID: 8BhFRlW9Tjyar3l+QMjt6g==
X-CSE-MsgGUID: MIILiE16T4CD0iHRm0fEcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3789263"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3789263"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 22:00:44 -0800
X-CSE-ConnectionGUID: pOQ8a4qATaq42Yw+yli0ag==
X-CSE-MsgGUID: LKC5j45rSpmG2Hq19cgO3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; d="scan'208";a="10236734"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa005.jf.intel.com with ESMTP; 18 Nov 2026 22:00:41 -0800
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com,
 aravind.iddamsetty@linux.intel.com, jani.nikula@linux.intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v5 3/6] drm/xe/cper: Emit software CPER records
Date: Thu, 19 Nov 2026 11:30:23 +0530
Message-ID: <20261119060019.2031897-11-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119060019.2031897-8-mallesh.koujalagi@intel.com>
References: <20261119060019.2031897-8-mallesh.koujalagi@intel.com>
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
v4:
- Emit complete message. (Badal/Aravind)

v5:
- Move initialization closer to use. (Badal)
- Warn if CPER Message allocation failed.
- Emit CPER record header without msg if allocation failed.
---
 drivers/gpu/drm/xe/xe_cper.c       | 10 ++++++++++
 drivers/gpu/drm/xe/xe_cper_types.h |  4 ++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
index 4cb83896c6b5..558f58694511 100644
--- a/drivers/gpu/drm/xe/xe_cper.c
+++ b/drivers/gpu/drm/xe/xe_cper.c
@@ -258,6 +258,12 @@ static void cper_emit_sw_err(struct xe_device *xe, int cper_sev, enum xe_sigid s
 	struct xe_cper_intel_hdr ihdr = {};
 	struct xe_cper_driver_error_class *driver = &error_class.driver;
 	u64 timestamp;
+	char *msg;
+	size_t msg_len;
+
+	msg = kvasprintf(GFP_KERNEL, vaf->fmt, *vaf->va);
+	if (!msg)
+		xe_warn(xe, "Failed to allocate CPER message\n");
 
 	driver->error_type = cper_sev;
 	driver->error_component = component;
@@ -265,8 +271,12 @@ static void cper_emit_sw_err(struct xe_device *xe, int cper_sev, enum xe_sigid s
 	if (IS_ERR(data))
 		driver->cause = -PTR_ERR(data);
 
+	msg_len = msg ? strlen(msg) + 1 : 0;
 	timestamp = ktime_get_real_ns();
+
 	cper_init_intel_hdr(xe, &error_class, timestamp, sigid, 1, &ihdr);
+	cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_DRV_ERROR, &ihdr, msg, msg_len);
+	kfree(msg);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_cper_types.h b/drivers/gpu/drm/xe/xe_cper_types.h
index c9ea8b1694a9..88a83ef86b23 100644
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

