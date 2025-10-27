Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11B05CCF9E0
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 08:56:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7D1210E40C;
	Mon, 27 Oct 2025 08:56:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nvywBrFe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 781B010E41F
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Oct 2025 08:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761555403; x=1793091403;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AQb+X1b435FcIBriej26Ey2+ZXimgovVpCHn4kN9Kw0=;
 b=nvywBrFexhI2+lDHmzhl98IlnggXYUwdnsacvuDbP0hgjqsHOMg356W+
 zTf/dROe0xroJ674d9HM8lVfihdtZgFv469c9+o4RUnP6tIoRoQOcHjxD
 2NjNBF7omvkcFcHsYrRFZ/MCFCrD2W5+Lblnw7fslcTbx6EQMASc98CU3
 RqxjHMgkHwDloiQVaSb/4W+p6EK0OvPEUGDZAurea6gGQfNQ5+W3/+pPz
 N+r45sva96XX0+khHTG8IKaOxHhpQ+j29TdS+GJyF3K14Z09YtkVI5PNV
 tjsWbPmz/iOK7lT5gq6tH5hAJb0MGzkjEUYV92Vrl+JCkNoqck1yzFMKP A==;
X-CSE-ConnectionGUID: nTqBOPc0TnivkKSqvXfzJQ==
X-CSE-MsgGUID: EDC/4imuQSeuI5xOqDBfhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73918839"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="73918839"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 01:56:43 -0700
X-CSE-ConnectionGUID: 2Bn2tmmKThWMHzux0vyXsg==
X-CSE-MsgGUID: zDRpQbOmQVG0UUyU+7N9jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="190205412"
Received: from nitin-super-server.iind.intel.com ([10.190.238.72])
 by fmviesa004.fm.intel.com with ESMTP; 27 Oct 2025 01:56:41 -0700
From: Nitin Gote <nitin.r.gote@intel.com>
To: matthew.d.roper@intel.com
Cc: intel-xe@lists.freedesktop.org, tejas.upadhyay@intel.com,
 Nitin Gote <nitin.r.gote@intel.com>
Subject: [PATCH] drm/xe/xe3: Add WA_14024681466 for Xe3_LPG
Date: Mon, 27 Oct 2025 14:56:43 +0530
Message-Id: <20251027092643.335904-1-nitin.r.gote@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Apply WA_14024681466 to Xe3_LPG graphics IP versions from 30.00 to 30.05.

v2: (Matthew Roper)
   - Remove stepping filter as workaround applies to all steppings.
   - Add an engine class filter so it only applies to the RENDER engine.

Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
 drivers/gpu/drm/xe/xe_wa.c           | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 3545e0be06da..a895a8e801a9 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -174,6 +174,7 @@
 
 #define XEHP_SLICE_COMMON_ECO_CHICKEN1		XE_REG_MCR(0x731c, XE_REG_OPTION_MASKED)
 #define   MSC_MSAA_REODER_BUF_BYPASS_DISABLE	REG_BIT(14)
+#define   FAST_CLEAR_VALIGN_FIX			REG_BIT(13)
 
 #define XE2LPM_CCCHKNREG1			XE_REG(0x82a8)
 
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index b6dcd9827354..ec638b431131 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -916,6 +916,10 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3005), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN4, SBE_PUSH_CONSTANT_BEHIND_FIX_ENABLE))
 	},
+	{ XE_RTP_NAME("14024681466"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3005), ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(SET(XEHP_SLICE_COMMON_ECO_CHICKEN1, FAST_CLEAR_VALIGN_FIX))
+	},
 };
 
 static __maybe_unused const struct xe_rtp_entry oob_was[] = {
-- 
2.25.1

