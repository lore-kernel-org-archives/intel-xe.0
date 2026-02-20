Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B21C5518E
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 10:17:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAC2F10E7DD;
	Fri, 20 Feb 2026 10:16:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eANIQmMY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1F2710E7DD
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Feb 2026 10:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771582616; x=1803118616;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y8Qk2OT8dKEjoHQPUTopLN7YWwDj1xFZmuaAxr/ENXU=;
 b=eANIQmMYRI871K1n9roLRL3WNW3Fe2m6iTvXah84rM94gkct8hK2rA5B
 wSGYCPV4yqLwAN+eIXxOZhsFw0WpNAzuWW8CFlHwyBx13fpkA16qWV64V
 CrJwXOLMidGA4ysjBn7bdGFcpHKlKoT6zXF8IjcNc77a3mIHJzEWJj9rx
 SEhOSWI+anCcfHrOZ7b/MhUoGQ7Hj1Rr9+bl54W353eIsbfT44xq2E+/E
 Q/CPFh3y62w/mEoSERzapdhhtPDcTbPtKj7GvsV6KfCNPlGUlA1mHBeV0
 Wg1humjej2j95Sa2Y/0V3DXi2rj2tAtB0qfT3bejJprVxRrqjfQ5AiOUh A==;
X-CSE-ConnectionGUID: kqS5nVO9SBWhKIk35iF5dg==
X-CSE-MsgGUID: tQmVxXmwR4mUMoOjrlP2Hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="72579908"
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; d="scan'208";a="72579908"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 02:16:56 -0800
X-CSE-ConnectionGUID: ITJ1bW6JT2yBlMEHR8uN1Q==
X-CSE-MsgGUID: obHm5vFARFKQbCYJakF3GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; d="scan'208";a="214666667"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 02:16:54 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, thomas.hellstrom@linux.intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V3 2/4] drm/xe/pat: define coh_mode 2way
Date: Fri, 20 Feb 2026 15:46:41 +0530
Message-ID: <20260220101638.1609775-8-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260220101638.1609775-6-tejas.upadhyay@intel.com>
References: <20260220101638.1609775-6-tejas.upadhyay@intel.com>
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

