Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF4BC83F22
	for <intel-xe@archiver.kernel.org>; Wed, 16 Jul 2025 20:55:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFC2410E6A8;
	Wed, 16 Jul 2025 20:55:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d5RKl1X1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9FD810E67A
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Jul 2025 20:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752699356; x=1784235356;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=V4CsCwXbxhK94U66DRc8YFR/l8FP1MA3SlhPGcwvqUQ=;
 b=d5RKl1X1y5QMCissfaTwzSE857938xmTnoqggJ6lKQ/+vVrW0gAT/1Tb
 udRWL0lbC99CEnhfHNzNB8JZd5A8xqgrV6qDtUtDH0NGlAZEXFnDxOa0h
 MHp7Q0v3V2dhcBNh+w7eQ8pf49O8WYBHXFYrkTtatO6WJ5OEhMqjzWMPh
 ZS/WRGI15tmSvaxIckDNfbndrTyQNIMsTVFqyindOmTIx1F3nwtajXuu/
 v+fHZM9YA9SnmaYdy7dt+Hebdf1fEsSDzK+zgQ0eQ+aX7/dqHO0zuQ0TQ
 lM85IXxJMsRAy1E0jDYcU8Ue7bV0wBCJfZ2NQRP0uMYZ1qC2D0b/Ct9+1 w==;
X-CSE-ConnectionGUID: WH3Z67g+RX2sB8Ybu1i+6w==
X-CSE-MsgGUID: 3oi2iN7+QgKTvylQsEQm0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="58770469"
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; d="scan'208";a="58770469"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 13:55:55 -0700
X-CSE-ConnectionGUID: BX+wKBqMQaCfgsGx1kfQYg==
X-CSE-MsgGUID: NRfurwDiQpa1xkWBoIRlmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; d="scan'208";a="157686085"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 13:55:55 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
Subject: [PATCH 4/4] drm/xe/psmi: Add Wa_16023683509
Date: Wed, 16 Jul 2025 13:55:47 -0700
Message-ID: <20250716-psmi-v1-4-674c13d7028e@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250716-psmi-v1-0-674c13d7028e@intel.com>
References: <20250716-psmi-v1-0-674c13d7028e@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-858c0
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

From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

This WA ensures GuC will restore the media MCFG registers at C6
exit.

Cc: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c        | 3 +++
 drivers/gpu/drm/xe/xe_guc_fwif.h   | 1 +
 drivers/gpu/drm/xe/xe_wa_oob.rules | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 4d11c3a66ad38..04e2e86e4e496 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -218,6 +218,9 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
 	if (XE_WA(gt, 14018913170))
 		flags |= GUC_WA_ENABLE_TSC_CHECK_ON_RC6;
 
+	if (XE_WA(gt, 16023683509))
+		flags |= GUC_WA_SAVE_RESTORE_MCFG_REG_AT_MC6;
+
 	return flags;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
index 2a5256c24b9d8..e69938ea27569 100644
--- a/drivers/gpu/drm/xe/xe_guc_fwif.h
+++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
@@ -103,6 +103,7 @@ struct guc_update_exec_queue_policy {
 #define   GUC_WA_RENDER_RST_RC6_EXIT	BIT(19)
 #define   GUC_WA_RCS_REGS_IN_CCS_REGS_LIST	BIT(21)
 #define   GUC_WA_ENABLE_TSC_CHECK_ON_RC6	BIT(22)
+#define   GUC_WA_SAVE_RESTORE_MCFG_REG_AT_MC6 	BIT(25)
 
 #define GUC_CTL_FEATURE			2
 #define   GUC_CTL_ENABLE_SLPC		BIT(2)
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 91e717bba455f..b7083f8a728c6 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -70,6 +70,8 @@ no_media_l3	MEDIA_VERSION(3000)
 		MEDIA_VERSION(2000)
 		MEDIA_VERSION(3000)
 		MEDIA_VERSION(3002)
+16023683509	MEDIA_VERSION(2000)
+		MEDIA_VERSION(3000), GRAPHICS_STEP(A0, B0)
 
 # SoC workaround - currently applies to all platforms with the following
 # primary GT GMDID

-- 
2.49.0

