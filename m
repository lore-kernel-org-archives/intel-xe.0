Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 599BAC54FB3
	for <intel-xe@archiver.kernel.org>; Mon,  2 Jun 2025 10:33:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0388F10E185;
	Mon,  2 Jun 2025 10:33:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T+LwxD5m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46C68895EE
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Jun 2025 10:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748860417; x=1780396417;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qjBUUTMymclpspXajl4ToU62Bh6TcofYW4rLFmEPfs0=;
 b=T+LwxD5mDwmRH533OWezGWbA2H31gsQLO9yrUP3K6vhb1UuVvAFbJhtl
 TDq58vfNJg/dXOY1Z0pgMGBJkbUQwOIbG2zcYKS4qkQNNTvoy/6atIkfl
 cnss3NupjUyX1W7OO/KlJgOd5ds9XVTxB5LQchckU9qM5BURysF/EqDn+
 DuX4Qf3b8HJzV1b8MuN+soXDa/3vKmTf10dw12Mxx/uatPW5/84kSgLns
 xuXdc2zNrI9ON/AVE2fsdEo2ZzEsXYzg2+q5SeoisFCHjltlE9gn3KHEr
 NB16c04BLz2z2cff72AZGyWs/s4cY1eRIGTBE0LD824OwtGHK78ctlEV8 Q==;
X-CSE-ConnectionGUID: vjV5JwuGQtKm+d2ud8EaCg==
X-CSE-MsgGUID: zzSotJHXQ9+CCqn5uByzUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11450"; a="61123322"
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; d="scan'208";a="61123322"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 03:33:37 -0700
X-CSE-ConnectionGUID: 0opPrRpPRAK8c42B2piYCg==
X-CSE-MsgGUID: axW28v5iS2m1X+b6ZFywdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; d="scan'208";a="149652003"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.84.121])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 03:33:35 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Tomasz Lis <tomasz.lis@intel.com>
Subject: [PATCH 1/3] drm/xe/vf: Introduce helpers to access GGTT configuration
Date: Mon,  2 Jun 2025 12:33:23 +0200
Message-Id: <20250602103325.549-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20250602103325.549-1-michal.wajdeczko@intel.com>
References: <20250602103325.549-1-michal.wajdeczko@intel.com>
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

In upcoming patch we want to separate tile-oriented VF functions
from GT-oriented functions and to allow the former access a GGTT
configuration stored at GT level we need to provide some helpers.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 34 +++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h |  5 ++++-
 2 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 4ff7ae1a5f16..acfb3b1b0832 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -561,6 +561,40 @@ u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt)
 	return gt->sriov.vf.self_config.lmem_size;
 }
 
+/**
+ * xe_gt_sriov_vf_ggtt - VF GGTT configuration.
+ * @gt: the &xe_gt
+ *
+ * This function is for VF use only.
+ *
+ * Return: size of the GGTT assigned to VF.
+ */
+u64 xe_gt_sriov_vf_ggtt(struct xe_gt *gt)
+{
+	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
+	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
+	xe_gt_assert(gt, gt->sriov.vf.self_config.ggtt_size);
+
+	return gt->sriov.vf.self_config.ggtt_size;
+}
+
+/**
+ * xe_gt_sriov_vf_ggtt_base - VF GGTT base offset.
+ * @gt: the &xe_gt
+ *
+ * This function is for VF use only.
+ *
+ * Return: base offset of the GGTT assigned to VF.
+ */
+u64 xe_gt_sriov_vf_ggtt_base(struct xe_gt *gt)
+{
+	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
+	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
+	xe_gt_assert(gt, gt->sriov.vf.self_config.ggtt_size);
+
+	return gt->sriov.vf.self_config.ggtt_base;
+}
+
 /**
  * xe_gt_sriov_vf_ggtt_shift - Return shift in GGTT range due to VF migration
  * @gt: the &xe_gt struct instance
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
index 9db41afddd5a..2f96ac0c5dca 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
@@ -20,7 +20,6 @@ int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
 int xe_gt_sriov_vf_prepare_ggtt(struct xe_gt *gt);
 int xe_gt_sriov_vf_balloon_ggtt_locked(struct xe_gt *gt);
 void xe_gt_sriov_vf_deballoon_ggtt_locked(struct xe_gt *gt);
-s64 xe_gt_sriov_vf_ggtt_shift(struct xe_gt *gt);
 void xe_gt_sriov_vf_fixup_ggtt_nodes(struct xe_gt *gt, s64 shift);
 int xe_gt_sriov_vf_notify_resfix_done(struct xe_gt *gt);
 void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
@@ -28,6 +27,10 @@ void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
 u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
 u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
 u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt);
+u64 xe_gt_sriov_vf_ggtt(struct xe_gt *gt);
+u64 xe_gt_sriov_vf_ggtt_base(struct xe_gt *gt);
+s64 xe_gt_sriov_vf_ggtt_shift(struct xe_gt *gt);
+
 u32 xe_gt_sriov_vf_read32(struct xe_gt *gt, struct xe_reg reg);
 void xe_gt_sriov_vf_write32(struct xe_gt *gt, struct xe_reg reg, u32 val);
 
-- 
2.47.1

