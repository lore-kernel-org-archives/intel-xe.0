Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11356CCF9F8
	for <intel-xe@archiver.kernel.org>; Wed,  5 Nov 2025 18:33:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4E1A10E2F2;
	Wed,  5 Nov 2025 18:33:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fQpdYAzw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA43310E2F2
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Nov 2025 18:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762367589; x=1793903589;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=t3kXCO1mzazCeiEUSgC051m7kBHsZE78TvLVG34EJ6I=;
 b=fQpdYAzw47LVXu1JVskfJmmcSV57wHQmegUuCfVn+l00pQSQ+Zxxhj4E
 1MjX8hsraUuDYTGZeVRbolkBBfEtmw5pwrTbPGP9hoqU6L5BRLEiml/R2
 2td047k58p2zxzhYXxM2Wn5pYLOL26fCllGZ1z276bO5u0tcQKvfe/ooj
 w4gUoIueG/uTiPzBYYQLzRoGqWnJocOsDarR0gGBoAIpd3AKCgwjb8tUT
 h7QR60rdXcDCoPqTG4RfHEFBmwQOp3EbK9rYzOF+A+9kkHp/EBq7n9HlQ
 UR9oMIVv9YNZu5R85Htz5c4p+kl0Bi+3gYQpcEBANO85yrIS20MH5hpIe w==;
X-CSE-ConnectionGUID: Hu47d1ttQDuZA1iEStqv5A==
X-CSE-MsgGUID: KaMWprJHQkGzC/3ntvybaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="64591471"
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="64591471"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 10:33:09 -0800
X-CSE-ConnectionGUID: fr/9723zRYGHC0QuHLxeog==
X-CSE-MsgGUID: UlOfMcfaQCqs8qNQ2TfgoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="187477927"
Received: from mtripa2-mobl.gar.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.94.252.236])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 10:33:08 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 2/3] drm/xe/pf: Use migration-friendly doorbells
 auto-provisioning
Date: Wed,  5 Nov 2025 19:32:51 +0100
Message-ID: <20251105183253.863-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251105183253.863-1-michal.wajdeczko@intel.com>
References: <20251105183253.863-1-michal.wajdeczko@intel.com>
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

Instead of trying very hard to find the largest fair number of GuC
doorbell IDs that could be allocated for VFs on the current GT, pick
some smaller rounded down to power-of-two value that is more likely
to be provisioned in the same manner by the other PF instance:

  num VFs | num doorbells
  --------+--------------
   63..32 | 4
   31..16 | 8
   15..8  | 16
    7..4  | 32
    3..2  | 64
       1  | 128 (regular PF)
       1  | 240 (admin only PF)

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 14feda215d5b..701889e5dded 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1249,6 +1249,17 @@ int xe_gt_sriov_pf_config_bulk_set_dbs(struct xe_gt *gt, unsigned int vfid,
 					   "GuC doorbell IDs", no_unit, n, err);
 }
 
+static u32 pf_profile_fair_dbs(struct xe_gt *gt, unsigned int num_vfs)
+{
+	bool admin_only_pf = xe_sriov_pf_admin_only(gt_to_xe(gt));
+
+	/* XXX: preliminary */
+	if (admin_only_pf && num_vfs == 1)
+		return GUC_NUM_DOORBELLS - SZ_16;
+
+	return rounddown_pow_of_two(GUC_NUM_DOORBELLS / (num_vfs + 1));
+}
+
 static u32 pf_estimate_fair_dbs(struct xe_gt *gt, unsigned int num_vfs)
 {
 	struct xe_guc_db_mgr *dbm = &gt->uc.guc.dbm;
@@ -1281,6 +1292,7 @@ static u32 pf_estimate_fair_dbs(struct xe_gt *gt, unsigned int num_vfs)
 int xe_gt_sriov_pf_config_set_fair_dbs(struct xe_gt *gt, unsigned int vfid,
 				       unsigned int num_vfs)
 {
+	u32 profile = pf_profile_fair_dbs(gt, num_vfs);
 	u32 fair;
 
 	xe_gt_assert(gt, vfid);
@@ -1293,6 +1305,11 @@ int xe_gt_sriov_pf_config_set_fair_dbs(struct xe_gt *gt, unsigned int vfid,
 	if (!fair)
 		return -ENOSPC;
 
+	fair = min(fair, profile);
+	if (fair < profile)
+		xe_gt_sriov_info(gt, "Using non-profile provisioning (%s %u vs %u)\n",
+				 "GuC doorbell IDs", fair, profile);
+
 	return xe_gt_sriov_pf_config_bulk_set_dbs(gt, vfid, num_vfs, fair);
 }
 
-- 
2.47.1

