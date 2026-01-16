Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDE1AC98302
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jan 2026 22:12:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D08310E1FD;
	Fri, 16 Jan 2026 22:12:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JI6kz9YV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64BDC10E0FB
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jan 2026 22:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768601564; x=1800137564;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=xtdT+FZfCD/IPkLFmMzcj/G7wN+Qxyxc4zOEMn61tlk=;
 b=JI6kz9YVvLaW/yzFd39mz//PxDJQzeFxsF7d0FEpO3qHY5FLZbbIKgTV
 37y/ctdobX4me9ronZrZRMzNPGdHsZgUPkAfWGpiEG+aFI2rEqDTpfKHH
 pc7i90lw2cHM4RyCP8uIm79TW9iu/WQpXabW6hPXJmRhXki2wYGWDhGIw
 Y56BlRGZ1Im+zcV2He6xPQOZP90EU73lqv8ANzJOFep9TqZvhSIi6vKGG
 aI+ojqBsa2kgcDf1APSnFvkFJEzmkh2U4fJMQNbduRtZkxz8VFMG8QLw0
 0/ZzGXhw61jX95qKyf4LqeyeH+l2lfxlRbr8VYhuUKFC6opFQxXWUXBQd A==;
X-CSE-ConnectionGUID: /d/x75TpQp6RAKDSBTsb8w==
X-CSE-MsgGUID: JSKyCGR7Rbq495hVWENr3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="69123021"
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="69123021"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 14:12:44 -0800
X-CSE-ConnectionGUID: gF4vuK65S32hqqhva0maQQ==
X-CSE-MsgGUID: i+cHbT1nSpmQeztjhT2AXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="204961779"
Received: from khuang2-desk.gar.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.59])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 14:12:43 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Fri, 16 Jan 2026 19:12:11 -0300
Subject: [PATCH 03/12] drm/xe: Define and use MCR version of
 COMMON_SLICE_CHICKEN4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-rtp-mcr-check-v1-3-d420b9c1a327@intel.com>
References: <20260116-rtp-mcr-check-v1-0-d420b9c1a327@intel.com>
In-Reply-To: <20260116-rtp-mcr-check-v1-0-d420b9c1a327@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
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

The register COMMON_SLICE_CHICKEN4 is a MCR register on both Xe2 and
Xe3. Let's make sure to define a MCR version of it and use it for the
relevant IP versions.

Use XEHP_ as prefix for the register name, since it is MCR as of Xe_HP.

Fixes: 8d6f16f1f082 ("drm/xe: Extend Wa_22021007897 to Xe3 platforms")
Fixes: e5c13e2c505b ("drm/xe/xe2hpg: Add Wa_22021007897")
Bspec: 66534, 71185, 74417
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
 drivers/gpu/drm/xe/xe_wa.c           | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index d4a1bb1edc9c..f129210e8e48 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -168,6 +168,7 @@
 #define XEHPG_SC_INSTDONE_EXTRA2		XE_REG_MCR(0x7108)
 
 #define COMMON_SLICE_CHICKEN4			XE_REG(0x7300, XE_REG_OPTION_MASKED)
+#define XEHP_COMMON_SLICE_CHICKEN4		XE_REG_MCR(0x7300, XE_REG_OPTION_MASKED)
 #define   SBE_PUSH_CONSTANT_BEHIND_FIX_ENABLE	REG_BIT(12)
 #define   DISABLE_TDC_LOAD_BALANCING_CALC	REG_BIT(6)
 
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index a91db59a3d0a..58c37250479f 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -848,7 +848,7 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 	},
 	{ XE_RTP_NAME("22021007897"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002), ENGINE_CLASS(RENDER)),
-	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN4, SBE_PUSH_CONSTANT_BEHIND_FIX_ENABLE))
+	  XE_RTP_ACTIONS(SET(XEHP_COMMON_SLICE_CHICKEN4, SBE_PUSH_CONSTANT_BEHIND_FIX_ENABLE))
 	},
 	{ XE_RTP_NAME("18033852989"),
 	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
@@ -868,7 +868,7 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 	},
 	{ XE_RTP_NAME("22021007897"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3005), ENGINE_CLASS(RENDER)),
-	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN4, SBE_PUSH_CONSTANT_BEHIND_FIX_ENABLE))
+	  XE_RTP_ACTIONS(SET(XEHP_COMMON_SLICE_CHICKEN4, SBE_PUSH_CONSTANT_BEHIND_FIX_ENABLE))
 	},
 	{ XE_RTP_NAME("14024681466"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3005), ENGINE_CLASS(RENDER)),

-- 
2.52.0

