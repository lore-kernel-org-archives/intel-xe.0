Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87D6606A33F
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 20:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SkZPhADt
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 634A210E310;
	Fri, 20 Nov 2026 20:56:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C3BA10E5D2
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 20:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795208182; x=1826744182;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=iKXK6fOE15BpQx8kKMFE4QRjfuWkOWJlUIRKShaIovo=;
 b=SkZPhADtf3YZRKyaIKLnkgmrcZ0gzdrIhikMBEc8rXJIH1iIH8MQfn5s
 Dcms2JTxc5QkGND03eKP3kULOyuQaPiMENMnTld62ZL1nq3zR302mRYr3
 fDVbIQwi4eS5bKkECG6Q9dQGdI9Id7d9njPR/D/YiJjbHltQkhjB+GaF9
 3DTsVq2ou1g8+cuxWE9m9hG33mXpuUPVSvhYQtwrz/th3Rs3+ldfo3/bL
 Qv6jRjCl9gyBE+qk+2hbQnj+V//x4CNN3FZXSVJwcXCQE4v+Hh9Tce9yp
 Ng0KYWyklUm8RoTSOsze6+7EOQMMd/Ln0YXUs0Yzw+5re0weueXzeD50a w==;
X-CSE-ConnectionGUID: rfkPAcgvQP+4KLRQnZ91tA==
X-CSE-MsgGUID: XUVRfqS4TpqwtvZBx2Zqpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4136429"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4136429"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 12:55:51 -0800
X-CSE-ConnectionGUID: m3zFYHZXRaGVLMv/4AnooA==
X-CSE-MsgGUID: OUHJ19iOR+24u2Axx20Pyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; d="scan'208";a="10908742"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 12:55:49 -0800
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org,
 hansg@kernel.org, ilpo.jarvinen@linux.intel.com, matthew.brost@intel.com,
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com,
 airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com,
 anoop.c.vijay@intel.com, badal.nilawar@intel.com,
 matthew.d.roper@intel.com, james.ausmus@intel.com
Subject: [PATCH v21 18/19] drm/xe/vsec: Refactor platform check
Date: Fri, 20 Nov 2026 12:55:58 -0800
Message-ID: <20261120205540.1220643-39-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120205540.1220643-21-michael.j.ruhl@intel.com>
References: <20261120205540.1220643-21-michael.j.ruhl@intel.com>
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
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

For debugfs, residencies and pcode_info are available on the BMG and
CRI (!SRIOV_VF) platforms.

Refactor to have one code path for adding the debugfs entries.

Reviewed-by: Karthik Poosa <karthik.poosa@intel.com>
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 578ee973d159..bc62d1054d29 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -704,23 +704,22 @@ void xe_debugfs_register(struct xe_device *xe)
 				 ARRAY_SIZE(debugfs_list),
 				 root, minor);
 
-	if (xe->info.platform == XE_BATTLEMAGE && !IS_SRIOV_VF(xe)) {
-		drm_debugfs_create_files(debugfs_residencies,
-					 ARRAY_SIZE(debugfs_residencies),
-					 root, minor);
-	}
-
 	/*
-	 * Pcode version read from PMT is currently only supported on CRI and BMG platforms in PF
-	 * mode, as both platforms support the necessary telemetry read mechanism and have a fixed
-	 * PUNIT_VERSION_OFFSET.
+	 * Residencies and Pcode version read from PMT is currently only supported on CRI and BMG
+	 * platforms in PF mode.  Both platforms support the necessary telemetry read mechanism
+	 * and have a fixed offsets for the required data.
 	 * Attempting this access on other platforms must be verified before enabling support.
 	 */
 	if (!IS_SRIOV_VF(xe) &&
-	    (xe->info.platform == XE_CRESCENTISLAND || xe->info.platform == XE_BATTLEMAGE))
+	    (xe->info.platform == XE_CRESCENTISLAND || xe->info.platform == XE_BATTLEMAGE)) {
+		drm_debugfs_create_files(debugfs_residencies,
+					 ARRAY_SIZE(debugfs_residencies),
+					 root, minor);
+
 		drm_debugfs_create_files(pcode_info_debugfs,
 					 ARRAY_SIZE(pcode_info_debugfs),
 					 root, minor);
+	}
 
 	debugfs_create_file("forcewake_all", 0400, root, xe,
 			    &forcewake_all_fops);
-- 
2.43.0

