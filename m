Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B75FFCCD1AA
	for <intel-xe@archiver.kernel.org>; Tue, 21 Oct 2025 21:06:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79C8810E119;
	Tue, 21 Oct 2025 21:06:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Thn/Hzwt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A047E10E315
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Oct 2025 21:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761080761; x=1792616761;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LdNVMIGpaUbZ35ti6qj1l7gbEekwmXbnKNL0Kx16mtg=;
 b=Thn/Hzwtvd8lPvVJkN3auuiKtRDbQ60zD3jibTh3Xbi9W2K1HeQbaLNF
 2V5rfcuwkDwqbniwKI+BxWTTDbL0LaWv47QzfoIIcElSKYOSvcDGTjuiS
 ZaJWyw0cW84NsRvUMCt1u6nfIAz0xxjOv6gGVPsKRnd0ogmkvIqhJQI4Z
 Nv4YK/98bzweWC/MahNEG9V50QXK6j/R83k0ABQr+NJRzI/oHJbbabJtN
 Wus2cR152f0PPr8sy+ktB412cDrJS6Yc/u7R0jipYZnzedlAyU/9blb8Q
 AVYkNil6yZwGgpJLQlhwM6sAhxUPTTSRSRdlUb+GWlJmQwQCTlhMDktkz w==;
X-CSE-ConnectionGUID: XCslIa6aQ6aZhRgdzHXZPg==
X-CSE-MsgGUID: lnUjdm1dSsWKQ0lk88vVXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63315879"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="63315879"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 14:06:00 -0700
X-CSE-ConnectionGUID: TXSKOy1UTgKKvRJen1pbzA==
X-CSE-MsgGUID: tmReKPXSTR2Znz5WHGJ0FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="182896393"
Received: from vthervee-mobl2.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.94.249.135])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 14:05:59 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH] drm/xe/pf: Make sched_if_idle debugfs attribute write-only
Date: Tue, 21 Oct 2025 23:05:46 +0200
Message-ID: <20251021210549.2114-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
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

The meaning of the SCHED_IF_IDLE KLV has changed since GuC 70.12.0.
While it still controls the GuC scheduling parameter, it's no longer
just a flag, as it also, or foremostly, changes all VFs' scheduling
priorities to LOW (sched_if_idle=0) or NORMAL (sched_if_idle=1).

Thus reading back the value of sched_if_idle flag from the PF is now
meaningless, as any outcome of previously applied policy change can
be obsoleted, since individual VFs priorites can be changed by using
dedicated SCHED_PRIORITY KLV parameter.

Make sched_if_idle debugfs attribute write-only to avoid misuse.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
index 838beb7f6327..8d6a3cb3772f 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
@@ -21,6 +21,7 @@
 #include "xe_gt_sriov_pf_monitor.h"
 #include "xe_gt_sriov_pf_policy.h"
 #include "xe_gt_sriov_pf_service.h"
+#include "xe_guc.h"
 #include "xe_pm.h"
 #include "xe_sriov_pf.h"
 #include "xe_sriov_pf_provision.h"
@@ -112,7 +113,7 @@ static const struct drm_info_list pf_info[] = {
  *                      ├── sched_if_idle
  */
 
-#define DEFINE_SRIOV_GT_POLICY_DEBUGFS_ATTRIBUTE(POLICY, TYPE, FORMAT)		\
+#define DEFINE_SRIOV_GT_POLICY_DEBUGFS_ATTRIBUTE(POLICY, TYPE, FORMAT, TEST...)	\
 										\
 static int POLICY##_set(void *data, u64 val)					\
 {										\
@@ -136,14 +137,24 @@ static int POLICY##_get(void *data, u64 *val)					\
 {										\
 	struct xe_gt *gt = extract_gt(data);					\
 										\
+	if (PICK_ARG(COUNT_ARGS(1, ##TEST), false, POLICY##_is_write_only(gt)))	\
+		return -EPERM;							\
+										\
 	*val = xe_gt_sriov_pf_policy_get_##POLICY(gt);				\
 	return 0;								\
 }										\
 										\
 DEFINE_DEBUGFS_ATTRIBUTE(POLICY##_fops, POLICY##_get, POLICY##_set, FORMAT)
 
+static bool sched_if_idle_is_write_only(struct xe_gt *gt)
+{
+	/* our current baseline is 70.29.2, so this is always true */
+	xe_gt_assert(gt, GUC_FIRMWARE_VER(&gt->uc.guc) >= MAKE_GUC_VER(70, 12, 0));
+	return true;
+}
+
 DEFINE_SRIOV_GT_POLICY_DEBUGFS_ATTRIBUTE(reset_engine, bool, "%llu\n");
-DEFINE_SRIOV_GT_POLICY_DEBUGFS_ATTRIBUTE(sched_if_idle, bool, "%llu\n");
+DEFINE_SRIOV_GT_POLICY_DEBUGFS_ATTRIBUTE(sched_if_idle, bool, "%llu\n", write_only);
 DEFINE_SRIOV_GT_POLICY_DEBUGFS_ATTRIBUTE(sample_period, u32, "%llu\n");
 
 static void pf_add_policy_attrs(struct xe_gt *gt, struct dentry *parent)
@@ -152,7 +163,7 @@ static void pf_add_policy_attrs(struct xe_gt *gt, struct dentry *parent)
 	xe_gt_assert(gt, PFID == extract_vfid(parent));
 
 	debugfs_create_file_unsafe("reset_engine", 0644, parent, parent, &reset_engine_fops);
-	debugfs_create_file_unsafe("sched_if_idle", 0644, parent, parent, &sched_if_idle_fops);
+	debugfs_create_file_unsafe("sched_if_idle", 0200, parent, parent, &sched_if_idle_fops);
 	debugfs_create_file_unsafe("sample_period_ms", 0644, parent, parent, &sample_period_fops);
 }
 
-- 
2.47.1

