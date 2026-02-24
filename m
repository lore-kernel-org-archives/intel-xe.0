Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DAC7F55431
	for <intel-xe@archiver.kernel.org>; Tue, 24 Feb 2026 23:51:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A82B10E68C;
	Tue, 24 Feb 2026 23:51:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y9ZtIVep";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C37D10E342
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Feb 2026 23:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771977069; x=1803513069;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eOe/mdlifD9Ontz9VGkG12JjUvFxdMYirWYfF3ZXLyk=;
 b=Y9ZtIVepd6ngrz9E4ErhoEyVgTJLVkJQDvsF5MB6fW4ijagt++uugr/8
 fBsOdNS4E7QFjzEVw6hfP94iUvYstUsC1XB1qkUUObCpYPBd6+kvmUuLY
 k0QohGmEy0yXZ0toLXeKa1+VgRmyFlb5Liy2M9sTVWUO9LXLVAaNRL/hx
 wHkmaKkw3oketU0sDgNwTJV/Wu0mU9uezp9CzVqdol0Mi3e62uguTqAq4
 yFKY8shodcqxHeAyr8bM5TUfU7EeuleTu/71oHgcmdHNUYVAhHMTOw7yh
 m5zzX5TUXMi41XGAZTqK9Xx232xzj/8V3ZcTKvhpgqYNGu+Eg/MpHZ8Jo A==;
X-CSE-ConnectionGUID: Gl9+OqGcRxyKlm5s+QbeBg==
X-CSE-MsgGUID: 38gJiG2MRHqSzLwN46tzcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="72044475"
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; d="scan'208";a="72044475"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 15:51:09 -0800
X-CSE-ConnectionGUID: Koj0/0LrThC27Y99t39R0g==
X-CSE-MsgGUID: vueZK5qzTjWFzGHdWVxOGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; d="scan'208";a="220561981"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 15:51:09 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH] drm/xe/tuning: Apply windower hardware filtering setting on
 Xe3 and Xe3p
Date: Tue, 24 Feb 2026 15:50:56 -0800
Message-ID: <20260224235055.3038710-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.53.0
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

A recent bspec tuning guide update asks us to program
COMMON_SLICE_CHICKEN4[5] on Xe3 and Xe3p platforms.  Add this setting to
our LRC tuning RTP table so that the setting will become part of each
context's LRC.

Bspec: 72161, 55902
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
 drivers/gpu/drm/xe/xe_tuning.c       | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 90b9017770ea..66ddad767ad4 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -176,6 +176,7 @@
 #define COMMON_SLICE_CHICKEN4			XE_REG(0x7300, XE_REG_OPTION_MASKED)
 #define   SBE_PUSH_CONSTANT_BEHIND_FIX_ENABLE	REG_BIT(12)
 #define   DISABLE_TDC_LOAD_BALANCING_CALC	REG_BIT(6)
+#define   HW_FILTERING				REG_BIT(5)
 
 #define COMMON_SLICE_CHICKEN3				XE_REG(0x7304, XE_REG_OPTION_MASKED)
 #define XEHP_COMMON_SLICE_CHICKEN3			XE_REG_MCR(0x7304, XE_REG_OPTION_MASKED)
diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
index ea90e8c99754..f8de6a4bf189 100644
--- a/drivers/gpu/drm/xe/xe_tuning.c
+++ b/drivers/gpu/drm/xe/xe_tuning.c
@@ -127,6 +127,11 @@ static const struct xe_rtp_entry_sr engine_tunings[] = {
 };
 
 static const struct xe_rtp_entry_sr lrc_tunings[] = {
+	{ XE_RTP_NAME("Tuning: Windower HW Filtering"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3599), ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN4, HW_FILTERING))
+	},
+
 	/* DG2 */
 
 	{ XE_RTP_NAME("Tuning: L3 cache"),
-- 
2.53.0

