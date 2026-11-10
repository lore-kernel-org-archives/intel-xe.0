Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0B8606A320
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 18:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cD7+L8AA
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E244B10EE74;
	Tue, 10 Nov 2026 18:35:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6243210E321
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Nov 2026 18:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794335742; x=1825871742;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=6PCfL60CID1xaMOcfvo2tJvxAAGcKcQpVIMX+t6wRV0=;
 b=cD7+L8AAfMG7p1PDdMzcQ6N4OTW21uurWnXJ2ZUGLI/WCgWUuhayfhcg
 i26zvgf3HKEkHy9E+HSpcXycS/9F9UXVEGhQEZiqw/KKPv0VSpuGTyAWH
 Koyjl5aKU/bC86bsA/YwjVEMGV9jUMBGvMwZvlYZiNDO3LaXDb+pi0TuK
 wgA6/sN0zaYN4/G5RYMj5gtF7N3wz5CTXFQDgQdoYSBVaWc+z1DUCzDlm
 bQjhRZJnr0eppkRvu9DBuXKOPDqu3XQDpv8SvihvOAurznXjbj5Q+28WS
 slEKvE/owGPiewzpKX7byyS4U0uy/gESnvNl8XfSnvXzNRBtdC3LKG0l9 Q==;
X-CSE-ConnectionGUID: cL7z2uKhRteSjfzfOKwhow==
X-CSE-MsgGUID: 6te2Y18xQja4bVfVoiyGRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="2990125"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="2990125"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 10:35:18 -0800
X-CSE-ConnectionGUID: c8BOqt7RQdeMZ/iBs6+UbA==
X-CSE-MsgGUID: xW7qAadkR5eL5sFDOav3CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8253157"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 10:35:18 -0800
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com,
 airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com,
 anoop.c.vijay@intel.com, badal.nilawar@intel.com,
 matthew.d.roper@intel.com, james.ausmus@intel.com
Subject: [PATCH v14 17/17] drm/xe/vsec: Support survivability mode for CRI
Date: Tue, 10 Nov 2026 10:35:22 -0800
Message-ID: <20261110183505.694124-36-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110183505.694124-19-michael.j.ruhl@intel.com>
References: <20261110183505.694124-19-michael.j.ruhl@intel.com>
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

For survivability mode, CRI can only support access to the
PUNIT CRASHLOG PMT function.

Create a special config to support survivability mode.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  2 ++
 drivers/gpu/drm/xe/xe_vsec.c         | 34 +++++++++++++++++++++++++++-
 2 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index a35a8b6e733e..5d4548d86376 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -492,6 +492,8 @@ struct xe_device {
 		u32 retry_count;
 		/** @pmt.punit_guid_cache: cache of the PUNIT GUID */
 		u32 punit_guid_cache;
+		/** @pmt.survivability_mode: cache of survivability mode state */
+		bool survivability_mode;
 	} pmt;
 
 	/** @soc_remapper: SoC remapper object */
diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index f27bfe8218d7..ffaed9ef43b2 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -101,10 +101,26 @@ static struct intel_vsec_header *cri_capabilities[] = {
 	NULL
 };
 
+static struct intel_vsec_header cri_survivability_crashlog = {
+	.rev = 1,
+	.length = SZ_16,
+	.id = VSEC_ID_CRASHLOG,
+	.num_entries = 1,
+	.entry_size = 6,
+	.tbir = 0,
+	.offset = CRI_PMT_OFFSET + CRI_CRASHLOG_PUNIT_DISC_OFFSET,
+};
+
+static struct intel_vsec_header *cri_survivability_capabilities[] = {
+	&cri_survivability_crashlog,
+	NULL
+};
+
 enum xe_vsec {
 	XE_VSEC_UNKNOWN = 0,
 	XE_VSEC_BMG,
 	XE_VSEC_CRI,
+	XE_VSEC_CRI_SURVIVABILITY,
 };
 
 static struct intel_vsec_platform_info xe_vsec_info[] = {
@@ -116,6 +132,10 @@ static struct intel_vsec_platform_info xe_vsec_info[] = {
 		.caps = VSEC_CAP_TELEMETRY | VSEC_CAP_CRASHLOG,
 		.headers = cri_capabilities,
 	},
+	[XE_VSEC_CRI_SURVIVABILITY] = {
+		.caps = VSEC_CAP_CRASHLOG,
+		.headers = cri_survivability_capabilities,
+	},
 	{ }
 };
 
@@ -319,7 +339,7 @@ static bool wait_for_fw(struct xe_device *xe)
 {
 	int retries = VSEC_LATE_BIND_RETRY;  /* wait up to 20 secs */
 
-	if (xe->info.platform != XE_CRESCENTISLAND)
+	if (xe->info.platform != XE_CRESCENTISLAND || xe->pmt.survivability_mode)
 		return true;
 
 	while (retries--) {
@@ -538,6 +558,8 @@ static const int vsec_platforms[] = {
 
 static enum xe_vsec get_platform_info(struct xe_device *xe)
 {
+	struct xe_survivability *survivability = &xe->survivability;
+
 	if (xe->info.platform > XE_CRESCENTISLAND)
 		return XE_VSEC_UNKNOWN;
 
@@ -546,6 +568,9 @@ static enum xe_vsec get_platform_info(struct xe_device *xe)
 	     xe->info.platform == XE_CRESCENTISLAND))
 		return XE_VSEC_UNKNOWN;
 
+	if (survivability->mode && xe->info.platform == XE_CRESCENTISLAND)
+		return XE_VSEC_CRI_SURVIVABILITY;
+
 	return vsec_platforms[xe->info.platform];
 }
 
@@ -686,6 +711,13 @@ int xe_vsec_init(struct xe_device *xe)
 		xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
 		break;
 
+	case XE_VSEC_CRI_SURVIVABILITY:
+		xe->pmt.base_offset = CRI_PMT_OFFSET;
+		xe->pmt.survivability_mode = true;
+		info->priv_data = &xe_cri_pmt_cb;
+		xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
+		break;
+
 	default:
 		drm_err(&xe->drm, "Unsupported platform: %u\n", platform);
 		return 0;
-- 
2.43.0

