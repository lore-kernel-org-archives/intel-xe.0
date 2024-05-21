Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B315C25B7A
	for <intel-xe@archiver.kernel.org>; Tue, 21 May 2024 09:10:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B8DF10E1A1;
	Tue, 21 May 2024 09:10:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CcsdJF+8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDDC610E801
 for <intel-xe@lists.freedesktop.org>; Tue, 21 May 2024 09:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716282611; x=1747818611;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VRB5N0MgRnYLPQ15PdnHvayDQuQGcs+msPfn9x9k/k8=;
 b=CcsdJF+8V5X2R3GSJye/IUfRIMTMW/9AOny5MXpBjS6c9oT3mdsW6gWK
 GdQxfje10ZP5JkMucQ2GKYlNmAF/UA4Kb44gahvziweaojCrQBf5v3Bzf
 zOhDSkwRJ6tgjwHghoxT5Ho8MvcoXQ01r8FBdWs/NYMrD75QBHgxJZsny
 vmLnz+F7xcZI+4ZDAwVz+Xjs79RJYjdQwqT7O1fwSBBPeLHq3msf0BGg6
 AaJV9hRWzACTp0+OQ+ih+nHA5lvobrRuVqFpRlNgDhJcielm5u01Xp/up
 eZjhQGb5traJxeAugNx+PT5EQbeeRoZ89I8AzGqg+qTR2t6RhoIRI7XrS w==;
X-CSE-ConnectionGUID: +4i5Sia3SImQBsf1BlwK/g==
X-CSE-MsgGUID: 5pFPrSJ/SGyyK/Rvhuop+w==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="23130748"
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="23130748"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 02:10:10 -0700
X-CSE-ConnectionGUID: TJlgYcBiSvihK28LzdR4HA==
X-CSE-MsgGUID: wu/2i05tT3OACsRVnuIaCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="33018240"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 02:10:09 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 vinay.belgaumkar@intel.com
Subject: [PATCH v2 1/2] drm/xe: Standardize power gate registers
Date: Tue, 21 May 2024 14:52:00 +0530
Message-Id: <20240521092201.4183305-2-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20240521092201.4183305-1-riana.tauro@intel.com>
References: <20240521092201.4183305-1-riana.tauro@intel.com>
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

Standardize power gate registers

No functional changes

v2: change commit message (Rodrigo)

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  8 +++-----
 drivers/gpu/drm/xe/xe_gt_idle.c      |  2 +-
 drivers/gpu/drm/xe/xe_wa.c           | 10 +++++-----
 3 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 9cacdcfe27ff..7c173db7d585 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -316,11 +316,9 @@
 
 #define FORCEWAKE_GT				XE_REG(0xa188)
 
-#define PG_ENABLE				XE_REG(0xa210)
-#define   VD2_MFXVDENC_POWERGATE_ENABLE		REG_BIT(8)
-#define   VD2_HCP_POWERGATE_ENABLE		REG_BIT(7)
-#define   VD0_MFXVDENC_POWERGATE_ENABLE		REG_BIT(4)
-#define   VD0_HCP_POWERGATE_ENABLE		REG_BIT(3)
+#define POWERGATE_ENABLE			XE_REG(0xa210)
+#define   VDN_HCP_POWERGATE_ENABLE(n)		REG_BIT(3 + 2 * (n))
+#define   VDN_MFXVDENC_POWERGATE_ENABLE(n)	REG_BIT(4 + 2 * (n))
 
 #define CTC_MODE				XE_REG(0xa26c)
 #define   CTC_SHIFT_PARAMETER_MASK		REG_GENMASK(2, 1)
diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
index a4f6f0a96d05..4384f7e80258 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle.c
+++ b/drivers/gpu/drm/xe/xe_gt_idle.c
@@ -202,7 +202,7 @@ void xe_gt_idle_disable_c6(struct xe_gt *gt)
 	xe_device_assert_mem_access(gt_to_xe(gt));
 	xe_force_wake_assert_held(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 
-	xe_mmio_write32(gt, PG_ENABLE, 0);
+	xe_mmio_write32(gt, POWERGATE_ENABLE, 0);
 	xe_mmio_write32(gt, RC_CONTROL, 0);
 	xe_mmio_write32(gt, RC_STATE, 0);
 }
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 05db53c1448c..64bc595fc727 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -238,11 +238,11 @@ static const struct xe_rtp_entry_sr gt_was[] = {
 	},
 	{ XE_RTP_NAME("14020316580"),
 	  XE_RTP_RULES(MEDIA_VERSION(1301)),
-	  XE_RTP_ACTIONS(CLR(PG_ENABLE,
-			     VD0_HCP_POWERGATE_ENABLE |
-			     VD0_MFXVDENC_POWERGATE_ENABLE |
-			     VD2_HCP_POWERGATE_ENABLE |
-			     VD2_MFXVDENC_POWERGATE_ENABLE)),
+	  XE_RTP_ACTIONS(CLR(POWERGATE_ENABLE,
+			     VDN_HCP_POWERGATE_ENABLE(0) |
+			     VDN_MFXVDENC_POWERGATE_ENABLE(0) |
+			     VDN_HCP_POWERGATE_ENABLE(2) |
+			     VDN_MFXVDENC_POWERGATE_ENABLE(2))),
 	},
 	{ XE_RTP_NAME("14019449301"),
 	  XE_RTP_RULES(MEDIA_VERSION(1301), ENGINE_CLASS(VIDEO_DECODE)),
-- 
2.40.0

