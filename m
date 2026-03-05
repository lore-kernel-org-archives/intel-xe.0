Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC3E7F30955
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 12:03:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D7F810E293;
	Thu,  5 Mar 2026 12:03:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m0LW8KhR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B38D10E289
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Mar 2026 12:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772712196; x=1804248196;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=7jiAxoMkkMhZrPXIEMzgYRDyqV/DMi8tZS7nSBsbj+E=;
 b=m0LW8KhRn6ZfUMQ2V8bTBPYRVQnilEjEffXdokqOTo/p1vqMWbZP+0HQ
 4sorK+SJaZRctMANT0ZSWEcww9QBqZz3jJsJjQtpa070hpL4Ww71c5QsC
 34EqOLZZO9DidDq4PshbZnbv0sOrdrzhiivoGCecPTcIWTt6JKNSQTd3m
 f2nftPQKv7hD5ENdOKlG3d9GBjfSWZCNoaIjM2JK3U03Z/zObY1Y9KQH9
 T0RvJ/Fn8/N69No3+9lxh7bqXyxNbRw7QET+Sx/LA41GXtEmoM/wrzqKC
 DjTxRv2U4wg2Rwgifm4bAgP03qGajrgWL/dsNjhRn6N4bJYvDIfIJIZtx A==;
X-CSE-ConnectionGUID: miRlIUmcSZ6NAN14beb4/Q==
X-CSE-MsgGUID: mhS8NhL4T9KhhtvySD+q8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73702527"
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; d="scan'208";a="73702527"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 04:03:16 -0800
X-CSE-ConnectionGUID: PFZIeg5JQlOUmWJxmSVrpw==
X-CSE-MsgGUID: q/UikxLBSNSyl5f/6+zVBA==
X-ExtLoop1: 1
Received: from iherna2-mobl4.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.220.218])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 04:03:15 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Thu, 05 Mar 2026 09:02:34 -0300
Subject: [PATCH 7/7] drm/xe: Translate C-state "reset value" into RC6
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-extra-nvl-p-enabling-patches-v1-7-5020d5289dea@intel.com>
References: <20260305-extra-nvl-p-enabling-patches-v1-0-5020d5289dea@intel.com>
In-Reply-To: <20260305-extra-nvl-p-enabling-patches-v1-0-5020d5289dea@intel.com>
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

There are higher level sleep states that will cause RC6 state readout to
come back with an "in-reset" value. That is the case with NVL-P. As
those states are only possible if the GT is already in C6, let's just
translate the "reset value" into C6 when doing the readout.

Bspec: 67651
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

