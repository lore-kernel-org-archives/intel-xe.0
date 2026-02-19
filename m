Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4742E9A03B
	for <intel-xe@archiver.kernel.org>; Thu, 19 Feb 2026 11:38:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71CFE10E6E9;
	Thu, 19 Feb 2026 11:38:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nNXOrUHv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD1F610E012
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Feb 2026 11:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771501101; x=1803037101;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y8Qk2OT8dKEjoHQPUTopLN7YWwDj1xFZmuaAxr/ENXU=;
 b=nNXOrUHvLt/ua+TmxPjchdb3OTZqrRaMpvhi0XEeBNAC165hvNj6X+Zb
 u8RXK4uPmem6wZny3UfCsD9OP9oVhHGYT7F1NAok0Iqt0qH17o1PzHUQK
 xsmbKVPWNCf39AzI2/V+gab0fPl3ClURm6Fr7+VZk3uUh6cvP8bYL38FU
 p36WB/iAset1mXzpdZBocpNTMBcFOSqu6nu+2CmGwvlhnv453BGD5MErp
 9MTUIRxvV+vxBJkJDsGS4+OYloD6IjpJ7+QqUvBPYbaNe+0xm34guXCZ8
 cCRfyRHuvjB0DH4uir+vvCs7/N5Ia+kyFgt/Q93AYE8VOKem6GdO2iw2a w==;
X-CSE-ConnectionGUID: XP9SEMORTkuXka9TnY1VvQ==
X-CSE-MsgGUID: RMpADBtCSfuKL9w61u48Aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="76199664"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="76199664"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 03:38:21 -0800
X-CSE-ConnectionGUID: HAoXchzaSuWjt2EtbCNSnw==
X-CSE-MsgGUID: ob4mZrt5S2+mGgsCvBhmzw==
X-ExtLoop1: 1
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 03:38:19 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, thomas.hellstrom@linux.intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V2 2/4] drm/xe/pat: define coh_mode 2way
Date: Thu, 19 Feb 2026 17:07:46 +0530
Message-ID: <20260219113743.1588081-8-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260219113743.1588081-6-tejas.upadhyay@intel.com>
References: <20260219113743.1588081-6-tejas.upadhyay@intel.com>
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

Defining 2way (two-way coherency) is critical for
Xe3p_LPG (Nova Lake P) platforms to support L2 flush
optimization safely.

This mode allows the driver to skip certain manual cache
flushes (L2 flush optimization) without risking memory
corruption because the hardware ensures the most recent
data is visible to both entities.

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_pat.c        | 14 +++++++-------
 drivers/gpu/drm/xe/xe_pat.h        |  5 +++--
 drivers/gpu/drm/xe/xe_vm.c         |  2 +-
 drivers/gpu/drm/xe/xe_vm_madvise.c |  2 +-
 4 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index f840d9a58740..bf581afd4d60 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -92,7 +92,7 @@ struct xe_pat_ops {
 };
 
 static const struct xe_pat_table_entry xelp_pat_table[] = {
-	[0] = { XELP_PAT_WB, XE_COH_AT_LEAST_1WAY },
+	[0] = { XELP_PAT_WB, XE_COH_1WAY },
 	[1] = { XELP_PAT_WC, XE_COH_NONE },
 	[2] = { XELP_PAT_WT, XE_COH_NONE },
 	[3] = { XELP_PAT_UC, XE_COH_NONE },
@@ -102,19 +102,19 @@ static const struct xe_pat_table_entry xehpc_pat_table[] = {
 	[0] = { XELP_PAT_UC, XE_COH_NONE },
 	[1] = { XELP_PAT_WC, XE_COH_NONE },
 	[2] = { XELP_PAT_WT, XE_COH_NONE },
-	[3] = { XELP_PAT_WB, XE_COH_AT_LEAST_1WAY },
+	[3] = { XELP_PAT_WB, XE_COH_1WAY },
 	[4] = { XEHPC_PAT_CLOS(1) | XELP_PAT_WT, XE_COH_NONE },
-	[5] = { XEHPC_PAT_CLOS(1) | XELP_PAT_WB, XE_COH_AT_LEAST_1WAY },
+	[5] = { XEHPC_PAT_CLOS(1) | XELP_PAT_WB, XE_COH_1WAY },
 	[6] = { XEHPC_PAT_CLOS(2) | XELP_PAT_WT, XE_COH_NONE },
-	[7] = { XEHPC_PAT_CLOS(2) | XELP_PAT_WB, XE_COH_AT_LEAST_1WAY },
+	[7] = { XEHPC_PAT_CLOS(2) | XELP_PAT_WB, XE_COH_1WAY },
 };
 
 static const struct xe_pat_table_entry xelpg_pat_table[] = {
 	[0] = { XELPG_PAT_0_WB, XE_COH_NONE },
 	[1] = { XELPG_PAT_1_WT, XE_COH_NONE },
 	[2] = { XELPG_PAT_3_UC, XE_COH_NONE },
-	[3] = { XELPG_PAT_0_WB | XELPG_2_COH_1W, XE_COH_AT_LEAST_1WAY },
-	[4] = { XELPG_PAT_0_WB | XELPG_3_COH_2W, XE_COH_AT_LEAST_1WAY },
+	[3] = { XELPG_PAT_0_WB | XELPG_2_COH_1W, XE_COH_1WAY },
+	[4] = { XELPG_PAT_0_WB | XELPG_3_COH_2W, XE_COH_2WAY },
 };
 
 /*
@@ -147,7 +147,7 @@ static const struct xe_pat_table_entry xelpg_pat_table[] = {
 			REG_FIELD_PREP(XE2_L3_POLICY, l3_policy) | \
 			REG_FIELD_PREP(XE2_L4_POLICY, l4_policy) | \
 			REG_FIELD_PREP(XE2_COH_MODE, __coh_mode), \
-		.coh_mode = __coh_mode ? XE_COH_AT_LEAST_1WAY : XE_COH_NONE, \
+		.coh_mode = __coh_mode ? __coh_mode : XE_COH_NONE, \
 		.valid = 1 \
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
index c7e2a53d8cee..a1e287c08f57 100644
--- a/drivers/gpu/drm/xe/xe_pat.h
+++ b/drivers/gpu/drm/xe/xe_pat.h
@@ -28,8 +28,9 @@ struct xe_pat_table_entry {
 	/**
 	 * @coh_mode: The GPU coherency mode that @value maps to.
 	 */
-#define XE_COH_NONE          1
-#define XE_COH_AT_LEAST_1WAY 2
+#define XE_COH_NONE		1
+#define XE_COH_1WAY		2
+#define XE_COH_2WAY		3
 	u16 coh_mode;
 
 	/**
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index a46f11a71c37..c06fd250e037 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3449,7 +3449,7 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
 			goto free_bind_ops;
 		}
 
-		if (XE_WARN_ON(coh_mode > XE_COH_AT_LEAST_1WAY)) {
+		if (XE_WARN_ON(coh_mode > XE_COH_2WAY)) {
 			err = -EINVAL;
 			goto free_bind_ops;
 		}
diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index 52147f5eaaa0..1a1ad8c07d49 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -301,7 +301,7 @@ static bool madvise_args_are_sane(struct xe_device *xe, const struct drm_xe_madv
 		if (XE_IOCTL_DBG(xe, !coh_mode))
 			return false;
 
-		if (XE_WARN_ON(coh_mode > XE_COH_AT_LEAST_1WAY))
+		if (XE_WARN_ON(coh_mode > XE_COH_2WAY))
 			return false;
 
 		if (XE_IOCTL_DBG(xe, args->pat_index.pad))
-- 
2.52.0

