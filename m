Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D9A8C9830E
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 17:28:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37FC110E1F6;
	Fri, 25 Sep 2026 17:28:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m+mlwFbz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EF2310E1F6
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Sep 2026 17:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790357333; x=1821893333;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KsakEZMWf2dLvfSEEyr9SUl53LwzA7Y3i6NEiBRCLes=;
 b=m+mlwFbzMCk1ypSu6TtLBKvPeurD9zHzAnqt5YJuGNt0KRn8QZzUq/mt
 dY09urgEiWb2qzqMJEoLHOMBrSrmFivEXLME1a6eW/7VXshUWqd6/0w6K
 j2jDb9vvnOFUkFNiwdJF3UJ+kY3ndruqnyR8RtBCebtYnNuMIFLkq5KnE
 +sYZSXw4VXPbxaWOl6nygD50WOpR5lILFZi4knsNLL1unDcVpWZ5kljbA
 /JBhhiNqV3gOEqvVlO5IOeMCll6M1gUefzps29wI7J68ng9wbTc+qjBFh
 G61eNVCQAQRYKafq+I2qAMPX7OoK2AcvqY8Nnl+FeGBhl3FVaw6Pwlu19 Q==;
X-CSE-ConnectionGUID: 3cpL4RJyRHqHCOXgibj/zw==
X-CSE-MsgGUID: tLJENLCjSPqVThufmBqRGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="90104928"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="90104928"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 10:28:53 -0700
X-CSE-ConnectionGUID: PQeTHexTQXC92EtQAqAPpQ==
X-CSE-MsgGUID: gziT7cmATtGGzKa1njzu+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="274548748"
Received: from tilak-z690i-a-ultra-plus.iind.intel.com ([10.190.239.38])
 by fmviesa008.fm.intel.com with ESMTP; 25 Sep 2026 10:28:50 -0700
From: tilak.tirumalesh.tangudu@intel.com
To: tilak.tirumalesh.tangudu@intel.com, intel-xe@lists.freedesktop.org,
 shuicheng.lin@intel.com
Subject: [PATCH] drm/xe/xe3p_lpg: Add support for Wa_16030224309
Date: Fri, 25 Sep 2026 22:57:22 +0530
Message-ID: <20260925172722.238924-1-tilak.tirumalesh.tangudu@intel.com>
X-Mailer: git-send-email 2.46.0
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

From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>

Opt in to the GuC workaround, to ignore context completion status
with preemption or preemption-to-idle in the CSB when the multi-queue
feature is enabled, which is supported on Graphics Version 35.10.
This WA is supported starting from GuC 70.73.

Apply Wa_16030224309 to Graphics Version 35.10.

v2: Place this code near to KLV WAs. -Lin Shuicheng

Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h | 1 +
 drivers/gpu/drm/xe/xe_guc_ads.c       | 6 ++++++
 drivers/gpu/drm/xe/xe_wa_oob.rules    | 1 +
 3 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
index 685c4ef17b73..4bcdc1a96785 100644
--- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
@@ -525,6 +525,7 @@ enum xe_guc_klv_ids {
 	GUC_WA_KLV_CLR_CS_INDIRECT_RING_STATE_IF_IDLE_AT_CTX_REG			= 0x900e,
 	GUC_WA_KLV_REMAP_RANGED_TLB_INV							= 0x900f,
 	GUC_WA_KLV_IGNORE_MMIO_READ_SEM_TOKEN_64					= 0x9010,
+	GUC_WA_KLV_IGNORE_MULTIQ_CTX_COMPLETE_WITH_PREEMPT_IN_CSB			= 0x9011,
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index 9ceb662ca40e..43a2951a66d6 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -383,6 +383,12 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
 		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
 				 GUC_WA_KLV_IGNORE_MMIO_READ_SEM_TOKEN_64);
 
+	/* GuC only applies this WA for scheduled MultiQ contexts; no KMD-side gating needed. */
+	if (XE_GT_WA(gt, 16030224309) &&
+	    GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, 70, 73))
+		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
+				 GUC_WA_KLV_IGNORE_MULTIQ_CTX_COMPLETE_WITH_PREEMPT_IN_CSB);
+
 	/*
 	 * On GuC firmware 70.66 and above, use the Feature KLV (shared with the
 	 * WA KLV buffer); older firmware uses GUC_CTL_DISABLE_MULTI_QUEUE in
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 6662987effd7..f35181fc4e49 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -75,3 +75,4 @@
 14027054324	GRAPHICS_VERSION(3511)
 14025941587	GRAPHICS_VERSION_RANGE(2001, 3511), FUNC(xe_rtp_match_not_sriov_vf)
 		MEDIA_VERSION_RANGE(1301, 3503), FUNC(xe_rtp_match_not_sriov_vf)
+16030224309	GRAPHICS_VERSION(3510)
-- 
2.46.0

