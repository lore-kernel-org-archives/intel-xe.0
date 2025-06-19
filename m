Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9B55C7115A
	for <intel-xe@archiver.kernel.org>; Thu, 19 Jun 2025 13:33:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC5C010EA53;
	Thu, 19 Jun 2025 13:33:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CkY/6BPH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C09110EA53
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Jun 2025 13:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750340002; x=1781876002;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0p+4ZDRwnYIJOOy5ZUiftWySHwSvAcKqubHJA61JLDA=;
 b=CkY/6BPHezBZ9dNSESi1Szul4XVbVkDzpF0zgk/G5u/D6RHN0UGDco6n
 5G4upTkP7UL5udmlpv6e0VXofgK/0LaM+juBAGZiSxr+RsAH2XELHVyCF
 xovMb6nDOWSIeIlggJvOGxj6UPRzFcqZ8tcksThFSFuSkXnRMVhdUHkl9
 ZLAYFXOB29XmL+jqC3zrvq87Iw0T9jFEkhfj+1lR/K3cZrkPEdXa8uPRV
 uL/GC+VbzD9+kitn/E5SCvv1E4fQVe9dl/E8owMSn6dQpnghHLs6cILXm
 EysHt37zIHLcJGrfvN3L0Gmt1T4kRmsCoarCx79/Pboy8J4fqZXm+W0Rt A==;
X-CSE-ConnectionGUID: otOVFEisSj23IY/M+v4GKw==
X-CSE-MsgGUID: A/7VZ4ncRQqQxQIN46QboA==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="52516285"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; d="scan'208";a="52516285"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 06:33:22 -0700
X-CSE-ConnectionGUID: WruXjDWoRI+OEOHfDdP4TA==
X-CSE-MsgGUID: BShytHwtQGSUkp3995Uj0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; d="scan'208";a="151211756"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 06:33:19 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: badal.nilawar@intel.com, anshuman.gupta@intel.com, karthik.poosa@intel.com,
 riana.tauro@intel.com, sanirban <sk.anirban@intel.com>
Subject: [PATCH v2] drm/xe/ptl: Apply Wa_16026007364
Date: Thu, 19 Jun 2025 19:04:14 +0530
Message-ID: <20250619133413.107423-2-sk.anirban@intel.com>
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

From: sanirban <sk.anirban@intel.com>

As part of this WA GuC will save and restore value of two XE3_Media
control registers that were not included in the HW power context.

v2:
  - Update klv name (Badal)

Signed-off-by: sanirban <sk.anirban@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h | 1 +
 drivers/gpu/drm/xe/xe_guc_ads.c       | 5 +++++
 drivers/gpu/drm/xe/xe_wa_oob.rules    | 1 +
 3 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
index 7de8f827281f..e2583761a70d 100644
--- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
@@ -368,6 +368,7 @@ enum xe_guc_klv_ids {
 	GUC_WORKAROUND_KLV_ID_BACK_TO_BACK_RCS_ENGINE_RESET				= 0x9009,
 	GUC_WA_KLV_WAKE_POWER_DOMAINS_FOR_OUTBOUND_MMIO					= 0x900a,
 	GUC_WA_KLV_RESET_BB_STACK_PTR_ON_VF_SWITCH					= 0x900b,
+	GUC_WA_KLV_RESTORE_UNSAVED_MEDIA_CONTROL_REG					= 0x900c,
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index 07a027755627..f3c74f9a40c6 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -382,6 +382,11 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
 					GUC_WA_KLV_RESET_BB_STACK_PTR_ON_VF_SWITCH,
 					&offset, &remain);
 
+	if (XE_WA(gt, 16026007364))
+		guc_waklv_enable_simple(ads,
+					GUC_WA_KLV_RESTORE_UNSAVED_MEDIA_CONTROL_REG,
+					&offset, &remain);
+
 	size = guc_ads_waklv_size(ads) - remain;
 	if (!size)
 		return;
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 96cc33da0fb5..8c2aa48cb33a 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -70,3 +70,4 @@ no_media_l3	MEDIA_VERSION(3000)
 # SoC workaround - currently applies to all platforms with the following
 # primary GT GMDID
 14022085890	GRAPHICS_VERSION(2001)
+16026007364 	MEDIA_VERSION(3000)
-- 
2.43.0

