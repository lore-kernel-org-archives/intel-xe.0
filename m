Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7817E9A02C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Feb 2026 20:56:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E0CB10E62E;
	Wed, 18 Feb 2026 20:56:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TUt732nb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09DA210E627
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Feb 2026 20:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771448190; x=1802984190;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pVeXEwBRqDDhKkQ81Ymk1YJ54mHlTHiDr11IcwYyifQ=;
 b=TUt732nbBf+oty+y6VLRYCuogswsoFWqe2WDWVqqtGle4s2sE6+yd9RD
 xcHiKbdXpGtx5vRc2C24PLqGHhsopguzPSI5lLRp3JA+qBxhHFqBmk3Cp
 pQcgSHtL0MyJUOI9akDfGBLcstwieqKMR2UNTcnqjNYdc9ZzG7jCOhdPX
 HIePIB7dTIf/gdsS9DqGvnmVcWLkHt2EuzWiG34v5yHzP7xOsDezzuqlm
 I7Fd6ayiV+vQPIs8rEVEWJHAgOl9x2iIQ5e6JtCKUkBoYiRfs8Zbf78Ji
 UB9trZiWsHVzgT12DxfgGSbCQokUkegQYHQ32TV4Lgl9A+RSWpDi9Bx79 w==;
X-CSE-ConnectionGUID: dz1bURZGSSyViwrp1nUr7Q==
X-CSE-MsgGUID: ewtrl0XlRcO18vtNhPrajg==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="72710596"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="72710596"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 12:56:30 -0800
X-CSE-ConnectionGUID: 1ONmSDyAQturf9U/kt7FPw==
X-CSE-MsgGUID: NDh0mSBoRYiyXhGQkEfxSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="213548258"
Received: from unknown (HELO mwajdecz-hp.clients.intel.com) ([10.246.18.5])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 12:56:28 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v2 05/10] drm/xe/pf: Use migration-friendly VRAM
 auto-provisioning
Date: Wed, 18 Feb 2026 21:55:47 +0100
Message-ID: <20260218205553.3561-6-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260218205553.3561-1-michal.wajdeczko@intel.com>
References: <20260218205553.3561-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Instead of trying very hard to find the largest fair VRAM (aka LMEM)
size that could be allocated for VFs on the current tile, pick some
smaller rounded down to power-of-two value that is more likely to be
provisioned in the same manner by the other PF instances.

In some cases, the outcome of above calculation might not be optimal,
but it's expected that admin will do fine-tuning using sysfs files.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
v2: account for min_spare for PF (Piotr)
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index f67c8822e592..72cd46554230 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1900,6 +1900,28 @@ static u64 pf_estimate_fair_lmem(struct xe_gt *gt, unsigned int num_vfs)
 	return fair;
 }
 
+static u64 pf_profile_fair_lmem(struct xe_gt *gt, unsigned int num_vfs)
+{
+	struct xe_tile *tile = gt_to_tile(gt);
+	bool admin_only_pf = xe_sriov_pf_admin_only(tile->xe);
+	u64 usable = xe_vram_region_usable_size(tile->mem.vram);
+	u64 spare = pf_get_min_spare_lmem(gt);
+	u64 available = usable > spare ? usable - spare : 0;
+	u64 shareable = ALIGN_DOWN(available, SZ_1G);
+	u64 alignment = pf_get_lmem_alignment(gt);
+	u64 fair;
+
+	if (admin_only_pf)
+		fair = div_u64(shareable, num_vfs);
+	else
+		fair = div_u64(shareable, 1 + num_vfs);
+
+	if (!admin_only_pf && fair)
+		fair = rounddown_pow_of_two(fair);
+
+	return ALIGN_DOWN(fair, alignment);
+}
+
 /**
  * xe_gt_sriov_pf_config_set_fair_lmem - Provision many VFs with fair LMEM.
  * @gt: the &xe_gt (can't be media)
@@ -1913,6 +1935,7 @@ static u64 pf_estimate_fair_lmem(struct xe_gt *gt, unsigned int num_vfs)
 int xe_gt_sriov_pf_config_set_fair_lmem(struct xe_gt *gt, unsigned int vfid,
 					unsigned int num_vfs)
 {
+	u64 profile;
 	u64 fair;
 
 	xe_gt_assert(gt, vfid);
@@ -1929,6 +1952,12 @@ int xe_gt_sriov_pf_config_set_fair_lmem(struct xe_gt *gt, unsigned int vfid,
 	if (!fair)
 		return -ENOSPC;
 
+	profile = pf_profile_fair_lmem(gt, num_vfs);
+	fair = min(fair, profile);
+	if (fair < profile)
+		xe_gt_sriov_info(gt, "Using non-profile provisioning (%s %llu vs %llu)\n",
+				 "VRAM", fair, profile);
+
 	return xe_gt_sriov_pf_config_bulk_set_lmem(gt, vfid, num_vfs, fair);
 }
 
-- 
2.47.1

