Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13A81CCFA13
	for <intel-xe@archiver.kernel.org>; Wed,  5 Nov 2025 18:33:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C71CF10E098;
	Wed,  5 Nov 2025 18:33:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D/uR70oh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26BA410E098
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Nov 2025 18:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762367588; x=1793903588;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=we7gj/W7AXmYoSTpkfB+/Pg8nbu8iQVFjMXngxiBWOY=;
 b=D/uR70oh80EWw8qKT2W6rTCcxRhR9DV+Jz+YyPfoiSi40snHMrfthOFI
 HYcd7SeiYnAeeYaJOIdwLTIR5A7/i18tLTIXT5T1a2YdFlp9xHyYPOd28
 zuqcZ8OB8sVoHPTrGTN4yxt2lSjwRvWzTsVM6negck7yWDN2jd8D7o7A0
 pVJAcwFMa54HiuHHlKypXI794JI+iFxahs7Yuhp3D4/PXiI13bDXwkqoi
 dpdziU4Rge1tgXpnT8+mk5bLYQkVfOTC/iDCbldgtgpAv05Zjkf3J/xo8
 SlJfksGDHKxlItQHZMwUNWIHJ7Iw3tZm6YkQKQ/CpKtHgbb7hnLMNvGKP g==;
X-CSE-ConnectionGUID: igNkejn0QsmrgbfMJwW96Q==
X-CSE-MsgGUID: i63bGtt0RMewwkgrpxejFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="64591465"
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="64591465"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 10:33:08 -0800
X-CSE-ConnectionGUID: iIVerCecSXujdtLmDdI1EA==
X-CSE-MsgGUID: MDlMTi/4SoK6HmYWD6MhSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="187477918"
Received: from mtripa2-mobl.gar.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.94.252.236])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 10:33:06 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 1/3] drm/xe/pf: Use migration-friendly context IDs
 auto-provisioning
Date: Wed,  5 Nov 2025 19:32:50 +0100
Message-ID: <20251105183253.863-2-michal.wajdeczko@intel.com>
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
context IDs that could be allocated for VFs on the current GT, pick
some smaller rounded down to power-of-two value that is more likely
to be provisioned in the same manner by the other PF instance:

 num VFs | num contexts
 --------+-------------
  63..32 | 1024
  31..16 | 2048
  15..8  | 4096
   7..4  | 8192
   3..2  | 16384
      1  | 32768 (regular PF)
      1  | 64512 (admin only PF)

Add also helper function to determine if the PF is admin-only,
and for now use .probe_display flag for that.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 16 ++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_pf_helpers.h   | 11 +++++++++++
 2 files changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index d90261a7ab7c..14feda215d5b 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -985,6 +985,16 @@ int xe_gt_sriov_pf_config_bulk_set_ctxs(struct xe_gt *gt, unsigned int vfid,
 					   "GuC context IDs", no_unit, n, err);
 }
 
+static u32 pf_profile_fair_ctxs(struct xe_gt *gt, unsigned int num_vfs)
+{
+	bool admin_only_pf = xe_sriov_pf_admin_only(gt_to_xe(gt));
+
+	if (admin_only_pf && num_vfs == 1)
+		return ALIGN_DOWN(GUC_ID_MAX, SZ_1K);
+
+	return rounddown_pow_of_two(GUC_ID_MAX / num_vfs);
+}
+
 static u32 pf_estimate_fair_ctxs(struct xe_gt *gt, unsigned int num_vfs)
 {
 	struct xe_guc_id_mgr *idm = &gt->uc.guc.submission_state.idm;
@@ -1017,6 +1027,7 @@ static u32 pf_estimate_fair_ctxs(struct xe_gt *gt, unsigned int num_vfs)
 int xe_gt_sriov_pf_config_set_fair_ctxs(struct xe_gt *gt, unsigned int vfid,
 					unsigned int num_vfs)
 {
+	u32 profile = pf_profile_fair_ctxs(gt, num_vfs);
 	u32 fair;
 
 	xe_gt_assert(gt, vfid);
@@ -1029,6 +1040,11 @@ int xe_gt_sriov_pf_config_set_fair_ctxs(struct xe_gt *gt, unsigned int vfid,
 	if (!fair)
 		return -ENOSPC;
 
+	fair = min(fair, profile);
+	if (fair < profile)
+		xe_gt_sriov_info(gt, "Using non-profile provisioning (%s %u vs %u)\n",
+				 "GuC context IDs", fair, profile);
+
 	return xe_gt_sriov_pf_config_bulk_set_ctxs(gt, vfid, num_vfs, fair);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h b/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h
index 4a4340fb633a..3ddeba4451cd 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h
@@ -48,6 +48,17 @@ static inline unsigned int xe_sriov_pf_num_vfs(const struct xe_device *xe)
 	return pci_num_vf(to_pci_dev(xe->drm.dev));
 }
 
+/**
+ * xe_sriov_pf_admin_only() - Check if PF is mainly used for VFs administration.
+ * @xe: the PF &xe_device
+ *
+ * Return: True if PF is mainly used for VFs administration.
+ */
+static inline bool xe_sriov_pf_admin_only(const struct xe_device *xe)
+{
+	return !xe->info.probe_display;
+}
+
 static inline struct mutex *xe_sriov_pf_master_mutex(struct xe_device *xe)
 {
 	xe_assert(xe, IS_SRIOV_PF(xe));
-- 
2.47.1

