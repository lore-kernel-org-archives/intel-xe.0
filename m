Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0493DC25B47
	for <intel-xe@archiver.kernel.org>; Tue, 24 Oct 2023 22:07:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C37FA10E4EA;
	Tue, 24 Oct 2023 22:07:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F56C10E4E9
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Oct 2023 22:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698185243; x=1729721243;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bVmzC8Dy6C1Geiu3CjaMoEOT3ehUlmALvhYHYK/cpVg=;
 b=NHDnbCMtjvUgSM3cAQf4txdooJsaoaLmA4pjgn4phoLOv53agCOPOUXF
 mKn7iFCIC0+6Vp2v/6kH3owODXlMxpXnev/nXyqb+tWYy16l7Qz2Khc48
 2FvRMpzA6rJYISPSkw0cQ7RPFLAvFOtXWY8Vbx2kN+gXRjUfKy7uWhYRM
 q8OqTaV8pUPMPYyxVMK3kcZ3aS0S6kCeLJO16Aw+VYer2IzMRm92QhGaO
 Hngx/EeDuLKy/bh9BRsZ3jYtyR2ufYSb6agBROTjkRsdD9x+YD17MkLYU
 O7IPnsszvTBc4m1bI6miDJp6UbhmhBx/MFkxxmkpbWgs6eCTMdgoHMgDP w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="451410434"
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200"; d="scan'208";a="451410434"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2023 15:07:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="752127758"
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200"; d="scan'208";a="752127758"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2023 15:07:22 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 24 Oct 2023 15:07:38 -0700
Message-Id: <20231024220739.224251-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231024220739.224251-1-lucas.demarchi@intel.com>
References: <20231024220739.224251-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 2/3] drm/xe: Add performance tuning settings
 for MTL and Xe2
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Shekhar Chauhan <shekhar.chauhan@intel.com>

Add L3SQCREG5 as part of HW recommended settings. The recommended value
in Bspec is 00e0007f. For Xe2-LPG, bits 23:21 don't exist anymore, but
it's confirmed with HW engineers that setting them doesn't do anything.
They still exist on the media GT, Xe2-LPM, but they are already they are
already set as per HW default value. So for Xe2 platform, the only bits
that need to be set are 9:0 since HW's default is 0x1ff and the
recommended value is 0x7f.

Unlike most registers, which have the same relative offset on both
the primary and media GT, this register has a different base offset
on the media GT.

On MTL the register only exists for the primary (graphics) GT, so
there's no need to program it on the media gt. Also, it's part of the
RCS engine's context, so it needs to be added as a LRC workaround.

Bspec: 72161
Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  2 ++
 drivers/gpu/drm/xe/xe_tuning.c       | 23 +++++++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 5ad75011aa70..55ceadfc30b0 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -292,6 +292,8 @@
 
 #define XEHPC_L3CLOS_MASK(i)			XE_REG_MCR(0xb194 + (i) * 8)
 
+#define XE2LPM_L3SQCREG5			XE_REG_MCR(0xb658)
+
 #define XEHP_MERT_MOD_CTRL			XE_REG_MCR(0xcf28)
 #define RENDER_MOD_CTRL				XE_REG_MCR(0xcf2c)
 #define COMP_MOD_CTRL				XE_REG_MCR(0xcf30)
diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
index d70519816522..53ccd338fd8c 100644
--- a/drivers/gpu/drm/xe/xe_tuning.c
+++ b/drivers/gpu/drm/xe/xe_tuning.c
@@ -24,6 +24,20 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
 	  XE_RTP_RULES(PLATFORM(DG2)),
 	  XE_RTP_ACTIONS(SET(XEHP_SQCM, EN_32B_ACCESS))
 	},
+
+	/* Xe2 */
+
+	{ XE_RTP_NAME("Tuning: L3 cache"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(2004)),
+	  XE_RTP_ACTIONS(FIELD_SET(XEHP_L3SQCREG5, L3_PWM_TIMER_INIT_VAL_MASK,
+				   REG_FIELD_PREP(L3_PWM_TIMER_INIT_VAL_MASK, 0x7f)))
+	},
+	{ XE_RTP_NAME("Tuning: L3 cache - media"),
+	  XE_RTP_RULES(MEDIA_VERSION(2000)),
+	  XE_RTP_ACTIONS(FIELD_SET(XE2LPM_L3SQCREG5, L3_PWM_TIMER_INIT_VAL_MASK,
+				   REG_FIELD_PREP(L3_PWM_TIMER_INIT_VAL_MASK, 0x7f)))
+	},
+
 	{}
 };
 
@@ -63,6 +77,15 @@ static const struct xe_rtp_entry_sr lrc_tunings[] = {
 	  XE_RTP_RULES(PLATFORM(DG2), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_2, TBIMR_FAST_CLIP))
 	},
+
+	/* Xe_LPG */
+
+	{ XE_RTP_NAME("Tuning: L3 cache"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1270, 1271), ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(FIELD_SET(XEHP_L3SQCREG5, L3_PWM_TIMER_INIT_VAL_MASK,
+				   REG_FIELD_PREP(L3_PWM_TIMER_INIT_VAL_MASK, 0x7f)))
+	},
+
 	{}
 };
 
-- 
2.40.1

