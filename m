Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA0B606A31E
	for <intel-xe@archiver.kernel.org>; Fri, 27 Nov 2026 09:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jMPYaedq
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E5A910E707;
	Fri, 27 Nov 2026 09:29:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C58210E5A5
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Nov 2026 09:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795771775; x=1827307775;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4JxL23UINJtvL1C4X3ZhquH2Q+NC1W9/mTf7Wc3hgrg=;
 b=jMPYaedqfiw3gIeP6mQWQ/oQlKtDlVujftghR9m5+FV2Yt+tr/DCwc3A
 omucXHZiXrXDU/RuQVSdXnkfz3hrRlOdcevwr0FHLgcumzls6DkwW5gBA
 bJJkewCnE7YrNJm1jsxiIbzxXZ4W0kKbVEA8h88KwZCSFPdvpTjcdTcFk
 6u88CLfn/3GXUY6+p15QdELfants7D1/9GDkR5OWjtYmPgRkb550qNdMq
 dRse5E9sUJsCHEibux2VCGRcBLhBeaUz1I69hxuoxJot4V8V58AX0zOKB
 yHiwkC+SrU3gQPIALAM47gg1WXmYWQXdVKos4HWo7OkrY06TPRxsV9oNa w==;
X-CSE-ConnectionGUID: q571Jrd2RPa2IJLz2m+mSA==
X-CSE-MsgGUID: +gyqcAm0RbG1I6EDFgACcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4678865"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4678865"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 01:29:35 -0800
X-CSE-ConnectionGUID: SoJwi2hnRE6755t30yOjTQ==
X-CSE-MsgGUID: rRmaKdWATy676A5hj+kqog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; d="scan'208";a="12276153"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa003.jf.intel.com with ESMTP; 27 Nov 2026 01:29:32 -0800
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com,
 aravind.iddamsetty@linux.intel.com, jani.nikula@linux.intel.com,
 daniele.ceraolospurio@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v7 3/6] drm/xe/cper: Emit software CPER records
Date: Fri, 27 Nov 2026 14:59:17 +0530
Message-ID: <20261127092914.2176025-11-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127092914.2176025-8-mallesh.koujalagi@intel.com>
References: <20261127092914.2176025-8-mallesh.koujalagi@intel.com>
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
formatted log message as info data.

Cc: Badal Nilawar <badal.nilawar@intel.com>
Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
---
v4:
- Emit complete message. (Badal/Aravind)

v5:
- Move initialization closer to use. (Badal)
- Warn if CPER Message allocation failed.
- Emit CPER record header without msg if allocation failed.

v6:
- s/record data/info data/. (Badal)
---
 drivers/gpu/drm/xe/xe_cper.c       | 12 +++++++++++-
 drivers/gpu/drm/xe/xe_cper_types.h |  4 ++++
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
index dec2e4d004b7..9161f2b52e9b 100644
--- a/drivers/gpu/drm/xe/xe_cper.c
+++ b/drivers/gpu/drm/xe/xe_cper.c
@@ -508,6 +508,12 @@ static void cper_emit_sw_err(struct xe_device *xe, int cper_sev, enum xe_sigid s
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
@@ -515,8 +521,12 @@ static void cper_emit_sw_err(struct xe_device *xe, int cper_sev, enum xe_sigid s
 	if (IS_ERR(data))
 		driver->cause = -PTR_ERR(data);
 
+	msg_len = msg ? strlen(msg) + 1 : 0;
 	timestamp = ktime_get_real_ns();
-	cper_init_intel_hdr(xe, &error_class, timestamp, sigid, 1, 0, &ihdr);
+
+	cper_init_intel_hdr(xe, &error_class, timestamp, sigid, 1, msg_len, &ihdr);
+	cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_DRV_ERROR, &ihdr, msg, msg_len);
+	kfree(msg);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_cper_types.h b/drivers/gpu/drm/xe/xe_cper_types.h
index dde008803c23..5cfa32c75764 100644
--- a/drivers/gpu/drm/xe/xe_cper_types.h
+++ b/drivers/gpu/drm/xe/xe_cper_types.h
@@ -45,6 +45,10 @@
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

