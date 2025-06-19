Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91A20C71159
	for <intel-xe@archiver.kernel.org>; Thu, 19 Jun 2025 05:11:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49FF810E98F;
	Thu, 19 Jun 2025 05:11:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LqEc52wx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB83110E995
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Jun 2025 05:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750309895; x=1781845895;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pvr3CKCmEi4Ikxjn81LzEV3I5jnbjgSrS7j3BDlDbY8=;
 b=LqEc52wxNc82/SZ84aVYwwnYTSxQ3P/YNWQ/PmCNSKg1Af5MAMk4zFd/
 2q+4XRiw+C+rFSHnm2ajhLGyHQ4/3FggA6VhCq7zj1AEYvqHLXPJsL/r2
 4KnX95Lk9JWoMW/jrfaYntWqz43hU9Ef1/JLj+WuAcVgO0r51ZYw215+G
 GgfGBKrzupJmMbwRBvzH/ZdOdcA9W1UNFLUwuVMhxa1ql9pcZ04jH9mUO
 cMdupB3cxuWTndE8/oFFYkExcdIczAR4NnWcbOb/NPVYu6ftLfq+dlprv
 WXiwZ7IUHQDiBCITSmMkuCmQTcBZfLG8OfaqBnB1+rxeykDz/Pgh5N1tA Q==;
X-CSE-ConnectionGUID: zNg2Mk13RWyKW7AcmqsVoQ==
X-CSE-MsgGUID: ARvpjUXvQ26ZLIPVvtBGDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="75079249"
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; d="scan'208";a="75079249"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 22:11:34 -0700
X-CSE-ConnectionGUID: mOfMWJobT7eDw3v8lWexaw==
X-CSE-MsgGUID: 1aOP5UGlTzK05VJK3pGMTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; d="scan'208";a="154909288"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 22:11:32 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: badal.nilawar@intel.com, anshuman.gupta@intel.com, karthik.poosa@intel.com,
 riana.tauro@intel.com, Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH v1] drm/xe/ptl: Apply Wa_16026007364
Date: Thu, 19 Jun 2025 10:40:58 +0530
Message-ID: <20250619051057.206253-2-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
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

As part of this WA GuC will save and restore value of two XE3_Media
control registers that were not included in the HW power context.

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h | 1 +
 drivers/gpu/drm/xe/xe_guc_ads.c       | 5 +++++
 drivers/gpu/drm/xe/xe_wa_oob.rules    | 1 +
 3 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
index 7de8f827281f..c4aebb7a9dc6 100644
--- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
@@ -368,6 +368,7 @@ enum xe_guc_klv_ids {
 	GUC_WORKAROUND_KLV_ID_BACK_TO_BACK_RCS_ENGINE_RESET				= 0x9009,
 	GUC_WA_KLV_WAKE_POWER_DOMAINS_FOR_OUTBOUND_MMIO					= 0x900a,
 	GUC_WA_KLV_RESET_BB_STACK_PTR_ON_VF_SWITCH					= 0x900b,
+	GUC_WA_KLV_OAM_CONTEXT_SAVE_AND_RESTORE						= 0x900c,
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index 07a027755627..27668cc25ef9 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -382,6 +382,11 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
 					GUC_WA_KLV_RESET_BB_STACK_PTR_ON_VF_SWITCH,
 					&offset, &remain);
 
+	if (XE_WA(gt, 16026007364))
+		guc_waklv_enable_simple(ads,
+					GUC_WA_KLV_OAM_CONTEXT_SAVE_AND_RESTORE,
+					&offset, &remain);
+
 	size = guc_ads_waklv_size(ads) - remain;
 	if (!size)
 		return;
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 9efc5accd43d..4bf0df0ed663 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -59,3 +59,4 @@ no_media_l3	MEDIA_VERSION(3000)
 		MEDIA_VERSION_RANGE(1301, 3000)
 16026508708	GRAPHICS_VERSION_RANGE(1200, 3001)
 		MEDIA_VERSION_RANGE(1300, 3000)
+16026007364 	MEDIA_VERSION(3000)
-- 
2.43.0

