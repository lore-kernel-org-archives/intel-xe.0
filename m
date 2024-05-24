Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6152C25B74
	for <intel-xe@archiver.kernel.org>; Fri, 24 May 2024 23:43:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5818510E06F;
	Fri, 24 May 2024 23:43:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UH4wx4bL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FAF810E06F
 for <intel-xe@lists.freedesktop.org>; Fri, 24 May 2024 23:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716594194; x=1748130194;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=R3lh0iqvEKPA2ptI6fItA6aMJj64Le2wMLqn88aFFi4=;
 b=UH4wx4bLXjmscDG9a7FIe262iyD4sSgTSMH1oM4kMP95iGGaT6fN1kDN
 pFs5X2zyIES8mbnHsPzbMGRLlxLlQgJirbVGbIWOCc5aIWH+cJ59NcZ0f
 /+fy75o8ZzyHDIbBAuRwKxDpLG2CK8Nba4Jqh5KOcTZ4PNPfyaoIowTZc
 QCnkevAoUeKf7jTeG9zfKgC7yuO9V6iTncssEqKUIUzOrLZH7d36YdlQU
 Zi7KMpJNxY51LdSHEyFZZOfFAT7pr0IYYgeBhr6TB52OaCsJCbYIhODbz
 dco/6FK8NcSI2V0HqPAHdX8iKES8XtkTBbK5KaU/EMEN+82lZ7PQwx0id g==;
X-CSE-ConnectionGUID: AGtLPhaxQ92RTafYle4xLQ==
X-CSE-MsgGUID: aEjC1538TbaIQxmEufwjCA==
X-IronPort-AV: E=McAfee;i="6600,9927,11082"; a="12860222"
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; d="scan'208";a="12860222"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 16:43:13 -0700
X-CSE-ConnectionGUID: qIIimfVDQce1vGQmuq0Z4A==
X-CSE-MsgGUID: i7fW/DX9QCiiU2DmUzzmRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; d="scan'208";a="34267835"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.141])
 by fmviesa009.fm.intel.com with ESMTP; 24 May 2024 16:43:13 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: [PATCH 2/2] drm/xe/bmg: Apply Wa_22019338487
Date: Fri, 24 May 2024 16:41:09 -0700
Message-Id: <20240524234109.1731675-3-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20240524234109.1731675-1-vinay.belgaumkar@intel.com>
References: <20240524234109.1731675-1-vinay.belgaumkar@intel.com>
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

Extend this WA to BMG GT as well. In this case media GT is
not affected.

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c     | 3 +++
 drivers/gpu/drm/xe/xe_wa_oob.rules | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 3ecfbaa75495..82de2e198974 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -44,6 +44,7 @@
 #define GT_FREQUENCY_SCALER	3
 
 #define LNL_MERT_FREQ_CAP	800
+#define BMG_MERT_FREQ_CAP	2133
 
 /**
  * DOC: GuC Power Conservation (PC)
@@ -682,6 +683,8 @@ u32 xe_guc_pc_mert_freq_cap(struct xe_guc_pc *pc)
 {
 	if (MEDIA_VERx100(pc_to_xe(pc)) == 2000)
 		return LNL_MERT_FREQ_CAP;
+	else if (GRAPHICS_VERx100(pc_to_xe(pc)) == 2001)
+		return BMG_MERT_FREQ_CAP;
 	else
 		return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index a6b897030fde..26066beb4f6f 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -28,3 +28,4 @@
 		GRAPHICS_VERSION(2004)
 13011645652	GRAPHICS_VERSION(2004)
 22019338487	MEDIA_VERSION(2000)
+		GRAPHICS_VERSION(2001)
-- 
2.38.1

