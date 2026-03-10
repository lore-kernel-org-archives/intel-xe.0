Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D781FCC9A4
	for <intel-xe@archiver.kernel.org>; Tue, 10 Mar 2026 00:43:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C222210E605;
	Tue, 10 Mar 2026 00:43:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zho8L5md";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B765410E60D
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Mar 2026 00:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773103387; x=1804639387;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=nhFCpZPE9FC5CDn1IaQ36ZZSmpn9Ws386/Tu2RnaxSQ=;
 b=Zho8L5mdzQCOD/ZZJT/A1biYTk2QDcNPJ8uH3xU1vT3fzhAWBfAJtol8
 2iIpGuah4x6Q557IQVVWfCt69xBaTmGAymox2KDYDX9rDM7i4Skwt7jKS
 s51T9I9r0jJdJ3tp1M1g0mTNmflBP4sxBxI/v+gqrKVHqWaO8wEmsJdpt
 CwNSSJyGq1dwVknj13TLMwpUrnTjyo8kPR4pDUlbPpltfi+xAWurVcFuT
 p5ozhj6VAC5kwlGMbSC3FtYEEcpBSKK56FzhaYVpVmdnWTOdiu1w6bIdf
 LmBpWysPfgV4ny3jBzDqFEMMKKXPRNprBr/dWxtsAEekkJAxYAJoDiuf9 Q==;
X-CSE-ConnectionGUID: sXBqCkdkTTecRzB5Vf6Ipw==
X-CSE-MsgGUID: Keys1gO9QvWz1I+9b5i95w==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="74183514"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; d="scan'208";a="74183514"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 17:43:06 -0700
X-CSE-ConnectionGUID: iUo/qdN9Rp2orZ4VTQ1l3Q==
X-CSE-MsgGUID: eEdL27zwRsC+NLoz1p8dmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; d="scan'208";a="219063605"
Received: from jjgreens-desk21.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.146])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 17:43:05 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Mon, 09 Mar 2026 21:42:12 -0300
Subject: [PATCH v5 7/7] drm/xe: Translate C-state "reset value" into RC6
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-extra-nvl-p-enabling-patches-v5-7-be9c902ee34e@intel.com>
References: <20260309-extra-nvl-p-enabling-patches-v5-0-be9c902ee34e@intel.com>
In-Reply-To: <20260309-extra-nvl-p-enabling-patches-v5-0-be9c902ee34e@intel.com>
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

There are higher level sleep states that will cause RC6 state readout to
come back with an "in-reset" value. That is the case with NVL-P. As
those states are only possible if the GT is already in C6, let's just
translate the "reset value" into C6 when doing the readout.

Bspec: 67651
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
 drivers/gpu/drm/xe/xe_guc_pc.c       | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index f49a28f4a330..1cc8c7c2d379 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -20,6 +20,7 @@
 #define MTL_MIRROR_TARGET_WP1				XE_REG(0xc60)
 #define   MTL_CAGF_MASK					REG_GENMASK(8, 0)
 #define   MTL_CC_MASK					REG_GENMASK(12, 9)
+#define   MTL_CRST					0xf
 
 /* RPM unit config (Gen8+) */
 #define RPM_CONFIG0					XE_REG(0xd00)
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 21fe73ab4583..bb8c4e793492 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -756,6 +756,14 @@ enum xe_gt_idle_state xe_guc_pc_c_status(struct xe_guc_pc *pc)
 	if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1270) {
 		reg = xe_mmio_read32(&gt->mmio, MTL_MIRROR_TARGET_WP1);
 		gt_c_state = REG_FIELD_GET(MTL_CC_MASK, reg);
+
+		/*
+		 * There are higher level sleep states that will cause this
+		 * field to read out as its reset state, and those are only
+		 * possible after the GT is already in C6.
+		 */
+		if (gt_c_state == MTL_CRST)
+			gt_c_state = GT_C6;
 	} else {
 		reg = xe_mmio_read32(&gt->mmio, GT_CORE_STATUS);
 		gt_c_state = REG_FIELD_GET(RCN_MASK, reg);

-- 
2.52.0

