Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4CA7C27C54
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jun 2024 21:22:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 574DE10E0F0;
	Tue,  4 Jun 2024 21:22:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CNLCRr0A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7723110E0F0
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Jun 2024 21:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717536164; x=1749072164;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=/ZQGFhvYje0/AYvU9G5OODYXN5RTxQjBfskf2jIKsTE=;
 b=CNLCRr0Av1gRrrBF/T2wtjlyrhYC43GxcbVWt0Bxw5WGAktw7FY60gyW
 KrSeFDtc5eothpThbaGZ5FZ12AyHYM0UyeYVRRV0bqpIw1GoHCwBQrxZB
 BO+JsVonuECBXChhdCAy3lXiEm3m2fSph8ZtB/gAl/9CKf9BGl+D95rk6
 FA7LOM/m/LKP1i4r3x5l+OawwTYzRzpMRR5MdnRvHCqF9m45PdbIRnnvR
 3asqGbG2K24orp8qSRX0xae/rnz3779ottEigWQREtAEvvhijtAQk0Tz+
 hc4zaVPEM7ML5VXYg9o5+Sz5Ssq1zhpus/lxO8SbOkhN/YmbNSJrMOi+n g==;
X-CSE-ConnectionGUID: XhRDdL+hQaWBVyv5kSNdmA==
X-CSE-MsgGUID: nJbJmAJlS3Gq0h3G/4tN5w==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="13996097"
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000"; d="scan'208";a="13996097"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 14:22:44 -0700
X-CSE-ConnectionGUID: b15ms0tJQT6WfcN/6X7QQw==
X-CSE-MsgGUID: G0Ew5NY8SB+RdmyWx08REw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000"; d="scan'208";a="41799412"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.19.248])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 14:22:43 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 3/4] drm/xe/vf: Custom GuC reset
Date: Tue,  4 Jun 2024 23:22:30 +0200
Message-Id: <20240604212231.1416-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240604212231.1416-1-michal.wajdeczko@intel.com>
References: <20240604212231.1416-1-michal.wajdeczko@intel.com>
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

The VF drivers can't trigger real GuC firmware reset using GDRST
register, but for the VF drivers it is sufficient to send VF_RESET
message to reset any VF specific state maintained by the GuC.
Use our existing VF bootstrap function as VF_RESET is part of it.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 086a048876ba..0bf6e01b8910 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -430,6 +430,9 @@ int xe_guc_reset(struct xe_guc *guc)
 
 	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
 
+	if (IS_SRIOV_VF(gt_to_xe(gt)))
+		return xe_gt_sriov_vf_bootstrap(gt);
+
 	xe_mmio_write32(gt, GDRST, GRDOM_GUC);
 
 	ret = xe_mmio_wait32(gt, GDRST, GRDOM_GUC, 0, 5000, &gdrst, false);
-- 
2.43.0

