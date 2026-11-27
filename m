Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25B7606A324
	for <intel-xe@archiver.kernel.org>; Fri, 27 Nov 2026 13:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hq+7oxnC
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6A3A10E58E;
	Fri, 27 Nov 2026 13:26:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8FF210E58E
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Nov 2026 13:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795785988; x=1827321988;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GTYY9FgHr0t6ItHU52VfJLkbGaf3/L77NRTAKKbGBwI=;
 b=hq+7oxnCItaVos7eUoVqqVjQuIQdbma88gWjWdRQl9ey36/JQEZpeuXU
 sLqWLvQMVQ2iDEnanTaR3GyQnYaHE/26iIUKO4qcTHZqWOmFosWV14Yu0
 YiY0U/rj+eP4oYt5SE00/8eMif6hkvf2c5SPkeodfQNxEwDM2VIn3RDso
 POzwPnZE6KB6bTCsX2xsmPwJmvszzh1cbU6uqvoJp3e2W87e+B0E7IwIb
 ZPI6Qy7Vn0cyiYZBSf6HsgvMcnCnhVWnGyIt9gfdKfPCsGFLGWhaJ7s3s
 VIKXC6WH6DHRiaDw5c90wIb16iJgk7RANa+lZwvufRtd1JH2GTh8BoaBF w==;
X-CSE-ConnectionGUID: JgHo6Qg9QQ65F+HWrAkHSg==
X-CSE-MsgGUID: wpOyT9ezSEKmdKjG0djkUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4607443"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4607443"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 05:26:28 -0800
X-CSE-ConnectionGUID: JwFaWrDHQF2CspIhudn3TA==
X-CSE-MsgGUID: /VwlADjUT/eYP3MWQOGbmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; d="scan'208";a="12692445"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 05:26:26 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: nitin.r.gote@intel.com, gustavo.sousa@intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [V3] drm/xe/nvl-p: Add Wa_14028564128
Date: Fri, 27 Nov 2026 18:56:14 +0530
Message-ID: <20261127132613.3957154-2-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
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

Wa_14028564128 requires all 2-way coherent PAT entries to be programmed
as non-promotable 1-way coherent entries with L3:UC. It applies to all
steppings of graphics version 35.10.

On Xe3p LPG this affects PAT indices 2, 7, 23, 27 and 31.

V3:
- Apply Wa_14028564128 before Wa_14026539277 and document the ordering
- Drop xe_pat_wa_14028564128_safe_userptr_index()

V2:
- Add missing pat indexes to no_promote as asked by WA

Co-authored-by: Nitin Gote <nitin.r.gote@intel.com>
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_pat.c        | 29 ++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_wa_oob.rules |  1 +
 2 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index 5938fef22579..29062672bf2d 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -337,6 +337,11 @@ bool xe_pat_wa_14026539277_reserved(struct xe_device *xe, u16 pat_index)
 		}
 	}
 
+	/* Wa_14028564128 also sets NO_PROMOTE, so MOCS can't promote these */
+	for_each_gt(gt, xe, id)
+		if (XE_GT_WA(gt, 14028564128))
+			return false;
+
 	/*
 	 * Disallow 2-way coherency for any L3 cache policy because
 	 * XE_L3_POLICY_UC could still be promoted to a cached policy
@@ -358,6 +363,19 @@ static u32 wa_14026539277_fixup_pat_value(struct xe_gt *gt, u32 value)
 	return value;
 }
 
+static u32 wa_14028564128_fixup_pat_value(struct xe_gt *gt, u32 value)
+{
+	if (XE_GT_WA(gt, 14028564128) &&
+	    REG_FIELD_GET(XE2_COH_MODE, value) == XE_COH_2WAY) {
+		value &= ~(XE2_L3_POLICY | XE2_COH_MODE);
+		value |= XE2_NO_PROMOTE |
+			 REG_FIELD_PREP(XE2_L3_POLICY, XE_L3_POLICY_UC) |
+			 REG_FIELD_PREP(XE2_COH_MODE, XE_COH_1WAY);
+	}
+
+	return value;
+}
+
 static const struct xe_pat_table_entry *gt_pta_entry(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
@@ -418,7 +436,15 @@ static void program_pat_mcr(struct xe_gt *gt, const struct xe_pat_table_entry ta
 
 	for (int i = 0; i < n_entries; i++) {
 		struct xe_reg_mcr reg_mcr = XE_REG_MCR(_PAT_INDEX(i));
-		u32 pat = wa_14026539277_fixup_pat_value(gt, table[i].value);
+		u32 pat = table[i].value;
+
+		/*
+		 * Both WAs only act on 2-way coherent entries and turn them
+		 * 1-way, so whichever runs first disables the other. Wa_14028564128
+		 * is a superset of Wa_14026539277 and must be applied first.
+		 */
+		pat = wa_14028564128_fixup_pat_value(gt, pat);
+		pat = wa_14026539277_fixup_pat_value(gt, pat);
 
 		xe_gt_mcr_multicast_write(gt, reg_mcr, pat);
 	}
@@ -809,6 +835,7 @@ int xe_pat_dump_sw_config(struct xe_gt *gt, struct drm_printer *p)
 	for (u32 i = 0; i < xe->pat.n_entries; i++) {
 		u32 pat = xe->pat.table[i].value;
 
+		pat = wa_14028564128_fixup_pat_value(gt, pat);
 		pat = wa_14026539277_fixup_pat_value(gt, pat);
 
 		if (GRAPHICS_VER(xe) >= 20) {
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 03b713f55dfb..908091dd72ab 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -74,6 +74,7 @@
 16029897822	MEDIA_VERSION(3500)
 		GRAPHICS_VERSION(3510)
 14026539277	GRAPHICS_VERSION(3510), GRAPHICS_STEP(A0, B0)
+14028564128	GRAPHICS_VERSION(3510)
 14027054324	GRAPHICS_VERSION(3511)
 14025941587	GRAPHICS_VERSION_RANGE(2001, 3511)
 		MEDIA_VERSION_RANGE(1301, 3503)
-- 
2.52.0

