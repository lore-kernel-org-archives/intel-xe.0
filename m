Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE032CD37B2
	for <intel-xe@archiver.kernel.org>; Fri,  8 May 2026 21:42:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E3C810F604;
	Fri,  8 May 2026 21:42:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M2ddcKhl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5116710F604
 for <intel-xe@lists.freedesktop.org>; Fri,  8 May 2026 21:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778276573; x=1809812573;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=NGI9H+VYACKdu1ch7RA7OC6vppvmU5+dSUUpR/pByeM=;
 b=M2ddcKhlyHtMddSvdFX9W1QPGYsjf8pnlDfZFj7+ePwjNixxYA60Ozmj
 64RtXV+unAUKg62SenvFosKRXZHc+KfiqDB6hYdrN+N1J0VWrtoChry6K
 0f5RMlcDuukt1s7eyjiDn9BmxXS41R1iwJyqFslvNMH6vsBnORUqQrt+D
 bdnq0aYhMJM6R8lWYaeVEHOLsJ54MVPOkZMG93KRIrGB7xCdJ4dNK/OSz
 OiC224LRdnpDstrM0qDhGKcM4v4d5JgkmzXEwwOqvpRaPMty1+KShZ1m0
 3mDxRnPWOZRzgX3SgMmFW6dw66u5HIVMsk5BiARDG524u2qjt9H+wo+lg w==;
X-CSE-ConnectionGUID: G1Cv4+RJQQyIu2fSPQkL/g==
X-CSE-MsgGUID: vXxFZFjdSgOGtYT1d/VvMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="90635989"
X-IronPort-AV: E=Sophos;i="6.23,224,1770624000"; d="scan'208";a="90635989"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2026 14:42:53 -0700
X-CSE-ConnectionGUID: RqgqfMt1RHGpow0MofZnBw==
X-CSE-MsgGUID: I7TDkIFaSraPDG1/ylgMXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,224,1770624000"; d="scan'208";a="267244235"
Received: from jjgreens-desk20.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.220.81])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2026 14:42:51 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Fri, 08 May 2026 18:42:32 -0300
Subject: [PATCH v2 2/8] drm/xe: Define and use MCR version of
 COMMON_SLICE_CHICKEN1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-rtp-mcr-check-v2-2-9897b147a5d2@intel.com>
References: <20260508-rtp-mcr-check-v2-0-9897b147a5d2@intel.com>
In-Reply-To: <20260508-rtp-mcr-check-v2-0-9897b147a5d2@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.15-dev
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

The register COMMON_SLICE_CHICKEN1 is a MCR register on Xe2.
Let's make sure to define a MCR version of it and use it for the
relevant IP versions.

Use XEHP_ as prefix for the register name, since it is MCR as of Xe_HP.

Fixes: a5d221924e13 ("drm/xe/xe2_hpg: Add set of workarounds")
Fixes: 9f18b55b6d3f ("drm/xe/xe2: Add workaround 18033852989")
Bspec: 66534, 71185
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
 drivers/gpu/drm/xe/xe_wa.c           | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 408933aee08a..b21c66a1b777 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -156,6 +156,7 @@
 #define   MSAA_OPTIMIZATION_REDUC_DISABLE	REG_BIT(11)
 
 #define COMMON_SLICE_CHICKEN1			XE_REG(0x7010, XE_REG_OPTION_MASKED)
+#define XEHP_COMMON_SLICE_CHICKEN1		XE_REG_MCR(0x7010, XE_REG_OPTION_MASKED)
 #define   DISABLE_BOTTOM_CLIP_RECTANGLE_TEST	REG_BIT(14)
 
 #define HIZ_CHICKEN					XE_REG(0x7018, XE_REG_OPTION_MASKED)
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 49f5e3e4c7cc..d6f94486673e 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -664,7 +664,7 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 	},
 	{ XE_RTP_NAME("18033852989"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2004), ENGINE_CLASS(RENDER)),
-	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN1, DISABLE_BOTTOM_CLIP_RECTANGLE_TEST))
+	  XE_RTP_ACTIONS(SET(XEHP_COMMON_SLICE_CHICKEN1, DISABLE_BOTTOM_CLIP_RECTANGLE_TEST))
 	},
 	{ XE_RTP_NAME("15016589081"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2004), ENGINE_CLASS(RENDER)),

-- 
2.53.0

