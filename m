Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A8F606A333
	for <intel-xe@archiver.kernel.org>; Thu, 12 Nov 2026 13:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kSQ+NpuA
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D469410E5E9;
	Thu, 12 Nov 2026 13:47:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 617DC10EA4A
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Nov 2026 13:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794491248; x=1826027248;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=U9d3kMOhj3TK8HbRhyxc4nJP28EUiwNi5PNDfDpC4yQ=;
 b=kSQ+NpuAsBRdIsqCrMsBjgRO59Cfkac+zqPTM0J4e4UdZUlwfLEgQg2K
 5KgSEjQFY8WklUV5urXFSNri0kJjg0XWcUfApCnnyHEczibz02+6vBNLu
 DQ3W1oTXse7bmBo0K4XGsR3IbDG08aMA9ftHin+/ZzBqULYiSthLg8ovo
 LvWuCm23MOsFZv4GRiI0ve/BplnKaV4d+9DcQ3YThMa4fkXfIxVhm3cXn
 kaxxFVUBfrtIPJbdJwXJTAOJgwPny4R76C7wQvYXhhYZerRt9Rse1XgPY
 3m1AEEybnriJhrCT7VBmtCixMYr+Xl8/ILHj95z26JVHjqSesJNsw1Xvw g==;
X-CSE-ConnectionGUID: bN4naSg6SKiAogfhcWgavA==
X-CSE-MsgGUID: +hfGm2ACSGOtuMI3vgfGRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3306683"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3306683"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 05:47:05 -0800
X-CSE-ConnectionGUID: scTVRlyTToGUJK/+wofSxw==
X-CSE-MsgGUID: RAZB+NxUT6uP/3o1df2IXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8527909"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa005.jf.intel.com with ESMTP; 12 Nov 2026 05:47:01 -0800
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com,
 aravind.iddamsetty@linux.intel.com, jani.nikula@linux.intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v4 3/6] drm/xe/cper: Emit software CPER records
Date: Thu, 12 Nov 2026 19:16:40 +0530
Message-ID: <20261112134636.1860446-11-mallesh.koujalagi@intel.com>
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

Emit CPER records for software SIGIDs and attach the
formatted log message as record data.

Cc: Badal Nilawar <badal.nilawar@intel.com>
Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
v4:
- Emit complete message. (Badal/Aravind)
---
 drivers/gpu/drm/xe/xe_cper.c       | 9 +++++++++
 drivers/gpu/drm/xe/xe_cper_types.h | 4 ++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
index b23f8bc9f993..5a776aa571d0 100644
--- a/drivers/gpu/drm/xe/xe_cper.c
+++ b/drivers/gpu/drm/xe/xe_cper.c
@@ -258,7 +258,12 @@ static void cper_emit_sw_err(struct xe_device *xe, int cper_sev, enum xe_sigid s
 	union xe_cper_error_class error_class = {};
 	struct xe_cper_intel_hdr ihdr = {};
 	struct xe_cper_driver_error_class *driver = &error_class.driver;
+	char *msg = kvasprintf(GFP_KERNEL, vaf->fmt, *vaf->va);
 	u64 timestamp = ktime_get_real_ns();
+	size_t msg_len;
+
+	if (!msg)
+		return;
 
 	driver->error_type = cper_sev;
 	driver->error_component = component;
@@ -266,7 +271,11 @@ static void cper_emit_sw_err(struct xe_device *xe, int cper_sev, enum xe_sigid s
 	if (IS_ERR(data))
 		driver->cause = -PTR_ERR(data);
 
+	msg_len = strlen(msg) + 1;
+
 	cper_init_intel_hdr(xe, &error_class, timestamp, sigid, 1, &ihdr);
+	cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_DRV_ERROR, &ihdr, msg, msg_len);
+	kfree(msg);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_cper_types.h b/drivers/gpu/drm/xe/xe_cper_types.h
index 8e90a3220919..0178a5521212 100644
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

