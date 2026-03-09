Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 128E3FCA195
	for <intel-xe@archiver.kernel.org>; Mon,  9 Mar 2026 21:40:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C144A10E5C7;
	Mon,  9 Mar 2026 21:40:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EcmbUPyz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94A4B10E5D2
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Mar 2026 21:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773092420; x=1804628420;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=nhFCpZPE9FC5CDn1IaQ36ZZSmpn9Ws386/Tu2RnaxSQ=;
 b=EcmbUPyz50Nvud27lxNzyRfds+AxURYGJJgLiA6KNwy/9PBw6+UJPJmp
 hIPBnzmCiKc6U82LZIsQNIihM0ve8FrjxOBsS3NFY22oJ+/rY8VA164Pv
 /GES2vXnBo3YMJ1iuyPrrlaqunvCb1+MtoMlEd5h9Bafjz/t+GTANhaD+
 9f9uxXVsZ0VzcT4Jy2prpLa0+OGSleWcy7V49T+DV01ByudWLglbB7p4y
 7JyCo/Bl4cs8TjHXXDeBnD/DpsHQ7UtcbbkvYjM+B3WBsPM83lZJ+jXho
 YU0KgvUEq9xOQ7YTik8CfVPzWJewfLqajyQ3K6ICYffdXCkZphtT+pXlg A==;
X-CSE-ConnectionGUID: v8QvYLPmRBW3IfdLkfsxCg==
X-CSE-MsgGUID: 14pct3YTS+Op0jxf1vYQsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="91702276"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; d="scan'208";a="91702276"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 14:40:20 -0700
X-CSE-ConnectionGUID: FqydFZhjSmmddayx2/x9sA==
X-CSE-MsgGUID: EIbhJ9GzS/Obw1ClAtUtLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; d="scan'208";a="216346749"
Received: from jjgreens-desk21.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.146])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 14:40:18 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Mon, 09 Mar 2026 18:39:51 -0300
Subject: [PATCH v4 8/8] drm/xe: Translate C-state "reset value" into RC6
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-extra-nvl-p-enabling-patches-v4-8-2e7fcead971a@intel.com>
References: <20260309-extra-nvl-p-enabling-patches-v4-0-2e7fcead971a@intel.com>
In-Reply-To: <20260309-extra-nvl-p-enabling-patches-v4-0-2e7fcead971a@intel.com>
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

