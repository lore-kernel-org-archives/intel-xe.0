Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BA56C83F1A
	for <intel-xe@archiver.kernel.org>; Thu, 24 Jul 2025 01:04:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ADEC10E1A9;
	Thu, 24 Jul 2025 01:04:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WQrHWGsb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D50F10E1AB
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Jul 2025 01:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753319083; x=1784855083;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CegN0LB+DYa9jOU8+LjXDgxoll1rBpjeMXqIIbMa708=;
 b=WQrHWGsb3CQnWd2RSzefQoPU/2HdRmSMbPyLYorGd3hrMs6oh5I5YKiN
 HRsp4ZEu2j7Zzz9/TmXOkWvZzLgbn3PKEP0Nxx5+Vzi4NYEw3wyzfmI6P
 66jaWFxN81o8Sd7JUN69c2yv36Y0nXlsS1edao/k6OHUpt3I+cpMphSYa
 f6nceHwgvtwcxMl5xORC0+SxnqusCDJXRiTzZLXv6VFYdaMUNTQeLzDDU
 Z10F5B4doOtmZJ5PiF1R2DrDcFvfoOBGGizzjDCuWrQBn87ZkcOVw2YFA
 O430trXZB9+Hi3nQnIe4mX/r22PgG2W6ai0k6Ml7dpXuxndRjyzUk9eS9 A==;
X-CSE-ConnectionGUID: 02Ff0y6OQPqmkIdPC+TFiQ==
X-CSE-MsgGUID: IxYnp6iSReS7EBbMK4xRfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="55766485"
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; d="scan'208";a="55766485"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 18:04:43 -0700
X-CSE-ConnectionGUID: QoydZhyKTlaWLzjTHw9tHQ==
X-CSE-MsgGUID: 6EGSa+85QH+Fn7apuZ6/sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; d="scan'208";a="160106417"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 18:04:42 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, prashanth.kumar@intel.com,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: [PATCH v2 5/7] drm/xe/psmi: Add Wa_16023683509
Date: Wed, 23 Jul 2025 18:04:26 -0700
Message-ID: <20250723-psmi-v2-5-84a04b5a3c04@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250723-psmi-v2-0-84a04b5a3c04@intel.com>
References: <20250723-psmi-v2-0-84a04b5a3c04@intel.com>
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

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
v2:
 - Enable only when PSMI is enabled
---
 drivers/gpu/drm/xe/xe_guc.c        | 3 +++
 drivers/gpu/drm/xe/xe_guc_fwif.h   | 1 +
 drivers/gpu/drm/xe/xe_wa_oob.rules | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 88dab4724c510..e0bcaa6344505 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -219,6 +219,9 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
 	if (XE_WA(gt, 14018913170))
 		flags |= GUC_WA_ENABLE_TSC_CHECK_ON_RC6;
 
+	if (XE_WA(gt, 16023683509))
+		flags |= GUC_WA_SAVE_RESTORE_MCFG_REG_AT_MC6;
+
 	return flags;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
index 4dc000c977faf..d4dbee7e98f22 100644
--- a/drivers/gpu/drm/xe/xe_guc_fwif.h
+++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
@@ -108,6 +108,7 @@ struct guc_update_exec_queue_policy {
 #define   GUC_WA_RENDER_RST_RC6_EXIT	BIT(19)
 #define   GUC_WA_RCS_REGS_IN_CCS_REGS_LIST	BIT(21)
 #define   GUC_WA_ENABLE_TSC_CHECK_ON_RC6	BIT(22)
+#define   GUC_WA_SAVE_RESTORE_MCFG_REG_AT_MC6 	BIT(25)
 
 #define GUC_CTL_FEATURE			2
 #define   GUC_CTL_ENABLE_SLPC		BIT(2)
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index ba58fa0ed8fcf..b3d4623a3e42b 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -70,6 +70,8 @@ no_media_l3	MEDIA_VERSION(3000)
 		MEDIA_VERSION(2000), FUNC(xe_rtp_match_psmi_enabled)
 		MEDIA_VERSION(3000), FUNC(xe_rtp_match_psmi_enabled)
 		MEDIA_VERSION(3002), FUNC(xe_rtp_match_psmi_enabled)
+16023683509	MEDIA_VERSION(2000), FUNC(xe_rtp_match_psmi_enabled)
+		MEDIA_VERSION(3000), GRAPHICS_STEP(A0, B0), FUNC(xe_rtp_match_psmi_enabled)
 
 # SoC workaround - currently applies to all platforms with the following
 # primary GT GMDID

-- 
2.50.1

