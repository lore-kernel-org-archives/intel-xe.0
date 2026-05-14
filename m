Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBCF5CD4F25
	for <intel-xe@archiver.kernel.org>; Thu, 14 May 2026 21:45:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C68810F331;
	Thu, 14 May 2026 21:45:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UOXbwO1U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5FD910E5FC
 for <intel-xe@lists.freedesktop.org>; Thu, 14 May 2026 21:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778795117; x=1810331117;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=gMZ5vJmn1dvcFLKvUZR+GDy47blefSV25FI4gFCiAlU=;
 b=UOXbwO1Ua7OjWMn7xOKnMhdfm7uNusp/wwK2wbhXawP+UFb1/gYPlGVO
 RIGzkFLkMPoPvraEnKvw0YawV6BXLN25jACXghaGV+s9oHAN7CRDTMfRr
 oC2HYNzdPdBJk6gwa4sysKkR1avGb2bPHOSAD/umnwirta3I/vnc8abhO
 1zo8UqJHzWJMwnU6GZxkCe4q/SXUSNdRGN+e9uex98+B8GzHAvOVvRIja
 JgP6w5hut68USD38a617Aw8ah0ywjjzHO+qKmMLI+BW8i3WsMjqtUx5pm
 SXe5CDqhuttmLC9cypm/ejvVJNk5mMWwhJxrqkKv352yAEnbrx/qd1mYl g==;
X-CSE-ConnectionGUID: QHi53KwGQci1dJW2jd6BQQ==
X-CSE-MsgGUID: OJKpcRZQS/uHAT2jj4bK+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="67277256"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; d="scan'208";a="67277256"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 14:45:17 -0700
X-CSE-ConnectionGUID: dBQ2q7JCQFS2cJ6srxUHKg==
X-CSE-MsgGUID: 26RrlDiaTrGdBD6wUuC+kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; d="scan'208";a="238613191"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.189])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 14:45:15 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Thu, 14 May 2026 18:44:46 -0300
Subject: [PATCH v3 3/7] drm/xe: Define and use MCR version of
 COMMON_SLICE_CHICKEN4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-rtp-mcr-check-v3-3-30dd47855fee@intel.com>
References: <20260514-rtp-mcr-check-v3-0-30dd47855fee@intel.com>
In-Reply-To: <20260514-rtp-mcr-check-v3-0-30dd47855fee@intel.com>
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

The register COMMON_SLICE_CHICKEN4 is a MCR register on both Xe2 and
Xe3. Let's make sure to define a MCR version of it and use it for the
relevant IP versions.

Use XEHP_ as prefix for the register name, since it is MCR as of Xe_HP.

v2:
  - Also change for one entry in lrc_tunnings, which was caught by
    manual testing and add corresponging Fixes tag in commit message.
    (Gustavo)

Fixes: 8d6f16f1f082 ("drm/xe: Extend Wa_22021007897 to Xe3 platforms")
Fixes: e5c13e2c505b ("drm/xe/xe2hpg: Add Wa_22021007897")
Fixes: 8ccf5f6b2295 ("drm/xe/tuning: Apply windower hardware filtering setting on Xe3 and Xe3p")
Bspec: 66534, 71185, 74417
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
 drivers/gpu/drm/xe/xe_tuning.c       | 2 +-
 drivers/gpu/drm/xe/xe_wa.c           | 4 ++--
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index b21c66a1b777..08251c7a1a4b 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -179,6 +179,7 @@
 #define XEHPG_SC_INSTDONE_EXTRA2		XE_REG_MCR(0x7108)
 
 #define COMMON_SLICE_CHICKEN4			XE_REG(0x7300, XE_REG_OPTION_MASKED)
+#define XEHP_COMMON_SLICE_CHICKEN4		XE_REG_MCR(0x7300, XE_REG_OPTION_MASKED)
 #define   SBE_PUSH_CONSTANT_BEHIND_FIX_ENABLE	REG_BIT(12)
 #define   DISABLE_TDC_LOAD_BALANCING_CALC	REG_BIT(6)
 #define   HW_FILTERING				REG_BIT(5)
diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
index ce39b77a084a..9a1b3862e192 100644
--- a/drivers/gpu/drm/xe/xe_tuning.c
+++ b/drivers/gpu/drm/xe/xe_tuning.c
@@ -134,7 +134,7 @@ static const struct xe_rtp_entry_sr engine_tunings[] = {
 static const struct xe_rtp_entry_sr lrc_tunings[] = {
 	{ XE_RTP_NAME("Tuning: Windower HW Filtering"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3599), ENGINE_CLASS(RENDER)),
-	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN4, HW_FILTERING))
+	  XE_RTP_ACTIONS(SET(XEHP_COMMON_SLICE_CHICKEN4, HW_FILTERING))
 	},
 
 	/* DG2 */
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index d6f94486673e..cb811f8a7781 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -767,7 +767,7 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 	},
 	{ XE_RTP_NAME("22021007897"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002), ENGINE_CLASS(RENDER)),
-	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN4, SBE_PUSH_CONSTANT_BEHIND_FIX_ENABLE))
+	  XE_RTP_ACTIONS(SET(XEHP_COMMON_SLICE_CHICKEN4, SBE_PUSH_CONSTANT_BEHIND_FIX_ENABLE))
 	},
 
 	/* Xe3_LPG */
@@ -783,7 +783,7 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 	},
 	{ XE_RTP_NAME("22021007897"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3005), ENGINE_CLASS(RENDER)),
-	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN4, SBE_PUSH_CONSTANT_BEHIND_FIX_ENABLE))
+	  XE_RTP_ACTIONS(SET(XEHP_COMMON_SLICE_CHICKEN4, SBE_PUSH_CONSTANT_BEHIND_FIX_ENABLE))
 	},
 	{ XE_RTP_NAME("14024681466"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3005), ENGINE_CLASS(RENDER)),

-- 
2.53.0

